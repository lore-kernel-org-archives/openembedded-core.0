Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id E52E272B9A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 11:56:02 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so17197443wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 03:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DBcTfSw5fwC8MakdoHX9UqLu1AS4fQWW0SR6Gmn/ocs=;
	b=VfPFd0bPh3udxRvwaakFNgtHUcrNW/toXnBCDvovyuSqQa46JjwTFo8Es+hee/NYhW
	+zYBTJv01KtoLF2GVkl6kbZNBpCYD3sbJY0rTD+C8acgYsdkagWOj1SsVgFvoZlH62Pp
	HjCB1xUG6NNNDLLsSaY9Pbmmu3baiQDBre88aloaS2AkxbWAhJ6p85XXLqP4RZMNA+1w
	9irO4sAN0eE9i1jbIz4CRLFEbrRGlxkKFxZbb09EgT7/Bc1TwYBF2o8lBfnr1X4e5HXR
	p+GpHc4nbXBcVIqmOmhPMmS8cKZAqhLSqcvQj1nFbzZytwsIzF1vpMMa8TqaBPZuHbAh
	wQzA==
X-Gm-Message-State: ALoCoQkxJ7gX4HUuENe5pFvaaJCJI/q6+LyoYPo43Rnrd92v/SK03TUTFuzk5ysWY3rikggmFzkN
X-Received: by 10.194.95.10 with SMTP id dg10mr17614700wjb.82.1421322962555;
	Thu, 15 Jan 2015 03:56:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id vh8sm1798509wjc.12.2015.01.15.03.56.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Jan 2015 03:56:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 11:54:20 +0000
Message-Id: <1421322860-12652-8-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
References: <1421322860-12652-1-git-send-email-ross.burton@intel.com>
Cc: dvhart@linux.intel.com
Subject: [PATCH 8/8] kernel-yocto: remove GUILT_BASE from terminal exports
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
X-List-Received-Date: Thu, 15 Jan 2015 11:56:03 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

guilt is no longer used to manage linux-yocto kernel pathes, so
we no longer need to export variables that it needed to locate
patches in the tree.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/kernel-yocto.bbclass |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3b59d85..9c50d52 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -352,8 +352,7 @@ do_kernel_link_vmlinux() {
 	ln -sf ../../../vmlinux
 }
 
-OE_TERMINAL_EXPORTS += "GUILT_BASE KBUILD_OUTPUT"
-GUILT_BASE = "meta"
+OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
 KBUILD_OUTPUT = "${B}"
 
 python () {
-- 
1.7.10.4


