Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A07807F89E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739G1jpdzHq
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990290;
	bh=qQu1RWQ3aXdEDlajbX7yi+cqXhhob9f3z31TMUa+Hyw=;
	h=From:To:Subject:Date:From;
	b=hf6UympRBbUOiCiFkIttB4XvlnXsRFJsRLmDo2Rm1TTNUDPMx+/FppaIyXhzBkmOk
	XuIRNSxhHNYpDOs/i32vwNDxmF55EXetf+bffReHqDwTkfIS4KM97PYwqkdG1g3cN/
	Mxiiuh08Q1ovKkdkqv7DngetHD1GkYTSYxl8FVMsik2nP7jmXQcHVlkViY6Pla0/5i
	+PBt3D5goMZ8VfmebxQ4ytO29Xhz8blXy13/u42P6IHDaVcSLZGneR04axb/+dDwV/
	u6ATro81VipiIv4MZHtzG6hrRHdCLWpb1iHnGKiHKxVAAp1tvQ23hpwgegdSMqdzII
	FXqURn1TCgiYwaXO4j/eHJSkySlSNRp7isq0aFBHMJWLumyupnmnNVoGyW0Q0V8iWQ
	jm325gtDqonIXu4turnCF2EonVRLgPY90GtfZlmHYF30PY2kIuENAZ8tQW+FD3DShd
	CRx4n/OetY1JztoZDiI4ZWsmf2k67M6X2byIFk6jh2pfHHVHAN1UjAir9bFrVIaSZZ
	ZJh0BD8q5AEGFYxMz9sx/qdxT0dBkCGRYkIEgRfvqkRhzjtvavn/tKZJ9kC7ylxdkV
	9DZ4d8V6LqXyHG5Qvf9HZYvOyWOUZECwpfmDZSsZyAanLasRrWL/kbYVEKtk31sR7o
	oWJzuOcFZ9qBUj6iGSHmpbAE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:39 +0200
Message-Id: <20191105214448.2511-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] git: set CVE vendor to git-scm
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:49 -0000

From: Ross Burton <ross.burton@intel.com>

There's a Jenkins plugin for Git.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/git/git.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 26a22ac1e8..6e137432f0 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -13,6 +13,8 @@ S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
+CVE_PRODUCT = "git-scm:git"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cvsserver] = ""
 PACKAGECONFIG[svn] = ""
-- 
2.17.1


