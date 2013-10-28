Return-Path: <eu@felipetonello.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 490206D1AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 18:22:05 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id uz6so4093312obc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 11:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wP+uCcfPO+v1SZUhfI0fTDGZZ8ACqI7EcwmmHZuFlRk=;
	b=IeVE+BcspGxFzZ65WNSH2zGHaZs2mh4Byio3WYIyGFa3nRrggvlFz0gBPpLAwDKn5D
	ERaYW5aRQvV4/uhRZF1mZprJQuJZWyhE5RMvQz7vU6MOxnRC7vI4Os3rnCCmNtTrFn5j
	hee/2MCxjqd/wIvB3Fq7cwrFqk66g8Pa6GO5CGfmLIuxN+wEwf+yku12J+r8Re4FsUTt
	0mklwhrkKj4mLE5Z22vh/ps02RtVpP33Palw879KhZgMYlERInsUZYidwlxgaXw+J57z
	p4vL6qfNgfDebkr1Gh1icgil0ZlsJC1v/MbTVJbchkpn3zrREdpLwF3lCeKh8JPJiZTg
	9Euw==
X-Gm-Message-State: ALoCoQkzk9YwxM/l34ITCYmsYWCEX15WcYOT65VyLhhQt+Vy68hJz+cOzs36tKfRXcoe+2tm/M6j
X-Received: by 10.60.78.227 with SMTP id e3mr15824573oex.5.1382984526795;
	Mon, 28 Oct 2013 11:22:06 -0700 (PDT)
Received: from localhost.localdomain.com (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPSA id hl3sm28417511obb.0.2013.10.28.11.22.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 11:22:05 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 11:22:01 -0700
Message-Id: <1382984521-22179-1-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] psplash: Show psplash before X in reboot/shutdown process
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
X-List-Received-Date: Mon, 28 Oct 2013 18:22:06 -0000

From: "Felipe F. Tonello" <eu@felipetonello.com>

This is interesting because if you shutdown/reboot a device the screen will
flicker because X will be killed and then psplash will take a while to run.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 1cab296..539bf52 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85b
 
 SRCREV = "afd4e228c606a9998feae44a3fed4474803240b7"
 PV = "0.1+git${SRCPV}"
-PR = "r15"
+PR = "r16"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://psplash-init \
@@ -108,4 +108,4 @@ do_install_append() {
 FILES_${PN} += "/mnt/.psplash"
 
 INITSCRIPT_NAME = "psplash.sh"
-INITSCRIPT_PARAMS = "start 0 S . stop 20 0 1 6 ."
+INITSCRIPT_PARAMS = "start 0 S . stop 02 0 1 6 ."
-- 
1.8.3.1


