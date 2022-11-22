Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3343C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 23:13:10 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.6799.1669158788921351578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 15:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c6g4mGMd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id i64-20020a1c3b43000000b003d016c21100so197769wma.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hn7PKsayG4vQ2jLbVxIMgvi6l+FbEAXPOa5S14OL+8E=;
        b=c6g4mGMdHDyuR07sfmJU6Hm5jKQfP53rFDytAmCC8xsk1XlOjY/c3SCX7owcj0AsRt
         QwsjRQrMgzd7Cdi68UtFC3ZEz2t9sRzQHbBZCVvdlwbVUR7PI2RYGxbw4X9kELPE127d
         MaOlnh1ODr0WuWoycUjPcpklFIilOt0M2Z7dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hn7PKsayG4vQ2jLbVxIMgvi6l+FbEAXPOa5S14OL+8E=;
        b=cpdM/uVtuS80j1bIhtzntbZo2OsZZcOd6s9wtI5W3AJ/bgZZrGmfU+NeRiReK8Qt2i
         uyJ0TbprxFIQ3h9lWhcNraxbkXPR1NeQRIUrewFFNBPOme0Uh1dMm+M/OqKWKgkjsTAL
         61ch/dSpr+uae2XgWQinsv4cakIguEho0WdXEJODQMq9ZfR/tabbyJNZfL4O1ioRvwqE
         XaWN6nX8KlQR84DR4Gg0VvPpdmRA/zyhtKc3l0HbiUFtsnElkXRB7uOJNiajT9wELHyM
         7CXtbb9c0v+l1uc/NejiBv4WlMewY0fnvtM0O6mpi/W0zfHLO7s479b24Hnz3Kd/mfuN
         bCvw==
X-Gm-Message-State: ANoB5pllveVOCSwXQdwhhCXhN96wsxYJp+1M4B0LffC90wEZqgb1oSnk
	bf/RZGJ1eYf3hf4iu+/mEMLRzg==
X-Google-Smtp-Source: AA0mqf4atwjkJET94lgKFoGayzEHf2KZyb0PrMljWn0lKqO7K0T1iBQ39RKCvsXmajWUY8b+BmNIyw==
X-Received: by 2002:a05:600c:3b1e:b0:3c6:c182:b125 with SMTP id m30-20020a05600c3b1e00b003c6c182b125mr11510497wms.145.1669158787293;
        Tue, 22 Nov 2022 15:13:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:978b:ac21:2786:e95b? ([2001:8b0:aba:5f3c:978b:ac21:2786:e95b])
        by smtp.gmail.com with ESMTPSA id z3-20020a5d4c83000000b00241e4bff85asm2392601wrs.100.2022.11.22.15.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 15:13:06 -0800 (PST)
Message-ID: <e65754794876f025f4faa607cbf4095066243195.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH v2] libtiff: Fix CVE-2022-3970
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Zheng Qiu
	 <zheng.qiu@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2022 23:13:05 +0000
In-Reply-To: <5eb7291a-2152-b5ba-1217-900d10ebe070@windriver.com>
References: <20221122154901.2290930-1-zheng.qiu@windriver.com>
	 <5eb7291a-2152-b5ba-1217-900d10ebe070@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 23:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173705

On Tue, 2022-11-22 at 17:43 -0500, Randy MacLeod wrote:
> On 2022-11-22 10:49, Zheng Qiu wrote:
> =C2=A0
>=20
> > This patch contains a fix for CVE-2022-3970
> >=20
> > Reference:
> > https://nvd.nist.gov/vuln/detail/CVE-2022-3970
> > https://security-tracker.debian.org/tracker/CVE-2022-3970
> >=20
> > Patch generated from :
> > https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570=
050e62617e3be
> >=20
> > Upstream-Status: Accepted
> >=20
> > Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
> > ---
> > =C2=A0.../libtiff/files/CVE-2022-3970.patch         | 38 ++++++++++++++=
+++++
> > =C2=A0meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
> > =C2=A02 files changed, 39 insertions(+)
> > =C2=A0create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022=
-3970.patch
> >=20
> > diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch =
b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
> > new file mode 100644
> > index 0000000000..e8f143933a
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
> > @@ -0,0 +1,38 @@
> > +From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00 2001
> > +From: Even Rouault <even.rouault@spatialys.com>
> > +Date: Tue, 8 Nov 2022 15:16:58 +0100
> > +Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflo=
w on
> > + strips/tiles > 2 GB
> The Upstream-Status should be here in the headre of the patch.
> v3, please or update the patch if this gets merged.
> "While adding this tracking information to the patch headers is currently=
 optional, it is highly recommended and some maintainers may require it. It=
 is optional at this time so that it can be evaluated as to its usefulness =
over time. Existing patches will be updated with the tag as they are modifi=
ed."
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_H=
eader_Recommendations:_Upstream-Status

For OE-Core, Upstream-Status isn't optional, we have 100% coverage of
patches with such headers.

Cheers,

Richard

