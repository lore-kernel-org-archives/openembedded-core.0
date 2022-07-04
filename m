Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86848C43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 14:31:01 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.72377.1656945051843272966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aL/2cznV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f44.google.com with SMTP id k30so3814145edk.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=P+Ykj75/ukRQfxbT4rqQXtO/DGlzSFlEJ8IuAouIlmw=;
        b=aL/2cznVL9kXB/ERsHdUz1ALVm7ox8KFTnXH0GW8kHk+Soj5y0lmZTv+3KR72GteDb
         XKYIiC3tbsBMF96Odx8cOpD7aJcsNsQEijp6PlUNSC6sA3yojnpscz/MQeW0sc2yJF8c
         pxjvCQX895ww3sx27pyidaSGsCpUd8vno0Avc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=P+Ykj75/ukRQfxbT4rqQXtO/DGlzSFlEJ8IuAouIlmw=;
        b=FjBczmM84arl2zCB6sLEm4O5OjZL2OpHdkyB4avnUv1F+5gt4K3VN5p5iM0oDMH9XQ
         ySd/0LSbygd4bekkDldmDnWjIpcLkVk55EG9afcZcqgxuiXoKF7/n1xGRcTTmey8FCbi
         6WVt+rRl5zsHGg3EgWanVvxa6Kn0ksknS+6Gfl/AmNGDmSmfd5rKA1YOtGEymd82KtS0
         laDLhALLaTzXowFRwGrUn4UZyk4ghIYB8wHrunCqsOxRPWRATNEDn4W/VfrBQUuQy4w8
         Ql/GKD7Cp8oAa+09CLP49M47b6nAhg0nUIGWCOeTrboAm0K3kaj7cA3Y9lsGd+H8XHqQ
         iHxA==
X-Gm-Message-State: AJIora/nOKnrJ8MPW6N+ESbK1MB3zYXADqUcGefOikmpTE2WaV+6VdEC
	/b2IlMBCHW+bmW1M21kha7fYV9haIrmtFQ==
X-Google-Smtp-Source: 
 AGRyM1t6u5f/nZSa9nHMjY2CqRmP2RtDI546S9q+wQCMm4ZUPcEhLCef8AO+w97/v8eGQrXIOzloYA==
X-Received: by 2002:a05:6402:909:b0:435:a8b:5232 with SMTP id
 g9-20020a056402090900b004350a8b5232mr38150694edz.240.1656945050328;
        Mon, 04 Jul 2022 07:30:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2?
 ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 bq15-20020a056402214f00b00435a742e350sm20870343edb.75.2022.07.04.07.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 07:30:49 -0700 (PDT)
Message-ID: 
 <d3756ea92c2bbcd4e32e405784b69ed1a79ed5d9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] oeqa/sysroot.py: Check bitbake return
 status
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Jul 2022 15:30:49 +0100
In-Reply-To: <8e071b38-0ec1-c5ab-a14f-776ec826d5d4@gmail.com>
References: <20220703114114.2313369-1-ptsneves@gmail.com>
	 <20220703114114.2313369-2-ptsneves@gmail.com>
	 <69be22a57b1786c0e8a86a64fea2717a2fc73868.camel@linuxfoundation.org>
	 <8e071b38-0ec1-c5ab-a14f-776ec826d5d4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 14:31:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167618

On Mon, 2022-07-04 at 16:28 +0200, Paulo Neves wrote:
> On 7/4/22 16:16, Richard Purdie wrote:
> > On Sun, 2022-07-03 at 13:41 +0200, Paulo Neves wrote:
> > > bitbake ran but we incorrectly did not assert the exit status needs t=
o
> > > be non 0. Now all sysroot tests commands expected to fail are verifie=
d
> > > to do so.
> > >=20
> > > Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> > > ---
> > >   meta/lib/oeqa/selftest/cases/sysroot.py | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/=
selftest/cases/sysroot.py
> > > index 588fc8c713..294ba4a4a0 100644
> > > --- a/meta/lib/oeqa/selftest/cases/sysroot.py
> > > +++ b/meta/lib/oeqa/selftest/cases/sysroot.py
> > > @@ -45,6 +45,7 @@ TESTSTRING:pn-sysroot-test-arch2 =3D "%s"
> > >           expected =3D "maximum shebang size exceeded, the maximum si=
ze is 128. [shebang-size]"
> > >           res =3D bitbake("sysroot-shebang-test-native -c populate_sy=
sroot", ignore_status=3DTrue)
> > >           self.assertTrue(expected in res.output, msg=3Dres.output)
> > > +        self.assertTrue(res.status !=3D 0)
> > >  =20
> > >       def test_sysroot_la(self):
> > >           """
> > I did have a question on this patch. Wouldn't it be simpler to remove
> > the "ignore_status=3DTrue" from the bitbake() call?
> >=20
> > Cheers,
> >=20
> > Richard
> You are right. I guess the assert is more explicit and with the removal=
=20
> of the ignore_status it becomes implicit. Let me know if you want me to=
=20
> remove the assert and the ignore status and will submit a v2.

Please, I think that would be cleaner.

Cheers,

Richard

