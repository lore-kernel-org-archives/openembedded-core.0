Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMOTD-0001fF-Tw
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:26:28 +0100
Received: by ywf9 with SMTP id 9so2651180ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 11:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=2CIdC9HIucML0c3xbYZZUUgK9LribaZfd+sj9KdFHMQ=;
	b=q5UgP4iwPV6oDUVmprvPkiUvdBC71S0taeNhdsMis44ZYfzbFrtdoEeTp9pHep36B4
	PUTXM58/R2/JYUEk0y7eqHKczaNqyvXZL/JbC44C46h4jI7PLyaDM3QTGQ7tMzutT9Hy
	TFPndvLJbTZPrEsQf7Sfzlvhhm3eBxxL9AtMw=
Received: by 10.236.155.74 with SMTP id i50mr22694491yhk.23.1320430817572;
	Fri, 04 Nov 2011 11:20:17 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q57sm16408660yhi.22.2011.11.04.11.20.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 11:20:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 18:20:03 +0000
Message-Id: <cover.1320430778.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/5] Misc fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2011 18:26:28 -0000

The following changes since commit e3c003282afb93ec52882496400b042620ab00ef:

  rt-tests: update to 0.83 (2011-11-04 15:43:19 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (5):
  libcap: fix sstate for native package
  files/device_table-minimal.txt: add /dev/kmsg
  dhcp: drop unused dhcp3.inc file
  dhcp: rename dhcp4.inc to dhcp.inc
  dhcp: move server configuration to dhcp-server-config

 meta/files/device_table-minimal.txt                |    1 +
 .../dhcp/{dhcp4.inc => dhcp.inc}                   |   10 +++-
 meta/recipes-connectivity/dhcp/dhcp3.inc           |   49 --------------------
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    4 +-
 meta/recipes-support/libcap/libcap.inc             |   15 +++++-
 meta/recipes-support/libcap/libcap_2.22.bb         |    2 +-
 6 files changed, 24 insertions(+), 57 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp4.inc => dhcp.inc} (91%)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp3.inc

-- 
1.7.2.5



