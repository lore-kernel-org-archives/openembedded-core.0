Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.4936.1604372849605243150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 19:07:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=c1Yz3sVo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id t22so7871249plr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 19:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=6VqU/YieNX93wyqmYdacXMzNAJX66Qginp3V8DgqRZc=;
        b=c1Yz3sVoMvOKSFmhDEDTqeGZktvSpqiK9lzRexX3o95b6SaFhEkEB0W2gBfNUSxqR4
         itIb/v53Jpx83G9EvNCaUJWQsWr07fWy/ImKYBbtYh/E4i7G+DanvpyXOm8eOQz8bwUC
         B3eO3IXPgnkf72+a0PAec30bnX99B+0SYqrlNkzAM7EzCLKWWB8IJ+jv7qoW3Bqo6gRh
         gzsPPYCIaUv8fcXcQX/2mVKwkCo5+JsjHDwrcui1gcXj5ouVhqlcGQXEpbL962ftVD/D
         jkCh6+ts6ubKJjbI41JAQon8N/UuWqHrtpcPMVxffZr2Z9YlS9Efk+P2EJpMInFicNau
         ZfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=6VqU/YieNX93wyqmYdacXMzNAJX66Qginp3V8DgqRZc=;
        b=WS2BMbJsnd1OnqsM1K8LA5uYlFMJP7WH2JglVSfyhDUzAdV/RJKBmvy4dQLwyRKzXV
         2i79oOncD8gtz/tZKvwJ7195KSSt6EYoG2lq83Qjfg3GXJeUfkq5U5YhqlIa2oIEyjx3
         oRi6cvhTYbUUm/AvWTbhwpOIjw+RSLou5GpbvLiv9Rt3Ly9gHxSiIZV2rFuGiL0KgXPL
         intXhSsgLnRiOND46nzRrVk5zt9gRKv/K9ttkKNZd7PdoW06DolBhYObBSonbnyc0yKu
         TtR6OlUiVJG5G0YkQG6aeiYrtqpSW+K/voXgaectfF0X86j9a+XdBHX23tvra3sLJ7Ne
         oRIA==
X-Gm-Message-State: AOAM533UlzVgv5W4KxI+aF/Oihi1X6oJ6XEYe56v3PuokimfhU0/08DY
	bTCEPS7EUEnUV229ABvuGNCzDdURcyH6H9bH
X-Google-Smtp-Source: ABdhPJyM2m/JcdIGuZoRYxYpA6JdxiroZZFEde8l1idul2hmD6siTPYtcQDIQ0xnpCNR6ZrMNj5XWw==
X-Received: by 2002:a17:902:d901:b029:d6:9796:514e with SMTP id c1-20020a170902d901b02900d69796514emr19448779plz.84.1604372848389;
        Mon, 02 Nov 2020 19:07:28 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id gz15sm887913pjb.34.2020.11.02.19.07.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 19:07:27 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/2] Pull request (cover letter only)
Date: Mon,  2 Nov 2020 17:07:18 -1000
Message-Id: <cover.1604372711.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 8a367cbbf092339a8c82c680a2565567b594b6c6:

  glib-2.0: fix parsing of slim encoded tzdata (2020-10-26 15:06:51 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  nasm: update 2.14.02 -> 2.15.03 for CVE fixes

Steve Sakoman (1):
  qemu: fix CVE-2019-20175

 .../nasm/nasm/0001-stdlib-Add-strlcat.patch   |  28 ++--
 .../0002-Add-debug-prefix-map-option.patch    | 129 +++++++-----------
 .../nasm/nasm/CVE-2018-19755.patch            | 116 ----------------
 .../nasm/nasm/CVE-2019-14248.patch            |  43 ------
 .../nasm/{nasm_2.14.02.bb => nasm_2.15.03.bb} |  10 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2019-20175.patch            |  94 +++++++++++++
 7 files changed, 161 insertions(+), 260 deletions(-)
 delete mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
 rename meta/recipes-devtools/nasm/{nasm_2.14.02.bb => nasm_2.15.03.bb} (56%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-20175.patch

-- 
2.17.1

