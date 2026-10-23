Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4550.1792753170514096850
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=bednXxRI;
 spf=pass (domain: 9elements.com, ip: 209.85.218.45, mailfrom: tan.siewert@9elements.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c413dea9ca6so118654066b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 03:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1792753169; x=1793357969; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wIWM7MB6f2hZXNUIpVr48Owov8w9+wA09SNeuppl+3c=;
        b=bednXxRIjwIBGY2OzftNk/K5EQ1PuVySeejDxkfdm3L4oODf50UXk/AyPlJ3YcXOJu
         vU1xigyO348b83oArzeXqSniYjkfJZM1f4n53JmEglBW3roWQNugKtbBYRtlcXnSH7f3
         /yRNaPFpj0S8S4TSIw4AG1B7qBGfj0zlDQgOqfq0fYwV3Kq79fPKiYci64dfupzBUCoH
         o2R+UdzF+GawroTAzEQhksngTyYhGEYAzr6NU2JiDkd0PnQuHaLIlnHb3jnfmWIEMHVr
         wE5FnIRBi2QSTmDxSl/DPGjLc+Mun/+6uZwNJLvIl5RwpSB1ESGvS0wucWnKX+D/j+wJ
         7zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792753169; x=1793357969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIWM7MB6f2hZXNUIpVr48Owov8w9+wA09SNeuppl+3c=;
        b=FTfEDnXxXLVT24afQQ7/4K9F4BJY+Kpx34qhNVvCnQM1BNmpvZijowFj6dGLVuAGTz
         rkEvJC/4/32NmdMrRADD2fA7BYI0lh6DvtvaT3sEGbPYE3RxVatw2NJQYLOj7BQjY5Pg
         qWnR6H0/bVU6jrBUprdatUNbNWVhJO48gei75gA8aR0zCCuMSisyJC/31bOH4nNWDk/Z
         FR9KhKPWS/CRH5X7LMWvwsicJ6Ng90SDuIU3Dx3JljJ+10/KiFp1EGOu6XoXCRfZjH/x
         T7DgTVgZEbzL/6oWFYAA5YyQNx9Um79UATf8iAmjKNURmb6v0YUWmRxehYhthCcaUUF8
         swbw==
X-Gm-Message-State: AFq9FYJoMKMnKGyAEv4ZPj0latSP15uYzy+DTLC2KNXgu22bsTTGKff5
	O0Mu/eU4H4GlZSjckA24K/SYrRZE60s9J8PDGPoeTa55VFvJuMB27DO7VjH7Fil/h9evwfuQ2yW
	/217D9GE=
X-Gm-Gg: AYBFou3u/MK2ekIZSUsrZb6F05hFyyY2pPoP2wXBIehvHq4cxnur0tF0NNRRy3IcI3Z
	U7Zxq1PYG0s2OXsfN/CoVoolAEAS1MuOHokTBZmvIlMRYxeoU2btJ8HBN4xP11AcSTBEbPQ9eu/
	PcflohgeyVan2kQLc4SYB2suzltVRA6UuWev3/+3xl+3KL6jvBBFABQpK28eGBAQl/yv4G20NzA
	SpBnBukPhf8BqnYgkBKrTr/uGyAR8R4zDk7GMUt/bofZEeriGyc/ILJjLuE0nuOTWMXdfnCRHfO
	VVApyI0FXadqT2w2f6G1Zo+v8e1quty5idNGI/D50RnKIoZPgYmOEPnS9uUS6ZpRWYAM1chb4Pr
	TrM2ygB8E2VRnxIVqp0V6N+zpD28LJU4/YSOi4yYIFJaAEp0ZT6iAzBPuxEu6KTru3z0AEqOPhj
	771qtoo2e0hYczCbo/yMikKt4eD0dyZ+XLWPpkhJym1mgfUGhhXnhSXGSsHEQcGPV24ukeYF/1s
	Cxem92GzEmtRVLvLL4UVj/tufcbruHwu/6gLUvR42xSvxTY4nJcx+ufIOGsEVjv11eHcPke5w==
X-Received: by 2002:a05:600c:34d1:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4a211c73073mr27479065e9.2.1792752730379;
        Fri, 23 Oct 2026 03:52:10 -0700 (PDT)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha.local ([2a01:599:841:69c3:a3ce:18eb:5996:fa43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37eded3fsm4268891f8f.7.2026.10.23.03.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:52:10 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Fri, 23 Oct 2026 12:51:56 +0200
Subject: [PATCH 4/4] systemd: add fdisk packageconfig
MIME-Version: 1.0
Message-Id: <20261023-systemd-optimisations-v1-4-0cce103e54df@9elements.com>
References: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
In-Reply-To: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Patrick Williams <patrick@stwcx.xyz>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792752717; l=3264;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=u/NqTRNsgvEGcqTjSOfBAzgY/NMdpaeFE7n48fdJoTY=;
 b=bEyJDQ0njXsNvs3YN0v2b3ltoeyXaKHid3SSZ5bL1tKuX8JV0iQj7UZbUE2giYKB08gEIMHb2
 k7eN+awX8qhDsXmwciSrIfbN5CGeTpawwpbmYPVeWITa0cZ4wcQNzPB
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 11:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248541

libfdisk is used only by repart, homed and sysupdate, but as a dlopen
dependency of libsystemd-shared it always adds an RRECOMMENDS entry for
util-linux-libfdisk, even when none of those features are enabled.

Add a packageconfig option and make repart and homed require it, as they
would otherwise fail. sysupdate is auto-detected and silently dropped
when fdisk is disabled.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 meta/recipes-core/systemd/systemd_262.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core/systemd/systemd_262.bb
index 03f4e049d5..65c6ce141d 100644
--- a/meta/recipes-core/systemd/systemd_262.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -57,6 +57,7 @@ PACKAGECONFIG ??= " \
     backlight \
     binfmt \
     coredump \
+    fdisk \
     gshadow \
     hibernate \
     hostnamed \
@@ -131,6 +132,7 @@ PACKAGECONFIG[default-compression-xz] = "-Dxz=true -Ddefault-compression=xz,,xz"
 PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zstd,,zstd"
 PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=enabled,-Defi=false -Dbootloader=disabled,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] = "-Delfutils=enabled,-Delfutils=disabled,elfutils"
+PACKAGECONFIG[fdisk] = "-Dfdisk=enabled,-Dfdisk=disabled"
 PACKAGECONFIG[fido] = "-Dlibfido2=enabled,-Dlibfido2=disabled,libfido2-initial"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=enabled,-Drepart=disabled"
@@ -869,11 +871,11 @@ python __anonymous() {
     if bb.utils.contains('DISTRO_FEATURES', 'systemd-resolved', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'nss-resolve resolved', True, False, d):
         bb.error("DISTRO_FEATURES[systemd-resolved] requires PACKAGECONFIG[nss-resolve, resolved]")
 
-    if bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'openssl', True, False, d):
-        bb.error("PACKAGECONFIG[repart] requires PACKAGECONFIG[openssl]")
+    if bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'openssl fdisk', True, False, d):
+        bb.error("PACKAGECONFIG[repart] requires PACKAGECONFIG[openssl] and PACKAGECONFIG[fdisk]")
 
-    if bb.utils.contains('PACKAGECONFIG', 'homed', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'userdb openssl cryptsetup', True, False, d):
-        bb.error("PACKAGECONFIG[homed] requires PACKAGECONFIG[userdb], PACKAGECONFIG[openssl] and PACKAGECONFIG[cryptsetup]")
+    if bb.utils.contains('PACKAGECONFIG', 'homed', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'userdb openssl cryptsetup fdisk', True, False, d):
+        bb.error("PACKAGECONFIG[homed] requires PACKAGECONFIG[userdb], PACKAGECONFIG[openssl], PACKAGECONFIG[cryptsetup] and PACKAGECONFIG[fdisk]")
 
     if bb.utils.contains('PACKAGECONFIG', 'sysinstall', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d):
         bb.warn("PACKAGECONFIG[sysinstall] may call commands from PACKAGECONFIG[repart]. Consider adding it")

-- 
2.53.0

