Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.19520.1621260886176488259
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=m/+0s/lT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id y32so4718315pga.11
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=RhKvgcvwUCg3/kPW5imltBPay4ns0hTAG9a9VHB/QbE=;
        b=m/+0s/lTV77En+fWfs1UeWhKYUYWq+5/r2RGWn00BiK1BAYiP/iDWPHh9s2gZwY7yp
         crbezVvMvObSIIg3s6oqw7piynjVR4b00R7S0tHPJmEKWrO/s20qytktFy32FPlnpAWx
         1Mf6w/UcZO+65JFOG2+npoehyGovcg0giwpdPQl2JGq4VN99GZTM3dfsNFPH/JuBo6lD
         eu4aZ67rgR98ic+KcodY5e6rUfVHJaG0tzb5TYgARxnQ0khB4ohPtsL/68PtxjLLPQ35
         lsekhaAk+uHDzf3UfAF0Cro1mvU9A/xUozGdEqDojEvtQ83hyu8OFRExVABw7qqqZqD5
         LnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RhKvgcvwUCg3/kPW5imltBPay4ns0hTAG9a9VHB/QbE=;
        b=K3SW+qM0l9JC7bqdyR+bUBLcdzBzH7cHEPJWAYA73tlqhUeZyHfcWul0VIBDefZbGI
         08weyuEtl5y0xhpL/t2UXnP5xWX929g20MfFlVMrr4CelxAqCX8xKdw/IzCKbS+cp6g3
         gADL7605848iR5aESNFhPwSroUXlQVn1ykwpg3MSdxiKzHN1bq7rvDBQ9RdM2AKFFduo
         w7fkdnADpGDLT7YDR0fsqr2Fa6PZeAYBjBpt5GccrEYyrxRF2V+pjIGj8Q9tSX2PCNQB
         H9/HcNGqNPXLeS8gKgUGJukYBXhOHHqaSd2HRpSMG9rVuvN9CPx7rIzpSX7GrGekWYdP
         t3BA==
X-Gm-Message-State: AOAM532ocNF3K0BMsRCGOvYOwV+PD8gWsBZuNAeXjH+AosoOVIwLIjOq
	fjfaX0x2mwtwmQUQWYHqKpYccaZiqx1GmeMhW64=
X-Google-Smtp-Source: ABdhPJzzDs5/Vfqa8DLiXYscIvlwEBCngKCogIGbgE+uaF/xhdq1Xw2UtRpyTX+zoBkbkotL/B49pw==
X-Received: by 2002:a62:6d05:0:b029:250:d196:1fc8 with SMTP id i5-20020a626d050000b0290250d1961fc8mr7801pfc.21.1621260885265;
        Mon, 17 May 2021 07:14:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/35] coreutils: Exclude CVE-2016-2781 from cve-check
Date: Mon, 17 May 2021 04:13:27 -1000
Message-Id: <1c18220fc8559f6423f9afd95a402753c2143e6b.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842

"Given runcon is not really a sandbox command, the advice is to use
`runcon ... setsid ...` to avoid this particular issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2d273b5aed4a5bd509ec9c68a6f451c17ec17d0c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index 7dd9e41def..aabeee882c 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -26,6 +26,10 @@ SRC_URI_append_libc-musl = "file://strtod_fix_clash_with_strtold.patch"
 SRC_URI[md5sum] = "0009a224d8e288e8ec406ef0161f9293"
 SRC_URI[sha256sum] = "ff7a9c918edce6b4f4b2725e3f9b37b0c4d193531cac49a48b56c4d0d3a9e9fd"
 
+# http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
+# runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue.
+CVE_CHECK_WHITELIST += "CVE-2016-2781"
+
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
 EXTRA_OECONF_class-nativesdk = "--enable-install-program=arch,hostname"
-- 
2.25.1

