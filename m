Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web08.10545.1628177817338752825
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hZPcR07F;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id o20so7850869oiw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L43heO0CQG20C3lwOmgGORZEeWr1hX6aUmJfDtQzwQA=;
        b=hZPcR07FF/AsI+NwSlRM6ExRalZCGlw6gfKFiOEzHuEaEusZ4rUshZQ3WwI2Zs1d7B
         C7YlOog+XSCyo/c6uuknHigEKJcKlhsp0eRb7NGUEtBIcZCis3cUPDwCiRJ2CPlSpwo9
         2ayGd7jEiFzSG5g7M1bI15GwRl1ZQ+EgUJLagFo4UXiEPtyrE4rG6mqdrfpGNlnmafhH
         yCLaXIejrhUIq75V9dL4eWtTUwEJVX41vtY2+wRGi8rPMOylU4tgRVsTA0sG56tFDi61
         xtmzTNIPKQfOvWeOWr3rIrPm2GttVOTT9YmE70+rBTJLiFJvQy5TGLC8DLH1MDKxH3f4
         3GlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L43heO0CQG20C3lwOmgGORZEeWr1hX6aUmJfDtQzwQA=;
        b=S3mmelDylyMX15+LL3F5jBMD36ANHN/TdN7Gs2lmOr97KsbQsBjiwxm7OpGnR7MJ9u
         VqmfKB6cCL4lE2fHE5W9p4ZWRPYZx4YdcPuFSqapJoSuNmxdCWrgt2IN9YpOfnX1cHGz
         5lsMEVS6OTtgowCHuSSWOgeHseKvhnwJYBfwXtgu5X7Aema+jk85vHyo3cLFQm96AKP+
         XHDlxwSX4aLyctxH7JYhHMhA8FKoLkv0w9+iem09T9PN/pw6rdBbi6fgnCirviGaZDtR
         tsal5aZhE/VHYrnLvCbW/MiLelLWiJj4HvcwYRiIC2OL9q+ONGdwpaC+m3OenSCjSpA8
         d+EA==
X-Gm-Message-State: AOAM533K4bB7MGPrSeYsx2IgGWCIP7VQnvCN33AXnA1cHFxjGp5f4nhb
	wcwIYZbn5SoqNeeg+hW8uC2FGz8mpsML4gZB
X-Google-Smtp-Source: ABdhPJxr8nvhN0YxvWwykUdPelDPC81sq84t3xVz6l+E5q/XBv6IhYtpa4F66TOXFeIFC4N4+yTzrg==
X-Received: by 2002:aca:3488:: with SMTP id b130mr11197834oia.17.1628177816253;
        Thu, 05 Aug 2021 08:36:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:36:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/33] oeqa/ethernet_ip_connman : add test for network connections
Date: Thu,  5 Aug 2021 05:33:57 -1000
Message-Id: <008cc0340676cd67f3ec68d3ca8286bbd16c32c6.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This test mimic the ethernet_static_ip_set_in_connman and ethernet_get_IP_in_connman_via_DHCP test case from oeqa/manual/bsp-hw.json.
The ethernet_static_ip_set_in_connman and ethernet_get_IP_in_connman_via_DHCP manual test case should be remove from oeqa/manual/bsp-hw.json if this patch get merged.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aaabc94dbe353b12297ba4a237f6817b2c6d4a31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../oeqa/runtime/cases/ethernet_ip_connman.py | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py

diff --git a/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
new file mode 100644
index 0000000000..e010612838
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ethernet_ip_connman.py
@@ -0,0 +1,36 @@
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.data import skipIfQemu
+
+class Ethernet_Test(OERuntimeTestCase):
+
+    def set_ip(self, x): 
+        x = x.split(".")
+        sample_host_address = '150'        
+        x[3] = sample_host_address
+        x = '.'.join(x)
+        return x
+    
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')    
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_set_virtual_ip(self):
+        (status, output) = self.target.run("ifconfig eth0 | grep 'inet ' | awk '{print $2}'")
+        self.assertEqual(status, 0, msg='Failed to get ip address. Make sure you have an ethernet connection on your device, output: %s' % output)
+        original_ip = output 
+        virtual_ip = self.set_ip(original_ip)
+        
+        (status, output) = self.target.run("ifconfig eth0:1 %s netmask 255.255.255.0 && sleep 2 && ping -c 5 %s && ifconfig eth0:1 down" % (virtual_ip,virtual_ip))
+        self.assertEqual(status, 0, msg='Failed to create virtual ip address, output: %s' % output)
+        
+    @OETestDepends(['ethernet_ip_connman.Ethernet_Test.test_set_virtual_ip'])  
+    def test_get_ip_from_dhcp(self): 
+        (status, output) = self.target.run("connmanctl services | grep -E '*AO Wired|*AR Wired' | awk '{print $3}'")
+        self.assertEqual(status, 0, msg='No wired interfaces are detected, output: %s' % output)
+        wired_interfaces = output
+        
+        (status, output) = self.target.run("ip route | grep default | awk '{print $3}'")
+        self.assertEqual(status, 0, msg='Failed to retrieve the default gateway, output: %s' % output)
+        default_gateway = output
+
+        (status, output) = self.target.run("connmanctl config %s --ipv4 dhcp && sleep 2 && ping -c 5 %s" % (wired_interfaces,default_gateway))
+        self.assertEqual(status, 0, msg='Failed to get dynamic IP address via DHCP in connmand, output: %s' % output)
\ No newline at end of file
-- 
2.25.1

