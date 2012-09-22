Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFT8P-0002or-Fv
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 19:04:53 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so3031926wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 09:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=abG9W++b3NRh9YtfXDX9v7Xy9iPRaP0jc2wthZOhEi8=;
	b=mJoiRj53LHipsr72Y4u0Yc01YvRw0fxG/WcemUqymNBFfg3dTMaHxkQTohWJITH0wc
	0w/vpX/Gl9M7219I+u59kKUIKohcTh0c/BoLkMdkuvA6QpWuTPhE6g9tdR5wSS6NXVPX
	f9MsRQc4cqFOnXVwrlKp/fUZ1kP5SqcIG58Xol+/zfTRFd5UXfSlbQMhE87E50gDhI89
	Tia5LI9kAIGEnPtnDUo/PWA0Sj3l4kUauhxQMWtNHU9SiPwZA/Z5riChWe9NP2/pFfCD
	bNqlQA+rIC4NA9x1HsYcMt4rIMJsW/wv+ClYB6GijnbON4oQ72+UmWonl7LqbHOl7TQR
	vWPw==
Received: by 10.180.98.138 with SMTP id ei10mr3937240wib.1.1348332730424;
	Sat, 22 Sep 2012 09:52:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ct3sm4505929wib.5.2012.09.22.09.52.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:52:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 18:51:15 +0200
Message-Id: <ba395f92c230971f90707e2b189591f81267b8b1.1348330479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
Subject: [RFC 3/5] optimized-tune.inc: add optional distro include
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
X-List-Received-Date: Sat, 22 Sep 2012 17:04:53 -0000

* selects more optimized DEFAULTTUNE for some packages
* for some machines it could be de same as DEFAULTTUNE

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/optimized-tune.inc | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 meta/conf/distro/include/optimized-tune.inc

diff --git a/meta/conf/distro/include/optimized-tune.inc b/meta/conf/distro/include/optimized-tune.inc
new file mode 100644
index 0000000..25e1320
--- /dev/null
+++ b/meta/conf/distro/include/optimized-tune.inc
@@ -0,0 +1,2 @@
+# list of packages where it's worth it using OPTDEFAULTTUNE with cost of separate package feed
+DEFAULTTUNE_pn-openssl = "${OPTDEFAULTTUNE}"
-- 
1.7.12



