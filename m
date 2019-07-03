Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 515CE7CFA4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 09:25:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x639OTnp007911
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Jul 2019 02:24:40 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 3 Jul 2019 02:24:12 -0700
From: <mingli.yu@windriver.com>
To: <matt@madison.systems>, <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jul 2019 02:24:12 -0700
Message-ID: <20190703092412.30747-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <CAGgRHJqeFE75tXJ7qB4gyxkZaWsLmFozY+1YoJLUPXzG9Q+fOA@mail.gmail.com>
References: <CAGgRHJqeFE75tXJ7qB4gyxkZaWsLmFozY+1YoJLUPXzG9Q+fOA@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH] go.bbclass: remove ptest inherit
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
X-List-Received-Date: Wed, 03 Jul 2019 09:25:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove the ptest bbclass inherit logic to let
each recipe inherit ptest individually if the
specified recipe wants to support ptest to avoid
the recipe which inherits go bblcass inheriting
ptest automatically.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index e05a5c641c..424d869540 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,4 +1,4 @@
-inherit goarch ptest
+inherit goarch
 
 GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
 
-- 
2.21.0


