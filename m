Return-Path: <tgamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80720611D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 18:08:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01QI7v71004921
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 10:08:08 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 26 Feb 2020 10:07:46 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 804F890070F;
	Wed, 26 Feb 2020 10:07:46 -0800 (PST)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Feb 2020 10:07:44 -0800
Message-ID: <20200226180746.121476-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 0/2 v3] Add ptest support for coreutils
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
X-List-Received-Date: Wed, 26 Feb 2020 18:08:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Sample test results:

core-image-minimal:
MACHINE    | PASS | FAIL | SKIP | TOTAL | TIME (m) |
qemux86-64 |  472 |    0 |  143 |   615 |      2.5 |
qemuarm64  |  472 |    0 |  143 |   615 |       51 |

core-image-sato:
MACHINE    | PASS | FAIL | SKIP | TOTAL | Time (m) |
qemux86-64 |  472 |    0 |  143 |   615 |      2.4 |
qemuarm64  |  472 |    0 |  143 |   615 |       52 |


Trevor Gamblin (2):
  coreutils: add ptest
  ptest-packagelists.inc: add coreutils to SLOW list

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../coreutils/coreutils/run-ptest             | 17 +++++++++
 meta/recipes-core/coreutils/coreutils_8.31.bb | 37 +++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest

-- 
2.24.1


