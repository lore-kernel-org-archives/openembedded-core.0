Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2658F60053
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 05:39:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t895d3Vd020348
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 22:39:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 22:39:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Sep 2015 13:40:02 +0800
Message-ID: <cover.1441777155.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: chi.xu@windriver.com
Subject: [PATCH 0/1] bind: fix compile failure when building path is long
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
X-List-Received-Date: Wed, 09 Sep 2015 05:39:05 -0000
Content-Type: text/plain

The following changes since commit 8402958cd2cb87b8283c8ee4e2d08e1a6717d67a:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-06 15:24:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/bind-long-path
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/bind-long-path

Chen Qi (1):
  bind: fix compile failure when building path is long

 ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 25 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P3.bb   |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch

-- 
1.9.1


