Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6EEFE73AD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 08:50:58 +0000 (UTC)
Received: by wesu56 with SMTP id u56so7456772wes.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 01:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YPfuUsa/u/CHMeKh5WjgrrYeWB+xklpch6a4OKYb/W0=;
	b=S7jypwy7WKovU8pev1jYcFFzMpNZt/Tp6mD5NSzjny1PVsCgPUNdEiKhlQD9ue/YJW
	685YelzIQBH0odHENFQijdM7Nv4YKMHq/IgUPokY50xxzI7MIVPhqNJ5XjJsPtPRTcq3
	YPjB8sd0iIKKejJaIn35Xa/aGjnWR0Wce7y6oJpBEc4j4RfXFnM+8O0B0I4l2LKYXQZ1
	JV15ysYSW1za8gi1Px1H3birc2Z3LHonk2TUK6MKK/fyY72QQ8hEx2U2/DIGb5ogl0o2
	agyL7A9yQybP5q7YLJEKx/gw1EN1XCZ0pXJLrq1gSl4CIAnvl9Gg4kCfz8TTC3mJwpwe
	Wzjw==
X-Gm-Message-State: ALoCoQlOX2WkmAorAA+hG83OdI+Ku4Iz+ulSpB2UWM7gFX9y4OSrd5+JM7p/T3Xfj0N36ozEjhXj
X-Received: by 10.180.92.71 with SMTP id ck7mr75003729wib.48.1426063858870;
	Wed, 11 Mar 2015 01:50:58 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	hj10sm4388859wjc.48.2015.03.11.01.50.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Mar 2015 01:50:58 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 09:50:51 +0100
Message-Id: <1426063851-24840-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] sysprof: fix arm big-endian build.
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
X-List-Received-Date: Wed, 11 Mar 2015 08:50:58 -0000

Applying the existing ARM patch for armeb makes it work.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-kernel/sysprof/sysprof_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index e18aebf..19c3e10 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://git.gnome.org/sysprof \
           "
 
 SRC_URI_append_arm  = " file://rmb-arm.patch"
+SRC_URI_append_armeb  = " file://rmb-arm.patch"
 SRC_URI_append_mips = " file://rmb-mips.patch"
 SRC_URI_append_mips64 = " file://rmb-mips.patch"
 SRC_URI_append_mips64n32 = " file://rmb-mips.patch"
-- 
1.9.3


