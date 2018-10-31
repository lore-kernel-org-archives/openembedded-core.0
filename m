Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 75B3979BD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 14:40:03 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id c10-v6so7484469pgq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CWwwkzkr6Rd+BrD8rc+T2MiK5i+COmxeMO9O0xxj2yw=;
	b=iFsthC+VmYxzN8YKV447cclcN6LY/C99a9vE0ZymhID/qta12bkUiX+CrtqTfAT5m7
	ZmnKDQr9InQlWIFnscTmGVJh9wvbjHGdyPjKigkh8PieFqixAJZLCMYfkbUoL0uhRwGP
	0yX9rGrLYQNLkHsYp80n0bTXkCii3aYdYOND62SYajlTcpMus5qm/CqB153Kh/+PzlW1
	raWGAS/dngOuHiplKGR+CMf/v1D8rAkiJYLqpFGPgv65aX9hrqMDMY73tOeSe94mDh9l
	NgLuxAKqpA7T25f4E/DVXsimF5xOe1vCMOnakQf9ztn0Ahp0AqBbjm0et6rNss2T87i6
	FdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CWwwkzkr6Rd+BrD8rc+T2MiK5i+COmxeMO9O0xxj2yw=;
	b=jU2MGfIKpAj+9mdOHkW7iPKFHe+J6joFt6idC0/ZdVBgVe/0ZbJRANiPH7YyMp9ZTf
	NmJPaBpRfaq2DiQf/3PVb37N/4AAvKqMRf9GHH5anfAB8NTapKAtvcFp9STL/08DuVfX
	p4psxyPhqIKG3LXpFnINA3ZnY576cXmGIxcn/6Lbiaq3/XJjDaIILOqs5Q6JNZBHYm7V
	96o6hHhrB7Lzxp/JjjT2hQ5bnoabOIAzi8N6a3SEfQ9YIljflBQtix7JdmeNRKL6GWjI
	EHtsr6JSvOSbacXydFmBn/PNrW/soAsbgcYTM7Yow7+6fGBcroeotJjPgszpTDmxp3CT
	nbrg==
X-Gm-Message-State: AGRZ1gL/R0LRD8IiQqxuOUlCgyN8qBo+yE3/1JYEj6yKA3P4ECr8IIpZ
	6Fc9AukjR5pFBOR6Yfw98Oj+HqRQ
X-Google-Smtp-Source: AJdET5f2oiQzxNvm5Qe+2CnbUzdIhLE9xzsBYN2WgyWRYGetsO9Axhk41PMsT3fm/cSB40Y6Bp1q+w==
X-Received: by 2002:a62:2c16:: with SMTP id s22-v6mr3709645pfs.6.1540996804391;
	Wed, 31 Oct 2018 07:40:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:571:f5d0:d940:5c94])
	by smtp.gmail.com with ESMTPSA id
	h17-v6sm7123568pfj.125.2018.10.31.07.40.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Oct 2018 07:40:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2018 07:39:58 -0700
Message-Id: <1540996800-29855-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540996800-29855-1-git-send-email-akuster808@gmail.com>
References: <1540996800-29855-1-git-send-email-akuster808@gmail.com>
Subject: [master-next][PATCH 3/5] xserver-xorg: update to 1.20.3
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
X-List-Received-Date: Wed, 31 Oct 2018 14:40:03 -0000

1.20.3 fixes arm booting in testimage

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-xserver/{xserver-xorg_1.20.1.bb => xserver-xorg_1.20.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.1.bb => xserver-xorg_1.20.3.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.3.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.3.bb
index cfdaf73..1caa154 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.3.bb
@@ -4,8 +4,8 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             file://pkgconfig.patch \
             "
-SRC_URI[md5sum] = "e525846d1d0af5732ba835f2e2ec066d"
-SRC_URI[sha256sum] = "59c99fe86fe75b8164c6567bfc6e982aecc2e4a51e6fbac1b842d5d00549e918"
+SRC_URI[md5sum] = "8ee29e8b24cef6b3cfa747ec01b9155a"
+SRC_URI[sha256sum] = "1b3ce466c12cacbe2252b3ad5b0ed561972eef9d09e75900d65fb1e21f9201de"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.7.4


