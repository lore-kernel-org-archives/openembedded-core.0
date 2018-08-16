Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC8978F2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 09:07:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id s9-v6so3725386wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 02:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=vVdc7OgoH0uxD06+ufIMKSEv7IlRaDHLAIkqfFHihYk=;
	b=WC/EYnRYc40KhrVsnGJCAAQ3ZSKTKrV/a0ZhVRnlfLZJ9xc7yO33JA0FA5JfYaVYur
	UIbXNq9oTB87qUtfbfKTDDswNMVWowRL6bl2jTQoR6BFCz20M+FcsHPz4zdL8qO8qaqY
	PmrAg0XB9SpH/DJFaAe7rSDUGWe51YoNthHxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vVdc7OgoH0uxD06+ufIMKSEv7IlRaDHLAIkqfFHihYk=;
	b=flSfGlKRMZ5UWGDQh6TY+JCqvH/VDyYHEItleuNKsvdd4gvi0x4p46ktknMLxQJoqX
	GdPvH40KYIy0h/J0ncDs0CFkY5qiIsQtNuGfaTKUIq5qmjKj+UxDdPb4HmTmAB4fiwmM
	CMKtBMcQ4RIRzDO07I2WiyVB7Qi19hOtd/53oq01zgiL70IdyjMPP4R54WFLEX7ySa9v
	xvx2trP7/t4oLyapJXEs+5uFgc8chRkMCpnnZOpLHVlbyEK7W73/q/tC1bHSPBYfhUAh
	gwtFNAdiQOpoyfP7pQT4/M1oGTKmbohM0GglLGCsQFHCxgBJOXeOcNEgr/KKYlEI31FR
	7Hsg==
X-Gm-Message-State: AOUpUlFw/QtkHlwMerboIBeVh0K7+mPRXdLiJhuP3Pa3udhxkWhqtHr3
	OInacEptmRuD2MYpjNykFRzYxDmMhjg=
X-Google-Smtp-Source: AA+uWPzFKgejiwTcfZSrfqZATL/FovISLnkugyXqNCUQjatI7PbO0bzlOaeOSmH1iJDYljjqBEBUkg==
X-Received: by 2002:a1c:a009:: with SMTP id
	j9-v6mr14319868wme.132.1534410422782; 
	Thu, 16 Aug 2018 02:07:02 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q11-v6sm26042142wrp.58.2018.08.16.02.07.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Aug 2018 02:07:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 10:07:00 +0100
Message-Id: <20180816090700.17122-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] glibc-initial: Add missing bison-native dependency
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
X-List-Received-Date: Thu, 16 Aug 2018 09:07:02 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-initial.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index d3cfdcc4ccb..acd0d6b1dc5 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -1,4 +1,4 @@
-DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial libgcc-initial make-native"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial libgcc-initial make-native bison-native"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 
 PACKAGES = ""
-- 
2.17.1


