Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 01BD2617A2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 18:29:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QYdD3tngz6L
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:29:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582482576;
	bh=G7FSxnVETuRbf1eztSrxzuL6oIuN40mXECnXag+FsTE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mr1XtWkhi4FfJmQb/g5et9kwMyUMSHExxNR22X2D3MzSkG9sfiNlUHFfdW7MhHe+n
	m40RcrLIaKLiM6Ldo7mxVFKeXyFx5mlBseC/swvESmbPxhgMITVp4gTztZvK5m7wI7
	UgSXO1mIHZjCQ0e9TlB5d0Je191pCuriDqltgUZQbcAAvziNMFv0nxlFVuWz5yDDsu
	m9n6C1dBvsYutFfb6ICFZ8YG8F5lhrqCXN5KrDb+fZg4+HEb3C6gPbNbPAWWJG/3rm
	qfU+IDpyBk4J5BzhNrxPEVQH1WPwn6GDRJMPi3l96HqohTvIbFAGGrny1mfu0BHtOA
	kPR2dN2h2RdvTRVbxP1wTWMBXcyXiZZfzb3BtLhTtmm6K17luCiB8YgkFGIGVp+1Ml
	m1UKoc5s+cmQHoTOswDyfAY0e0iC2UtKRDrJYZg4H4kENUT+FpcuMGpA2eWzAr37R2
	1XX7IGA+Uum8vCO5fSD3urk9Wqni51BetT17TI/aIPF1szYXouNTNHz2EKGurTAVMf
	hQrDzpdvj6w+V3hML17zNNMMLBbLZ+kWpULUiPHEkIFpAUWLoRw8B4+byXu6dYXBYM
	blUizUZGkstK1k++O06SgL9XjPO5cI3H2xzD0DaDrJ8Wr//NyCSRhXhDL358vaqtHh
	9GWv51GsyLBjyMm+ZeEszFZM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 20:29:32 +0200
Message-Id: <20200223182933.6168-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200223182933.6168-1-bunk@stusta.de>
References: <20200223182933.6168-1-bunk@stusta.de>
Subject: [PATCH v2 5/6] systemd: Add a PACKAGECONFIG for libidn2
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
X-List-Received-Date: Sun, 23 Feb 2020 18:29:37 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/systemd/systemd_244.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index b686519482..5d863410b8 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -138,6 +138,7 @@ PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"
 PACKAGECONFIG[kmod] = "-Dkmod=true,-Dkmod=false,kmod"
 PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false,,ldconfig"
 PACKAGECONFIG[libidn] = "-Dlibidn=true,-Dlibidn=false,libidn"
+PACKAGECONFIG[libidn2] = "-Dlibidn2=true,-Dlibidn2=false,libidn2"
 PACKAGECONFIG[localed] = "-Dlocaled=true,-Dlocaled=false"
 PACKAGECONFIG[logind] = "-Dlogind=true,-Dlogind=false"
 PACKAGECONFIG[lz4] = "-Dlz4=true,-Dlz4=false,lz4"
-- 
2.17.1


