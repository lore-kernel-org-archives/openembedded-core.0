Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id C118D74C37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 11:51:28 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id b15-v6so389920wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 04:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JySazNr1g+k/XbcFZOUadvNP1A2aJcLmLp3YQ1t6UzQ=;
	b=bgBjBjABVqpJlXo9eYKIkgyOzKDtxWiORqzqlPSSuOuijHd/oPkOkxkWoljEYKD3eV
	rbBVnJxeOASO35WP+2MGSoXYOxcogfv++KKf+ZiDoXWIlEvzKX+c9l6uI01vGHvk/1ZS
	5MQygZdaLlzRzeVfeOSHeDqEPnOlzqCPqwikhgUMBwlTQqYg124Ed/XYn84Op7t6Gb7I
	L03/s83QwLssuDA2qE67jU/Xr+0Jepyme40QhJeDEf8IZCp6WmC6dck3x9FEHAwa8cs/
	1wA8fH6qBNbPg5hF3zUptqgQfqhhMUkmKk4gz9jwu0jL9/uS9fnEX9rYNXXgeAChuRCY
	1bVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JySazNr1g+k/XbcFZOUadvNP1A2aJcLmLp3YQ1t6UzQ=;
	b=Wy22sZ5UsdA3wj2Xc/RyvTT5y7emIXR9S8TrwQ4FUvgr8Rww4XNOgDZsq26rgUMVTb
	uAMCfvdR/4haYh4vnddjt2WxCIzCI2ZPx7mq4yUSC32U8uzI28RoNizCsfPXtHbi/9U5
	8wlwNMHAjJKJveM+bYHCn0gM8nwoxZQ6F4LcFMeAM5UgHmzoOiaVzxvXWCosQpW6eSJq
	2QwyWlJdV8HcvSJX/eVodp8w8lBo9MhZcyy8qU+GNOhTDQo2GZn0DOlm8c5PcoutXe7k
	d15TDQqQQCl3J/rdUkwMauBOro6aHyJIMPUOihcNGFoBqKocW934TrVhsqE/0u7McC06
	zS2Q==
X-Gm-Message-State: AOUpUlEeQO7VqCN03QUVvC5keRm74hhyAc0CcoLbrzoIZO4Gm+LoVYIj
	JsbOwR2+VC1ZFTtALs26pWSyviu/KO4=
X-Google-Smtp-Source: AAOMgpc2yls8oxG5gL8jE6hBmNsoy/2K3cv8GCLs3knZsy6UCQTVa3RTlv55N8P8p6g+siFgXcRO6Q==
X-Received: by 2002:a5d:550a:: with SMTP id
	b10-v6mr8667062wrv.228.1532346689463; 
	Mon, 23 Jul 2018 04:51:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h12-v6sm12861055wmb.3.2018.07.23.04.51.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 04:51:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 12:51:24 +0100
Message-Id: <20180723115124.27548-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180723115124.27548-1-ross.burton@intel.com>
References: <20180723115124.27548-1-ross.burton@intel.com>
Subject: [PATCH 3/3] gnutls: fix libidn dependencies
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
X-List-Received-Date: Mon, 23 Jul 2018 11:51:30 -0000

gnutls only works with libidn2, so update the build dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index b62a137e595..876a3847b0e 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -25,10 +25,8 @@ PACKAGECONFIG ??= "libidn"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-#
 PACKAGECONFIG[seccomp] = "ac_cv_libseccomp=yes,ac_cv_libseccomp=no,libseccomp"
-
-PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn"
+PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
-- 
2.11.0


