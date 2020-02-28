Return-Path: <tgamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 792F861962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 14:49:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01SEnT0P019599
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 06:49:30 -0800 (PST)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 28 Feb 2020 06:49:29 -0800
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 635A39007B4;
	Fri, 28 Feb 2020 06:49:29 -0800 (PST)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Feb 2020 06:49:27 -0800
Message-ID: <20200228144929.164927-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 0/2 v4] Add ptest support for coreutils
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
X-List-Received-Date: Fri, 28 Feb 2020 14:49:29 -0000
Content-Type: text/plain

v4 fixes a multilib issue - do_install_ptest was previously
using sed to make the d_type-check test point at python3 
instead of python, but hard-coded the path for the test file.

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


