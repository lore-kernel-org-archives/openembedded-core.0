Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.6544.1601504123047341825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cbygXE4F;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.193, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f193.google.com with SMTP id b124so2319257pfg.13
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nyJIg6ELRzDmdWbhFurFzVox5QDnbuk7NrQS6MDv2rs=;
        b=cbygXE4FWp5eUmvIvsdhrtOUzQ9aumDFvVA6cZh4orhrqIetcmaB91weHYBIKhfKVi
         IMv96U5ZY6jA63HWv+zCCpnFxK1O10ThTuRKmrbY0j6c2i0lPgdAhg7U69Tq9zHIMxBT
         Cxs0lIqvjIgTGwKhtpCjiVOAb4fvt3rbBp15c7C8a1kYst0+F2cXouxP5gU/q0C0Ntti
         qJG4ZGn2goM/JgGC4O216AxY0Fbeu3xx1SLjPL6+o1QIcRx8jgckRsMlAVEXq+JHPeTO
         z1BG3EkzvQ3MBjflV+XcMSkzTG813VviBTudFbvfLDAdbwdfZ/G5cGp702l/9MqPccOp
         v0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nyJIg6ELRzDmdWbhFurFzVox5QDnbuk7NrQS6MDv2rs=;
        b=B6K4uHNInxgmdpJIB+aPoHZNf4OdmimhoLrTftIRrn1uSoZOK0IaEezWhKwzoG9+Y7
         NlLB/z+3IMfbZGNw1tfTe3IcGsHd2UN4bCCI8BGIqCGUv+z925gzsz8VAR/bDPraRgvP
         q+36b83tRxYkWFP3tb1mFmKLssbC5B5AWBhZ75hvBw14P8Qqv6YZxbsto84mU/sPm5Yz
         nwNvVATIRXE6P3QXYAE9Hjvn94JjQeN4EeQ89doYr8xae2w95nE9bkLePulIau5/a0uo
         l6aSS+7FZIUx3VpGMbdfWsrVSqBgWK+rHQ8slu2YLvyP7w8r/VMEnz8aOAuBqgBuxJkX
         hvCg==
X-Gm-Message-State: AOAM531WLxuj+JXWJ+sCPWWCXHo5DM78wMLvXI37AEq6D8XfAu+N+JLv
	HiwdKX66+6ZITXYppNZBtjfYVXjg2n7Z3NnxFM8=
X-Google-Smtp-Source: ABdhPJyC8pNfqrBWx+EGUY4yveacggC4XjfUo/t2ySO5XreF8VUVpXeLkU1ubrkyV2m3zbZ/MVM8GA==
X-Received: by 2002:a17:902:ac81:b029:d3:781c:88a4 with SMTP id h1-20020a170902ac81b02900d3781c88a4mr4004174plr.38.1601504122187;
        Wed, 30 Sep 2020 15:15:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 31/41] openssh: Allow enable/disable of rng-tools recommendation on sshd
Date: Wed, 30 Sep 2020 12:11:33 -1000
Message-Id: <ff61cf5777c63a7ebecde5ada1cf01d7bafe265d.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Otavio Salvador <otavio.salvador@gmail.com>

We are adding a new PACKAGECONFIG option ('rng-tools') to control if we
wish the openssh-sshd to RRECOMMENDS the 'rng-tools' package. We are
enabling it by default so there is no behavior change.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe99349c1bd72b69d22ab0dc52b8825d3157b8e7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index d879efc201..17138c0ad8 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -43,12 +43,15 @@ SYSTEMD_SERVICE_${PN}-sshd = "sshd.socket"
 
 inherit autotools-brokensep ptest
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "rng-tools"
 PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
 PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
 
+# Add RRECOMMENDS to rng-tools for sshd package
+PACKAGECONFIG[rng-tools] = ""
+
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 # login path is hardcoded in sshd
@@ -150,7 +153,10 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
-RRECOMMENDS_${PN}-sshd_append_class-target = " rng-tools"
+RRECOMMENDS_${PN}-sshd_append_class-target = "\
+    ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
+"
+
 # gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
 
-- 
2.17.1

