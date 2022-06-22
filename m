Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D416FCCA47D
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 13:30:02 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.7458.1655904599781889080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 06:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FFc/K97Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id j24so2719065wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=UNVvLTJUrfaQPmzW3Xl6FWqKmKkCvb4mqgYwdB4ppkY=;
        b=FFc/K97Z+KF36Oa3BEoyshZXTkruY6uthiasctZWOi1QTDsNYJdFIO/ABh3OWnxKHr
         n3Tx/lCpva36ZmeAWA7bYBm3i4WQn6Gw7UL89KLLewoyP/isTj0HHT4naeaH49ATGf59
         zTxv2i8FqPtOsn7H+VKLvtHykALPlPkx2mCtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=UNVvLTJUrfaQPmzW3Xl6FWqKmKkCvb4mqgYwdB4ppkY=;
        b=ofc1XmSj6UYk7sbVKz8OdEq/0eTniNRyZ93RTzd4bIka3heIIQlclQt49UOI/SELXb
         ddKX8zfYgJcO3gGuWRhJaJRaCjxL81uRIkHJB0WLdtk5AkyTMWGfWld8obW4lsqmHMFy
         jhbaWWcJ/mJijU4bUmzVVneWEsc0zT27PZ+myCrS0x4WDW789Ck8KB8uqdnnUStxm2kH
         QeDBmz7n2W02SI560dZpABVX5TBsM810MqPll/7DFnAXduhP1eyOEBXeyUwXQUbkGcJu
         LpaO8bVoza/fc57zYJacIBusc6sMyoWg+sF3Z7HRLZ8BEFEJ184EeFwKXam2wlBsEUDe
         9xdA==
X-Gm-Message-State: AJIora8J2yQeFBzWx8CwkHXvKTDRuMO62hh0HZ/JLX3oDw+fZAdb6kMT
	jptqSq/2Q90Q+YsrMof5mlpyRQ==
X-Google-Smtp-Source: 
 AGRyM1vD5XVWCxL86XPmddoyUGegJBuXFRC/7DUHU24YYFtk8sCJeccDioN67Gdc6O143Tx9FtpwpA==
X-Received: by 2002:adf:f7c7:0:b0:21b:9452:e8fe with SMTP id
 a7-20020adff7c7000000b0021b9452e8femr3553217wrq.640.1655904598198;
        Wed, 22 Jun 2022 06:29:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b8dc:82a2:aabd:2c47?
 ([2001:8b0:aba:5f3c:b8dc:82a2:aabd:2c47])
        by smtp.gmail.com with ESMTPSA id
 h14-20020a5d430e000000b0021b90cc66a1sm8550999wrq.2.2022.06.22.06.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 06:29:57 -0700 (PDT)
Message-ID: 
 <783ec1df1c79c897dc8d8852413c056732911c57.camel@linuxfoundation.org>
Subject: Re: [OE-core] [oecore][PATCH] bc: add missing bison-native
 dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2022 14:29:56 +0100
In-Reply-To: <699d5f83-7e9c-41b9-d39c-84fec7101e6d@t-online.de>
References: <20220618175258.4655-1-f_l_k@t-online.de>
	 <d0bd217004d6ff8fb860cd61eb23c6eab1ee39c3.camel@linuxfoundation.org>
	 <699d5f83-7e9c-41b9-d39c-84fec7101e6d@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 13:30:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167236

On Wed, 2022-06-22 at 09:50 +0200, Markus Volk wrote:
> Am 21.06.22 um 19:32 schrieb Richard Purdie:
> > On Sat, 2022-06-18 at 19:52 +0200, Markus Volk wrote:
> > > this fixes an error i encountered building for raspberrypi4 32bit:
> > >=20
> > > prefix-map=3D/home/flk/build/poky/build-raspi/tmp/work/cortexa7t2hf-n=
eon-vfpv4-poky-linux-gnueabi/bc/1.07.1-r0/recipe-sysroot-native=3D  -Wall -=
funsigned-char -c -o warranty.o ../../bc-1.07.1/bc/warranty.c
> > > > ../../bc-1.07.1/ylwrap: line 176: yacc: command not found
> > > > make[2]: *** [Makefile:429: bc.c] Error 127
> > > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > > ---
> > >   meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-ext=
ended/bc/bc_1.07.1.bb
> > > index 1bec76bb2a..67453de822 100644
> > > --- a/meta/recipes-extended/bc/bc_1.07.1.bb
> > > +++ b/meta/recipes-extended/bc/bc_1.07.1.bb
> > > @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bc=
b673463ab874e80d47fae504 \
> > >                       file://lib/number.c;endline=3D20;md5=3Dcf43068c=
c88f837731dc53240456cfaf"
> > >  =20
> > >   SECTION =3D "base"
> > > -DEPENDS =3D "flex-native"
> > > +DEPENDS =3D "flex-native bison-native"
> > >  =20
> > >   SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
> > >              file://no-gen-libmath.patch \
> >=20
> > The question is why you see that and nobody else has, including our
> > autobuilder.
> >=20
> > I'm guessing something in your build is being rebuilt, hence the need
> > for bison whereas in most other builds that isn't rebuilding and hence
> > isn't needed.
> >=20
> > Are you using a different configuration or extra patches or something?
> >=20
> > I'm worried there is a reproducibility issue somewhere in here.
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> The problem occurred after I updated the oe-core master and started an=
=20
> image rebuild. Built the=C2=A0 image successfully for intel and aarch64 b=
ut=20
> got the above error for raspberrypi4.I ran 'bitbake -c cleansstate=20
> bc-native bc' but the problem persisted and I added bison-native and was=
=20
> able to continue. I never had this problem before, and after checking=20
> again, I can say that I don't have it anymore either. My image can be=20
> created again even without bison-native dependency.
>=20
> I didn't do any patching on bc and also didn't change its configuration.

Do you have the logs from the failed build? I'm wondering if there is
some clue in there about what it wanted to rebuild that needed bison?

I'm reluctant to take this change without understanding what went
wrong...

Cheers,

Richard



