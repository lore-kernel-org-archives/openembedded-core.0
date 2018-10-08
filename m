Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 290CF78F79
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 11:02:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y11-v6so9579826wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 04:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Jyp3gS6GMY4sqDG6hAGQxkpF42wG29NEEpYuwABjT3U=;
	b=dSJL9JxbtmnSroJgv423Ibfd/cDOWURU3iIhCJieYFwgmNdowftiUZtV+00OUs4Uax
	CI9vNUinXWe6MUn4gMxiyj9U9rBCYvIMU9HIYpJ1jxcYM8IDJ0xv9rEFgENNNcOcsj/x
	yyiiqzS1jmufKScEMpEbc7ta9cLf9g8hQbDqCDXkMyElaQfayQA+hz9zXVsjEN9Jslsi
	ZtxC2Ut17q491s8CZ63jqUaQVdLx49zCbxbQGCXhyO7rUsinfpzAxIju3CiC/OeUND1i
	n7WRiOf+o7cumait3wgiM4uqkD+6QNLnuYDseLpLe2hJnOto8xIIqeQKsnW9EhdjRxvg
	xDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Jyp3gS6GMY4sqDG6hAGQxkpF42wG29NEEpYuwABjT3U=;
	b=Exyozc6H9Y429+whIWMitysCuQaa9gsJBsFLa2ZCAPxpi+5QsJS1K/3KrDEXtAJJhK
	wdEUU/pxzf2Ism6v2qhfPvJ0/hYu/Fr4G8b8ZhMyDnekEaI4M0ZlGpoF/WsVw2Ox7228
	anNi9K0OGo92UwtGwaSC86/w4jfINIAjd6/fY3GLqCV/nyyboGEoLw/9GO/kuYN1T8RG
	1llY/A7IPphHOReED/q6h8sT31D5Be06q8TaPCCsez9cdiQGTf4zEKZ4u/Cii9bHUis/
	bx/Cds51otpQ74rJt0+zqqiQVXfVaqGfzgHiCYtsbcA9dBLI3wFpXzXsT4MYUd2Uj2dj
	e9pw==
X-Gm-Message-State: ABuFfogdCye/SFyz6PYLzk50bSPWTeX1OHPB6hCx7gl+/XGN+sF4ZKHd
	Uw5iWt7nBd/mVMp4xXCdW4K74Y6hiBc=
X-Google-Smtp-Source: ACcGV61ncWHZxenS2a4vnHltHDTK5xj32/pJo/7BTVLWLkgBELGm4uf4vKxwFSDzUvoIMMmKJfH3Mg==
X-Received: by 2002:a5d:614c:: with SMTP id
	y12-v6mr15572312wrt.141.1538996538544; 
	Mon, 08 Oct 2018 04:02:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b139-v6sm22829501wmd.36.2018.10.08.04.02.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 04:02:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2018 12:02:16 +0100
Message-Id: <20181008110216.30768-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] connman: update patch status
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
X-List-Received-Date: Mon, 08 Oct 2018 11:02:18 -0000

These patches are all upstream now, so mark as Backport.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman/includes.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman/includes.patch b/meta/recipes-connectivity/connman/connman/includes.patch
index dcce5bea122..9f7395cbbbb 100644
--- a/meta/recipes-connectivity/connman/connman/includes.patch
+++ b/meta/recipes-connectivity/connman/connman/includes.patch
@@ -1,6 +1,6 @@
 Fix various issues which cause problems under musl.
 
-Upstream-Status: Submitted
+Upstream-Status: Backport [bd1326ba7d68df38c5ccaafd2403a5fb30bd452b]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 From 630516bcc0233b047f65665c003201ba6e77453d Mon Sep 17 00:00:00 2001
-- 
2.11.0


