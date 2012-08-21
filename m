Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3f1F-00063d-62
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 05:20:41 +0200
Received: by dajt11 with SMTP id t11so2214675daj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 20:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YISodBNYYeTMjD/FyA1dQc5so6uqQk++7RR1cL36ev8=;
	b=xzIqhNzpdyhImGbzf4dIMe3dnNiOcRsYz69V2tht6dLyi30Li6xsXavkEeWLMdITFO
	zubflZI3trkYndURqM3LGUBKdGuXA7TCZW5POCXb7ix8MwYiiXqrMlsNce7T5TR5ExQU
	M13ago8ozoDlfWOF9Sa/StbbeHv6nAbaOvsuEnE/M98Hmm+0rIyigSaWs42gmCekBgB0
	Mr6+aOCUl21O8gkmyzNsYZ36rKb3lXGurvQf//VUtGdFIwiSXkvwhO5mMtvblQIR6XHF
	9NyTYKwQTkLFF97FgkcnkMdmiV39roMnZy7Xl8nVY29v1Dn3tfN+3Fp6Nf99+d/0mWBx
	viNw==
Received: by 10.68.217.69 with SMTP id ow5mr39711739pbc.35.1345518517368;
	Mon, 20 Aug 2012 20:08:37 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nv6sm429804pbc.42.2012.08.20.20.08.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 20:08:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 20:07:57 -0700
Message-Id: <e83f1d2a926bcf03efe28f9770bb2e23cca03f31.1345518098.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
In-Reply-To: <cover.1345518098.git.raj.khem@gmail.com>
References: <cover.1345518098.git.raj.khem@gmail.com>
Subject: [PATCH 7/9] gcc-crosssdk-initial_4.7.bb: Add --with-native-system-header-dir to EXTRA_OECONF
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
X-List-Received-Date: Tue, 21 Aug 2012 03:20:42 -0000

gcc-crosssdk-intermediate will go away and -initial will
assume its responsibility therefore transfer the option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-crosssdk-initial_4.7.bb                |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bb
index a499883..39c90ca 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bb
@@ -1,2 +1,4 @@
 require recipes-devtools/gcc/gcc-cross-initial_${PV}.bb
 require gcc-crosssdk-initial.inc
+EXTRA_OECONF += " --with-native-system-header-dir=${SYSTEMHEADERS} "
+
-- 
1.7.9.5



