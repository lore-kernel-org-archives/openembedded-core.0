Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8EB6FF5D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 02:53:28 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id w5so24591685oie.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 18:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eDSr5G4BkHbq05cad9/XZjs7fSGoiwyoc0RZ+f48gd8=;
	b=eAkXcqV/uzfNI0CTqH5DdX04UwLnNso8oii2fET54D5HDzl/FFAHjFcs7E0z/UFeGU
	3TNUQP3GrkGSUz3DXeCLlN5RQ/QfsgVt0a5OY6uJ9YIe/acgSpWeu5U0wwUlnYqhW2Vi
	Ij2Waj57XDcTNiGa2LaCohxabic+7OWVqIlf9nrcZaIlAA+37Gy6uAlCUI7x82oYoHWm
	y3BH2rFQDHMuyYPowoTlSc5WxCDCtqP3tpOwrgGi9TopmN33F3RL3SZZUGcZ6RPDoC5s
	4KBn/Mabuvvw9G1ZjGuheJcAzgfTpS7dotrt+mrJTojpJdUghcZdRVG8VsEEY4iuWML9
	3Dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eDSr5G4BkHbq05cad9/XZjs7fSGoiwyoc0RZ+f48gd8=;
	b=eT4InNz+q1SHay2m4O7HqDYJN1uHybb3mZZWfNLo3tfIfa0JbHXCFj+cFrB5tIzSX0
	bNEVzob05q3rnQbQJ1LaiEwz0sc12AoWPrYtdduBFOy/GNSr+rafe1W72S+3Qd/57orG
	XztXmb2IWpA6qWoSVT1jTN5CoekOYUz3K6iVph5eSEyPSYIISXPDArznE3ExMuA/9Clx
	83jjfzDSLLrHLeQtbzic1K6ZzKY7QXq5BifIcZw054lag47NCpNSFkMcwug/UfNI4Pke
	wWXxJg2bfBdtnFNZx5wHBlHZqHpeHy4u9y/cSW2zAFJPPDpDm/aJlSWxhNxUW0k71qfN
	ew0g==
X-Gm-Message-State: AG10YOQNwTUOF86sYyXMpcQHWgUB6ReDC2Sl1nGn51tIlNn1zbiSvrttltkopHza3o1TFw==
X-Received: by 10.202.75.202 with SMTP id y193mr14252387oia.31.1455936809731; 
	Fri, 19 Feb 2016 18:53:29 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wh4sm9192764obc.10.2016.02.19.18.53.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Feb 2016 18:53:28 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 18:53:13 -0800
Message-Id: <1455936797-13430-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
References: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/6] gstreamer1.0-plugins-base_git: update 1.7.1 -> 1.7.2
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
X-List-Received-Date: Sat, 20 Feb 2016 02:53:29 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_git.bb                | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index a07c35b..38a9fcc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -12,19 +12,16 @@ SRC_URI = " \
     file://make-gio_unix_2_0-dependency-configurable.patch \
 "
 
-PV = "1.7.1+git${SRCPV}"
+PV = "1.7.2+git${SRCPV}"
+
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV_base = "641428966e09d16b0a46540040f2faf3791eb7c9"
-SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_base = "97e108bebaa58821f4566a74cbf0135e93407c01"
+SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
-
-	# Temp solution for git snapshot: relax version checks so we can build against GStreamer 1.7.1
-	sed 's/^GST_REQ=1\.7\.1\.1/GST_REQ=1.7.1/' -i ${S}/configure.ac
-
 	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


