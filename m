Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871F5D2A000
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 12:52:14 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9201.1768395133119478946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 04:52:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=a4XSiNDx;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3014; q=dns/txt;
  s=iport01; t=1768395133; x=1769604733;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+FLnAYzwOroC2t00ch6RUop9QfuYxQJ3kSHoYyQP3h0=;
  b=a4XSiNDxYS2NdNWlBd2BbSEQwiO8uQsRi3ZVyltbIftSoj1daeriExQA
   5vBELbOta3ga/kp8UTY4FZ71lbOr5/f45HGEivW3wUb62DPKtkCPl9q3F
   U/7mVsoIuiA+xS59hfBBRBOZBX4F30jzeBPee0v4G/0SPiXinpOhDpf1g
   9eRUzWT2B4DrjA703oI66hva5fFQo9a7ZQGdAzmHucQUpV0C1trgS9OSt
   qCUrujq15uWvNN+mQ+GBK3SJU38OhSA/pdaXG4pTcGSGsELtZ73uoZ3qw
   0smbsDegSIwAox33xI/53n/XyKOY860DER9F5dUt4hAtwQxJS+18zje+a
   A==;
X-CSE-ConnectionGUID: mBUzFxs/QqyMZrdt+au7IQ==
X-CSE-MsgGUID: l5g/QrZGSmSaq110s/n+oQ==
X-IPAS-Result: =?us-ascii?q?A0DcAwDyj2dp/5P/Ja1aglmCSIEAX0JJlkuLd5ImgX8PA?=
 =?us-ascii?q?QEBDzEgBAEBhQeMbwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GXSEVAUaBDESDAgGCcwIBrDOCLIEBhHzZQYFkCxQBgTiNU?=
 =?us-ascii?q?nGEeCcbgUlEhH2CYQKBOHWFdwSDMIJ8kR5IgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQobBwWBWQaIfQ+KOT0DCxgNSBEsNxQbBD5uB48igiVGB3sED?=
 =?us-ascii?q?yyBGJRLAUSPV4IhoQ6EJoRwhy6VOhozhVulEC6YWIs2mSOEaIFoPIFZcBWDI?=
 =?us-ascii?q?glJGQ+SIYVkujQiNTwCBwsBAQMJkWuBfAEB?=
IronPort-Data: A9a23:0u8Oqq+sdRQatRGZ5q3HDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jYaCzvQbvvZM2KkKo0nO4rnoR4CvsDTn4BmTAFkpSBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mryyHjEAX9gWAsaztIs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kzF7AK1PZsRlhX5
 NkqMjwRLRme2MOPlefTpulE3qzPLeHxN48Z/3UlxjbDALN/GdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0In1lQ/UPrSmM+vgXP+bzpEs3qepLE85C7YywkZPL3FbIaII4LaH5gL9qqej
 mab8CPAGCM1D9mkwCPcqyq3wemMmhquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:AIalz645nqc+XHMrvwPXwMPXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: 9a23:FlCUeWwkx4BHEVprjqc8BgURMP03XG3Gi07JMmqKE2p1C7SIFn6prfY=
X-Talos-MUID: 9a23:21zsGQqDOOxxbNR6rUcezzU/O4BR+ZaBM0U2mIxf4pGfciozPA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,225,1763424000"; 
   d="scan'208";a="445168256"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 Jan 2026 12:52:12 +0000
Received: from sjc-ads-1437.cisco.com (sjc-ads-1437.cisco.com [171.70.59.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 2469A18000244;
	Wed, 14 Jan 2026 12:52:12 +0000 (GMT)
Received: by sjc-ads-1437.cisco.com (Postfix, from userid 500841)
	id C433CCC8CBA; Wed, 14 Jan 2026 04:52:09 -0800 (PST)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH V2] patch.py: add checks for patch_path
Date: Wed, 14 Jan 2026 04:52:07 -0800
Message-Id: <20260114125207.497436-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.59.129, sjc-ads-1437.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 12:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229324

All URLs from SRC checked to be a patch.
In some rare cases, when we have "diff" or
"patch" into URL it is treated as a patch not
like proper resource (e.g. repository). This
happens in case of using mirrors. Without
pre-downloaded repository archive we have
directory into downloads and exit from
patch_path before checking for patch/diff.

Let's limit patch_path call for url's that
has "apply" parameter set or has original
extensions .diff or .patch.

Error example for this URL:
git://github.com/pkg/diff;name=diff;\
destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https

ERROR: nativesdk-yq-4.30.8+gitdd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1-r0 do_patch: \
Importing patch 'github.com.pkg.diff' with striplevel '1'
FileNotFoundError(2, 'No such file or directory')

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta/lib/oe/patch.py | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 246fc6221f..c5d09a399f 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -884,6 +884,33 @@ class UserResolver(Resolver):
         finally:
             os.chdir(olddir)
 
+def is_archive_extension(ext):
+    return ext in ('.gz', '.bz2', '.xz', '.Z')
+
+def is_patch_extension(ext):
+    return ext in ('.diff', '.patch')
+
+def could_be_patch(url):
+    """
+    URI could be treated as patch if:
+    - any resource with parameter apply set to yes/true
+    - any resource without parameter apply explicitly set, but let's limit them to ones with
+      extension .patch or .diff
+    """
+    (_, _, path, _, _, parm) = bb.fetch.decodeurl(url)
+
+    if "apply" in parm:
+        apply = oe.types.boolean(parm["apply"])
+        if apply:
+            return True
+
+    base, ext = os.path.splitext(path)
+    if is_archive_extension(ext):
+        _, ext = os.path.splitext(base)
+    if is_patch_extension(ext):
+       return True
+
+    return False
 
 def patch_path(url, fetch, unpackdir, expand=True):
     """Return the local path of a patch, or return nothing if this isn't a patch"""
@@ -892,7 +919,7 @@ def patch_path(url, fetch, unpackdir, expand=True):
     if os.path.isdir(local):
         return
     base, ext = os.path.splitext(os.path.basename(local))
-    if ext in ('.gz', '.bz2', '.xz', '.Z'):
+    if is_archive_extension(ext):
         if expand:
             local = os.path.join(unpackdir, base)
         ext = os.path.splitext(base)[1]
@@ -902,7 +929,7 @@ def patch_path(url, fetch, unpackdir, expand=True):
         apply = oe.types.boolean(urldata.parm["apply"])
         if not apply:
             return
-    elif ext not in (".diff", ".patch"):
+    elif not is_patch_extension(ext):
         return
 
     return local
@@ -913,7 +940,9 @@ def src_patches(d, all=False, expand=True):
     patches = []
     sources = []
     for url in fetch.urls:
-        local = patch_path(url, fetch, unpackdir, expand)
+        local = None
+        if could_be_patch(url):
+            local = patch_path(url, fetch, unpackdir, expand)
         if not local:
             if all:
                 local = fetch.localpath(url)
-- 
2.35.6


