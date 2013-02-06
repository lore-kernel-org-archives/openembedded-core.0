Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U35Fe-00088m-7C
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 14:41:26 +0100
Received: by mail-pa0-f54.google.com with SMTP id fa10so800373pad.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 05:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=wdNe9xGGKVxV8ybUNi3VA4z1vEkf8srrVUiw2Zh8NJc=;
	b=B3Pz19WXxGJLMrbUmuJ07weT+0xmrxxoz28Ed2aN4Iblu15RRc+flo+nHQJ+EjjgAu
	ibw70C98M4E7rQqnvChzR51KQw1FcloswMVzkN+KEadl5a0uBgas93VHHr4zlMP3C4Vu
	FnMQO/tMZPOKsZXScEKYYtzZsB5JWGNdEMMKn2E13kZcqrL9ujo9SyMMjXTsomAcGbek
	fReetvm/xxLITDmMwI4OEvI173hJXg1rF4FgjL02yPNRy5tvqR5OCvohdW50ySqptzSw
	ojrRK0J2GSq3VnK8UVtbRqJDAKXOEchMy1ZBCTFiCEON/BWXKAOckLkj3M/fAm8JsQXT
	10Gg==
X-Received: by 10.66.72.97 with SMTP id c1mr75580554pav.48.1360157134415;
	Wed, 06 Feb 2013 05:25:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d1sm37754581pav.6.2013.02.06.05.25.32
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 05:25:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 14:25:22 +0100
Message-Id: <1360157122-5181-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] insane.bbclass: Add missing R* variables to pkgvarcheck
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
X-List-Received-Date: Wed, 06 Feb 2013 13:41:27 -0000

* check also RSUGGESTS, RCONFLICTS, RPROVIDES, RREPLACES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 58fc70c..d285e56 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -908,7 +908,7 @@ python () {
 
     issues = []
     if (d.getVar('PACKAGES', True) or "").split():
-        for var in 'RDEPENDS', 'RRECOMMENDS', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
+        for var in 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RCONFLICTS', 'RPROVIDES', 'RREPLACES', 'FILES', 'pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
             if d.getVar(var):
                 issues.append(var)
     for i in issues:
-- 
1.8.1.2



