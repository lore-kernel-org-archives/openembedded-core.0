Return-Path: <toshikazu-n@nec.com>
X-Greylist: delayed 428 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Mar 2020 07:47:12 UTC
Received: from esa15.hc221-79.ap.iphmx.com (esa15.hc221-79.ap.iphmx.com
	[139.138.31.214])
	by mail.openembedded.org (Postfix) with ESMTP id 5BEC761077
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 07:47:12 +0000 (UTC)
IronPort-SDR: Wv/pXGDjIK59/P0YtARzEx0VUdkzlQJqMZKO1EZ1p6PAifHke26BISxvQTi3TwiQuAWGb8wOp7
	lkVn9FoRM0kz72F10QK2Y/GrPRe3QKb/Y4fkgKCnO+3mlm2o7e8EYrpVSscrcLBi4pj7m5VBYf
	+VZv+HKyeO6Z77yFmsEjcbSsP3q9iUArwhZn3jTVLPfygMr5MYlSjdh14ap7lIqLhSOhVXpyX1
	xPC1XjFIDKJC4zD1u+MbEuYG3fQkkPqSAqJHe4keVg1+h6XCVMrmG93ZqMMmcJZk3+nOU3FHBq
	fH4=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FOAQAT8mVe/68jj9JkHQEBAQkBEQU?=
	=?us-ascii?q?FAYFqBQELAYIogUEBATCNQqNOCQEBAQ4vBAEBhEOCESQ3Bg4CAwEBAQMCBQE?=
	=?us-ascii?q?BBgEBAQEBAQQEAgJpBAEBBwoCAYROIQQBAQUKAUOGOxZbDIFzgwSCe5lSAYE?=
	=?us-ascii?q?oPgIjAT8BDIEFizKFSoMvgT6BOAGHSYY9P4l7hSIEmCWXf4JGfIVuj34agkm?=
	=?us-ascii?q?IIYROi32EVgSmFYFoJIFYTSODPU8YDZx0MgEBjxoBAQ?=
X-IronPort-AV: E=Sophos;i="5.70,532,1574089200"; d="scan'208";a="10086115"
X-NEC-Delivered: true
Received: from tyo175.gate.nec.co.jp ([210.143.35.175])
	by ob1.hc221-79.ap.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
	09 Mar 2020 16:40:03 +0900
Received: from mailsv38.nec.co.jp (mailsv38.nec.co.jp [210.143.35.197])
	by tyo175.gate.nec.co.jp (8.15.1/8.15.1) with ESMTP id 0297e1vu012403; 
	Mon, 9 Mar 2020 16:40:01 +0900
Received: from gisptrpm001.jp.nec.com ([10.49.113.41])
	by mailsv38.nec.co.jp (8.15.1/8.15.1) with ESMTP id 0297e1Zs017037;
	Mon, 9 Mar 2020 16:40:01 +0900
Received: from GISPTRPM001.localhost.localdomain (localhost [127.0.0.1])
	by gisptrpm001.jp.nec.com (Postfix) with SMTP id 9F33310002E6E;
	Mon,  9 Mar 2020 16:40:01 +0900 (JST)
Received: from gisptrpm001.jp.nec.com (localhost [127.0.0.1])
	by GISPTRPM001.localhost.localdomain (Open ADVANCED MAIL);
	Mon, 9 Mar 2020 16:40:01 +0900
Received: from localhost.localdomain (unknown [10.27.189.215])
	by gisptrpm001.jp.nec.com (Postfix) with ESMTP id 8E7C42004B05B;
	Mon,  9 Mar 2020 16:40:01 +0900 (JST)
From: Toshikazu Nakayama <toshikazu-n@nec.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 16:35:07 +0900
Message-Id: <1583739309-11200-1-git-send-email-toshikazu-n@nec.com>
X-Mailer: git-send-email 2.7.4
Subject: [RFC PATCH 0/2] Proposal vuln-cve.bbclass about plug and call style CVE task
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
X-List-Received-Date: Mon, 09 Mar 2020 07:47:12 -0000

To give any extensibility about CVE task in OE-Core with introducing plug and
call style CVE task execution in patch set.
If pluggable CVE frameworks will provide from OE-Core for embedded people
include Linux distributors, CVE tool makers, embedded product maintainers or
developers, they may get chance of implementing plugins which are available
for their localized schema(secure development or long term maintenance).

In preparation for this submission, I implement two bbclasses with learning
from cve-check.bbclass about CVE tasks or license/license_image.bbclass about
sstate/manifest tasks. I also read README.OE-Core about how to submit patch.

Tests by decomposing cve-check's functions and mapping to plugin framework
variables have been succeeded 'bitbake core-image-sato' at 'master' with the
almost same result as cve-check's.

If there is something missing in the way of my contacts, please let me know.
Or if possible, please review or give comments.

Regards,
Toshikazu.

Toshikazu Nakayama (2):
  vuln-cve: vulnerability task with plug and call style
  vuln-cve_image: rootfs manifest about vulnerability

 meta/classes/vuln-cve.bbclass       | 299 ++++++++++++++++++++++++++++++++++++
 meta/classes/vuln-cve_image.bbclass | 111 +++++++++++++
 2 files changed, 410 insertions(+)
 create mode 100644 meta/classes/vuln-cve.bbclass
 create mode 100644 meta/classes/vuln-cve_image.bbclass

-- 
2.7.4


