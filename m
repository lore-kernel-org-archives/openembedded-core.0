Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id A97C360155
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 07:31:03 +0000 (UTC)
Received: from localhost (213.114.79.21) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.279.1; Wed, 15 Jan 2014
	08:30:49 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jan 2014 08:30:25 +0100
Message-ID: <cover.1389770944.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.5.2
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] systemd-compat-unts: remove dnsmasq from masked list
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
X-List-Received-Date: Wed, 15 Jan 2014 07:31:05 -0000
Content-Type: text/plain


systemd-compat-units: remove dnsmasq from sysv disabled list
    
The dnsmasq recipe in meta-networking ships a dnsmasq.service file, that will
correctly override the SysV init script. Thus, as pointed out by Ross Burton,
we should remove dnsmasq from the list.


This was discovered when adding dnsmasq to our dora-based builds. The fix itself
is ported to master. Even though our issue is solved by the previous pathc, which
add systemd_unitdir/system as a path to check for service files; dnsmasq should
be removed from the list nevertheless.
The following changes since commit c4c5ec52effc2ff97ac17270c1aa7884c808f5a9:

  dropbear: Refresh pam patch so it applies against recent version (2014-01-14 21:57:18 +0000)

are available in the git repository at:

  git://github.com/darander/oe-core systemd-compat-units
  https://github.com/darander/oe-core/tree/systemd-compat-units

Anders Darander (1):
  systemd-compat-units: remove dnsmasq from sysv disabled list

 meta/recipes-core/systemd/systemd-compat-units.bb | 1 -
 1 file changed, 1 deletion(-)

-- 
1.8.5.2


