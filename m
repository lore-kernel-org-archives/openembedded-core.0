Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 45D35602D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 13:19:43 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id s66so6544620wrc.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i9b5z9dsHqHq6rl/iYM+haWiSoqnCUBs4Dgycq+LNS0=;
	b=I44Sf4snVXfQQn86h/sO6Qvcy0QTj+Cbu+Qdi4H/HHavMHbGeQuBAFOqNAgLeOQYFG
	/0Arodqrz4RBrI009FFDbm7/Eckc3lRW+kv8efC2fl7tSdhB/dlLv4LeFOTGmWLovEin
	uzaIp9Sd2jRch/FF+Wv2KNHZoHL7kkQOdKzQPtuSwOSDYi588gPiEhtVaNsw20B058kO
	0DRFaO+q/kUONDkIdh3imerhTMpWgtrflYruuHeiQ9+WbM2beA9aYMEw1eoagpfoM2Tl
	uMyrLr2RdznswrT+ihg6FZeQlJ35HL8cKoGcXP/bWROhk9/eceghVNzIZ55Y3AIOCC9a
	0UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i9b5z9dsHqHq6rl/iYM+haWiSoqnCUBs4Dgycq+LNS0=;
	b=LXLeozzr6n9Ib9VS6hPq0aCIDuTcw2tSOVX8yBTFNLty3hsZvvmBkIuSDUUlxbcfsG
	0o42HTSldz4u1d7k5z+pv8hKg+eR9eZ9zQDk0d5yxUQMaz85aeFMmELrFlmjyZu5oP1P
	iI3Htps4QusMNF9rXNE/3v11jLofY/j4RlYAuxWYd1eManf4GPPlgRIZhwD7F+SP4bjn
	TGoItasgTkIXjFfSKGHwMTeQC7qz5n4a0wadErdbdF9sFCJgDeGr3DBxlQrsd8whZWt3
	Cmn5bSk75Bmnm2e/zXZEzXWonf96rjJqMjcKs3QvoZy3UTuRTwNU53u/202vN80dAa14
	h1nw==
X-Gm-Message-State: AJaThX4SYDUfxPx8uV2NhSWIpJ0w5O01glDZg4l/peW8IiJqt62HJFb+
	UMBrvxSu2cVtOojC60sAJ9/fDftE
X-Google-Smtp-Source: AGs4zMYbnP9zBms65t0Qt5Dd2uhAb+raAo/chy79CMy1h66VsiB6cKPMfQmZS+SkaZfgXlgDZW+bVA==
X-Received: by 10.223.151.197 with SMTP id t5mr1846040wrb.263.1512047984688;
	Thu, 30 Nov 2017 05:19:44 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q15sm3602780wra.91.2017.11.30.05.19.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Nov 2017 05:19:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2017 13:19:33 +0000
Message-Id: <20171130131935.20771-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171130131935.20771-1-ross.burton@intel.com>
References: <20171130131935.20771-1-ross.burton@intel.com>
Subject: [PATCH 2/4] openssh: don't do aclocal/acinclude dance
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
X-List-Received-Date: Thu, 30 Nov 2017 13:19:44 -0000

Instead, just stop running aclocal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/openssh/openssh_7.6p1.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
index ebb9a5734dd..9d940d45907 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
@@ -48,6 +48,8 @@ inherit autotools-brokensep ptest
 # LFS support:
 CFLAGS += "-D__FILE_OFFSET_BITS=64"
 
+EXTRA_AUTORECONF += "--exclude=aclocal"
+
 # login path is hardcoded in sshd
 EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
@@ -73,9 +75,6 @@ do_configure_prepend () {
 	export LD="${CC}"
 	install -m 0644 ${WORKDIR}/sshd_config ${B}/
 	install -m 0644 ${WORKDIR}/ssh_config ${B}/
-	if [ ! -e acinclude.m4 -a -e aclocal.m4 ]; then
-		cp aclocal.m4 acinclude.m4
-	fi
 }
 
 do_compile_ptest() {
@@ -162,4 +161,3 @@ CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_${PN}-scp = "scp"
 ALTERNATIVE_${PN}-ssh = "ssh"
-
-- 
2.11.0


