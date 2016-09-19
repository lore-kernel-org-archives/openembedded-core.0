Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6FF60110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:20:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8J7K9rU026124
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 00:20:09 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 00:20:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2016 00:20:07 -0700
Message-ID: <cover.1474269586.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] runqemu: acquire_lock() should fail when failed to open the file
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
X-List-Received-Date: Mon, 19 Sep 2016 07:20:11 -0000
Content-Type: text/plain

The following changes since commit d77fe838ab7631a19e90ff4226f0712e54aa4e22:

  scripts: add tool to scan for bashisms recipe shell scripts (2016-09-16 15:19:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rq_lock
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rq_lock

Robert Yang (1):
  runqemu: acquire_lock() should fail when failed to open the file

 scripts/runqemu | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.9.0


