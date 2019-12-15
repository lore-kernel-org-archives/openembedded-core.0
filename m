Return-Path: <crg7475@mailbox.org>
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by mail.openembedded.org (Postfix) with ESMTP id BD80F7F827
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 12:54:39 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 47bPP34JNczKmVq
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1576414166; bh=6j86naM9jIRjREz
	2YBy7wmKAfPmOEYHBaA5I0U9CNsY=; b=rNXhAsLZQfSKKyC8YKEuoVoHYAj15Tb
	eDDq0B1tncuBRcuY5fCuFdboONhzW5EsA4rtVHoaxPQKmS6GqoIKlOyhgRqCJvpC
	KU3sKfOAIGVRO7r0bdlhxhcEgLa2V0YRftLzB4WG1l9QUqKUVTreMNEH5YzcPyKB
	nHGMVSOb6smvEvJi2ax+NnbokaX7Q6l/yC0ntrSxTYYGGb3/D0yCffiQkWthZb9q
	Ek/cnluyiV/bc+ME4sas4sARdft74FQAFSDieAh8Gu/EtuVJ0e5U06Ln1TXgXEL2
	jHbXrcX7StVZAnL4giS1OxGl7/5JccSjVVMy3GHq8nyknlKPDila38w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1576414167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=9P5fmDjRdSA8Y/WQxNL93mVeRPLba35ddBM8Hrs+aRw=;
	b=cN6MbYIi8gp3MV2TbJiPEvSgB9pfi7oQUB7KK7BDWu8g3WowhP5HZhSTQ8wljPNKUwEXkC
	DFIwdV2QhvAsav5dXllmQySc/mi9ZpLoEVcleamX8s0YoawnfTHWBw4JOKWtQNBY1kvQo/
	cAvU8R4yIvUlayPn/kUn+toRS5L/OK7RRImn0hfU6aGbBM8w/cREqZkJ2ljzBNw8rbzTvM
	Tujwm8do3RCStSIo+yR2OqMNt+ZyoE1Ju6gDivSa1Sk5JSefnrdbb5jZuLsXgALuSYh4oX
	Y6eIhm02AdN/GGNiaHS1qHQkRiKxnVMKlrwnmrRGcZfvmBncn6idoHj390IB/w==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
	[80.241.56.116]) (amavisd-new, port 10030) with ESMTP id W-OEEJavT3RE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:26 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 13:49:09 +0100
Message-Id: <20191215124910.24946-11-crg7475@mailbox.org>
In-Reply-To: <20191215124910.24946-1-crg7475@mailbox.org>
References: <20191215124910.24946-1-crg7475@mailbox.org>
Subject: [WIP][PATCH 11/12] gst-validate: Move recipe specific patch to dedicated subdirectory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Dec 2019 12:54:40 -0000

This does not belong in files/, since that subdirectory is where patches
that aren't recipe specific are located. This patch however is gst-validate
specific.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../0001-connect-has-a-different-signature-on-musl.patch          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{files => gst-validate}/0001-connect-has-a-different-signature-on-musl.patch (100%)

diff --git a/meta/recipes-multimedia/gstreamer/files/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-validate/0001-connect-has-a-different-signature-on-musl.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/files/0001-connect-has-a-different-signature-on-musl.patch
rename to meta/recipes-multimedia/gstreamer/gst-validate/0001-connect-has-a-different-signature-on-musl.patch
-- 
2.17.1


