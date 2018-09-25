Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32AD7605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 07:02:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8P731GI013572
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 00:03:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 00:03:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Sep 2018 15:08:24 +0800
Message-ID: <cover.1537859224.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] runqemu: fix handling of SIGTERM and the problem of line wrapping
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
X-List-Received-Date: Tue, 25 Sep 2018 07:03:00 -0000
Content-Type: text/plain

Changes in V2:
* Change to get rid of shell=True

The following changes since commit c6edf2f8bc5778b267e3a7f4e8875d22f359fb8d:

  build-appliance-image: Update to master head revision (2018-09-24 12:31:33 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/runqemu-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/runqemu-fix

Chen Qi (1):
  runqemu: fix handling of SIGTERM and the problem of line wrapping

 scripts/runqemu | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
1.9.1


