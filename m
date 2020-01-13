Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 516927FCE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 12:39:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so9461088wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 04:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=O1/yz7zO47DudDQllwyqTCLXR0jLFfx8bOgF2C8GmTQ=;
	b=RaAhgWXRS871dRQWRG/6CXqPe26guUGSwH/7R6xWX6ogH+sdm5HYiYF+lQ22XeL23R
	z3wDzj9nX0NmVwPxfyz1I9fb8hWEUsEyyzq3MpXW5PdQ+VVqfiGj1sqhFb8lOQlO/jV7
	yq52jcuiAKEwBinFckDHkFVMxVDW3C7dKu5RKQZRpwYSS4FijfhxTxAqyhVgNtz7GZvS
	fVKQsuc3vaRIOpXWwvrRN3s0wDC2WF3cpgf0l5C0V+lQ5FgzZsSe0Q24WVMInsySmZ8X
	LHfFIsGL/KiQ/KAvr87/Juxv3Tg+jPVMhuBLDqVmOVrtx6de2BUg9lA4n65HvHwDQ6+x
	W+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O1/yz7zO47DudDQllwyqTCLXR0jLFfx8bOgF2C8GmTQ=;
	b=ClpQmkn6VxxbYlm2kz3bQHJ2PEB/0gqtpnmTTw7x/U5L0U2RmXsmI0yPU/SWlg3nmj
	TBPtBdb8wTq/LKOSiqvnZ5r5UREbSCVm/An84mSRn7GLSMgjf2zdbYJ+2lMDxjZZwkfv
	6M8Ak7W8KFR6IXJIUyq6lXJwwgxrkCl3qD7aBS8oK7gFl+wFi9wmfSiAXj/8/60I1QQ1
	wp3ZrMWDX0467nVVBSFVo5CZfhfzfcIC0hWv9HARB6rHTHi1/S+gYXr+aEOfu3p7t+Bq
	DIT5oZWh1CGSaTnIldxOm+whblBUr908eBVfMpwN2ssr0q9EIfYaLCw461tRifq05Qp3
	qdWw==
X-Gm-Message-State: APjAAAXz10K8IQyDmfmr7nbUI2d/4ukii6eZNr/HhQDBSu20m0MNQY+g
	8TZpLBdUjU3Indv0svh8sqyKN2EorQM=
X-Google-Smtp-Source: APXvYqxmysl7ryGHS9ibIBrRa019TSKGIccn0zzzB/XFmogVXgkRbHYwc+AoE74tAgRmWIepK02EJw==
X-Received: by 2002:a05:600c:54b:: with SMTP id
	k11mr19603357wmc.63.1578919169755; 
	Mon, 13 Jan 2020 04:39:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r6sm15254299wrq.92.2020.01.13.04.39.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 04:39:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 12:39:24 +0000
Message-Id: <20200113123924.27277-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113123924.27277-1-ross.burton@intel.com>
References: <20200113123924.27277-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gettext: fix typo in Upstream-Status
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
X-List-Received-Date: Mon, 13 Jan 2020 12:39:29 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
index 96e5bf380fa..b0bc6b97a63 100644
--- a/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
+++ b/meta/recipes-core/gettext/gettext-0.20.1/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] tests/autopoint-3: unset MAKEFLAGS
 This is needed when running ptests, as the MAKEFLAGS value (set up by run-ptest)
 is messing up the test.
 
-Upstream-Status: Inapppropriate [oe-core specific]
+Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  gettext-tools/tests/autopoint-3 | 1 +
-- 
2.20.1


