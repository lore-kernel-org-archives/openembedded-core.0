Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UFp7p-0001Md-Oo
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 18:06:05 +0100
Received: by mail-ob0-f180.google.com with SMTP id ef5so1215934obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=QDzzlWvMfq/WQmWqs1RtayOe0WDocF/XI3qKYrLMQe4=;
	b=fjPfHJCSBL8IqXE2T8oRU1wJmQAYzdzuSx1NCoEk8/hqnD1YJ73AVpYVdMzVAXWAI9
	SO+HlqTRZ/5TEkm8Jro4whUy/yOt6nuaC4Gady8eeICIoBuTPLjr+J2/uvpBdonv0CtA
	9UtMdKIylU6Yp6SvAtopMFdYGiNYVFvr/rfRYANKo99XMCLRxI0le/xraVuKgXjDFIlc
	obbtlCsHM/wxJAzgMQ7N7im5sXb2ZCS7Y1AjHLiUcxYe+UmvNS9Psn+xNGSQbfdFIPAp
	MTxXbuRAdz92Wj1xzVJzimTfH+yTl0IaBwuZ61yARbjgKUrd1qGvX0H+6jxEwq8ssZa2
	ol+g==
X-Received: by 10.182.31.109 with SMTP id z13mr16357283obh.37.1363193360223;
	Wed, 13 Mar 2013 09:49:20 -0700 (PDT)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id ka6sm26233523obb.3.2013.03.13.09.49.18
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:49:19 -0700 (PDT)
From: eu@felipetonello.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 09:49:13 -0700
Message-Id: <1363193354-6895-3-git-send-email-eu@felipetonello.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363193354-6895-1-git-send-email-eu@felipetonello.com>
References: <1363193354-6895-1-git-send-email-eu@felipetonello.com>
X-Gm-Message-State: ALoCoQkpMuLALTCQj3EHw6LFzf74vS8/Bs+lkVuX+y3UqByG3rgLM68tp+25p/iHISfXgyZe7E8G
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [PATCH v2 2/3] qt-mobility: Add pulseaudio dependency if DISTRO_FEATURES has pulseaudio
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
X-List-Received-Date: Wed, 13 Mar 2013 17:06:16 -0000

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



