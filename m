Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F196CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:18:36 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17850.1779993884068689655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 11:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kpzTEGr2;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: adityags2004@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c8561fcb680so542266a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779993883; x=1780598683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZeorqHyYYNr/Mjy+7AwxsbaSEsCTPiV07Lpa0c3cDk=;
        b=kpzTEGr2OiG98k8XOX4c8pIBJS+xjuGqkdw5vGi9M9HLuJzAQAaxbjLTzZNZes82Hl
         FjsjFwBElj4YA5aGlv8QWwzrDjii+ySVtgdh+631taD6PM9plwMZ6kSqUgSUy/gJ32iR
         TStCKRtwDNbtdsC9Beel7h7ynLr1G1AAq7CgA323gFF/kzMJ1XjpQHg7fwVdhK5sja9y
         uxEFQXurvHZoDca0Ik1uus9792QzacbCpSODkHqD1VNryVtrYCnwZ2u09EhWQHABwGPg
         BvoxW/iIA4ItGz3jBlUyroKoA9FgM8P4mbZuU+yMOFafTUmlNSUmzcVTeILg6WkWmc0a
         0C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779993883; x=1780598683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZeorqHyYYNr/Mjy+7AwxsbaSEsCTPiV07Lpa0c3cDk=;
        b=kxQmeUteiuOcpg1/PsaEq/lY2geGd4GodniDTJeE/Hj0jBlGxkyAwbfVj79of5DkX7
         MOvM1Aj/9QWNjq3vCenK52SiRS53qBf91cs6CCp9JkNdAU6vtHLEDwMTjgr0WIqaG7x9
         iYqUpuAZev9adxYphWhQgyfn1nxXc+B+pWe1OLLxI9qPWQ97c9fHcqh4wa3DVksSoTtB
         H64L9CEtyQkH0pDqMrUwsqlB84d61Lc70Dg2gyQZtl81d6tbRQkbo2VoIDppT0mDMMfD
         GtESjJlltykiac3pgTzU7jZ4bsHI5QrkL2olvPpW/JDgJZ1lefM1NXzJjXDDuuqXICMf
         FKGA==
X-Gm-Message-State: AOJu0YxqcJbOod5dX5dBrxy16mlMnC8iJ2zRDJ0QyUWC62MATyKSGOR2
	EmPb6RLzRK88eRjmKBWecJW/n8g/vX5vRE0Tix5xJUHEVm8n+kGaKC9vjgcBtsHt
X-Gm-Gg: Acq92OF+49vjDb2VA/FgRUJaMy05Pt1GED08Vlc1b1B7Fc2+DdnvQAzruYb6PX5p+s6
	T4O3XJDsBy5ILYHlL/f6qS7d+qw5MAoqLYoAXn9WexhLgUKQZPRUJ6VKWaL86DCVwBve+JF67ru
	oNp8zj+4ZjXkWaJPMUk+R3Ixb77/I7CHX2lJFzVM29Aht9if1+hOMCsMMtvzy+q7QQPJ7ujccoF
	IFX76sZCptmdVJcD0hn5HuPwxG8+IDXauC6oqEQh4xksPwIlAb0zGlf2Zjz4BRjdzqFpONsTogP
	n+ZQyq4JuFJUTIVxm5YIwxd7e9s6Wt3gd9FL3HdDoJSvmHo3knrE1ycYIv2FKHSVbHB4M6MdW36
	dlaGe0zV7AmY+fIigQqJi3TNHGs6+pWsMl5bT3xtttpfFBbQID/DDeuTveEc7kQPW1v3WkPbNos
	Zq+jb9cjJwULFd3XIGdZTf0G55ghvZLgwNuGqfD0apxTu8GX0sW2r93ncO
X-Received: by 2002:a05:6a21:a343:b0:3a2:dbaa:82ee with SMTP id adf61e73a8af0-3b328caba66mr30845606637.9.1779993883440;
        Thu, 28 May 2026 11:44:43 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([220.158.157.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8573062c4fsm13238a12.22.2026.05.28.11.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:44:42 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	joaomarcos.costa@bootlin.com,
	ross.burton@arm.com,
	randy.macleod@windriver.com,
	Aditya GS <adityags2004@gmail.com>
Subject: [PATCH] gawk: backport randtest stability fix
Date: Fri, 29 May 2026 00:14:27 +0530
Message-Id: <20260528184427.517-1-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237730

Backport upstream fix to improve stability of randtest.sh by
retrying when sigma is too small, avoiding intermittent failures.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=16254

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


