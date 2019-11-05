Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 986A46D147
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739H19cmz8t
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990291;
	bh=TFPg9eIPM0emtUOvtQt84HZP/n2pl3F2sgTBWWI69Zc=;
	h=From:To:Subject:Date:From;
	b=WiV6f1WnsISSxvWAmiIpaHzwy8r0IdYorLUJDHqK47MbPoNkhXJpVHqMUesPRBN8j
	riYE2CnKrs/9JOP7nUekPesjRZPrWUsumhgFT/4zpmVoS1XG/niD/f0zPROLfspgOZ
	0TCudXMnkElJBdK+WroPSqX79wQj4HDl1FlF5avJVoB6AcsCrqW0To8aUEW0Xagifk
	oMYa+SRckwhk6L2mLswGkj2lBykD7szf2Dql0LFvCrXfKWI/+6XK3u1eQu9WcKSiba
	Qy32hsp5AUJeJoKYUWmCFPVyBw4D0RbgQ+3isfpl0w21zvqpOSvo1zkWVNzE8TfgoQ
	kLM10/zGuNgD8xafTmAEHIYceiPXRLSuJrjmeqVUcbibtez7dfNGYbicmpCedlllAS
	FWDjVV7cFwMBaKMtuJaKBnK/koKflRLVRZb2h9Waec5xWPjrVPTyTfNE33zTV8Z7yH
	w+PMHLUd81SqzNfZLOmqbhsQUsshq04aGRCTkr0eV74APcGsZpl5eeY+D2EmMChOU3
	tzZ+MIyGMmLn8s24lHM3W9xuZHcoWVEj1GthGBxnBFxYddnapGPA55x3eu0d9av7Pn
	UflzL+o6gBQoeY2NfecfCN3X7ifp/L8zDggLx2qfj/VvC5Lfae8m5QMCuZ854kySZG
	hVMjUxq8yJF+MeNo+4Gv3D20=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:41 +0200
Message-Id: <20191105214448.2511-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] ed: set CVE vendor to avoid false positives
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:50 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/ed/ed_1.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ed/ed_1.15.bb b/meta/recipes-extended/ed/ed_1.15.bb
index c79310325f..886c3ddcab 100644
--- a/meta/recipes-extended/ed/ed_1.15.bb
+++ b/meta/recipes-extended/ed/ed_1.15.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7 \
 
 SECTION = "base"
 
+CVE_PRODUCT = "gnu:ed"
+
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
-- 
2.17.1


