Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4815674C4D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 18:13:23 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id g62so10163833pfd.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 10:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Dfbr5CKp2p5LQ4FJVkKRyrZ0wJMcsU1hFZQxpM9qpxE=;
	b=p9JKVRlz0TdT5GD4/U1K0IKgcgQjbMb+L4KSBNgnpP84lmqiCnVHlksRI1/3CmSB/T
	KVWxya17USRt2rOAidLCzT6kK9uxBep7mp2YzsK3q7khFAfy9M5FhCzjwncfgMU5lcvq
	XYlbjfW62nQAkTQXCpwKpld418iQdNtB5uAEANFkGhQx3MsDBaopCfKONGgwj4yY/fy9
	udFyekFwxRgSpXhO1pHJXjSuxwjRRMVF0Iy7+XQYZSO2DQqjyTdemFTb8B/MtbgEfzru
	Jw2aTkH8+4nGcMnGox8oqsZN7YBwYSfB9/2fUCY+1y/ArZV7OjvVmyhKfy9m6hgPF2qv
	AjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Dfbr5CKp2p5LQ4FJVkKRyrZ0wJMcsU1hFZQxpM9qpxE=;
	b=Q9Y+u5fjzvxOK/EEyMSc0V58jsoRyp8lnd7lC+jjtjyaDYqbycMI+6q1u8a3jRXnGZ
	r8XphjgsDt2SHloLb8MPCj6GL21MekGm1O3Jx3LPJugg+x1d9uJh6EF3CRIR4lgZY3Hd
	ovHiz5ajbero3dlxFodIgnhTgpnGbFPexHafiiOSscjFiA09DF49lTtjxlLyKnm0PMAm
	M1/7Pb1vcg403x8nlTZBM4RQTbGnzq2tNN580hUmZqVOjTFoLGr4HOrXk43p3l4kdZTM
	rQYZ3MaasAFmC0yprEPzrFufv6f2sCLQSWS+9MkdFQo0GwrFdPbVfd5agEgX9DxBxC5n
	YpOw==
X-Gm-Message-State: AA+aEWZBOlAq0lHrE0KhLuYv4B02u72zTzFCgJOH93CFRzUjEBpLlRPr
	k1oYWS57BttJjDCFYEMLzFMGCZ0l8rk=
X-Google-Smtp-Source: AFSGD/W+H0qeX0mRdtbIJompzYyxPHZEHy+qI8vbqvWbtbh+meEQwyL1SaxfjRXCUKCRSTRu77gmzA==
X-Received: by 2002:a62:5b83:: with SMTP id
	p125mr21682260pfb.116.1545243204035; 
	Wed, 19 Dec 2018 10:13:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	q75sm27536922pfa.38.2018.12.19.10.13.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 10:13:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 10:13:09 -0800
Message-Id: <20181219181309.8320-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181219181309.8320-1-raj.khem@gmail.com>
References: <20181219181309.8320-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] base.bbclass, classextend.py: Drop catering to gcc-initial
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
X-List-Received-Date: Wed, 19 Dec 2018 18:13:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/base.bbclass  | 1 -
 meta/lib/oe/classextend.py | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e6af673847..f1a3c0e53e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -264,7 +264,6 @@ python base_eventhandler() {
     if isinstance(e, bb.event.RecipePreFinalise):
         if d.getVar("TARGET_PREFIX") == d.getVar("SDK_PREFIX"):
             d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils")
-            d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial")
             d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc")
             d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++")
             d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs")
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index d2eeaf0e5c..662707b859 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -114,7 +114,7 @@ class NativesdkClassExtender(ClassExtender):
     def map_depends(self, dep):
         if dep.startswith(self.extname):
             return dep
-        if dep.endswith(("-gcc-initial", "-gcc", "-g++")):
+        if dep.endswith(("-gcc", "-g++")):
             return dep + "-crosssdk"
         elif dep.endswith(("-native", "-native-runtime")) or ('nativesdk-' in dep) or ('-cross-' in dep) or ('-crosssdk-' in dep):
             return dep
-- 
2.20.1


