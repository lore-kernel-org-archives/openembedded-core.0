Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10749.1795755926073530701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 21:05:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WP45V0Ab;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-921318b2eb8so94840066d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 21:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795755925; x=1796360725; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=suDRdiz6TFNukgrIspqkddsGxypgjoiGTHsh8/F9yjI=;
        b=WP45V0AbuY5zXdH25rW+Z4jrHrQOBeFLePMKf1exZi5RZUseFjPaDETVJLYBfkP/Db
         EEbGzbLdyDWPAqWV0XqJyNt+/40cc8D8yS9jnCstWjtANLUnojirp1QOYr7+VtgZyw5x
         OUCY2Lj3Mr5A1CRCZxq/O1RGfWEJu4NZsbCOcHQN35vzr1U9zmRR7s8j75f3d+vfS0xG
         NZy+FcFO2do1zmECyG8Qn9NEo+gu4Ohue13rK2sMUESstMWx/Mo5iDLHfGFa/afOxeoF
         zeoJ5UMqKYIfq8FwGSTqJqkGJNxdKnZjjPRIGdKhLXo8ReBZhWN2aoOT5oF8/kdd5qd4
         qy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795755925; x=1796360725;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=suDRdiz6TFNukgrIspqkddsGxypgjoiGTHsh8/F9yjI=;
        b=E1rho0NLbtw69X1U33PEScTU/o6CU8wwkpzANjWcvDxgJ9fTqsHxQy/pclNZaMLSx2
         gLiSlhfRLnSraHw6jGMQJay3ED/dKG9j9OEDT0Mvw7Jnz/OclCTkDhoozbhYWshTz3dZ
         Z/KSCRREfNX4c9f+Nd+vWprjiFGDeUOyoicWDOkuQ6/SzoQjBMJCmgImS5B09DFowBVN
         I7YVneAFsOCtxQ9Islrnx6RWPNMIrDq13EJSrNMpFNHEpoJHvBxlmLh7ZFN4lM75fzLl
         cT9kDUHYSydcG50KRADKYv7cuaNSOIDZ0mqe3YdVIflkrnWlPfqQ1HK8TQyuerp0LrxM
         RbXw==
X-Gm-Message-State: APuU4Z889X7akzzPHCRsaPQl++7DfytUR7yurCLgoPR/HmV3+3limavj
	Td6b0SkfMjk24xIAvCB5hYr9L/fNZAbEfKDRDh6c+rvjSxSCDnTGyL5x
X-Gm-Gg: AZFdTZfNjqGSiLfsCyhLzF/nBqXISyGIN9ObrMrlrniG9Iho2oq0UUKXi9yvcmQ214x
	LeKN+HU0tvoMm2kAHDGB5Tw437ilXdBtMh3bmuTfLWIojNxPUPZnFxN/pMV1MTlsE1Gv9s62gFA
	oOlEfKCBd2f9404OB6i+bRpxsnR0yXv0k4iLYnuQDX5PFUt1Gq5V5ejhOkticJnm8vCRyVZDlBI
	1nsOkWWu01Meq8rr8CSRKN1Nkn8pPzJIAQZfWuD3dFUb4hju9UsmYvy0swca/dFIhjhjE2ATf/I
	pTB2HYlKfJ8l2xTQC8zUYi+KV91oEELKqNq0G0niyuZOK0xM8OYkW0eGv/6ArnZbgyJvq/34pMU
	22svg2gzVkeU2MTwBbMvCYPT8sVkjLmmZbr5FEMN3h7JpqYEGjsEuTMtEJuKFAuR2GXvJ41ddeD
	7Go0MS/SY3sv1apL+8OYz/eYZ/yHmcRqmFafu6lmjR8plA+TSuDFNCq7G+Q4BocfDJVJCF9utac
	FK0GsBmPrDTl/rxQf9kDPA55qnW5vkbsWWOa0IIlgio0tud7g/A8HclWbFdGg8aHc3nF1DTQUkz
	5qkfgPH/5weO/+EGEHjnVJutDrtZ72bFlF9aW9xVsNxfgbJMxvomXQyLcBV3uO1Ze010Tw36YEU
	DbygiAgEDvjxDGaZnm65eKYId+YoHmzE5anm1sSMICiZloPX5Lw==
X-Received: by 2002:a05:6214:20a4:b0:921:2b26:a848 with SMTP id 6a1803df08f44-92134a3a0a4mr489006656d6.17.1795755924788;
        Thu, 26 Nov 2026 21:05:24 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f6959sm206403056d6.31.2026.11.26.21.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:05:24 -0800 (PST)
Message-ID: <6b090f94.7d406e04.569ca.c735@mx.google.com>
Date: Thu, 26 Nov 2026 21:05:24 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "mark.yang" <mark.yang@lge.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-module-split: fix re-signing of modules
 built in a subdirectory
In-Reply-To: <20261125005619.45574-1-mark.yang@lge.com>
References: <20261125005619.45574-1-mark.yang@lge.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 05:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251340

On Tue, Nov 25, 2026 at 9:56 AM mark.yang via openembedded-core
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> Use MODULES_MODULE_SYMVERS_LOCATION, which module.bbclass already uses
> to find Module.symvers in the same directory. modules_sign then signs
> the modules:

Thanks for the detailed commit message, the reproducer and logs made
this easy to follow.

Using MODULES_MODULE_SYMVERS_LOCATION makes sense to me, it's the
parameterisation that RP mentioned when get_ext_mod was dropped, and
module.bbclass already looks for Module.symvers in that same spot.

> -            ${@'M=3D%s' % '${S}' if not "virtual/kernel" in d.getVar('PROV=
IDES') else ''} \
> +            ${@'M=3D${B}/%s' % (d.getVar('MODULES_MODULE_SYMVERS_LOCATION'=
) or '') if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \

The expression is more complicated than it needs to be, though.  (At
least in my reading of it). It nests the conditional, a % format and
a getVar with an or '' guard.

I assume the getVar/or '' is there because kernel.bbclass never sets
MODULES_MODULE_SYMVERS_LOCATION, and an unset ${VAR} inside ${@...}
stops bitbake from running the python at all. If you give it a default
in kernel-module-split.bbclass:

  MODULES_MODULE_SYMVERS_LOCATION ?=3D ""

then it is always set (module.bbclass inherits kernel-module-split,
so its ?=3D "" becomes redundant), and the call site can just expand
it, the same way it does ${S} today:

  ${@'M=3D${B}/${MODULES_MODULE_SYMVERS_LOCATION}' if not "virtual/kernel" in=
 d.getVar('PROVIDES') else ''} \

Can you also mention the ${S} -> ${B} change in the commit message ?
For most module recipes B =3D=3D S so nothing changes, but where they
differ (externalsrc without EXTERNALSRC_BUILD, etc) we now point at
${B}, which is where Kbuild ran and modules.order lives. That's the
right place, but it is a behaviour change and should be called out.

With those in a v2, I'm happy to ack it.

Bruce
