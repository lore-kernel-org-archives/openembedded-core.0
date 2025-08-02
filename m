Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EA0C87FC9
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 06:46:32 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.1926.1754117184465366568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 23:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+RCUYc1;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0dd7ac1f5so446980066b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 23:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754117183; x=1754721983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvY0TnMLtOPB0tdizTSFEoab6WbCxWnKbDsjkbpeD9s=;
        b=k+RCUYc1zjZydeY77NB0EI0+G76D6A93dzwqLpuQo/JucbZWiNkgo1DR1isDu7DTXy
         /ILaX33A6VxHtBF4T2gODymWODi2ajx1Z2OCBfn1rhKTvMR4rmY5tmmJYAxa8Yxpwip4
         jZ7dFIIjGRAdZNucIJXnrJXLBbecO81UatXGXhkxUJyV++HtBXCYFSmQQPtyi/vanEzV
         TSBB6giAFS3DxyVrZqm16ZMl3VuH5MxXrI2eC8Ikc9Ka2wbi85VVethcCpfOkVK72qOf
         FvAkHD81KHwYoi4tkepOyVClQnhe1q/fgEYKAQuX9dEJVqvHyr8h+e05PehtE0pZcPNY
         kHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754117183; x=1754721983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvY0TnMLtOPB0tdizTSFEoab6WbCxWnKbDsjkbpeD9s=;
        b=rjvpRikJ8k0fMAVI4zwRKIph8mJCFAJsyWv0GujE/j8wiugvs0xogA+eZA2ecBY5BX
         LE+EUoL/EuEEawZIkf01qdHkQypHUBpzTe7xaCJwq99Y7op6I4/lOS/L9z/bud3ltwM3
         sPlgdgP6zVKZhdD58/J/UGIfWgKZKsmRXpQLCwJL8nuZZOXQvhoxuN8LwFoVYYtd51PZ
         6eLBC1aInq4gkac/ojU/8XSctlqFBglQsxP2TnHJSvg9mF/0VZNqaS5zDJSESPwN5I2Y
         YycKTXIi4z7hfC0J0DhtVHg2rV0pFXO89rZCoKv7RB/C9LqSHquPBxJHo9quLdUF0Haz
         f2Kg==
X-Gm-Message-State: AOJu0YytAnNDQPpFK5m5pF/U35ej+0LJb/1HoQmM34o4LmPuZKhF4Din
	7Y1JguK/smQ4BF4VFdk9MyhZtJqIrNBKcr9SFSIPedgM6ZZNLN8q1vs8/W6lWQ==
X-Gm-Gg: ASbGncsQUuyJS45ul3bmA1yBp6o1tqMGk0X4pkhvewx6tz+AZDTYSvZHbOlYJcAtqLU
	J91zg2Nll1Wj2MwoskwRFwicl89YwozoBuUdQklSI8mkkqRdIMNVrXoJDs4RuQ7jOz5KBpSCTTt
	s230VaEeerlp/UbOLjSMiKy7ykflom+71zn9NOz79OmFfYw0d8PBDK9HBNbxrEIwEwTzVBKkwyN
	O4p/QgUdAlgR/0LacyvKGT4fWNPQSSIjDf2HEWC06lvN7X+PXIACgua8V6dEdHCl7tI8nC7HH98
	jKHa4QKlriKcWyQSnSnxJ6GLdFCJN9vLEf356FGlZdhJWntSshWAoB6ML3rLnKdTDjiA85raFWl
	Qs+ETd6I4kNj391nYsBA=
X-Google-Smtp-Source: AGHT+IEmXoadvvgvTXJD1QhqPbZj14xnKvz8U/Mwehwygrw+de0J3p0V0285v/SjP6yI5yBatscu0Q==
X-Received: by 2002:a17:907:709:b0:ae0:c8b2:3fc0 with SMTP id a640c23a62f3a-af93ffa4079mr302364066b.10.1754117182393;
        Fri, 01 Aug 2025 23:46:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078bcbsm398701966b.13.2025.08.01.23.46.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 23:46:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gnutls: upgrade 3.8.9 -> 3.8.10
Date: Sat,  2 Aug 2025 08:46:21 +0200
Message-ID: <20250802064621.3981469-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 06:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221378

Skip compress-cert-conf test when running ptests, because it requires
gnutls to be compiled with brotli PACKAGECONFIG, however brotli is not
part of oe-core.

Changelog: https://gitlab.com/gnutls/gnutls/-/blob/master/NEWS

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-support/gnutls/gnutls/run-ptest                    | 1 +
 .../gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb}                | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls/run-ptest b/meta/recipes-support/gnutls/gnutls/run-ptest
index 17e26eae70..b7827e1358 100644
--- a/meta/recipes-support/gnutls/gnutls/run-ptest
+++ b/meta/recipes-support/gnutls/gnutls/run-ptest
@@ -37,6 +37,7 @@ is_disallowed() {
 # currently not exported to target.
 
 test_disallowlist=""
+test_disallowlist="${test_disallowlist} compress-cert-conf"
 test_disallowlist="${test_disallowlist} dtls-stress"
 test_disallowlist="${test_disallowlist} handshake-large-cert"
 test_disallowlist="${test_disallowlist} id-on-xmppAddr"
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.9.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.9.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.10.bb
index f2b7ac7bb8..600f23683e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.9.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed"
+SRC_URI[sha256sum] = "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 

