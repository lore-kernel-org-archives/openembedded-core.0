Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.138.1794360546144419085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 17:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jDK834AO;
 spf=pass (domain: konsulko.com, ip: 209.85.216.52, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b179528d56so410974a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 17:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794360545; x=1794965345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hq9bJJSXerrX5hLNE7drrxS4cnguXLoKpTX+n60O14A=;
        b=jDK834AO4XlDMh1em7HVtWrGR9PLRtoD4X8bG3sQfpryoJRHEbJjSAnRqo63y/pHBK
         vEJHfTHesR981rA3zxM25AodHQtkzM61tcRNOYhXvMR7KnESHOLNtsQWedMbAJt7A2nj
         Jfh8eoG4AhE7ThWgkbrSjc+V+hxdTeorSsLQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360545; x=1794965345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hq9bJJSXerrX5hLNE7drrxS4cnguXLoKpTX+n60O14A=;
        b=DFG8KPe3gTZdJLYeqvP34v8XUXlZYFd3q2qSnycFbqLCxdT5EMQdEJNDlgNHgnmkJ7
         DBUBGpjll2dQYVqqNEHHm9+cXZtZ4P3P4Rh2TDJ0w8vKJfIuQriWGAVjDa130oUxGC5k
         Z6u3y5bOtFs2gceBiccNoBbecZLBuektzoI59b2pqSPiKyjKzpTts9SyXUacb/y/aeDE
         ZYk7PMKCY37H1W32wX0njYYtbhDy5Ov/iSgJZg7m3tYWu8Iu6mNdKSgArplOB27DQhxl
         z+c/9fkyELRQfK5UdGOou6MrAqfQAZLliduc33598Gr3aW+tUZT9coDRdhprf6pd+k5/
         3pwA==
X-Gm-Message-State: APuU4Z+OEzUVhbPxRxvin/IM6yAEHXL/opVpI2I0mhopJw3UspGhYfpz
	oRE1Pcer7upEPbIyIJ3S53rFyfLoxXCmvvrTP+dM5nJo42kJo/mulH49NN7Nq1RnsYV3qjfPH91
	9dAsD
X-Gm-Gg: AYBFou38TQcikzV5RdvF9FXRGJkeFs9SdnItMJxjpt+fLo+qfWZpSLJUEexnH8UYFud
	cMPn/hwxf02JLIpr45ZTYsrMsBaIAa6PAqXQOel2X/bsEpKn8vuABHkZ8mvjoWG6UXQICLpTLUY
	olUg0xkK9pRqJI42/ahOHHacOINwr6C0xfTmk2VwmjpdnUKgda83GCFOlCgk5233JwJbvQ0b+xf
	lvv8Vp/r67A9d/Mzk3vXMQsFVbJmS1RPLwNjZmOnu4Y5V7mree6s1PUK9iWft9kQT9+1gHNeLAC
	Xo4ro3hxDJDCK6Qk5dZky0xaJvq4xh40h/nMXeTqOI4XPEXsHoH5Pg3jiiDGr8UXmr4GtsZRoku
	oXYtAnQ8dG55NGxlJnzl/LVSnNQV2xgTJPcCZB9g1vK8W9UwMPgK8uekHiJQp0WQvQaslHQPyeH
	dcVMMAz9fgYFKz51tb6dU37KnfydV3bZ66e/vUtz2oLF6DRq19/ZmLfqDlRONrSwWURW9xqzm6a
	MWwJbetpI/7wzS8T5sJplO7BoeYEJ0dwE/JciRdKVGchwVhNn9nD6imvDhwipo2ktSrKjbQoT61
	l8KEDQwXAdkEenPlwkVr9a3e0Osldhbrb9NHxL9ikLOYqdWTTK+cpt44yHZ0Skk+wRTjiHREu6s
	mS4WAKggEpbgjORLI/09hEqaf3juK
X-Received: by 2002:a17:90b:1c88:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3b182f858eamr755090a91.49.1794360545324;
        Tue, 10 Nov 2026 17:29:05 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:58cf:e995:276d:530c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0d550dsm1810029a91.8.2026.11.10.17.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:29:04 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] libconvert-asn1-perl: upgrade 0.34 -> 0.36
Date: Tue, 10 Nov 2026 17:28:55 -0800
Message-ID: <20261111012855.2303942-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249940
Content-Type: text/plain; charset="utf-8"

0.36 -- Mon Nov 09 18:44:55 AST 2026
Release 0.35 as production release.

0.35 -- Sun Nov 08 12:05:15 AST 2026
Bug Fixes
Thanks to Oliver Welter
  * Fix year interpretation when decoding UTCTime and GeneralizedTime- #83
  * Use Sigstore to sign release

https://metacpan.org/dist/Convert-ASN1/changes

Tested with core-image-ptest-libconvert-asn1-perl on qemux86-64.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...ibconvert-asn1-perl_0.34.bb => libconvert-asn1-perl_0.36.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.34.bb => libconvert-asn1-perl_0.36.bb} (91%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb
similarity index 91%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb
index 88f22fff37..6cb3ce9fd9 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.36.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
+SRC_URI[sha256sum] = "50439aedff4b403f24c9373eefd3c25770e33a9190d93a331e7a744f8b4e7cd3"
 
 S = "${UNPACKDIR}/Convert-ASN1-${PV}"
 
-- 
2.47.3

