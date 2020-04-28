Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.191.1588040164090680093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 19:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OK8kwT4a;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id n16so9569005pgb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 19:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kIjKkEiA3JBXuG9GbYXTlPSmVBwLA7Tuq5mHJTlrjxs=;
        b=OK8kwT4aZ7dLUF+HTd8b+6kRy4SehVGZxkzGvex/nlUHFdSMn1P0zls3D6Jh8LPS3C
         dCefh8r5MjxmmU0X7JFbeUR5SqfdHolhdVkEddFUJ/qxiLCP+t2dF/IgJYq4K5GTRRXa
         dD0cgXDsCYyXNzS5SreHzr3k0HDCXER9XsCZ3x5ycpEaRIDeZ203whDaQwALC4Y+II3N
         aoKLcku6QItx96GJKdIhquVtiannZgHcAiv5akr5zpG85PJOkX2fZh3ShjLwKkr82udZ
         DLYlc+MmvkRoItCkIuBuetqtaFwb5MjlyTLxyVmUK75ZxSuDyQiN/GpYsa9pl2Na604i
         EExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kIjKkEiA3JBXuG9GbYXTlPSmVBwLA7Tuq5mHJTlrjxs=;
        b=UG4Faz4EXih/gWtzcFZP/TLcTXh15KYha/+VNGfTO5iIjnzYEkCW/mW8RnB7fZ0tTG
         Q1I84BonYZeU5Y8JYFf6Dw0hk+ABYSfxqvVxs5g2ArSRISpVTAd3wJEyJsX5TkgKz2Pg
         L1HgfAC2jCWFDrkoMFHd3cC/WSDAAx39+VbtZ4GOeMfTftjJqOSdr8IzO4vWAib2pKGP
         me+zg1jHs1ZkpmkXdd9yqcG3CiEmXkkFZk7aw5LlPHOzfowQkgHtxmCdVvohitpWDmbG
         QPrxrTzkz6VbsA6UZjlGjqcWc1hJ26ny3aCVeGs7eqQSb/mP2X/7XreIhy+0uKWDDlFj
         q4nQ==
X-Gm-Message-State: AGi0Pub+MUQWTbxIRzVm5/lPF/Y771vkR72es7UkzPrhXW+DL2RuqG3p
	sOO0EWYnrw/ZZoDD51t1y0H521YD
X-Google-Smtp-Source: APiQypIpqtBrkZRNNDQlo9iOL7ib8oG6Tm5ktZNRPJhlXKmcb0rWodY+6LsY0Hi3JC25e7AsdkuD9A==
X-Received: by 2002:a63:ed50:: with SMTP id m16mr18894710pgk.271.1588040163369;
        Mon, 27 Apr 2020 19:16:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:f1bf:759e:e8cd:49cd])
        by smtp.gmail.com with ESMTPSA id 6sm12328390pgz.0.2020.04.27.19.16.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 19:16:02 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus 4/7] inetutils: Use alternatives to avoid manpage conflict
Date: Mon, 27 Apr 2020 19:15:53 -0700
Message-Id: <1c2a1f29aa720d376bc7f88edfcb1ccecc35f6c2.1587931177.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587931177.git.akuster808@gmail.com>
References: <cover.1587931177.git.akuster808@gmail.com>

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Fix the following manpage conflicts:
 * check_data_file_clashes: Package inetutils-doc wants to install file /usr/share/man/man1/tftp.1
	But that file is already provided by package  * tftp-hpa-doc
 * check_data_file_clashes: Package inetutils-doc wants to install file /usr/share/man/man8/tftpd.8
	But that file is already provided by package  * tftp-hpa-doc
 * check_data_file_clashes: Package netkit-telnet-doc wants to install file /usr/share/man/man8/telnetd.8
	But that file is already provided by package  * inetutils-doc

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fc14bfd60ad86094f65ebefbd10dbddc112d2698)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 684fbe09e1c..cc9410b94e0 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -143,11 +143,15 @@ ALTERNATIVE_${PN}-traceroute = "traceroute"
 ALTERNATIVE_${PN}-hostname = "hostname"
 ALTERNATIVE_LINK_NAME[hostname]  = "${base_bindir}/hostname"
 
-ALTERNATIVE_${PN}-doc = "hostname.1 dnsdomainname.1 logger.1 syslogd.8"
+ALTERNATIVE_${PN}-doc = "hostname.1 dnsdomainname.1 logger.1 syslogd.8 \
+                         tftpd.8 tftp.1 telnetd.8"
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
 ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
 ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
+ALTERNATIVE_LINK_NAME[telnetd.8] = "${mandir}/man8/telnetd.8"
+ALTERNATIVE_LINK_NAME[tftpd.8] = "${mandir}/man8/tftpd.8"
+ALTERNATIVE_LINK_NAME[tftp.1] = "${mandir}/man1/tftp.1"
 
 ALTERNATIVE_${PN}-ifconfig = "ifconfig"
 ALTERNATIVE_LINK_NAME[ifconfig]  = "${base_sbindir}/ifconfig"
-- 
2.17.1

