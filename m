Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web10.343.1592848761985279574
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1qenTGDs;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.195, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f195.google.com with SMTP id d67so16405187oig.6
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=f7G6l54HsPAfjT5bVBNjPVOjldCzZVMDp4o7whO1OrY=;
        b=1qenTGDsZtv43xRj4JX0QTqTTwqW8hXTygP5EXTkfM41zz7B7i9/ji4B3/uBS4rDnK
         EcYhzWFnuZZ4zPnmucXjYcIu4Ot5XyeBukZAlxKCHYkvGT56jfgFQSs9pax4ffWEH79u
         Fs3Np5Mm9xSQR+gemz9cyy0xQoRra7xhKQ04HYbASIxQNSuJ3Xnhseqny8P5XQweUnnM
         9X5QXarHNYevCCcGH2BzKAG2jzQEBSW7M9dhEgayz5NukoUa+Iv3kSY5+jJ2p+TBW+UX
         c5Ho8V2IpU1ddqOf6yQ5KJDW4bttnIEEkFphPwsIfSG7ZE7Dt4gC9py13TZAz67THkfK
         I5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=f7G6l54HsPAfjT5bVBNjPVOjldCzZVMDp4o7whO1OrY=;
        b=fYdRoiES1fcWlOHEKNaPLkEAf5LjYROfWw2Nj6cQ+dHVKNp6YdLhcGcqmSwi/8IFBZ
         dlQS2mQhctj0ENQyqoQn+YUpMKY/FHrsqKl+V+QoqH5j5sTS3MlLDeoAYm35zDKNPHIR
         TtRjGTXSa/e6XwRorYBQsk9SSquvsFQWpEtNucUeoK/ckDXFrxBTLzTDv1Q+u/OqK7Cc
         YFCX1ceRE8/Fcx0uQEwtnO7nYCEM13CFDUNEtpMlRPW+k7x3GOMRBEV+aWJ3Z5jmKH/9
         nvMFCQnWS/T2EdLuOrOhtpUMaCjlwq+gJ/ukdCjnWlwfu0llT4bCNTvz2ZsvTi6Z3wkv
         hvnQ==
X-Gm-Message-State: AOAM531vY0vzoSSNzBUCl8GVlDRYQl6kKEK1EJGCvBV1KGcX7wAMTenM
	lw5PIDqjaEWXObOdEvzGA9cO9fJCBLRv5Q==
X-Google-Smtp-Source: ABdhPJwTsTbzjXvPtrSIII+AU5vOv9Rus4YWNmn7Q0EKS35VGYCfA9aj+DnpTc0jRTGW9vCZIJ3gcA==
X-Received: by 2002:aca:d0d:: with SMTP id 13mr13929533oin.174.1592848760820;
        Mon, 22 Jun 2020 10:59:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.10.59.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:59:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/33] patchelf: switch to git
Date: Mon, 22 Jun 2020 07:57:55 -1000
Message-Id: <d350a0ca191040b5573ed9cd67c08c41ad2f3dc9.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

The tarball download website is full of broken links;
while direct tarball download still works, exploring
around and checking for latest versions does not.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1c11259464ba2d972e1e1ad5c540050ccc80c15)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/patchelf/patchelf_0.10.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_0.10.bb b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
index e4a604ec70..84e640773b 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.10.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
@@ -1,4 +1,4 @@
-SRC_URI = "https://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
            file://handle-read-only-files.patch \
            file://fix-adjusting-startPage.patch \
            file://fix-phdrs.patch \
@@ -7,8 +7,9 @@ SRC_URI = "https://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
 LICENSE = "GPLv3"
 SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries"
 
-SRC_URI[md5sum] = "6c3f3a06a95705870d129494a6880106"
-SRC_URI[sha256sum] = "f670cd462ac7161588c28f45349bc20fb9bd842805e3f71387a320e7a9ddfcf3"
+SRCREV = "e1e39f3639e39360ceebb2f7ed533cede4623070"
+
+S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-- 
2.17.1

