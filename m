Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6376D7970B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 22:41:13 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n23-v6so365385wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 15:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=aMmAeDjvrs8Ch+xrOznRzG+q5JTUsAjJlWK1V1rIynU=;
	b=FA879CD1fVeBXAcG4U5g88yD0iTI6teNc3No6owvz4ahtTWeX/MIWKj1uMWY7lJ+LH
	msJY1CyZWDHVCbOXEIrQtGQoKwWGRIW/dHufDPtB9gwRsDiMkklY/vEVp2bRhcAeh7v/
	aQF3icLJqJ7kcLmiSby3f+nwn54qt+m//Knfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aMmAeDjvrs8Ch+xrOznRzG+q5JTUsAjJlWK1V1rIynU=;
	b=UHnAqtuN9R/O2cHUcJaoqDSnkIZSzqtewrtfwD44d8Bs21jrt+Wo8b7N69VBFvhqMV
	rFySRtYRWaRTFPNo9P79UGAbuEdy1aooLug3pZg9T6u2xOOUi5LGM+EEDh2KrAjcJ8eX
	ntWZEACa4LCyiMCSXJcwusaFO2ynyE+RENmyzC8BGbR1S+M28p0kmCfwNCXFluDZAs8Z
	uuuXXZxWf+uEfGEUg1kcaRz6Uh+d+8Wb6S+OAuEWa2gEb/JumUDvPz0jEUo5/OYTEVLS
	N72mCQnE+hdntsM3fz6sDGaAvxw9nhydLwIU6cFmfM+5IruzA/2jgHjaHfDDdZ4w+x+g
	teFA==
X-Gm-Message-State: ABuFfog+yrPfhQOkYiVO7mspSVgrj1QEJ3yX/iCtKz4HvyNRB/piaPoL
	s0GGeMROJ1NS9HmNIH8AtQrkTOVKRl8=
X-Google-Smtp-Source: ACcGV60YgE+8q8YeHEzluEiZ0+D2JjE19rX+dY45H1PAZK2AzzmJEXIT3tn6FpWPqqtk50TpR/dMdg==
X-Received: by 2002:a1c:c011:: with SMTP id q17-v6mr388431wmf.37.1538088073611;
	Thu, 27 Sep 2018 15:41:13 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v6-v6sm220803wmc.43.2018.09.27.15.41.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Sep 2018 15:41:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2018 23:41:11 +0100
Message-Id: <20180927224111.7607-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] layer.conf: Drop sumo from LAYERSERIES_CORENAMES
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
X-List-Received-Date: Thu, 27 Sep 2018 22:41:13 -0000

Prepare for release and drop sumo for the compatible list of layer names.
This will mean other layers need updating to continue to indicate compatibility
with master but that is intentional at this part of the release cycle, we want
layers to indicate compatibility and show they're up to date.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 0728c51e5fd..6221a057ce6 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "sumo thud"
+LAYERSERIES_CORENAMES = "thud"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-- 
2.17.1


