Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EC7CA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 15:25:26 +0000 (UTC)
Subject: Re: [PATCH 1/2] meta-extsdk-toolchain: Install multilib toolchain files in the eSDK if multilib is enabled
To: openembedded-core@lists.openembedded.org
From: "Jagadeesh Krishnanjanappa" <workjagadeesh@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (223.186.59.154)
X-Originating-Platform: Windows Chrome 154
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 03 Oct 2026 08:25:18 -0700
References: <20261001174220.3492439-1-workjagadeesh@gmail.com> <20261001174220.3492439-2-workjagadeesh@gmail.com> <DLU9HE0BMZOU.1Q9F128NAY6NH@bootlin.com> <1458778.1790994217381042169@lists.openembedded.org>
In-Reply-To: <1458778.1790994217381042169@lists.openembedded.org>
Message-ID: <1466663.1791041118848735924@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GD8wrbdwm1rzQtIE8EX2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 15:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247163

--GD8wrbdwm1rzQtIE8EX2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have submitted updated patches (v2) to fix the above errors.
The functions from utils.bbclass have been moved to utils.py, hence
reference of multilib_tune_values() should be replaced with oe.utils.all_mu=
ltilib_tune_values().

Sorry, I could not catch this error as I was at a older code base.

Regards,
Jagadeesh

--GD8wrbdwm1rzQtIE8EX2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I have submitted updated patches (v2) to fix the above errors.</div>
<div>The functions from utils.bbclass have been moved to utils.py, hence</d=
iv>
<div>reference of multilib_tune_values() should be replaced with oe.utils.a=
ll_multilib_tune_values().</div>
<div>&nbsp;</div>
<div>Sorry, I could not catch this error as I was at a older code base.</di=
v>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Jagadeesh</div>

--GD8wrbdwm1rzQtIE8EX2--

