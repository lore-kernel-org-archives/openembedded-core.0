Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RpkWQ-0000Go-2s
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:51:06 +0100
Received: by mail-iy0-f175.google.com with SMTP id z21so7118204iab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 09:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=MuKYke6DPT/mOtXUCG9KV/Iel79/Z5X3VAeTzcw047Y=;
	b=rrrYwaSo+g74pHcSPniVPRgeFxUDZmeGBqtoCLNghQClihiP9SDnGqEUPhNnjShk39
	LmsvVZD3gbQxc2f+V4dTABRfsyn+cp61TqXzFw9m/HAOsEi5aSQBw6tijeBzuDIWFQh9
	nuq9IaQI4Llq7YW7U8gAxcBYdzHWZtMYIm/mI=
Received: by 10.50.77.226 with SMTP id v2mr3175080igw.12.1327427002553;
	Tue, 24 Jan 2012 09:43:22 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id wn6sm9360062igb.3.2012.01.24.09.43.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 09:43:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 09:42:59 -0800
Message-Id: <b903881ad53a5b9320eeca3269a41a68b9efff87.1327426808.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
References: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
In-Reply-To: <cover.1327426808.git.raj.khem@gmail.com>
References: <cover.1327426808.git.raj.khem@gmail.com>
Subject: [PATCH 5/7] eglibc-2.15: Add upstream status for x86_fenv.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2012 17:51:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch b/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
index 40c1c4d..7193f98 100644
--- a/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
@@ -1,3 +1,10 @@
+Without this patch it fails to inline that function
+since we do not have __SSE_MATH__ in OE build.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate [OE-specific]
+
 --- a/sysdeps/x86_64/fpu/bits/fenv.h
 +++ b/sysdeps/x86_64/fpu/bits/fenv.h
 @@ -112,16 +112,24 @@ __NTH (feraiseexcept (int __excepts))
-- 
1.7.8.3



