Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7326.1793264079888058519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VvepczeP;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so3483825c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 01:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264079; x=1793868879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wop2QJenn/5dkzZWsgWBFL9kmujbzXJdJjOsngzUhEM=;
        b=VvepczePibLOjbnyB1ekq0e+UpARZEPP2/MMPczPtImojOJ5+rTgBx12BfhNYt19gk
         ysGar0ePG2s1+CjmvONN+oNR69/LDq7ls8d5U2uSqOs9kAOxMfzA0+fAkSrk9eDR8GMH
         MHq0wlzaOKN50ua1ZY1BcPNEspEC89YJoSjHh+Tqppe3pXhXb6K5HmCQ0wE5ql6widhV
         578MjT/8EHVYLwroNxX5bPmljmEBLvOaHNPs/Gyiu3u7KB/Cn1G33gfMivT+gosL3ZYW
         AAR2zuyRHgeD5r3LfLp4Z/cQDbMwlIzmmFDIwHI5lH9iu3pES9osdcDE8YllDHaR9AcA
         3TAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264079; x=1793868879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wop2QJenn/5dkzZWsgWBFL9kmujbzXJdJjOsngzUhEM=;
        b=Lf2RtjNk7IM2sH5AsA9pruhRBRL5YMvdR3NfxR0hBHjWDWv28pdrG2lhBo4x8VCQAb
         Eq89npeYDnDtBcWGGCjxhgloOdPBMRbfGR5rSrAv0j/Zuo0IpZOgR/QRBPC+PGxbo50f
         UIOBtkzovbvf27SsOVBjR/nsDHLz/yaHSONkD9SeWKLQKLQwAvgFlHVkb2zotTlowwkX
         inrEmZMeEOLuD3dZQ7vWT/zUDedFTvOr5Pjdr0ldaTZyqXUmktn7g+l2tzjcszu49HHw
         2G5+HahCF0JC1yE90IBekASQ3YtPWr/1tRhvwlaeo/pc6hQy9wzc0PXzTTVmk8RSDitG
         ti3Q==
X-Gm-Message-State: AFq9FYKX0p/nNlHmBK6pRi4xi5KJ756VdEYyK0OQYUsOpP0sXZ1sl5ys
	zynuacfSV1jgguvgBDkO2xyGpxPSjOtrgG6Kf7fs5RXv3rGoM/fXmvbZIx9ZWA==
X-Gm-Gg: AYBFou2xoZyCAQd89aWJaHOGXHiRKbENIB6GM4tzk+d4BBIU2ppa9EmFApx1yrttntf
	kjQraMas6/CjOmkdLgKFfl9/KTKI8xi0mtIcCEsjEOoBG0DnzS2JSuAb1BNhvco7onckMFHvqun
	IQI6YKcsDnJGQD0QrVQsCJLlCNVz6MeGjaIjKtIT+KxEqd7qGwe4mr3HVow8YUPVywDtkFR1m/y
	J+OsEwuURoSzSEouZHJn9Tf53mNKeqUWo0gFyY9X7YiVB2eSwQV+QpDfHFIdV7YY/nCPuPapD2u
	JntEaZVD8R6wCWVG8/Qnu9da01zyGxKCo9svbZWVy/hS5OMHwuPDfCRleWPQq94J7nnSBt50rss
	OmS4DtGYLovOcvPvfcvOnATMdWmbDtsiN4GegzoiTwp15RplwYGAMC1qK1FGHHgyeKkvrB4yRzx
	nRX49eF2F8s7Ieu7cB/7J9T2AaWSzo5q8h/DbDnamSUPsvuPkxqDbgcCl+FLKbXDwUC2ARq6L2T
	zOUtDYj27EbMmFhP1YijVsr/CQEeRaPx1ViexnqbQFTC/IL2O5Xc+wmLINdEZk1tuBKuGEzS7cn
	Cxd9EaTq+hS0oSieDNX/tRINEVjw96tza18Pa7pm163wsFAxIE9bjkmLCXX5+w==
X-Received: by 2002:a05:7022:fd04:b0:16c:eaf1:335d with SMTP id a92af1059eb24-1a6ce2fea82mr7886082c88.30.1793264078940;
        Thu, 29 Oct 2026 01:54:38 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c81490csm15056178c88.8.2026.10.29.01.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:54:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/4] aspell: upgrade 0.60.8.2 -> 0.60.8.3
Date: Thu, 29 Oct 2026 21:54:28 +1300
Message-ID: <20261029085430.3491140-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029085430.3491140-1-ankur.tyagi85@gmail.com>
References: <20261029085430.3491140-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 08:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248915
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- Fix CVE-2026-75818, CVE-2026-75819, CVE-2026-75820 and CVE-2026-103658.
- Fix various other memory problems.
- Fix various typos in documentation.
- Remove unused MySpell example code.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} (93%)

diff --git a/meta/recipes-support/aspell/aspell_0.60.8.2.bb b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
similarity index 93%
rename from meta/recipes-support/aspell/aspell_0.60.8.2.bb
rename to meta/recipes-support/aspell/aspell_0.60.8.3.bb
index 60d3376678..d97958d83b 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.2.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.3.bb
@@ -14,7 +14,7 @@ LICENSE = "LGPL-2.0-only OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
-SRC_URI[sha256sum] = "57fe4863eae6048f72245a8575b44b718fb85ca14b9f8c0afc41b254dfd76919"
+SRC_URI[sha256sum] = "0534eae11132405120d11e46bf595bd5dd189bc124ba77a5dd6aae861b48a162"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses"
