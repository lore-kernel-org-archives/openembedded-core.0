Return-Path: <moritz.blume@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id D04576AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 15:50:10 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:50153
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Moritz.Blume@bmw-carit.de>)
	id 1Z7QSZ-0005Ji-2N for openembedded-core@lists.openembedded.org;
	Tue, 23 Jun 2015 17:50:03 +0200
Received: from localhost (192.168.101.32) by Exchange2010.bmw-carit.intra
	(192.168.100.28) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Tue, 23 Jun 2015 17:50:03 +0200
X-CTCH-RefID: str=0001.0A0C0205.5589802B.01F0, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Moritz Blume <moritz.blume@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2015 17:50:00 +0200
Message-ID: <cover.1435073627.git.moritz.blume@bmw-carit.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.101.32]
Subject: [PATCH v5 0/2] cmake: Upgrade 2.8.12.2 -> 3.2.2
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
X-List-Received-Date: Tue, 23 Jun 2015 15:50:11 -0000
Content-Type: text/plain

The changes to the cmake.bbclass file were removed, the absolute
compiler path is not necessary.

Moritz Blume (2):
  cmake: Whitespace fix
  cmake: Upgrade 2.8.12.2 -> 3.2.2

 meta/classes/cmake.bbclass                         |  2 +-
 .../cmake/cmake-native_2.8.12.2.bb                 | 19 ------
 meta/recipes-devtools/cmake/cmake-native_3.2.2.bb  | 19 ++++++
 meta/recipes-devtools/cmake/cmake.inc              | 12 ++--
 .../cmake/cmake/cmake-2.8.11.2-FindFreetype.patch  | 47 ---------------
 .../cmake/cmake/qt4-fail-silent.patch              | 30 ++++++++--
 .../cmake/cmake/support-oe-qt4-tools-names.patch   | 70 ++++++++++------------
 meta/recipes-devtools/cmake/cmake_2.8.12.2.bb      | 52 ----------------
 meta/recipes-devtools/cmake/cmake_3.2.2.bb         | 56 +++++++++++++++++
 9 files changed, 140 insertions(+), 167 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_3.2.2.bb
 delete mode 100644 meta/recipes-devtools/cmake/cmake/cmake-2.8.11.2-FindFreetype.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake_3.2.2.bb

-- 
1.9.1


