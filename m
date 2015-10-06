Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id F1D05605D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 13:13:55 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so165748292wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 06:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=9OTG3m7MS2W+q/qG11Mm1UhKLeCBTnHF/cR1z1Lr7GA=;
	b=YSoniLa4UtDOiF+rOhSNZ8f0G19qsOZKShKd8x3z2eS4moa9xnY+AUtQmhEyEcUaDY
	thwe3/S5VblICZs+PxDDDWxin4PYS6pXXGH0praJXzSYT6s4uImpnZ01Dz6lJ/qxTpt8
	57lzyHqNr9fqZnmEc48w09EzeH6aD7JQSlJrmHm391vUeDwAvBUey1D8cg5baUTvHBkd
	wYz6rGiuuWW47SpsTQCmRoB8CpGbHpRfZ+kGblNkfGEj4TDeB6V304S/REVzBaaRuVAb
	IDS8rxwG1xCXrZ1QOlZZOgwUKnMCcp3KvnrBTptW9YehuyQqrooshvRVCuMccHiHESvG
	y99w==
X-Gm-Message-State: ALoCoQmE+GoWBit7HNJEIaAsSOc+BGtmV3XCXWxQW7vCDZY+vfPTIgIkLY9ORaj61T584HH96HJy
X-Received: by 10.180.39.136 with SMTP id p8mr19005114wik.10.1444137235164;
	Tue, 06 Oct 2015 06:13:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jt3sm29408553wjc.12.2015.10.06.06.13.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Oct 2015 06:13:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Oct 2015 14:06:35 +0100
Message-Id: <1444136795-1844-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1444136795-1844-1-git-send-email-ross.burton@intel.com>
References: <1444136795-1844-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] readline: actually apply readline63-003 (aka CVE-2014-2524)
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
X-List-Received-Date: Tue, 06 Oct 2015 13:13:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This file wasn't named as a patch, nor told to apply explicity, so it was just
unpacked to the work directory and not applied.  Rename the file so the patch is
applied correctly.

(thanks to Petter Mabäcker <petter@technux.se> for spotting this)

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../readline/readline-6.3/{readline63-003 => readline63-003.patch}      | 0
 meta/recipes-core/readline/readline_6.3.bb                              | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/readline/readline-6.3/{readline63-003 => readline63-003.patch} (100%)

diff --git a/meta/recipes-core/readline/readline-6.3/readline63-003 b/meta/recipes-core/readline/readline-6.3/readline63-003.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-6.3/readline63-003
rename to meta/recipes-core/readline/readline-6.3/readline63-003.patch
diff --git a/meta/recipes-core/readline/readline_6.3.bb b/meta/recipes-core/readline/readline_6.3.bb
index 55964a6..6ba1c18 100644
--- a/meta/recipes-core/readline/readline_6.3.bb
+++ b/meta/recipes-core/readline/readline_6.3.bb
@@ -1,6 +1,6 @@
 require readline.inc
 
-SRC_URI += "file://readline63-003 \
+SRC_URI += "file://readline63-003.patch;striplevel=0 \
             file://readline-dispatch-multikey.patch"
 
 SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
-- 
2.1.4


