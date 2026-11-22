Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36785.1795367132573094139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 09:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xUC9hlfo;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: ketanmundhe01@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2755757a34.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795367132; x=1795971932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aByBO9gPzZp8MOBNKnjQSwZGSuXUZL6I+RcZbgorF30=;
        b=xUC9hlfoS/tai1RN5NTDbYiojDC0dTtJbUnvqDtc0VjdBLZP18zEzDgOCQpfINdIDg
         CymvPh3ynAgSZvTNXSp8sMqGeqsVI8N5sbVIXL5COFIhZffj5LxrdmOitENaLRsAAoZh
         kWRlndjlvs9JnGqNVtbKey7igdhhhoJXaGm5GZHTYLPyLJrx+v2nn/kctuEcwUZDUt+f
         XuSxcq1DVwfXyrrrCVP1dJU9po2TfVriBtmFFWlg0QuPDDZ0+zV8ATEBTeM9sAFaZA/U
         BJJG9f1qx7mi7+AZ+6My+IMWCddWpmfL9CBUK26S0H4+bHpOTqLyliYc9s6gz+omHUd8
         hfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795367132; x=1795971932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aByBO9gPzZp8MOBNKnjQSwZGSuXUZL6I+RcZbgorF30=;
        b=YHUQ4Snie4aFsb0nIWnmIZYwQFfYYyGiVs7pnGsitLbdZgUGLD12JJ52szgYst47Hc
         ldaUYpPfmkfp8kOd1ltdfHTlu7ufYBgxNTDVVk8WDoBP7lOP55eK4y4w3iPsc0bW0spK
         Qh9B7XeadUofdKJxr21cfY92+8qFULjMEFVrlaldV4BuHeHx7WS/ba6qJJYUJEqVXi4t
         8kWXNJnhm9a4b42c6CWqBHZVpjb4V7aSNYSluTmE6hUHdfg6HHPMDQDWePHuhOFoQfNs
         49lnnGHDhWntg3uCvj7Pl8knhSMErJhJ5A1WTyIh3cG+dLHodSXSykJ0h4Pvw9/VUpm3
         Njvg==
X-Gm-Message-State: APuU4Z8fKN/nDJlMcFVcMU/17O6Hf/b+YNYWM80gxj8LCYUNCmvRG4UM
	7uSEGJ/6mNxXsAvtJJxgoJns4cTHz71a7na/0LtQnOwR+YF9CRO3aS+2pfYTcIpq
X-Gm-Gg: AZFdTZeqNPbCmsAbDYgEmQr+sigh97RiXMYDGy57Abf+E571IoCUX5TaOFdp3/ZbOPQ
	ePvCqOhCmsjnyVUI5RVpUw5PLeOxsVIpIOHPWoMcXXcWmq1FqfkqBmvGzNABKeNHK45a0jfV7k3
	H1gYAQNjjbExsmfx/rtC4BSAz3HI1niBpsB1DYIP4TenYrePh0D8FTbhftQ7PQUX7Oz54ia3Ulr
	a4/T9c8LRH4KRi2J8nFAzglB7M27aozpjmztAd6nneNC3HXL8leLDdQ8pd+VXLPHBD6iKpFYEsg
	l9w4vIT9JT52t6hjGw3bVb9F2VmwaZ+SERv2sAuulHJrp+aKtPy90QDIkF8yBSLlgHVkM24ouOD
	/h7V5KXof5UfVqGX9MCeuV/+lt7zHM/ptkzGNcKvbrN8n0WxttVEXr2IrVroSVFYll2P8sIpMfY
	Rw4UX/ZUvyKIbp9iwzfEBcYXx0/PSGQZ5SUw2owbfgB6NyJkzQ3T/cjoX7JBgaHRNF0RvwAZiW4
	tJg1OioxnjPQ7lBE0snCNS40Uf5oveI4VW7iURP6xVqgY6MZEd6wyjiAGsvcU25VTob5pmFYJpI
	dK4Mhg2avaA+lYv3IcFNA7kC/2fKXEaBc1enfiyqlc5xGg/ynlgJPuKww2LGkX0uXLNqN4+quag
	NSJieLNWtOw==
X-Received: by 2002:a05:7300:ce11:b0:361:167c:2364 with SMTP id 5a478bee46e88-3856f148c9emr10527560eec.8.1795366750563;
        Sun, 22 Nov 2026 08:59:10 -0800 (PST)
Return-Path: <ketanmundhe01@gmail.com>
Received: from LAPTOP-AG1DMAP4.localdomain ([152.58.32.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm30164120eec.22.2026.11.22.08.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:59:10 -0800 (PST)
From: ketanmundhe01@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ketan Mundhe <ketanmundhe01@gmail.com>
Subject: [PATCH] libpcre: fix spelling mistake
Date: Sun, 22 Nov 2026 22:28:00 +0530
Message-Id: <20261122165800.921-1-ketanmundhe01@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 18:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250876
Content-Type: text/plain; charset="utf-8"

From: Ketan Mundhe <ketanmundhe01@gmail.com>

Signed-off-by: Ketan Mundhe <ketanmundhe01@gmail.com>
---
 meta/recipes-support/libpcre/libpcre2_10.49.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.49.bb b/meta/recipes-support/libpcre/libpcre2_10.49.bb
index 8e0c44fb4c..d39a06880f 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.49.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.49.bb
@@ -48,8 +48,8 @@ PACKAGES =+ "libpcre2-16 libpcre2-32 pcre2grep pcre2grep-doc pcre2test pcre2test
 
 SUMMARY:pcre2grep = "grep utility that uses perl 5 compatible regexes"
 SUMMARY:pcre2grep-doc = "grep utility that uses perl 5 compatible regexes - docs"
-SUMMARY:pcre2test = "program for testing Perl-comatible regular expressions"
-SUMMARY:pcre2test-doc = "program for testing Perl-comatible regular expressions - docs"
+SUMMARY:pcre2test = "program for testing Perl-compatible regular expressions"
+SUMMARY:pcre2test-doc = "program for testing Perl-compatible regular expressions - docs"
 
 FILES:libpcre2-16 = "${libdir}/libpcre2-16.so.*"
 FILES:libpcre2-32 = "${libdir}/libpcre2-32.so.*"
