Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5599.1794387843217832333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:04:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=STunBhWh;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso20232815e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387841; x=1794992641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xj6XdMSlRC3sM5M6MaSPjS6M+wbYOUhekz+7gfWsUpA=;
        b=STunBhWhP1kPxc6vZWb2Pz66ZClUQyUvFwDoMt1mo5Cr7ty2/YwY9KjQxpi5NntFQk
         dJAxN2VLmdVGjt1uz7rYM0DWIgrgk3iTRUPDxL3t6vqmYMrncSYOXocK0p4HQiGicrYX
         CUj3W+ddOP5OFNcHXd54Tt8JQcTRXXLOB2js8hZNhOQ/lU5e5ux8cCg2jIP//3tDqaz/
         6A0t0LTWvVMEUR1QRfTmpQ8V/hvfn14xCCOTPBncY08iraMEmNeDsuZX9LUG44xnfqhX
         /tubPWyGPbE7gaoK57A/eRFYsW94bSoIEuK4p0l0Eb145eacDc51By6m3tGh/UkLylpy
         D8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387841; x=1794992641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xj6XdMSlRC3sM5M6MaSPjS6M+wbYOUhekz+7gfWsUpA=;
        b=fLaPQ/IEAFitcL/xRSI4sEjiK2Gd/UGNwTkmsE9EI83whdGNSRZF3yTtdtRMbSdRD4
         m4pHdV3xbTXExwfygc0bCh6HntGrBJ9Km5ErbUBfVQA4wm4DzFuC76qtmCZYCmLXfA0R
         N+DL3zlNlKvlz2RMglRQXFLVz4IorrZJSu646pRZP6BC2OBq2ZKF0KPn4HNgyLAgmVQl
         wJ8atwJrXoSGPpE920tAygEMf7D7puvlC16Gs8fHx4niCBRK3wOA1VhrrgO+4nSwiclf
         qbJ5ZVseayLEOl2UTNOh/M9DnvISz0ORE+xla0mvvw8ALgwpWbliNoiU8xgNYgUhtrVM
         CGow==
X-Gm-Message-State: APuU4Z/leA63ctndtlKT4YhlFEGte/YuyoYlAK/X6QEhyeNVZ5w/Xvgx
	jtoEqUMGer/KLCk7AjUyp4Xh6FDt3EJPBpUOMWcCHniat2fEDUheVCldnBuOtVNT9KhWhA4YlQ+
	7bneWtNM=
X-Gm-Gg: AYBFou2L8zo+TDKF/MB8ze29pzVIUO0aXlmomB2Fk+FSWKLcsxJ0sjZiUtE+rHwPePP
	YkI7hQL8V5aMBhuilxnrNeLzqK5IvzqV1oQVG1Dn/nIQdBOWAFLkqv+5nIo4D3jWYQYhp+b32sv
	A4kNKhLmMwH0fawtkVO9RoXqGlFYX4ojzuK3pAfo/2+azOoFWhfVnNSKLaY1w3YMrGOvQ+L86yT
	EF5K6avreosFgssUCTn8ANgaLSDg7+tR5az29mbTk0Nt6OSXv0isCl/7FG1DVOEVu8fQXMswsgO
	NF3ub7oo6rkyQiphspjgEZe8Sv01CSdLBC1w7dnB952M8lEGH2wyPbz6R4SZvEdy6GLaAzUAKbI
	RnrLRv3zFmiaZR1Tz3zFS+1pMcNs45zqVaRJgZXZGIyP6kW99APkRGknHNwGp8qAD1icIJANhod
	mqOz+taBn7MOPgJ0tupzUagkPHqblhB3QWkRq5t5kpBqJsWwazEj6NVwsZLt75sFFnnb7nWLEYr
	+vC/oBCa4XjuHIoNx6Y83Tb8jsF5rQtnLLoh6pV1imSXH1ckvILEekjhUPO78jQ9/RSBZ/hhfPI
	yVeVN8cKHY/oHQ0sl9xgYJvCFjICaRAISS9WRt9SW+cvEBtiGCK1ISvBHuACi7ZA0JdU+7p3x/7
	odRB+M6WYVGVuMVavJpycEyFUUrsP
X-Received: by 2002:a05:600c:3b01:b0:4b7:6942:39be with SMTP id 5b1f17b1804b1-4ba0939b4c7mr28456985e9.24.1794387841399;
        Wed, 11 Nov 2026 01:04:01 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.04.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:04:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 34/35] scripts/install-buildtools: Update to 6.0.4
Date: Wed, 11 Nov 2026 10:03:00 +0100
Message-ID: <ff4b8e6bae327afbbdce4609fb272a993990d1fe.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250005
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 6.0.4 release of the 6.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index e1af05fca33..bc044f9b308 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-6.0.3'
-DEFAULT_INSTALLER_VERSION = '6.0.3'
+DEFAULT_RELEASE = 'yocto-6.0.4'
+DEFAULT_INSTALLER_VERSION = '6.0.4'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
