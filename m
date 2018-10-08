Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE00A78493
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 03:32:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w983W2X1012036
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Oct 2018 20:32:12 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 7 Oct 2018 20:31:51 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 7 Oct 2018 20:31:50 -0700
Message-ID: <20181008033151.26867-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [v3 PATCH 0/1] ltp: recent glibc calls syscall directly
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
X-List-Received-Date: Mon, 08 Oct 2018 03:32:22 -0000
Content-Type: text/plain

v3:
    modify commit log with adding recipe name
v2:
    modify the format of [Upstream-Status]

Hongzhi.Song (1):
  ltp: recent glibc calls syscall directly

 ...nfo01-recent-glibc-calls-syscall-directly.patch | 75 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch

-- 
2.11.0


