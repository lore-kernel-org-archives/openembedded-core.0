Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4539.1792753107109015102
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=Zayzw6nm;
 spf=pass (domain: 9elements.com, ip: 209.85.167.51, mailfrom: tan.siewert@9elements.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba357a1929so708299e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 03:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1792753105; x=1793357905; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p88+Uv7iVLkdlY+U8QZCDp9ixA+nbWn1fwnh4Qa0jV4=;
        b=Zayzw6nmp5oFNqjSAGOnSwMdGdeZqKRkL3sX967W6YTsr3TihoV+fQIY6/zYJ6lxNv
         bnH+4tUuyKR7oeQg//+eHnJnjCUlT2lHnd3OOc5keGO/tV6M0faSnLnmfBl7p3dMjPeI
         uoz5QJnCNRztowxP45WOIq38UxZqVWQcvtmPPwoXnn5Hi3H4cKiGdbTVG7gD0fMhV4W0
         NV3LEPeTQpeQqhuvvMBgJe60idOr939FaUs01uvV3G9lqAN+nDERnjQlhm6pHdUSmMuD
         Ez3oljy8rrvt95Z2NY3vy356nosoTozDrLJHx4IopYCkGUydb1YjWVSqrx9LtiQQ4uyL
         eeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792753105; x=1793357905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p88+Uv7iVLkdlY+U8QZCDp9ixA+nbWn1fwnh4Qa0jV4=;
        b=K3uJpqkKmPoPBd9EEqFGkj+j6dI8tUYPkMgcwLITFkq2c/eFoDWVwgtfizfjiAChuv
         Y8fEsPh8OAWn5NRyo/tfYL/An23x83N4Q/kPdwVX0X+6tIqwj5T8fOZA8QvLkfAkRnyR
         CW7vtFQ761rXZItejZOkR8MslFnryE0e+qwOTOlKk6MJ4uN8yXgw1nqgco2YlGStlGOu
         j2vAzgGipp350xS8ZRB8MmGzGjlMFwhELWYpGVdLZsW8JKTxaoMuGYYJcUK8CdSo/QCR
         Pqqim/y6ADnxVO9/O74RgcDXmoD+BVy7lU8Ovw7pPZQn8icHGrnxCO1Tw2T6FqneRk5c
         vSAg==
X-Gm-Message-State: AFq9FYL7wdFBI/ZPDpv4jGxZ0vFHC4obRJYhe9aj0OE1cRyWqW+DUHvI
	w9wYVIscPZ8q+OdCibuDj9ezV+EvKgSoJd71nNa/NqDMPdxfZBS1f8zbMl9Qt1zIz1FxV+MuAmq
	qiGpB6+Q=
X-Gm-Gg: AYBFou2cjahwwP4+JYVtY5+c6vMWniF7d57J/0p3D3PxAnqIYJA2bs3GQGWcQfgIeX5
	1B1GhfjMNBfUQ+W9GtmlyRxfbIWaftgUhd92f+ZgbX+bk8qtuQ7e1JJmwOYkPOaFvQGvflBTULR
	Ust2TSnwUdEOKCM3uMDHMRKmAcPKNevawT5JIsXHQ1/5xQKwEjOxOu0PTBsQUkxqsqaDZ9/csAN
	Hav0S8XuvgReerDjEH/z8MLvGsIl2SWTd0MiEhX1J4z7RgBn5PMrHzZd/XthaS9zlL+Qhnhia5c
	3PfQDQHS8KkC6h9+TLtgnIxhHEm4hBs8msB70jLf7prtBLq3v35hjfvcjfHqy1C03IdmB0d6/Qs
	tDmA/RZ//Fj+tXdHbiOciYwu/1+nA4V20fR6ajSF1U93/CmLG2ZKC0B/QLj6teI2ghgsMM+BLJD
	W2bO6KgtxguPdlMaf+aySr7W7ukWRo6zZSoj0WReXbww9s78PJ/dFmDFcrMpXk9rX4ruD49wQ0u
	dKK9QnVnU6yEUdNJdM7fNrUkD59qkoq1wUZVFgnpHOdFUbVoijju9m6JGBP+mjx3bDY2osHaA==
X-Received: by 2002:a05:600c:46c9:b0:4a1:d36f:1ba0 with SMTP id 5b1f17b1804b1-4a211f371bbmr33252075e9.35.1792752727863;
        Fri, 23 Oct 2026 03:52:07 -0700 (PDT)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha.local ([2a01:599:841:69c3:a3ce:18eb:5996:fa43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37eded3fsm4268891f8f.7.2026.10.23.03.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:52:07 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Fri, 23 Oct 2026 12:51:53 +0200
Subject: [PATCH 1/4] systemd: add ukify packageconfig
MIME-Version: 1.0
Message-Id: <20261023-systemd-optimisations-v1-1-0cce103e54df@9elements.com>
References: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
In-Reply-To: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Patrick Williams <patrick@stwcx.xyz>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792752717; l=1936;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=1LlfPvhoaDRD1FfKydF0abM+/eF+dBDQDt7FuFKeuco=;
 b=WuD8lypfzMgHBwwfC+kWPBSFEELm9mq6DeypLwzAr3I5E6pwmBAgtlpH7PtrqzmRztPblOJPv
 4J3uTYdWMR2CzUFRqUPR22Vf7OuzpVgbhr0TAFT3iToz5GjsEigsJgC
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248540

systemd gates ukify via allowed(), so it is built and installed unless
explicitly disabled.

Add a packageconfig option that is enabled by default when the efi
DISTRO_FEATURE is set. It can still be removed if wanted, which may be
useful when using meta-tpm, which may include ukify implicitly.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 meta/recipes-core/systemd/systemd_262.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core/systemd/systemd_262.bb
index d70053182f..24797e2e08 100644
--- a/meta/recipes-core/systemd/systemd_262.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -52,6 +52,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'ukify', '', d)} \
     link-udev-shared \
     backlight \
     binfmt \
@@ -197,6 +198,7 @@ PACKAGECONFIG[set-time-epoch] = "${@build_epoch(d)},-Dtime-epoch=0"
 PACKAGECONFIG[timedated] = "-Dtimedated=true,-Dtimedated=false"
 PACKAGECONFIG[timesyncd] = "-Dtimesyncd=true,-Dtimesyncd=false"
 PACKAGECONFIG[sbinmerge] = "-Dsplit-bin=false,-Dsplit-bin=true"
+PACKAGECONFIG[ukify] = "-Dukify=enabled,-Dukify=disabled"
 PACKAGECONFIG[userdb] = "-Duserdb=true,-Duserdb=false"
 PACKAGECONFIG[utmp] = "-Dutmp=true,-Dutmp=false"
 PACKAGECONFIG[valgrind] = "-DVALGRIND=1,,valgrind"
@@ -405,7 +407,7 @@ PACKAGE_BEFORE_PN += "\
     ${PN}-networkd \
     ${PN}-rpm-macros \
     ${PN}-udev-rules \
-    ${PN}-ukify \
+    ${@bb.utils.contains('PACKAGECONFIG', 'ukify', '${PN}-ukify', '', d)} \
     ${PN}-vconsole-setup \
     ${PN}-zsh-completion \
     libsystemd-shared \

-- 
2.53.0

