Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SU5VD-0006wF-UV
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 02:20:36 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so5997243pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 17:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=f9gklEgwCJvTTzrpZMDMfitTf08x/LttJijtyLKUxRE=;
	b=Em2a/Xt5fraO+6br/uwQ3H8Ut2ch7AqXX6AjTP1dODp9h5HUCgdwRzd8Y/UuXeneAA
	fTRaDEzCmfq1QVOL65YW2tOKJXsxzKu24Cwwi1E0Cs6K30uZjEhn4u1P3v4YL8SASeii
	9zjf+ABwkJtkaHKcmaIhbJ3OV8XdxO8zHhMzX0BKCoAdUcVs+u6r3az9r9ZJX6nRBfy+
	p/NkOJsZ/hcC+Kjs5GigQSmi1WEDWZXSS4xGCEcpmW66AnVNp/8w8k6RL9c/8EYiPo8x
	8OtR0cSJfumalRgv/oTJGW7g4sDRNf8/1ylX+1nAJmKFgQZCgpC76oa7gdRjTxNi5F3B
	d46w==
Received: by 10.68.217.38 with SMTP id ov6mr27798875pbc.25.1337040638414;
	Mon, 14 May 2012 17:10:38 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id ql3sm14221525pbc.72.2012.05.14.17.10.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 17:10:37 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2012 17:10:34 -0700
Message-Id: <2550536d7f78d76e58a7378cd57b557078979340.1337040537.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1337040537.git.dvhart@linux.intel.com>
References: <cover.1337040537.git.dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQkk1oY1hxxnSZgpPHOPcMy6LrBp+cVDctfceWofE8qsuOO6o32a9axqrvFH6CfIu9XcyuGh
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] ofono: Add python-pygobject to ofono-tests package DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2012 00:20:36 -0000

Some of the ofono-tests python scripts, such as test-modem and
receive-sms (22 in total) import gobject. Make the ofono-tests package
depend on python-pygobject.

Tested on the meta-intel fri2 BSP in a core-image-sato image. Assorted
ofono tests run correctly.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index f4b2317..573c778 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -21,4 +21,4 @@ PACKAGES =+ "${PN}-tests"
 
 FILES_${PN} += "${base_libdir}/udev ${systemd_unitdir}"
 FILES_${PN}-tests = "${libdir}/ofono"
-RDEPENDS_${PN}-tests = "python"
+RDEPENDS_${PN}-tests = "python python-pygobject"
-- 
1.7.5.4



