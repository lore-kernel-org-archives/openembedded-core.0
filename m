Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TwBXB-0003ws-5V
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:59:01 +0100
Received: by mail-wg0-f54.google.com with SMTP id fg15so2144542wgb.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 04:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=aTRz6+ZPXjaxOheaEqy1o4i+3EIxedMi9GgI6uOdI/k=;
	b=A8VBTzVEXA/MfcURiRVZmL/1ek7TUoVuu4dihGYNgsYD2O3oaF+QdmyumpEcbHwyZF
	zAaW87KDxsMKtDp4a02ov4E+Ql4lBZMiS9Gfk8mVsQ1ysnsY5aaDi9d/lj8OTfUm6KO2
	eg00oMKfM48aCJz69YhOL9n00eD1JpdqAG9DVaFFWHFsWD9hWrkiy9oWxfdcUjhk2odx
	7xCQbm4zAAG5Lfmqqvtt4USyz03Cv0O/G9uFjiV2tSx47Zt3oRzrf5FNBYNGk+X0xkZo
	fuA3rv6xSj33lkYTeorkRrCXfnmMIi8fPWEYiT53aj2/4t4msOZPzwVLAA06TE0IE58f
	IZww==
X-Received: by 10.180.108.236 with SMTP id hn12mr3498172wib.6.1358513016999;
	Fri, 18 Jan 2013 04:43:36 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id p2sm3660659wic.7.2013.01.18.04.43.35
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 04:43:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 13:41:48 +0100
Message-Id: <1358512909-14714-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1358512909-14714-1-git-send-email-schnitzeltony@googlemail.com>
References: <1358512909-14714-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC 1/2] buildhistory.bbclass: track also complementary package information
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
X-List-Received-Date: Fri, 18 Jan 2013 12:59:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/buildhistory.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 0a5753f..4b80f07 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -318,6 +318,11 @@ buildhistory_get_image_installed() {
 	grep -v libc6 ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel.dot | grep -v libgcc > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc.dot
 	grep -v update_ ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc.dot > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate.dot
 	grep -v kernel_module ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate.dot > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate-nomodules.dot
+
+	# add complementary package information
+	if [ -e ${WORKDIR}/complementary_pkgs.txt ]; then
+		cp ${WORKDIR}/complementary_pkgs.txt ${BUILDHISTORY_DIR_IMAGE}
+	fi
 }
 
 buildhistory_get_imageinfo() {
-- 
1.7.6.5



