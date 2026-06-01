Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FEECD6E5E
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 06:34:30 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22454.1780295370041410716
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 23:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tMfAleDJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: adityags2004@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-91550c6ea8eso164935285a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 23:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780295369; x=1780900169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCrx1dIJczPVSSzXBYjbyrFH9dAHQJts4mOC0KGKAO4=;
        b=tMfAleDJDxogojIjdP+YjAAtIwjOO7pUZqEuriouYPEdvIsWCtuZ6UWfQZBxcmUkCM
         SqXMA4wKRN2CG/gtqJ82R5DhsREbv222LtXGnscwKlw4vi/lO7ESg8rjmtCcPltasd/F
         hP9+TXJJOmrNOwKGOKYsj+UZ8cODkzyGm0VMsKKUOc8vZHCI5EKo9dkw+xUK6zNEfKsZ
         lDeNU4gld71/pgS/rs+Q06bsEQeoFcg2BFZEw6h7MRr9PZ17jCNkIMmI4RKVkGbNmpj9
         WxXZj92CNDX1zbeDQXMg1aIDX9418zppU2LR25nf6q3QdlJEmSZ1nysFsQBUM5sALPsz
         MnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295369; x=1780900169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aCrx1dIJczPVSSzXBYjbyrFH9dAHQJts4mOC0KGKAO4=;
        b=rOiAupk6MrbkKqfHxEtCO0ZEep9rQjelimajBcp0mfBYUBNJMgk61nln2/ke2q2z25
         VV5nYTpCmIMunnM1nreWb56alrn4VpBtS2Kp5ixgRT2Hwxq+0mCTdIG+iyS6+H7LoEV/
         fp3PXezpULF+TZi3ndM8BEhs1+SgGDB/UK3Tf9yXvf5FGSQ619QwlelMLRoS6J7a6R29
         pwOl/9wBaVwdL95WximRnUnl3bPP4HuOO77Wf4cBqRqIQSw5UI2EH5qmKXjhCYHjhOcp
         CfbMby1wqIgyNxfLCG9ko8Xt7h0vmIOu/UrJgV1Yh4gvp3GUy5uIWer4W005ABzYl7wk
         mALw==
X-Gm-Message-State: AOJu0YyLaCcRBwx27/Te5vx/HwGqy87bynq6VO6r2oBMetsC2Xb0U9Lf
	i+yFJUfyKuIxpJmd1EcxL1NtRZOLIvqdD9+xkxh3wpOGkae/Jmc4+XHoPBmLsg==
X-Gm-Gg: Acq92OGt7C15gwOs6mbfJuAwcJWHAyROltr3LyPBU/8nlpgtXih3KT+a1rf+n2bfW4Y
	Jr+o99ktoGsROAagypFIBneevW2vknx3QrrdSg/KtFPz4erAQphMyEBGWdq7ZjaFlzVE9c5fnbU
	T1SwD+lW45th4bWs8B+He4NZ6kuMcdZ7jGb5yB7sv2AFSCVnModJMnGF27DV9uNArBOY2PhjzDq
	dFrxz/MT791c+QwEBiepWw0qeffI1DMsHTYG7078GiOwNykpsefy1Kr4lpZ2BJjUGgZmGrsG8yB
	R6nRQvzSADOb6/t8PjihRFysIvnn3s1KJxOraYMQH+EwGdfB3uJRlBue257a7BJA7VWnsq9CJnX
	ngalgSeTpSNq6HvEQee4LgMnBL4Qa4VYzGHtmg1UUh1Kz/M/8jd4tESmKYALU7KYw6Kbn2oQWpK
	3FlIziXSGYWd4XHwlJtezeJzRhOoDJ4x6lYLYX2J2ZO+1r5tjekJgViVajww==
