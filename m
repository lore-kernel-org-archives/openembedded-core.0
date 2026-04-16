Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57C7F8A153
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:09:05 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26349.1776373736781660647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JwhGvQb/;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso100491315e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 14:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776373735; x=1776978535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=JwhGvQb/Xcw4zCgsu76NHgovos7oRzRpPrm9cqFquuRef2Dc+el8SEvCuF6qropN+r
         +KQUmX8WRGNitCZSvFAev7TW3I6TgMUzkbJyClZZYj8fYf6gmq8vvA+BSqrOZ65LbsIh
         GnGg2l1+mUyHZ7zQAcxReSo6ZlmIX6kTgVA9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373735; x=1776978535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MQ1nnPZD4T81cHP4CPJAEtZLqfKwRd1IwiROmD+jMLs=;
        b=TCr0XKTpgUqgbxKg2IhtmZDt8gOsbruP4SLi1i/+S30Za9UZn5uE++zYDnxwTm+PJE
         M+kIrEBkv9ONV59QZCpFuByhYCZR58ijFr0cbSjxshqLRBS8ouSNP/it8S27BUgfRbDq
         aEPuvc1s6l5T/x7VJX44VodEkxkG77MimtNPH4xxtKOJqx41ETVuT4RxSDkr/qbrA0Lv
         9WWEhxeT1NZlIgnEn+eiNJ04xGTds0Less7uIZKpHs2+CbsKiksOjHTf2v6dF9YUmODx
         R6Qk/82PwHLvthnHUuTd7Bs1dMiwHCkb9kxEwwLXKiyk41danI37MgQLOLV3t7C2FJ3F
         H7Sg==
X-Gm-Message-State: AOJu0YxdNe1dkQ/+6vLA/CsEJ3gq+SSWeq3OhAMZke016e38JvSL6isU
	s2sdDhODupIIqWb+w8KuJoH8BkczJU0d4eqD68YtwOfhcPWEFJofoQJOMgnXPX0XkDNQTEJ5Fbl
	wxkxqw+1g7zKf
X-Gm-Gg: AeBDieuGQwXLZV7di9uAvGZZb4Sq2YsLengTE9pbpgE52trLH+4zBM6RjyoGyZKa00q
	duAnSPN2d6Ey5p8tJq3RPanR67QqpEdQ7MrVnog/LXxPwOHp/6cyWtE3D4xI4DP7ssSUkZoGhmO
	9DOPZ0zCC5D2WvIh3PSw2vJX2LK2R7HmxBsbg3YVDLlwc4SZ12rFy4KKy1OeXfPYHi0O1KluLZW
	CkDvQs+tXzOhAJUy/GelwnsRpkzcScT5eLAnQnDptQiO0rk3BuRiRAnuSAgcZbmLUjgDK0En64u
	Kjhk2MI4dCMwQ5uy6BdKYH9rjADgPRMq3ogu8M+mXIR3E3IAdiY9s+Jqbq8ARD9umm5QG2V7Ho5
	iatSAI37LMg6qwCn/aqxGqkeCpjX52KYZHteRgTaY/7EiVz9hY0DzWUNl5aiNhJob4juoT7/6cp
	nKDjWP7ZTuV24x8lWFq1pJbas395zs1OBQu6ccbdUWv6LfkyUWAfdB3DT2keTf2XupM6MoufSbt
	K/zUPiWOVXhGLwbkHjL7T9nSY4LQ0ZxBMbswQ==
X-Received: by 2002:a05:600c:530e:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-488fb768db3mr3075865e9.19.1776373734894;
        Thu, 16 Apr 2026 14:08:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7c2167sm944985e9.36.2026.04.16.14.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:08:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 4/8] scripts: Default to https git protocol for YP/OE repos
Date: Thu, 16 Apr 2026 23:03:57 +0200
Message-ID: <20260416210836.1336162-5-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260416210836.1336162-1-yoann.congal@smile.fr>
References: <20260416210836.1336162-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 21:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235421

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/combo-layer.conf.example | 4 ++--
 scripts/contrib/patchtest.sh     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 90e2b58723b..4ae3db45ab1 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -14,7 +14,7 @@ signoff = False
 
 # mandatory options
 # git upstream uri
-src_uri = git://git.openembedded.org/bitbake
+src_uri = https://git.openembedded.org/bitbake
 
 # the directory to clone the component repo
 local_repo_dir = /home/kyu3/src/test/bitbake
@@ -76,7 +76,7 @@ last_revision =
 # that matches the original commit.
 
 [oe-core]
-src_uri = git://git.openembedded.org/openembedded-core
+src_uri = https://git.openembedded.org/openembedded-core
 local_repo_dir = /home/kyu3/src/test/oecore
 dest_dir = .
 last_revision =
diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh
index b1e1ea334b9..550b6a88f3c 100755
--- a/scripts/contrib/patchtest.sh
+++ b/scripts/contrib/patchtest.sh
@@ -75,8 +75,8 @@ source $PTENV/bin/activate
 cd $PTENV
 
 # clone or pull
-clone git://git.yoctoproject.org/patchtest $PT
-clone git://git.yoctoproject.org/patchtest-oe $PTOE
+clone https://git.yoctoproject.org/patchtest $PT
+clone https://git.yoctoproject.org/patchtest-oe $PTOE
 
 # install requirements
 pip install -r $PT/requirements.txt --quiet

