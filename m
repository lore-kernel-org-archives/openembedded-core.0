Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.9691.1605209307451586883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 11:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PT5t4RPe;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: toertel@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id me8so9694380ejb.10
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 11:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F/eNs5zd+ZByIKcM8H8Ic0bPqHW7RrchC3P4d+X0CAc=;
        b=PT5t4RPe0xuRMgNXDm8X64OxVnVfAySePloCK2bZkfjH/63gB4y07sWBX/LxaPhKF5
         T9l+Uq04PwxzDQpvgFW2kK3b5qehS1fKUVt7CbPVLb1OktK6hZUKY2PtJ719MCN70kHv
         9BhKJP3MCOQJUrW6uMh4W09C4cKl5EZMg284yGlibHVDMiq0xw3C+6Qylom0QKcKknoc
         ETujOBVQuMrKJRbubHTUb8Rsek6lO7+9ID5n8ReSYYbwPPs03Db5ocmaO+LJbI53I1XX
         79ZmTvDYHo9sa/k8Ro6beDIVJoB625zLmEOWK8bMT2ZrLyBoFH8zvU1mAGGc0Jlg9XGU
         c3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F/eNs5zd+ZByIKcM8H8Ic0bPqHW7RrchC3P4d+X0CAc=;
        b=dEyKtxaZ2eOE3U5cdi9DifSILxHdax2C7/SIVXbxdEtJKw6bYNBGj2QQ3n6lL5PryS
         rMYph3Jmurf9RZtI478lhQVMBxANegZdPNWvwTmcLhtUc8zlDQK4EiCIBcrz6IpqaVyS
         Dt4+UfCbpmvHEDXh2ccsj2dcNxfEP4D9gMwJArjXx6gIS3SZiQ/BJ4TpvF7zRO/PnaRa
         WJoIyUK2lOc+sIfFkxOfCDLNjMbAC4ywNFrWOxCqtrXd5rH2I17rCb3CSC+qdZOObZpH
         jTbdVVZIGIz7Ncq7fkPdtUGeFJs0e/k6lflJW4ud6w56jFlHtMg9GRYbjDQL2WjAoxwD
         vZvA==
X-Gm-Message-State: AOAM5332TEkmgPowhixAmB/4vsHjZWhs2bR6cnFp8R85Zevc0lnsTgxl
	yGOuvbiRnmM/kbSRxSIiGa44J8DGEhiNSA==
X-Google-Smtp-Source: ABdhPJzsDeI+SCOp2QR2hVmFqMFluAq8qCI4s0akdmjCakE9gKJqez0yJNGFhLrB8SJzQTtn7C8qNQ==
X-Received: by 2002:a17:906:dbf4:: with SMTP id yd20mr827043ejb.53.1605209305566;
        Thu, 12 Nov 2020 11:28:25 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf4e5c00d9e6f0ec6881550c.dip0.t-ipconnect.de. [2003:cf:af4e:5c00:d9e6:f0ec:6881:550c])
        by smtp.gmail.com with ESMTPSA id cn8sm2788797edb.18.2020.11.12.11.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 11:28:25 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [PATCH] libbsd: Remove BSD-4-Clause from main package
Date: Thu, 12 Nov 2020 20:28:10 +0100
Message-Id: <20201112192810.16521-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libbsd contains a multitude of licenses. For (commercial) projects the
3rd clause of the BSD-4-Clause license can be problematic. But only a
few man pages use this license. This means that the main package
containing the binary library itself is not under BSD-4-Clause ruling.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta/recipes-support/libbsd/libbsd_0.10.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libbsd/libbsd_0.10.0.bb b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
index 3b9ac5a01f..5b32b9af41 100644
--- a/meta/recipes-support/libbsd/libbsd_0.10.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
@@ -27,7 +27,8 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: ISC-Original
 # License: public-domain
 # License: public-domain-Colin-Plumb
-LICENSE = "BSD-4-Clause & ISC & PD"
+LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
+LICENSE_${PN} = "BSD-3-Clause & ISC & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2120be0173469a06ed185b688e0e1ae0"
 SECTION = "libs"
 
-- 
2.25.1