X-Received: by 2002:a05:6a20:cf85:b0:3a2:bd1d:d686 with SMTP id adf61e73a8af0-3b428069790mr10345908637.26.1780295037858;
        Sun, 31 May 2026 23:23:57 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([157.50.205.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a9299sm8795894a12.7.2026.05.31.23.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 23:23:57 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	joaomarcos.costa@bootlin.com,
	ross.burton@arm.com,
	randy.macleod@windriver.com,
	Aditya GS <adityags2004@gmail.com>
Subject: [PATCH] gawk: backport randtest stability fix
Date: Mon,  1 Jun 2026 11:53:11 +0530
Message-Id: <20260601062311.638-2-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601062311.638-1-adityags2004@gmail.com>
References: <20260601062311.638-1-adityags2004@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 06:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237810

Backport upstream fix to improve stability of randtest.sh by
retrying when sigma is too small, avoiding intermittent failures.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=16254

Signed-off-by: Aditya GS <adityags2004@gmail.com>
---
 .../gawk/files/randtest-fix.patch             | 139 ++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch

diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/meta/recipes-extended/gawk/files/randtest-fix.patch
new file mode 100644
index 0000000000..0b813e667e
--- /dev/null
+++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
@@ -0,0 +1,139 @@
+From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Thu, 28 May 2026 09:52:41 -0400
+Subject: [PATCH] Improve test/randtest.sh.
+
+Backport upstream fix to improve stability of randtest.sh by retrying
+when sigma is too small, avoiding intermittent failures.
+
+Upstream-Status: Backport
+[https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=f2250f4bc864913437619af7a983
+
+---
+
+diff --git a/test/randtest.sh b/test/randtest.sh
+index 597376a8..6ae6f830 100755
+--- a/test/randtest.sh
++++ b/test/randtest.sh
+@@ -45,68 +45,77 @@ $AWK 'BEGIN{
+     nsamples=('$NSAMPLES');
+     max_allowed_sigma=('$MAX_ALLOWED_SIGMA');
+     nruns=('$NRUNS');
+-    for(tau=0;tau<nsamples/2;tau++) corr[tau]=0;
++    max_retries=5
+ 
+-    for(run=0;run<nruns;run++) {
+-	sum=0;
++    for (retry=0; retry<max_retries; retry++) {
++        for(tau=0; tau<nsamples/2; tau++) corr[tau]=0;
+ 
+-	# Fill an array with a sequence of samples that are a
+-	# function of pairs of rand() values.
++        for(run=0; run<nruns; run++) {
++            sum=0;
+ 
+-	for(i=0;i<nsamples;i++) {
+-	   samp[i]=((rand()-0.5)*(rand()-0.5))^2;
+-	   sum=sum+samp[i];
+-	   }
++	    # Fill an array with a sequence of samples that are a
++	    # function of pairs of rand() values.
+ 
+-	# Subtract off the mean of the sequence:
++            for(i=0; i<nsamples; i++) {
++                samp[i]=((rand()-0.5)*(rand()-0.5))^2;
++	        sum=sum+samp[i];
++            }
+ 
+-	mean=sum/nsamples;
+-	for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
++	    # Subtract off the mean of the sequence:
+ 
+-	# Calculate an autocorrelation function on the sequence.
+-	# Because the values of rand() should be independent, there
+-	# should be no peaks in the autocorrelation.
++	    mean=sum/nsamples;
++	    for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
+ 
+-	for(tau=0;tau<nsamples/2;tau++) {
+-	    sum=0;
+-	    for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
+-	    corr[tau]=corr[tau]+sum;
+-	    }
++	    # Calculate an autocorrelation function on the sequence.
++	    # Because the values of rand() should be independent, there
++	    # should be no peaks in the autocorrelation.
+ 
+-	}
+-    # Normalize the autocorrelation to the tau=0 value.
++            for(tau=0; tau<nsamples/2; tau++) {
++	        sum=0;
++	        for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
++	        corr[tau]=corr[tau]+sum;
++            }
+ 
+-    max_corr=corr[0];
+-    for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
++        }
++        # Normalize the autocorrelation to the tau=0 value.
+ 
+-    # OPTIONALLY Print out the autocorrelation values:
++        max_corr=corr[0];
++        for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
+ 
+-    # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
++        # OPTIONALLY Print out the autocorrelation values:
+ 
+-    # Calculate the sigma for the non-zero tau values: 
++        # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
+ 
+-    power_sum=0;
++        # Calculate the sigma for the non-zero tau values: 
+ 
+-    for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
++        power_sum=0;
+ 
+-    sigma=sqrt(power_sum/(nsamples/2-1));
++        for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
+ 
+-    # See if any of the correlations exceed a reasonable number of sigma:
++        sigma=sqrt(power_sum/(nsamples/2-1));
+ 
+-    passed=1;
+-    for(tau=1;tau<nsamples/2;tau++) {
+-	if ( abs(corr[tau])/sigma > max_allowed_sigma ) {
+-	    print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
+-	    passed=0;
+-	    }
++        if (sigma < 1e-6) {
++            print "Sigma too small, retrying run", retry
++            continue
+         }
+-    if(!passed) {
+-	print "Test failed."
+-	exit(1);
++
++        # See if any of the correlations exceed a reasonable number of sigma:
++
++        for(tau=1;tau<nsamples/2;tau++) {
++            if (abs(corr[tau])/sigma > max_allowed_sigma) {
++                print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
++                print "Test failed."
++                exit 1
++            }
+         }
+-    else exit (0);
++
++        exit 0
+     }
+ 
++    print "Test failed after retries due to unstable sigma"
++    exit 1
++}
++
+ function abs(abs_input) { return(sqrt(abs_input^2)) ; }
+ '
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index ac9d8500d6..06184a4b48 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
+	   file://randtest-fix.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
-- 
2.34.1


