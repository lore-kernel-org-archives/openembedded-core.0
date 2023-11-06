Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A17C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:08:01 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.56936.1699283280072046421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hcV3vejc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-32da9ef390fso2829293f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 07:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699283278; x=1699888078; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hCOExjC33PW/y8ry/AYFVzI1vPQpEdF4YfL8e/RXS1E=;
        b=hcV3vejcn6bNBduAAe2wGVVRP83DlRaJqNCF7hhLPAYGQx/VhlHVEonOGUt63kgejw
         9Ky4AteP2OyL3LRo7GR+Lpe3/9CsZzZeU43KF2io87brmMnaz9TzSyedB9Mlg/iX0X/q
         fs5QtqTYjLBpfT/GxwxXfhz3EhwEkC4iC8lSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283278; x=1699888078;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCOExjC33PW/y8ry/AYFVzI1vPQpEdF4YfL8e/RXS1E=;
        b=u6XZOKhOs0jaIGhHvhZ3uzK+yTMzYxdZRCYMGUPUrhM/82w0Ao+4KxiIb7e3X2r4vl
         nzJ9hc8UOigzgN5sYudm8tw8nxf9T4tKSIAWkz2V+mFetW0VmYVKakMOeDBh7d9l/zoP
         gDAj/jhXVK3xJyTsxsQlftQNV6UirP77z4MMEc7ZixMrjzas7uLIJaW3uhj5TxUS3YXs
         L3LlFCUOCZO4ylqv5wB2kBujhL3LGoQMaIwkvyA6MCg+AAVMjCpRjJuB7eslTuSR8OCw
         WRRRSvIFKsEXcc/je0G5nfVKsu2VRXbaB+VS/J1BqoHZPuo1Kl4TuL4JfdWTDDTe8r5+
         ESCQ==
X-Gm-Message-State: AOJu0YwX+NJmJvwtTK+9+Dl8gKL40UyPNvEp/nWrqtGe81OhcTZwLckv
	DCRixEmxi4boW8OJn/180FB4YrOywMCsItdn2vk=
X-Google-Smtp-Source: AGHT+IH+Ogo8+e32yvLtUA/DOOGnVrjUaVF1Nsgi0oZ8NXHUJ8PO7/flfOVYuFjT3CB+SwZd11WAlg==
X-Received: by 2002:adf:f286:0:b0:31a:d450:c513 with SMTP id k6-20020adff286000000b0031ad450c513mr24536237wro.26.1699283278474;
        Mon, 06 Nov 2023 07:07:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id d8-20020adffd88000000b0032fbe5b1e45sm8157722wrr.61.2023.11.06.07.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 07:07:58 -0800 (PST)
Message-ID: <143d65084f9acf56dd4fe3c6df868480345f12b8.camel@linuxfoundation.org>
Subject: Re: [PATCH] perf: add jevents PACKAGECONFIG item
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Bruce Ashfield
 <bruce.ashfield@gmail.com>, Max Krummenacher <max.krummenacher@toradex.com>
Date: Mon, 06 Nov 2023 15:07:57 +0000
In-Reply-To: <27439f1c-a64d-41a0-815e-882a1a9a5b4d@prevas.dk>
References: <20231106142217.3837516-1-rasmus.villemoes@prevas.dk>
	 <27439f1c-a64d-41a0-815e-882a1a9a5b4d@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190225

On Mon, 2023-11-06 at 16:00 +0100, Rasmus Villemoes wrote:
> Somewhat related, but maybe not really:
>=20
> When I set PACKAGECONFIG for perf in a perf.bbappend file, without
> python being in there, the build breaks:
>=20
> > Makefile.config:277: ***
> .../tmp/work/qemuarm64-poky-linux/perf/1.0/recipe-sysroot-native/usr/bin/=
python3-native/python3-config
> not found.  Stop.
> > make[1]: *** [Makefile.perf:242: sub-make] Error 2
>=20
> If I instead set the same PACKAGECONFIG value, but by doing
>=20
> PACKAGECONFIG:pn-perf =3D "tui libunwind libtraceevent"
>=20
> in some global configuration file, it works as expected.
>=20
> =3D=3D=3D=3D
>=20
> I think the difference is due to the
>=20
> inherit ${@bb.utils.contains('PACKAGECONFIG', 'python',
> 'python3targetconfig', '', d)}
>=20
> line in the perf recipe. At the time where this line is evaluated, if
> PACKAGECONFIG is set via a .bbappend, this ends up evaluated using the
> ??=3D value which does include python, and hence we end up inheriting
> python3targetconfig, which in turn inherits python3native, which does
>=20
> export PYTHON
>=20
> And since PYTHON is now exported, perf's logic ends up in this fragment
> in tools/perf/Makefile.config:
>=20
> # If PYTHON is defined but PYTHON_CONFIG isn't, then take
> $(PYTHON)-config as if it was the user
> # supplied value for PYTHON_CONFIG. Because it's "user supplied", error
> out if it doesn't exist.
> ifdef PYTHON
>   ifndef PYTHON_CONFIG
>     PYTHON_CONFIG_AUTO :=3D $(call get-executable,$(PYTHON)-config)
>     PYTHON_CONFIG :=3D $(if $(PYTHON_CONFIG_AUTO),$(PYTHON_CONFIG_AUTO),\
>                           $(call $(error $(PYTHON)-config not found)))
>   endif
> endif
>=20
> which breaks because the value of PACKAGECONFIG that ended up
> determining buildtime dependencies did not pull in that python3-config.
>=20
> =3D=3D=3D=3D
>=20
> This difference is, to put it mildly, quite confusing and surprising
> (and took quite some time to track down). I don't know if there's
> anything to do about it. Is setting PACKAGECONFIG via :pn-foo overrides
> the only supported method, or is this just a quirk of the perf recipe
> that one has to live with?

That is a pretty horrible interaction of things. As you say, that
inherit is effectively an immediate expansion of the data and wouldn't
"see" changes in any bbappend.

Could you file a bug please?

I'm wondering if we should have some other form of inherit which
applies at the end of parsing which would avoid that issue. Sometimes
order is important, sometimes it is less important with the inherits.

Cheers,

Richard


