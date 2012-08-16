Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T28e7-0004wA-07
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:34:31 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so2157030wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 15:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=yHCAVaI/C9v0dPz9A4ExLxV/MEp2Y9jCtI+z47DycTQ=;
	b=YQP9phFdWe2YMzqPt1e1ND1YGDl7knRNqj5APqfQmUvWWXfPiDMk6/W6ZRxq4obPhL
	XkBk6ezXPCd8Vmoc1pFnGgD/rAl0d6RWO7nF92G4RbDK1Ukbm0XXn9jGiBSmdnplBK3/
	+dZuMpb3Roer8zC1V9Chry1CBygqgWgZaAvdibrKvECk87FtkfhMuys00U7fxCGscwdr
	NZy5fvMEf7tlDKYsNkb/WLBITnmgcBtc5EdFjRmeifsEiwtWvECD++XhIZoZ4WvNIww0
	cItsZTPwsYxT6aH3u+q35Y4r3py08yrJcGST8sDOiauTXAx+H8TXT8YUBOhCMJ48Q0Nz
	V4UA==
Received: by 10.180.100.131 with SMTP id ey3mr6552426wib.15.1345155755294;
	Thu, 16 Aug 2012 15:22:35 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id ck9sm9272711wib.2.2012.08.16.15.22.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 15:22:34 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 01:22:28 +0300
Message-Id: <0f6e57fff6f44d54db8f92aa9426df015c7d963d.1345155622.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1345155622.git.andrei@gherzan.ro>
References: <cover.1345155622.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQk7m/UqlZ+FL7e0sd2PaEB0zqdlmTGkzCPStMT8hrIX31kVXVT1txLG4uYTQkFLn4zFiKKo
Subject: [V2 PATCH 1/1] subversion: Inherit gettext as msgfmt is needed at compile time
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
X-List-Received-Date: Thu, 16 Aug 2012 22:34:31 -0000

Avoid error:
| /bin/bash: <path>/tmp/sysroots/i686-linux/usr/bin/msgfmt: No such file or
directory
| make: *** [subversion/po/de.mo] Error 127
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../subversion/subversion_1.7.2.bb                 |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
index 4f71de5..4182366 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
@@ -7,7 +7,9 @@ HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
-PR = "r3"
+PR = "r4"
+
+inherit gettext
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
-- 
1.7.9.5



