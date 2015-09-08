Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6A765C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:10:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t88AApus027923
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 03:10:51 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 03:10:51 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Sep 2015 18:05:26 +0800
Message-ID: <cover.1441706663.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Upgrade gdk-pixbuf from 2.30.8 to 2.31.7
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
X-List-Received-Date: Tue, 08 Sep 2015 10:10:56 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit c1df471feacaf2590216aa476ce242908dac38cf:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-06 15:26:27 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/gdk-pixbuf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/gdk-pixbuf

Kai Kang (1):
  gdk-pixbuf: 2.30.8 -> 2.31.7

 ...ps-Be-more-careful-about-integer-overflow.patch | 89 ----------------------
 .../{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.31.7.bb} |  5 +-
 2 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.31.7.bb} (93%)

-- 
1.9.1


