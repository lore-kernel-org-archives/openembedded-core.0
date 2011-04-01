Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1x-0005GC-7z
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:32:17 +0200
Received: by mail-yw0-f47.google.com with SMTP id 8so1292687ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=84ktQCfV2WmVeC7IbavD5EDZwqdWQYfFNyRVYnW+FCI=;
	b=fg3nUPYx0l+ohc9rH6iUt+FTUviNtJY0rnCr1mVm3S1YVc34mqVuE+XMWCUBclSl5W
	EBsrl7q331kUV7g7nDYCOmXEgrGYDqBXiuURebWAUws+Jta2m10A+i050zw7K4PJAHbB
	TrW+GuCCHVO0/TD4NZ/+UEq8AWHMcQn2iQJrU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BBunH49NEfM3LS3z2Gf7o2MdVpSL1p+MUcxTtDgcqdVeJrSF4RigNBonQHZxmz1JYP
	5TMJfM0nQAjCvu05WbCBRNW6TWDIr2uULq96HiWd8KmM8XBcs8RjhuOw6N2/tUgBDnu6
	Df9g7yY6Zgo965BwFHWeczKps0jpIZoQnwtsg=
Received: by 10.236.154.169 with SMTP id h29mr5054079yhk.3.1301632218509;
	Thu, 31 Mar 2011 21:30:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id h44sm946397yhm.63.2011.03.31.21.30.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:30:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:30:09 -0700
Message-Id: <a81ee99573fd5e56198117bd7e80d856fb8911c2.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 36/46] libgdata_0.7.1.bb: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:32:17 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/gnome/libgdata_0.7.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/libgdata_0.7.1.bb b/meta/recipes-gnome/gnome/libgdata_0.7.1.bb
index c332994..c3f4047 100644
--- a/meta/recipes-gnome/gnome/libgdata_0.7.1.bb
+++ b/meta/recipes-gnome/gnome/libgdata_0.7.1.bb
@@ -7,9 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
                     file://gdata/gdata.h;endline=20;md5=079a554efcf65d46f96a515806e7e99a \
                     file://gdata/gdata-types.h;endline=20;md5=7399b111aac8718da13888fc634be6ef"
 
-DEPENDS = "gettext libxml2 glib-2.0 libsoup-2.4"
+DEPENDS = "libxml2 glib-2.0 libsoup-2.4"
 
-inherit gnome pkgconfig autotools
+inherit gnome pkgconfig autotools gettext
 
 SRC_URI[archive.md5sum] = "ec5262cbcb07b63b58d45aa3ac636096"
 SRC_URI[archive.sha256sum] = "fb244138276a5ce98510b0e2408bbf6f9ce0fd8cdcf86f07cd4be38afbb7c2bc"
-- 
1.7.4.1



