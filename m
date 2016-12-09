Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D15D71CB7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 07:42:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB97g5Te027907
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2016 23:42:06 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Dec 2016 23:42:04 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Dec 2016 15:43:02 +0800
Message-ID: <cover.1481269071.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Use weak assignment for SERIAL_CONSOLES in qemu configuration files
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
X-List-Received-Date: Fri, 09 Dec 2016 07:42:06 -0000
Content-Type: text/plain

The following changes since commit ad00a31fbe93e073a2d83616efcd08c5a7ef37c9:

  gdb-cross-canadian: Depend on nativesdk-python3-importlib (2016-12-08 10:26:15 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/qemu-console
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/qemu-console

Chen Qi (1):
  Use weak assignment for SERIAL_CONSOLES in qemu configuration files

 meta/conf/machine/qemuarm.conf    | 2 +-
 meta/conf/machine/qemuarm64.conf  | 2 +-
 meta/conf/machine/qemumips.conf   | 2 +-
 meta/conf/machine/qemumips64.conf | 2 +-
 meta/conf/machine/qemuppc.conf    | 2 +-
 meta/conf/machine/qemux86-64.conf | 2 +-
 meta/conf/machine/qemux86.conf    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

-- 
1.9.1


