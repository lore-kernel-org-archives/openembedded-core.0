Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S12Em-0001si-4T
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 21:59:32 +0100
Received: by yenr5 with SMTP id r5so1357680yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:51:08 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.184.6 as permitted sender) client-ip=10.236.184.6; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.184.6 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.184.6])
	by 10.236.184.6 with SMTP id r6mr7921350yhm.82.1330116668886 (num_hops
	= 1); Fri, 24 Feb 2012 12:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ITg10HbGl0tdx7U91BsWPp055t29Vr9ssv+aR+Pgqhk=;
	b=bVwftnp80QaaG9ZgjxfJMITt5eXkEG5NBPdlhY2S2oYoWrV+qGPKP0/7gr6QazYynR
	S5zNMK0awXzhSc1/UcQxatTu7wOpMpLVK+dKCpgEX3vlxDl12WIx/NOG1TV+pSuQvj0B
	Dfk1XPl0HnS7sWhPGLfUF+T/XLEKPNycVtBZo=
Received: by 10.236.184.6 with SMTP id r6mr6016259yhm.82.1330116668846;
	Fri, 24 Feb 2012 12:51:08 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id w44sm15149743yhk.17.2012.02.24.12.51.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 12:51:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 20:50:54 +0000
Message-Id: <ed88fa73fa9370b4b241d0379e7d200c4199cd36.1330116559.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330116559.git.otavio@ossystems.com.br>
References: <cover.1330116559.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330116559.git.otavio@ossystems.com.br>
References: <cover.1330116559.git.otavio@ossystems.com.br>
Subject: [PATCH 2/2] useradd.bbclass: override USERADDSETSCENEDEPS to empty when building cross packages
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
X-List-Received-Date: Fri, 24 Feb 2012 20:59:32 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/useradd.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 1fed755..db874bc 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -115,6 +115,7 @@ SYSROOTPOSTFUNC_virtclass-native = ""
 SYSROOTPOSTFUNC_virtclass-nativesdk = ""
 
 USERADDSETSCENEDEPS = "base-passwd:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene shadow-sysroot:do_populate_sysroot_setscene"
+USERADDSETSCENEDEPS_virtclass-cross = ""
 USERADDSETSCENEDEPS_virtclass-native = ""
 USERADDSETSCENEDEPS_virtclass-nativesdk = ""
 do_package_setscene[depends] = "${USERADDSETSCENEDEPS}"
-- 
1.7.2.5



