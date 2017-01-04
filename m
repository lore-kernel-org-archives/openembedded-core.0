Return-Path: <Jochen.Jaegers@riedel-at.de>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Jan 2017 18:06:12 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF8071994
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 18:06:12 +0000 (UTC)
Received: from remote.riedel-at.de ([91.64.58.240]) by
	mrelayeu.kundenserver.de (mreue004 [212.227.15.167]) with ESMTPSA
	(Nemesis) id 0MAysS-1cEuEm1Zdk-009xDa for
	<openembedded-core@lists.openembedded.org>; 
	Wed, 04 Jan 2017 19:01:04 +0100
Received: from yocto.riedel-at.local (172.30.1.177) by DC-2010.riedel-at.local
	(172.30.1.8) with Microsoft SMTP Server id 8.3.485.1; Wed, 4 Jan 2017
	19:01:02 +0100
From: Jochen Jaegers <jochen.jaegers@riedel-at.de>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jan 2017 19:00:24 +0100
Message-ID: <1483552824-9362-1-git-send-email-jochen.jaegers@riedel-at.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Provags-ID: V03:K0:jvvxoQcsTWn+L/zxgaJfJ1G4huXHqiCIn0Sd0FKqjKup5u4EJ8s
	3JJ1gHpqylU5CAO0MMofwGmRvc9523gYi3MMqro/wOQm6Kp/1kQjMspScH2Bk/kdqDrCXKW
	n94EI34RyDZJNng84JsM36PUUeMYlTwn1v1rQZBEWMAYeMen7dRq/DZfgqKbiV7yLbZo5Yq
	RQ+vNStKh3DM8O724G85Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Wm6Bs6tBZhM=:7XIlHu7Rc0w+jrOqEzHxZy
	eDVpShhJF5MpHBSgPntBPATXAcPGfaoVVDR6JUM94G5P71+yBkrpMgwJNZddFcH8HukmTnzwe
	5ICMRWd+3qGm0+EGjykaiuzELdHuRWDfu1jyacwqXeQa5eMrzjuJMV1B8Ngq87cmNE+Ntz/An
	W80gMIoJ6FOhZ/6NakDqdCtHVP5dUmPxYaBzYJ1Bn+nfaMJ51+MqVQQbrXHUG0eUfBDEiKCvB
	r8gabw1YxN1W8ZjknIRhy7gljVWrxK5sJTkcZDitgFFDuSf3kBpuz95FR6E2PIjT06v0Kxt4J
	yF3XYHEE2bb5jbR5Yb0pDJpRYl2K+DSjNXFTDOq5EsqXeJdiDpz+mhmjLPpBlE+eKmFbGlFdq
	14qAdoin78eQ1WtbO92d0a7IhE0j9TtlKCJ2M5KDrdB8ToTNEUzzVDLTEMspQVQJwK4lpgWrZ
	3t7WixvQp802n1Ey+vhhWBvk/ReL4E5pbEOjIIncigndrMjHfJiySdXVsAbnufWz7GyIWVGri
	BbG8M0imgPv8vCT+jbITOgqtS5f6y4mSzYoPhvmQQgbD/+kk4jIsT1VNkGn47fRb5AdXM8hHM
	YQRDSUf0g5pD5z9TRZe5GMRcE4iPE+zrmDtOmwAAbsuuiw1IzjQ+EONYQ0xB+9uY81aD+45sO
	FoNzIxMslGJsyPjRyP5W40QD6nbbINY2bcBzNu16Z7GFcERZ3rqsf7/vdKkqu1jxcGGgpzqbc
	5YVMaZnQMpN70+T2
Cc: Jochen Jaegers <jochen.jaegers@riedel-at.de>
Subject: [PATCH] Changed order of lines to prevent use of unset variable BUILDSTATS_BASE
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
X-List-Received-Date: Wed, 04 Jan 2017 18:06:13 -0000
Content-Type: text/plain

---
 meta/classes/toaster.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 4ea2056..a685578 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -157,11 +157,11 @@ python toaster_collect_task_stats() {
     import bb.utils
     import os
 
-    toaster_statlist_file = os.path.join(e.data.getVar('BUILDSTATS_BASE'), "toasterstatlist")
-
     if not e.data.getVar('BUILDSTATS_BASE'):
         return  # if we don't have buildstats, we cannot collect stats
 
+    toaster_statlist_file = os.path.join(e.data.getVar('BUILDSTATS_BASE'), "toasterstatlist")
+
     def stat_to_float(value):
         return float(value.strip('% \n\r'))
 
@@ -361,4 +361,4 @@ do_populate_sdk[postfuncs] += "toaster_artifact_dumpdata "
 do_populate_sdk[vardepsexclude] += "toaster_artifact_dumpdata "
 
 do_populate_sdk_ext[postfuncs] += "toaster_artifact_dumpdata "
-do_populate_sdk_ext[vardepsexclude] += "toaster_artifact_dumpdata "
\ No newline at end of file
+do_populate_sdk_ext[vardepsexclude] += "toaster_artifact_dumpdata "
-- 
1.9.1


