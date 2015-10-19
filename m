Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 840E175D48
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 10:13:04 +0000 (UTC)
Received: by lffz202 with SMTP id z202so24674704lff.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 03:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=schlHSpgS2W7Uuw2XGYjBb8skO07aFaPuwrDLNTQlIM=;
	b=J3LYhwpio8E4fhzuhhQcTzPSESS6qan1WORkn0dIMpgMiIVCyCtLk2MGfuynrzEdGG
	OoFo9qqXZNsXTmZHd3vz95j6Ww/WZBbEVRlgaiieyoVLP07R8jNsFPmfHP6+fj0cJnC7
	6jlZq/iB6Faat6kUS8+us4KXvZ8xEk5VEwMYMesK8z6GKn4hXEt+yeQ4fKjIctq2bW8t
	Z46L9anBI0SKsgwg9jhZk+5aujCSwBm13X12lyXHEk6xF88TPdDZohGRzPxjr2Nyf4A7
	+78kyEa74idXO/Fn8wQxFBK5o5I+eIDiV8moaHn4cU3M5dcMJy38RbY1NZaULfDVLsRB
	jdhQ==
X-Gm-Message-State: ALoCoQnjLPTFMxsZ4tZAfEhIITCt5r7xRCTJVw1iCkLUEyS66EG02HEv47rEVgzH7y+gWOoGTgW8
X-Received: by 10.180.208.103 with SMTP id md7mr18750653wic.47.1445249584080; 
	Mon, 19 Oct 2015 03:13:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	he3sm39245624wjc.48.2015.10.19.03.13.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 03:13:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 11:05:28 +0100
Message-Id: <1445249129-1475-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
References: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] sanity: check that the host has file installed
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
X-List-Received-Date: Mon, 19 Oct 2015 10:13:05 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 34f8618..a1fed36 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -3,7 +3,7 @@
 #
 
 SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
-    gzip gawk chrpath wget cpio perl"
+    gzip gawk chrpath wget cpio perl filex"
 
 def bblayers_conf_file(d):
     return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
-- 
2.1.4


