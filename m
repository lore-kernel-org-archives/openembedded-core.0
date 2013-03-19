Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UI4kP-0002El-1E
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:11:09 +0100
Received: by mail-ob0-f180.google.com with SMTP id ef5so968889obb.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 14:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=QDzzlWvMfq/WQmWqs1RtayOe0WDocF/XI3qKYrLMQe4=;
	b=KMIOIEyGKQ4RS8dNaeFyz6fYEln3kDv9T9BNHAhl3sKPjXwmJ6vMCw2Ib3tOFDslAc
	UVBJ4YKVM/G1GXfYiA+RCDBo5bBp34FixjGfP8Ca3/9b0Xmcq/0ACMRcjbl8pkCPp/Ni
	pREKbK2r1f87o8mk0tiHh4iGMmr5ZcF4kVwjgx9Ofh/CbWMVAzgdSfTMO1lGHL2ddUxP
	VhSKbiNAdYO92fmH6ZdQ6x9aVniELLuxKSLSiA2kh/YJlGyh2LFyCTW7EEIDLDbUKuK+
	yY3KTwNCv3nksxkL1yDkgWHTIO4JssbiYLp/O9vGoArmRKOQzeMAjH+7bSCu66DhTCL/
	F6FQ==
X-Received: by 10.60.23.226 with SMTP id p2mr2550526oef.103.1363730058532;
	Tue, 19 Mar 2013 14:54:18 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id h9sm13500091obg.14.2013.03.19.14.54.17
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Mar 2013 14:54:17 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 14:54:12 -0700
Message-Id: <1363730053-7719-3-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
References: <1363730053-7719-1-git-send-email-eu@felipetonello.com>
X-Gm-Message-State: ALoCoQnM3fY7+sE73qKvMCKA578bG6cz22EceyRQmZfyhTHS9uDhrhYI9GNHOAGxLtSX7/NudpVF
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH v3 2/3] qt-mobility: Add pulseaudio dependency if DISTRO_FEATURES has pulseaudio
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
X-List-Received-Date: Tue, 19 Mar 2013 22:11:09 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index e5e671e..fca4cb0 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -1,5 +1,5 @@
 HOMEPAGE = "http://qt.nokia.com"
-DEPENDS += "pulseaudio"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez4', '', d)}"
 
 LICENSE = "LGPLv2.1"
-- 
1.7.9.5



