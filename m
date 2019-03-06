Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 742FB7CDA8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 16:37:18 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id z124so11147387itc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5hIMMQYs0jRlUvDgaA1GkMhaln0UmK8kcz9nFwclO6U=;
	b=MvoCbC8YSdrkQk2qONTFHbu2D3rYgr7RwrPUp6H0DX1EpCYXWg8kgu6c7OA379eGVV
	wjkhETb4gYOsTHTofrSGnuFnIep+EkgYa/sFWB/MNz6oXdErhusMjgOLKevLTYf4jpFH
	7e+J+UkckK1iIamw+k7LSy9MlOBYzaLkCGyxVYCYVnJYAcxvjwCdTexrOEKPZ0UJpPDO
	UdgqxXKp9Nju2GQmeuD45M9K/GEJAPUfTonFaje3CxrVl3X+7sjCmAVmkmpOnsQznR9E
	YYY88Ihx7zjnjixckz9XHxTxaXVnAzFKB1fEiJI0gmEi3QFA5ZeJKqZOxChaCF+72D35
	Moyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5hIMMQYs0jRlUvDgaA1GkMhaln0UmK8kcz9nFwclO6U=;
	b=dbd0iLH1dm73sxLnPPbxOX8/9oS1JaU3IIu+s9vhPA8nsEe0S+4TlgW2cGoDQGvPQE
	qPIp+IVEJo/xMIKqOIhXjTW9bc8oZHadgfVPlo9NyfX3q7NrgsmRzXi2C+5QiVQnHZCc
	Tk2Prmu6qbcKYY7oDbbCM/AiPDNqVtsGKCQmkhVaftKqp/10c9tIKr7AIT3yN3Xb2MBT
	s9rbEj41L8Aio7V6gfOIyP3cNl5joonei9IPJyFDPc2Q4N1i+jPWJvDjfO4sSxOLxqRV
	2Rxt5QxVjKyqxfNLF+h9EHYSir+0IXV7e8HimKol1YmU55fPR7O2+t9QoSXlzPVjUk0I
	mbcg==
X-Gm-Message-State: APjAAAU0woycupqfG5cVENLUUCDGrsQ96aCbbzb1H30jaIitYKXzUHQr
	A66UOiE2wVczuKCwg4WDrjf6a5p7Wbw=
X-Google-Smtp-Source: APXvYqyW9hVUveMK+hdithZEL+pkyFyzGdv/B2dtFDB+dl9eoACdw8VeE7jAPYaWCiokCVqC3j7m+Q==
X-Received: by 2002:a02:3342:: with SMTP id k2mr4516718jak.62.1551890239281;
	Wed, 06 Mar 2019 08:37:19 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	x191sm1072550itb.8.2019.03.06.08.37.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 08:37:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Mar 2019 11:37:09 -0500
Message-Id: <05adfd2c8d029ee397c9d2046ebb11aec8d3e952.1551889557.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1551889557.git.bruce.ashfield@gmail.com>
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] kernel-yocto: allow kernel-meta repositories to be patched
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
X-List-Received-Date: Wed, 06 Mar 2019 16:37:18 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

For testing purposes, it is often easier to patch a fragment
in a kernel-meta repository versus needing to make a copy or
modify the source repository.

We can allow this sort of patching when a patchdir of kernel-meta
is passed (to indicate the nested kernel-meta repository).

Also note that we must patch the meta data before they are
processed/gathered, since migrated copies to the kernel source
directory will be used later.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 496c8a7f68..d2b194dd55 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -5,12 +5,21 @@ PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
 # returns local (absolute) path names for all valid patches in the
 # src_uri
-def find_patches(d):
+def find_patches(d,subdir):
     patches = src_patches(d)
     patch_list=[]
     for p in patches:
-        _, _, local, _, _, _ = bb.fetch.decodeurl(p)
-        patch_list.append(local)
+        _, _, local, _, _, parm = bb.fetch.decodeurl(p)
+        # if patchdir has been passed, we won't be able to apply it so skip
+        # the patch for now, and special processing happens later
+        patchdir = ''
+        if "patchdir" in parm:
+            patchdir = parm["patchdir"]
+        if patchdir:
+            if subdir == patchdir:
+                patch_list.append(local)
+        else:
+            patch_list.append(local)
 
     return patch_list
 
@@ -119,8 +128,20 @@ do_kernel_metadata() {
 		fi
 	fi
 
+	# was anyone trying to patch the kernel meta data ?, we need to do
+	# this here, since the scc commands migrate the .cfg fragments to the
+	# kernel source tree, where they'll be used later.
+	check_git_config
+	patches="${@" ".join(find_patches(d,'kernel-meta'))}"
+	for p in $patches; do
+	    (
+		cd ${WORKDIR}/kernel-meta
+		git am -s $p
+	    )
+	done
+
 	sccs_from_src_uri="${@" ".join(find_sccs(d))}"
-	patches="${@" ".join(find_patches(d))}"
+	patches="${@" ".join(find_patches(d,''))}"
 	feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
 
 	# a quick check to make sure we don't have duplicate defconfigs
-- 
2.19.1


