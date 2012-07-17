Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrBPK-0003LX-4j
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:17:58 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so511967bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 10:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=9GlI7toUpyr9m9sgJz8YoTrMBQ1WNHUewbJo9yvv+bA=;
	b=Sg2H2neIJk1y1hMvVTZPF++Jnu1OTxjRsFpYYLk3J0sFLdvdHQovuQc34wd7hat9yN
	PMBL7iwer5XUQ8oSP+O5kOlI8TPGKWtyfbkJWERlALZ0/jpxezxhnAJzhh8o3IPyDKBN
	UnzXnrmvpalnB9nt8e47ia3SgIMYF/VvZdtu4TU83sYsZNMtnvs25LF4youo1ouODAol
	OxJTAq0v9gZ2Vodv3qzzS02sDahf9s8FgZTKpgw7khkhTgcR15+3TSpXCmQTYdyL9Qih
	YlPpbkn+aod2Xca5v8jPdrq0mCgmwIE1Ddb9XlqkN4cKWhhM4SdU2jbECQq6duNYs6XB
	4pug==
Received: by 10.205.134.139 with SMTP id ic11mr1770519bkc.40.1342544800715;
	Tue, 17 Jul 2012 10:06:40 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id t23sm10438506bks.4.2012.07.17.10.06.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 10:06:39 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 20:06:29 +0300
Message-Id: <8afb1ea6ef0d40d68203d164a6ad1d0cf45793fd.1342544558.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1342544558.git.andrei@gherzan.ro>
References: <cover.1342544558.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmhKWhHx98OQoauX8izAdXLA8Xtu2GwhPLikeD+W+o4l4reLgE/5+1uhGLA9e+uShjhfUpL
Subject: [PATCH V4 1/4] connman: Update to version 1.3
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
X-List-Received-Date: Tue, 17 Jul 2012 17:17:58 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../connman/{connman_1.0.bb => connman_1.3.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (82%)

diff --git a/meta/recipes-connectivity/connman/connman_1.0.bb b/meta/recipes-connectivity/connman/connman_1.3.bb
similarity index 82%
rename from meta/recipes-connectivity/connman/connman_1.0.bb
rename to meta/recipes-connectivity/connman/connman_1.3.bb
index 926d22e..1e3d138 100644
--- a/meta/recipes-connectivity/connman/connman_1.0.bb
+++ b/meta/recipes-connectivity/connman/connman_1.3.bb
@@ -1,7 +1,7 @@
 require connman.inc
 
-# 1.0 tag
-SRCREV = "6d6f312fb2b751b4cf7037f2a526c7785364732f"
+# 1.3 tag
+SRCREV = "3c0fa84091524c7cd6237744f2088ffee2f1d5ad"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
-- 
1.7.9.5



