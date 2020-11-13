Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.5226.1605279164715683857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=isemW/Uk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id q5so7804141pfk.6
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ybEMqhZ6Q2lyetDIRHX/6dBZ5FxugH7zxsmECVKvALU=;
        b=isemW/UkHGjLRbNkOhITcgagPXGKEqQ8k2XVFMpPjU96brjqxAAil62b6mE6Sole1J
         AfteoNHDv/gAN0Z8H+XT4PBpi0rPhWyDDXS0sb4kgl2Hwu7vDpj9cxWmJrs3c3/flt+0
         4GDJOhRCuxNs6uHOZPIQ9ksK29m4pme7ej7nsedumk6JMGU71zovUe+v99VxeBPEFfif
         Jhp63pZLH1alOSnLT9KyzqA/HcIlnIAQK4LOUg5v/ncVsYEu40Esnc/xP6CRFmveRsn3
         EhDCAg+VufMrjaUPhCX8F8XJUexeYaIqjisWriZzwUxnT5vRYqb/SKFpwxCh642fqgvt
         bLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ybEMqhZ6Q2lyetDIRHX/6dBZ5FxugH7zxsmECVKvALU=;
        b=UfaeMX3tWwCwj2lhC7/VocixgKHZeUl6IsIKpk5/8tjC5LTsFcLReSFXRvt/zFNf7F
         wyoGJscCnKLexJIFCN3jQcESzQ7AcLsRKdJMBk3iz6vUAA0Eqz/x36v8cQ3qG2gBmx57
         MDfCI6xbIJ2a89jZla2CS9y3xKjPy/WFOEHEetUbBMRl0i6ChsLMrBF6uYlw9VxY9Enf
         I4niKLMrSr1DsegnZjDM7y4p8nxHtBizIxEl4bIAlyut957ywdojJfEFNeYC9Iw+EI40
         7TyTN2oQicM3ghyaKR+eR3uVQcbCWlKchG3u3e8oiB7G2ZeVU3dFgmpplG4568nr0zLB
         6VWQ==
X-Gm-Message-State: AOAM533hIVrfug5UmjjbBcV3DVWuFxx72XL43SFGmnIRhez3Mf6k7ThL
	hjeEyZunBLsLp5HzxKypfSV7q5uav2NZlRpU
X-Google-Smtp-Source: ABdhPJzfbuGHc3uxL5oRmJI/6PcVUPzvfpkNCVW7S5ognNQAxAVbWGwIu/Zty/rDE1CEKd+sHWKpZA==
X-Received: by 2002:aa7:82d0:0:b029:18b:d594:9dc5 with SMTP id f16-20020aa782d00000b029018bd5949dc5mr2263106pfn.63.1605279163699;
        Fri, 13 Nov 2020 06:52:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.52.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:52:43 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/18] libdnf: Fix license as it contains 'or later' clause
Date: Fri, 13 Nov 2020 04:52:07 -1000
Message-Id: <f46aac0fb7c4f1777a19720b05cf0eb83f4dd988.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license headers are clear that the code is "or later", fix LICENSE
to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e565e0b908c71ad5106d1c6c73d269b819787e55)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index cc2ceb8816..43de06e7f9 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Library providing simplified C and Python API to libsolv"
-LICENSE = "LGPLv2.1"
+LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/rpm-software-management/libdnf \
-- 
2.17.1

