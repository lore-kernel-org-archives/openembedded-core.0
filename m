Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TaqvP-0006Bd-Pd
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 17:43:54 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 20 Nov 2012 08:29:45 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so2206800bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 08:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=kXzapxrrsV1cmA+8RhOAZMb4iUpCaZ3+gJWjieOP4EI=;
	b=blGNOHwQ+B2+zwgVQQuNS/5OkWLJfIQjPMcmX4O7iUPfqYP7ICRiyq+sSKwLyTcXRe
	xC6BqcrU0+inEs8QNyiM5lkjN2xwk974mAbPqo/G8NNBGMK+DhByIEhKid9TA6KKgYTA
	cSKAsJIWf2FPXPT4UsEXEdjigA2IUvrTnJmUOBamWvj7PLBK3IQyjgkN23bLydiMvAZB
	DCn8Tur/v/xmBtgclyPMobLfaXHTWhE6PQvyOz5uBUnT42e1YXwzSK7FBsnR5rAiVgg5
	AV9GRh4GaKbwBjbvdUN7I+ylV1CbEoEMe+l6Hh1IXwR1vxonfhrhyI8kmyUWMFUXfjzh
	pLqQ==
Received: by 10.180.102.166 with SMTP id fp6mr15419473wib.9.1353428979681;
	Tue, 20 Nov 2012 08:29:39 -0800 (PST)
Received: by 10.180.102.166 with SMTP id fp6mr15419455wib.9.1353428979513;
	Tue, 20 Nov 2012 08:29:39 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id n11sm1122046wiw.6.2012.11.20.08.29.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Nov 2012 08:29:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2012 16:28:13 +0000
Message-Id: <1353428893-21856-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk3v0+kTE+bJSFBJsGCn0rqCzXODdyJ+9YPPpP9rSiwn2sYq5E7W81NXlMm8A2p/Z1G441b3eEFGbrCKxzIJHYGn12Nl10XqNfdruQ3lf8z6E0IAOE4EXgXF6qEGSeRrnLDXRM7wgEY1tBlDvELI9CYZaLGmus6kuke8TLNPU8LVZgLEgGCh/mR85QTyeythoMdWETu
Subject: [PATCH] ia32-base: fix typo in XSERVER_IA32_EXT definition
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
X-List-Received-Date: Tue, 20 Nov 2012 16:43:54 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/ia32-base.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index c2d267a..ab8ef65 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -33,7 +33,7 @@ XSERVER_IA32_BASE = "xserver-xorg \
            xf86-input-synaptics \
            "
 
-XSERVER_IA32_EXT = "
+XSERVER_IA32_EXT = " \
            xserver-xorg-extension-glx \
            xserver-xorg-module-libint10 \
            "
-- 
1.7.10



