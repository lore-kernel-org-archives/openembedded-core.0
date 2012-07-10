Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Soc5O-0004gd-1X
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 17:10:46 +0200
Received: by qabg1 with SMTP id g1so2527377qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 07:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=0KYA7m4Xrqhv9M0TFnMT7dKBmKbSFq67ULSyL0bnpxc=;
	b=m3c1Y/1dTQmBd3lsMi6gzX/mHKiT68lf9fUWKZNxlHF1IK76a9dG3FbvCaRW8QjBmK
	wAVgOYBMuxwczGKo9VW+cyLJYkMX52rVzyuhmcVEMR7dMjzBQ7j9hRQBOQuuwhD1qXcf
	pLDKMm2C+PhZP+6ihuybPLBh4CoNFDee3v38Xd7ENc7AfoUvDwDDVr8jRb7oEVRahmgS
	f3Fszq+ZCQRwkBchwwpNOX0x/6ieLXPJsr/JNxQ7OnJfB+5JPZj2kRrIupSsg0M2Y+is
	H5YKvkup2KDIjLoDVie9V8eNFEBto2vCsdzFZ8JBsAnxkvMStxYEiGRlZg+2dky6W82g
	4/zQ==
Received: by 10.224.216.7 with SMTP id hg7mr28224755qab.3.1341932375160;
	Tue, 10 Jul 2012 07:59:35 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id n2sm65763443qap.10.2012.07.10.07.59.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jul 2012 07:59:34 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 17:59:19 +0300
Message-Id: <efcaf4f9efe634659e0ba153751681c39a129459.1341932186.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
References: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
In-Reply-To: <cover.1341932186.git.andrei@gherzan.ro>
References: <cover.1341932186.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQnkOsnu3I3pwGIv9TaGYZDMKDBOvlPe5NiDtJxNib758GRfWv78xBeGp0eN5aH+bQxhtemK
Subject: [PATCH 2/5] bitbake.conf: Use the new form of features_backfill function
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
X-List-Received-Date: Tue, 10 Jul 2012 15:10:46 -0000

This function was modified in order to be used with other
variables then DISTRO_FEATURES. Use this new function name and
add the parameter needed.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3453a86..855ba6a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -722,7 +722,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio"
-DISTRO_FEATURES_append = "${@oe.utils.distro_features_backfill(d)}"
+DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
 COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "alsa", d)} \
-- 
1.7.9.5



