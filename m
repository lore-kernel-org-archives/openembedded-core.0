Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C95C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 11:30:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.22030.1680089405586438324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 04:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b8SNOxgB;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id j24so15328729wrd.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 04:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680089404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtY03RiunRtrYK8UqBqZ4A1gIeziRk02+nipe6PbqA0=;
        b=b8SNOxgBCMmYCwgvAA6l3EhtMLvTz+4PUqhyWJe+uUQYDChA9osBKbUlHxWf6/qVr0
         myKs3nJBFQYZXFlMvXqEFIqmppOMC7XT3bnxv3UHhTXPaJV3I5gtKHWqUgb/MPFhGZca
         PTmKsXDqTLAt3XvGh79uUIa20ibHMjJJvJLKh8JpvkwXkKB+AwzakX/28HuJrbj40nYP
         R8yYOE8FI3V2SwjieCh7UlrD2oVgWHbrsj1ZuJ3xXP2OnPCb3SSUQDLhIWLtNbw1gtTh
         SuOVxEJeeu0DQWNTrDVnpGDBC1FQAYrmDBFTq1LsOnFDRF8VQ6HD2TRvvLcXWwPkArUq
         99Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680089404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtY03RiunRtrYK8UqBqZ4A1gIeziRk02+nipe6PbqA0=;
        b=UTnxl4MQsAhBO7BpY0ciKj6IC/nPOGq378N+7PHiPZ8OjtQtTrkGyMT4Qqe5ePzlOt
         PuVIf/WpleYUwm+m9aOx+V2xU/NQcaEEQfRCmv90qbyYIlTe4uKeGKt2afMGGC81uQSO
         CEFas3fBOxjAGx5gHN0lYMNFk3iYPWZ5a3bHGjXu+uf9/izRiMuEh/wIfyy3mN4ui+9M
         30gjzdMbCPLpQVdbnu0uxBeJaZYy2FAXYnwf2vmc59kWffblo4aai7uJtsDczcCMB8cl
         Jvd7SoEULd++ybhn93TqcGMEcGHxNpEtcGw+kkmypuHpNA1YgXF1ND0iUJ16EV4RFPQK
         EzmA==
X-Gm-Message-State: AAQBX9e8Qp/rwoMEFYAit+Phl2FLPsONmXwsemyk4hZ+MmQSd3MSrxdg
	7r5CgDJ7fIduQROZWODxUcdNcVhIsV4=
X-Google-Smtp-Source: AKy350YCx2IIZXHR+Td8vBcSU8/XvmxK0IS7oSuHgajPgNFiO5tuwpxhr9FjkvF66QzbpGKtv4HAgg==
X-Received: by 2002:adf:e90e:0:b0:2da:f076:717f with SMTP id f14-20020adfe90e000000b002daf076717fmr15645491wrm.53.1680089403719;
        Wed, 29 Mar 2023 04:30:03 -0700 (PDT)
Received: from debian.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id n17-20020a5d4c51000000b002c54c9bd71fsm29924387wrt.93.2023.03.29.04.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 04:30:03 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] cracklib: upgrade to v2.9.10
Date: Wed, 29 Mar 2023 12:30:00 +0100
Message-Id: <20230329113000.66712-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 11:30:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179275

Remove a patch which has been applied upstream and rebase
another patch on top of v2.9.10

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 ...port-dictionary-byte-order-dependent.patch | 28 +++++-----
 ...aklib-fix-testnum-and-teststr-failed.patch | 53 -------------------
 .../{cracklib_2.9.8.bb => cracklib_2.9.10.bb} |  3 +-
 3 files changed, 15 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
 rename meta/recipes-extended/cracklib/{cracklib_2.9.8.bb => cracklib_2.9.10.bb} (87%)

diff --git a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
index 8fb512a224..20572b55c4 100644
--- a/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
+++ b/meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
@@ -26,7 +26,7 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
  1 file changed, 210 insertions(+), 4 deletions(-)
 
 diff --git a/lib/packlib.c b/lib/packlib.c
