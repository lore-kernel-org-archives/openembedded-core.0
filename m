Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 62F056BD17
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 11:40:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r82BeRYr005934
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2013 04:40:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 2 Sep 2013 04:40:26 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Sep 2013 19:40:53 +0800
Message-ID: <cover.1378121740.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] busybox & sysklogd: weigh busybox's syslogd/klogd utilities over those from sysklogd in case of systemd
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
X-List-Received-Date: Mon, 02 Sep 2013 11:40:27 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit c7994f83baa678a4670472e1f037bfc16cb1e3be:

  bitbake: runqueue: Fix scenequeue to pass file descriptors, not a float (2013-09-02 09:16:24 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-syslog
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-syslog

Chen Qi (2):
  busybox-syslog: add configuration file /etc/syslog.conf
  sysklogd: lower the ALTERNATIVE_PRIORITY in case of systemd

 meta/recipes-core/busybox/busybox.inc       |    6 +++++-
 meta/recipes-core/busybox/busybox_1.21.1.bb |    1 +
 meta/recipes-core/busybox/files/syslog.conf |    1 +
 meta/recipes-extended/sysklogd/sysklogd.inc |    9 ++++++++-
 4 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/syslog.conf

-- 
1.7.9.5


