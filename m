Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T2mfF-0003ci-2F
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 19:18:21 +0200
Received: by pbcwy7 with SMTP id wy7so5742758pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2012 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1LMUAjkWlQZHEEl18IdQh+gIecC26K3gVlNDVA7CyJk=;
	b=onw+ein6OHM5z1hRRIInzcNOHyODjtG7tNqPU//BAR/LVQln5dAFK/s+TXhWe/EwHZ
	D/Duy+KRYXLmQqgqfaAmuqwwb8f9gbKlGkkcvkxzb9v2Q8eUr3oJW5JpjUFK9MVe12ij
	O3vSmRJYG8qYiH9weizFrHtE5I0OIYVIEw4657QftaSJv+cq/VyBfUdVkl8byfwX0dlt
	ZqxHbF37ewct5rbEDvV3QCA6LijmkRDJqM4nihDIf9Xb16pQHfj2fWOYa6LYh0zsaoSy
	ELJWwRJHgIVdsmKoZIYsa/fLTU0W6ABgbTdjnS0V6bo2QcDVCX+rdB1ZPP1stmAmYTHA
	B1Aw==
Received: by 10.68.197.70 with SMTP id is6mr21023239pbc.64.1345309580060;
	Sat, 18 Aug 2012 10:06:20 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id y11sm7350207pbv.66.2012.08.18.10.06.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 18 Aug 2012 10:06:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2012 10:05:52 -0700
Message-Id: <1345309553-12079-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V2] unifdef-native: Correct LICENSE
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
X-List-Received-Date: Sat, 18 Aug 2012 17:18:22 -0000

The header in sourcefile says its BSD licensed
not GPL therefore make the correction

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unifdef/unifdef-native_2.6.18+git.bb           |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
index 1b93816..141b891 100644
--- a/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
+++ b/meta/recipes-devtools/unifdef/unifdef-native_2.6.18+git.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "Kernel header preprocessor"
 SECTION = "devel"
-LICENSE = "GPL"
+LICENSE = "BSD-3-Clause"
+
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/unifdef.c;endline=32;md5=1a33f5c39aa718a89058721df61979bd"
 
-- 
1.7.9.5



