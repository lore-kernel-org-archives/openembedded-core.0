Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D94FE7F9A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:43:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xALHhJKl009013
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 09:43:20 -0800 (PST)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 21 Nov 2019 09:43:19 -0800
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2019 12:43:17 -0500
Message-ID: <20191121174318.4512-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 0/1] Adding coreutils ptest to oe-core
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
X-List-Received-Date: Thu, 21 Nov 2019 17:43:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Add ptests for coreutils, but omit the most expensive tests.

core-image-minimal:

MACHINE    | PASS | FAIL | SKIP | TOTAL |
qemux86-64 |  481 |    2 |  132 |   615 |
qemuarm64  |  481 |    2 |  132 |   615 |

core-image-sato:

MACHINE    | PASS | FAIL | SKIP | TOTAL |
qemux86-64 |  483 |    1 |  131 |   615 |
qemuarm64  |  483 |    1 |  131 |   615 |


Trevor Gamblin (1):
  coreutils: add ptest

 .../coreutils/coreutils/run-ptest             | 17 +++++++++
 meta/recipes-core/coreutils/coreutils_8.31.bb | 38 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest

-- 
2.23.0


