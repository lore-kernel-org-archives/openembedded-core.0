Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 1611 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Sep 2016 23:15:57 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id A80656059F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 23:15:57 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u8NMn7Ew024786 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 17:49:07 -0500
Received: from delcastillo2.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016092317490774-235293 ;
	Fri, 23 Sep 2016 17:49:07 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 17:49:06 -0500
Message-Id: <1474670946-8969-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/23/2016 05:49:07 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/23/2016 05:49:08 PM,
	Serialize complete at 09/23/2016 05:49:08 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-09-23_07:, , signatures=0
Subject: [PATCH] libsolv: enable MULTI_SEMANTICS
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
X-List-Received-Date: Fri, 23 Sep 2016 23:15:58 -0000

By default, libsolv uses the rpm logic for version comparison, which is
not quite the same as debian. Opkg now sets the distribution type for
libsolv to be debian. But for that to work, libsolv needs to be compiled
with MULTI_SEMANTICS=ON.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-extended/libsolv/libsolv_0.6.23.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.23.bb b/meta/recipes-extended/libsolv/libsolv_0.6.23.bb
index 1ece5f2..f3f3d6e 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.23.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.23.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE = "-DLIB=${baselib}"
+EXTRA_OECMAKE = "-DLIB=${baselib} -DMULTI_SEMANTICS=ON"
 
 PACKAGES =+ "${PN}-tools ${PN}ext"
 
-- 
2.7.4


