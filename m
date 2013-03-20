Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UIEHL-0006jL-Ni
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 09:22:12 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2K84vEo013119
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 01:04:57 -0700 (PDT)
Received: from pek-usp-9.wrs.com (128.224.162.26) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Mar 2013 01:04:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2013 15:49:32 +0800
Message-ID: <51b14337a2697ff9b0884cf5ff8ec5a423eb4fa1.1363765543.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1363765543.git.liezhi.yang@windriver.com>
References: <cover.1363765543.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] perl-native: remove duplicated LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 20 Mar 2013 08:24:34 -0000
Content-Type: text/plain

Remove duplicated LIC_FILES_CHKSUM:
LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                   file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"

[YOCTO #4064]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/perl/perl-native_5.14.3.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.14.3.bb b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
index 58bb916..9f0b8a1 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.3.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "Perl is a popular scripting language."
 HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0"
-LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
-		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
 PR = "r0"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
-- 
1.7.7



