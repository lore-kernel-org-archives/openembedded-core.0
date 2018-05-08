Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 29C2174EC4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 08:05:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4885O5m013493
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2018 01:05:45 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 8 May 2018 01:05:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 May 2018 16:07:08 +0800
Message-ID: <cover.1525764187.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] testsdkext: remove workspace/sources to avoid failure in case of multilib
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
X-List-Received-Date: Tue, 08 May 2018 08:05:55 -0000
Content-Type: text/plain

The following changes since commit f301a3bc110608c3684c78dd62e276beea73bd94:

  settings-daemon: Drop pointless apply=yes in SRC_URI (2018-05-04 13:28:06 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/testsdkext-multilib-cleanup
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/testsdkext-multilib-cleanup

Chen Qi (1):
  testsdkext: remove workspace/sources to avoid failure in case of
    multilib

 meta/classes/testsdk.bbclass | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1


