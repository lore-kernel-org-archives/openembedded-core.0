Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9690.1793273595198389698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 04:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rluRHOse;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: vinicius.eduardo.pedrosa@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93ead211f14so67786685a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 04:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793273594; x=1793878394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G81UHrxXrN2nmRrrxv6b1XQb/3dubVhPgkr713+nFUw=;
        b=rluRHOsebJoW2Ye/4iISgqWtNciMSmldmuI2bsp8u/8SJSgtRfulmAfIY9mGEbFgvb
         VMNF3SljFNC005F0lJ3CIvc0t5FcnEl5gVNx55+S2e32MOA3A4k92HeJHUi8KmfAgT0F
         1LA1216G8zhGVVqPJH4yKJ6eRxyRlXGBvSjAarfelrKN2kKWiODSgw8o4Svlc+EFSzNn
         oKCa+0lOysJUjH8NNF4rpqK7zHK5NzDkR6DUTHzMCeey7iZSZ2y2s11P8WSDFyMCadvV
         Co8uORla1ujLn/mGm4cFZYk8Qz5RG1IKZk2HMoNKZBIqK0oBVtzb4JIUL5I1e7zaSXv0
         0erQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273594; x=1793878394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G81UHrxXrN2nmRrrxv6b1XQb/3dubVhPgkr713+nFUw=;
        b=VBlGrGjhOlxqPVjuJNVv/VP+nJ01XJCfyat+Fr8tgBVmOhA93vA6DrhXE1jO83gxln
         az7ADnfMvTUEK0OSCBZUx0KAv1DlrQ91d6HiiRAgCrNrrSURIA15SDT9KLrhEvpJ1LtC
         npJf4bWKV4LOWHIN4atvGJ5voJZ79eVG+/oza1nsQiLpBLG1VGwY0+IyzOST26e4mofk
         +qA704PyPOokWxvRcRu+SnL9mf0l3B6hNmuhFAkSzX/6G84wWnH4LjS0j0DkRRSqWMyL
         9wQWhhdL55CDT336NyisjIvnl9s8h2f3AER7zRkogMEe9/Ji/cY+Pnubk9Jk89Qa2Jfw
         wwJw==
X-Gm-Message-State: AFq9FYLHsvX+WHxLlUzPyo3impP6cLylztpvlzW2rOTiNA9iSCjqC1Iw
	p0vMnKu+YGNRxSejYFXfMmFhq7Mn8Gz6tx2W4it8IG64DQ2kKXoIqiaLYNS/7aEoy/cE3g==
X-Gm-Gg: AYBFou1rgslDJb5rFIu2cHhQGHtDHV6NqrKl+0wFUCH7BMhKVBywSvfvEwrB4aPHtqt
	C6HgKOSIE9TjOreE+5uJO7/gGK0e/LQqV3V/ne6udY++3DmBBUIk670UgUXPfghdJ4wfxKQ99hV
	POxf2Rq8o7MRH1kNm54hddf9GMIQQU9IcG7BEINO5LDPEbswQxnvcEE5yhE0LYpvu1XberpdAJs
	CKImyqKUJH0wIE1Lr3HJkD8pUq1Wn2e/VmiuY51fqdOZJT0YQZ/gwqS+AUkWR0x9gs2dwGpqgfI
	FAQQ5vmcw8LSDaqU623iZBOr4epJtlGVaBkf2jrGCwAb5Lq6PwNXWyQ7cXJuIkWSvRc/F1DiYqe
	3susToLmdBV5H6dubTRUPBnF7nQJMh7O+BZ4wKjobUd92wFyAtqDp8xk7WDjA1ii7eVzzJjEEpQ
	Ks4MFbxDYURC3OimM1QA6F/OCDAQCbSukFvFTUTsdcGLStiaLjuAwuA+fgiidgcc+Fz3M+CYcib
	IwmEmCOofVSb/W4FTLYt+/Sxz0+hGYII4WGX6n2b1FW9rwIBBlhkFdGgbexDW6E87IoiUEDFyl2
	G3uMc8JX6Yt9TcDIGc1jrcktyB9V3fApvvD+aZ/x3c5h34W0Yl40t7W1aneMLeyMVrn4uQnOTpC
	DoDjrTswTMaXQ6/uVv9TysZJdKpb+5y+wgirDfUkxD4A26dEA2tMZssBowQ==
X-Received: by 2002:a05:6102:950:b0:7c2:b741:2391 with SMTP id ada2fe7eead31-7d0542f8019mr913428137.30.1793273109877;
        Thu, 29 Oct 2026 04:25:09 -0700 (PDT)
Return-Path: <vinicius.eduardo.pedrosa@gmail.com>
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9912dad26fcsm6678607241.11.2026.10.29.04.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:25:09 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH] yocto-check-layer: don't skip entries when dropping invalid layers
Date: Thu, 29 Oct 2026 08:24:43 -0300
Message-ID: <20261029112443.1734921-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 12:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248944
Content-Type: text/plain; charset="utf-8"

The "Detected layers" loop removes invalid entries from the list it's
iterating over. When two invalid layers are next to each other,
removing the first one skips the second.

A skipped entry without conf/layer.conf makes the dependency pass fail
with KeyError: 'collections'. A skipped BSP+DISTRO entry isn't
reported at all. If no other layer is left to test, the script exits 0.

Iterate over a copy of the list so every entry gets checked. Keep
removing from the original list, since dep_layers refers to that same
list when --dependency isn't used.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
Hit it on a layer that had a few subdirectories with an empty conf/ in
them.

Tested on master (fa83da7) with small synthetic layers, same tree and
command before/after:
- two adjacent dirs with an empty conf/: KeyError before; after, both
  get the "ignoring" line and the real layer is tested
- two adjacent BSP+DISTRO dirs only: exit 0 before, exit 1 after
- valid layer + one stray conf/ dir: same test results before/after

Applies to master-next too (offset 2), not tested there.

 scripts/yocto-check-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 8c8b4db..a580a8f 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -125,7 +125,7 @@ def main():
         return 1
 
     logger.info("Detected layers:")
-    for layer in layers:
+    for layer in layers[:]:
         if layer['type'] == LayerType.ERROR_BSP_DISTRO:
             logger.error("%s: Can't be DISTRO and BSP type at the same time."\
                      " Both conf/distro and conf/machine folders were found."\
-- 
2.43.0

