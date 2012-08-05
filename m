Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3Lf-0007eD-O4
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:35 +0200
Received: by weyr6 with SMTP id r6so1373227wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=2jzHPY0AU2u8I6RL2k5zdf/xAI8MucD8Qq4dVIjI34I=;
	b=Y20IOgBaAXQjX2GflxRUZvsUWMMMzuEE/gQPkF0mHVAXqma1wGbY/tvgk8sv8p7pOe
	N9iLjfVHCuCYoB08aK3TyXC1YWo5Gu9jq5S9R0kYEelXn1wssuu3EfcYZSTpmZKerfPF
	U0BjigHPG+fxmO/iYpxsxlfyhxhg8CqsyrN9nCgqSPmZ+cVj9sN81g1xXRmCTVRtUa1c
	pASPDgOiEG8JIenALtosYE3J/uK5Wqcv7L5mUsMvOWBAWw1MFngARfAhQRKh8fU2Aw95
	JCnrO8KfpU9o4PiV5d2zLwIU2fCmEt5ymukzcnaCnTZn0HGjZPxx2rwYcuogZQOaMqVK
	ok8A==
Received: by 10.180.95.193 with SMTP id dm1mr11486515wib.10.1344182092507;
	Sun, 05 Aug 2012 08:54:52 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.54.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:54:51 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:52 +0200
Message-Id: <1344182057-15981-6-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
References: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Gm-Message-State: ALoCoQnbVCY2w7qVrv9j6JhsoSndbWxMb/SLepngxnSqw1CBC6s/XrEiBNzAoZFcuJXnELMufQCL
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/30] lsbtest: use ${bindir} instead of /usr/bin for packaging
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:35 -0000

It is considered good practice to use the build system provided
variables instead of directly specify hardcoded paths.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>
---
 meta/recipes-extended/lsb/lsbtest_1.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index 1191164..a563678 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -14,8 +14,8 @@ RDEPENDS_${PN} = "rpm"
 S = "${WORKDIR}"
 
 do_install() {
-	install -d ${D}/usr/bin
-	install -m 0755 ${S}/LSB_Test.sh ${D}/usr/bin
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/LSB_Test.sh ${D}${bindir}
 	install -d  ${D}/opt/lsb-test
 	install -m 0644 ${S}/packages_list ${D}/opt/lsb-test/packages_list
 	install -m 0644 ${S}/session ${D}/opt/lsb-test/session
-- 
1.7.7.6



