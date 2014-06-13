Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62F656FD10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 05:41:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5D5fOxE022993
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 22:41:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 12 Jun 2014 22:41:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jun 2014 13:42:32 +0800
Message-ID: <cover.1402638116.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] busybox: handle syslog related files properly
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
X-List-Received-Date: Fri, 13 Jun 2014 05:41:27 -0000
Content-Type: text/plain

The following changes since commit d20d3476157b7c949b0077cad0ab1e8716d6162a:

  rpm: Fix cpio 32 bit overflow issues on 64 bit inode filesystems (2014-06-12 17:45:48 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/busybox-syslog
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/busybox-syslog

Chen Qi (1):
  busybox: handle syslog related files properly

 meta/recipes-core/busybox/busybox.inc |   25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

-- 
1.7.9.5


