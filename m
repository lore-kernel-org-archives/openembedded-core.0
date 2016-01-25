Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id CCE63770DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:32:43 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id s5so57875067qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TNmxUHOmBBCnbtKjCE/JKnBuUe/gzDsMdK/I5icNe0s=;
	b=ZO0ocohd8IXCWRdPRSDtLCrVh4cduF9H0mbFTX4nif63mdFeJ+k0G6EnBMCURBlXrc
	e8ZHGPPy2fojGI/qG9QZLT6Qb7EHbucHbQlQ4MVnLb0sZxAiGqHa2aKYKnMQ48BgM0vO
	cPN5NEeYY+K3ZlUAe21fq4O3UD7keCsmsOVYttK+UTykOR5XdM3u7qo4mTFTX93hn9cN
	ebfMQAM2/5ADI4QbVIamG5O4+OALtTJACjwJi0cEyMvqgmUqS8f4Ih90cdXplINN1b9q
	BAYd81HGbfhrktDmNlr7R46IXiZxiW7gp6FPMQlcQlv2zPUXeF1/pTXx0LsHy49NWieD
	MCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=TNmxUHOmBBCnbtKjCE/JKnBuUe/gzDsMdK/I5icNe0s=;
	b=KeDoWOkOXk7CXuZ7nRSirrrSr2tlviWYoChp9N3Aj8vK6iMNLppvlXewZM9AxPWyOU
	Y+4gogYLTfcTYvWOy6x9zwgIY2KbitNbMC+xONfIy+uT+oyHOr2gg8BGXAxZVqgaynJc
	RStLOTLhIFIs82fsYVGx7Q9tCHagMez2OLZoYnxydHXR/daIHwJFaAUDbXvgKn0I7iJs
	cDXpOgiURdW031vwqweuAngy3JWEh8P2tNwU7jMgfksBfOnndTITMnfcCkm/a/TMpw2p
	m/jqvYgJmu4w3MSuXHNo30x0Ak31O3+ggRhUerP3LncsryiYpBP51UwxYcswk6sf91yc
	X6zw==
X-Gm-Message-State: AG10YOSc7Bdnuvfs2DMoPyESyfgzUg/MzOLTS4qMvWEuiu/UIvJesoyIl29mu1lQbU2crA==
X-Received: by 10.55.209.13 with SMTP id s13mr9919088qki.100.1453746764124;
	Mon, 25 Jan 2016 10:32:44 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm9201586qge.7.2016.01.25.10.32.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:32:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:32:20 +0000
Message-Id: <024e4a066a9ba9ee5333961b46fc6bbb5814d31d.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
References: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
Subject: [PATCH 04/11] pth: Delete
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
X-List-Received-Date: Mon, 25 Jan 2016 18:32:44 -0000

replacement in npth is available in OE-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/pth/pth_2.0.7.bb | 31 -------------------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 meta/recipes-support/pth/pth_2.0.7.bb

diff --git a/meta/recipes-support/pth/pth_2.0.7.bb b/meta/recipes-support/pth/pth_2.0.7.bb
deleted file mode 100644
index 9037769..0000000
--- a/meta/recipes-support/pth/pth_2.0.7.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "GNU Portable Threads library"
-HOMEPAGE = "http://www.gnu.org/software/pth/"
-SECTION = "libs"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;beginline=12;endline=15;md5=a48af114a80c222cafd37f24370a77b1"
-PR = "r3"
-
-python __anonymous () {
-    import re
-    uc_os = (re.match('.*uclibc*', d.getVar('TARGET_OS', True)) != None)
-    if uc_os:
-        raise bb.parse.SkipPackage("incompatible with uClibc")
-}
-
-SRC_URI = "${GNU_MIRROR}/pth/pth-${PV}.tar.gz \
-          file://pth-add-pkgconfig-support.patch \
-          file://pth-fix-parallel.patch \
-          "
-
-SRC_URI[md5sum] = "9cb4a25331a4c4db866a31cbe507c793"
-SRC_URI[sha256sum] = "72353660c5a2caafd601b20e12e75d865fd88f6cf1a088b306a3963f0bc77232"
-
-BINCONFIG = "${bindir}/pth-config"
-
-inherit autotools binconfig-disabled pkgconfig
-
-do_configure() {
-	( cd ${S}; gnu-configize )
-	( cd ${S}; autoconf )
-	oe_runconf
-}
-- 
2.7.0


