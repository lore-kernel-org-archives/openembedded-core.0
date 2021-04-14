Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.16104.1618418422552670557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 09:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fAcnuOEW;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id z16so14808105pga.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 09:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oJjrS2aFO1TXBfQ65qKV9k7SFkOaMSFJk7cvLWavJwQ=;
        b=fAcnuOEW9C69KQpLa7T6qfVs1GDNRBsU8pHSW5HIbOzsPnD6Gva5rEyjc+6gTymuEq
         AcXmjcgxkxb7z5QBMkQecGU+N9MSXhRoZuGvjL+9lFL34psMdeCl1ymMNrbP9RfpgKLc
         rJ/jT8vYQqMiGoBlVO+6Tjw3QkTkyFIVODi2zOZPGiFnf6XB4IjWjbSbAcMHjHQh/e8E
         F17Qm2IXtqEJNCIYJJuzkTSG6doqDLt0cWlLmU0UDq/6fxcuBRT1zA872YAxW4Opnnm3
         U7F8cPSPRpGV1DTKNrPbemqr7NrlpmRnnjS0qKBGBnuettTVjL47QK2Eqln6yoOiZxoE
         LcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oJjrS2aFO1TXBfQ65qKV9k7SFkOaMSFJk7cvLWavJwQ=;
        b=kSeQ78d/AB7L6lwLCOsmI0oJ5VUCYdw7Mpo9DHUOpEHRiGxJZJTyhdWbWPxVedQaOO
         ORPcAD6RCKqbnJnjfqk5uAb8LldwMorVf8onxzmCsIfeipEDx0w2s2oMC8gGFEKsGE2A
         bId4UULX7xTvHPNeez9zhOsv/GGduFb9J/91iKXhWejQj4/icCsdItOIvGYLRRKNswcl
         T+M2RD0LUztzaVej2TYFtSXdVZ+rcF44G4QIi9WM94uLVbuYraSmJU6VEe1EqG2MjAzg
         qHZMk+qjtOkD61+UNz2lYSRUNn4ginOyxlUgc7sKpjhwI4+i3KlyvM3kcZSSYqK4QOTR
         mGCA==
X-Gm-Message-State: AOAM530dfvhC5idzt3lUUr9HkkdMGXA2QyVil6w6YARB6n6wy+iCtc6o
	0BrrEr8tbDPh6Zo7NeedKjJViiXe+oQDqQ==
X-Google-Smtp-Source: ABdhPJxqo3zeuElQhXYmo+NeVJqU7lo+ywbzYWf/SVIGsw0Id8G7KzIRTXIqgzph2PBXqiNFkOtW2Q==
X-Received: by 2002:aa7:952b:0:b029:23f:44a1:ac86 with SMTP id c11-20020aa7952b0000b029023f44a1ac86mr12524568pfp.12.1618418421922;
        Wed, 14 Apr 2021 09:40:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id s1sm93832pgc.28.2021.04.14.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 09:40:21 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [v2 2/3] valgrind: Add glibc-src to ptest rdeps
Date: Wed, 14 Apr 2021 09:40:17 -0700
Message-Id: <20210414164018.2027379-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414164018.2027379-1-raj.khem@gmail.com>
References: <20210414164018.2027379-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gdbserver tests look for glibc sources ( rtld.c )
or else they are flagged as differences and tests marked as failures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.17.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index eb7b9d2383..d8324f1dc6 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -136,7 +136,7 @@ RDEPENDS_${PN}-ptest += " bash coreutils file \
    perl-module-file-basename perl-module-file-glob perl-module-getopt-long \
    perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
    perl-module-carp perl-module-symbol \
-   procps sed ${PN}-dbg ${PN}-src"
+   procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
 # One of the tests contains a bogus interpreter path on purpose.
-- 
2.31.1

