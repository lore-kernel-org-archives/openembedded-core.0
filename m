Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8EFB9734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:25:08 +0000 (UTC)
Received: by pdjm12 with SMTP id m12so36895694pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LD3i1+Wii70uaQikeSL9HaQ/Mq5zyGojW0pF0YkzWGo=;
	b=MS0LURTUf12W4P0AXhrfScW4H62rzqxP2OxzQPeT6QuO4ZVVKr7YZmV6eitVhhct2p
	S9g2N/gHflHGhc3sSo6Lk/Wi5lct6wOsvU+u037fvLIYlKZ4hGkvGzaTLQL+3RcNYFXy
	RH3HOhhyChvnRBPBlsgNjESIGFnDpsayn/yPr7SbtOq171n6oo4LXncr6KMhYEAGoYz7
	JE6HKcUx8iPq4spNByBsXRzZ17vwtAIPrTMW/SmnzgDipeIL3o3gwJKzpZ26ZSAO9s2l
	tzJCeJtELyJ63POTCqmMNDnwB/J+RrXDpwbf2BlxUtyNzkk5lEtma420hmM1zZ+29AJH
	jjRA==
X-Received: by 10.70.43.10 with SMTP id s10mr71674070pdl.57.1433445910014;
	Thu, 04 Jun 2015 12:25:10 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id nm6sm4493240pbc.75.2015.06.04.12.25.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:25:08 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:24:49 -0700
Message-Id: <1433445889-7311-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433445889-7311-1-git-send-email-armccurdy@gmail.com>
References: <1433445889-7311-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 4/4] x264: use x86 over-ride instead of i586
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
X-List-Received-Date: Thu, 04 Jun 2015 19:25:08 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 0e856b3..105ccae 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -51,5 +51,5 @@ do_install() {
 }
 
 # PIC can't be enabled for 32-bit x86
-INSANE_SKIP_${PN}_append_i586 = " textrel"
+INSANE_SKIP_${PN}_append_x86 = " textrel"
 
-- 
1.9.1


