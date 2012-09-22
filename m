Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFT8X-0002pz-5h
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 19:05:01 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1309035wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2012 09:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=m9LKhwyu7nsiyK87IiywjJWASVEnWjBuKs6IKPIKspE=;
	b=Z7Ok1eb2WX+hrs8lBpCf8C2XFtaPIiMbbWLrdIPw1d86yr9syC+W6OproCFP9XrOVc
	ph0vVTvcDtM5OPZibUGpDJDNnD72prhNb00zjnpAbQj2WpaZd6PXrVC8QOxlarBwJH0+
	IwKqwqH9rrRvICl9hVRuQ5lxapMTEwbQEKqS3IEG1SJPdPDBrdREnEuBURaKoafyIIpF
	sW9faretAkOGaRr2e5hAyttMeR8vle0CXbRF9M96jRXNlUgURS0gm1ln70pj5VVf+7zB
	cGSAqtAL6PCdudCxj1mSu25fs0GT/IW39Gu5Cu3dlORhf9x/jCyIozB5H8ub6Smtu+D8
	kRAw==
Received: by 10.216.140.135 with SMTP id e7mr4505768wej.149.1348332738127;
	Sat, 22 Sep 2012 09:52:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv8sm10907717wib.0.2012.09.22.09.52.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 09:52:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Sep 2012 18:51:16 +0200
Message-Id: <2e501ae19242e1522d7ae590045d8bb7c6813180.1348330479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348330479.git.Martin.Jansa@gmail.com>
References: <cover.1348330479.git.Martin.Jansa@gmail.com>
Subject: [RFC 4/5] bitbake.conf: add TUNE_CCARGS[vardepvalue]
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
X-List-Received-Date: Sat, 22 Sep 2012 17:05:01 -0000

* we don't care about expression but value
* e.g. tune-xscale and tune-arm926ejs have different expression
  in TUNE_CCARGS but with the same DEFAULTTUNE the result is the same
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-September/030032.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e433fcb..519a7fc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -98,6 +98,7 @@ HOST_EXEEXT = ""
 OPTDEFAULTTUNE ??= "${DEFAULTTUNE}"
 TUNE_ARCH ??= "INVALID"
 TUNE_CCARGS ??= ""
+TUNE_CCARGS[vardepvalue] = "${TUNE_CCARGS}"
 TUNE_LDARGS ??= ""
 TUNE_ASARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
-- 
1.7.12



