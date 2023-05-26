Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C892C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 17:30:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.113.1685122246860563710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 10:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gfeS6Ruy;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30a8fa6e6fcso662352f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685122245; x=1687714245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RucUw5crILPxiQanxaxk0W9USzalt5eaX2U47oA/nF0=;
        b=gfeS6Ruy9Xmg2RCuM/suTkBx4/FrVgOcY3cBDO3U64lPzRQPVPG8TTDnMAy4rvh9cb
         PyEwo6DdXa6+Lspa0sXcIJYRx2IVM5t18DOaRYJ4gqSUJx+hOfFsRXJUTE201/FHb02h
         PDwXhu6Fh4RLamMmZjOEWFg0AdaRVTCPnRNP23RQsPn7SKBy1tj/8Q8lGPrXH7OEisgh
         FzpId0PoMoSvRDIBaqNB4OKopzodjOwY1sapTSXql254L2Ek6rJTd4fMy6lYoQZu4piw
         cWZwxAXU3PVvY4mR4o9t53b0rothm3jvRiDZ4AYgXMgfjFXFMiDO/3DFpHsWzkaofrZs
         L4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685122245; x=1687714245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RucUw5crILPxiQanxaxk0W9USzalt5eaX2U47oA/nF0=;
        b=kKNGwqth5b+uCtSwese74mUv6Bw35eSdGgeTawGL3A6i9nSMRDWau92yWJBOwL42Xj
         KW05NyHtoWqd64/c+lIXiUlZgUD5y+AW/V07GQUO3ZC2h9DI7mDpTJPG5OC8dXYttXF3
         uORC+KaxMdQRf01SmTE+F0lndpZWMX6Lqn+6c+JiIp0a8UggUEdJmvgdU7fLFmUg1ubb
         4TEA0IxnGuYeXWHIf6UhWfRIVR8QgHJHp+KMfOdA5F/j9FUaLhdjMH54c4bxj7w6voc/
         XS0BsthpBr+N1IivNJ1Mz1qPcdNtVZvbQ6/CA7C1b83TiSs/6uEhWyRZhxyRMysMLhGG
         s3NQ==
X-Gm-Message-State: AC+VfDwwbJp+UsT4g9llx9LqKnpo9RXvlClKcqXD1ozMTy0ZbTvwhw6C
	JEfUDR3WhnS6K5RZfFuxvC60OP15EpTz/8TbaVw=
X-Google-Smtp-Source: ACHHUZ4ceZV9Se4mWWYhPba6pEcEYdT7PPm6x0/HYG+gnHocbpv8khtXR2b10K2thel0p0fTlW1x/I4++Blre8NaCmY=
X-Received: by 2002:a5d:468a:0:b0:309:e24:57aa with SMTP id
 u10-20020a5d468a000000b003090e2457aamr1958199wrq.19.1685122245062; Fri, 26
 May 2023 10:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <f7d8cdc485e3d75304bd41931292f0cb76083e14.camel@linuxfoundation.org>
In-Reply-To: <f7d8cdc485e3d75304bd41931292f0cb76083e14.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 26 May 2023 19:30:34 +0200
Message-ID: <CA+chaQcE-qbPZ3yDcTRY1rPgoX5+baf73R=V0cVEb6ry3_yjzw@mail.gmail.com>
Subject: Re: [OE-core] gcc 13 merged, meta-arm, meta-intel and meta-virt issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000d1f71405fc9c18f3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 17:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181777

--000000000000d1f71405fc9c18f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 6:28=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I just wanted to let people know I merged gcc 13 since I think we'd got
> as far as we were going to without the patches landing. I dropped the
> 5.15 kernel and found ways to fix lttng-tools and glib-2.0 ptest
> issues.
>
> This leaves a few failures on the autobuilder in other layers:
>
> meta-arm 5.15 kernel bbappend:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4038/s=
teps/12/logs/stdio
>
> meta-intel intel-mediasdk do_compile:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4488/s=
teps/13/logs/stdio
>
> meta-virt xen-tools do_compile:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1691/s=
teps/12/logs/stdio


and 5.15 kernel bbappend as well (only for rpi builds)
 ./dynamic-layers/raspberrypi/recipes-kernel/linux/linux-yocto_5.15.bbappen=
d

--000000000000d1f71405fc9c18f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, May 26, 2023 at 6:28=E2=80=AFPM R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">I just wanted to =
let people know I merged gcc 13 since I think we&#39;d got<br>
as far as we were going to without the patches landing. I dropped the<br>
5.15 kernel and found ways to fix lttng-tools and glib-2.0 ptest<br>
issues.<br>
<br>
This leaves a few failures on the autobuilder in other layers:<br>
<br>
meta-arm 5.15 kernel bbappend:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/113/buil=
ds/4038/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/113/builds/4038/steps/12/log=
s/stdio</a><br>
<br>
meta-intel intel-mediasdk do_compile:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/100/buil=
ds/4488/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4488/steps/13/log=
s/stdio</a><br>
<br>
meta-virt xen-tools do_compile:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/128/buil=
ds/1691/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1691/steps/12/log=
s/stdio</a></blockquote><div><br></div><div>and 5.15 kernel bbappend as wel=
l (only for rpi builds)</div><div>=C2=A0./dynamic-layers/raspberrypi/recipe=
s-kernel/linux/linux-yocto_5.15.bbappend</div></div></div>

--000000000000d1f71405fc9c18f3--

