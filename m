Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web08.10555.1628177852845195086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=krxcYLJL;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id w6so7862726oiv.11
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xpMPi7CguPHxhtQwacnZyF0ykRMTx9aTz9KJhi6FnYY=;
        b=krxcYLJLfPzQMkZu/ca9HqC6noi16UxQXSRJfRCCqdlGQgL9KkDOeIAILH9FNA4wKc
         dYlptZn/fxJgeFXuQMsyzEQBHEclbYkxP0t15XIYHOB/4gYBXvyRUe76X7LA4u6VdUBM
         Z1vJ1TFbQ7Oavp3sYRP7HEUlNDraLtfZ3C+IM7ulmZD0UYxBb5VmK1OFk04Pae1KbjuC
         NYKcva5FhHW7Py8lTtSbmCDotIFxkUvlfUE+cahcyTdM47DjuFVb2wvR0uFdR0fodCR1
         SU/137qyz/vNLot0VGaNGnvxUUzeg8+tIwB5xjPdL9owvfubtTm/BoauxQx9moTTcGUR
         Pv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpMPi7CguPHxhtQwacnZyF0ykRMTx9aTz9KJhi6FnYY=;
        b=f1IgiqAI9T1OnjdIsieUld5kUfIL45l4EzRVY+ZMA9AoNltboA5ykFBSIuqmAyxEE9
         gXgZNRSz00UmxEkRHyGQ4i5mAOmAdOX1kxadS90lbOMr8sFlclnntliNmNHBIqFyugMN
         eQnAJIN/Zsf8NFvaSZoCQ2u0JGgW9ZjjY5HjFJO+0ri2Go5+NWp7ZwFynF5c5ebCb7Tc
         /qD8h7dWZjnkT0WUgLHB/Vb0QV8CpJHQbR1BbtcI82DFJmmtIMd+OAQnDLIuKb5KhEzr
         wJOI8Clb9OlZ9DXm3MsHxkex2ZRpr9zdOeEk9UAplaXam0D04o/PIwFZ9F3mrcRS5vsX
         S7lA==
X-Gm-Message-State: AOAM532QjbRdaz46/O9HQIZ0RMmsPQW9FRLHLVMgPikUVlPC+zgHzVkI
	y1hi4Nx7iWJENW23TLrAPjiKAuExnBCXU88/
X-Google-Smtp-Source: ABdhPJxgBzahd9mqC7Lr0pWT9Ucq7mdIdqysSvSl7GiwA4lBiIhWigkY7yFZ3D9fYgMp3R4P62u/Xw==
X-Received: by 2002:a54:4803:: with SMTP id j3mr10300055oij.133.1628177851852;
        Thu, 05 Aug 2021 08:37:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.37.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:37:31 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 25/33] oeqa/terminal : improve the test case
Date: Thu,  5 Aug 2021 05:34:02 -1000
Message-Id: <039cd427cffe37bdf09cbf30c2cc47a85e166330.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

-Improve this test case to fulfill the requirements of replacing the click_terminal_icon_on_X_desktop manual test case from oeqa/manual/bsp-hw :
1) verify that the terminal window is working without problem
2) verify that there's only 1 terminal window is launched

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 824713174fae0617240a236d1bbfd2929bf4b24f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/terminal.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/terminal.py b/meta/lib/oeqa/runtime/cases/terminal.py
index a268f26880..8fcca99f47 100644
--- a/meta/lib/oeqa/runtime/cases/terminal.py
+++ b/meta/lib/oeqa/runtime/cases/terminal.py
@@ -10,9 +10,12 @@ class TerminalTest(OERuntimeTestCase):
     @OEHasPackage(['matchbox-terminal'])
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_terminal_running(self):
-        t_thread = threading.Thread(target=self.target.run, args=('export DISPLAY=:0 && matchbox-terminal',))
+        t_thread = threading.Thread(target=self.target.run, args=("export DISPLAY=:0 && matchbox-terminal -e 'sh -c \"uname -a && exec sh\"'",))
         t_thread.start()
         time.sleep(2)
+        
         status, output = self.target.run('pidof matchbox-terminal')
+        number_of_terminal = len(output.split())
+        self.assertEqual(number_of_terminal, 1, msg='There should be only one terminal being launched. Number of terminal launched : %s' % number_of_terminal)
         self.target.run('kill -9 %s' % output)
-        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')   
+        self.assertEqual(status, 0, msg='Not able to find process that runs terminal.')     
-- 
2.25.1

