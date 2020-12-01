Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.504.1606848771300324546
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Z+it07aE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id s21so1685121pfu.13
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xWCTbR63rNa2ePW1rlcZWUXKbYhCtEAGDHF1aZAmkwc=;
        b=Z+it07aE8HHi5Y1f5eCD0Lqay7aGe93abN2bMGo2UUUyn2+K45jHV7FJOVM5gUi1qZ
         CJsL2ikIRh5Lx3rw6I/qUOWyZ7bi2+i2JPnq3SnAmZQmwS/xoaXIADPXZY7jZND6/Rtj
         Z3v6O7RW0esjY6BEVpDHloZ+fxO4yi3JIo56rb2BbYIlaH3i9WxNvl6pGEGZz9l+6OHF
         YDeyi/nbWBAUtj8h++A0bNWqt3gRlZKqOKhOnoCx1sb51gB1yIpEhrr8FgrL1ujuWkQZ
         TyqgI25UPt8a1OrnmI4oGovqZDnwB/maXmKAbwE73y/S7o3TE6W/qPa6U2G9mdqN9x/r
         10mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xWCTbR63rNa2ePW1rlcZWUXKbYhCtEAGDHF1aZAmkwc=;
        b=Ji9IDycKea/42Wp35NC0lHe8tgyw/pQdXJFcE6EpX61SuPsBYDQNrqYoTY43mjfELz
         /UAGdMw4S4G6N3CqxYyldQBTU48gNpNaR1iclGPmGcFAUvZDqvcxWoNMmtHnCnQBAoU6
         VeN8XgHku6oZwYcD6GZV+4gV2iQMYIFp7lg/foiN0tOckUxpRNMsD1lcj4KSMUHrPBw2
         MVNzYq6ae8zGu4LPLLTQCLpTXSZTX3twH7UEzPAsdTGee96oND02LR7lfoIfHe4OaepM
         8QPXrqVhe/qHxKOPR9RHE5Fai74itL/X/0wyd3nDL5ckZ2QTOz3j+z7/PIwCuqvQlI4d
         a33A==
X-Gm-Message-State: AOAM5316w6h2/aeA2lirzpj5M4a3eNXmiOyF1Nlp+DVEX8egWwaKDjZi
	TntehbM3seZOHSqSGUu+0mo8HjEPhZAbWOZu
X-Google-Smtp-Source: ABdhPJyuSy+11CcDPtgzawjQpglSn+NB13znTelhlwr4JJBRu+WqQKNMVcOuceVDLniAyWBmKhKR0A==
X-Received: by 2002:a62:8cd2:0:b029:19b:9057:4f5d with SMTP id m201-20020a628cd20000b029019b90574f5dmr3061779pfd.11.1606848770363;
        Tue, 01 Dec 2020 10:52:50 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:49 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/16] distutils-common-base: fix LINKSHARED expansion
Date: Tue,  1 Dec 2020 08:51:55 -1000
Message-Id: <0fc0b52cc624455cd48097dbc0536de50dbc4ede.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Anuj Mittal <anuj.mittal@intel.com>

Add the missing $ so SECURITY_CFLAGS actually gets expanded.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6ed2f892ebb0b4e30a3bf167eac68027ea378a2d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/distutils-common-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index 94b5fd426d..43a38e5a3a 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -11,7 +11,7 @@ export LDCXXSHARED  = "${CXX} -shared"
 export CCSHARED  = "-fPIC -DPIC"
 # LINKFORSHARED are the flags passed to the $(CC) command that links
 # the python executable
-export LINKFORSHARED = "{SECURITY_CFLAGS} -Xlinker -export-dynamic"
+export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
 
 FILES_${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
-- 
2.17.1

