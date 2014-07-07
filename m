Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1FEB470372
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 02:24:05 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s672O5Rr020883; Sun, 6 Jul 2014 21:24:05 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014070621240544-8243 ; Sun, 6 Jul 2014 21:24:05 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Sun, 6 Jul 2014 21:23:28 -0500
Message-Id: <1404699810-23745-2-git-send-email-rich.tollerton@ni.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1404699810-23745-1-git-send-email-rich.tollerton@ni.com>
References: <1404699810-23745-1-git-send-email-rich.tollerton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/06/2014 09:24:05 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/06/2014 09:24:05 PM,
	Serialize complete at 07/06/2014 09:24:05 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-06_03:2014-07-04, 2014-07-06,
	1970-01-01 signatures=0
Cc: ken.sharp@ni.com
Subject: [PATCH][meta-mingw 1/3] common-mingw: force ac_cv_func_mmap_fixed_mapped=no
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
X-List-Received-Date: Mon, 07 Jul 2014 02:24:06 -0000

The expat mingw build breaks because ix86-common defines
ac_cv_func_mmap_fixed_mapped=yes, causing the build to think that
mmap(), mman.h actually exist. Fix this by always forcing the variable
to "no", which configure would have concluded without such interference.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta/site/common-mingw | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta/site/common-mingw

diff --git a/meta/site/common-mingw b/meta/site/common-mingw
new file mode 100644
index 0000000..f337c36
--- /dev/null
+++ b/meta/site/common-mingw
@@ -0,0 +1,2 @@
+# expat
+ac_cv_func_mmap_fixed_mapped=no
-- 
2.0.1


