Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E161CA5FA1
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:32:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1967.1790663522631844291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=u8J2e4t6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 39A9E4E410B4;
	Tue, 29 Sep 2026 06:32:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F2C77601BD;
	Tue, 29 Sep 2026 06:31:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0C75103295CC;
	Tue, 29 Sep 2026 08:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790663519; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oqBz7YOPG152B+lix/47/lFs+/nISXrO21xcJ85aDC8=;
	b=u8J2e4t661IqaJeeFwN73AFpiKHIfDI9tVYOaRLCmt2ud5JFqUVUtVp9nqM6GnqMetjmWQ
	WI6iq0EBdfXI7wZ4VxNf8cYAv0ZtoMAAZaA6G6ADQjyfGlLNSHXAMaesG2G56+tduHseLH
	LH1Wee+J2fzgWrKrjXKOwNfd/kIqbsV76AK9m6kUf2Lj+tF58szw5SBsqYf6gcVTS1fs4Z
	F7JGna2D6wmVQTJ8g45RMvVxBsW1fyZmD+4/aLl+306mQfMefnBBQKEz0v5ftDWBuUdBXd
	ipACidgEMhAqtCY3q5tQL7FyG/6tJn1Kv3TFxxHdHBobcr0Tmu+gG8hT01G0YA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 08:31:57 +0200
Message-Id: <DLRL8NE66LKR.1A2L9RIPB0U0U@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] systemd: Upgrade 261.3 -> 262
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260928113956.42485-1-jaipaul.cheernam@est.tech>
 <20260928113956.42485-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260928113956.42485-2-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246842

On Mon Sep 28, 2026 at 1:39 PM CEST, Jaipaul Cheernam wrote:
> NEWS: https://github.com/systemd/systemd/blob/v262-stable/NEWS#L3-L877
>
> - Refresh patches for 262
> - Cleanup deprecated meson build options [1]
> - rules: install 60-persistent-media-controller.rules [2]
>
> [1] https://github.com/systemd/systemd/blob/v262-stable/NEWS#L41
> [2] https://github.com/systemd/systemd/commit/d153b49473
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade. It looks like another patch needs refresh:

ERROR: systemd-1_262-r0 do_patch: Applying patch '/srv/pokybuild/yocto-work=
er/qemuarm64-alt/build/layers/openembedded-core/meta/recipes-core/systemd/s=
ystemd/0001-include-fix-limits.h-override.patch' on target directory '/srv/=
pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/cortexa57-poky-li=
nux/systemd/262/sources/systemd-262'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemuarm64-alt/build/b=
uild/tmp/work/cortexa57-poky-linux/systemd/262/recipe-sysroot-native/etc/qu=
iltrc push', 1, 'stdout: Applying patch 0001-include-fix-limits.h-override.=
patch
patching file src/include/musl/limits.h
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file src/include/musl/limits.h
Patch 0001-include-fix-limits.h-override.patch can be reverse-applied

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/4686

Can you have a look at that?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


