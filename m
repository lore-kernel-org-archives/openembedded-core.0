Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D11AD185DB
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 11:35:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4559.1767872137038763858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 03:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IqLycFXt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 886BA1A2701
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 11:35:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C084606B6;
	Thu,  8 Jan 2026 11:35:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 824E6103C8831;
	Thu,  8 Jan 2026 12:35:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767872135; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=92QcvLmPCVX5CdYAiWt3zi/ZKljeZI+3pEhT4c2UsDo=;
	b=IqLycFXt5ssWQkaXoKNvf39gOPhN3vQTxZIuXN1ZPKrzJEusLjdk8uQt1D6vgyqK2xqKsx
	bV8iMesxC0oe76HsLsb6tixagtUmA3AjdSH6JksPdTbvbQ/HhMEmYmqDTh9GsZ5oaKiFYZ
	C6H6WIvcKHzg26gV1tdvIPFPBTNNxuO5CdE2CqjNMqvbYLti4S5mYkmck68yA5GeXwbeFY
	k3BJTFeK81lTIpOCPq66PKAHQ50UR1tLr45oZMKoov1irKlH3xZPj6R72TaNYQj1ZWOsWp
	gYovNT5P2Si5FTxD/ieCQLBZ7a7UrC9Scw55fjqI+9nNtwVE2Iwkd8CT6fldxA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 12:35:34 +0100
Message-Id: <DFJ6DAKQHTKF.1V0HIXEAL96ME@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] python3-roman-numerals-py: upgrade 3.1.0 ->
 4.1.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260108014101.1974-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260108014101.1974-1-liuyd.fnst@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 11:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229061

On Thu Jan 8, 2026 at 2:41 AM CET, Yiding Liu (Fujitsu) via lists.openembed=
ded.org wrote:
> 1.Changelog:
>   Restore LICENCE.rst in the roman-numerals-py meta-package
>   Add some debug assertions for unsafe blocks
>
> 2.Add bbclass python_setuptools_build_meta to solve following error:
>   pyproject_hooks._impl.BackendUnavailable: Cannot import 'setuptools.bui=
ld_meta'
>   ERROR Backend 'setuptools.build_meta' is not available.
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---

Hi Liu,

Thanks for your patch.

Building btrf seems to be broken by this update:

ERROR: btrfs-tools-6.17.1-r0 do_compile: Execution of '/srv/pokybuild/yocto=
-worker/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/btrfs-t=
ools/6.17.1/temp/run.do_compile.1347185' failed with exit code 1
...
| Extension error!
|
| Versions
| =3D=3D=3D=3D=3D=3D=3D=3D
|
| * Platform:         linux; (Linux-6.14.5-100.fc40.x86_64-x86_64-with-glib=
c2.42)
| * Python version:   3.13.11 (CPython)
| * Sphinx version:   9.1.0
| * Docutils version: 0.22.4
| * Jinja2 version:   3.1.6
| * Pygments version: 2.19.2
|
| Last Messages
| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
|
| None.
|
| Loaded Extensions
| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
|
| None.
|
| Traceback
| =3D=3D=3D=3D=3D=3D=3D=3D=3D
|
|       File "/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/tmp=
/work/x86-64-v3-poky-linux/btrfs-tools/6.17.1/recipe-sysroot-native/usr/lib=
/python3.13/site-packages/sphinx/registry.py", line 553, in load_extension
|         raise ExtensionError(
|             __('Could not import extension %s') % extname, err
|         ) from err
|     sphinx.errors.ExtensionError: Could not import extension sphinx.build=
ers.latex (exception: No module named 'roman_numerals')

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2834

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