-index 8acb7be..a9d8750 100644
+index 9396e1d..d0bb181 100644
 --- a/lib/packlib.c
 +++ b/lib/packlib.c
 @@ -16,6 +16,12 @@
@@ -41,8 +41,8 @@ index 8acb7be..a9d8750 100644
 +#include <byteswap.h>
  #include "packer.h"
  
- static const char vers_id[] = "packlib.c : v2.3p2 Alec Muffett 18 May 1993";
-@@ -45,6 +51,185 @@ typedef struct
+ #define DEBUG 0
+@@ -43,6 +49,185 @@ typedef struct
      char data_get[NUMWORDS][MAXWORDLEN];
  } PWDICT64;
  
@@ -228,7 +228,7 @@ index 8acb7be..a9d8750 100644
  
  static int
  _PWIsBroken64(FILE *ifp)
-@@ -57,6 +242,7 @@ _PWIsBroken64(FILE *ifp)
+@@ -55,6 +240,7 @@ _PWIsBroken64(FILE *ifp)
         return 0;
      }
  
@@ -236,7 +236,7 @@ index 8acb7be..a9d8750 100644
      return (pdesc64.header.pih_magic == PIH_MAGIC);
  }
  
-@@ -149,7 +335,11 @@ PWOpen(prefix, mode)
+@@ -147,7 +333,11 @@ PWOpen(prefix, mode)
  	pdesc.header.pih_blocklen = NUMWORDS;
  	pdesc.header.pih_numwords = 0;
  
@@ -249,7 +249,7 @@ index 8acb7be..a9d8750 100644
      } else
      {
  	pdesc.flags &= ~PFOR_WRITE;
-@@ -173,6 +363,7 @@ PWOpen(prefix, mode)
+@@ -171,6 +361,7 @@ PWOpen(prefix, mode)
  	    return NULL;
  	}
  
@@ -257,7 +257,7 @@ index 8acb7be..a9d8750 100644
          if ((pdesc.header.pih_magic == 0) || (pdesc.header.pih_numwords == 0))
          {
              /* uh-oh. either a broken "64-bit" file or a garbage file. */
-@@ -195,6 +386,7 @@ PWOpen(prefix, mode)
+@@ -193,6 +384,7 @@ PWOpen(prefix, mode)
  		}
                  return NULL;
              }
@@ -265,7 +265,7 @@ index 8acb7be..a9d8750 100644
              if (pdesc64.header.pih_magic != PIH_MAGIC)
              {
                  /* nope, not "64-bit" after all */
-@@ -290,6 +482,7 @@ PWOpen(prefix, mode)
+@@ -288,6 +480,7 @@ PWOpen(prefix, mode)
                  {
                      pdesc.flags &= ~PFOR_USEHWMS;
                  }
@@ -273,7 +273,7 @@ index 8acb7be..a9d8750 100644
                  for (i = 0; i < sizeof(pdesc.hwms) / sizeof(pdesc.hwms[0]); i++)
                  {
                      pdesc.hwms[i] = pdesc64.hwms[i];
-@@ -299,6 +492,7 @@ PWOpen(prefix, mode)
+@@ -297,6 +490,7 @@ PWOpen(prefix, mode)
  	    {
  		pdesc.flags &= ~PFOR_USEHWMS;
  	    }
@@ -281,7 +281,7 @@ index 8acb7be..a9d8750 100644
  #if DEBUG
              for (i=1; i<=0xff; i++)
              {
-@@ -332,7 +526,11 @@ PWClose(pwp)
+@@ -330,7 +524,11 @@ PWClose(pwp)
  	    return (-1);
  	}
  
@@ -294,7 +294,7 @@ index 8acb7be..a9d8750 100644
  	{
  	    fprintf(stderr, "index magic fwrite failed\n");
  	    return (-1);
-@@ -351,7 +549,12 @@ PWClose(pwp)
+@@ -349,7 +547,12 @@ PWClose(pwp)
  	    	printf("hwm[%02x] = %d\n", i, pwp->hwms[i]);
  #endif
  	    }
@@ -308,7 +308,7 @@ index 8acb7be..a9d8750 100644
  	}
      }
  
