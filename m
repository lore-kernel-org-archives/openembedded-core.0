Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 931256CBD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 21:07:38 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id cc10so3670637wib.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 13:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xLZjhJLMhP2ruUEC+bFYy7eTaqcRLVW75m9vZMw3y5o=;
	b=ctfcItqe8hPe/Dmso2H24BLUkUOPnlYDPcfCXf1hhaqx/kgjuSlA1GN423f3ZXeAdH
	BdwfMtP6UBaGgFlIoOCSHWpAWWE8NaqTyqKWFhvKR5m4KgHMejRZBq3XgSXxt1Di/Kaz
	Uw9L/oKlglewcVH8pv8GS1KaKEMADWVSOP0JNDHEP4htqn5OeV9Ok/LvIq6URryIk4No
	vvH6knTQumngefbO9pwL1/11cXdpyFEsQ7C0Ia6sKGmLnGqCy7VDECW/6rz2nDiX1Hbn
	7r631Q0uweJpD94De4ly9Dsf12xDKzePCYfNLdC0cyZDxNaY5z0FNCVtUvijr4E1lY92
	yGiQ==
X-Gm-Message-State: ALoCoQktFqACRvY9Scti8xwTvPGMJ7c6CYRtw2+5FvCNqKFj6Sva3gokwiRQrcuyLfFxTDsLW6/Z
X-Received: by 10.194.57.243 with SMTP id l19mr3798489wjq.54.1390252059143;
	Mon, 20 Jan 2014 13:07:39 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id n3sm5061547wix.10.2014.01.20.13.07.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 13:07:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 21:07:32 +0000
Message-Id: <1390252054-9399-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] glproto: upgrade to 1.4.17
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
X-List-Received-Date: Mon, 20 Jan 2014 21:07:40 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-proto/{glproto_1.4.16.bb => glproto_1.4.17.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.16.bb => glproto_1.4.17.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-proto/glproto_1.4.16.bb b/meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-proto/glproto_1.4.16.bb
rename to meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb
index 7cb4233..eb03d33 100644
--- a/meta/recipes-graphics/xorg-proto/glproto_1.4.16.bb
+++ b/meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb
@@ -14,5 +14,5 @@ PE = "1"
 
 BBCLASSEXTEND = "nativesdk"
 
-SRC_URI[md5sum] = "3847963c1b88fd04a030b932b0aece07"
-SRC_URI[sha256sum] = "54dd663a7f5ed702f2ff035b79edf770c2f850867ac0d55742f696bfc8b2598d"
+SRC_URI[md5sum] = "5565f1b0facf4a59c2778229c1f70d10"
+SRC_URI[sha256sum] = "adaa94bded310a2bfcbb9deb4d751d965fcfe6fb3a2f6d242e2df2d6589dbe40"
-- 
1.7.10.4


