Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id 747AB60CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:15:03 +0000 (UTC)
Received: from localhost (213.114.79.21) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.279.1; Fri, 10 Jan 2014
	08:14:52 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2014 08:15:01 +0100
Message-ID: <cover.1389338076.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.5.2
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] systemd-compat-units: do not mask real service files
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
X-List-Received-Date: Fri, 10 Jan 2014 07:15:03 -0000
Content-Type: text/plain

systemd-compat-units might mask existing service files.
This occuress if real service files mentioned in SYSTEMD_DISABLED_SYSV_SERVICES
exists in systemd_unitdir/system instead of /etc/systemd/system.

This was discovered when adding dnsmasq to our dora-based builds. The fix itself
is ported to master.
The following changes since commit 1028ac813fa9803ebfff6bcfa7f8b67012609b27:

  sstate: add do_package to the noexec list in setscene_depvalid (2014-01-07 13:58:28 +0000)

are available in the git repository at:

  git://github.com/darander/oe-core systemd-compat-units
  https://github.com/darander/oe-core/tree/systemd-compat-units

Anders Darander (1):
  systemd-compat-units: do not mask available services

 meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.5.2


