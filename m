Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1U3lFC-0003S9-O7
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 11:31:50 +0100
Received: by mail-ee0-f53.google.com with SMTP id e53so1884146eek.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 02:15:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=yBrzaL+ncMH48KKEk5v/gZ8BrZv1fcqcqIopT14RgA8=;
	b=oOH5eu9Wfvd2wX1Pw3E6q+VrCWE7THUtgkWiV4sQKYTC6f680gsw8gHSDWMczJvvej
	oXo7f7ZBHGEIUrXHtWqAzLZ80XXKhErB4VYR1pdeDcTvQyOFrOxpbE7Hp8Q7Xop8wF+Q
	EjUIL2XpSkZa5S8xU9nheke9h6zLl/bdOBXUmq65hvSQNqyU+ueY5U3vVoLVm0X1zi6G
	oURx+YW9PnsyFc8ykvetN7eGLHksSsxjRhcwVr7kqtCvYmaFBqgRnrYRjarf2cOiXemR
	V2/5a8sIQ2dsePe3WIBGorIV9XFkfJStSi0RE6B271MFWv7qQYkVk0c0Ib/jMA1YNAu+
	swPg==
X-Received: by 10.14.2.5 with SMTP id 5mr14405369eee.30.1360318553121;
	Fri, 08 Feb 2013 02:15:53 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id h5sm46478837eem.1.2013.02.08.02.15.48
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 02:15:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 11:15:44 +0100
Message-Id: <1360318544-11013-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQlfWJx7Ue1G9rDzuBxjs/Re3cnHKV0uZJUpcl6HeYTosPPh2hsLXHKPIQRarqovh7zdoeWk
Subject: [for-danny][PATCH] xf86-video-modesetting: new recipe for gma500
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
X-List-Received-Date: Fri, 08 Feb 2013 10:31:53 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

I am trying to use gma500 driver for the noemgd BSPs. The current best
xf86 driver for it is modesetting. This recipe provides that
driver.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
new file mode 100644
index 0000000..02f4667
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.6.0.bb
@@ -0,0 +1,8 @@
+require xorg-driver-video.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
+
+DESCRIPTION = "X.Org X server -- modesetting display driver"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "d8a771d5d2d75ea9d234c6928153c08b"
+SRC_URI[sha256sum] = "852f9ddb213913f75e1e65ad7ce9c6b5bc7f43a93d8087b6e59666ea4eb3d0d6"
-- 
1.8.1.2



