Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A8BCCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 07:06:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42775.1762758373219452473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 23:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYNrNaPp;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297ec50477aso8317195ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 23:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762758372; x=1763363172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bh5A9InG7kq872PuT9SnHG2DJDaMKkGL64QykaJuD+k=;
        b=jYNrNaPpFAQoOhMSoKhpMRPNiMbuAtjBJJHfVinlqMy8ulNYCpBsw93sxQXOmzxxlF
         x52+W5nIEYurF3uid4FjbGGvicNtix+/ilMZs7etwExkhzPmtKA5mmPWE0jwZvtlY3ED
         ludGROkDiECUND04Gjwg9Ev2qOtUNRNpl2pm9HkQHnlTTc4QRCf94q0UeZhKH/9axSTL
         mTUZfBDAY1l44nlm14aJVRzhFoTRIAG0yV9AjXx8aUqvbctODr1l9z+CNwcKbkkXeB9O
         JadpFkLt3qKWFtCy42MEI7rCy6P12Ph/uAw3MMhuR9P/B0L/Dj2tqqfabLlML7oN8bEZ
         ff3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762758372; x=1763363172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bh5A9InG7kq872PuT9SnHG2DJDaMKkGL64QykaJuD+k=;
        b=QzjeqW0ZlAr1R5uKkQm8c7RsEDJDA5Y45HUMHpAIsGWgdjYQEZm1nF2qyrGxpKJRbX
         nCzSVfnNcEP3cVApirRQ6qd/Y0kIpZM/r/e26ogLLfk0vYxBjik+LnHy6MG8JFidPGZT
         WD7NneZUJKmMn4dnCag1pMhi1JyESwoyUc5P+AD07yHx8DjCgNFPERCGAo1mUyIjZ1SU
         /wuu02erhuWpW7REi4t8pWBtbJjAVRdQT/IDMatbH6SH28QKptuIyKROkycnOT4pYKGm
         QbLjmQLOFZ37R62xQK79kvybjSbctp+HLjQimwp6YiScup4K7gGRxxIpYtjSFZAHh4wv
         l3WA==
X-Gm-Message-State: AOJu0Yy4TI2oy3tU7DE94Z38a2gzkg4W7E1P9xqsSE92lFDLMxUDRL0D
	YbxZyYTrHHpS9Q7VSwPLAOSVKNj+ECnlv+leB71c7TRThcmg+hcMX6yc3X6TMg==
X-Gm-Gg: ASbGncvlUlBaiuqKcc4gKQ6Bnfk3yHf+a8uqf36PyLzZKedepyVER5kWZV7VqVOzNBL
	VVyVkyKQwwTZU7VBDidpzd2yW0U8A1ZU50xSSpU25QzVx5K8gCo618Bpe5laraz+v6bBO3/76ol
	vi8ndg7ixuyDqEbJztStLs0xuxBIavIHMEi8YnwursJLPZZZlp3L/NKfu4pLKgJXsATVFjg2Rg1
	n2jJ0pJ9JIMV9OWKtwSma7EIu178SDKxxcUitTe+PwV7KQDmmyIYBFgu0/NrbXzGDpXntahtrft
	U14Fs9HgKQnaTH/Y/kXufwvBU+9qq3zci8cOdaeM5dwubPPo1+aHAi6nhhm6ityLEFzUXu/YY/B
	eyX93NUyXAX7zWMFp97OCV+3T1qB1TKKiga/Zz2tVKM0FkKtX0GSRPIE9BuyRLm7N3iNwedllNy
	ENL9bB5EDuNVOdstIpLMktmWLK
X-Google-Smtp-Source: AGHT+IHZej8RQ7W8PupPzAe/SubjhY7pBGT+pv0N0hFVeoNm7LSJXyE22RbTCHBeL0zJRI0pu2gDTg==
X-Received: by 2002:a17:903:ac4:b0:297:df99:6bd4 with SMTP id d9443c01a7336-297df996cbbmr95300905ad.18.1762758372216;
        Sun, 09 Nov 2025 23:06:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba901c3817csm11511337a12.30.2025.11.09.23.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 23:06:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][walnascar][PATCH 1/3] ghostscript: patch CVE-2025-59798
Date: Mon, 10 Nov 2025 20:06:02 +1300
Message-ID: <20251110070604.444927-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 07:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226100

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-59798

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ghostscript/CVE-2025-59798.patch          | 135 ++++++++++++++++++
 .../ghostscript/ghostscript_10.05.1.bb        |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch
