Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7335.1793264081802344260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Q/kiRcra;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35829219da8so654018eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264081; x=1793868881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87zZyZ3uKosrTTUtnzpbthgcvtMaG38UhrVtt7MfSkc=;
        b=Q/kiRcra6Fvrr8933UyYuO5rnp/q1DlRHC+qHfMkNv0YGab1jPhjk469+N47d4YECB
         Zp0nXzpaVEfQ1yd/+Q3zXaAWXN0vzbETedt+IRCqVT7VNaz+T0m8pVLW9W0/ij7ECCC8
         LIIiFdxv4U4QzXIg6KooQ69Vpm+y9wtZD1r/kKv3zIz+op9r9FDPaW9SyTlRo2D2yt/X
         YfCumS4Uz/S8DALPo6oRyXvxXjJdXmy7ee5X/8KI/KlLnkTtDLNAEHLOPyxQRw4avjn0
         duUlVpiMehDywkNyAdOhTumat33n3FwrAAGBtoLha75K6rxcfCjw/3CTTNWqrt0rd72v
         5FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264081; x=1793868881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=87zZyZ3uKosrTTUtnzpbthgcvtMaG38UhrVtt7MfSkc=;
        b=q5Uz3D8LPWAZxCK0EDzw5TIVSEXTnFB3yxQrpt/79r+h+TCyyFjMYUAkzsbU5yUD+8
         HChMk5mnUutZCkDUUMsZ0STtsgJvRjuVPncKkE/TNKtEIIlzlZx7bV0M7JaHW83OPrjh
         jUl6EQQ0SQA2CPaIP44mWS8FHdXP12QTU94OK5InpMTywyWdfPz5LI5p9vQBH91pxday
         MqZX/WfiAY3aeXOD8ct9B+h7P55PcahfEGhVkbQQFg7y8UC75sjncBrVCZp+wRACLGA0
         if+sIQFovTlRt+VQ3742AaBeO7zcbMzMTC628aBZAT5Zzl8rRwFH5lOutE4lYRyFSEfM
         Kb+A==
X-Gm-Message-State: AFq9FYIkbk0135kPY8baqHUQqkBtbtO6N7TfTXRHHNSCyRiFXA0Un79G
	/crgstwmR2BWmNL5r2HmUvJVhNBupYbK3E2fs+jRezE1jOjalIy7ygWp1acOLg==
X-Gm-Gg: AYBFou2eg8DpXAULvUc1xwEu3CDCOV7DI//qIsQuk0ucnuoUHIK+wnmxVUWS8zbAu+q
	1hJm0WLoBRExe6bg5TjG/XohZX/g6PkEO4m4Ax7MSFdGJQbvC4oB/wx43lqiTt9+YXsepjxjbce
	kXIfJeS0+Pwwz2jWKaHdh0mV8cX+TVCsk0kSMIf+a6XTQbfJ30e0g2emaS7kF4dlXYuvfGgQmU0
	uXfba7qbQqvyEgjtejTJzAlO6nPNLb7Z0JsOEfy2Q1qiE8pDnPy54H5H8jotDEQsBCdiL+XtPL+
	jlUo8JD6NEPqbKWfBJtXmZFAkOn8f4jdjlzESjrGBAReDafFtIRk8OqRo1jhGezHWbwCWiNg9IV
	wWtAjJj7pSojIIfvE6S2dGdYG9OvWBSaXXTDr9PP0niWODkQqVtGqKu4F8ilj8rhwjJM7UObfWn
	fdeHyp1ci1uyx7KWq4khGoSKC6pnrFrYCj5AaQgMJyNW09bk4zH2CsaJi57rTCHTYeYlIpIgjRg
	s/fQyMTkKBdNp5YpsHe74ADDDzyNGsc0xhtzL0ipZxyDkhKLGlYpohjTSM3xtkE0cqQDxEAQAGf
	Cm9I95vJ1iulW2AEJudDflUD78F7KvtbiQGNHn+rPhy9TpLtVBv3ogXihBwEKw==
X-Received: by 2002:a05:7022:3801:b0:13c:f65c:d5b5 with SMTP id a92af1059eb24-1a9420e36b7mr2591675c88.3.1793264080728;
        Thu, 29 Oct 2026 01:54:40 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c81490csm15056178c88.8.2026.10.29.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:54:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 3/4] glib-networking: upgrade 2.90.0 -> 2.90.1
Date: Thu, 29 Oct 2026 21:54:29 +1300
Message-ID: <20261029085430.3491140-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029085430.3491140-1-ankur.tyagi85@gmail.com>
References: <20261029085430.3491140-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 08:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248916
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.gnome.org/GNOME/glib-networking/-/blob/2.90.1/NEWS?ref_type=tags

PTEST pass:

root@qemux86-64:~# ptest-runner glib-networking
START: ptest-runner
2026-10-29T08:47
BEGIN: /usr/lib/glib-networking/ptest
...
SUMMARY: total=4; passed=4; skipped=0; failed=0; user=5.5s; system=0.8s; maxrss=17408
DURATION: 9
END: /usr/lib/glib-networking/ptest
2026-10-29T08:47
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{glib-networking_2.90.0.bb => glib-networking_2.90.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.90.0.bb => glib-networking_2.90.1.bb} (95%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.90.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.90.1.bb
similarity index 95%
rename from meta/recipes-core/glib-networking/glib-networking_2.90.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.90.1.bb
index 1850712690..ca701cc89a 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.90.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.90.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "83a75e3d9c36b66ee86d3281c2fc997816101968a5126ba322b2acb9a74dd8c0"
+SRC_URI[archive.sha256sum] = "ea95636590098355a05e3027579dba1a9a950b05e456b2488ea03d82e4b6c18a"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
