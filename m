Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id CADE561617
	for <openembedded-core@openembedded.org>;
	Fri, 21 Feb 2020 02:54:07 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c23so242008plz.4
	for <openembedded-core@openembedded.org>;
	Thu, 20 Feb 2020 18:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ajMAIS13O6knCfywDodZhICRdk0T72GtljSmVMwlGLY=;
	b=mihJ8B+AwvTiC1WZIiAOarL+zhiDbS/D1vN/zNEq1Ye+Z2Mh5mpGsI/P6RjFJt7Eff
	wWBzr27a5U1VPnXEaOxHcU+wxPY1rQ745RDy3CQLmRzcpfxfWgwYr/YIieaD0vZ2GAT0
	We88t9CWYFuYxakNGVLtk6fZTYZivz1KEW2MQtdzgoUAXWMOdnUsml0YYRYOCqxVlNi6
	YbxQftStbsLFA9Lb6ji4xlgCK2TdLW4ON98X77Hmu1+K/xATjZoq/CsEDnn48MX4xaic
	TfVoOA/K6Anj31IDbCEcnMOfL/dKegwSVVfORAtpJNyM/NEAK/LPcti8Y14g4D6MJNl6
	5clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ajMAIS13O6knCfywDodZhICRdk0T72GtljSmVMwlGLY=;
	b=pBs5DEBps+TeHkpXbuZDpQn6S2wGkQMHVFGhPXLwP6/XOLP1PAQ5cG/MbuFyXPNToC
	N67wi/teKCmZEW5Sg4ll1OBP8VqE6Bd5kfTC+SkCK8+bZ87TLvTdKaqY96jyCSIyL2SV
	bDOAWYh2HQnJicuclN/r/xeV9bqjpkQoZrs/7NK9sx9qusCg26sW+Q3lheASrrpnp1SW
	pCW2e2PmxdJ5NqyRKVFtjR4rZPGi6Nfj750DPBqLelMus9CqD4lWsXlCus/DNRhV31rF
	uTWI0eN7qnaj0pIlG9NymNWTtPOWKbR+wSt6C7pjNVk3rypvhVTA5xzxXlRQ+5JuA5wh
	XX0A==
X-Gm-Message-State: APjAAAULEQCqR/JUphgorSsN7ywHwYbpsyG5zWUPdW71tYio7YzaSzJ3
	GA/dFskvplNOMc938SGS9Twi6aZ2
X-Google-Smtp-Source: APXvYqzH77j8NxrZmvi7uKtjP1g3rNcLMccQ2EEAtt9/1oNYVDD/pQwu03FJFcaDPx66Lhgyhp7MVg==
X-Received: by 2002:a17:902:708b:: with SMTP id
	z11mr34885088plk.121.1582253648696; 
	Thu, 20 Feb 2020 18:54:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	y10sm925320pfq.110.2020.02.20.18.54.07
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 18:54:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 20 Feb 2020 18:53:31 -0800
Message-Id: <b1433f396f32c78d6be5633653541ff6375d5220.1582253544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1582253544.git.akuster808@gmail.com>
References: <cover.1582253544.git.akuster808@gmail.com>
Subject: [warrior 12/14] linux-firmware: add PE back
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
X-List-Received-Date: Fri, 21 Feb 2020 02:54:07 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Add PE (package epoch) from the previous version of the recipe to avoid
problems with package upgrade due to changed versioning scheme.

See:
http://lists.openembedded.org/pipermail/openembedded-core/2019-August/285633.html

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8b6ec55da696087c8ea7bacc042307ee652afd9e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
index acaca955be..9afaad73f3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
@@ -190,6 +190,8 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
+PE = "1"
+
 SRCREV = "0731d06eadc7d9c52e58f354727101813b8da6ea"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
-- 
2.17.1


