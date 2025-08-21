Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EBBCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:38:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.3158.1755758306884719361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jP44OLAp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C52344E40B5C;
	Thu, 21 Aug 2025 06:38:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98A7560303;
	Thu, 21 Aug 2025 06:38:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3B7B1C22862A;
	Thu, 21 Aug 2025 08:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755758303; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kv2gFA4mJF+eI8BduyfE8Pp/gz3sRsLql0TcAVajraA=;
	b=jP44OLApv/+eq6rOpezGpr7gvD27hi8BGjpL15Ox4ImpT+2M9NCfR6GVqQyRjxD+HLg+A0
	GlpC9b2hoeqiyRHiEcO4gGgamtFW+O6VATLOid6bCalli1cul5ayoHqH1NAgNX5+TQIgA2
	WmivdlXthIiZQRkMgehMUrgk/05ouc5HyE/nQVxugZiulvyA5hlqnmvtIKXJR024gK/xO9
	W2dayjbtrUZWQ7xElQWG8A4N9+Y0SK05cHDswNbg8tsMMoDm3yyEiAQ1rthq6HopWhQMrL
	J12MX++hQadLRwv4orbrsgK14lZR02K+wvhxjw2qrcocWBPR6qvVN07kQkK2UA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Aug 2025 08:38:20 +0200
Message-Id: <DC7WDGGBK31E.2TP4Q7QNVM9A1@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.kjellerstedt@axis.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv5 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250820134202.1412477-1-pkj@axis.com>
In-Reply-To: <20250820134202.1412477-1-pkj@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222208

On Wed Aug 20, 2025 at 3:42 PM CEST, Peter Kjellerstedt via lists.openembed=
ded.org wrote:
> It is needed when support for both systemd and sysvinit are enabled.
>
> This also adds a patch for systemctl to allow the path to
> systemd-sysv-install to be specified in runtime. This is needed because
> the hardcoded path that is built into systemctl does not match the path
> to where it will eventually be executed.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---

Hi Peter,

Sorry, but...

WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: iptables.postinst return=
ed 1, marking as unpacked only, configuration required on target.
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: openssh-sshd.postinst re=
turned 1, marking as unpacked only, configuration required on target.
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: sysklogd.postinst return=
ed 1, marking as unpacked only, configuration required on target.
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: ostinst returned 1, mark=
ing as unpacked only, configuration required on target.
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: at.postinst returned 1, =
marking as unpacked only, configuration required on target.
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: cronie.postinst returned=
 1, marking as unpacked only, configuration required on target.
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: logrotate.postinst retur=
ned 1, marking as unpacked only, configuration required on target.
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: nfs-utils-client.postins=
t returned 1, marking as unpacked only, configuration required on target.
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: nfs-utils.postinst retur=
ned 1, marking as unpacked only, configuration required on target.
WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: run-postinsts.postinst r=
eturned 1, marking as unpacked only, configuration required on target.
ERROR: core-image-full-cmdline-1.0-r0 do_rootfs: Postinstall scriptlets of =
['iptables', 'openssh-sshd', 'sysklogd', 'ostinst returned 1, marking as un=
packed only, configuration required on target', 'at', 'cronie', 'logrotate'=
, 'nfs-utils-client', 'nfs-utils', 'run-postinsts'] have failed. If the int=
ention is to defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/2253
And lot of other builds in
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2246


Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


