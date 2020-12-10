Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.12404.1607604803208050344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 04:53:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Flx3PcD7;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id w206so2719211wma.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 04:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6NLF2Rr4SSBTb6hj686HROvh3sdWF2Tqkm8Xq8eCgoA=;
        b=Flx3PcD7BFllSf13Kzqm2lg9DcXmn/KbSON8Vefi3Oeew5fZsrIDwVYwvK/Kain/tO
         LVoRK1KfaaTr2poBT3Y820e91p2KdUW+lYHSwf9zoYTG0CBB8evwpAfYzSWlKWuK+/zF
         upUMpnjP+/AlGRU6Xo/wStwOxNRGlayVAnntGg661BA6/CZRcgl3zQW0SFz1EZFGWn77
         w9tMLri9g9VagilvDeQ54ZGvJmPkTFkHZOKCFiALqAXW3NfCvakWNe56DFsBJ4yMJVvD
         zZFj6Zfhhq016hD3+OQTp9h/TkgF22Z4TRk7v0YU/KDUelUVviM3rj8CkHIEibyVRrjl
         Sbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6NLF2Rr4SSBTb6hj686HROvh3sdWF2Tqkm8Xq8eCgoA=;
        b=P2L4HddURYW7j2W88n0tTEYPASOFKDHV0PY+asekmgDLFrdzsuI3biKk4saSywBYwd
         6emKmUd1205qlsqTif7pK0CiktDu8u/nZXQMoxcM7dr6PV0WZaef3DshxMZ9oHXMNJ/F
         IY3Z3MrvXbkHW5zkfc6qKz0zq3dc+ygAou6Ox1HOGoX1WL8hOs1hZMsEQSA7pwQAZOf3
         /H8jSPbn2HHNKeiZ2oAqBO9LMnsxEZGspKqS+4Pz8orax6ucl/1iwCcJji1h72Xm/sdQ
         m8sWqlFx0NWlcgq+Ayma0Ly5ChTZRaLTYFMv6UYkx52gxlhMaikAGMvwC55dEw9hgyLC
         enEQ==
X-Gm-Message-State: AOAM532Iy1EAX4ceXrjXHoyFTXWZUebfexxEHQMMt/ifcoUEi6sm0MD8
	RKhJa/EzBsD03M/A2FiaG5DmAZgkWKcOFw==
X-Google-Smtp-Source: ABdhPJxEtnfMbZDgq5YBxWLeXsxvc7+6nXyNpYthXOGe/p2vfYgTx6HW7/xoH1MM4mnNlrW5cFFUgQ==
X-Received: by 2002:a1c:5585:: with SMTP id j127mr8271241wmb.169.1607604801312;
        Thu, 10 Dec 2020 04:53:21 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id w12sm10421332wre.57.2020.12.10.04.53.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 04:53:20 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] systemd: add package config for systemd-oomd
Date: Thu, 10 Dec 2020 12:53:09 +0000
Message-Id: <20201210125312.3302065-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210125312.3302065-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Disabled by default

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_247.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_247.1.bb b/meta/recipes-core/systemd/systemd_247.1.bb
index bf73630569..f20c2cffb7 100644
--- a/meta/recipes-core/systemd/systemd_247.1.bb
+++ b/meta/recipes-core/systemd/systemd_247.1.bb
@@ -157,6 +157,7 @@ PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
 PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
 PACKAGECONFIG[nss-mymachines] = "-Dnss-mymachines=true,-Dnss-mymachines=false"
 PACKAGECONFIG[nss-resolve] = "-Dnss-resolve=true,-Dnss-resolve=false"
+PACKAGECONFIG[oomd] = "-Doomd=true,-Doomd=false"
 PACKAGECONFIG[openssl] = "-Dopenssl=true,-Dopenssl=false,openssl"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[pcre2] = "-Dpcre2=true,-Dpcre2=false,libpcre2"
@@ -565,6 +566,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${bindir}/resolvectl \
                 ${bindir}/timedatectl \
                 ${bindir}/bootctl \
+                ${bindir}/oomctl \
                 ${exec_prefix}/lib/tmpfiles.d/*.conf \
                 ${exec_prefix}/lib/systemd \
                 ${exec_prefix}/lib/modules-load.d \
-- 
2.29.2

