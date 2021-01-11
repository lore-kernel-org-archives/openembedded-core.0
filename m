Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.27253.1610326004793355472
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FdOaWqw3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 30so11532484pgr.6
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=774a2gTocvb5W0XAGWGJ5wKGRCqZsWbaGjCxnkOmk4s=;
        b=FdOaWqw3fXDIwZMJcRw59r94TuAblZ4xqtDIrSVTeaQ4bfuT9iycP66u+m4mlux6dZ
         3BmI2PKmeZTi0MKix634pMlIYHkvzRU5YaFcSZJBd1oKJhy71ihu9iRI8uVQO3l4eOO1
         h1gvq5wVtHfvNDIAkwpnceyDZG/QkLrmLVQZxWtR1Ln8I5eZT1bPOkWBMYxIEEtxUt//
         HlNLjTKtadVTFI3jP1n/p/rYEPj/uTHHT8VouUu8j9ZAPseVCi6Q2Q6/UyRSToSCRxDR
         bAS8VlYpfs5/MeAU534UdlyeK2GpfVCSWwuguX1hfyEQfaL6lJmS9dkXCU3OQA0w9Sv0
         MTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=774a2gTocvb5W0XAGWGJ5wKGRCqZsWbaGjCxnkOmk4s=;
        b=nVxF2zcDNutzF/dsAGa76zvN3aHFu77vJ+bVI3QEeY2OlKw4TZiO97wvriYcgWiPkc
         q0Y5/XfaM1MsuOuv/0DMhNr105rPtp6PBAiJxYzADVGJAlnHD03QXsVODOIdICqZHnnn
         oXxA2q8aVMDEgGS0Kavx/v8qZHl3Z23heWSdzw3vjxvf93UnuVQeX+DAIBhoEkEkncTE
         S2zi3RmLGw8pZLhZwNKyM617ohl0b821S6tHrAC2X+w7DtM7REbU2crXqhERUaMYM+/T
         dvXeSnp3nZQyaA21Q6om2yQ2xuBBbdbxzW7W+9XC2JFQz/aK0JDR3dgus15wV/Men9YB
         +eNA==
X-Gm-Message-State: AOAM5307f5DqCSXVJOpJ610ZmBgMIb3MTg43vwUTIJ+H47PPQ4IA3J9x
	SoUMgSoa2S5G1tznKBp5l4VHCDoey56PgMk71vI=
X-Google-Smtp-Source: ABdhPJzKIinurwlGtJ3B8DKewxs0nsILpnwTNnmj79H0zSiyOThjgilJ33y5JjDJw4X9BNDkm1HFww==
X-Received: by 2002:a62:7fc1:0:b029:19f:1dab:5029 with SMTP id a184-20020a627fc10000b029019f1dab5029mr13914764pfd.13.1610326003995;
        Sun, 10 Jan 2021 16:46:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:43 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] ruby: remove tcl DEPENDS
Date: Sun, 10 Jan 2021 14:45:51 -1000
Message-Id: <832e9e6bac91755f6a6a8ab9af0e48c189d3e493.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

The integrated Tcl/Tk module was removed in Ruby 2.4[1] back in 2016, so this
build dependency can be removed.

[1] https://github.com/ruby/ruby/commit/303dc3c591e324b6bbc691326d8bea76fe3b8fda

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f4e181924a83d7b26b11de765c202a9bd036f64)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index a38b3fe624..7b6d4edc61 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "\
     file://LEGAL;md5=2b6d62dc0d608f34d510ca3f428110ec \
 "
 
-DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline libffi"
+DEPENDS = "ruby-native zlib openssl libyaml gdbm readline libffi"
 DEPENDS_class-native = "openssl-native libyaml-native readline-native zlib-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-- 
2.17.1

