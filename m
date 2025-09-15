Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94940CAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 05:32:24 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.25741.1757914342270253787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 22:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0w9DOheF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 445231A0D7B;
	Mon, 15 Sep 2025 05:32:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1911C6063F;
	Mon, 15 Sep 2025 05:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 631A1102F2A84;
	Mon, 15 Sep 2025 07:32:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757914339; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dRwlZ5eP899g/Clyr7ElScmJIgyRqqXLzgLiwFJB0cY=;
	b=0w9DOheFc4NBXeIqz1fdg6mJYcyrJI/ySGzH+w5J1Pl0aeL/690542uJUvovgNrChxw7oj
	QTG44q9Cqd2gNzoAXONAMohoRCcq20B0TV75MIT7Y6zcVk/v+dV/H4f3VcrwNiZCgs5pHu
	GXnG23xDhecopOPsZ1tzj+YZ/as/qtbKrRYiYIa6GpBBDMG1r1kR+RdyGymr8gIVi9WBZR
	3Dycs+qMj9eesiNQIWDWLUBVtOPmc76rNnsJtSoMT5MuYOoB8siQgGLud9ZlSh/d13+Ot3
	azXdSbbMcOiNAwIpzzxyKzkqlptv0yRgr0Hj5Abex+KxL4oWH4tSFNRTFuurZA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Sep 2025 07:32:16 +0200
Message-Id: <DCT4MHD52ESY.27150KMTJ59Y7@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/6] clang: improve opt-viewer
 PACKAGECONFIG
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250914133258.2625735-1-ross.burton@arm.com>
In-Reply-To: <20250914133258.2625735-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 05:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223375

On Sun Sep 14, 2025 at 3:32 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> Instead of patching the python module detection, we can use the hidden
> option LLVM_TOOL_OPT_VIEWER_BUILD.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Ho Ross,

I just launched a reproducibility test build. It did not crash, but we
still got some issues:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/clang-dbg_21.1.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/clang-format_21.1.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/clang-tidy_21.1.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/clang-tools_21.1.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/clang_21.1.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/libclang-cpp21.1_21.1.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/libclang21.1_21.1.1-r0_amd64.deb
...
(same with ipk and rpm)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2497
http://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250914-yhzvpnom/p=
ackages/diff-html/

Thanks,
Mathieu



--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


