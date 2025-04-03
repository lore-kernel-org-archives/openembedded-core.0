Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5F7C3601E
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 10:53:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.10509.1743677594853640776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 03:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iSi/UiJ4;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so4746055e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743677592; x=1744282392; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQ2Smdhos5X/wqThW34tLKDGw8QfTTCTTVTEeJECMyo=;
        b=iSi/UiJ4dLDxJ1N+9d4Al3IcIOZFk2DS6zNj+Kr191byP3APoLyNHQGrXp9jcF6vou
         j+gXKSmES7/InOWWfKaGRsaCYSzqVBMAaNxcFXieRwqdHVqhkIUkNocDgkY6twYQhW2R
         aUrA/6IBqmDl8fMIpSI5Q/NXvZCFvdioBHL4mnPhrRHij6mMLAAkugbqua/l00G5nROW
         bI2drixKYGwA93fe9zKZziZ2AWar62/IuRJpSu/MOhTc8lkEM+arZX0AFWScspa+Zsyh
         oPPR5AiOgh+wsHbb0PfpPhJNZfQT8/rrDh7NDCqr4SlY31nScW9rrli68UsH/Qj1Yhg5
         lNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677592; x=1744282392;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ2Smdhos5X/wqThW34tLKDGw8QfTTCTTVTEeJECMyo=;
        b=OkgwcxEiiGKaGcjkezZ4ISnMsJZ0g4XHVoJoz160uluIurLGvWUnwWxzLAt+ju80PN
         C3YvacJQahGlfKGBzZlstZI+vSU6PSn29AVsdNOS1LMWc5mXogzFuBp5bgJsbm70xCyG
         Ah3ZXzWQoLsmuDpV9SbSz2f0USFNtQz8aG8NTmXW2lN04bebuFri5k4m0+6WkHoDWfak
         OVXG50OVzgeiI8QpoHwMSJjq8qHpAkBxiiN+KyDu2iiITOl6cY+QJb5D5D8eCp1m75ce
         CMkMc2FxTbFL2OqZN8ExzRNmIzH/Si4VU1fecAKg/YF8F6cOl1k1mklaAM3NGTZYYE81
         Ig/Q==
X-Gm-Message-State: AOJu0YyHRdU9D+cKBfLoLsLQrP48p7YLm14ttwGKH6SzeNXwBwoNSSUj
	yI+rmbtIjKrHxmEao2zJP+eI/Hab/w7ZD3BRMqqZUGW33cB4LamJBVWVf+VN
X-Gm-Gg: ASbGnct8Y7kaYMKSHOC7Jnddl7tVjsxmajBxNsMQZrv5pkb4+gQOASuu9uKocdSFvWN
	kly6CITN7alPK8kB6EX033Rdpn5UDhd1/g82WBN2sZmZALdtndJpmedOWnuCDxvZgfkRZQ756eY
	vnWzQ/P0rdZq5oDohiwEqLMQTl4pyi3LzPB2BJZC80zauFDgk+UCZ/AlSFn8LuzfPXBBF8v9XDi
	ueQnmcJ0raAS/ELA+aWD9Rfm/ioEialey9ZG7ln3C4FPx/UwuGVfJ76HhjBQoPtgKXfEreqtubc
	UP/ZrmGj2+e6cQaivn6RQC9cseu5KYNvQ4wEwkmhHCeZBgdZ9zJrBfi5PktSHhVpc4xSuD7pftc
	MDtUX/pNrK/MW3h/XyCVXjQ==
X-Google-Smtp-Source: AGHT+IH9FKGwNoRSxt3PTMCtrR/nVKYAKD/tL0IFDnGakAgCAHqiXfof0wkBAB5ajgT9kAyx8gaCwg==
X-Received: by 2002:a05:600c:8705:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-43db61b33b9mr233194975e9.3.1743677592143;
        Thu, 03 Apr 2025 03:53:12 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630ddesm18346865e9.5.2025.04.03.03.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:53:11 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 03 Apr 2025 10:52:56 +0000
Subject: [PATCH OE-Core v2 3/6] connman: Move ppp from DEPENDS to
 PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-connman-v2-3-8bb637312ba8@gmail.com>
References: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
In-Reply-To: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 10:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214314

ppp is only required by connman when building the L2TP or PPTP plugins. Move it
from DEPENDS to PACKAGECONFIG so it's only there when required.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-connectivity/connman/connman_1.44.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index 553a377684c67190bbf274a28759bc1825b21d75..aa9da070dec1b4aac02019ae9c3158256b534c61 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig systemd update-rc.d update-alternatives
 
 CVE_PRODUCT = "connman connection_manager"
 
-DEPENDS  = "dbus glib-2.0 ppp"
+DEPENDS  = "dbus glib-2.0"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
@@ -63,8 +63,8 @@ PACKAGECONFIG[iwd] = "--enable-iwd,--disable-iwd,,iwd"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
 PACKAGECONFIG[vpnc] = "--enable-vpnc --with-vpnc=${sbindir}/vpnc,--disable-vpnc,,vpnc"
-PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2tp,,xl2tpd"
-PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,,pptp-linux"
+PACKAGECONFIG[l2tp] = "--enable-l2tp --with-l2tp=${sbindir}/xl2tpd,--disable-l2tp,ppp,xl2tpd"
+PACKAGECONFIG[pptp] = "--enable-pptp --with-pptp=${sbindir}/pptp,--disable-pptp,ppp,pptp-linux"
 # WISPr support for logging into hotspots, requires TLS
 PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 PACKAGECONFIG[nftables] = "--with-firewall=nftables ,,libmnl libnftnl,,kernel-module-nf-tables kernel-module-nft-chain-nat-ipv4 kernel-module-nft-chain-route-ipv4 kernel-module-nft-masq-ipv4 kernel-module-nft-nat"

-- 
2.46.1


