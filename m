Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 197A07F8BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739K0lZqzHg
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990293;
	bh=E0e5uwTMv8ZnE0VPmAcw8sv0xaRWuUqKQjCW16CQsW8=;
	h=From:To:Subject:Date:From;
	b=r4oI/wQa19wwudPeZf2f3ag7ULS47KMVFKhlOM9/rTGp2W1HMZoOVBQZbQ7b7aAub
	7LZBcFnMG2CRCD9kGC2i30MzLBLvJmEcBrLO5N2rFzeC2OhMkpCxZW5tnIs/4HeJFs
	PYKFboW4MACkVuO+svi+DZhb+jZ6D79ikgjgcg2NPCyplNJfMB/X57uer+Kxw5ePA+
	LJEfnC7yDz4DvOJI1PhCKbNRoVnUbxtcEsWhIYs3bP3ozVjSfkFKBN6+fLd60FIBCv
	aWQ4efG5nbfT+gRK3O3MIdCr2p5zRDD9V/sMqHG8wKSmJ5X2fd14hnyUXzEk0m2PCm
	eXwFqLCJHKYCY2FVtAjAuJ1mJelRid3pO9zCsnpBrlfYMqVvmPz2gTbFDlAbPkm+Qo
	ey40MjeOg8tHr7CDNKTPuxx4q082gWV1ZUTt20x6ul0MFgG1JADuQJ8coVnCg5TVS9
	zmcPlKJwdFbZIhV3+Pgle/iZTUGQ3WxaLcpZ9rf+TlwaU+kjJJDhoc4SDKq2x7pOXS
	xa8OFgaRRC1HrJSt3xpCsapKKww85NAGAwqx0wKoumZsTSkcGBlBpuLncDzNa4YnzU
	Xr09oQC9G6VB8XKl+8pFWyirs9RQi2wmPWQpgHjOAX9RM6qUgsCKn4fvRNJ1T9M0UP
	cBub9tpykPPxI/MMwawtzPRs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:45 +0200
Message-Id: <20191105214448.2511-9-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] libsndfile1: whitelist CVE-2018-13419
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:52 -0000

From: Ross Burton <ross.burton@intel.com>

This is a memory leak that nobody else can replicate and has been rejected by
upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 77393db847..6044bf09c7 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -38,3 +38,6 @@ do_configure_prepend_arm() {
 	export ac_cv_sys_file_offset_bits=64
 }
 
+# This can't be replicated and is just a memory leak.
+# https://github.com/erikd/libsndfile/issues/398
+CVE_CHECK_WHITELIST += "CVE-2018-13419"
-- 
2.17.1


