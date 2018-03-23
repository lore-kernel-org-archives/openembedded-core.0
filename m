Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCED78901
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 13:34:56 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id d26so4714858pfn.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 06:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CoxMi7Rqo8mDaKvkZGYZ4o1vPlG5kCobpida8SViMjg=;
	b=ZDmXV2Hnx+O8T8WinE2pdf3LE0WOZSXtQMKgx5x/uMU/IRFN5R10u85PU5WqeX20YX
	y9RZZF1CeC97HD5HZadZ7DqSIZ2oPt5fD+j8CSUzNT3mG4GFWEMsLal8fklRy/Cqea+3
	IOIicuMXDWyNEtn5QOpNQ1k1mik7MBxRFMXtKrhfN6CxKHO7wM2VuUDJhgSyej5B0h7L
	QUhtu8w7va1yJJvF1kr5pmnrcp+rT937DJyV7pmMwhJjvaZUddYw4l3HjpL/Zw3YLYC1
	jYqfGKrMCgNUgzNfVSe7qahXs1LZc2mv0sVtBjxsvqpz0aOL5UKaB3zpdRYyc2BXb9f5
	4fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CoxMi7Rqo8mDaKvkZGYZ4o1vPlG5kCobpida8SViMjg=;
	b=gHRGjWbElUr1D3nTrqmlv1aiT15opCTVMqMbLkwYtC7Z9FUNO1203g9dw/CWs7wpre
	ximVA3o3lRoff9DcV2p2vzRjzmU1isJiYNrqraJFt0F/FbLnyCybmvJ6Rq5O3RfeMBlY
	CdPlHPoOeidD2hw19FLNpoDFzZcmFyF2EImo1D0r1ds2fPgFGEk82uTjKRe8reRPdXgV
	y9UavvrFctk0jO4SGPIrI9HqhsgmQslyCHkP8xXCeny1CXIlOhC2ODXIzIb6SXID8ZTh
	tC2gm3/mWmpvODeNyb7plyecw1rtiNh6tMFaIn5SoYxpYIub7n7KOTR5QmYtEfon3LXb
	6WuA==
X-Gm-Message-State: AElRT7GYEESYqLlwR44WTDf5Oo8ccM+1V44tFRj4toPEoqCpYnRBonOu
	Y4/hIWa4+NEIP7SSiA9+F2g6mQ==
X-Google-Smtp-Source: AG47ELtRRvu0d6+9Bd5Cq6zcOsI+Rd93yymE7YFuAUyDvWP3uHVwp7ujUF4sOZzIzc+OW13NfDQSUg==
X-Received: by 10.98.102.79 with SMTP id a76mr4336037pfc.162.1521812097444;
	Fri, 23 Mar 2018 06:34:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	q15sm18996375pfi.140.2018.03.23.06.34.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 06:34:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2018 06:34:45 -0700
Message-Id: <20180323133445.15672-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180323133445.15672-1-raj.khem@gmail.com>
References: <20180323133445.15672-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] nss: Use snprintf in sign.c
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2018 13:34:56 -0000

Fies security warnings
| sign.c:86:31: error: 'sprintf' may write a terminating nul past the end of the destination [-Werror=format-overflow=]
|          sprintf(fullfn, "%s/%s", tree, tempfn);

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1437734-Use-snprintf-in-sign.c-r-ttaubert.patch | 119 +++++++++++++++++++++
 meta/recipes-support/nss/nss_3.34.1.bb             |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-support/nss/nss/0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch

