Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7764.1793700725740284276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=H8ub8HzP;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so20302365e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 02:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793700724; x=1794305524; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHnT3p8U8W428YwCxWJodQHwOscQ6YLaMCZHkexWJVk=;
        b=H8ub8HzP4F19Nws1niIIXtpS0g2g1rsCbcR29y6X7UFiNciDZb9kOXQSX+GJCeCf9v
         DnRXFa8+uZrrO9kBhJxhkXQflAxKA7lRMXdn46R09KYUVphiJO8IipC5kGAMtf3vx80T
         x97THb1QHDoJYgB/WKuZNbT76AkwZQEKtmas+DTHdNuTM51nUv6+upMixy+Wi1Xss/K7
         2yMmsd0dxa4O6qEAvqk7ak0pua7sSvkKQC4nF3R3XCYtrHfYOSyUXb6geZhehQAwlQMN
         OF5VFokAUVTaO0mXN77IrZm57H8Ls2OIp5BrcxXEoCYOd8ZnDpukkXRCMgmI2gzFIsPx
         sRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700724; x=1794305524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHnT3p8U8W428YwCxWJodQHwOscQ6YLaMCZHkexWJVk=;
        b=nxL5zXGm25k8jcg3hVyheNMgOHSfG2+56nB2ruWnQLMi4yjYzoP8WMXkQ4hY7yn6Bd
         NCXMdGpmKBHRjSadcaI/7aLfwsmueQHrDJzY4cLXLtjjrl2rWGScdP8RIWdU3lTMNHKN
         B835hIIiqK13/vg33sJrx5yQcn+CYLp9POd8gnLgAbxbe8+pculfReuhE8TYlmljjfR4
         auplfDsUzhjfiLbQmw8nu783ZMctGERDu/brPW2VTtdagO5EUwcwbJn5hqFuXIW34ZAH
         wLLguR7Zoi5msVUcZR992nYFhQmK7M41tR1u4BgfPC8qtfjtvizGZPtutJ0egflIxDVV
         0CTA==
X-Gm-Message-State: APuU4Z8ADmbNmwTApj6xIQT4kovM7O5gZPTtb+ll4MqPxe1KivrKJWpk
	o7C/tfTcPNgQuDqgWSNMrPgdtICxrevb549huZDrdgsjUOqLflMX+HSrJ16GEsu7J62lYEJujgk
	ekOiSElE=
X-Gm-Gg: AYBFou2a1gV9n51Uk9DyT8BtB0xjEia2dG3vdgrjfEJwjcDGg4mjc0ErS9TMxy/tHZT
	nHof78W1eusNumGT1AS/IRccE0xQLeaPMfiF7d7vG9RucbwqXKzRDJqyRJzL8ij1uIwL69VXsOh
	+xh6OjVEr86nahxwzhwwG1xuKK7bkfDFPR1idwcVzgFv/EE1hoKN+S6sgIUuS6+iHXcsclV+dfq
	vMT4JMa7ciX604f0u68o/xfq3RVYbyn+nE0VpQOyvHeA8I36O2T0VCA9qhQmrpnQO1ZAi7ZQmnA
	62qYAVCXL7FGpfShdaDLGt/K90TaTufqQyQcAOWtcUtoRdLFOrZRZXm5V2oiMCSgGlGrcllrtkA
	wn+0pSbk9IDzgxByE7ZlJIQl/78Mp7xKx4lP1Mr/yVhXSk0uLO+rUHIcPHsOL70GZ1+5/RkQDNY
	SJsr5et5TUGIP9xGwn4xhY8x9VLnKAkP0REN4Fx2cHYTyRSAhzZeUz9ktSNwH9u2K0eaWtUgkku
	q7YcDf6RW5uCnoa1DXJEL2eTwE2CQIcL7GdK+CYKZV0h9P28No0Vf3hSrksfL9WHBOMI/BuZDcK
	LTP/0E4CQo4g3zWbBGKhEwMnGdVFL6cZ2mKOhHMteBKNCLuzKxdFNP1MLgiYo/VGiJ1XlMkp+gC
	z/nsqeM4xFEIER0iLibeBmR3QCaCugWj5B7qAtQ==
X-Received: by 2002:a05:600c:4f86:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4ac18b7df2cmr294918885e9.23.1793700723903;
        Tue, 03 Nov 2026 02:12:03 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b393fd1748sm3209735e9.7.2026.11.03.02.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:12:03 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [blacksail][PATCH] scripts/install-buildtools: Update default to 6.1
Date: Tue,  3 Nov 2026 11:12:01 +0100
Message-ID: <20261103101201.871655-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 10:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249275
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Update the default to the 6.1 release.

"The last main release" makes a less surprising default than an
arbitrary (now-EoL) stable point release.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 4e6f6e25d72..b92c26c4567 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -58,8 +58,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.3.2'
-DEFAULT_INSTALLER_VERSION = '5.3.2'
+DEFAULT_RELEASE = 'yocto-6.1'
+DEFAULT_INSTALLER_VERSION = '6.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
