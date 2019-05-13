Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4C23C7DF5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 14:11:23 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id w1so8543894ljw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 07:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HZpgMeZR6KvcMtCVGSVQxtbVs9k3aWT12LHIZHS+EfU=;
	b=c1fluSh8IwXUEJWgLQDeHXRt5a4dnSzCV1yrj5jqR5cp0I+iFm9uu1Ha5hxGQPuq0J
	l2GAd6cEuQmWcnq5u6KecFCd3PgsSALc5hjePRZ7IgkzWZ0FaUo9zgizMFHFAwpW++K4
	vD39VfLnfQxNAg9WtxJCj5lBhlAnCzyhwDlJbYOuoTumDd5MmYW9WrgfpOZi14BSpfJx
	Ui0CcpYlQmvDisMa8bUd79OUOkzWdYjTzD+TI3d6xRI/kJ9JPx8xIhgcnn9mw3f3noQe
	jBRYXAvXTbTX0Tjsf9kamKa2y4h3Yp0HQFDi7WYSSgxARTzguNH/hqpCgNRPolt8E3iD
	0/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HZpgMeZR6KvcMtCVGSVQxtbVs9k3aWT12LHIZHS+EfU=;
	b=A25EDj1OTqoVz+aEaT7K4x1Pq/sZXHMfea8NtRngzvtePkdhFjRGoxiClWMsaZFn2a
	NfyYMub9Ek59Xu+YERXLNf8sVvaoHjFqP+HCVyzuHJCBfs98VfOgiw18aJaU7hZBH1c+
	em/jS5J9Yk4Jc1IB5B3KIs+IXNhlmyr/5ZPBpyjP6kDTq0JwOxoLIn/ELhAjpOFTwHb9
	EVlaD0bnH1YvYG2ePr8/yeaqEpbx3hEK4pumMRciYD/PJl1PUe3/kKrz2uA2QZCgwGS+
	74gyoUQ2zfVjMgioM41ANd9Cj+WgJpuFdxy3XqfwJhZzmvvAQnRntAI4gH8ljwZD7K3x
	BLvQ==
X-Gm-Message-State: APjAAAV9VBmr3j+GfgNGwohAYzZ/kKRqMbkVS0s6OR5lyr8gn52Z1E7l
	qbuFY0wok7bhBJWt77X/ojFeqAc5qBs=
X-Google-Smtp-Source: APXvYqxxf+3seSXrZPl60pGQPUlVHphLZtaS5GIZ9hjN4G8xDxlyJOtEpFHH/lB2TssV/+tLYHScCQ==
X-Received: by 2002:a2e:9b0b:: with SMTP id u11mr2535174lji.57.1557756684242; 
	Mon, 13 May 2019 07:11:24 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	e12sm1113916lfb.70.2019.05.13.07.11.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 07:11:23 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 16:11:16 +0200
Message-Id: <20190513141116.21351-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.20
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
X-List-Received-Date: Mon, 13 May 2019 14:11:24 -0000

Changelog:
- Fix issue with DHCP client and handling renewing state
- Fix issue with DHCP client and handling rebinding state
- Fix issue with DHCP client and recommended retry timeouts
- Fix issue with Generic Netlink and family discovery

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.19.bb => ell_0.20.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.19.bb => ell_0.20.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.19.bb b/meta/recipes-core/ell/ell_0.20.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.19.bb
rename to meta/recipes-core/ell/ell_0.20.bb
index 8f635e673c..81caa80fab 100644
--- a/meta/recipes-core/ell/ell_0.19.bb
+++ b/meta/recipes-core/ell/ell_0.20.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "4356397ca11d5f8ec7f1aaf1e91ffea4"
-SRC_URI[sha256sum] = "a5a4d45ca002dd91560fcd565e696f59e82631e69c927115dafc640f0b8d779c"
+SRC_URI[md5sum] = "920189f5be4ee4cd72d610baeb20da65"
+SRC_URI[sha256sum] = "d4aa08915f4058ecaab509dffbe22665d71dba6fe9626caff63c0e5f4b78a394"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1


