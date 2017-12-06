Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E121D7871D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 09:43:59 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id d23so2031192pfe.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 01:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=tbkD0w/JENDgtXS3Z0rmSd6Wivts1Z2VUsVBwnoI9uU=;
	b=D7KWfUdfHJZjCiasCjiCA+D3PS3KWQF+CTbYrCaZ2TKqV6SnICyTj4B5JwV7paFfmp
	It0a+U6TD1DgHtukCLICcKaJjxyajEXw/CxjE9dMZwLzreC3DhQd6+1wn8bipPpiQO4+
	sDYXsrrV8UJdShMp8R55r2jYK5dfUhyBtZcxE+m5g4usvyAJQD9ORfJXxR+QTHnp+1eC
	uNJtV6awWiFJmeKSQmvFmrVNddkozWxSP7BnpRL4la5Ou0vkRBzoazmUP/ucUZ5en8a9
	Jq+amoQh6csFoVIRMU+AbEGZ2aaOduLvULQMizMnXZsr3uGkvy7+O3SDvAZn2thalr/5
	AOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=tbkD0w/JENDgtXS3Z0rmSd6Wivts1Z2VUsVBwnoI9uU=;
	b=aBlsgIgc7yw7vvufDn/0evfBGSpW04pj0Ve/uWnnJfxIntq02kNKcBR8SnjY/oxmeG
	hoSx6di+srPnm6JF0HzM7vFwDGhCQQFgOCr30aDhOkZazBwXIkZV2qi2qmVnXt0TQtIN
	EVvgxjJDg2n0yFVZSWFgJiNGW1r5aVy2MX1EDtsTqG5bc9FNAeXZSq02kbC+HDkQYFKB
	ZOgsqYP9pO/cqw7RTMIOISoQ5SH7/C4T44qWlx7GF8Gn17PLORCiRMSjEsaeQFRT2D5O
	VzpnI1ThoAN9BITb54fyTtPn5XlCSGGZclLwI9An8S9oClCaWc9UQT+iWDHTg31vEeXH
	Ml2A==
X-Gm-Message-State: AJaThX6Qa43Ov5weLOqz+2QS+/yLDCk601YvZJGp1V1caxcflPlLNy36
	z9HsxUOnUhSYr5fdfOVM1dejKaNMHbU=
X-Google-Smtp-Source: AGs4zMY4e5+ch3vZb1kNRsGIdmq7ELhqzbvBOfazPIvPFUpAhpFcrypDqH6Hi8egCalVtvTsFu0PzQ==
X-Received: by 10.99.106.67 with SMTP id f64mr18751344pgc.453.1512553440959;
	Wed, 06 Dec 2017 01:44:00 -0800 (PST)
Received: from [127.0.1.1] ([58.165.131.151]) by smtp.gmail.com with ESMTPSA id
	x15sm3554094pfh.27.2017.12.06.01.43.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 01:44:00 -0800 (PST)
Date: Wed, 06 Dec 2017 19:43:56 +1000
Message-Id: <20171206094356.23202-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] packagegroup-core-tools-testapps: kexec does not support MicroBlaze
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
X-List-Received-Date: Wed, 06 Dec 2017 09:44:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The kexec-tools do not currently support MicroBlaze, override the
KEXECTOOLS variable to disable the inclusion of these tools in the
packagegroup.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 317097854f..0d2da86613 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -10,9 +10,10 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-# kexec-tools doesn't work on e5500-64b and nios2 yet
+# kexec-tools doesn't work on e5500-64b, microblaze and nios2 yet
 KEXECTOOLS ?= "kexec"
 KEXECTOOLS_e5500-64b ?= ""
+KEXECTOOLS_microblaze ?= ""
 KEXECTOOLS_nios2 ?= ""
 
 X11GLTOOLS = "\
-- 
2.15.0



