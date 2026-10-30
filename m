Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6304.1793345477357684011
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=GEPAV4yr;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso2074065e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793345475; x=1793950275; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JX+rI6nCYAJDdYzi0dGq0Jg46iTE47Ybj4CstGOdNxM=;
        b=GEPAV4yrs/vNvQdRkGhg/jfr6BrBv72zbr7OPskH2kRFPKq/FooH2TX9d/lTQH3z4R
         DGKGsG9o170j3CTPgLoy0DfdkycOstVIVaGKR8rU2d0fl3Dg1+nndymf8f+tITLv2fXH
         6yQ2iSwLGVbFHr/2fTF9QtULO7cVPpjKF3/moQLRWqFSyh0jFExYgF48Du/UlcKvojFS
         CawScpSaf4FhByMvXkSMnS7Y9qsfMoYOa0RzQvxSbVns4bLyYnnnzuuwViVNOPBhfFjd
         mDgODvKR178wEmrTZz0hzDHVZ4MC+l0nM6ph7ciLwq51RedRsf8yEFYmMcI8CPTdBWoo
         5RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345475; x=1793950275;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JX+rI6nCYAJDdYzi0dGq0Jg46iTE47Ybj4CstGOdNxM=;
        b=HYCWkWkzftaJQ/HrmSpnf+rfdy9/qGhLFgm5R1F0uIM1zYLzxmdeIPgf4cB0zhamMX
         6RDyy/8l3ZpVl1brSQwx4k8VwOKjnDw08PfOYR6ent0fHucobZg8lMkU1jEWSSBtRAx7
         oG3g6iy4ep0moHl5QMvK2CsCDa135DG0GRnOfP5SSwgb9G19pp3etSdtPE1tI7YiOBE/
         8O0ntAOrHx3dnJOwM0n2ZobnKjOHjFIHB5Hgp5vsroFfRcfbYC05/hmmeN374X7Dl21L
         sskOn6FAd8t8VgXeo1ScW7+klqqfzKpx/K5t3Gd04trj8sNt6M2OKOW/lOp7O8rFbhrf
         kYqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4/kBzCyN0UrzE3AOdOfjI4U3TUxNDTjZwjb42DpWHB0at5nqbt1/LPysKMj2IGkNR9Vdye6DbGiX33uSAzeWTyQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKh+rXyZUewTvMg8I4wbSc2KeLxehPptBJd8zWFQXam5n8ceH7H
	BncrAxn8LmSJhK9CDaQb5r6insv/KpMQu8U2r1naB/F0Ph+iP7tfTfyYOtF88KP9m5k=
X-Gm-Gg: AYBFou1t/lTUWkILJ+Ktfam73Ml12xPg35BMXUeAA7rnFQSLCrBC1w98fnkx2tXAG9m
	rqHNT3MO/ertpj/b4GqMh+O+yQd7tv6V4zxEEJ0riz7iASSBp9uqF5nYv/HX2i1qmjSBFDmnGos
	KLzsz36FrftcqZhEk22lx+haWcb6/VOVefHQbq7h8bq7kalDz+9xTVdF/nJdqRRPX1kssNZBQ8E
	6Z+AEQCREXP/ZRC2tP8PBTiTBHlv+aToKKIvfVoTXHNcMYbZ6P5RsRRdTXA6Ex3Cnk+t9tZIDRJ
	mXY6/pHTn5oz4qizWqQj+dKQL6Zb75M0f3BDZ3C5Sfb/ZgMBMrWZVBXGNnf/d35dsU/CWxKqiLF
	+XH05crRvzfbp5DmwPsNuU/Qyn/4/46GDf5QySHtyTeFpP/pwTxlLBna+DRXoOu/7Tk0bQw5Eos
	2yzDgXWl2dy7lx4a0H3ditxKtLPss9Xh+aNgdN+FayeqlmeIIen8Pl2tP3zEc/BS54R/ecOueMq
	THqxW1P8cog+US4GRoDcAi3mQmvRUm7ts0NBBap+qMgtMMwqsLdF2604fiUw6Ns04RrKdlbRUia
	TqcMTGNcGv93YXW7nKXedip3x0z12qxc7jV5H89M4BNOxtaOL6XswlCdys6K2VHBkO8dfnrBJ2V
	rnWZyHXTTQfX9zjMP
X-Received: by 2002:a05:600c:470a:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4ac16acfe61mr27401395e9.5.1793345475303;
        Fri, 30 Oct 2026 00:31:15 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm37440785e9.0.2026.10.30.00.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:31:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 08:31:14 +0100
Message-Id: <DMHZWXNNYTJF.14GBPLM5QIM8H@smile.fr>
Subject: Re: [OE-core][scarthgap][patch] python3: upgrade 3.12.15 -> 3.12.16
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261030053009.1414220-1-vanusuri@mvista.com>
In-Reply-To: <20261030053009.1414220-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249003

On Fri Oct 30, 2026 at 6:30 AM CET, Vijay Anusuri via openembedded-core wro=
te:
> Release information:
> * https://www.python.org/downloads/release/python-31216/
> * The release you're looking at is Python 3.12.16, a security bugfix rele=
ase for the legacy 3.12 series.
>
> Handles CVE-2026-115557, CVE-2026-77214, CVE-2026-102633, CVE-2024-3220,
> CVE-2026-114583 CVE 2026-12345
>
> Changelog: https://docs.python.org/release/3.12.16/whatsnew/changelog.htm=
l#python-3-12-16
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../python/{python3_3.12.15.bb =3D> python3_3.12.16.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3_3.12.15.bb =3D> python3_3.1=
2.16.bb} (99%)

Hello Vijay,

I already received this upgrade from Peter:
https://patchwork.yoctoproject.org/project/oe-core/patch/20261025211302.190=
4712-1-peter.marko@siemens.com/

Regards,
--=20
Yoann Congal
Smile ECS

