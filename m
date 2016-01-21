Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 176DE60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:55 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id x5so1828543obg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b+xgPHDUkK/f9qBjFTwcLjle6MZg1et1rd3FVY/6oCE=;
	b=CUbdad3xQQqJC5ndylFOUdFcBraSDDxCmxsFCzb7OwqHepPra4CI+SXR3s99KOYO83
	8HN+M10S2SlyDNxNePQ4z10EHSAjDeiOosAVL4OzpBFEopPJuZRqSpGDWys7RmY8R1Zx
	tNFvbaW50cuRmk7830C7QfQDV1OMEu50WIIWldH1smpcZb+Z2r91VGGUBhozgp5GtavH
	GeBSOXGWP2SA7jyisg8E5bHl/AsHYOBZENF+CIZz3oZOB75d8eXknpxMeLIvB0lQSuOM
	Q45eeEZxFraabfZBvBsCg1uNu1A8uW2HIzEIse+vRy7P9NjapUQDQtNGE6RU1rDwzwzj
	qweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b+xgPHDUkK/f9qBjFTwcLjle6MZg1et1rd3FVY/6oCE=;
	b=UfmIvWqhlEmxzS+9LLMARyB9jbprGwVibf+oIcMlKm+GZDz80o44Dsg7agAnSj6TWf
	vaUs4KSMmPzrNGJgZ/5gbSsvpJOZO9TkipfvCyLLCW901AivUU2JjqBWsDt0XgNeQnrz
	k7UKyHpSnznvxEXY9MCJcCEyhkFCREndHdubpLKTY6XcV6Dst/kS3YFNZClN2vS1hqIp
	MocTg3B5yahihD1GMvq5MW7uYYXJdy70oqvNPGmDPoXlfzY2dPFd5APPkr6GpKSn3yST
	m2SZ/hFKFGr3UBo58fKl/Y7ycFrXxeVmI9Oo5Zfjjcf27SdOfJ8SJspI7lIzkS/2r6DC
	+3AQ==
X-Gm-Message-State: AG10YOQgnD/RQ3o1h7iJGmkW9iDLsMdtP78vmKXo4VRmBKXUUnVcJe2xSsyWOLBhwycYsg==
X-Received: by 10.182.79.131 with SMTP id j3mr17783493obx.46.1453344236022;
	Wed, 20 Jan 2016 18:43:56 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:54 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:10 -0800
Message-Id: <1453344203-7118-13-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 12/25] gstreamer1.0.inc: add missing glib-2.0-native dependency
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:55 -0000

Building gstreamer1.0 requires glib-mkenums.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index a08e226..218b4b3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 
-DEPENDS = "glib-2.0 libcap libxml2 bison-native flex-native"
+DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
 
 inherit autotools pkgconfig gettext upstream-version-is-even
 
-- 
1.9.1


