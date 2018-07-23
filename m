Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id D849474BFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 11:51:27 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id e7-v6so393619wrs.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 04:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tUSYwVyucFvPrKhS8EKYJcOov8nvlhxEslDqsmORuo4=;
	b=AXRmeJ7UHTWu5A/i+oLu5AS4R//VhsCYuvOF7FiZzlGFZewSVe34suhMumqjXxVONA
	CFGMILj2J/wX1TLN/4bd4gOD4Umr69yszUBX6N30hnNvbLIG0s30ryhmrCfQOla4edLW
	KzQfQb/vo80MqPx6eqyKEQAVDBj3gQZCJFgLTPrTMxeSGCV/JfXTSJ+jr2EqCLSVxUqU
	ebShQZLKGTks0ka03g6/1BEAMzEJoXjsiJwAkkdliEVanVh0h4MkgjwFcqedZbyUvTdF
	Ld0Z8OE9JO3dMigVIQUcNXsFCCAea864JqZ+HwSJ/DGHZ4oEykXBHd6e9puZtEUQAlYm
	4qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tUSYwVyucFvPrKhS8EKYJcOov8nvlhxEslDqsmORuo4=;
	b=l+0jLBuMHgDxgMCD8Fa9QF9pOAPy5U8MSYbCA9KsiSuTr4ENGlhSj9jZlFoYKAQiu7
	SZYnoEcGiYbruuXOhLGt8la6hMOJ1H13vbbhYS5wetonJixS+VzD/utqzyRaYt2u+lhw
	12QXkNA/5t/ts6OO4Y+3VC3QLMo4kgrYhYk745xOZ0yGa9NBZp/58Xypqmt0rdtud1ff
	is7UNeIpojGXxkGKk7nzyhH/YTwlsvmM5hMfzuwpgC/6E4KW29VAf5jKA7+5Y/pzwhOi
	jug/XliVLufHsfZhxuExXy7wLpGxyO+4nHrD3gciD3Qh4cl8wtWRUxliFTm3Pa3f2vKZ
	qJbg==
X-Gm-Message-State: AOUpUlEHxzvD087vJjqQy8N9lbhqjeKFtmZZC69jEJ4PnHSsinVEm4oT
	0tsJBeRv7YAjZti3a4/Rod7NYzJPrO0=
X-Google-Smtp-Source: AAOMgpfRtjPbcV1yViN8TcpOf92JcXhA4CIGOsjnBGUSYs09AzP811CgkvaJfhuHQIXZQv4Q+35QAQ==
X-Received: by 2002:adf:9246:: with SMTP id
	64-v6mr8592143wrj.109.1532346688274; 
	Mon, 23 Jul 2018 04:51:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h12-v6sm12861055wmb.3.2018.07.23.04.51.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 04:51:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 12:51:23 +0100
Message-Id: <20180723115124.27548-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180723115124.27548-1-ross.burton@intel.com>
References: <20180723115124.27548-1-ross.burton@intel.com>
Subject: [PATCH 2/3] gnutls: rationalise libunistring arguments
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
X-List-Received-Date: Mon, 23 Jul 2018 11:51:28 -0000

No need to pass --without-libunistring-prefix, and it looks a lot like we're
trying to disable it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 98ec8d9667b..b62a137e595 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -41,7 +41,6 @@ EXTRA_OECONF = " \
     --enable-local-libopts \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-    --without-libunistring-prefix \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
2.11.0


