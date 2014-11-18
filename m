Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7175E72142
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 07:23:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAI7N489024688
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 23:23:04 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 17 Nov 2014 23:23:03 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Nov 2014 15:22:53 +0800
Message-ID: <cover.1416295260.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] bison: update to 3.0.2
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
X-List-Received-Date: Tue, 18 Nov 2014 07:23:10 -0000
Content-Type: text/plain

The following changes since commit edaeb8940813b620090a0797ad3b6a076897512d:

  bitbake: cooker.py: fix loginfo op being set to an invalid value (2014-11-12 17:04:50 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/bison
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/bison

Chong Lu (3):
  bison: update to 3.0.2
  gstreamer: change priv_gst_parse_yylex arguments
  webkit-gtk: ANGLE doesn't build with bison 3

 .../bison/bison-do-not-try-to-generate-docs.patch  | 37 ++++++++++++++++++++++
 .../bison/bison/dont-depend-on-help2man.patch      | 32 -------------------
 .../bison/bison/fix_cross_manpage_building.patch   | 19 -----------
 .../bison/{bison_2.7.1.bb => bison_3.0.2.bb}       | 21 ++++++------
 ...mer-change-priv_gst_parse_yylex-arguments.patch | 33 +++++++++++++++++++
 .../gstreamer/gstreamer_0.10.36.bb                 |  1 +
 ...bkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch | 26 +++++++++++++++
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |  1 +
 8 files changed, 108 insertions(+), 62 deletions(-)
 create mode 100644 meta/recipes-devtools/bison/bison/bison-do-not-try-to-generate-docs.patch
 delete mode 100644 meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch
 delete mode 100644 meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch
 rename meta/recipes-devtools/bison/{bison_2.7.1.bb => bison_3.0.2.bb} (70%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstreamer-change-priv_gst_parse_yylex-arguments.patch
 create mode 100644 meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch

-- 
1.9.1


