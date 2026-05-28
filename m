Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA22CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:19:06 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16595.1779990349197442980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 10:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=miwicLYz;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: adityags2004@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so7571901a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 10:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779990348; x=1780595148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6zmr9E6/3PXqR0Kymc/iEwp2P25knd2BIFak1FG6Ss=;
        b=miwicLYzhkmKassZ802WG1ALQ5AgbfKbKJbwZ03wx9ySlbsZSMNkCTORwuVUo+XRSl
         rBI4plm0h4ZPa7H1Bo2wt2dTHS73ppKSz9vPhfl/+0cs0zuTVLMX+01SMvcLwTZ0d7RG
         FRiFBFweL+1mrrn99EsFHevoe+S8JXBgdycN4Atabeju+Kpse+R6k/PVPgvj3oopQNlw
         +qSBvNi04YFlQegarEUN/+WJCR/dHOfHAKUsPXwMJHfUljcXZxEw47nPUnw7EhtBvwAJ
         cEBTf2VpTXPXEs2TMzkvcW7sGl3cAbm6Xf4+7jecl7V3u5Qfks4+ZQS4urXCCgdDXlrm
         Ao/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779990348; x=1780595148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6zmr9E6/3PXqR0Kymc/iEwp2P25knd2BIFak1FG6Ss=;
        b=c20aJ8ZWCZ+bnSCLWMD9W8yeNsyZWSmNgDX47UK5OKQ8wQiB2e1epga9JJcECeCX2f
         IYbHlAOMouH89AM3bdap33JxZm5sA5hNkuxpVABrJ3XPbU/wN+uOuXg6fCsmCGNOySCj
         K61bw//x2VTRnxUYiTqAu6Qn8xnOpNaSCB7IEWP+FbErC/vJGM1RmnLk3BkmvjXTOuKq
         R1c+X4to9yYTmv+dvE37/PUVRnRgwa/PzNeEwh2NAN6qrWYqa5OQLf6GOumwmHN/QLtx
         yF1PpnrA6nkpExKdxcK2hWZa3e+6wKHyxh5J9BzFUNqI1aY7qhNbT7lPJNIi3PC+b6It
         67dg==
X-Gm-Message-State: AOJu0YxRGlPldGl/oQbl4TIMZF4mKJSxbhnwhsx0eNluEfr2NtcPOME5
	wNrEGUMzL9kGnuXbzkDhgDMzlN4FgZqIhBE9yapS2AzpCFZoYyr5hh5bTG2dNPsg
X-Gm-Gg: Acq92OFtB09lrWHkrhwVkSHERo1tmgSfH69aNReWncApCAKNXcy01efpPGzfGuxLi8o
	DR6XIYeWbOODc5lCm2i71W9BURvr4mTu4bEa8oL6AZqsgG6CTD/UFTvbA935Z7v2bK8eP2hetPz
	YQvE6CwMA0BrVjBpJnUhbxVFhot5/f8syTaLskdi8sozGlx9l4E0boyI0O+bNrqEMsAoCCciHV+
	n6BkR8v/3mDaElg4kCyWh0fJUrtFUB+s9PEZlufN5et9/Q3h5taCDe1BqrvI6WnRROQ3f6vKgoo
	5CwCoFswgl+C0Mkjk1QSx3ZwjdWB5hyzg7znedzlJxsEsiS93pZ0URxO8QVfOBI/QAgDAReD7ho
	WrqtK6IybPppQ7j2I349p8Xzxo8ZJj762lThCIZAE5V4n16Y+TnHY7pwT38+4wM6V+PkOd2XAWx
	kncgV+jm+Xk870lbzdEzS7F8bz24MHD4pZ24cxZ7C4bAL/rSHOlfGwFeGi
X-Received: by 2002:a17:90b:540f:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-36bba7d1423mr54471a91.2.1779990348389;
        Thu, 28 May 2026 10:45:48 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([220.158.157.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b908f8f80sm2116244a91.5.2026.05.28.10.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 10:45:47 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	joaomarcos.costa@bootlin.com,
	ross.burton@arm.com,
	randy.macleod@windriver.com,
	Aditya GS <adityags2004@gmail.com>
Subject: [PATCH] gawk: backport randtest stability fix
Date: Thu, 28 May 2026 23:15:15 +0530
Message-Id: <20260528174515.1274649-1-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237732

Backport upstream fix to improve stability of randtest.sh by
retrying when sigma is too small, avoiding intermittent failures.

Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]

Signed-off-by: Aditya GS <adityags2004@gmail.com>
---
 .../gawk/files/randtest-fix.patch             | 138 ++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch

diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/meta/recipes-extended/gawk/files/randtest-fix.patch
new file mode 100644
index 0000000000..b909d52263
--- /dev/null
+++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
@@ -0,0 +1,138 @@
+From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Thu, 28 May 2026 09:52:41 -0400
+Subject: [PATCH] Improve test/randtest.sh.
+
+Backport upstream fix to improve stability of randtest.sh by retrying
+when sigma is too small, avoiding intermittent failures.
+
+Upstream-Status: Backport [f2250f4bc864913437619af7a9834a1c24915acd]
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
index ac9d8500d6..a6bf793e65 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
            "
+SRC_URI += "file://randtest-fix.patch"
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
 
-- 
2.34.1


