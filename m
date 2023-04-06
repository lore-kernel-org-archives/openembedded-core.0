Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186D7C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 08:36:44 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.153691.1680770196543820894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 01:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KNbKrlYf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id m8so11278332wmq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680770195;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s2CRcmQrjudP/BHf464Z3tzSJVjjn3+pQgRKKqvPM+o=;
        b=KNbKrlYfZQ6v6w/LTg/GWVpEx8zq0mfXcrQnvxu6uFnROfXxueOQhy30DnrrdGpvgn
         Er4UTJxPgOFXiew6prBCi0uF9+hqYtF6sDOovsZWXbu4ffn7lYtMohVcZ1cAUbUzo6zM
         bYJenYeRHU5IQLuMWFZ+rTV1Zz1gK9/ckKc1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680770195;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2CRcmQrjudP/BHf464Z3tzSJVjjn3+pQgRKKqvPM+o=;
        b=7Nnc+2mrAVQDO/TqmtJ9clKEY62j08nH4xRQ792/MpVtOR4ptrej1S+nqo5Eia+vFs
         7iasdOwBeinmKC8S0GqIQT4Vrrljd0LikdqAdTfRgiroEnZxxdu+ImMrFHxuW3aQQQWg
         9db8p7oCGjzDDMs2TFnPPY3TgqSN+pIVKzcuhPWuu3BuOkT/aDPB/hyvWcg8hUj2aKi+
         edV1DWzslqhohvav+857y6RtSmpHrWSvg7JRTnf0j3luoCx7NCNRGwESARhAai+tXLcr
         3d2KL6yaFUxq8on/sfaFJ5w+iigqOc3BFlZiQP1Bhj8WVwVirrVF2YioCjtwM0H9D/9o
         YaSA==
X-Gm-Message-State: AAQBX9ehI/xUVju8i+wi79Pa3CoAnwRx4LLunWkeH9v4o43zBFMYdkgR
	nUAsSiyyQqn+3r2SkzfzvfPjrQ==
X-Google-Smtp-Source: AKy350bkQr2itKONXgfZ95jCgDyjSxtRn37CsdgrF3EAovK+m5pOdY3qRvibEMno64Uu8nu2Bb+mqQ==
X-Received: by 2002:a1c:ed16:0:b0:3ee:96f0:ea31 with SMTP id l22-20020a1ced16000000b003ee96f0ea31mr6731523wmh.18.1680770194973;
        Thu, 06 Apr 2023 01:36:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6a84:552d:cd38:8d5? ([2001:8b0:aba:5f3c:6a84:552d:cd38:8d5])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c0b5700b003ee44b2effasm934669wmr.12.2023.04.06.01.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:36:34 -0700 (PDT)
Message-ID: <810a3c1fcf90c6a3a7af827d10079536a1420d55.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: Exclude some issues
 not present in linux-yocto
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Cc: Geoffrey GIRY <geoffrey.giry@smile.fr>
Date: Thu, 06 Apr 2023 09:36:33 +0100
In-Reply-To: <b481324c-62ee-8d82-3147-1c677020ae00@smile.fr>
References: <20230404164400.403462-1-richard.purdie@linuxfoundation.org>
	 <9cb0aae1-c1be-ab0d-2263-1ab2f928c885@smile.fr>
	 <eaa125c5ba2c1a13837c65df4a961abab5f5373b.camel@linuxfoundation.org>
	 <9eab4d61-3939-0703-1d81-e998f8957e99@smile.fr>
	 <432346f305541dc9e25b0e7fe34de1fd12aab978.camel@linuxfoundation.org>
	 <b481324c-62ee-8d82-3147-1c677020ae00@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 08:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179759

On Thu, 2023-04-06 at 10:23 +0200, Yoann Congal wrote:
> > >=20
> > > Should I write a patch including the missing CVEs from Geoffrey's pat=
ch or that will clash with your work-in-progress?
> >=20
> > I haven't done anything yet with these so I'd happily take a patch!
>=20
> I'll send a patch later today for CVE-2023-0179, CVE-2023-1079 and CVE-20=
23-1513 (currently in internal review).
>=20
> For CVE-2022-38457=C2=A0and CVE-2022-40133=20

This one appears to be fixed for 6.1 only with this change:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?i=
d=3Da309c7194e8a2f8bd4539b9449917913f6c2cd50

coming into 6.1 stable here:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dlinux-6.1.y&id=3D7ac9578e45b20e3f3c0c8eb71f5417a499a7226a


The fix seems to cover both CVEs.

> I can't track the commit properly.
> Yes, linuxkernelcves.com gives commits for these CVEs but is this safe en=
ough to ignore?=20
> Until now, we have only ignored CVE from commits present in the NVD datab=
ase.

I think if we have good reason to believe these commits address the
CVE, we can document that. There does seem to be a strong connection
here but I've not gone into the details.

> CVE-2023-23005 is disputed (as you noted), I'll look into it but at a
> quick glance, the dispute has good arguments and we might ignore this
> one safely.

Agreed. If there are strong arguments from the maintainers, this does
give us a good case for ignoring it as long as we document it as such.

> We are vulnerable to CVE-2023-28866 : It was introduced in 5.17 (bce56405=
201111807cc8e4f47c6de3e10b17c1ac from Fixes: tag).
> On the 6.1 branch, this is fixed in 6.1.22 and we are at 6.1.20.

Hopefully we'll update soon then! :)

Thanks for the help with these. It does make a difference and is much
appreciated. You can see the downtick in master here:

https://autobuilder.yocto.io/pub/non-release/patchmetrics/

:)

This should then mean we'll soon get a list of "real" issues instead of
noise.

Cheers,

Richard


