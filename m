Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.28892.1606537512581001942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 20:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LXwYx6U3;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id x24so6151856pfn.6
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 20:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XizMCpWtErklsMftmAlvLitb2kOy26DxwDaBNCZ4dd4=;
        b=LXwYx6U3ttPg2Wy233nWuBEBJvEzCYnCmJyMWtKYLZdqP4LhS285eMgiHjlWiVw2yV
         NdBXCN9QH9CZkA8tjbelQU5cNFuKgqqA3lcpNzh+20RXp4C570tatVGb72awySdMOV9Z
         jD6xFEZeVYTeYIa/GGeTFmsPBB9hH+zz8C3rzAlqQGj247iJJs3i1nhB5//FXRTFhENM
         uzC7n+bEWezRz73xGZgiYY4j24QCAtxlER6IYbzVwCaAPOhiM3qkI0AMEw32dS+O7Bdr
         VXuEkthtaZn+LHX8HkDA3VZSQvRNg8TNs2vaMOQkm8a9r27Iw6Ul1jU2mXse36HXJNV8
         nREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XizMCpWtErklsMftmAlvLitb2kOy26DxwDaBNCZ4dd4=;
        b=kXw3mXgmeGQhWdJdJzm4lKGuDaXnpmZX5JF8GkMq4lzNRTzHDTch5VOIqTLolofM7h
         OHCMM1TDs6nB82P/sDT8joDwr9XOwNkOW5oJP2Pg5FYqclA1Jz439d9e/ytRlkBOf8Rp
         HihToiWlamNX/ObbPaykz3QZspg9KBcYPQ6dr7ZZosTF5Nd5LuPQATrluij/O1GoeBYy
         CzLc6x2DvMWFha1YqoBeGA2wl/ppPh4NvpKvc9LB/P0jfNEL3AOC+PzHz1vAbqOhIT8Y
         iqh9VPrSzH08+8YIlCa5x71sYarKky83QWjZakMAd0+KkkGglyI23XDEKRIdhvsTz0N2
         ORFg==
X-Gm-Message-State: AOAM533/w2uchQ/++wx8l/zI82qks2O+kAhX0nd4SCLrf+V4GAlczxo8
	/w8D7qIHnw2axXeiNIhdT2n9hGT7CyVCog==
X-Google-Smtp-Source: ABdhPJxJG8eBhVI+2hbZSIkKAF1iSGspPL/QZYF+qy1uKkNpe0+aaSe2Nfa63dh+cXpcJ47zCXp64A==
X-Received: by 2002:a17:90b:3692:: with SMTP id mj18mr639759pjb.60.1606537511982;
        Fri, 27 Nov 2020 20:25:11 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:74ec:3128:f635:34a1])
        by smtp.gmail.com with ESMTPSA id b5sm12625076pjg.28.2020.11.27.20.25.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 20:25:11 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/18] maintainers.inc: add self for new pytest packages
Date: Fri, 27 Nov 2020 20:24:28 -0800
Message-Id: <e797afbeb815a83bda856b3299e3bd3a0c4b1e0e.1606536874.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
References: <cover.1606536874.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/conf/distro/include/maintainers.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ad5f4672c7a..f77965f8e0b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -582,6 +582,8 @@ RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>
 RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-atomicwrites = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-attrs = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-cython = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-dbus = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-dbusmock = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -591,28 +593,40 @@ RECIPE_MAINTAINER_pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>
 RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-importlib-metadata = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-iniconfig = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-python3-more-itertools = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-packaging = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-pathlib2 = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-pbr = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pip = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
+RECIPE_MAINTAINER_pn-python3-pluggy = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-py = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-pycairo = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pytest = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-setuptools-scm = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-six = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-toml = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-wcwidth = "Tim Orling <timothy.t.orling@linux.intel.com>"
+RECIPE_MAINTAINER_pn-python3-zipp = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-qemu-helper-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-qemu-native = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.25.0

