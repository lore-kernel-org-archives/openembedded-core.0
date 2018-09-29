Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8EF605BE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 02:53:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T2r6a1002459
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 19:53:06 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 19:53:05 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 10:58:34 +0800
Message-ID: <cover.1538189779.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] glibc: refresh patch to also fix qemuppc
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
X-List-Received-Date: Sat, 29 Sep 2018 02:53:05 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 3bbbe25ae74e120f7d3452685f0cae2245d7b14d:

  glibc-package.inc: correct intention for deleting /usr/lib as needed (2018-09-27 23:41:41 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/glibc-qemuppc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/glibc-qemuppc

Chen Qi (1):
  glibc: refresh patch to also fix qemuppc

 ...eee754-prevent-maybe-uninitialized-errors.patch | 41 +++++++++++++++++-----
 1 file changed, 32 insertions(+), 9 deletions(-)

-- 
1.9.1


