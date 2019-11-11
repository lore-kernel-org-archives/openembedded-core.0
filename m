Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7567D72F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 12:45:14 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b11so13144330wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 04:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pNm4FHl4/mwoZWUAENcG+hRx4P74d9tEam1HmxvMsLo=;
	b=tY28oNjZtkx3T3LIWbO49tn/wJ5zfvDKihYyuzozI+IOBnzislyV3Z4bN31hJ8urG7
	4s6xx57K4bXWM/SqV77Lg6ZDFys2DnSsEWxGYuumXR4mN/b8yK9cOUV3DmblP01rPOwO
	4OBvqjBuDEcti6W+leFL5k9MKl1zSVd8zEHx3j224r7hGSz/1zHkrJEdy2O/mhB9eM38
	o6QUL2AuJqr+F+cqeJl6L99zAhgnZRGeKod3cjHbeM88US/mLwyAAED1pX1Lyqp8HWmS
	kmyeF55/UiuNXtP0DQlvALJydlrhFGrMtNe9ChXeYy1WZ+l4RnyotDhsBq9jA/x4DvZL
	5TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pNm4FHl4/mwoZWUAENcG+hRx4P74d9tEam1HmxvMsLo=;
	b=hDwR+SUUzsNNXrslXd3Pt39+ggt76VjG1OizSD8737Aw746mRJV5ls2BgseVimFiNn
	R+qJP29DChQ2sAuJVPLpnOTOzFjyvtpHcCOKBBir2ABasvaAZ8MfQKVgUehl8yGp6ez6
	mstUgnwzcVmsR1cldHuzUxB2W7luTHR6M6Xtol/vULhGCAKtIjC9eCdKaL9iKooNp9qK
	ENm9GJTZepz8fvwiVBZnWzXXmiTkQ7bPvCHj99kvrF8kDQK5fzKy3bMusQk7gHb/kimF
	PofUpCQu1ct18UKotKwDwUMzp/1wGN9gRA8PnQVe5GzswGIOa4Y4sO6NFD+iJPkEER2u
	keeQ==
X-Gm-Message-State: APjAAAVElnCIKJ8FHcjLcuof0iz+zQVzMGGP3Bklz1HoUTU/Tfed8otp
	uNVxIysxcX4pXW9/+z2QouGVIAKly5w=
X-Google-Smtp-Source: APXvYqyYwnGNGdsfe5wgRJv6y3RfhJmkId9g0kotsC+mg2CNyhyrmeQPWR0HAG3aRA/p1muX56LmXQ==
X-Received: by 2002:a1c:740a:: with SMTP id p10mr18988028wmc.49.1573476315302; 
	Mon, 11 Nov 2019 04:45:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d199sm15502076wmd.35.2019.11.11.04.45.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 04:45:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 12:45:12 +0000
Message-Id: <20191111124512.23645-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] insane: improve textrel warning message
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
X-List-Received-Date: Mon, 11 Nov 2019 12:45:15 -0000
Content-Transfer-Encoding: 8bit

Clean the displayed path so it clearly shows the package name and path in that
package.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 9605ac2baee..f856cf6a2b6 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -340,9 +340,11 @@ def package_qa_textrel(path, name, d, elf, messages):
     for line in phdrs.split("\n"):
         if textrel_re.match(line):
             sane = False
+            break
 
     if not sane:
-        package_qa_add_message(messages, "textrel", "ELF binary '%s' has relocations in .text" % path)
+        path = package_qa_clean_path(path, d, name)
+        package_qa_add_message(messages, "textrel", "%s: ELF binary %s has relocations in .text" % (name, path))
 
 QAPATHTEST[ldflags] = "package_qa_hash_style"
 def package_qa_hash_style(path, name, d, elf, messages):
-- 
2.20.1