-@@ -405,7 +608,8 @@ PutPW(pwp, string)
+@@ -403,7 +606,8 @@ PutPW(pwp, string)
  
  	datum = (uint32_t) ftell(pwp->dfp);
  
@@ -318,7 +318,7 @@ index 8acb7be..a9d8750 100644
  
  	fputs(pwp->data_put[0], pwp->dfp);
  	putc(0, (FILE*) pwp->dfp);
-@@ -464,6 +668,7 @@ GetPW(pwp, number)
+@@ -462,6 +666,7 @@ GetPW(pwp, number)
             perror("(index fread failed)");
             return NULL;
         }
@@ -326,7 +326,7 @@ index 8acb7be..a9d8750 100644
         datum = datum64;
      } else {
         if (fseek(pwp->ifp, sizeof(struct pi_header) + (thisblock * sizeof(uint32_t)), 0))
-@@ -477,6 +682,7 @@ GetPW(pwp, number)
+@@ -475,6 +680,7 @@ GetPW(pwp, number)
             perror("(index fread failed)");
             return NULL;
         }
diff --git a/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch b/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
deleted file mode 100644
index 1ee97357d0..0000000000
--- a/meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 7250328d7f77069726603ef7132826c9260d3c92 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 27 Apr 2013 16:02:30 +0800
-Subject: [PATCH 2/2] craklib:fix testnum and teststr failed
-
-Error log:
-...
-$ ./testnum
-(null).pwd.gz: No such file or directory
-PWOpen: No such file or directory
-
-$ ./util/teststr
-(null).pwd.gz: No such file or directory
-PWOpen: No such file or directory
-...
-Set DEFAULT_CRACKLIB_DICT as the path of  PWOpen
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Upstream-Status: Submitted [https://github.com/cracklib/cracklib/pull/42]
----
- util/testnum.c | 2 +-
- util/teststr.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/util/testnum.c b/util/testnum.c
-index ae2246d..ca210ff 100644
---- a/util/testnum.c
-+++ b/util/testnum.c
-@@ -20,7 +20,7 @@ main ()
-     PWDICT *pwp;
-     char buffer[STRINGSIZE];
- 
--    if (!(pwp = PWOpen (NULL, "r")))
-+    if (!(pwp = PWOpen (DEFAULT_CRACKLIB_DICT, "r")))
-     {
- 	perror ("PWOpen");
- 	return (-1);
-diff --git a/util/teststr.c b/util/teststr.c
-index 2a31fa4..9fb9cda 100644
---- a/util/teststr.c
-+++ b/util/teststr.c
-@@ -15,7 +15,7 @@ main ()
-     PWDICT *pwp;
-     char buffer[STRINGSIZE];
- 
--    if (!(pwp = PWOpen (NULL, "r")))
-+    if (!(pwp = PWOpen (DEFAULT_CRACKLIB_DICT, "r")))
-     {
- 	perror ("PWOpen");
- 	return (-1);
--- 
-2.20.1
-
diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.8.bb b/meta/recipes-extended/cracklib/cracklib_2.9.10.bb
similarity index 87%
rename from meta/recipes-extended/cracklib/cracklib_2.9.8.bb
rename to meta/recipes-extended/cracklib/cracklib_2.9.10.bb
index a3db6eb394..8197cdad9e 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.8.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.10.bb
@@ -11,10 +11,9 @@ EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 
 SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
-           file://0002-craklib-fix-testnum-and-teststr-failed.patch \
            "
 
-SRCREV = "d9e8f9f47718539aeba80f90f4e072549926dc9c"
+SRCREV = "e74c539344d024709ee76e2920b0af7f9a5c5556"
 S = "${WORKDIR}/git/src"
 
 inherit autotools gettext
-- 
2.17.1


