Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.58654.1622557148393658059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=AHiUqKOQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id lx17-20020a17090b4b11b029015f3b32b8dbso1524441pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ThSH7se1ilCjDIq+Jq4cGvbPbSsyHPILXfKhhkuntYM=;
        b=AHiUqKOQ9eyigVfMT7gYBaOm0aBDgBFcSwYLCCpJA5mgJVdVi9LMb5Bcje7w5wNAxv
         kwwwsTODYvfvzjmfqwf73qkgqEDg8JxUWex70XpnULfpszpTDHh4FKbBmhkyFxWbM1nQ
         450Jl3YIm0jlBdsnLeynSMPq2i+8xTPDT/9yBJOb16e1Y0OEYFApTXdxoCN0bD1kY0LX
         UDMeWgFip3qQ0xk14DhHJbzunYrN+5Pf4uYCcJS1wEGGAapQ83gphZt5jS6a86WTZ4aF
         +Vephz1qsr8+fRo4Jt0RctCgI5iemE5UI1ccCgLUGUjbs2EhJhPyMBn4fj/oYqSP3ePP
         lEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ThSH7se1ilCjDIq+Jq4cGvbPbSsyHPILXfKhhkuntYM=;
        b=QSdr6bPdoRApf1qExgUAaa3I6ANuJV+oBY5ax5kVPaO7G9/WL/5DjOrASCFP8M/1wr
         pfjBCsaIh8HHDMDJSdVGpcoELDgZQtBJYxWuhWDKxg1TxsgcRryOn5SSQ9al1XCnZLW1
         ORq+u71oaYUYWeMg/xmNF8z/k1nUkmcSJDgreK281D23oPQItlwk9mDdff0/beiakBV3
         hW05zAB70jkkvBdBUkXUpudrjHG0g5BRCv5lzzkWA4AEInFoTcbvy2Tj70rUZuTbgJZX
         DjhWhGI2t9oF/jvGSEcQIZzWFTOLgQAd4Y/XlJsG2neMmmnMrL5w3IDuTmLeyLn8QxVy
         6dxg==
X-Gm-Message-State: AOAM5337ImgPZWCm5Gqjuj6DnfmSe5PpGhlyysr3cK9UMKflSpBta2Az
	gMSUqZ4DWTzFJFs/EqEvu5lHwCokUqNcKnzs3yo=
X-Google-Smtp-Source: ABdhPJztjE6u8+eDAXvZjm617iSuIze1Lpw89Hs/6I6gsgZ6y0u+wQeZPNaFN+MTWK4AJ76H4aJgsg==
X-Received: by 2002:a17:90a:aa0b:: with SMTP id k11mr109321pjq.153.1622557147557;
        Tue, 01 Jun 2021 07:19:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/26] sstate: Ignore sstate signing key
Date: Tue,  1 Jun 2021 04:18:05 -1000
Message-Id: <0bfccdee11866d7f4e6c767127379329cd1dea2d.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel McGregor <daniel.mcgregor@vecima.com>

What key is used to sign sstate artefacts should not affect the hash of
the object, otherwise everyone would need to use the same signing key.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 57cc9429dba4f9bd23127633dbc1f57dc2d5dd16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sstate.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3c89c35ecf..a689f7f677 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -706,6 +706,8 @@ def sstate_package(ss, d):
 
     return
 
+sstate_package[vardepsexclude] += "SSTATE_SIG_KEY"
+
 def pstaging_fetch(sstatefetch, d):
     import bb.fetch2
 
-- 
2.25.1

