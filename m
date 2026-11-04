Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4702.1793755556776881781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 17:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZYK8znuy;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso22876a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 17:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793755556; x=1794360356; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pT9iIDk2qgo2c5XgUH/aaRBCj3YqIsoUeUneFjNg+TA=;
        b=ZYK8znuymjglRVawcISOPsYoTbEeTTHCvCb5lyeCV/MTtcCaCV2IpbrHOjVqtktjVQ
         oTGceX6918igJaSZLXmPMnkoSMB/UqXQed7KYqR4rbf5Hnf5PA2h/mIFG0mm8B8a0AL4
         9x37i9OSdI80GwkfSxcue11rXZEvazx8Q5R0pBKNLQUt7MT9bfewKhQFdzUvdE5jWwZ8
         ET5EaTBTBz2zY9GKxQBLxzZwMW52IqvA0rlwmzdgnzojs1vESwk/LVXPN2v/ObgenKpV
         +weLqnGRtPT2TaorABCLeCFo1IqlPJvvpp1Lub1X6Rtd+6hHPb8hQSEztarpvs4Xpxo8
         4yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755556; x=1794360356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pT9iIDk2qgo2c5XgUH/aaRBCj3YqIsoUeUneFjNg+TA=;
        b=eU/unm6J+jqvS5v9fgJsdDEyqZBhudwq4IF7TtxMqd79MnQHJppWA+wWhrpHd0eqJy
         OXW1hpGRtUIYT/5knW/lR5GMHy59Fqq4MNmn2+O21ss3qtX+6U6bgDlPvNImZe1zRBKZ
         l8nLRqeq4fmQlR+9TvDybe96lpk1m82XNN0pQviuWUfZQL3k4vziT0YJwyalGFiVspAu
         gL0nYCiv2XwIxgzzpxWw2D1GCpNdmZxTCoqZRqLrEtE71b7DyZChYvkxJ0uaYLJjaM1j
         dneRegamZzfX5+VYLGD9jzR7Y5lUgWnpczGOmgIBfBEVrlQ2Cgfaze4yBoZ9Not/46wo
         Zgrw==
X-Gm-Message-State: APuU4Z+59hCey7DpChDRBMUbRARqH7kVGdt+mInPpZlf9QWULh3hZ4O2
	jVyzqwqhWAPSeHD5QDx8j7978l2rRDfGuuZLpx7NwE6Pdsp0Fv6ZDjwTISSSog==
X-Gm-Gg: AYBFou2ROF+G+Mv7OKtregJaywToPRTCDJbmAuGKlTaGeofbhKvSZg30hGoQftC7KlE
	/9bO0g1Py4E6no3jtMHd8/dvrTg0cLoEusmKbk8iOL50IWM35tTwmn9o3AD56IM4vhmy4LcOuIO
	LUM4nyI9lG7FH5ru4iFQtX/AXGAvzxUutWUaWeMlJdB51uC9egfGMAG805PrHnKdRBJJkx9p1yP
	XOY5ZaryLRXrocPGns2VittZ56qIJOM6HLGljTTg66maBJsLF8qbihW+NAqvDF3WfaLdfMGnC+L
	rsPau7052dYlpoU5jRNZeMDiG96wTwxLSBrw/HcznuyJLwP36EqSVXx8TrSZBeL49mGJF3nNKks
	xZK2QPFOgfgonklGTJ+RuhiZaYQe0vl0zyGX8PPjUrBC/SR5tFVvQoLD8hwnKiLvIMMvrf5iEWy
	hYaAlgAEVrLfBcP6Meij7GQSCRlSmk2GAqLthSU0Fpv8Ec4TJWokBgzc39X4Huq+vc8OEDjDCJn
	JjGg3wAdEeioxts1eTntdbLeMXSibb7Ob3nrwc3+AW5THYzVD0vtMbMg+8xF+QkhufHuncbc0Av
	1xX8QR5DMg1/BJOM/iGyWFA44t+096OrPmkf2HDPtTSGK0iIuk10NOe/y/DB3Q==
X-Received: by 2002:a17:90b:3b47:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3ae8980dccamr13211942a91.33.1793755556020;
        Tue, 03 Nov 2026 17:25:56 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b096b52911sm388556a91.3.2026.11.03.17.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:25:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][blacksail][PATCH 2/3] python3-sphinx: update 9.1.0 -> 9.1.1
Date: Wed,  4 Nov 2026 14:25:40 +1300
Message-ID: <20261104012541.1429500-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104012541.1429500-1-ankur.tyagi85@gmail.com>
References: <20261104012541.1429500-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 01:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249316
Content-Type: text/plain; charset="utf-8"

From: Antonin Godard <antonin.godard@bootlin.com>

Changelog:

- LaTeX: PDF build crash since LaTeX June 2026 release if tables are
  styled with 'colorrows' (which is the default). Patch by Jean-François
  B.
- Fix JavaScript search for languages whose stemmer class name does not
  match the language name, such as Chinese (which reuses the English
  stemmer) and Dutch (which uses the Dutch Porter stemmer). Patch by
  Hugo van Kemenade.
- Fixed support for Python 3.16 alpha 0 (changes in the enum module).
  Patch by Adam Turner.

Tested a buildtools-docs-tarball and an HTML documentation build with it
with no issues.

License-Update: only a year change from 2025 to 2026
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e20006a3eab7204427561cb9a5c6cb126ec0989f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-sphinx_9.1.0.bb => python3-sphinx_9.1.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_9.1.0.bb => python3-sphinx_9.1.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb b/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
rename to meta/recipes-devtools/python/python3-sphinx_9.1.1.bb
index dcf769724f..f0742ad8de 100644
--- a/meta/recipes-devtools/python/python3-sphinx_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.1.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause AND MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=00d5910f77dc7db0f754b71c3c11317b"
 
-SRC_URI[sha256sum] = "7741722357dd75f8190766926071fed3bdc211c74dd2d7d4df5404da95930ddb"
+SRC_URI[sha256sum] = "48b627f02908f22c601b3ba9c7b17265b4f315dd05c8bc64cd4da41183f44fbc"
 
 SRC_URI += "file://0001-Revert-singlehtml-deprecate-the-fix_refuris-helper-f.patch"
 