diff --git a/meta/recipes-support/nss/nss/0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch b/meta/recipes-support/nss/nss/0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch
new file mode 100644
index 0000000000..bc10f3385d
--- /dev/null
+++ b/meta/recipes-support/nss/nss/0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch
@@ -0,0 +1,119 @@
+From 6f7d7be9997ba6727a5ad7c3800df9051160dc12 Mon Sep 17 00:00:00 2001
+From: Martin Thomson <martin.thomson@gmail.com>
+Date: Tue, 13 Feb 2018 12:30:58 +1100
+Subject: [PATCH] Bug 1437734 - Use snprintf in sign.c, r=ttaubert
+
+--HG--
+extra : rebase_source : 97921ece71ff86b18d32b891591608290eed4d83
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/nss-dev/nss/commit/0a9078b3cde97add7c825c9d13467a8401ad0c88#diff-b42512151dc137537091f823f7701804.patch]
+
+ nss/cmd/signtool/sign.c | 58 ++++++++++++++++++++++++++++++++++++++++---------
+ 1 file changed, 48 insertions(+), 10 deletions(-)
+
+diff --git a/nss/cmd/signtool/sign.c b/nss/cmd/signtool/sign.c
+index 6e776069a..6f8e43946 100644
+--- a/nss/cmd/signtool/sign.c
++++ b/nss/cmd/signtool/sign.c
+@@ -43,6 +43,7 @@ SignArchive(char *tree, char *keyName, char *zip_file, int javascript,
+     int status;
+     char tempfn[FNSIZE], fullfn[FNSIZE];
+     int keyType = rsaKey;
++    int count;
+ 
+     metafile = meta_file;
+     optimize = _optimize;
+@@ -81,9 +82,18 @@ SignArchive(char *tree, char *keyName, char *zip_file, int javascript,
+         }
+ 
+         /* rsa/dsa to zip */
+-        sprintf(tempfn, "META-INF/%s.%s", base, (keyType == dsaKey ? "dsa"
+-                                                                   : "rsa"));
+-        sprintf(fullfn, "%s/%s", tree, tempfn);
++        count = snprintf(tempfn, sizeof(tempfn), "META-INF/%s.%s", base, (keyType == dsaKey ? "dsa" : "rsa"));
++        if (count >= sizeof(tempfn)) {
++            PR_fprintf(errorFD, "unable to write key metadata\n");
++            errorCount++;
++            exit(ERRX);
++        }
++        count = snprintf(fullfn, sizeof(fullfn), "%s/%s", tree, tempfn);
++        if (count >= sizeof(fullfn)) {
++            PR_fprintf(errorFD, "unable to write key metadata\n");
++            errorCount++;
++            exit(ERRX);
++        }
+         JzipAdd(fullfn, tempfn, zipfile, compression_level);
+ 
+         /* Loop through all files & subdirectories, add to archive */
+@@ -93,20 +103,44 @@ SignArchive(char *tree, char *keyName, char *zip_file, int javascript,
+     }
+     /* mf to zip */
+     strcpy(tempfn, "META-INF/manifest.mf");
+-    sprintf(fullfn, "%s/%s", tree, tempfn);
++    count = snprintf(fullfn, sizeof(fullfn), "%s/%s", tree, tempfn);
++    if (count >= sizeof(fullfn)) {
++        PR_fprintf(errorFD, "unable to write manifest\n");
++        errorCount++;
++        exit(ERRX);
++    }
+     JzipAdd(fullfn, tempfn, zipfile, compression_level);
+ 
+     /* sf to zip */
+-    sprintf(tempfn, "META-INF/%s.sf", base);
+-    sprintf(fullfn, "%s/%s", tree, tempfn);
++    count = snprintf(tempfn, sizeof(tempfn), "META-INF/%s.sf", base);
++    if (count >= sizeof(tempfn)) {
++        PR_fprintf(errorFD, "unable to write sf metadata\n");
++        errorCount++;
++        exit(ERRX);
++    }
++    count = snprintf(fullfn, sizeof(fullfn), "%s/%s", tree, tempfn);
++    if (count >= sizeof(fullfn)) {
++        PR_fprintf(errorFD, "unable to write sf metadata\n");
++        errorCount++;
++        exit(ERRX);
++    }
+     JzipAdd(fullfn, tempfn, zipfile, compression_level);
+ 
+     /* Add the rsa/dsa file to the zip archive normally */
+     if (!xpi_arc) {
+         /* rsa/dsa to zip */
+-        sprintf(tempfn, "META-INF/%s.%s", base, (keyType == dsaKey ? "dsa"
+-                                                                   : "rsa"));
+-        sprintf(fullfn, "%s/%s", tree, tempfn);
++        count = snprintf(tempfn, sizeof(tempfn), "META-INF/%s.%s", base, (keyType == dsaKey ? "dsa" : "rsa"));
++        if (count >= sizeof(tempfn)) {
++            PR_fprintf(errorFD, "unable to write key metadata\n");
++            errorCount++;
++            exit(ERRX);
++        }
++        count = snprintf(fullfn, sizeof(fullfn), "%s/%s", tree, tempfn);
++        if (count >= sizeof(fullfn)) {
++            PR_fprintf(errorFD, "unable to write key metadata\n");
++            errorCount++;
++            exit(ERRX);
++        }
+         JzipAdd(fullfn, tempfn, zipfile, compression_level);
+     }
+ 
+@@ -408,6 +442,7 @@ static int
+ manifesto_xpi_fn(char *relpath, char *basedir, char *reldir, char *filename, void *arg)
+ {
+     char fullname[FNSIZE];
++    int count;
+ 
+     if (verbosity >= 0) {
+         PR_fprintf(outputFD, "--> %s\n", relpath);
+@@ -421,7 +456,10 @@ manifesto_xpi_fn(char *relpath, char *basedir, char *reldir, char *filename, voi
+         if (!PL_HashTableLookup(extensions, ext))
+             return 0;
+     }
+-    sprintf(fullname, "%s/%s", basedir, relpath);
++    count = snprintf(fullname, sizeof(fullname), "%s/%s", basedir, relpath);
++    if (count >= sizeof(fullname)) {
++        return 1;
++    }
+     JzipAdd(fullname, relpath, zipfile, compression_level);
+ 
+     return 0;
diff --git a/meta/recipes-support/nss/nss_3.34.1.bb b/meta/recipes-support/nss/nss_3.34.1.bb
index ae52a95a30..1af68acfb3 100644
--- a/meta/recipes-support/nss/nss_3.34.1.bb
+++ b/meta/recipes-support/nss/nss_3.34.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
            file://Fix-compilation-for-X32.patch \
+           file://0001-Bug-1437734-Use-snprintf-in-sign.c-r-ttaubert.patch \
            "
 
 SRC_URI[md5sum] = "5922468bb1c54e4c8067f153fcf467e5"
-- 
2.16.2


