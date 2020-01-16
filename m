Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9AD7F971
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:02 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q10so10359304pfs.6
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l5x1enb7HhvDLuWd/dAzUu9AVo/DeMOiBHkgrt/5PDc=;
	b=hH1pKQzqKa75F4GhIdy6kUGjsxdFf3u/2xnwhC3tGjRYRf19RtcKcxv0qpc6ZOlCZE
	+fYEI8DLLCKBes5LEc20UBmZ9xwr4cJLf7tomOYGdZqCp6q8mgpuq4kBcOZSXcfy1L22
	nJ4fFKdaoM6YSWUir8ZeYaiODWXDfYPRDO5IaayeDho0JHUj7EBFOtutAcddO1sgBDjg
	oSHcAClQa4InHoU5HxxDQgPVfabiUglEiFrMUbUOF5N81BCwCKy3jlUc/qhrci5H2GF8
	BrlZi/XUXMAF4oPTUyNJbdFvzcYTTiHqCyhRq6wGvnt5+Tj1sb4A2qSG9vdjS2HdRdlz
	rVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l5x1enb7HhvDLuWd/dAzUu9AVo/DeMOiBHkgrt/5PDc=;
	b=W4IZmNpm5PNjgpZiZNCbHxXdaO/aSKuGx7WU3H3Fm+j21sAPa1U2GYTVOWTG+pSLp3
	hzohRGBwd+ctunBw7kdp3NN4XjtavYffu+iwl9iFp9bjTezpDjzwNke1okjLNbcXx2e0
	AGVoPCL0v7Mz0i6h8VGra2rOcOEDr48T7S25WD84cuMewbLDlz19F1IcCExlQlu7AITI
	OA1wc36yWL8q6VpBp3/yJCUBWUpvqSqIaskypCmr/BSGJ9BvWDNoNw2bOJAnCFNpYNPt
	OPeQRUnOsp63bYYY9BEnzAbPdg1FRhumeRNS4OLtG0/uBRef+39GY0HCWfj9C3en4bd4
	O3Qw==
X-Gm-Message-State: APjAAAVrjUPAtdd4XGchXfNVvLUV5kAqkOTXwLOJOcue9wU/KTuj+3ac
	6YX2Dj18Oq8mUe8Yg1cdCFu+D8Cy
X-Google-Smtp-Source: APXvYqxTHiOkF5NPSeeBHm5sxcQC2EPvjjfZShyyWt3iNNp+rRxRljGbRsuk7/Vo7UJj9M2EN0hIKg==
X-Received: by 2002:a62:e30d:: with SMTP id g13mr38053091pfh.92.1579188063327; 
	Thu, 16 Jan 2020 07:21:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.02
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:28 -0800
Message-Id: <d1a16e6f0edda5d9f03191d187788fc8b666bd7f.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 19/32] cve-check: failure to parse versions should be more visible
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:02 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f87bcc9dc6..1c8b2223a2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -222,7 +222,7 @@ def check_cves(d, patched_cves):
                             to_append_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
                             to_append_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_start, version_start, cve))
                             to_append_start = False
                     else:
@@ -233,7 +233,7 @@ def check_cves(d, patched_cves):
                             to_append_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
                             to_append_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
                         except:
-                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                            bb.warn("%s: Failed to compare %s %s %s for %s" %
                                     (product, pv, operator_end, version_end, cve))
                             to_append_end = False
                     else:
-- 
2.17.1


