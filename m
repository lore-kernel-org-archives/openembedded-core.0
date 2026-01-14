Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55382D37E31
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:16:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9671.1768396599382212297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FzjDoP+n;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D89504E420CB;
	Wed, 14 Jan 2026 13:16:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A48956074A;
	Wed, 14 Jan 2026 13:16:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D566B10B68243;
	Wed, 14 Jan 2026 14:16:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768396597; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UL0cu3zmVER9tpDGyeTktb5nUmZJ/LYnHuYYYCOflNg=;
	b=FzjDoP+nf7eGT8/r5j3nI+N0+RpB2FYn1vxcDCIim820C3ewlQwgtwOMobadwN8PIXZNTy
	w59Je6Ue0iZQMwcLZX/hwCgxrBcx7U8s/vehPCi0kXdRwkUjcLmF+LqgjG/uOF7CeiUfuC
	GSA7odj8ecX1oz3os3rkyTgXVVajsrOeDPAO2bAEs3aIxBX9uulkwl7J00SsJg2ogCEUDd
	jBguviazrNi3OSXHWOaOZF2mR4A7nLoSV93+u+nCWvIblDQXc0ERT8bqfB+8J7MI6a8ee9
	OW3OZJJIuNPE1MEBkl/S8u/Or0LsA7LEbmv2bh2eP2t1mCPccO8axPPVd2A+LA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 14:16:36 +0100
Message-Id: <DFOC9XA7U7FI.N5FIE3FOCY5E@bootlin.com>
Subject: Re: [OE-core] libcap-ng upgrade depends problem
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <TY3PR01MB10110411E2A03C12CAB153BCB9B8EA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB10110411E2A03C12CAB153BCB9B8EA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 13:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229327

Hi,

On Tue Jan 13, 2026 at 8:01 AM CET, Yiding Liu (Fujitsu) via lists.openembe=
dded.org wrote:
> Hi All
>
> I tryed to upgrade libcap-ng from 0.8.5 to 0.9, but there is PKG_CHECK er=
ror during do_configure
>
> | checking for gawk... (cached) gawk
> | ../sources/libcap-ng-0.9/configure: line 14862: syntax error near unexp=
ected token `LIBBPF,libbpf,'
> | ../sources/libcap-ng-0.9/configure: line 14862: `PKG_CHECK_MODULES(LIBB=
PF,libbpf,'
> | NOTE: The following config.log files may provide further information.
> | NOTE: /mnt/contribution/build_image/tmp/work/x86_64-linux/libcap-ng-nat=
ive/0.9/build/config.log
> | ERROR: configure failed
> | WARNING: exit code 1 from a shell command.
>
> It seems like libbpf is needed as dependence.
> But libbpf is in meta-oe not in oe-core.
> Does any one has experience about this problem?

This probably means that the libbpf recipe needs to be moved from meta-oe
to openembedded-core. Can you send a series that adds this recipe first, an=
d
then updates libcap-ng?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


