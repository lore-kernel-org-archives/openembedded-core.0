Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 29D1E736B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 11:20:07 +0000 (UTC)
Received: by wmec201 with SMTP id c201so42108912wme.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 03:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=EknFjPLjkhSTTwSWGiUQ73EHcMHUNhuf1iSTs5Epu3M=;
	b=RwYdHO+WaTjmOVxREEohIfxwsy/mehFVDeR0dPciVRzhyqOYxXWQNt5Gmn25PBKEtF
	AStUkMPRawVTGQLXmkBHc76O0fwjsIn81QaFO6c05fhYvrSzSbkFX2FBbRBgOskOPvvF
	mW1SYBsSaoBv/DtQW2u0oGkodWL2s8JltqamqQFuh309cp6zO+8esXXkkAYlwVuvi1JO
	+EyO3ay4gUMxvXTUuqYhFypdomy8HOeVAJAcSuX3aFB5neLx+1gmKdq+52B3Jr1pK81D
	3kFJqS4/XNsOkUqxIwWafovt1vyEZ4JkQvaKvVUdkZsAyMDOsTzH38Cq/lOqRKX81psm
	81Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EknFjPLjkhSTTwSWGiUQ73EHcMHUNhuf1iSTs5Epu3M=;
	b=hdCjrGD4YuXIdepZS18ZT+coKFKMeUCaSKilQw03p4VFq0sT/Fc8OdjNcddSA7JW0n
	KcAmUWC39+ssuybFh5LLdwllvxLe6VC74a6AUYVExVs4rjaGapresDbY76Daq1SeTogt
	MbUAz5Qz03PWi2ukDRc51DqgFQkzuFSfoNlcXefmMOrCmKjya4KOeVah71VQD8E6RLD4
	28IisO3ZEBryYrHC6sZxNqS8/VedrYqNsLI/S8yFNo+1nFB9Ra5gNlVOQIzqvl+7TCz9
	bB7jqvIBsXBrD3AK5nJ6M2RBIwD87pLGaQuoY0D8r04/d3OXlOyDR1LsHtbk0O/zXX7H
	DgQg==
X-Gm-Message-State: ALoCoQmOblf7zImcHZISxS/23IJ2Fw2eaoeFMp3ZR2XMhe1Mq0BtxuwRQchu2PJIGCOPPlR/gtKu
X-Received: by 10.28.21.9 with SMTP id 9mr11003598wmv.22.1447240807395;
	Wed, 11 Nov 2015 03:20:07 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	bf8sm8480023wjc.22.2015.11.11.03.20.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 03:20:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Nov 2015 11:11:47 +0000
Message-Id: <1447240308-2849-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] glibc: fix Upstream-Status tag
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
X-List-Received-Date: Wed, 11 Nov 2015 11:20:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glibc/glibc/use_64bit_atomics.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch b/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
index eb7f2b2..16d7698 100644
--- a/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
+++ b/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
@@ -4,7 +4,7 @@ later (would not work on i386, i486). Using 64 bit atomic
 instructions bypasses code containing a bug as documented in
 https://bugzilla.yoctoproject.org/show_bug.cgi?id=8140
 
-Upstream-Status: TBD
+Upstream-Status: Pending
 
 Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
 
-- 
2.1.4


