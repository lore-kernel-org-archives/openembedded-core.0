Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1475.1795801796225621800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ZMzI9Yu/;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dee593f18so7863545f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801794; x=1796406594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i9wn4CxAs9qBODWHL6pWrgczxc73Uwv5UdUpLtOU9Po=;
        b=ZMzI9Yu/CqTO136zF7h8hBJHDsTwywDfyusRJGibgFiyaR8YLfD2Y4oiafHPRhjKbK
         eWR7/4Rb/AKRlED98OXQWK0Nl8rXdE26BQIt+WRX1PvdZGq+LAmDqqUhUqr4dI2a8vlD
         8/WY5/czp4FLYitfngQy87gueeW0yHcwqcH++gu/IOonVw/XfPnQwvx/Jh9VbhScpSDi
         LEkdteWJGmPjUxFukqOQtryJHeknTArzXfzHj/37EDqKd5ziZ4bryoBP+uzVp5SZeuEP
         JzaIOrhnE/6OcMogdzTV5/dmp6ruLmZuTDa2PfECKgdKiu2a/tg2PBlq6NGI5FUNvt4m
         CbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801794; x=1796406594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i9wn4CxAs9qBODWHL6pWrgczxc73Uwv5UdUpLtOU9Po=;
        b=YIMvXqHQxQ0jwqD3O6xmSfpSROzKMuuMhEC7/9+oJ47b9BvgD6a1h2MKQbKUcWj9y/
         Vs57W/h0ApoDPIIOrWMWU4c3BcO1OBZboemR+PkDAZykZFqM7GolmVQlqUPQzsKUs7KT
         lUvskfYLFrSW8QONWpUY97eMFWBTqOT2KU8OSboF2D8HASpVW+4TgV6jZn2lV0N4an4u
         xGgItrZWxqDpOXYk28pwtpd4d+2yP1dKDD0e66D/rV1DEn8kD0lXM6UrVtvthorUeOQG
         RRsp9N1CLYBAM1ZXCi28Oa8Nig4CuNc6aPICuGvxB8kI7YYz4KbNfca1z8UNj7q2Mm8Z
         cLIw==
X-Gm-Message-State: APuU4Z+9aQmPMGv56t0f2aazdKk1Y3uXnSKNwUP8rwf/wJsQ/q52iANG
	hG4jAGkb3u6ihglFAS9/JIwzJSf3GFU0G2HdOKUhBTYx8wmXLd5d3cosiSHZRzC5kabdiiJtUzB
	kTM71aZc=
X-Gm-Gg: AZFdTZcFFLmHLJYHfS90RrYVp3FTIKhMMa992ih6PIPqW/gbbQZD4xrQfcQVCtIw/ce
	VNkf/FL84i2bbcDe0LXUvgIaXcUqbT/J+OAYMIVbiEE7KkYhQdoKSn0hQAlSHW3eFxO/MZUV6Fz
	ngyFxLeQ/FMnL5zNXkXsgbFlPg1VJJnYMXHIrMyvaKZHlcbv+fxyCrGVEYofsF3X6N8WTiWmXnn
	6Ks3e+tGs0K4ndUn1dedr+Llh2A9I8iIhAoW6rrCnUIAw81caOuGpLYIoCn9mybwyl1lsKjkESi
	qvs626uhSDw3+Sd6llWtbfj150rF4IboivU/yppY3eTh5EAmKgKdhOOCDGuWlng7juXwuULF1QT
	ml79ZLg1BgJBo6CGPmVIaP9IUvEwawktCTLZUqA7EEX26vvHSlMAt0LbJYHKTgMSGuoPF1Rvdmu
	LM1TfFntSAKgn6cEh/l77XQTlm1Ae7cTEmicIVzS/jyEA9KOOHgYUejdC3qYXfd3VmkA1lk+Lxz
	+vCbzulPzAtG13/3tt8EcaJy9PvA6mnf6DAaG+R4euixc5tgTgk2E+P2dKY/XUAhBiw6VvGFEQ6
	U6OCm3RBQfRtni8ZkPHGmUqW74rLkCepo7GF01d7OFTQ5ag/nUC/qskqV84V+t2izDMX5ML+d0V
	jxWiPoIRhtTwyUA2TBKGrcrtHQA62
X-Received: by 2002:a05:6000:4607:b0:48e:69ff:ba36 with SMTP id ffacd0b85a97d-4abb2fc3fcbmr46223792f8f.28.1795801794370;
        Fri, 27 Nov 2026 09:49:54 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 36/37] rust-llvm: Disable libedit
Date: Fri, 27 Nov 2026 18:49:19 +0100
Message-ID: <6050aee0c9182ad71667872c93d01ebccc3b27da.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251442
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This option currently floats and is leading to non-deterministic builds. It
is used for commandline option tab completion which we don't need in our
builds in general, let alone internally within rust's llvm.

This should fix autobuilder deterministic build issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c31859be39c68f215576ba73b8a3d66c8ea590d3)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/rust/rust-llvm_1.75.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
index 76335dc0559..724ad39d714 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
@@ -46,6 +46,7 @@ EXTRA_OECMAKE = " \
     -DLLVM_ENABLE_ZSTD=OFF \
     -DLLVM_ENABLE_LIBXML2=OFF \
     -DLLVM_ENABLE_FFI=OFF \
+    -DLLVM_ENABLE_LIBEDIT=OFF \
     -DLLVM_INSTALL_UTILS=ON \
     -DLLVM_BUILD_LLVM_DYLIB=ON \
     -DLLVM_LINK_LLVM_DYLIB=ON \
