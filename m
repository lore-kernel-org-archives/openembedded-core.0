Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.37547.1597028411161581650
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qkdYABKE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id g33so4104627pgb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=m9oHibZ9ACfx4PsvhGLxtMGES0sXRCGqG38CkXFiL14=;
        b=qkdYABKE6D8vG+t99d4rqRWAvsAorfAM/AMu2lZpCys4wPENhtZ2AvbUvtRIhL7ekB
         4k7HjbZMWLWY7F+ZNrw818ZJ0bvlyPOQkXyjXRbQAqWEQjhAFDyWvOFkuhLYiC7U6eqZ
         Q3lZxzKZhYqzLJGD7L5dwACJJE5+hoWablkJ8C0xlnIC5yf1qbJUXeKNyA5xRIsfLSLm
         +5nWK4iWeKfPOz9FcfEeTm53ooigqHUXos8JM41yX3/0t0mxcX4D05v2YNOMuXES5Pxj
         /uESKgz2ctN2mXMzEPtN+9qpNY+2Ox5EPxfcSGn5QRakHr8H9M68Pe+bmZOdo5k4j/if
         L5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=m9oHibZ9ACfx4PsvhGLxtMGES0sXRCGqG38CkXFiL14=;
        b=q9nofwbwytAhQMcgrYzj8OaTbg4E24BWAM8RtLAsasSAv9G96SeDo7vMCX8aQHZ27X
         ja4H/3S4vmkE25QJT8WyCUpNKglZFLJCo14K32M46Ex9VlkL2QVTV1N2Txd3Lk+L+XYL
         Vart/Nw4yfem3jgjDTIr3NF5gAhilXJG2sRALOguIAZ9r9hv88/yF1Tvp5nZwKdDk/K2
         0UBpje5mYHTM9lBDNls8EnRzGRCjov6f0sji6xKJgXatff28D/S5CIN8zKSTexacnQx3
         OMracIlZmyC/W1nPCjmQt1dnSkXN/baYuFGOQAhdlHjBA5l9/U4wuYXM0spB8yM3qzPO
         KBIg==
X-Gm-Message-State: AOAM533wLl9+vSqOQR7vmIcn5kzCikZKfX1EyVPg9KVtAzUi8ekUb0ph
	FhiPL1LU1/c+oht9Gehyl7SdIehWuO2ZzA==
X-Google-Smtp-Source: ABdhPJxMyZ+/iA2TVnMZS0wEeUjFkECp3lpv7e7p/wuhUuBUFfmUDJ+SzCFB1XYU1p7Ub+sPHGHpbg==
X-Received: by 2002:a65:5a8d:: with SMTP id c13mr2941275pgt.268.1597028410235;
        Sun, 09 Aug 2020 20:00:10 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/19] ghostscript: fix CVE-2020-15900
Date: Sun,  9 Aug 2020 16:59:18 -1000
Message-Id: <a58aa3017925617da1eec732a0e68bfda83410a1.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2020-15900.patch          | 54 +++++++++++++++++++
 .../ghostscript/ghostscript_9.50.bb           |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch
new file mode 100644
index 0000000000..d7c5f034e5
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2020-15900.patch
@@ -0,0 +1,54 @@
+From 5d499272b95a6b890a1397e11d20937de000d31b Mon Sep 17 00:00:00 2001
+From: Ray Johnston <ray.johnston@artifex.com>
+Date: Wed, 22 Jul 2020 09:57:54 -0700
+Subject: [PATCH] Bug 702582, CVE 2020-15900 Memory Corruption in Ghostscript
+ 9.52
+
+Fix the 'rsearch' calculation for the 'post' size to give the correct
+size.  Previous calculation would result in a size that was too large,
+and could underflow to max uint32_t. Also fix 'rsearch' to return the
+correct 'pre' string with empty string match.
+
+A future change may 'undefine' this undocumented, non-standard operator
+during initialization as we do with the many other non-standard internal
+PostScript operators and procedures.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=5d499272b95a6b890a1397e11d20937de000d31b]
+CVE: CVE-2020-15900
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ psi/zstring.c | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/psi/zstring.c b/psi/zstring.c
+index 33662dafa..58e1af2b3 100644
+--- a/psi/zstring.c
++++ b/psi/zstring.c
+@@ -142,13 +142,18 @@ search_impl(i_ctx_t *i_ctx_p, bool forward)
+     return 0;
+ found:
+     op->tas.type_attrs = op1->tas.type_attrs;
+-    op->value.bytes = ptr;
+-    r_set_size(op, size);
++    op->value.bytes = ptr;				/* match */
++    op->tas.rsize = size;				/* match */
+     push(2);
+-    op[-1] = *op1;
+-    r_set_size(op - 1, ptr - op[-1].value.bytes);
+-    op1->value.bytes = ptr + size;
+-    r_set_size(op1, count + (!forward ? (size - 1) : 0));
++    op[-1] = *op1;					/* pre */
++    op[-3].value.bytes = ptr + size;			/* post */
++    if (forward) {
++        op[-1].tas.rsize = ptr - op[-1].value.bytes;	/* pre */
++        op[-3].tas.rsize = count;			/* post */
++    } else {
++        op[-1].tas.rsize = count;			/* pre */
++        op[-3].tas.rsize -= count + size;		/* post */
++    }
+     make_true(op);
+     return 0;
+ }
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.50.bb b/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
index 39c32644db..662db72b5e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.50.bb
@@ -26,6 +26,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
                 file://CVE-2019-14869-0001.patch \
+                file://CVE-2020-15900.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.17.1

