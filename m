Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhT7-0007gu-8T
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:58 +0100
Received: from mail-ea0-f199.google.com ([209.85.215.199])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:29 -0800
Received: by mail-ea0-f199.google.com with SMTP id j10so3543584eaa.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=bCaVcdMWausSm6Klh08/3zO4wH0ykpB0irVZPV/T560=;
	b=cjFToC873et1DsFBCgfzz68g5hG2xKI2VaLnhxViETBzA66eeupQto5vu63mdH65os
	/meTiUvm/PlLAlpP5qOPCRTUryIgdEyM3DsD3ASIPMDWw3dQN5+fMPbehBQ9fGZCeK2R
	E7QVmiRDYcRgpL0ZUrzggXWfDUfMnCBAlitfoJx3O0IkSuycilcee77nzU1KJCMnDchX
	jpiD1Dk23CtqhbbdexIAXlPLvdvAA7KboRD02PD09oStUzcxvEHL3GCENmpJd3NeblLD
	SldpXGMHLIiOzaKrXlxT/UtIfUwEqkp12aAhlq1Hx/Qh4ieOxrtDYyxapPLDNZT6cTrj
	diOQ==
X-Received: by 10.180.92.100 with SMTP id cl4mr9263396wib.24.1358635767059;
	Sat, 19 Jan 2013 14:49:27 -0800 (PST)
X-Received: by 10.180.92.100 with SMTP id cl4mr9263395wib.24.1358635767011;
	Sat, 19 Jan 2013 14:49:27 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:13 +0000
Message-Id: <2a93db0fd8302290ac0f2c6c83ea640ad273c3e2.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnbc8CpsvRdujCN+GHcTly+xhmiTr6EXQCR9Y1hP84CihNw2rADrhpOqYLZ33cgSqct7U/3SLHWVyLRH3ddWOwzKzfR+mTZEMRKssYs1S3iBcFdcJvWOZ0FnF0l+FfcfRz0drSYCQywsejPW8mCW9Rd36A2yY6UQfTQUOGLJzPxuW4BePPfnVRSHeoaqDYQWWLh50u1
Subject: [PATCH 10/10] libpam: register PAM session with logind
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Jan 2013 23:05:00 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

This make screen/tmux/etc work as intended.

Signed-off-by: Martin Donnelly <martin.donnelly@ge.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/pam/libpam/pam.d/common-session |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam/pam.d/common-session b/meta/recipes-extended/pam/libpam/pam.d/common-session
index a594dd9..7fd61fe 100644
--- a/meta/recipes-extended/pam/libpam/pam.d/common-session
+++ b/meta/recipes-extended/pam/libpam/pam.d/common-session
@@ -16,4 +16,6 @@ session	requisite			pam_deny.so
 # since the modules above will each just jump around
 session	required			pam_permit.so
 # and here are more per-package modules (the "Additional" block)
-session	required	pam_unix.so 
+session	required	pam_unix.so
+# Register with logind to make screen/tmux/etc work
+session	optional	pam_systemd.so
-- 
1.7.10.4



