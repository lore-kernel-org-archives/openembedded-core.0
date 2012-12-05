Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TgMaG-0007qi-EF
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 22:32:48 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so4374914lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=4DHpt52KIIz7qgCWoP98ObUje7jorpHvg7LW7AIsFfQ=;
	b=pi+3Mirg/PKLpQlUfpWtITT/ItvytNkVmO8sFJPRn9LkKOna5eDt/qvltutEaNW998
	a3rOuVa6GJs53KsHRrLOczaHXCKhc6qv4Wv9B/t7IpJh9Kv31ZJGu+AZWRXnc0FJ9Qtz
	MJ3ydv4odDxiRj4mm2uQuAI97p5YyQf5qcpVrftyxdqA7HaVnvcfXVFt3Ta5TfFHxx5b
	dHKHqAPGqrIRbFhNIfh0Wq7Vkw7vWcifpvhHJyWWSS8q8euKnXGYA7tlwv7SQLp/wKKk
	YINIE3xl7gIc3htwwvgwdOfHW/+twUn9NPlXlXfOe6cMVUrn5Gp7EPeRwmW60bqwjjGi
	gDQw==
Received: by 10.112.40.197 with SMTP id z5mr3264325lbk.14.1354742304167;
	Wed, 05 Dec 2012 13:18:24 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id hu6sm2602581lab.13.2012.12.05.13.18.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:18:23 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TgLlw-00074U-5f; Wed, 05 Dec 2012 22:40:48 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:40:33 +0200
Message-Id: <1354740033-18500-3-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354740033-18500-2-git-send-email-cazfi74@gmail.com>
References: <1354740033-18500-1-git-send-email-cazfi74@gmail.com>
	<1354740033-18500-2-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 2/2] libpng: add 1.5.13 recipe
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
X-List-Received-Date: Wed, 05 Dec 2012 21:32:48 -0000

License md5sums differ from 1.2.50 only because of version numbers
and release dates mentioned, and formatting changes.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-multimedia/libpng/libpng_1.5.13.bb |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/libpng_1.5.13.bb

diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.13.bb b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
new file mode 100644
index 0000000..90c8bed
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
@@ -0,0 +1,13 @@
+PNV="15"
+
+require libpng.inc
+
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=00b5b35853278d508806c2e5860e82cb \
+                    file://png.h;beginline=207;endline=321;md5=50e583fb60bb36f37ab5023b2a3715d1"
+
+SRC_URI[md5sum] = "0b607a685da977f1bfc96e1c47055183"
+SRC_URI[sha256sum] = "b843f9cb01d10ae22acd9aaf58aceaa4a6aeb9cf78943b41588004b271257aee"
+
+inherit autotools binconfig pkgconfig
-- 
1.7.10.4



