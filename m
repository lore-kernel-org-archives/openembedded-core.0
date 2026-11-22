Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37009.1795368059502108897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 09:20:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Un5GNdD/;
 spf=pass (domain: konsulko.com, ip: 209.85.210.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so1687801b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 09:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795368059; x=1795972859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zW2QSLTO3HixxTSEHytdP5WJb4nwOivpePOwKuOH4c=;
        b=Un5GNdD/UDhQ7EZToFj97o4+Tcufe8UOrcIqEm8sKe84RWEzCQBEaSyw4FYVfnHG41
         aPoYltTpWlO3+s7md6GSldxwja0Y1MMR4CFUzWXky2RDdvc+/2YK7n6T+4LWE40Byalp
         x3opU5NLcJu61j18+KSbIzryxhGkLrZu2kiaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368059; x=1795972859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zW2QSLTO3HixxTSEHytdP5WJb4nwOivpePOwKuOH4c=;
        b=2OxL1q1UmlruHLA1k30NtDOiFtzUL4F7ut1OhQCw/DGFBhm2/IOMnaOTm4tJSzSm3A
         lqEDgTX123R3/sUF21HUkPsswwsL2SSn3IjiOPCkYw0AzwiBlPs5QfQWifGwLmo6DlrC
         MYmh1d9fmUmoLGnvktGiwyghDQv+fj4uNNLJ4lDYLmEaJ9kuiBZwiUyjKlx4eu6eeRqT
         JrKC5anRMs2SLzxn2BvVsmoMfd2qK+SEgRYRJXtcf/CA95UL43jEA1an4hnWr7fEnshO
         khWsmBhWVLn3Jp+5Q295oWZIaU2n1nv29qUNYu5Me1Nv9/rbZgaU91mP9+Wy/lSKrNbj
         fq9Q==
X-Gm-Message-State: APuU4Z93O//x8f+7raaHogJit/REgvwaogEsAzca/GRmrun+xhsuAVet
	rdQw8yaplTcmKTWqgT9gyjLQSYwErG6wk+yfDvy/kpA/0xQZ/vMEYYr6sHRpq14L4B09valVDCC
	y0Aad
X-Gm-Gg: AZFdTZeASN2B+DswCyxatIlpwjOQFbvgNcTbvWH+eeA8OP/sFIvh+OA7ZGUj3JFY60Q
	imOdJ2KH3CaU9pADIHhuOWhfavqa/i01W1rbVgtkMqWu5Q3CZ1k90seqlOfWn2hAu3H69FdUnf7
	2iOSFw0s3zHKIWD9KA303xzVNEELTUkNRMIRnMHrFPojnguW6qKVg322U8KKbRAKu1BrTNMY9Fn
	wsfFy5z62basQEI0+2Ys65R7vSNzpgcwPjClZGvNPfd0Z3eR0zaA1z5upCwQ1dp+NxB3qq0sl2V
	PsmJvKc8y/SL+7YcE2BEWlVS88mLyHwQzLJ3dM48Y/Fu1+eywk5h3VbgcDrtiWws4MGam8Vh2ed
	i68iG2lB0KzpK/VOHDCZv64Y2LEZQUdXH7gFr75MJpV2yuMdNOh5IzWadwU/eRXDfrXk5kRl9Gb
	3wHE2UPY4l5/+UI534EEs38Nm3oyRw+8xN/SNrgQt3sPTgf807T2vhwt4gEr3Vc5IZDPj+oftND
	5EheCoEIZO2S6tAkfqCIA2zMy/E5drO1iQM30rVM9QDpIqEFnwB4QbF7qPWLrADEvMh8VmUcesx
	X4CWjsauxm6BdGkzDzeQXmEgwg2bAyjmtIF+8rpWOzFqkc9H43e0toWQ8/sEGJiP9g1l0lhoaka
	F323LklGuvPyTXMpeGQmyCF3qpk4=
X-Received: by 2002:aa7:9312:0:b0:8b1:e8dc:c8a1 with SMTP id d2e1a72fcca58-8c87bcbd110mr8318585b3a.22.1795368058790;
        Sun, 22 Nov 2026 09:20:58 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:6b04:91fb:ab00:ec51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm4136971b3a.11.2026.11.22.09.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:20:58 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 3/3] python3-wcwidth: upgrade 0.9.4 -> 0.9.5
Date: Sun, 22 Nov 2026 09:20:47 -0800
Message-ID: <20261122172047.2161662-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122172047.2161662-1-tim.orling@konsulko.com>
References: <20261122172047.2161662-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 17:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250873
Content-Type: text/plain; charset="utf-8"

0.9.5 adds UAX #14 line breaking (iter_line_breaks() and
wcwidth_linebreak_breaks_u32() in libwcwidth), and wrap() now breaks
lines that way by default; pass line_break='ascii' for the previous
textwrap.wrap() behaviour. It also fixes several clip() and wrap() SGR
and OSC 8 handling bugs and a libwcwidth crash on allocation failure.

https://github.com/jquast/wcwidth/blob/0.9.5/docs/history.rst
CompareLog: https://github.com/jquast/wcwidth/compare/0.9.4...0.9.5

Tested with core-image-ptest-python3-wcwidth on qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-wcwidth_0.9.4.bb => python3-wcwidth_0.9.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.9.4.bb => python3-wcwidth_0.9.5.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb b/meta/recipes-devtools/python/python3-wcwidth_0.9.5.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.9.5.bb
index 6deefa0467..78a20373df 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.9.4.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.9.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "fd8d57d3cdfe570e3265c8fab1885c24e34ef40889c0759c0c304a19e9835954"
+SRC_URI[sha256sum] = "713534e2ecb16e0fc39f19e0a5dda997da76d010953e9e8f803e7971f8accd80"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3

