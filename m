Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.57661.1595862615116055244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RJLde+1I;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id o22so9579092pjw.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=N6vd4+erZx3vJbjCnMk2a69u72y1pTzMqlE6AuTVGFQ=;
        b=RJLde+1I2uokk5N39Ftbb/ODp2DTVAi9UZtzCRztfqwNPuk+EaE0WLXuDPICCaSURN
         +gL1CD1qgFVfnFnMEmYEz/O/WucxGTVN5M21brSE10/mlRfIQqu+nJ+E1X0EPC3/mVHb
         YbCJl+rrxe0dQnw5iF2ZGB0NbwlConJEMwZhbfc/3Cx4ZsN6lUDAF6h12nptleAn44wq
         spd0x2nJ2XO4LtBMwEr9pQn281sokRR5urEdgMaxZsN/9TBMNl67fktkvMCMFzbhfYOs
         vcH3fVnPTI/6Guusi2fdrLSlziVYdeGkIy6iOx7TZGKprl4lgCvo5UgUzOZkFgHzf+tO
         OrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=N6vd4+erZx3vJbjCnMk2a69u72y1pTzMqlE6AuTVGFQ=;
        b=gmyAOj833QR0NRUue0/wW0hiBbCn8Xo5qMFUUk4BByAK+/09atVcuwNKzuzD5+Wl6V
         NmzakPz9p/zAaC6K5OpgG3320OQ21zSRkHvXyAwdN6qO7OR/2lmJe9I5lvADZstG8FLs
         /sG13zzcUn5n0r5lx9iamhD/2EmeOa07+r2TniIJS6U5HvSK4HXsZ18MNitoB26PtCa5
         vy6/+7E/ZsgL/6aP1GJtWIYf1A0iYCPCC1DhaZ4gbljg7G16ooFUZIhrvLrhAGmE3zYi
         QoJsNQEqjFlBsQHSf4JKkG/2ro537FbAMA+6fxeoFy8rT3H4eqxYIWw8Foy8sLqzu/9G
         Iw6g==
X-Gm-Message-State: AOAM533H25pFGxriuaLgmU9aAPE/nUULjJaHU92K81xM5CtBcE4s+0wX
	TEcnE5hSkcft2VcCw4Cw4EJvCAZVbGY=
X-Google-Smtp-Source: ABdhPJwReVPbglw9L+d0rpnlgzM1gig1BSx1loB0nVqHsZSKdHL6qFZDO3b8Zka4mS6Awry5FIXYMQ==
X-Received: by 2002:a17:902:8d86:: with SMTP id v6mr19757140plo.200.1595862613968;
        Mon, 27 Jul 2020 08:10:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/18] wic/filemap: Drop the unused block_is_unmapped()
Date: Mon, 27 Jul 2020 05:09:40 -1000
Message-Id: <14cbfc04f4a9da5baba6267daefd54a12a04d56e.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Kevin Hao <kexin.hao@windriver.com>

This method is not used by any code, so drop it.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fb62a15349597ee026c67a0bb0a6ca2cc9bfe420)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/filemap.py | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index c53147c2f1..8cfed5afa8 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -142,15 +142,6 @@ class _FilemapBase(object):
 
         raise Error("the method is not implemented")
 
-    def block_is_unmapped(self, block): # pylint: disable=W0613,R0201
-        """
-        This method has has to be implemented by child classes. It returns
-        'True' if block number 'block' of the image file is not mapped (hole)
-        and 'False' otherwise.
-        """
-
-        raise Error("the method is not implemented")
-
     def get_mapped_ranges(self, start, count): # pylint: disable=W0613,R0201
         """
         This method has has to be implemented by child classes. This is a
@@ -265,10 +256,6 @@ class FilemapSeek(_FilemapBase):
                         % (block, result))
         return result
 
-    def block_is_unmapped(self, block):
-        """Refer the '_FilemapBase' class for the documentation."""
-        return not self.block_is_mapped(block)
-
     def _get_ranges(self, start, count, whence1, whence2):
         """
         This function implements 'get_mapped_ranges()' and
@@ -422,10 +409,6 @@ class FilemapFiemap(_FilemapBase):
                         % (block, result))
         return result
 
-    def block_is_unmapped(self, block):
-        """Refer the '_FilemapBase' class for the documentation."""
-        return not self.block_is_mapped(block)
-
     def _unpack_fiemap_extent(self, index):
         """
         Unpack a 'struct fiemap_extent' structure object number 'index' from
-- 
2.17.1

