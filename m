Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7116BBDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 02:13:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2K2DiIg009578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 19:13:44 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 19 Mar 2014 19:13:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2014 10:19:02 +0800
Message-ID: <cover.1395281861.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/4] upgrade 4 recipes
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
X-List-Received-Date: Thu, 20 Mar 2014 02:13:46 -0000
Content-Type: text/plain

Hi Saul and RP:

I've test these upgrade on my local AB, they worke well.

// Robert

The following changes since commit ef196434620522affc11b5b1b867386b5d14a4c3:

  alsa-tools: fix build when x11 and gtk+ not available (2014-03-19 14:41:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/up
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/up

Robert Yang (4):
  file: upgrade from 5.16 to 5.17
  wget: upgrade from 1.14 to 1.15
  automake: upgrade from 1.14 to 1.14.1
  mklibs-native: upgrade from 0.1.38 to 0.1.39

 .../{automake_1.14.bb => automake_1.14.1.bb}       |  4 +-
 .../file/{file_5.16.bb => file_5.17.bb}            |  4 +-
 ...bs-native_0.1.38.bb => mklibs-native_0.1.39.bb} |  8 +--
 meta/recipes-extended/wget/wget-1.14/fix_doc.patch | 71 ----------------------
 meta/recipes-extended/wget/wget.inc                |  1 +
 .../wget/{wget-1.14 => wget}/fix_makefile.patch    |  0
 meta/recipes-extended/wget/wget_1.14.bb            | 10 ---
 meta/recipes-extended/wget/wget_1.15.bb            |  7 +++
 8 files changed, 16 insertions(+), 89 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.14.bb => automake_1.14.1.bb} (89%)
 rename meta/recipes-devtools/file/{file_5.16.bb => file_5.17.bb} (86%)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.38.bb => mklibs-native_0.1.39.bb} (73%)
 delete mode 100644 meta/recipes-extended/wget/wget-1.14/fix_doc.patch
 rename meta/recipes-extended/wget/{wget-1.14 => wget}/fix_makefile.patch (100%)
 delete mode 100644 meta/recipes-extended/wget/wget_1.14.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.15.bb

-- 
1.8.3.1


