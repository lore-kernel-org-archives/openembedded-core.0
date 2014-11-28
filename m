Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36CC5723A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Nov 2014 06:48:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAS6medb029295
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 22:48:40 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 27 Nov 2014 22:48:39 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Nov 2014 01:48:36 -0500
Message-ID: <cover.1417157206.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH 0/2] qt4: allow builds for mips64 but disable webkit for n32
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
X-List-Received-Date: Fri, 28 Nov 2014 06:48:46 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit ff2ff155ea5273b2023a1c9834b13f10249d343f:

  gdk-pixbuf: use ptest-gnome (2014-11-25 12:58:21 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/d_qt4-webkit_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_qt4-webkit_0

Jackie Huang (2):
  Revert "qt4*.bbclass: disable build qt on mips64 with 64 bits
    userspace"
  qt4: disable webkit for mips64 n32 temporarily

 meta/classes/qt4e.bbclass         |    3 ---
 meta/classes/qt4x11.bbclass       |    3 ---
 meta/recipes-qt/qt4/qt4-4.8.6.inc |    5 +++++
 3 files changed, 5 insertions(+), 6 deletions(-)

-- 
1.7.9.5


