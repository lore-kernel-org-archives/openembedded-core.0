Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E660C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 22:21:31 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.144659.1680733282320442667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 15:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IWeJ7TKF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id j24so37703808wrd.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 15:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680733281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W+0GPrIpdISv4I0cPRnr2XEwWaPcox9geI8J0yQP2Yg=;
        b=IWeJ7TKFYeJkKC9EHPQVGTSSlcMsVaBRxQstilW5vrbOJOCXhMP+zIet6lbcFr0flf
         W3Pyv3+nqz0haQQmZcjXikOQLvuEqzSPt4zs9pWP/cB0bRE262UoYVQPgm8gus56ED2E
         31v13o7n1lAhyHR/oOAif6PqjOpV1a5vWKBY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680733281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+0GPrIpdISv4I0cPRnr2XEwWaPcox9geI8J0yQP2Yg=;
        b=4/zyCZS1J9B22FIRkSrT0rg8mR7KsR+MZe2GLNUdr60hRj2CcUYXDj4wCkuugTTWqd
         W0xemixX67HFKlEPulbCTouv4Vd0M4REAaShGIQTtGKNZMdCVlD5MwFQ4RgQAzKwlm+5
         WWlaTWpcwUfgom71yybhOy3OsURH+Yy1fvcbQa/M2O4mX+V9YE37Q+rCydEBNZtWwHcF
         B+YAHda5YzRj3/a8AVyRw9NyzCCUIyyx6Uw06RRgx6DMEXiahNw2U3JeDZf0XouQUHYh
         Jy1vijOMgoTR6EorsOtSZR0dWfgxBD44OvktkjZFTRHSwGk9pPHu7+nrBEqxe+UYcCDv
         FpwQ==
X-Gm-Message-State: AAQBX9cdwoHkJQN683oPYQOxTWoj6ouphtCvGblhH4bi0QIPnKk9rCex
	DA7spi/plfNFFg6bc6oGRcgf+Q==
X-Google-Smtp-Source: AKy350a5HUeqhiPuw7t7UrK4kY0wC5t7SWuAt83MlsOdcYuHcaVo4fu47lZ8/4YRxZRR3XJREdER9Q==
X-Received: by 2002:a05:6000:1206:b0:2ce:aa69:c9a7 with SMTP id e6-20020a056000120600b002ceaa69c9a7mr4856940wrx.8.1680733280706;
        Wed, 05 Apr 2023 15:21:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6a84:552d:cd38:8d5? ([2001:8b0:aba:5f3c:6a84:552d:cd38:8d5])
        by smtp.gmail.com with ESMTPSA id r8-20020a5d4e48000000b002c70e60abd4sm16243529wrt.2.2023.04.05.15.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 15:21:20 -0700 (PDT)
Message-ID: <9c415d497a74f52df7fd2b7adb700151808f8ef6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perl-version: make PERL* assignments
 non-immediate
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 05 Apr 2023 23:21:19 +0100
In-Reply-To: <ZC1kjBgtNwGDVami@heinlein.vulture-banana.ts.net>
References: <20230405003850.384813-1-patrick@stwcx.xyz>
	 <1086f8d17f0b736421d1632ced95933622ce4553.camel@linuxfoundation.org>
	 <ZC1kjBgtNwGDVami@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 22:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179753

On Wed, 2023-04-05 at 07:07 -0500, Patrick Williams wrote:
> On Wed, Apr 05, 2023 at 09:24:24AM +0100, Richard Purdie wrote:
> > On Tue, 2023-04-04 at 19:38 -0500, Patrick Williams wrote:
> > > =20
> > > -PERLVERSION :=3D "${@get_perl_version(d)}"
> > > +PERLVERSION =3D "${@get_perl_version(d)}"
> > >  PERLVERSION[vardepvalue] =3D ""
> > > =20
> > > =20
> > > @@ -49,7 +49,7 @@ def get_perl_arch(d):
> > >              return m.group(1)
> > >      return None
> > > =20
> > > -PERLARCH :=3D "${@get_perl_arch(d)}"
> > > +PERLARCH =3D "${@get_perl_arch(d)}"
> > >  PERLARCH[vardepvalue] =3D ""
> > > =20
> >=20
> > Most code seems to use ${@get_perl_version(d)} and ${@get_perl_arch(d)}
> > directly so perhaps we should just remove the above instead and use
> > these in meta-security too?
>=20
> I submitted the change to meta-security[1] and changed the one in
> openbmc/meta-phosphor[2] as well.
>=20
> Do you want me to go ahead and delete these variables?  Is there any
> documentation / change-log that I should update as well?
>=20
> 1. https://lore.kernel.org/yocto/20230405113726.469558-1-patrick@stwcx.xy=
z/T/#u
> 2. https://gerrit.openbmc.org/c/openbmc/openbmc/+/62164

Since nothing key seems to be using them any more we should just be
able to remove them.=C2=A0

We should probably make a note in the migration guide for the next
release and check the variables aren't mentioned in the manuals but at
a quick look I don't think they are. The migration guide is still being
worked on for the current release so queuing the change might confuse
things more than it helps right now :/.

Cheers,

Richard

