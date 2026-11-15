Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4314.1794732535237309867
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V1TNgo0j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so24119925e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732533; x=1795337333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QYuaxLemdfL95X4//S4QM+6sgKs1Vr+z/ypcBf85GPM=;
        b=V1TNgo0jPrE/qhEqJstyCoG86+TCKO146Scr2YzsnXcmhXQF7iSSCTnASHN4jrJ3qy
         R///bxGDFplHZG1ffNSA/a6nH+OhkPmdER831mPN1ASjHgal4DSKRGftvsw45CbLReXk
         ETKRRomN/Q1z1FtMOqAg9+mFHJ0glcickqK9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732533; x=1795337333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QYuaxLemdfL95X4//S4QM+6sgKs1Vr+z/ypcBf85GPM=;
        b=clyC/5qhxtqDm9q2Uu4BSTOsOj6NcpjBsn5XN3tfnSSdd+iG1//yB9G58A2Sx/MYb2
         Fzaghpei+xa3hGeMA8ZzWQHgZL0wno0jjYrBw76OsKYr4cp9thhjOEvYarSPiWeGLw66
         5pcDvdGDzCDqUZBFFT/nzkumzMiV9Iex2+T01GjwoR3Y3WHXHN2NE5Bi9qWQKFfw5TEw
         bj6KalTQKUPG06sti8jqtHle5jx8uwcgltWu98pXvL/4huCsXWEKS+pd3FW/B/klrVl/
         ir0oc3xoMv4S8m/4UeoWmaZ4CiVNVrFVSC/PILGkhGLqGqf4Kq1xQa1ZmN+0qL6XHCGL
         nvRQ==
X-Gm-Message-State: APuU4Z+7EeGK3aqP3noUEEDHC3zWwnfsAEoO86Ar76FrIhoAwkLAmD6F
	Y8AXAGT1nsB2LohoPBQSKRxj5ExaCKs8QTwO4QWiO54lz3sgPxkxJMiP10WSjeITKpYVGQLJuro
	quctsWyU=
X-Gm-Gg: AYBFou2tYa2bPRIcUOiA+35/ciLqzDzWDx02H3FsY84JXg3xyHKwfP6MgbkKj6dWOja
	BrBB025kepy2oNWXGfJuMINKMM2/L5IrmHdhsD6muiqBn/cl64V4Cvpewu2TU1HHhmCtQWDp/af
	QDNBwV1DsDUuWh5DnI+5vGNyehKvlseG/z3YK0WhcWJIArrxSLaN+oQRBzpYQJQuQ+xvUCpoqLB
	KRD6fElQ8TG1ewAJpBDpYnkLWx11DcWxW/nWRPD4vrQlQXCzFmGe9j+f5uw5Swcg+xqc0KZPJ9c
	MH/x7OssXh/RCUw3bQaYEnO3IfzLwgwZU0Bhcsmgr5J7zGzsqHQ4FLRk8AGFfpd5HcpM0ydEAxE
	I7SEDJO9uji5Gyc+R0XfYHuThcR6b2BUCS2pxPcEmE4WleVxh8H7Lx8kv31hMH3EtFj/ElbpAhd
	TkM+F1dD3U+An4oyR0mEed+Atcvv8OSLjX5ImM2t5WBTEredF21qpfLH/wROoqyY40KAt4g8YW9
	KUljpfObr13cPSA9rBWQNo6F/RTGMhH78QadmYbIdUdpWebXeUbsoWy9av1s2zyS8WVtuY52Bqn
	IY6WDKTDdRsaRvYhhVUN9TTvga3LW7mT/NMwbkcBchNaEw5pZI+whWc9thw=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr202251625e9.2.1794732533132;
        Sun, 15 Nov 2026 00:48:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.48.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:48:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/41] oe-buildenv-internal: Correct minimum python version
Date: Sun, 15 Nov 2026 08:48:06 +0000
Message-ID: <20261115084845.701136-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250233
Content-Type: text/plain; charset="utf-8"

We have python 3.9 as the minimum version now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-buildenv-internal | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index 2fdb19565a0..58e300c0e92 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -32,12 +32,12 @@ fi
 # We potentially have code that doesn't parse correctly with older versions 
 # of Python, and rather than fixing that and being eternally vigilant for 
 # any other new feature use, just check the version here.
-py_v38_check=$(python3 -c 'import sys; print(sys.version_info >= (3,8,0))')
-if [ "$py_v38_check" != "True" ]; then
-    echo >&2 "BitBake requires Python 3.8.0 or later as 'python3' (scripts/install-buildtools can be used if needed)"
+py_v39_check=$(python3 -c 'import sys; print(sys.version_info >= (3,9,0))')
+if [ "$py_v39_check" != "True" ]; then
+    echo >&2 "BitBake requires Python 3.9.0 or later as 'python3' (scripts/install-buildtools can be used if needed)"
     return 1
 fi
-unset py_v38_check
+unset py_v39_check
 
 if [ -z "$BDIR" ]; then
     if [ -z "$1" ]; then
