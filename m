Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9ED60053
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 22:29:09 +0000 (UTC)
Received: by iecuq6 with SMTP id uq6so22635809iec.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 15:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ao6anHMFGlJD3By4kP2ebqd+/POUXfXJVpcr8o4LoKQ=;
	b=PX9I+uHwNFfyJarUAYIXAAO2K3z6lM8yKGBz5JJEY8AHHjoMSf2YbwXAl4LB1SoSaJ
	fVSg3yhyasmA/50h7y8PYrK2mFg+18ofwkAMRvee5pUe4djxnzKZC/9opB5YQAn8iLbG
	ksc1mJ/xOecDyplCVyDpySiDA2PC/4ydHa/dU9TZEK4F5HilRET2r9k0dah87Zm3Ofp/
	0he6DlGdCwfPu4lldvSei1Hw563mNOjoKbmfQ/SyeRw1zWwgGXr7y7faKiVC488erk9F
	vtR/V/n8lIcnZJxT8HlGQv/HaEzuC0CD8pqa5ISNvpf4yxVI0gWnxM2lz8DnxtSAbZhG
	l+bg==
X-Received: by 10.42.200.13 with SMTP id eu13mr9714icb.29.1435703350288;
	Tue, 30 Jun 2015 15:29:10 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id p4sm224239igg.20.2015.06.30.15.29.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jun 2015 15:29:09 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 15:28:50 -0700
Message-Id: <1435703330-15892-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435703330-15892-1-git-send-email-armccurdy@gmail.com>
References: <1435703330-15892-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] libav: update i586 TARGET_ARCH test to also handle i686
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
X-List-Received-Date: Tue, 30 Jun 2015 22:29:10 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/libav/libav.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 6ef273b..d3f4b1b 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -138,7 +138,7 @@ python populate_packages_prepend() {
                       prepend=True,
                       allow_links=True)
 
-    if d.getVar('TARGET_ARCH', True) == 'i586':
+    if d.getVar('TARGET_ARCH', True) in [ 'i586', 'i686' ]:
         # libav can't be build with -fPIC for 32-bit x86
         pkgs = d.getVar('PACKAGES', True).split()
         for pkg in pkgs:
-- 
1.9.1


