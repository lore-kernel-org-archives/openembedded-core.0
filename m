Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrapet@gmail.com>) id 1UT6Tz-0002Rn-6f
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 10:15:57 +0200
Received: by mail-wi0-f175.google.com with SMTP id h11so383064wiv.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 00:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=JGXJ0mWj1uSx0LEmj0beSiEGJzsEUqGtWtgQ81CNkcQ=;
	b=XW0iaD+fHNAditBq/MkwDiP2Jdmv4mWuNuQQ93o4RZERGBAPW5IoQOf0oasc7boKBe
	6xZ9mKQGm8WPPCqXEeXNEamSWv7i0exDIUxK7SfVu2ef9XJ7QnOzp+9KWdRwKp+5drYg
	ba/rYycPvDHDZpA1xbJerwOkBbl04j1pIH6ZL+WpJXSgDs+01rvCA3q4MMZdpDAdLtvH
	ydkZEDdPBewc3OJmiUmAvDXTo2ssZsAsDyXsdSk3zz6X3DsqIMUxkxli3rh2kcnDrS8D
	oqUN3vyWm2FZxJX8Ma0qsYhHmFeyIRU+sCh8Cb0psNi5mdMclfi0O2UWRa8KDijdp0Vi
	EvGg==
X-Received: by 10.194.93.68 with SMTP id cs4mr23903654wjb.17.1366358273887;
	Fri, 19 Apr 2013 00:57:53 -0700 (PDT)
Received: from [192.168.0.48] (mur75-1-81-57-45-18.fbx.proxad.net.
	[81.57.45.18])
	by mx.google.com with ESMTPSA id t7sm1684556wij.2.2013.04.19.00.57.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 00:57:53 -0700 (PDT)
Message-ID: <5170F89D.8000307@gmail.com>
Date: Fri, 19 Apr 2013 09:56:13 +0200
From: Matthieu Crapet <mcrapet@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.12) Gecko/20130116 Icedove/10.0.12
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libomxil (0.9.3): drop unecessary dependencies
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
X-List-Received-Date: Fri, 19 Apr 2013 08:16:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Since version 0.9.2, Bellagio's components (vorbis, mad, also, ...)  are shipped in separate packages.

Signed-off-by: Matthieu Crapet<mcrapet@gmail.com>
---
  meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 1 -
  1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index ded0e1c..8c3166f 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -4,7 +4,6 @@ LICENSE = "LGPLv2.1+"
  LICENSE_FLAGS = "commercial"
  LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb  \
                      file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
-DEPENDS = "libvorbis libogg alsa-lib libmad"

  PR = "r0"

-- 1.8.2.1



