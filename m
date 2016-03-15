Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1D0E6FF01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 07:13:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2F7DaF8006162
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 00:13:37 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 15 Mar 2016 00:13:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Mar 2016 15:13:45 +0800
Message-ID: <cover.1458025958.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] openssl: don't move libcrypto to base_libdir
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
X-List-Received-Date: Tue, 15 Mar 2016 07:13:39 -0000
Content-Type: text/plain

Changes since V1:
Rebased against latest master

The following changes since commit 300f858ba07c938427ccd05a3d7220027a03d461:

  local.conf.sample: Disable prelink by default (2016-03-13 22:08:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/openssl-libcrypto
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/openssl-libcrypto

Chen Qi (1):
  openssl: don't move libcrypto to base_libdir

 meta/recipes-connectivity/openssl/openssl.inc | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

-- 
1.9.1


