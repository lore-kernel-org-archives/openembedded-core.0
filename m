Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBFEC87FD2
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 04:14:07 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.42882.1754540043887777987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 21:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LOMLfwZY;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso768225a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 21:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754540043; x=1755144843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sTm3Y3mW6qJKM3k5mw0ZUMVwHxOkPAvERIsL80+UdCA=;
        b=LOMLfwZYCKRDzWZI6Y+rQqNRRKiZSWDgiuHBOAomn769wl2E8hg7dhKbd03sd2cjjY
         mZ7hE2LfmAPDuGqGcBCPPxe888YxK78hMqfn+xbp/Xz/arzWy4sD3cJTwPmwsVEZZqBc
         8yCvKGruL7r1DTKOvnE10vf0/C4TJ4/fbrEiyt31PajtMxhOajn21SZQcdlrnysGeWVl
         Fg1fNsJaEOHL0BBptArdj9jR+YcF+/rf5JLeXb/5AhSpNvf+x32XagUJM0myPajW51K3
         G5nIzZaW2cW/QXFNnEf/MpXHDPRprzqqE3LzakzuCKjg4WJHk7KxHHbasped30YXsC9J
         cFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754540043; x=1755144843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTm3Y3mW6qJKM3k5mw0ZUMVwHxOkPAvERIsL80+UdCA=;
        b=KMi8ub6XDNJxkIqgEBGA567Jq3v0bymKm8CCfT1pTm4rHLtg4824Fjp5kMf2DvnqfF
         avVREWjqFrNefIbR6GJQqP5UmqJsMjQvoqWJP2o2NIzrPDuoq8RGHfJ2HmW0vncQb4/l
         h8GV1adJVvp6POdCbX5e+kP41JkYzu2DLx1m1LMx0kpWq5X3OD1lgH9HHNyPhVIO8HRC
         Z8ldckWYki95bRfqbCjrK5I6nYwryD5Jqw6oU5+9X5eCU5D6k3Xy79h/V8CrOzcaSS4d
         mifRQ0RTsDrBNTx+XZwdCusJnhNu/lpD4oV9jBalTGP5lTD2x7I9QUetVTvjmD7GXLqn
         C/iQ==
X-Gm-Message-State: AOJu0Yw+N5IuJnP1W6YRP8lcMOjBkcmXRdC8Piox1XjMx1j80LJIzroJ
	pZGZZQOGl9qLdHE398cW+4qRHIpaYLBWTqj1ng1cKmePeiX9qb0pn/IddfTjmCgKe00=
X-Gm-Gg: ASbGncvU//sOzdPLoOJTfbcf8VSuH7J+/FJcHyz1sNElZoZjXc+Wr8qJm+5bAccv2My
	tdApdAjPoagCsFt6NlWZwF2jvq6LzrGQ1K8YWYGkLZzyU+mIuSH+8skvFSoAfC0uqANL68ilngt
	H0CgPx5JCbsCm3TYqDomDiaqZyLVGMRFDa/+CD6uvRYs4dkyAHUOd8Ckdzvm6w1+HPDME2+pOJb
	mQOKI4js24ZiziN0B1vgJETqQ1meeVcRniuR6VVcL1lbjuH6V/LwAm3kE3pXU1ZfYkhRbO6jhYt
	muuoI0ORdRnDj94aRtApUeYsp1s44SA76VFJ1y+3IWl9gr5qKvEbrPCsraE9jMTizx9U/iNnG+J
	NBfm/bmIo8lsXfz1V6DVPIQ==
X-Google-Smtp-Source: AGHT+IEtiNlQGXcKAUpokxFdOMm2NlzNRHUZ9CEOfrzOjoI2zjlj7mdqJrbZs9ejY2ei3D622SROhg==
X-Received: by 2002:a17:90b:1d4c:b0:321:75c1:65b2 with SMTP id 98e67ed59e1d1-32175c165dfmr2664113a91.18.1754540042835;
        Wed, 06 Aug 2025 21:14:02 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32102a7949bsm9603981a91.2.2025.08.06.21.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 21:14:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] perl: Disable strict aliasing with clang
Date: Wed,  6 Aug 2025 21:14:00 -0700
Message-ID: <20250807041400.1823402-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 04:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221556

clang-21+ compiled perl ends up with segfults in
various places if this optimization is enabled

panic: del_backref, svp=0 at /usr/lib/perl5/5.40.2/warnings.pm line 622.
Compilation failed in require at /usr/lib/perl5/5.40.2/Getopt/Std.pm line 4.

The crash starts at frame #0 in Perl_sv_kill_backrefs() at sv.c:6420
called during magic cleanup (Perl_magic_killbackrefs)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.40.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-devtools/perl/perl_5.40.2.bb
index c3bcbf053d9..1df1467d424 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -50,6 +50,10 @@ export ENC2XS_NO_COMMENTS = "1"
 
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
+# Perl built with clang runs into sefaults with clang-21+
+# https://github.com/llvm/llvm-project/issues/152241
+CFLAGS:append:toolchain-clang = " -fno-strict-aliasing"
+
 do_configure:prepend() {
     rm -rf ${B}
     cp -rfp ${S} ${B}

