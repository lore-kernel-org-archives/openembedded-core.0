Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A0D0177081
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 21:35:10 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n128so5727407pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 13:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ix4pnBW8RvP8PZvmQXuiF9BZDG55H/ZR+LpX17swM2w=;
	b=W1VxpskUxyOTCIcXhqx7HxV0UXY+G5Sp6+2DbwVObubd56P2bp07TZIGuvCfu0O+Ei
	38izWztp9G4DCefEjlBPeQfJl8LMaXzHNrPr808xsxO5ds8P0OxLrLc6f9IPInupXhM0
	kXKVHpZdYlEYeEA7A582WcdvN9yyf3l8GCcXIL501q7ArAX916eNWWlVRz78XCEIyQ8P
	Q8uy0aszzef3DFADN1z6T2O8NmoXhD/QQTl/Jijl7ji2ITspBnaFUScoIwQEZTYql0fw
	Vhaz7kRfyYMp+hfi1/AGatD6MxsgYS+e1f3kk2n4IFSZfSGrRYxTe3E+zVjk7VzZUZZA
	autA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ix4pnBW8RvP8PZvmQXuiF9BZDG55H/ZR+LpX17swM2w=;
	b=LMtK4/5wQlY0fq/TbiK+iSgptI5zY3Kut7WmqhPcNMmOur+Smfy+WTnzZyrD1Dp3aU
	WJGPAuMPeOVgdwGFCjuxSKuPKAYudqcmMb0NntziuVGcDoSzHWEkM1mrCmhA1Sk3Gua+
	+VJ2dH7o7v+RFrZbB2IKNtqoD9seTVKp73rk10Ow1yHODq8Fp8ELONX8l0RSQTxH0Zo2
	Yr89Y/oV+0I3uHRm6WIHwGoohqclaPAaOtcvlhV9buc/cmA4XPNmZWNXh+D4gmpT5Hp+
	dLb8Rd22D6a+NAYzzEYdpiOwKki5U/9q/pANe7aiemTwuFJGducD5W7Oh3QhNTSTPlY/
	jPaA==
X-Gm-Message-State: AG10YOSvzvi3U1exzzNV+HQD8eZnxIuPKOP8gBx9AgbAU1t7xH2nP5wdPXYadpaECOEZMA==
X-Received: by 10.98.86.67 with SMTP id k64mr23496528pfb.50.1454708111725;
	Fri, 05 Feb 2016 13:35:11 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id f4sm13813513pfj.0.2016.02.05.13.35.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 13:35:10 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 13:34:55 -0800
Message-Id: <1454708096-1570-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
References: <1454708096-1570-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 4/5] gstreamer1.0-plugins-base_git: update to git master 1.7.1-79-g6414289
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
X-List-Received-Date: Fri, 05 Feb 2016 21:35:10 -0000

Includes an important fix for:

  https://bugzilla.gnome.org/show_bug.cgi?id=760938

The fix is not a simple backport to 1.7.1, so just update to latest
version from the current git master branch.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index 8ac3a7b..956b24a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -14,12 +14,16 @@ SRC_URI = " \
 
 PV = "1.7.1+git${SRCPV}"
 
-SRCREV_base = "5f98203bd753c32666c8fa7a2fde6d186c2a4247"
+SRCREV_base = "641428966e09d16b0a46540040f2faf3791eb7c9"
 SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
 SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
+
+	# Temp solution for git snapshot: relax version checks so we can build against GStreamer 1.7.1
+	sed 's/^GST_REQ=1\.7\.1\.1/GST_REQ=1.7.1/' -i ${S}/configure.ac
+
 	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


