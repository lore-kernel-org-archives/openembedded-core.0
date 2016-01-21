Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id B850273286
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:29 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id tr5so2014598obc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wgU1XyKh4/oqwoxq+mSXDoSp4jOiReIpGY6TFKFN2QM=;
	b=KGOr8DCsEHq34+AQiL+2BH/YHP++XFLuhtUJ2Dw5lLb/L2YFpoGOp0W/hyCjSqOd/a
	a/d/sFI4fetKPfjvQ7pHovui2AX+UaPw0rPiSX9bsc3kIjIlCzH4QW/PGNLqJa+m2GHK
	3f5jPyGNnpdyKGFusWejLiJeWHvYfkvfT2ziMvz+n+7QfNFDAtGrqmuTJpc0aQxaYRDv
	jlhNUsTxko/LQlbvBRZGNDKosir1UCX+qq89YjhS5DKb8IUG62VKz0W8kbrmhkDB11qv
	WEfaZ1LYTQK2Je3hSs4x6Ky6660WH0IVUiaHgQex2KoC4Z7CTjqfHSs+Skkl1XYVF2YP
	ZENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wgU1XyKh4/oqwoxq+mSXDoSp4jOiReIpGY6TFKFN2QM=;
	b=Qa+a46YfYhabVCmNABSBRNnrrfDU1FAzzRiwm5OUxhn4BfEYLv/LA0fZ7adZzFuAaK
	cVA5aa8rHH3g2S0gymmowsW28PjBJfWU5nO4Nja/jQIVnNjUGqGm78TV6TMxswRMVvVx
	RxBGFN63E/zedjWKFQmiJLWCp49c8KteExgdp5CY8tlyNrIp13oDKG9SDz2EyrI3Eu7P
	4Q5EqdK1/FVYeKW/ctNqXL5IAyV16ZqWfQ2bZWj6TpKA9f2KZIAmD77SPoBOVfochCnr
	B8p6I/qh8qeDJG4x+YUrQ4hxdj4E8AwYqXwMA5+AAYkEFmlhw5Ei2FH8yNUIbG3ZoZEm
	6uhA==
X-Gm-Message-State: ALoCoQkLQ65CtTGnZK3oaxLNNEVeVMzfdJjknxWXaXXc9VqGuD6KuZM6yT3y+rCZkDZcODXFB1AVz2Z06iU7M7zH8CY1EzL8XA==
X-Received: by 10.60.51.70 with SMTP id i6mr32108324oeo.3.1453354650113;
	Wed, 20 Jan 2016 21:37:30 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:29 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:31 -0800
Message-Id: <1453354610-19218-14-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 13/32] gstreamer1.0-plugins.inc: add missing glib-2.0-native dependency
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:30 -0000

Building the gstreamer1.0-plugins packages requires glib-mkenums.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 568d51f..d8532ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 
-DEPENDS = "gstreamer1.0"
+DEPENDS = "gstreamer1.0 glib-2.0-native"
 
 inherit autotools pkgconfig upstream-version-is-even
 
-- 
1.9.1


