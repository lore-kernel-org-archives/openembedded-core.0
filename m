Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 07B26729A9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 22:12:07 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id bs8so6526573wib.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 14:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YbJ8FPQUXeCEfsOp9FWAzbL+9ZU7o2QVBAdSTIWa4Cg=;
	b=UwoKrGMFzShM5jqoKNMUfNd5YzGDSLibvlTpjpG+UAKF7oF12AckHbSuiy1HKV47jP
	cDeXvnN+Bhsrc6rVMVMcJPxGO0Oxebj8mJCPwgxmhvh3neySiO/1/NZYBX17zCfqExl/
	hLoM1KKPUN55hJiWb55LKw1HChqXXtNWPDOslGiE6fbP0fxmIFvbEcM5HP9OpDOxBbSE
	9Xam9DRvvg9l3GoTt1y2J8MouRg+Yquvx5peOzR4Q12iTeRiJnNltn6rXLhEOJJLbNi4
	uSUCJQ5dHCNC6pWSxZTEVFmz+5ce/ggZpr79s40GzWSZGlfNAF7OUJohS+Pz9+ejIPUX
	psQQ==
X-Received: by 10.180.103.33 with SMTP id ft1mr5433621wib.19.1419199928078;
	Sun, 21 Dec 2014 14:12:08 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id
	kn5sm21350509wjb.48.2014.12.21.14.12.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Dec 2014 14:12:07 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 22:11:50 +0000
Message-Id: <1419199917-27913-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
References: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 1/8] opkg-collateral: Use new lists_dir syntax
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
X-List-Received-Date: Sun, 21 Dec 2014 22:12:08 -0000

Since opkg v0.2.3, it has been possible to use the new syntax for the
'lists_dir' option in an opkg configuration file. From v0.3.0, this new syntax
is required. The new syntax matches the way other options are set.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg-collateral.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg-collateral.bb b/meta/recipes-devtools/opkg/opkg-collateral.bb
index b121827..3825ffb 100644
--- a/meta/recipes-devtools/opkg/opkg-collateral.bb
+++ b/meta/recipes-devtools/opkg/opkg-collateral.bb
@@ -13,7 +13,7 @@ do_compile () {
 	cat ${WORKDIR}/opkg.conf.comments >${WORKDIR}/opkg.conf
 	cat ${WORKDIR}/src	>>${WORKDIR}/opkg.conf
 	cat ${WORKDIR}/dest	>>${WORKDIR}/opkg.conf
-	echo "lists_dir ext ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf
+	echo "option lists_dir ${OPKGLIBDIR}/opkg" >>${WORKDIR}/opkg.conf
 }
 
 do_install () {
-- 
1.9.1


