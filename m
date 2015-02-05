Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id A050972701
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:39 +0000 (UTC)
Received: by pdjg10 with SMTP id g10so2406725pdj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ey6BniINV9oquQmNy1DL1BLRykZrDaa8yl12aXg/MvA=;
	b=CrUm4VWNiDEutCqOWgEJA8f9VYMgVVSlXBrU3Ij6BG3vaHR2XKfU7ha6nENQxq0EFT
	elYcaVKagrvDwvXtdAGtF7NPQAcl0irpCz0ME33qh0pS0hlOxq+fvecydBDl2mO8WRk3
	mDzCTKJ6J0z0ioFyQ4EIkVIQY8mOEWmR3HBqiso6mrRg3wYjM/qc+eAgpXXiqKgwo6Te
	x8WbQpa8ppvjmkGPcKoWRPN3JDMQtLL4Gq3qCQ8yc3e17QJ6QFnkMpR/XXyPPf/wsAsf
	hswVYOm2EHGTJk26iJ6KAaLC6b6HKKnXM3iCGcd3EizyFBzgF8seIZKVaD3F56VyeTy7
	jIRQ==
X-Received: by 10.66.65.203 with SMTP id z11mr6505573pas.99.1423152280815;
	Thu, 05 Feb 2015 08:04:40 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:22 -0800
Message-Id: <b000590cf538c8738607dd349fb63bb7a7d3acb0.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 14/61] poky.conf: add file-rdeps to WARN_QA
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:39 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This was added to the default value of WARN_QA in insane.bbclass in
OE-Core, but we missed adding it to the value set in poky.conf.

(From meta-yocto rev: 125621909c69ac00ca90e6001b7798c5123b0405)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-yocto/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky.conf
index db6ad5f..0a5d99e 100644
--- a/meta-yocto/conf/distro/poky.conf
+++ b/meta-yocto/conf/distro/poky.conf
@@ -112,7 +112,7 @@ INHERIT += "poky-sanity"
 
 # QA check settings - a little stricter than the OE-Core defaults
 WARN_QA = "textrel files-invalid incompatible-license xorg-driver-abi libdir \
-           unknown-configure-option build-deps"
+           unknown-configure-option build-deps file-rdeps"
 ERROR_QA = "dev-so debug-deps dev-deps debug-files arch pkgconfig la perms \
             useless-rpaths rpaths staticdev ldflags pkgvarcheck already-stripped \
             compile-host-path dep-cmp installed-vs-shipped install-host-path \
-- 
1.9.1