new file mode 100644
index 0000000000..ac1db737b6
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch
@@ -0,0 +1,135 @@
+From 50cb7bf8ec6cdfca650c16f60c10ee752d8e6efb Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Thu, 22 May 2025 12:25:41 +0100
+Subject: [PATCH] pdfwrite - avoid buffer overrun
+
+Bug #708539 "Buffer overflow in pdf_write_cmap"
+
+The proposed fix in the report solves the buffer overrun, but does not
+tackle a number of other problems.
+
+This commit checks the result of stream_puts() in
+pdf_write_cid_system_info_to_stream() and correctly signals an error to
+the caller if that fails.
+
+In pdf_write_cid_system_info we replace a (rather small!) fixed size
+buffer with a dynamically allocated one using the lengths of the strings
+which pdf_write_cid_system_info_to_stream() will write, and a small
+fixed overhead to deal with the keys and initial byte '/'.
+
+Because 'buf' is used in the stream 's', if it is too small to hold all
+the CIDSystemInfo then we would get an error which was simply discarded
+previously.
+
+We now should avoid the potential error by ensuring the buffer is large
+enough for all the information, and if we do get an error we no longer
+silently ignore it, which would write an invalid PDF file.
+
+CVE: CVE-2025-59798
+Upstream-Status: Backport [https://github.com/ArtifexSoftware/ghostpdl/commit/0cae41b23a9669e801211dd4cf97b6dadd6dbdd7]
+(cherry picked from commit 0cae41b23a9669e801211dd4cf97b6dadd6dbdd7)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ devices/vector/gdevpdtw.c | 52 ++++++++++++++++++++++++++++++---------
+ 1 file changed, 41 insertions(+), 11 deletions(-)
+
+diff --git a/devices/vector/gdevpdtw.c b/devices/vector/gdevpdtw.c
+index ced15c9b2..fe24dd73a 100644
+--- a/devices/vector/gdevpdtw.c
++++ b/devices/vector/gdevpdtw.c
+@@ -703,7 +703,8 @@ static int
+ pdf_write_cid_system_info_to_stream(gx_device_pdf *pdev, stream *s,
+                           const gs_cid_system_info_t *pcidsi, gs_id object_id)
+ {
+-    byte *Registry, *Ordering;
++    byte *Registry = NULL, *Ordering = NULL;
++    int code = 0;
+ 
+     Registry = gs_alloc_bytes(pdev->pdf_memory, pcidsi->Registry.size, "temporary buffer for Registry");
+     if (!Registry)
+@@ -734,14 +735,19 @@ pdf_write_cid_system_info_to_stream(gx_device_pdf *pdev, stream *s,
+         }
+         s_arcfour_process_buffer(&sarc4, Ordering, pcidsi->Ordering.size);
+     }
+-    stream_puts(s, "<<\n/Registry");
++    code = stream_puts(s, "<<\n/Registry");
++    if (code < 0)
++        goto error;
+     s_write_ps_string(s, Registry, pcidsi->Registry.size, PRINT_HEX_NOT_OK);
+-    stream_puts(s, "\n/Ordering");
++    code = stream_puts(s, "\n/Ordering");
++    if(code < 0)
++        goto error;
+     s_write_ps_string(s, Ordering, pcidsi->Ordering.size, PRINT_HEX_NOT_OK);
++error:
+     pprintd1(s, "\n/Supplement %d\n>>\n", pcidsi->Supplement);
+     gs_free_object(pdev->pdf_memory, Registry, "free temporary Registry buffer");
+     gs_free_object(pdev->pdf_memory, Ordering, "free temporary Ordering buffer");
+-    return 0;
++    return code;
+ }
+ 
+ int
+@@ -786,31 +792,55 @@ pdf_write_cmap(gx_device_pdf *pdev, const gs_cmap_t *pcmap,
+     *ppres = writer.pres;
+     writer.pres->where_used = 0; /* CMap isn't a PDF resource. */
+     if (!pcmap->ToUnicode) {
+-        byte buf[200];
++        byte *buf = NULL;
++        uint64_t buflen = 0;
+         cos_dict_t *pcd = (cos_dict_t *)writer.pres->object;
+         stream s;
+ 
++        /* We use 'buf' for the stream 's' below and that needs to have some extra
++         * space for the CIDSystemInfo. We also need an extra byte for the leading '/'
++         * 100 bytes is ample for the overhead.
++         */
++        buflen = pcmap->CIDSystemInfo->Registry.size + pcmap->CIDSystemInfo->Ordering.size + pcmap->CMapName.size + 100;
++        if (buflen > max_uint)
++            return_error(gs_error_limitcheck);
++
++        buf = gs_alloc_bytes(pdev->memory, buflen, "pdf_write_cmap");
++        if (buf == NULL)
++            return_error(gs_error_VMerror);
++
+         code = cos_dict_put_c_key_int(pcd, "/WMode", pcmap->WMode);
+-        if (code < 0)
++        if (code < 0) {
++            gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+             return code;
++        }
+         buf[0] = '/';
+         memcpy(buf + 1, pcmap->CMapName.data, pcmap->CMapName.size);
+         code = cos_dict_put_c_key_string(pcd, "/CMapName",
+                         buf, pcmap->CMapName.size + 1);
+-        if (code < 0)
++        if (code < 0) {
++            gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+             return code;
++        }
+         s_init(&s, pdev->memory);
+-        swrite_string(&s, buf, sizeof(buf));
++        swrite_string(&s, buf, buflen);
+         code = pdf_write_cid_system_info_to_stream(pdev, &s, pcmap->CIDSystemInfo, 0);
+-        if (code < 0)
++        if (code < 0) {
++            gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+             return code;
++        }
+         code = cos_dict_put_c_key_string(pcd, "/CIDSystemInfo",
+                         buf, stell(&s));
+-        if (code < 0)
++        if (code < 0) {
++            gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+             return code;
++        }
+         code = cos_dict_put_string_copy(pcd, "/Type", "/CMap");
+-        if (code < 0)
++        if (code < 0) {
++            gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+             return code;
++        }
++        gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+     }
+     if (pcmap->CMapName.size == 0) {
+         /* Create an arbitrary name (for ToUnicode CMap). */
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index fa6ead0cd8..f8454f82ba 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -25,6 +25,7 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
+           file://CVE-2025-59798.patch \
            "
 
 SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"

