Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 71A2073200
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:06:14 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so6767942pfv.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 19:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Uw0YA2U6TzrNPDVOdOrVCiIuyGD524YTrw+ZAWBJG9A=;
	b=WFWzuri+53tkOuI3ok3IfQy2hs6QKJ7bsk2wiRDN5WA0ZB1ewPWd4rYUZWsruTpe+9
	3E3o0B4vxT2lLxM+4cLhFqjvN6OzyFsMSo/uI4zkqeygnEaa+4Jra/C9Tg3wUcMOjQXy
	dA6h0KSwGFmmHz33F909u4z+4j0Veu222GIJYN7dcDQ+fq+Rtojcvsw5Cwu1CXZx37gX
	W5QRI27KLxcppTsblueB3SmW+JgjWUL4CWJH2kQOJEr1JDNLnbKgIA1uFWujmyYNXL3M
	a7fzls6OliagqR6fuu9zwtmHzXT9oqIp2fa2Fvim4QbHGHH5G4JNs1+95og1UbzV9vFk
	Jqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Uw0YA2U6TzrNPDVOdOrVCiIuyGD524YTrw+ZAWBJG9A=;
	b=FDKR3g3AvSw0dInn8nbyOzwLIHh2CGkNWSRa2ouC+Om98dfaRM1yjmW44SsBD0p4ds
	N3CG1drglaj7TFIIYs9JEJISkoww05gkNW+///wWHk3liu9reEyw+HXcVKkwdGDtYvbu
	uuBxTBljffzM4UJMwmEhPlIpBICvw/B2vtTuhJmc7RHXzT4NDHMDwMtDX1VKgFRGgAle
	/XybfoEgFxieiwQB7amWJ3tWaSngfOOQAohdouGt3xOxCtdkrzsswDdaJkuKZeNBXkGV
	UMRjE0pyBJJJgBdki1N9QMz2HyuwaDE2/AAlrCUg3IN7ZKoMMuiEVkyHHYdmPI74tocm
	WCJQ==
X-Gm-Message-State: AKaTC03JwUIxi1pIFwXr2MXr13pMmv7A23NBMKiK8bvF3pR/9Joup7DfDGp6WBWVbSXHZA==
X-Received: by 10.98.157.13 with SMTP id i13mr13023625pfd.82.1482116776006;
	Sun, 18 Dec 2016 19:06:16 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	65sm26830276pfn.12.2016.12.18.19.06.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 19:06:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 19:05:56 -0800
Message-Id: <20161219030600.1284-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219030600.1284-1-raj.khem@gmail.com>
References: <20161219030600.1284-1-raj.khem@gmail.com>
Subject: [PATCH 4/8] grub-git: Upgrade to tip of master and fix with glibc 2.25
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
X-List-Received-Date: Mon, 19 Dec 2016 03:06:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/grub/grub_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index eb824ccc71..f24cc2f1cf 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -6,7 +6,7 @@ DEFAULT_PREFERENCE_arm = "1"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/grub-git:"
 
 PV = "2.00+${SRCPV}"
-SRCREV = "7a5b301e3adb8e054288518a325135a1883c1c6c"
+SRCREV = "ce95549cc54b5d6f494608a7c390dba3aab4fba7"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
-- 
2.11.0


