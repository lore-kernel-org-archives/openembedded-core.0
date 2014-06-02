Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id DFEE16F50C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 10:03:27 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id f8so4291952wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jun 2014 03:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aXby63PfNYWY7LUp03JE23sDIBP390pz7161wJ211ok=;
	b=Tg7ec112SZPJJ7vbI7nkUxGmMkDSMwYruEfmJB6z+d9dYY+pynzhjFRbHeYWaj7qWt
	87I2ueZcPf7CPMmv1hUNqSALnwTPSrijawBBUl0dk6O23GAzZwzlIqvrDgp4SgGsIA3T
	5EGH9vjZ7tMnQBhjma2UhW4GYsk8Hnt2XZh4s9ZTkUH9o/MtW97noHR6PxtxAbPVH4uy
	6r2mKOufZxoLfmRc5PZ471xmfcre7nggtjrqfMRczj1MhyXOH6BWgZMNZKqoB/91irEO
	0aBuvqlZneMSqssCx7fquiCGKXhZg8SIU9m5bmIh1HT9NfGPX3VMTQpDCx6cs/LCvmeQ
	w67A==
X-Gm-Message-State: ALoCoQmsK/MkyJZ7BWOcktvtQIIA4bdd8xXU5iAFNXC5vgKpR19E8SSGM/Hp2h39TwMlhNL6JgdR
X-Received: by 10.194.1.164 with SMTP id 4mr47321161wjn.17.1401703408111;
	Mon, 02 Jun 2014 03:03:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	en6sm31215003wib.11.2014.06.02.03.03.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jun 2014 03:03:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 11:03:20 +0100
Message-Id: <1401703400-31541-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401703400-31541-1-git-send-email-ross.burton@intel.com>
References: <1401703400-31541-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] diffstat: patches have now been submitted upstream
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
X-List-Received-Date: Mon, 02 Jun 2014 10:03:34 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/diffstat/diffstat/aclocal.patch |    2 +-
 meta/recipes-devtools/diffstat/diffstat/dirfix.patch  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/diffstat/diffstat/aclocal.patch b/meta/recipes-devtools/diffstat/diffstat/aclocal.patch
index ff18f1b..cde4a40 100644
--- a/meta/recipes-devtools/diffstat/diffstat/aclocal.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/aclocal.patch
@@ -8,7 +8,7 @@ The original macro name (AC_ACVERSION) leads to this error:
 | configure.in:9: the top level
 | autom4te: m4 failed with exit status: 1
 
-Upstream-Status: Inappropriate [embedded specific]
+Upstream-Status: Submitted (via email)
 Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
 
 Index: diffstat-1.58/aclocal.m4
diff --git a/meta/recipes-devtools/diffstat/diffstat/dirfix.patch b/meta/recipes-devtools/diffstat/diffstat/dirfix.patch
index 6685056..15dbf2b 100644
--- a/meta/recipes-devtools/diffstat/diffstat/dirfix.patch
+++ b/meta/recipes-devtools/diffstat/diffstat/dirfix.patch
@@ -8,7 +8,7 @@ Results in "mkdir: cannot create directory `/usr/lib64': Permission denied"
 
 Since the directory is never used, we can just remove the mkdir.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted (via email)
 
 RP 23/9/2011
 
-- 
1.7.10.4


