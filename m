Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 070E27F8AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739H58cSzHg
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990291;
	bh=YCQXVhEx9t/2qqGAnK3CD6AmVEgVjgGumjYtgkYpPq8=;
	h=From:To:Subject:Date:From;
	b=CdYj0j8EwZQBSdNFiMPWMwkEhzHPlNg7yOj8bZ0y4RicsSe3R85CD4san5x3oU+jr
	FT2DoxzIXjCvUgNWuNPiIn6NgexxyJPlW0dB3oVx1vMrlsawEdaYWXkmqPWZ0vOB89
	lIRNc3YAG4uCJg0wp75yQAXF576B4z9dyc4PbNL1oCmqYkACLhTWdjrDjwKBxEmdLt
	vGVLOBg/hlwy1/prWPlBzhF6Gg4t5tRmD+e1yUOCwiJa9hXQvAOfmr6FfoJemv2/s9
	AmZ3j4aVxB3adWV/Po4j9ZvoEmraF1YXZNqdRyUlpL//nh4XXljhfN9baxqYDn2VRr
	cqkVwR/sav8C9ap789a+m8N2Z9l2eDxbyFE5dFJnLm9QnXMWXgJTUygD3Don/b2p2o
	fnF+FvJP3JcAgg87XmALS3iamt7vvEQ4x3Hsh6f1mGwUa+7kd6yaIJe3jGjCMR72Ow
	HuhrbiveFKwE40ihFdiE9b7vhe9OB9rXZ4CMXyaFfGKhZw0K0tL+9wAc008LjIpDeA
	Iq1dtR9nh0EDA7ahC2iLlxfzDisJJv+stAktXOCqlsUtVMbbpv3gVCPfrQW45nwwro
	eVk9ke6lAnGUgnNLRC9UzTsubslRdZ1KTgo/oTjd6n/q5AGw4WyHYsuTLcVbGRcO2X
	PapqBQIaAhf/Z2GCAyFKLsOg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:42 +0200
Message-Id: <20191105214448.2511-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] boost: set CVE vendor to Boost
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:51 -0000

From: Ross Burton <ross.burton@intel.com>

There's a Boost module for Drupal.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index c2e2cbb352..f385541653 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -2,6 +2,8 @@ SUMMARY = "Free peer-reviewed portable C++ source libraries"
 SECTION = "libs"
 DEPENDS = "bjam-native zlib bzip2"
 
+CVE_PRODUCT = "boost:boost"
+
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-- 
2.17.1


