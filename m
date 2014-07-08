Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 503AB70418
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 10:36:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s68AaTeU015291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jul 2014 03:36:29 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Jul 2014 03:36:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jul 2014 18:38:14 +0800
Message-ID: <cover.1404815853.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] populate-extfs.sh: fix to handle special file names correctly
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
X-List-Received-Date: Tue, 08 Jul 2014 10:36:36 -0000
Content-Type: text/plain

The following changes since commit 330c3085317a0b0981163ff5c41c54596e0d127d:

  libtool-cross/native: Force usage of bash due to sstate inconsistencies (2014-07-03 14:55:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/dora-populate-extfs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/dora-populate-extfs

Chen Qi (1):
  populate-extfs.sh: fix to handle special file names correctly

 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |   72 +++++++++++++++-----
 1 file changed, 54 insertions(+), 18 deletions(-)

-- 
1.7.9.5


