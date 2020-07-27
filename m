Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.57874.1595862617829874033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=e2ZFdN49;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id t15so9578755pjq.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ro27sdPry2I0r0Kwl7Tt07HHGhuqb5fLFZrckgPGz0s=;
        b=e2ZFdN49W73TpaLx+TONr1KgeqfBDNVfyT2QyOMuae5UpF+X4wPuoNm6gcwP2JW3T9
         jn9PZPt7sShUjulLdyM8hYnYeaOcB5zQk5nOu6AfwnX2aRG3mnldVZmM1qmYBukOAetj
         MEPcUd+keE337YV3/CytPl1G/KrM/6nD4n6TTekjRjNZSW8/zP70dHnehhaEGlj52noe
         sCSlGB7n6pTPKNlFKdUOp1tmaQucPVPdGzsN1W/kPf+A7c5Ryv6f6xltBx6cTd0MaJ7P
         IotN5BnG8h8grs2bHM0bwNY8xLhTjiwSIvnWe7e34CJnj48gcawamkPQFAVgnQbvMD4C
         E5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ro27sdPry2I0r0Kwl7Tt07HHGhuqb5fLFZrckgPGz0s=;
        b=WdtKd6LIMKTTWyBrs/js75Q4mdjPecyPGWRke0DjgGcOfeON/9iVekyPYbZS6kjvIL
         jefBuHpH2EMBY4XSpfCJpkBma2LIb2vO95/rQBnHNzHq5yaBWBDm2jMjfcOnWgsuJsyb
         DRBjmk0cS/6opREiX5QXN9kxWM3TAeRV5yGIkgg+pXRFDQLiL7NiESmIUcEl7V6Ow2SE
         7TsECPunZwkEx0AOw1oax7wQz3RRyThTpXJjoWvmXq/RZ1J59tpgB02Zyv0YKRJ7iFZr
         RlrHGMOrn2KWF5jj9Rs67tVAri3YvOUhw2F1eEdDUZfLWj1W54c4PQ3iFICe4GC4uttr
         lQeA==
X-Gm-Message-State: AOAM533AimgQIUoh/uXe+N7JFifEgb8r03DXEayDml+/QvdnQ2yRF4WW
	K9OGKtQRsblqbZMNv9Oj3Sm7Z+CS/GY=
X-Google-Smtp-Source: ABdhPJy35z7Bs/49KD2Da0yODvuhnjwqhZTzBUy2P88lFDFYetdHB4VmFsiGoBpcqfz3YpkQtuPuaw==
X-Received: by 2002:a17:902:9a07:: with SMTP id v7mr19362135plp.312.1595862616801;
        Mon, 27 Jul 2020 08:10:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/18] wic/filemap: Drop the unused get_unmapped_ranges()
Date: Mon, 27 Jul 2020 05:09:41 -1000
Message-Id: <19078f9540c455ccddb6f2986b96562a8186ec35.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Kevin Hao <kexin.hao@windriver.com>

This method is not used by any code, so drop it.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6513fd9302b9989f97fc9d95e76e06ad5d266774)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/filemap.py | 38 ++------------------------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/scripts/lib/wic/filemap.py b/scripts/lib/wic/filemap.py
index 8cfed5afa8..f8c6e09d01 100644
--- a/scripts/lib/wic/filemap.py
+++ b/scripts/lib/wic/filemap.py
@@ -155,15 +155,6 @@ class _FilemapBase(object):
 
         raise Error("the method is not implemented")
 
-    def get_unmapped_ranges(self, start, count): # pylint: disable=W0613,R0201
-        """
-        This method has has to be implemented by child classes. Just like
-        'get_mapped_ranges()', but yields unmapped block ranges instead
-        (holes).
-        """
-
-        raise Error("the method is not implemented")
-
 
 # The 'SEEK_HOLE' and 'SEEK_DATA' options of the file seek system call
 _SEEK_DATA = 3
@@ -258,9 +249,8 @@ class FilemapSeek(_FilemapBase):
 
     def _get_ranges(self, start, count, whence1, whence2):
         """
-        This function implements 'get_mapped_ranges()' and
-        'get_unmapped_ranges()' depending on what is passed in the 'whence1'
-        and 'whence2' arguments.
+        This function implements 'get_mapped_ranges()' depending
+        on what is passed in the 'whence1' and 'whence2' arguments.
         """
 
         assert whence1 != whence2
@@ -290,12 +280,6 @@ class FilemapSeek(_FilemapBase):
                         % (start, count, start + count - 1))
         return self._get_ranges(start, count, _SEEK_DATA, _SEEK_HOLE)
 
-    def get_unmapped_ranges(self, start, count):
-        """Refer the '_FilemapBase' class for the documentation."""
-        self._log.debug("FilemapSeek: get_unmapped_ranges(%d,  %d(%d))"
-                        % (start, count, start + count - 1))
-        return self._get_ranges(start, count, _SEEK_HOLE, _SEEK_DATA)
-
 
 # Below goes the FIEMAP ioctl implementation, which is not very readable
 # because it deals with the rather complex FIEMAP ioctl. To understand the
@@ -485,24 +469,6 @@ class FilemapFiemap(_FilemapBase):
                         % (first_prev, last_prev))
         yield (first_prev, last_prev)
 
-    def get_unmapped_ranges(self, start, count):
-        """Refer the '_FilemapBase' class for the documentation."""
-        self._log.debug("FilemapFiemap: get_unmapped_ranges(%d,  %d(%d))"
-                        % (start, count, start + count - 1))
-        hole_first = start
-        for first, last in self._do_get_mapped_ranges(start, count):
-            if first > hole_first:
-                self._log.debug("FilemapFiemap: yielding range (%d, %d)"
-                                % (hole_first, first - 1))
-                yield (hole_first, first - 1)
-
-            hole_first = last + 1
-
-        if hole_first < start + count:
-            self._log.debug("FilemapFiemap: yielding range (%d, %d)"
-                            % (hole_first, start + count - 1))
-            yield (hole_first, start + count - 1)
-
 def filemap(image, log=None):
     """
     Create and return an instance of a Filemap class - 'FilemapFiemap' or
-- 
2.17.1

