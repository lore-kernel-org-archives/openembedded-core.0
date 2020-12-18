Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.7665.1608284581920102767
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 01:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XDTcHhCR;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id d26so1399005wrb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 01:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sDnW70knZ3BRHJ/So9xfhwVfDrKrwvwYIT6V2p6S7xw=;
        b=XDTcHhCRdrQwq/JGvApGhSvJERjD3Vq0bcu6d7xo+6Nfz2QBJL8GsxE5oUwAhhgB/4
         f05ntPJeTzOihCiSYTQf0A2umqWF2Hc/wnu2mFdJUtwmj6tF2hsp9Qd+MFilXJTWS+Mx
         pJzaz9Ekm2UlGjlF8pmzxciZyhmCMDHRLRv80yFrbG62q4KU4H5U4+b5h0eYP2q9gD5X
         qdiHsRdr+P/llOG+6t8lL+fW+LIvmWudGvilO+lio7dIrmHGYj3KPfaenOuN/6To0BI0
         pOl6s2lVeK9qsIvAfA8tKlRRBmamTnkvBgSFO6Dd/oCoycA0OKQoWryWrkHKwVPUcfUM
         6HSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sDnW70knZ3BRHJ/So9xfhwVfDrKrwvwYIT6V2p6S7xw=;
        b=tuIrD78VUZId35cr8fk6GEIxZKmEbYVojP73KsT8Qx73an2n0Xjb6mFVczuAWOltGP
         /UxyvwHqfFf9IvE779sygIo5vs/dJEpAJalX/YYOeGffl6ZUdhvHVjfPyXYVGh5wlyGe
         f7rBcSuWSzxhTPiE/ILgMDG7G92W9PQD1UAEF/RxOIlCQHxcXd2z6ZY+QzFIFIx0r9y0
         +NvBs3xL6f7O/gb9xbppRhVRD59NzXGv/MP6yg71pURiVmOgaJEnqad79Qh/1WJaOrtW
         261FQ/aQd3PU24wQvQlKD3NusVEfOADaRS9zbxcZ2D2nR2Uhx2XC+bcB/yv8rRE8QYrq
         WFjA==
X-Gm-Message-State: AOAM530MvhIbUa7JBKHp5fGlfZr4I4/xgPHgBhqWmdSW0shlXltiqX5C
	k2YCAzF8I9l14NWr3sb9bo9S8GVidwRuvQ==
X-Google-Smtp-Source: ABdhPJwdkTaPyvn7Mbmb3WbipsXA1PjQLPcKK71cnljRIdmzQ/3oWlby00z7yiEBr/pKq7vFTcRBlw==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr3433168wrt.46.1608284580259;
        Fri, 18 Dec 2020 01:43:00 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id e17sm12443369wrw.84.2020.12.18.01.42.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 01:42:59 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/5] systemd: add package config for systemd-oomd
Date: Fri, 18 Dec 2020 09:42:53 +0000
Message-Id: <20201218094256.3796401-2-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218094256.3796401-1-luca.boccassi@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <20201218094256.3796401-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Disabled by default

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_247.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_247.2.bb b/meta/recipes-core/systemd/systemd_247.2.bb
index d621d0442e..3129b266fe 100644
--- a/meta/recipes-core/systemd/systemd_247.2.bb
+++ b/meta/recipes-core/systemd/systemd_247.2.bb
@@ -156,6 +156,7 @@ PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
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

