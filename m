Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08826C5B549
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 09:08:28 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.46971.1748336901476164365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 02:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XlAGNHI2;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso27559211fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748336899; x=1748941699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKqPhQkfjn6Clyy+kuTiPpKSNq3EXwgtEWm3XWqIWKg=;
        b=XlAGNHI2fQrao/xSKOdVox3WMi+6eUeuODoNG5B/Jhe7sxvpGdovjl59vmaleOJeeV
         0w54Rq3QvI8RuSAsf9ViB9OH8qMNjbHZ6lNaocWuIeV7s+8Wdy6UI5houV4bt26cfqWT
         KwwD5/1+SqQqcLcRODAfCvPtqiJivMxQvK3Z5ZN48ZRhEKAHrfC3EggyridirKbLEI3v
         HGr/07uYedHXY1zhXGM6vP7FcbjyeXaMlNLVPVF9H2zQnj64OZl85p9m+ycY9qQlirAX
         o4fhlz5Go+Bg+WW5wYJCzwOJeeBgsOya4MANgVTrHAYXeIQoDT02RQk/bg14UJbiKifA
         zaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748336899; x=1748941699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKqPhQkfjn6Clyy+kuTiPpKSNq3EXwgtEWm3XWqIWKg=;
        b=VB78/kcee6eNMDvgj7pYml9MyryIStvS6/2xdyG+BJzLZXKXXP9KkWkKLa9G/sQjWF
         C/GNns4UhSx9R3Vh8nKeKvQMC1IVI0Ncs7BakCdagPSlLiIrzoyinxVvFmvUorWD+qqt
         ddnMHau6utFwDpRoyQOwI81OUY3gSKaLjTW3uZoYcGNmWPfXvPhT6GWBlQ9gNoLzbYi/
         Nrkw2F4YYPIcUY+w4N+lF0WpU1REwBVnlyeErqX4QXCh4Zr9xKQBAzurzG4jOPngENNE
         bpn9xNb5cYBf0FLZe5j7b6OvFVhwSXwTIwQ6KRHW5q6TPIafTdcwKXIt2Midi+luNm9Y
         e7AQ==
X-Gm-Message-State: AOJu0YwNhMD1kr8Kwyk/TtIxvElcOLpDfOjyQxPTK4LR/hAjT1OcsAsB
	4Vb3tH9AF5E/cYFbyLDo2sTDc0AwXrRolzvw+WKOQntAjXPu6YPfNsoKyImRJXDmdUeCXZgHa+f
	HD9zL5Zw=
X-Gm-Gg: ASbGncv8+ZccNaxc4WBy/vtqVms/ap3wSjBdSeK6xBTuscieFfXm0nf5cLX/rsDwnIh
	qkR0B8IxQTLMtSDvxnSnBHxKjt/ZsSfz7uK4nGJOZjkXUSW8OelWmaQ+4dRx13UUJyCT8qfGcxx
	PXKCrDHzV/KBGOtroi8v9/nut+LgXdUFGT3wCM5GuxsureSUNWaccVaphY41P49aF1ZWBik49SW
	CX4RFwpF0EJl3UM6BBgphtUMyhWlHgCJHhYz0HtnonYLfLk7x0TopKE4bp5tW2lET8ueQFJv5jr
	In30teg1V8jqypQR0Wvt5GuHZSmoA42DtrdQgN6bXDJYYXYrG4KnETSwHhLmfoJ2og5cTwnfkLa
	++dC4Kei9dpS8P/GohH95Azb/
X-Google-Smtp-Source: AGHT+IGwBe0263pq+q2ypydjuW63yGDhcot/cz/YTvr135dzlY+Jpgq7y35K/fpP3n3QPO4JahAaDQ==
X-Received: by 2002:a05:651c:b08:b0:31e:261a:f3f5 with SMTP id 38308e7fff4ca-3295ba56ca2mr39695061fa.22.1748336899268;
        Tue, 27 May 2025 02:08:19 -0700 (PDT)
Received: from localhost.localdomain (2001-14ba-48e-3a00--183.rev.dnainternet.fi. [2001:14ba:48e:3a00::183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6d358ecbsm2290211fa.17.2025.05.27.02.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:08:19 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 2/4] qemuarm64.conf: allow overriding QB_OPT_APPEND
Date: Tue, 27 May 2025 12:07:55 +0300
Message-ID: <20250527090758.540188-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527090758.540188-1-mikko.rapeli@linaro.org>
References: <20250527090758.540188-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217291

It enables qemu USB support which causes a reset
loop currently with u-boot.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index d310445a34..f086729641 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -20,7 +20,7 @@ QB_SMP ?= "-smp 4"
 QB_CPU_KVM = "-cpu host -machine gic-version=3"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_GRAPHICS = "-device virtio-gpu-pci"
-QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
+QB_OPT_APPEND ?= "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
-- 
2.43.0


