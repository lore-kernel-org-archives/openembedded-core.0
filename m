Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id C94BE75374
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 14:03:37 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id l33-v6so13495211qta.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 07:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ZVW2L+2Vny+ICXdIuFyIB6Ql+EteYYxSHNageoJOQw0=;
	b=TvAH/mZsg/7iJVKJnVSiKUVianmbHXLN0YMOfOU87JJSZ06+v77jAwwNwlMAeE+f2c
	3U4469IjOPodGb0Gk+JRhPISnLcF9BdK5SftJZJCKBKaNr0VqZLTFnO3yDcm+0+m9T3l
	VaxzE6G6hyKDQZI63ApUb3SIyaCIfaYQxuuYTD0hNQww50FLpgMHG9uG1uAJ9ujtvjJk
	BuL55lZ6xyX/qgxbJDx6DvSRRSSuUvdXUDdSn6VhDfmoGR0qOur6WYkUCItFcRfJzcGP
	7w1KS200fADBpXod9H/gnBi6keFWvtqhCEddZ2iPKo1VBtgThDK1h47sOV5l1Fw7EtLo
	FNmQ==
X-Gm-Message-State: APt69E1Ns4DsamJvZc39e+KDXlCbi7RSVg5oyId3DIIJmmKXHbO1tSLI
	9AEeRWRwyMhFwXLH2IjcxlTRgA==
X-Google-Smtp-Source: ADUXVKLPRvUS87tEUWysnFIvAGZuslgcHFWb8jH7iV2yV2C9hBrr2Akh3/GbQ6zy9DAP2/J5iN4hhg==
X-Received: by 2002:ac8:5053:: with SMTP id
	h19-v6mr6066166qtm.71.1528466618402; 
	Fri, 08 Jun 2018 07:03:38 -0700 (PDT)
Received: from localhost.localdomain ([187.23.153.102])
	by smtp.gmail.com with ESMTPSA id
	l8-v6sm26128240qtf.77.2018.06.08.07.03.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Jun 2018 07:03:37 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Jun 2018 11:03:31 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Jun 2018 11:03:30 -0300
Message-Id: <20180608140330.3266-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] uboot-extlinux-config.bbclass: Add baudrate in console bootparam
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
X-List-Received-Date: Fri, 08 Jun 2018 14:03:38 -0000

By default, we ought to use console="${console},${baudrate}" as
console bootparam as commonly it is left to be passed with the
bootargs.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/uboot-extlinux-config.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index 61dff14b7c..c65c421b60 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -58,7 +58,7 @@
 #
 # The kernel has an internal default console, which you can override with
 # a console=...some_tty...
-UBOOT_EXTLINUX_CONSOLE ??= "console=${console}"
+UBOOT_EXTLINUX_CONSOLE ??= "console=${console},${baudrate}"
 UBOOT_EXTLINUX_LABELS ??= "linux"
 UBOOT_EXTLINUX_FDT ??= ""
 UBOOT_EXTLINUX_FDTDIR ??= "../"
-- 
2.17.1


