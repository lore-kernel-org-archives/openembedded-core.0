Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 56D22607E1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 02:13:56 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id x9-v6so4565461pfm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 19:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y2o7A46MaUFPvHZz4n7WZYPqotYcJKxETvCX/Vs/oMU=;
	b=UMuKfFxxGehJ5y/cSdvrYVYqSvvjxv5T+6kpy8fb6bO1QhgXmkR5TJYxJBS5Jqhk9j
	1bvLUxe68LfSteIWI4+M9jsCJAlJHqvF4PA4DZ7A1jA6bOo07A0AUcRFE0UmqRHTIqJZ
	rPMy84gP+Dtf0MQvltv6ADpN9RWkbSHy+YHqHjDtw5m8dVbjB0Wq7ne7+CzewYD4jnQQ
	at1TpnyMPdttUAErC+vhgMRxXNs5L9MqNLFhHdkqyQDyyUClG4mk9J+vW9HtiOCyIrEs
	bZ3Bh+i6OFhKAO6W1waQtzDUKKosWkASNcdvWfoqH7WI50jY8b1BZxpkjOwL64C1fy2J
	whvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y2o7A46MaUFPvHZz4n7WZYPqotYcJKxETvCX/Vs/oMU=;
	b=eFgBrOFNcI2uz6jsCTTB31MIiXCA+XZO0dT4hWLcXKYrBHJndzT9yIJkSUqe7d2tlo
	fT8sQNVJGmCAILPWY4wWedXzxL2/n9SY5WWPaCnnxmFazDv19hK9uBAkzAn8BH+D+jwH
	vcBbCJ7cNxpVWfnHaoM8e3MqSyDTPGIDJ1meor3ZEIolwjthWZGxuv7BhuP2X8yocI4c
	2GWISZsArmOWbBqatfK4xkEQJzaZwvHi5uckYyHS9AWHOkNAydzLrdBqPeWtNsM0VOKB
	ikRytoai/fU8JL+rsGpPVYitZdT4qJgdsE/Tpe7qv9yDCVn26XNiRO1HFeIZFNqQ8uLf
	djSA==
X-Gm-Message-State: ALKqPwekbmOQec0wvaOiWomopf+aBOVx7rem+TxrquE152pmcN0vJWrT
	k1BL9+z2sTjvIwyQieelmsg=
X-Google-Smtp-Source: AB8JxZoHoZ/dlkkGiOvaLgONcFV7cwge+JvdQFXw+xf0FgoPtTKsr7GaojbenbL2kuPjqVLTlg+Cwg==
X-Received: by 2002:a62:d905:: with SMTP id
	s5-v6mr11791880pfg.20.1526696038149; 
	Fri, 18 May 2018 19:13:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:ed41:dd75:6b53:32ea])
	by smtp.gmail.com with ESMTPSA id
	n10-v6sm19307081pfj.68.2018.05.18.19.13.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 May 2018 19:13:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2018 19:13:49 -0700
Message-Id: <1526696034-3857-3-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526696034-3857-1-git-send-email-akuster@mvista.com>
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 3/8] libdmx: upgrade 1.1.3 -> 1.1.4
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
X-List-Received-Date: Sat, 19 May 2018 02:13:57 -0000

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-lib/{libdmx_1.1.3.bb => libdmx_1.1.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libdmx_1.1.3.bb => libdmx_1.1.4.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
rename to meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb
index c74b706..66172cb 100644
--- a/meta/recipes-graphics/xorg-lib/libdmx_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libdmx_1.1.4.bb
@@ -15,6 +15,6 @@ DEPENDS += "libxext xorgproto"
 
 PE = "1"
 
-SRC_URI[md5sum] = "ba983eba5a9f05d152a0725b8e863151"
-SRC_URI[sha256sum] = "c97da36d2e56a2d7b6e4f896241785acc95e97eb9557465fd66ba2a155a7b201"
+SRC_URI[md5sum] = "d2f1f0ec68ac3932dd7f1d9aa0a7a11c"
+SRC_URI[sha256sum] = "253f90005d134fa7a209fbcbc5a3024335367c930adf0f3203e754cf32747243"
 
-- 
2.7.4


