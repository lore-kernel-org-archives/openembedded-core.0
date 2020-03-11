Return-Path: <tgamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0718E61B8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:33:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02BBWjVF012390
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 11 Mar 2020 04:32:55 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 11 Mar 2020 04:32:35 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 21FE5900AA6;
	Wed, 11 Mar 2020 04:32:35 -0700 (PDT)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2020 04:32:33 -0700
Message-ID: <20200311113235.61655-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 0/2 v5] coreutils: add ptest support
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
X-List-Received-Date: Wed, 11 Mar 2020 11:33:27 -0000
Content-Type: text/plain

Note that this patch set does not include Richard's "coreutils hack" 
patch, so that will have to be added on top (as discussed in #yocto).

Sample test results:

core-image-minimal:
MACHINE    | PASS | FAIL | SKIP | TOTAL | TIME (m) |
qemux86-64 |  470 |    0 |  144 |   614 |      2.5 |
qemuarm64  |  470 |    0 |  144 |   614 |       51 |

core-image-sato:
MACHINE    | PASS | FAIL | SKIP | TOTAL | Time (m) |
qemux86-64 |  472 |    0 |  142 |   614 |      2.4 |
qemuarm64  |  472 |    0 |  142 |   614 |       52 |

Trevor Gamblin (2):
  coreutils: add ptest
  ptest-packagelists.inc: add coreutils to SLOW

 .../distro/include/ptest-packagelists.inc     |  1 +
 .../coreutils/coreutils/run-ptest             | 17 +++++++
 meta/recipes-core/coreutils/coreutils_8.31.bb | 44 +++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100755 meta/recipes-core/coreutils/coreutils/run-ptest

-- 
2.17.1


