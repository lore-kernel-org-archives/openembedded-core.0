Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3D9C3DA61
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 11:14:30 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.12812.1721301260249608599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 04:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HjTh9b2F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4267300145eso1759665e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 04:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721301258; x=1721906058; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7wQzEQFFekpRqSRLH5DB/3Qnu4oYXqogYTnJG6MrG/w=;
        b=HjTh9b2FFOD9qHyBKWbB72uxXqaNOrr91cNiRLjDLRwFbcEEwE1l9Ur8cex2QAPwJL
         CqJBmoq5JOCBijHO0IzOdjTAOcw6+AZWSY2djduCpjsGcdsXNIkrvDHmvhTIuMJyW4uv
         rQJz8AD1a/QvzvpZzQuCzVa9It/d6HSS3SrUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721301258; x=1721906058;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7wQzEQFFekpRqSRLH5DB/3Qnu4oYXqogYTnJG6MrG/w=;
        b=kqK5m8bRkkcRKYX5Ho1lj8yT4RIqCruWd+vMpG4E2PoRl7TsZboA6oMYlJLoXJxwPK
         Pw2uVZZtAH7yydLPENDqfPES0j4dwaqFSXH1EhDEX+mz5kBQT+Y2+0BBTV/MB7MY+zBV
         ysyY5r4jhTmeicTXHWxG33AaA489TojKGUlehZ95NE0EwyY8C83mO6dIfuP9fZcriVxy
         MGv4G9rVaIEdtrSWNmqvM2PCux/LPr69tctuQYlbFueWRYEXdcGa+7ftjJULUC06MJhl
         jFQ18rOxJr5O8Y5HvFn434cd6pgy5gMUxfnJXoxab780nXzKx5BgVjwKNLtqcUCWnPh8
         0LOg==
X-Forwarded-Encrypted: i=1; AJvYcCXJMnzQXQ1//0dW1OzmyRMGDR8tsrReiE2rxVDTQmu3fKtq7Uu6Zoe/8tm7A9aUBjJnVdy4GwY8OALSPb61ED9JAGKeFCKPNxP2Kl/UQ/MjWUP7p2aiHrzo
X-Gm-Message-State: AOJu0Yzo4oMxDYRk7EI2Gz1fQjY4S2jXGTnESDV68u6QP4yDo6QJ5XJ5
	rCmt5TrEu7xg69Z7uEXLr06o3a4XKDl5QyyiRMdWJzcfezZ5l67EWaFIFfGTGr0=
X-Google-Smtp-Source: AGHT+IHZcwicKZxzIr/tRicTGNUqFOBsgV3l3KpZ/1RBk3Q5tyYI3UkiK1cupmn7BNSkvh0cpYnHag==
X-Received: by 2002:a05:600c:4ec9:b0:426:62c5:4731 with SMTP id 5b1f17b1804b1-427c2d01cafmr40966025e9.29.1721301257304;
        Thu, 18 Jul 2024 04:14:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:490f:365a:34f5:8141? ([2001:8b0:aba:5f3c:490f:365a:34f5:8141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2b136b6sm6942735e9.1.2024.07.18.04.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 04:14:16 -0700 (PDT)
Message-ID: <9a75ca954c91f88e8ecbf31beea0ce98a6e8cb69.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/reproducibile: rename of
 reproducible directories
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com, 
	shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com, 
	deepthi.hemraj@windriver.com, harish.sadineni@windriver.com
Date: Thu, 18 Jul 2024 12:14:15 +0100
In-Reply-To: <20240718100440.1555319-1-sundeep.kokkonda@windriver.com>
References: <20240718100440.1555319-1-sundeep.kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 11:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202205

On Thu, 2024-07-18 at 03:04 -0700, Sundeep KOKKONDA via lists.openembedded.=
org wrote:
> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>=20
> We do see a few reproducible issues are depending on the path length of t=
he build directory.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15554
>=20
> The current implementation of reproducible tests having different names f=
or directories but with same length.
> The build directory names are changed to have difefrent lenth.
>=20
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---
> =C2=A0meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++---
> =C2=A01 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa=
/selftest/cases/reproducible.py
> index 7c6cf3eb1f..6932b0c2a5 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -276,9 +276,13 @@ class ReproducibleTests(OESelftestTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROT=
H | stat.S_IXOTH)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.logger.info('Non-reproducible packages will be copied to %s', save_dir=
)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vars_A =3D self.do_test_build=
('reproducibleA', self.build_from_sstate)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # The below bug shows that a =
few reproducible issues are depends on build dir path length.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D15554
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # So, the reproducibleA & rep=
roducibleB directories are changed to reproducible & reproducible-extended =
to have different size.
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vars_B =3D self.do_test_build=
('reproducibleB', False)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vars_A =3D self.do_test_build=
('reproducible', self.build_from_sstate)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vars_B =3D self.do_test_build=
('reproducible-extended', False)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # NOTE: The temp directo=
ries from the reproducible build are purposely
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # kept after the build s=
o it can be diffed for debugging.
> @@ -333,7 +337,7 @@ class ReproducibleTests(OESelftestTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # Copy jquery to improve the diffoscope output usa=
bility
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 self.copy_file(os.path.join(jquery_sysroot, 'usr/s=
hare/javascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jqu=
ery.js'))
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 run_diffoscope('reproducibleA', 'reproducibleB', package=
_html_dir, max_report_size=3Dself.max_report_size,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 run_diffoscope('reproducible', 'reproducible-extended', =
package_html_dir, max_report_size=3Dself.max_report_size,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 na=
tive_sysroot=3Ddiffoscope_sysroot, ignore_status=3DTrue, cwd=3Dpackage_dir)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if fails:

Thanks Sundeep. Lets keep the A/B in there since people are familiar
with it as Yoann mentions but thanks for sending, otherwise looks good.
Can you quickly send a v2 please?

Cheers,

Richard


