Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9EA67766B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:57 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id x140so1562620oif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i2DWdSVPYOnfMt3sYtZzJlrI1AWsT331+Ah0AipRXoE=;
	b=UHjfpMrWq46mjgP52vqyvgd7//WGTnnmOZ5vasW5e0vLD2g5yqC4i8oHQVcthLNmdr
	SjkfRUijsLGWy3MSN9h4fBLDRcbK2ep7FvaGphkCm3CzdJA4C8lQDa/PnEq/1MV3Rgc3
	DBHo4VVUUaP/OsC6qHQZYwbSYoB4VaKQf71vWmhmopLbXO17Ksj/TZA5BV4YRaKRiuaa
	j7gZ485L31LGsJ1RB6BlSC2cTxwyFC/b3uSLrduG4j0WxlTN3jVsl8m1rt9XJ2nGjLCb
	ojEjDKH240419DErNClVfdgpLC0voXXBmb7ynxaSZTInoonFZ3otmMuXLj6F/+9w7aJ4
	M1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i2DWdSVPYOnfMt3sYtZzJlrI1AWsT331+Ah0AipRXoE=;
	b=ZZoM6OxFicgVMrdWVD3fDk+a5VY6CGv1V2PVZZMMtTRFXKUSszStOMdxuGCSYXQwRz
	cmHb0HzIjbGFo96Oq6A+O+8hHLmUC2nliySHbMPmRGuQyk9a6/2DFb4HqUQW7nlrh8DB
	yRZWB1KwqYGUH7srbObRm2jTzUmVh2L5o07ko9bfvlZM98h88tWWA133SnS20rk2nc6r
	py8NnJIW+CG0ydNMsS+bUaWZ5x/AgUjOfi0slwNXT9K5mpjHrveMYJomuYPEYVh6MEiO
	fGAfZQ8SXmdx83zwvVspIRp9WCWhs7B7NAH4rBejiQd+TYfwMNjJdd/KJajJkFecFVSO
	2Bsw==
X-Gm-Message-State: ALoCoQmBWYp1Sje+fqjDhQ7o7BTBSP2OANCH0CJ/OfEixyDtyUTvGDYhVAp8g7u8CkarweFCTqQe+lXJDjZV0lSklehySq3c5g==
X-Received: by 10.202.87.201 with SMTP id l192mr31215646oib.81.1453354678572; 
	Wed, 20 Jan 2016 21:37:58 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:57 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:45 -0800
Message-Id: <1453354610-19218-28-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 27/32] gstreamer1.0: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:58 -0000

The autogen.sh script takes care of cd'ing to the correct directory
before it does anything, so we don't need to cd on its behalf any more
in do_configure_prepend().

  http://cgit.freedesktop.org/gstreamer/gstreamer/tree/autogen.sh?id=1.7.1

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index f7e2351..4fff533 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -5,14 +5,19 @@ include gstreamer1.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=master"
+SRC_URI = " \
+    git://anongit.freedesktop.org/gstreamer/gstreamer;name=base \
+    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+"
 
-SRCREV = "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
+PV = "1.7.1+git${SRCPV}"
+
+SRCREV_base = "2a188848eb2af3c3b357978ff7786a78aad9dd55"
+SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
-	cd ${S}
-	./autogen.sh --noconfigure
-	cd ${B}
+	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


