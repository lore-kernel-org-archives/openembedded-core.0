Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 01AE76BA11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 08:58:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBS8wxw7010007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 00:58:59 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 28 Dec 2018 00:58:58 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Dec 2018 00:58:57 -0800
Message-ID: <cover.1545987435.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1 V2] runqemu-gen-tapdevs: Allow run --help without sudo
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
X-List-Received-Date: Fri, 28 Dec 2018 08:58:59 -0000
Content-Type: text/plain

* V2:
  - Check SUDO_UID/GID as RP suggested.

* V1:
  - Initial version

The following changes since commit caa776bdcf8ea34c857f45970370bf771075f4bc:

  testimage.bbclass: remove boot parameter systemd.log_target (2018-12-27 22:50:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/tap
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/tap

Robert Yang (1):
  runqemu-gen-tapdevs: Allow run --help without sudo

 scripts/runqemu-gen-tapdevs | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

-- 
2.10.2


