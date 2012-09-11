Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBU-0001ke-Fl
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:44 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:06 -0700
Received: by mail-wi0-f171.google.com with SMTP id hq4so3527991wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=TkWVGQG7W2VDbDaE+2lWwXuVUxB9b1QRAhn99t/XSRY=;
	b=TCTwRMgZ4O5B135FBG3jgvl9cUJ6aNJWR8Pti9UJWkeeN1T9c1/1j7TP9R00CYcpDJ
	Ad/HTGI3eBrussbJkBtf9tNo8SnKbV7SDQXY3+/jaKkpauL1VAqCx6lG9rrXCbTVAlti
	vkBhtoXmj1p0GBnwt4ZYeSwEf6tfKodCf+Elzf5zTDEx7pgBkg16EO6LDLaysWHERm+o
	X3io/CN2vnCaEHPb/aB+jNrHEA2p8E23/3gvs37gAqg3u690OqKABWesNURWkoxfMcjQ
	Gs/nEQTvX5C5BLh4Yn4ptv5kA0KlVjoX+tSDA1lGziRb9dpgs2W3Pe5ST97+tegfzFTZ
	xP7A==
Received: by 10.180.104.197 with SMTP id gg5mr27165211wib.9.1347391154134;
	Tue, 11 Sep 2012 12:19:14 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:18:01 +0100
Message-Id: <1347391088-30390-11-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkdgAtyAjjBEzEs7wMzpZPvWExW2SQie6w3lYTxmq9KNDFSEvN0Gx4LCAixp6hEzm/lcLLf
Subject: [RFC 11/18] libx11-diet: remove statements that are redundant
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 19:31:44 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index 50000ab..cb9a5ef 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -3,7 +3,7 @@ require libx11.inc
 DESCRIPTION += " Support for XCMS and XLOCALE is disabled in \
 this version."
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://X18NCMSstubs.diff \
@@ -18,8 +18,4 @@ RPROVIDES_${PN}-locale = "libx11-locale"
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
 
-FILESDIR = "${@os.path.dirname(d.getVar('FILE', True))}/libx11"
-
 EXTRA_OECONF += "--disable-xlocale"
-CFLAGS += "-D_GNU_SOURCE"
-
-- 
1.7.10



