Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOuqV-0002aW-29
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:57:11 +0200
Received: by mail-pz0-f50.google.com with SMTP id h32so4082870dak.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 10:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=i1A4M046YtCTV1D11hd60Lq9f1OB1K7XcfHF4UwkYBM=;
	b=zBNLernEw5IzXYJdUMMqJdkzSA7bSoGGB49zLdA78DeE0DnJVSHUtw+VKVRXwk8wzH
	gQCoW8fxv4PYyyOejAQ7DSPMM1Hyf9DrCyrigRobIXoUkirPRhWseDz5yolf3CO6nB4R
	XgagN/XLh1sT4LM2CbAAy6AT2BwjG6PRpUoe/atfVVwsQlG3kKTkMzGyIPXmBgkN83o7
	RKZDfYP5PqJ2JsU1H4lBnHnqELRpznkmy4AYgPRX8FQg5NQDkhJTRvv8f9YVOn2232aQ
	zQUow9VCj85vBU8yz2jS/Cskb53qx9edABsZvD5MYG8y3q0ouw+fiLSY8dCfmoBaXNrq
	fJWQ==
Received: by 10.68.125.138 with SMTP id mq10mr18133720pbb.51.1335808050889;
	Mon, 30 Apr 2012 10:47:30 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sx8sm8239860pbc.53.2012.04.30.10.47.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 10:47:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 10:46:23 -0700
Message-Id: <7cf357ebeb15ca33e231e403ac47c0cbd5e0524e.1335807802.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
References: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335807802.git.raj.khem@gmail.com>
References: <cover.1335807802.git.raj.khem@gmail.com>
Subject: [PATCH 08/10] pcmanfm: Add sh3/sh4 to supported hosts
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
X-List-Received-Date: Mon, 30 Apr 2012 17:57:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
index e62cb0d..545367a 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
@@ -13,7 +13,7 @@ DEPENDS_append_poky = " libowl"
 
 PR = "r0"
 
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|mips.*|powerpc.*)-(linux|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
 	   file://gnome-fs-directory.png \
-- 
1.7.5.4



