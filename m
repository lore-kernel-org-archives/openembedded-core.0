Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.3342.1611009522239114322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fi39oY/j;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id g15so6529451pjd.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=unCh28hQ2AsQg3hpTt0dW/VCpoY9GUJdckUEaVIzq1E=;
        b=fi39oY/jrGyDMvgm9IyRmVKhSyfR3sNOXrty+HSxOQDVPdtV23aLpOO48Y800pXaHB
         /jQT8IxzJtfjDzJwzttrhBPtoxKUxgYGDPXokkzqM4Lhoka33dgZq2BBNAk1FPkR2rjB
         mQmYrn2XVpYqcpmou9RgTWD1Y28WHcQ1anPf+dR6nY7piGPZPtaq9GKEdeKabfy2kH0J
         4DPNFU9rU2C34GZKCiR5S1sCZ6rm76MongRbGni+JOewaEzPM+VPkOobEs8f8e4a0/OX
         LrLdqGhtqC0EzVm+OrY7EpYOWeDHMkamYzs9Z91PwKfE2yhp3YRpn4X3FQrAbpWtlNJ1
         33DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=unCh28hQ2AsQg3hpTt0dW/VCpoY9GUJdckUEaVIzq1E=;
        b=UaZaiu0p9tm7EaNNUG+YVEfH8eEiLBE3dlt0a3XP7VstEhsVOccWbrJdBDCKer5ucA
         QnBI8tKzpiUFVCqJE2Aox5oPCtweaxnw+4wOnaDcmJFdW8uqVcsXyudizDfYP05YyhmM
         qchlAzsSx2zlAUOzbM1iKoGl27Oksvo0jPxPbFx8ZKP2CvSWmfNJAb+kwM7Q939Zsybo
         Sxmy6ve+pIPPMh/sNu+nyBfB3ErR5kznNf4gF9BLY/7/wjGrH1J85aqvvWIJw46aaHbV
         khas7JlGiwArOAkqTxSDZF5BMZ00Hh5xK8bYBBQ4IJdRmskyyTj7Me1UiEPVNv9i0wUn
         YgWA==
X-Gm-Message-State: AOAM533NKZIWTAZa6LcuDwPAsTmc59My8u3mBj/tqbbEyPNEZx26nxc1
	7ywVbUUw0tzuZloDVlfRMjvZdFB2aGwn83IF3GQ=
X-Google-Smtp-Source: ABdhPJyDNAhScRkBt8ucgVD3a/VjfgISoYlpgsqUf4JS1eIM4UwCjcU/MVWwXNIEmhuv50noILy+Mg==
X-Received: by 2002:a17:902:9b90:b029:de:76e8:ee4b with SMTP id y16-20020a1709029b90b02900de76e8ee4bmr1402899plp.20.1611009521194;
        Mon, 18 Jan 2021 14:38:41 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.38.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:38:40 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/19] zip: whitelist CVE-2018-13410 and CVE-2018-13684
Date: Mon, 18 Jan 2021 12:36:26 -1000
Message-Id: <99dcdf7d0d5d44fb8ae58e0a17a08b8705291601.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Mikko Rapeli <mikko.rapeli@bmw.de>

https://nvd.nist.gov/vuln/detail/CVE-2018-13410 is disputed and
also Debian considers it not a vulnerability:

https://security-tracker.debian.org/tracker/CVE-2018-13410

http://seclists.org/fulldisclosure/2018/Jul/24
"Negligible security impact, would involve that a untrusted party controls the -TT value."

https://nvd.nist.gov/vuln/detail/CVE-2018-13684 is not for zip, also Debian concludes this:

https://security-tracker.debian.org/tracker/CVE-2018-13684

"NOT-FOR-US: smart contract implementation for ZIP"

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 06b72a91b6dcf63fed437fd2105c59e922ba6525)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/zip/zip_3.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index c00a932763..97e5e57533 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -19,6 +19,12 @@ UPSTREAM_VERSION_UNKNOWN = "1"
 SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
 SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
 
+# Disputed and also Debian doesn't consider a vulnerability
+CVE_CHECK_WHITELIST += "CVE-2018-13410"
+
+# Not for zip but for smart contract implementation for it
+CVE_CHECK_WHITELIST += "CVE-2018-13684"
+
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
 # whatever we set.
-- 
2.17.1

