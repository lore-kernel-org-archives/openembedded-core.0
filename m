Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 973AE7C603
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 10:11:43 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id w12so14557595wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 03:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1aH/loQhQ04JlZh069qL6Z19hYuo0wJDy+sH6+vzNMI=;
	b=Kv+wV4fUS9N2NPjtTmWbCGluKHV+RLYHmaS4C7jmB4iJ0o1OiGh5TQhaHN+WSpWFKH
	Lp5/nsK31zbU9VG0WkD+p6x+ak3sPt3a2WrpWQqxD++gSEnsgWoLnec9zH56nae9dpKE
	oRwnowOUkHXut2WwTng/kRALQtx19o4Jn1UhR1fhuVMuuKPntByaaA3YtQiuCsO8AopC
	A+8k3rupYTAXqSwaU/S2eVs1ZGQjV2l3TFEE/cAhA2FLz3EEpG1ncDh8vcIj3sR4u+PV
	ek97YqohBVBEAboWtnbCXBhPCzPxR0Yhv6TSX1D7SAHC590lGXRIXEy620LnVFX/jm1d
	3v4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1aH/loQhQ04JlZh069qL6Z19hYuo0wJDy+sH6+vzNMI=;
	b=k9WZ+GTxL+LqhEF0kCPpZTxy1nepVxUWwr81hjZsZGXH42W5qUCup8lPJv/C/cvK3W
	b3ly/wDLYm3D+htbBMYl9bupXe+w9wVBuFdVGAvoi9CzH1LFEfuQzDRKIDeCcbxHiK3w
	Dxa/20AdRxv91BLhObY8SYqnmX8xGIid5U8KWWyjlld+V7zyqTtfRYdGGAQti3k+gFYX
	fspdxrkGy/BlW6TSvoYbDh5DwjEYj8WK/xCDEF+0rKEQUJQW+G1czjQPzXaCRXbEE3RG
	q4fYJwl0ss9BXJbE+Hvi/RNu4nMealXzu/uXyvqTes5PJvx2902kZdsHcLSlPpdE39Gb
	3VrA==
X-Gm-Message-State: APjAAAW94YnTeqFfIC8fnCVVuHzZRW1Xinod3ZVtz/TAuLF8FlUlho14
	+h1UFTRcZ8H+be3LdwKcVjAMln1pUOM=
X-Google-Smtp-Source: APXvYqzZxT/yRGiEJbTNdBTl6qY8G1Jx7swUKUflDqMhp8+yOn9AAedJ3DrKcIWWm37vNWT5KsJpMQ==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr20763352wru.363.1570443104050;
	Mon, 07 Oct 2019 03:11:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q22sm13823289wmj.31.2019.10.07.03.11.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 03:11:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 11:11:37 +0100
Message-Id: <20191007101138.3722-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007101138.3722-1-ross.burton@intel.com>
References: <20191007101138.3722-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] meson: update patch status
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
X-List-Received-Date: Mon, 07 Oct 2019 10:11:43 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...1-environment.py-detect-windows-also-if-the-system-str.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
index 37b5356d77a..2faeda2e711 100644
--- a/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
+++ b/meta/recipes-devtools/meson/meson/0001-environment.py-detect-windows-also-if-the-system-str.patch
@@ -4,7 +4,7 @@ Date: Mon, 25 Mar 2019 17:17:06 +0100
 Subject: [PATCH] environment.py: detect windows also if the system string
  contains 'mingw'
 
-Upstream-Status: Pending
+Upstream-Status: Backport [fe645a0a9e2da230d2c500af1f5b2db5da1e364d]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.20.1


