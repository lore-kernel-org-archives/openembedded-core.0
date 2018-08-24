Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2F030795AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 07:06:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7O76qUB025918
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 00:06:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 00:06:52 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2018 14:29:23 +0800
Message-ID: <cover.1535092036.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH 0/1] sstate.bbclass: make SSTATE_PRUNE_OBSOLETEWORKDIR could be overwritten
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
X-List-Received-Date: Fri, 24 Aug 2018 07:06:52 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit bd374216048581bcb3ea54d69998342525cf2da5:

  util-linux: upgrade 2.32 -> 2.32.1 (2018-08-23 18:02:23 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/sstate_prune
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/sstate_prune

Kai Kang (1):
  sstate.bbclass: make SSTATE_PRUNE_OBSOLETEWORKDIR could be overwritten

 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.18.0


