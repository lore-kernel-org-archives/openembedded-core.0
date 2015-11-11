Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E7C487716E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:20:08 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so51072571wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 03:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gU+HZ8EHnr0cxBY0R8YJlE3Xe/qzTo6BMXcPl9GhOVY=;
	b=2B6Dy56Iu2d9ZHDS+PRLmo33KQ7eMOqZH6G6eUbWRjsg6rmJhtlmMnRBq0Y71CfjPg
	1B/RRLrzd76jk28veBe+yOYZsUw9ECqdW9cxvq0/RsLwnXC6ZHwY0IIGpQhRLvdtIcwJ
	TePtrZ7q//eiM41zg+7QBEUfFJZprst3hIRWBhCMaZLjZU3rzFDQXv02XTAPvtUObQSK
	TqN5SHORvhkhq/0dE3XRmP58UOGeC05QSmxO2hec6vWTPrib0zm0lMxu0n8LuRa6tsV9
	kqIoQKtXsp6Q9LTqpl2LI9luLIuSqu4YXy1SKkBrkw5L6MflrQ8lyoLaSyqXvboTVcNO
	GYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gU+HZ8EHnr0cxBY0R8YJlE3Xe/qzTo6BMXcPl9GhOVY=;
	b=kEjz6cTcBoWqipMMa27gq4xmBwV9z/+WADbJonNmtgIrGTGUypeoqbrMsqkSfVZCW3
	5xW9LebxfPahZlC7kMYtHeu+QQA2irrLLwFVCP5IbAt43HNDUiqVDeY5pp0qx2dGFxY+
	gCGPy2A2hab+bh6i1C5x0iHvW0+pD2drYHZfkwUn9iUIHCTbY6FchIWMqYVQPOLLMZGi
	VFm6Qyc5r00MILtcvb6ynTPPnNz1fpTePxAd3VDSFp5I/KUDObm8awdWcDAt7vqF2Wvr
	dmu6/24oW86GDoYU2Xf0B/KQWD2rCa3EWUkz6MEvxD+SOGkoZGvNOE1gPb2Wp2ebVoL2
	pwIA==
X-Gm-Message-State: ALoCoQlpulDL7U/Krq/ApJXf2hZEbRmAMF6/t5sOYxGP9NbHlhqPCDb7Y8/Z3nOeOccNUQ/K1yVp
X-Received: by 10.28.186.138 with SMTP id k132mr10966742wmf.75.1447240808223; 
	Wed, 11 Nov 2015 03:20:08 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	bf8sm8480023wjc.22.2015.11.11.03.20.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 03:20:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 11:11:48 +0000
Message-Id: <1447240308-2849-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447240308-2849-1-git-send-email-ross.burton@intel.com>
References: <1447240308-2849-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] systemd: fix Upstream-Status tag
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
X-List-Received-Date: Wed, 11 Nov 2015 11:20:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0022-Use-getenv-when-secure-versions-are-not-available.patch        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch
index 30e3817..5af78d5 100644
--- a/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch
+++ b/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch
@@ -7,8 +7,8 @@ musl doesnt implement secure version, so we default
 to it if configure does not detect a secure imeplementation
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Denied
 ---
-Upstream-Status: Rejected
 
  src/basic/missing.h | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
-- 
2.1.4


