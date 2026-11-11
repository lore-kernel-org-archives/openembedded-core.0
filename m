Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5607.1794387821912654240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=AUDYfLl6;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so26924925e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387820; x=1794992620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L2OCmjqYyWDw2FwO/fMjzdf828FgEi4Fjzo0dv6obJA=;
        b=AUDYfLl6m3WoKFlCMJx1A34pyX5GZ+Zw6Mqo9LJH5WEz0X7uPJ/mZZ6EUULGdWzj7S
         s610/IBUjxTlEzrFqZ+AbJQSpvJGpKJy6x1WliKTgQ2rLcMlDu0k0XgTVj4+JppcxD/9
         CQOhwOEW+taIsAFJQVOxGQmIAHdp08IJhpoQtpSqYvIPYVJWsbmpFu4aSovWHEBx8mkJ
         q3Ux5CmVGYquw/51ghgV9/3IQNvD+lfJ7H2ZD8j83bzUMxI4jW5Zwke7Wn5B1tArUaiS
         NOZdsG17h1qAZU9er/lxLQVc/5Ay3YiebVyYQmw++Z1MSnCOv+ODo4Gdo+KLOxW4GOup
         fEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387820; x=1794992620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L2OCmjqYyWDw2FwO/fMjzdf828FgEi4Fjzo0dv6obJA=;
        b=oVj8uLhi9oAq/qwSPD47r/ZmBUvwqERHhtOgjMhxNBpqpmT+ox/9YwgIG06lhpMx90
         0LimrYGCcF9ZoiR1W+wirPJFODlf6ABeynKrRhuxwScsUhhJj2UKZENoV27f6Zh16+/v
         VGI0IBbBNq967kDEP2LHjYXkn/+dove6aw30Esv0yFeDiST6qnDB8rSqPa6HAUhLpzUM
         1QD4kcwwlOiXMKJBnPZLAF35++1nobgep7zlnivD2SXl2UPgT0SSxD308NgyF45ybumn
         vQN0p+65dO8c/+Bm6Pn4qclo8ET+xHtg+InmAC/iUiedLskOSy0emfDgmZ3VDOR/oaTC
         lWoQ==
X-Gm-Message-State: APuU4Z92L2U9chR7IUTHD5fXVLamow+aXtihPK/DtH/Ipaor+qCtnWRB
	hOiwa1gcQjkrfKjhng8NbbVuFuAg+BMw15P1sKrCJNpziHMdaUHLFgU4ijK0HVx1OMVymZRNFVX
	f2zaGiNE=
X-Gm-Gg: AYBFou17kzW1gleyETC/BYUiYLpdvy61+PfqTx1t3j7F+vUNr6mshxbHT5Sdbyadg2A
	k2UKiKfBgX7XKJ3fqz5VuAKygNic2qjuYRBszmsM3wsIoFVGg9PnSiqlbZDI21453oaOVQg3ot0
	e0QuNFqqNq0DM8ksB8raQIRo6IuEKOMpnNjDM132Id9GEoZo5/mNvGEbtksOMnH2Nca1rbz6Kim
	T8w5uGqUdQ5McFZkDftqo9pXwzQBEX8CrHNmux6Q1THyovsWc8zh80K87/9r47dfwJ2LvWuNHin
	/VXd9a4x7kyJfG6cFhTyLVqP4kihdFH2A0DbbSwNDFi3Nil/sj6NQt5UZVYCmddABQJ5FQB78IO
	Xgmz73INB5ZO7OFxubg+Z+WJrAgSPOzv3pHYTJfSUs6DJ/Qu140Xs2HZT5UTZ6yuPgcSddYABl/
	04ppc0yKKHMPiyfY0fSintQfWUhjZnFdsV7qweNJFTK0695Xnf7ajsBe/PQSTwuhVd/YftvBDV4
	/dX8p2zz/y9pJpM6wUOtcpiTeswlmFNGg7aHLxChfaEqklMxj57LIUdUSv5Auhqrraftgs5DZdk
	h70dI3hwOhkHYcEcOB98SjmwPkb/6GEtBVdf82e6sPdNByntj7vh9kpLVBvzEqPAGjoP/JIF9Vv
	5a+KbvWSLUYRuqBApZNP37ejZCTAhRRvPh42S57YBSqdv74vUWw==
X-Received: by 2002:a05:600c:6819:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4ba0935f880mr28495905e9.13.1794387820147;
        Wed, 11 Nov 2026 01:03:40 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/35] systemd: add iproute2-devlink runtime dependency to udev
Date: Wed, 11 Nov 2026 10:02:47 +0100
Message-ID: <fd286fa9f23b4a9fd3aec3021d0aa15773ef988e.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249993
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Service file ${nonarch_libdir}/udev/rules.d/81-net-bridge.rules executes
/usr/sbin/devlink which causes errors seen in journal on systems which
don't install this package explicitly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 69bf564780353d34cfd87bf73960cfadd8b2c6ac)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/systemd/systemd_259.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core/systemd/systemd_259.5.bb
index e924884bf95..3c747545322 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -760,6 +760,7 @@ FILES:libsystemd-shared = "${libdir}/systemd/libsystemd-shared*.so"
 
 RPROVIDES:udev = "hotplug"
 
+RDEPENDS:udev += "iproute2-devlink"
 RDEPENDS:udev-bash-completion += "bash-completion"
 RDEPENDS:udev-hwdb += "udev"
 
