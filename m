Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8302A6ABF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:30 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so2906346pab.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=l4CvUswwS56AemaMqBVtaUF7dsHd4+AF5dM3wmelsxA=;
	b=fBJNRnR9drSq2S+lPijmp58Prfajydx+VLV3oHg1wLk2nMXZwD4RkO2vUZZW6XxCZ6
	RaKSSS/k+HmnB7x8vHZ7KjlSTCVr4r2KmyX0p5Tk6rr1Bn44xaaH9VWaWTUXpFIfCRvi
	/ljh9r/L8bVXlxJKAfssDJS/Pjrsvunn48Q9ZriCFWqo4TLqbSPH+D9vmdZ4E5VYcHuq
	5Bg3vUarFWr74itjoziy2p/1mgao1IJVtpUaTCXSBxJZhrxZ9KhYT45UlG3VCysBUM9W
	QNDo7eETq3k5+PbnCTvMt2d+sntyt03MCCl5fZtaw87apEoYATcPm4ak34tMuCy26d+5
	c6Lw==
X-Received: by 10.66.160.97 with SMTP id xj1mr13500977pab.5.1372457071949;
	Fri, 28 Jun 2013 15:04:31 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.30 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:03:51 -0700
Message-Id: <ae69a7d52d4c6b1144cb38f2e189d62bec231570.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 06/24] setuptools.bbclass: Use python-distribute instead of python-setuptools
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:30 -0000

Remove --single-version-externally-managed since its setuptools
specific and we dont use it anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/setuptools.bbclass |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index ba9cf13..56343b1 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -1,9 +1,8 @@
 inherit distutils
 
-DEPENDS += "python-setuptools-native"
+DEPENDS += "python-distribute-native"
 
 DISTUTILS_INSTALL_ARGS = "--root=${D} \
-    --single-version-externally-managed \
     --prefix=${prefix} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
-- 
1.7.9.5


