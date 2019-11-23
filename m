Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3F07FCD5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 22:18:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xANMIuqP019902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 14:18:56 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 23 Nov 2019 14:18:55 -0800
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 23 Nov 2019 17:18:52 -0500
Message-ID: <20191123221854.1656-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 0/2 v2] add coreutils ptest to oe-core
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
X-List-Received-Date: Sat, 23 Nov 2019 22:18:56 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Sample test results:

core-image-minimal:
MACHINE    | PASS | FAIL | SKIP | TOTAL | TIME (m) |
qemux86-64 |  483 |    0 |  132 |   615 |      3.8 |
qemuarm64  |  483 |    0 |  132 |   615 |       70 |

core-image-sato:
MACHINE    | PASS | FAIL | SKIP | TOTAL | Time (m) |
qemux86-64 |  484 |    0 |  131 |   615 |      3.9 |
qemuarm64  |  484 |    0 |  131 |   615 |       70 |

Trevor Gamblin (2):
  coreutils: add ptest
  ptest-packagelists.inc: add coreutils to SLOW list

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../coreutils/coreutils/run-ptest             | 11 +++++
 meta/recipes-core/coreutils/coreutils_8.31.bb | 40 +++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest

-- 
2.23.0


