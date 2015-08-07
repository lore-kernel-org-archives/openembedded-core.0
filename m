Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id D17BF76599
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 01:54:40 +0000 (UTC)
Received: by igk11 with SMTP id 11so23228878igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 18:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rV/GtaOEt9dzkhbcxlWQYmx1wXhExcysf8UL5WEYVi4=;
	b=BARj149RXsC2bC24zNYcSvIeNz+F1VuK72CmJtHClh9YcqUJYmPI9e97uzsEijXlKY
	/iZ9tk09agE1jQaKa371gQgtAOFbi09X/48B7sm9y1x/2j+rqjOLPSvzjURohvstt3wM
	Uqg0eBMxI15WkwpnmyzZ7l0JajGU6LCQxIaGHjfYUY6hDzHEca7VNw6b9V52S1q28SrW
	pL2YP4WUIf54iN21SslVBclbtZ00P/+SVnee0R1wzdsS94/X9W3jJ1b33XN0Z90AIHIo
	cqne10dIDZGWQVh6XoJntO3fLhrUIjzCmKTrBYjHpcup7MD63n2vFk976ODcamfsJt5m
	TNbw==
X-Received: by 10.50.45.34 with SMTP id j2mr875659igm.53.1438912476824;
	Thu, 06 Aug 2015 18:54:36 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id j3sm2740140ige.0.2015.08.06.18.54.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Aug 2015 18:54:36 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 18:54:17 -0700
Message-Id: <1438912459-7242-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
References: <1438912459-7242-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/4] uclibc.inc: fixup CFLAGS with _remove instead of oe_filter_out
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
X-List-Received-Date: Fri, 07 Aug 2015 01:54:42 -0000

No functional change, but _remove is slightly cleaner and clearer.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index c483228..969c35b 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -57,7 +57,8 @@ export V="2"
 # -O<n> -fno-omit-frame-pointer ends up with GCC ICE on thumb as reported
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
 #
-CFLAGS_arm := "${@oe_filter_out('-fno-omit-frame-pointer', '${CFLAGS}', d)}"
+CFLAGS_remove_arm = "-fno-omit-frame-pointer"
+
 UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
 
 do_compile_prepend () {
-- 
1.9.1


