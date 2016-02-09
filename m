Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id F1A2D7017B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 19:07:08 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id yy13so95525442pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 11:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=qnIojSZHFOPsORJLGtXKvUEyR7ToNGjZ7s5zwz/ux24=;
	b=rW1oRJdMT3+hgnFeLJKPAmRnKxsVY4ZGePm6WHy4OBI/U+eS6CWxbXXSULVT5VrxeC
	VkQ4FWb1B9/ao6hLcEL1XR6bnKuOMUizYlElnxsOu83trfDUQYqep8MROXgneOH+TzpL
	rRZ3PiAWYtb867E0bKdQEl0ZN03TEfqu0vsTxr+UDMvgW7cxlGB933zbr3MiqQribTfb
	wi9/mfv5wbdNzoLFwlfLzNgm5VBuHXvycmAe9ntr1rGEmzrJTpo3XkyqlUbBqAyEAeWg
	D0TnFzKTlV8X/Qrc38pNTTwJhNqrs89aZMHx+Ld07ypR2yObgyJqQ2wvIv0Matu/7iRx
	SIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qnIojSZHFOPsORJLGtXKvUEyR7ToNGjZ7s5zwz/ux24=;
	b=ZuquNoRonHKXW7wk/curEJAzk2EitnRdyU/A8PVjmNkzXEb9QUYuOl9U8Xfcd6W6Ep
	1pZyRvc1EmAbdvWoQSLh4jRXRHMptvXeZEfR3MvmUu0QcnKrb4qj922XWWb4oXRGFRnv
	CvpjeyW5xsJXyfDq59OS9VGQQULqAJ8cPk+w2b3kvqvjdzrYcndtSRHeFq1NYJoWO1e1
	IOBWycjEMSzkc/4KNO9nxSxtl0Fu8lB2T5lZrO2iGv+B/NAYX8TVAXv9atYTZNEW57sS
	juWLiy5TEkScd4SWDv2rquVcW/bcGJI5mmrK4Kcl1o/EaSHa0ljYXBAsN2gT8LX8BP00
	vcfw==
X-Gm-Message-State: AG10YOR8i5W3Cv1Iep1JXFD0kFCIn05Dt80aYKVSWRbJq2/0CRVzA/5qrlgUtavCWQYIJQ==
X-Received: by 10.67.3.170 with SMTP id bx10mr52581224pad.34.1455044829431;
	Tue, 09 Feb 2016 11:07:09 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	76sm52315129pft.44.2016.02.09.11.07.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Feb 2016 11:07:08 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Feb 2016 11:07:03 -0800
Message-Id: <1455044823-14804-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gstreamer1.0-meta-base: make gstreamer1.0-plugins-base-alsa conditional
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
X-List-Received-Date: Tue, 09 Feb 2016 19:07:09 -0000

Include gstreamer1.0-plugins-base-alsa in gstreamer1.0-meta-base only
if "alsa" is present in both MACHINE and DISTRO features.

Note that building of the plugin by gstreamer1.0-plugins-base is
already conditional (based on the "alsa" DISTRO feature).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
index ffffa63..ecfd082 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -26,7 +26,7 @@ RDEPENDS_gstreamer1.0-meta-base = "\
     gstreamer1.0 \
     gstreamer1.0-plugins-base-playback \
     gstreamer1.0-plugins-base-gio \
-    gstreamer1.0-plugins-base-alsa \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'gstreamer1.0-plugins-base-alsa', '',d)} \
     gstreamer1.0-plugins-base-volume \
     gstreamer1.0-plugins-base-audioconvert \
     gstreamer1.0-plugins-base-audioresample \
-- 
1.9.1


