Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9EFE36C57C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 20:35:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n190so4858961wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2018 12:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ao+lfe25arfG1xPlnPveryvUUIsHbWgQ1ajr9Q8Egys=;
	b=gweT0fFt05mpdqm6GkAcQnJ7m+GanarltKduZhT737KxTQCOtDtpDRgIbZO3m2+c3M
	t8Ree6Ppoh31wJW0LHspTA9rWymOCn4gBm7L61bK/vOJLaUdvMgT4LrGZZOhdL204+ll
	LSfmCMMZSNfpP4MDVtI8dJNi5lBoLgqLJP3owszU9SqPPCgpyARfyFf1ctvRlGWmw46h
	VjpXIIRaX03Db++1mZEcjV3D11y3t0oG0l+pTy6G8GxDG2fXKuWR5f6iAQ/NC1K9NJFw
	ENyr4GTJCkEHabqZGosKflYAmLWSSAgCli9wVCd9RXj0XnOvjIPUVG3fSWdCJIY9SYpB
	fh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ao+lfe25arfG1xPlnPveryvUUIsHbWgQ1ajr9Q8Egys=;
	b=qcgJMsfzSxNP+SyoeV4JDim5qZTj/1lkBDnlhcoi2UmqVOxXYMHW6oH4dmgV2+9eYl
	FhQ1kfO28jjC7bYe5E3/zm73pu5SroZ369nlIpI5jR83GJeoaPHcyz2TnL5dRtJkIYCe
	uDLX2O9Uos0HvKd9XoYFf+DWvYfPwrX3mvRxdRS7x9a749xbWG0a/Cm1KU2uN3Q/zLJG
	hS5JTjuFwGTmhpzMxkck8sb7OXqMGv6GE7YNBQxbx19P5y9bodKEPfuL9UE4O/F7LuSM
	Pk5zAG9tlAPDSRtKe97qzcdP8EiL/nmhL9JtNggkDXx4jtPfpQ1vvkTDSSEQsZR0jCXH
	UPRQ==
X-Gm-Message-State: AA+aEWZUDYpQxHJZF46tw+kFFvz1rAHbMFwEYlQYaZFcRetm8tmGMsoC
	M6aVcWzRxM2WnSSDaTFU494t1ttyQf8=
X-Google-Smtp-Source: AFSGD/W7ee7wceuI0qgeUYCnAoNztWX51dCwQCNWboCy0Lz5m3jbsG923j3P8eEcZVJ0ZyCf4Jb5Eg==
X-Received: by 2002:a1c:2104:: with SMTP id
	h4-v6mr9200416wmh.130.1543869322272; 
	Mon, 03 Dec 2018 12:35:22 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q2sm15361570wru.56.2018.12.03.12.35.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Dec 2018 12:35:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Dec 2018 20:35:16 +0000
Message-Id: <20181203203516.26461-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181203203516.26461-1-ross.burton@intel.com>
References: <20181203203516.26461-1-ross.burton@intel.com>
Subject: [PATCH 3/3] insane: clarify GNU_HASH warning
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
X-List-Received-Date: Mon, 03 Dec 2018 20:35:22 -0000

We have a fatal error if ELF objects don't have GNU_HASH segments don't don't
explain what the problem is.  At least give a hint to users by suggesting that
LDFLAGS wasn't passed to the compiler.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4644221bc6b..6718feb3af5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -383,7 +383,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
             sane = True
 
     if has_syms and not sane:
-        package_qa_add_message(messages, "ldflags", "No GNU_HASH in the elf binary: '%s'" % path)
+        package_qa_add_message(messages, "ldflags", "No GNU_HASH in the ELF binary %s, didn't pass LDFLAGS?" % path)
 
 
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
-- 
2.11.0


