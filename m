Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 725CD76040
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 21:09:20 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id l2-v6so6005899pgc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VJ5UePGtBIpDtmUbaXmeuycdY/5KmwLnvYpzf0Ox6MU=;
	b=Y8u5Zxz/d5KpStzOb9IMf+3KqOpp8HdQSzXcIgsnKdV58exjOrjb6Go1FIdHjD1Quw
	S1c0goLWqjW3uZiqj1KB0yaW8Mvc0Z6wdftB3njE5fmiAScgct7GmyCmerhtzDL4ghyx
	uoAd391mwmyeHEaKThLMGMWuCuVs+pXWi1vz03JEfKP2cfr+OMK1Z/gyc6D8l0MDt1k1
	hQ6Hpy+aJy1Egfq3omqdrgQODkFFHRy7mmuLZj1WS7hKl7l40k8cgJ4s9p3+l12mLEkM
	6/JOvak45dZswF7ESvzmqVxu3tywEVo1id+yMBHhCXTKPNVzkZBwjMZCC4esVodMQebr
	X8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VJ5UePGtBIpDtmUbaXmeuycdY/5KmwLnvYpzf0Ox6MU=;
	b=Qqz7SANCK9ly+WHSjSjqpA4vJfaLSJHq0XuACNVo+ibw0H/7oQ2s0bMYKU5zQwFRkC
	22iLX5HOanbADC/H8OFE1/FaGwUUlxxmQSS7UtEhqFYOvn6DUKlX2Due9BU0nW1m9bPo
	0HWcu2ly+ucO01VAfFjFaenv6piAYirCItXgw7/Ex1/8OXD3L6fN6S/Oia1GjeskryEG
	pCnsjWTHfjQELxMsXFlQZIiG34IBO68sQ5DCeUcwlx+kNZuo+GezRwJmzvwI544J2TCe
	KM+SIoShFqvzWtWC/zLW15GHbFLk0wMGlCn2fyxl4qVao05vmM1cUbsTPOx5nAHsNw6x
	EPMQ==
X-Gm-Message-State: ALKqPwfsmsvhT6V+Nucart7Xj/brJ0CWgbAY8cxin7OCm1EsI2juHlxA
	FrFOQrU1w6XQDfaaytkH+t5kkg==
X-Google-Smtp-Source: AB8JxZpglc5fcx6bpE26xK0OrEBX6728LMdDk6Euq0WlrdVykYm72fDmibtOmATYQtC0rg9VVxRnsQ==
X-Received: by 2002:a65:44c3:: with SMTP id
	g3-v6mr9003145pgs.428.1526332161070; 
	Mon, 14 May 2018 14:09:21 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	g26-v6sm19234043pfh.76.2018.05.14.14.09.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 14:09:20 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2018 14:09:14 -0700
Message-Id: <1526332154-20637-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bitbake.conf: drop obsolete comment referring to the fail-fast over-ride
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
X-List-Received-Date: Mon, 14 May 2018 21:09:20 -0000

The comment appears to have been accidentally left behind when the
fail-fast over-ride was removed by:

  http://git.openembedded.org/openembedded-core/commit/?id=83ce96f44516c8a4a44c8c0140949256f8422014

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a21b728..a74d8cf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -733,8 +733,8 @@ DISTRO_NAME ??= "OpenEmbedded"
 # '<foo>_qemuarm' and then '<foo>' will be overriden with that value from '<foo>_qemuarm'.
 # And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
 #
-# This works for  functions as well, they are really just environment variables.
-# Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
+# This works for functions as well, they are really just environment variables.
+#
 OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
-- 
1.9.1


