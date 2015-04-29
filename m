Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 94C99716CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3T9adSZ021935 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:36:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id otNfoyoTuc6m
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:36:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3T9aR1W021916
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 10:36:38 +0100
Message-ID: <1430300187.19130.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 10:36:27 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] default-distrovars: Clean up gcc license issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Apr 2015 09:36:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are several entries here which are not needed with the
modern license handling code:

gcc-source - moved to direct handling in base.bbclass
             (due to version appended to the name)
libgcc - Listed as GPLv3 exception for its packages
libgcc-initial - Listed as GPLv3 exception
gcc-runtime - Indivisual packages listed as GPLv3 exception where appropriate

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 04037c3..29b762b 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -25,7 +25,7 @@ IMAGE_FEATURES ?= ""
 # directly part of the distribution. 
 HOSTTOOLS_WHITELIST_GPL-3.0 ?= ""
 WHITELIST_GPL-3.0 ?= "less"
-LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan gnutls libtasn1 libidn gcc-source libgcc libgcc-initial gcc-runtime"
+LGPLv2_WHITELIST_GPL-3.0 ?= "libassuan gnutls libtasn1 libidn"
 
 COMMERCIAL_AUDIO_PLUGINS ?= ""
 # COMMERCIAL_AUDIO_PLUGINS ?= "gst-plugins-ugly-mad gst-plugins-ugly-mpegaudioparse"



