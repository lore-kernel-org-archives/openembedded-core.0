Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id A20AB739C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 15:50:43 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 16:50:41 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 01B9D2800CB;
	Thu, 12 Mar 2015 16:50:41 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Mar 2015 16:50:35 +0100
Message-ID: <1426175440-16095-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 0/5] remove unnecessary 'protocol=git' from SRC_URI
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
X-List-Received-Date: Thu, 12 Mar 2015 15:50:45 -0000
Content-Type: text/plain

Update the following recipes by removing unnecessary 'protocol=git'
from SRC_URI

Maxin B. John (5):
  u-boot-fw-utils: remove unnecessary 'protocol=git' from SRC_URI
  u-boot-mkimage: remove unnecessary 'protocol=git' from SRC_URI
  systemd: remove unnecessary 'protocol=git' from SRC_URI
  mmc-utils: remove unnecessary 'protocol=git' from SRC_URI
  trace-cmd: remove unnecessary 'protocol=git' from SRC_URI

 meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.01.bb | 2 +-
 meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb  | 2 +-
 meta/recipes-core/systemd/systemd_219.bb           | 2 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb         | 2 +-
 meta/recipes-kernel/trace-cmd/trace-cmd.inc        | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.1


