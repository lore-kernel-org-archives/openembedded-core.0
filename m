Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F423CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 11:18:56 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.6246.1759403935159489174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 04:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LSqdxDW3;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: zboszor@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b54dd647edcso727189a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759403934; x=1760008734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pXupBgtFj1VGB0dxyc10WZrvuUd920WAnORj7O8iWHE=;
        b=LSqdxDW3Leuc0NC4ccWDZNWje1XcZNm7atvJzO/qcpMgp7Q49AsGW+G2CgJ5wRi7JA
         F+i3C/0Hx/0aI/DGRYgUO+KzMyGd4nvfJgujM7GxXInHC8vyEqlSigONkRct0Y/EE0j+
         xLdT/AjYoDmrOfsISv9ts+9fRLq3wH/sfcAAyCDFhy5XXH7nBGh0R2wlxLHN1H8TT0bB
         DbczCi7iiJ1dMMhkWpRndL3PnlMI+rHX9llbcXHBwLMB17isj1sp70n8HPH1pBCPzdZ/
         CtiKSLCyVsFFiw4c3KM1RMobrBnjT14JvbB5OSXiMJn21+NGh4+VtO3pVRC83ndpHgNP
         nB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759403934; x=1760008734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXupBgtFj1VGB0dxyc10WZrvuUd920WAnORj7O8iWHE=;
        b=TZTn5a6WD1z25IZ071qk0T9ldAKJG3ULqyrMIrK7+ufPHyopy0UCM/h6vXBYFiRS2Z
         kx1wl6AFOuAItupxOS1yTKdUwRJhn99P4cF+VFqeSu9JHztUAhWTMeZX9cwkomhrMkto
         qeqbAjPUjh0/E+0uR1smYte2aPT0+fHWoihfh9aytyP09ZL+3mnrqHBpLmbXb4EzGwjq
         Xhwh/px+P7X8uDl2Dyw1lFJbZ24H7Wo3HkqxcW1SUoVKgO//JMHl7NN35lNihi8jdNUc
         xxnjXvldUSSaSdwmOfR2MAdDZy2kcU5ysI1UnVkr0ZfFprVbqDCxzd8ZmtaUv7TgK2DZ
         Ys3A==
X-Gm-Message-State: AOJu0YxRcuI16GZSt6UDJeQe32AykMlrEkZHqErgpdYBR7MmsUyZut9C
	vmdGGbkQz5QviUg0bJu9qnIjjrHcbk48G5pAFuPOft2f14uI1OrIbE+UVLOhGQ1I
X-Gm-Gg: ASbGncvMk3JXwVL7uIOCxf8LvrtHJn6HoYuBJJzmbDNapCbKxyk610xKxGHEQw0Mcnn
	th6BE+VRKmgB3iaWMOi8TCTZ3v/EKLCXmTWTUklYil8Z6YTosEfYWo4O3So7TLNh9RzJ//v54xo
	hs3oeBlGzl/SXoNg+5d/UFZ2U6BBsJxUT/TVts4wiNTpSezo2kmYFEp38OnT8+/xeorbVcAJL9R
	e0ptfv6fNi1Re3YMWUQQ2dQ6CKCnOFtKPGGsfuuUJ6HmNnQDgFoSGemScA4XawxB90ekLrKVmLg
	wLLO766HcBPeVowZ2qU4MrDd1lVJO3GRGY7clxDqTCe7IPhSyJz+btmWz2Arduu3Cp3DjFxGdlg
	Wz37f2QG2bcT5Q3BDn4pw6jDVylwvCdGRDNTQwqva/qGTn1TqkugGJYAaGE7VyK2mhhwQ
X-Google-Smtp-Source: AGHT+IFYtLMfN0R0mdp5vNIDuBRC0d0xon7B8Ls6CQrU2Ztu/ioySTi5a/KvoM3SB6T7l9YIguPKkw==
X-Received: by 2002:a17:903:1b68:b0:27d:6f49:febc with SMTP id d9443c01a7336-28e7f2a1412mr92556675ad.1.1759403933984;
        Thu, 02 Oct 2025 04:18:53 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3d0fsm2223144a91.6.2025.10.02.04.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 04:18:53 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] mesa: 25.3.4
Date: Thu,  2 Oct 2025 13:18:44 +0200
Message-ID: <20251002111844.10404-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 11:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224351

Announcement:
https://lists.freedesktop.org/archives/mesa-dev/2025-October/226554.html

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c3751f3414..7046deeb2b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,8 +19,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
 "
 
-SRC_URI[sha256sum] = "f2d6b28562f1d6cb9c17ee8e58eeade7aa5faf927ae71065eadb41e17f92b4f8"
-PV = "25.2.3"
+SRC_URI[sha256sum] = "a370b4c549cbfbe646b319e34d73edb50ed883978f5e95133f282f0eae39ab52"
+PV = "25.2.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.51.0


