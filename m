Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CA5C44509
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:49:33 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8000.1783669770122206805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EDXS6TJq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qpzf3CGb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019f4b00c4a8-85bac66a-9148-4bea-adb7-6a0c65be440b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783669769;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EGKrer73y15XFJIz8l/jbUXDz6aprr/eC7bXQYshfVs=;
	b=EDXS6TJqaDPD1uXSGfqQ3gUUqPQVOJGxW//bY7JABny8V+IXQj7GVKX+plFjpSFB
	bVLsMOdKLSFxif5mfIDK3LmABIFBNHv2/VGhQwEu2rUNFP+xC2Z5gdyyVq6rvzgkdln
	SmXTug55SHFHPFQh6dAgt9WlxKNNwvuubrPLpN2Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783669769;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EGKrer73y15XFJIz8l/jbUXDz6aprr/eC7bXQYshfVs=;
	b=qpzf3CGb/0zbbYX/FBbt4lkV/tHc9l3QquQXhDB9aGpMu4DayLU70KeeOK0t40dM
	Nl1f4s//SI1JIoOEQKp84bV4If+3rcdC4KUnA54He4m4HGoAKVRb5FByaYRI9+sk6H2
	DdLupPLWvP5Nr/NvZqS91PNysJcIdMRrvTtnKOkg=
Content-Type: multipart/mixed; boundary="===============8374942937643486534=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gawk: upgrading to 5.4.1 SUCCEEDED
Message-ID: <0101019f4b00c4a8-85bac66a-9148-4bea-adb7-6a0c65be440b-000000@us-west-2.amazonses.com>
Date: Fri, 10 Jul 2026 07:49:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.10-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240608

--===============8374942937643486534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gawk* to *5.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gawk-upgrade-5.4.0-5.4.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From f403472ee1de5a99b91edeafabee2aec21ff8259 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 10 Jul 2026 06:15:10 +0000
Subject: [PATCH] gawk: upgrade 5.4.0 -> 5.4.1

---
 .../gawk/files/randtest-fix.patch             | 140 ------------------
 ...c-re-enable-disabled-printf-features.patch |   8 +-
 .../gawk/{gawk_5.4.0.bb => gawk_5.4.1.bb}     |   3 +-
 3 files changed, 5 insertions(+), 146 deletions(-)
 delete mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch
 rename meta/recipes-extended/gawk/{gawk_5.4.0.bb => gawk_5.4.1.bb} (96%)

diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/meta/recipes-extended/gawk/files/randtest-fix.patch
deleted file mode 100644
index ac26eef8d1..0000000000
--- a/meta/recipes-extended/gawk/files/randtest-fix.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
-From: "Arnold D. Robbins" <arnold@skeeve.com>
-Date: Thu, 28 May 2026 09:52:41 -0400
-Subject: [PATCH] Improve test/randtest.sh.
-
-Backport upstream fix to improve stability of randtest.sh by retrying
-when sigma is too small, avoiding intermittent failures.
-
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=f2250f4bc864913437619af7a983]
-
-Signed-off-by: Aditya GS <adityags2004@gmail.com>
-
----
-
-diff --git a/test/randtest.sh b/test/randtest.sh
-index 597376a8..6ae6f830 100755
---- a/test/randtest.sh
-+++ b/test/randtest.sh
-@@ -45,68 +45,77 @@ $AWK 'BEGIN{
-     nsamples=('$NSAMPLES');
-     max_allowed_sigma=('$MAX_ALLOWED_SIGMA');
-     nruns=('$NRUNS');
--    for(tau=0;tau<nsamples/2;tau++) corr[tau]=0;
-+    max_retries=5
- 
--    for(run=0;run<nruns;run++) {
--	sum=0;
-+    for (retry=0; retry<max_retries; retry++) {
-+        for(tau=0; tau<nsamples/2; tau++) corr[tau]=0;
- 
--	# Fill an array with a sequence of samples that are a
--	# function of pairs of rand() values.
-+        for(run=0; run<nruns; run++) {
-+            sum=0;
- 
--	for(i=0;i<nsamples;i++) {
--	   samp[i]=((rand()-0.5)*(rand()-0.5))^2;
--	   sum=sum+samp[i];
--	   }
-+	    # Fill an array with a sequence of samples that are a
-+	    # function of pairs of rand() values.
- 
--	# Subtract off the mean of the sequence:
-+            for(i=0; i<nsamples; i++) {
-+                samp[i]=((rand()-0.5)*(rand()-0.5))^2;
-+	        sum=sum+samp[i];
-+            }
- 
--	mean=sum/nsamples;
--	for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
-+	    # Subtract off the mean of the sequence:
- 
--	# Calculate an autocorrelation function on the sequence.
--	# Because the values of rand() should be independent, there
--	# should be no peaks in the autocorrelation.
-+	    mean=sum/nsamples;
-+	    for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
- 
--	for(tau=0;tau<nsamples/2;tau++) {
--	    sum=0;
--	    for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
--	    corr[tau]=corr[tau]+sum;
--	    }
-+	    # Calculate an autocorrelation function on the sequence.
-+	    # Because the values of rand() should be independent, there
-+	    # should be no peaks in the autocorrelation.
- 
--	}
--    # Normalize the autocorrelation to the tau=0 value.
-+            for(tau=0; tau<nsamples/2; tau++) {
-+	        sum=0;
-+	        for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
-+	        corr[tau]=corr[tau]+sum;
-+            }
- 
--    max_corr=corr[0];
--    for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
-+        }
-+        # Normalize the autocorrelation to the tau=0 value.
- 
--    # OPTIONALLY Print out the autocorrelation values:
-+        max_corr=corr[0];
-+        for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
- 
--    # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
-+        # OPTIONALLY Print out the autocorrelation values:
- 
--    # Calculate the sigma for the non-zero tau values: 
-+        # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
- 
--    power_sum=0;
-+        # Calculate the sigma for the non-zero tau values: 
- 
--    for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
-+        power_sum=0;
- 
--    sigma=sqrt(power_sum/(nsamples/2-1));
-+        for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
- 
--    # See if any of the correlations exceed a reasonable number of sigma:
-+        sigma=sqrt(power_sum/(nsamples/2-1));
- 
--    passed=1;
--    for(tau=1;tau<nsamples/2;tau++) {
--	if ( abs(corr[tau])/sigma > max_allowed_sigma ) {
--	    print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
--	    passed=0;
--	    }
-+        if (sigma < 1e-6) {
-+            print "Sigma too small, retrying run", retry
-+            continue
-         }
--    if(!passed) {
--	print "Test failed."
--	exit(1);
-+
-+        # See if any of the correlations exceed a reasonable number of sigma:
-+
-+        for(tau=1;tau<nsamples/2;tau++) {
-+            if (abs(corr[tau])/sigma > max_allowed_sigma) {
-+                print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
-+                print "Test failed."
-+                exit 1
-+            }
-         }
--    else exit (0);
-+
-+        exit 0
-     }
- 
-+    print "Test failed after retries due to unstable sigma"
-+    exit 1
-+}
-+
- function abs(abs_input) { return(sqrt(abs_input^2)) ; }
- '
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
index bcbc569531..882edca112 100644
--- a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
+++ b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
@@ -1,4 +1,4 @@
-From 9ce3184188e3fa275fde0258a165f4446a6e80f7 Mon Sep 17 00:00:00 2001
+From 53808cbdab1d12c99a4fbadf4ea134b98664e8c7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 12:13:58 +0100
 Subject: [PATCH] configure.ac: re-enable disabled printf features
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0ccd460..7df7e5b 100644
+index 471fbc1..d7d173a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -400,7 +400,7 @@ int main()
+@@ -402,7 +402,7 @@ int main()
  ])],
  	has_f_format=yes,
  	has_f_format=no,
@@ -24,7 +24,7 @@ index 0ccd460..7df7e5b 100644
  )
  if test "$has_f_format" = yes
  then
-@@ -429,7 +429,7 @@ int main()
+@@ -431,7 +431,7 @@ int main()
  ])],
  	has_a_format=yes,
  	has_a_format=no,
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.1.bb
similarity index 96%
rename from meta/recipes-extended/gawk/gawk_5.4.0.bb
rename to meta/recipes-extended/gawk/gawk_5.4.1.bb
index 4193456c14..8e8bc34152 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.1.bb
@@ -28,10 +28,9 @@ PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
-           file://randtest-fix.patch \
            "
 
-SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"
+SRC_URI[sha256sum] = "07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109f105a826f5fd37"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.47.1


--===============8374942937643486534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gawk/gawk-doc: FILELIST: removed "/usr/share/info/notes.info", added "/usr/share/man/man3/intdiv.3am /usr/share/info/gawknotes.info"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-nl: PKGSIZE changed from 67087 to 77277 (+15%)
packages/x86-64-v3-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/fieldindex.in /usr/lib/gawk/ptest/test/greek-utf.awk /usr/lib/gawk/ptest/test/posix-inf.ok /usr/lib/gawk/ptest/test/memleak4.awk /usr/lib/gawk/ptest/test/regexpbrack3.awk /usr/lib/gawk/ptest/test/fieldindex.ok /usr/lib/gawk/ptest/test/posix-inf.ok2 /usr/lib/gawk/ptest/test/uplus2.ok /usr/lib/gawk/ptest/test/fmtmix.ok /usr/lib/gawk/ptest/test/fmtmix.in /usr/lib/gawk/ptest/test/gensub5.in /usr/lib/gawk/ptest/test/mdim9.ok /usr/lib/gawk/ptest/test/gensub5.ok /usr/lib/gawk/ptest/test/regexpbrack3.ok /usr/lib/gawk/ptest/test/greek-equiv.ok /usr/lib/gawk/ptest/test/greek-equiv.awk /usr/lib/gawk/ptest/test/mdim9.awk /usr/lib/gawk/ptest/test/memleak4.ok /usr/lib/gawk/ptest/test/assignnumfield3.ok /usr/lib/gawk/ptest/test/posix-inf.awk /usr/lib/gawk/ptest/test/assignnumfield3.awk /usr/lib/gawk/ptest/test/uplus2.awk /usr/lib/gawk/ptest/test/gensub5.awk /usr/lib/gawk/ptest/test/splitany.awk /usr/lib/gawk/pt
 est/test/splitany.ok /usr/lib/gawk/ptest/test/splitany.in /usr/lib/gawk/ptest/test/fieldindex.awk /usr/lib/gawk/ptest/test/greek-utf.ok /usr/lib/gawk/ptest/test/fmtmix.awk"
packages/x86-64-v3-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.4.0", added "/usr/bin/gawk-5.4.1"
packages/x86-64-v3-poky-linux/gawk: PACKAGES: added "gawk-locale-ka"
Changes to packages/x86_64-linux/gawk-native (sysroot):
  /usr/bin/gawk-5.4.0 moved to /usr/bin/gawk-5.4.1
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.5.1.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.0.dist-info

--===============8374942937643486534==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gawk-upgrade-5.4.0-5.4.1.patch"

RnJvbSBmNDAzNDcyZWUxZGU1YTk5YjkxZWRlYWZhYmVlMmFlYzIxZmY4MjU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTAgSnVsIDIwMjYgMDY6MTU6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
YXdrOiB1cGdyYWRlIDUuNC4wIC0+IDUuNC4xCgotLS0KIC4uLi9nYXdrL2ZpbGVzL3JhbmR0ZXN0
LWZpeC5wYXRjaCAgICAgICAgICAgICB8IDE0MCAtLS0tLS0tLS0tLS0tLS0tLS0KIC4uLmMtcmUt
ZW5hYmxlLWRpc2FibGVkLXByaW50Zi1mZWF0dXJlcy5wYXRjaCB8ICAgOCArLQogLi4uL2dhd2sv
e2dhd2tfNS40LjAuYmIgPT4gZ2F3a181LjQuMS5iYn0gICAgIHwgICAzICstCiAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTQ2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2ZpbGVzL3JhbmR0ZXN0LWZpeC5wYXRjaAog
cmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL3tnYXdrXzUuNC4wLmJiID0+IGdhd2tf
NS40LjEuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dhd2sv
ZmlsZXMvcmFuZHRlc3QtZml4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dhd2svZmls
ZXMvcmFuZHRlc3QtZml4LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBhYzI2
ZWVmOGQxLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2ZpbGVz
L3JhbmR0ZXN0LWZpeC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDE0MCArMCwwIEBACi1Gcm9t
IGYyMjUwZjRiYzg2NDkxMzQzNzYxOWFmN2E5ODM0YTFjMjQ5MTVhY2QgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiAiQXJub2xkIEQuIFJvYmJpbnMiIDxhcm5vbGRAc2tlZXZlLmNvbT4K
LURhdGU6IFRodSwgMjggTWF5IDIwMjYgMDk6NTI6NDEgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSF0g
SW1wcm92ZSB0ZXN0L3JhbmR0ZXN0LnNoLgotCi1CYWNrcG9ydCB1cHN0cmVhbSBmaXggdG8gaW1w
cm92ZSBzdGFiaWxpdHkgb2YgcmFuZHRlc3Quc2ggYnkgcmV0cnlpbmcKLXdoZW4gc2lnbWEgaXMg
dG9vIHNtYWxsLCBhdm9pZGluZyBpbnRlcm1pdHRlbnQgZmFpbHVyZXMuCi0KLVVwc3RyZWFtLVN0
YXR1czogQmFja3BvcnQgW2h0dHBzOi8vY2dpdC5naXQuc2F2YW5uYWguZ251Lm9yZy9jZ2l0L2dh
d2suZ2l0L2NvbW1pdC8/aWQ9ZjIyNTBmNGJjODY0OTEzNDM3NjE5YWY3YTk4M10KLQotU2lnbmVk
LW9mZi1ieTogQWRpdHlhIEdTIDxhZGl0eWFnczIwMDRAZ21haWwuY29tPgotCi0tLS0KLQotZGlm
ZiAtLWdpdCBhL3Rlc3QvcmFuZHRlc3Quc2ggYi90ZXN0L3JhbmR0ZXN0LnNoCi1pbmRleCA1OTcz
NzZhOC4uNmFlNmY4MzAgMTAwNzU1Ci0tLS0gYS90ZXN0L3JhbmR0ZXN0LnNoCi0rKysgYi90ZXN0
L3JhbmR0ZXN0LnNoCi1AQCAtNDUsNjggKzQ1LDc3IEBAICRBV0sgJ0JFR0lOewotICAgICBuc2Ft
cGxlcz0oJyROU0FNUExFUycpOwotICAgICBtYXhfYWxsb3dlZF9zaWdtYT0oJyRNQVhfQUxMT1dF
RF9TSUdNQScpOwotICAgICBucnVucz0oJyROUlVOUycpOwotLSAgICBmb3IodGF1PTA7dGF1PG5z
YW1wbGVzLzI7dGF1KyspIGNvcnJbdGF1XT0wOwotKyAgICBtYXhfcmV0cmllcz01Ci0gCi0tICAg
IGZvcihydW49MDtydW48bnJ1bnM7cnVuKyspIHsKLS0Jc3VtPTA7Ci0rICAgIGZvciAocmV0cnk9
MDsgcmV0cnk8bWF4X3JldHJpZXM7IHJldHJ5KyspIHsKLSsgICAgICAgIGZvcih0YXU9MDsgdGF1
PG5zYW1wbGVzLzI7IHRhdSsrKSBjb3JyW3RhdV09MDsKLSAKLS0JIyBGaWxsIGFuIGFycmF5IHdp
dGggYSBzZXF1ZW5jZSBvZiBzYW1wbGVzIHRoYXQgYXJlIGEKLS0JIyBmdW5jdGlvbiBvZiBwYWly
cyBvZiByYW5kKCkgdmFsdWVzLgotKyAgICAgICAgZm9yKHJ1bj0wOyBydW48bnJ1bnM7IHJ1bisr
KSB7Ci0rICAgICAgICAgICAgc3VtPTA7Ci0gCi0tCWZvcihpPTA7aTxuc2FtcGxlcztpKyspIHsK
LS0JICAgc2FtcFtpXT0oKHJhbmQoKS0wLjUpKihyYW5kKCktMC41KSleMjsKLS0JICAgc3VtPXN1
bStzYW1wW2ldOwotLQkgICB9Ci0rCSAgICAjIEZpbGwgYW4gYXJyYXkgd2l0aCBhIHNlcXVlbmNl
IG9mIHNhbXBsZXMgdGhhdCBhcmUgYQotKwkgICAgIyBmdW5jdGlvbiBvZiBwYWlycyBvZiByYW5k
KCkgdmFsdWVzLgotIAotLQkjIFN1YnRyYWN0IG9mZiB0aGUgbWVhbiBvZiB0aGUgc2VxdWVuY2U6
Ci0rICAgICAgICAgICAgZm9yKGk9MDsgaTxuc2FtcGxlczsgaSsrKSB7Ci0rICAgICAgICAgICAg
ICAgIHNhbXBbaV09KChyYW5kKCktMC41KSoocmFuZCgpLTAuNSkpXjI7Ci0rCSAgICAgICAgc3Vt
PXN1bStzYW1wW2ldOwotKyAgICAgICAgICAgIH0KLSAKLS0JbWVhbj1zdW0vbnNhbXBsZXM7Ci0t
CWZvcihpPTA7aTxuc2FtcGxlcztpKyspIHNhbXBbaV09c2FtcFtpXS1tZWFuOwotKwkgICAgIyBT
dWJ0cmFjdCBvZmYgdGhlIG1lYW4gb2YgdGhlIHNlcXVlbmNlOgotIAotLQkjIENhbGN1bGF0ZSBh
biBhdXRvY29ycmVsYXRpb24gZnVuY3Rpb24gb24gdGhlIHNlcXVlbmNlLgotLQkjIEJlY2F1c2Ug
dGhlIHZhbHVlcyBvZiByYW5kKCkgc2hvdWxkIGJlIGluZGVwZW5kZW50LCB0aGVyZQotLQkjIHNo
b3VsZCBiZSBubyBwZWFrcyBpbiB0aGUgYXV0b2NvcnJlbGF0aW9uLgotKwkgICAgbWVhbj1zdW0v
bnNhbXBsZXM7Ci0rCSAgICBmb3IoaT0wO2k8bnNhbXBsZXM7aSsrKSBzYW1wW2ldPXNhbXBbaV0t
bWVhbjsKLSAKLS0JZm9yKHRhdT0wO3RhdTxuc2FtcGxlcy8yO3RhdSsrKSB7Ci0tCSAgICBzdW09
MDsKLS0JICAgIGZvcihpPTA7aTxuc2FtcGxlcy8yO2krKykgc3VtPXN1bStzYW1wW2ldKnNhbXBb
aSt0YXVdOwotLQkgICAgY29yclt0YXVdPWNvcnJbdGF1XStzdW07Ci0tCSAgICB9Ci0rCSAgICAj
IENhbGN1bGF0ZSBhbiBhdXRvY29ycmVsYXRpb24gZnVuY3Rpb24gb24gdGhlIHNlcXVlbmNlLgot
KwkgICAgIyBCZWNhdXNlIHRoZSB2YWx1ZXMgb2YgcmFuZCgpIHNob3VsZCBiZSBpbmRlcGVuZGVu
dCwgdGhlcmUKLSsJICAgICMgc2hvdWxkIGJlIG5vIHBlYWtzIGluIHRoZSBhdXRvY29ycmVsYXRp
b24uCi0gCi0tCX0KLS0gICAgIyBOb3JtYWxpemUgdGhlIGF1dG9jb3JyZWxhdGlvbiB0byB0aGUg
dGF1PTAgdmFsdWUuCi0rICAgICAgICAgICAgZm9yKHRhdT0wOyB0YXU8bnNhbXBsZXMvMjsgdGF1
KyspIHsKLSsJICAgICAgICBzdW09MDsKLSsJICAgICAgICBmb3IoaT0wO2k8bnNhbXBsZXMvMjtp
KyspIHN1bT1zdW0rc2FtcFtpXSpzYW1wW2krdGF1XTsKLSsJICAgICAgICBjb3JyW3RhdV09Y29y
clt0YXVdK3N1bTsKLSsgICAgICAgICAgICB9Ci0gCi0tICAgIG1heF9jb3JyPWNvcnJbMF07Ci0t
ICAgIGZvcih0YXU9MDt0YXU8bnNhbXBsZXMvMjt0YXUrKykgY29yclt0YXVdPWNvcnJbdGF1XS9t
YXhfY29ycjsKLSsgICAgICAgIH0KLSsgICAgICAgICMgTm9ybWFsaXplIHRoZSBhdXRvY29ycmVs
YXRpb24gdG8gdGhlIHRhdT0wIHZhbHVlLgotIAotLSAgICAjIE9QVElPTkFMTFkgUHJpbnQgb3V0
IHRoZSBhdXRvY29ycmVsYXRpb24gdmFsdWVzOgotKyAgICAgICAgbWF4X2NvcnI9Y29yclswXTsK
LSsgICAgICAgIGZvcih0YXU9MDt0YXU8bnNhbXBsZXMvMjt0YXUrKykgY29yclt0YXVdPWNvcnJb
dGF1XS9tYXhfY29ycjsKLSAKLS0gICAgIyBmb3IodGF1PTA7dGF1PG5zYW1wbGVzLzI7dGF1Kysp
IHByaW50IHRhdSwgY29yclt0YXVdID4gInBhaXJwb3dlcl9jb3JyLmRhdGEiOwotKyAgICAgICAg
IyBPUFRJT05BTExZIFByaW50IG91dCB0aGUgYXV0b2NvcnJlbGF0aW9uIHZhbHVlczoKLSAKLS0g
ICAgIyBDYWxjdWxhdGUgdGhlIHNpZ21hIGZvciB0aGUgbm9uLXplcm8gdGF1IHZhbHVlczogCi0r
ICAgICAgICAjIGZvcih0YXU9MDt0YXU8bnNhbXBsZXMvMjt0YXUrKykgcHJpbnQgdGF1LCBjb3Jy
W3RhdV0gPiAicGFpcnBvd2VyX2NvcnIuZGF0YSI7Ci0gCi0tICAgIHBvd2VyX3N1bT0wOwotKyAg
ICAgICAgIyBDYWxjdWxhdGUgdGhlIHNpZ21hIGZvciB0aGUgbm9uLXplcm8gdGF1IHZhbHVlczog
Ci0gCi0tICAgIGZvcih0YXU9MTt0YXU8bnNhbXBsZXMvMjt0YXUrKykgcG93ZXJfc3VtPXBvd2Vy
X3N1bSsoY29yclt0YXVdKV4yOwotKyAgICAgICAgcG93ZXJfc3VtPTA7Ci0gCi0tICAgIHNpZ21h
PXNxcnQocG93ZXJfc3VtLyhuc2FtcGxlcy8yLTEpKTsKLSsgICAgICAgIGZvcih0YXU9MTt0YXU8
bnNhbXBsZXMvMjt0YXUrKykgcG93ZXJfc3VtPXBvd2VyX3N1bSsoY29yclt0YXVdKV4yOwotIAot
LSAgICAjIFNlZSBpZiBhbnkgb2YgdGhlIGNvcnJlbGF0aW9ucyBleGNlZWQgYSByZWFzb25hYmxl
IG51bWJlciBvZiBzaWdtYToKLSsgICAgICAgIHNpZ21hPXNxcnQocG93ZXJfc3VtLyhuc2FtcGxl
cy8yLTEpKTsKLSAKLS0gICAgcGFzc2VkPTE7Ci0tICAgIGZvcih0YXU9MTt0YXU8bnNhbXBsZXMv
Mjt0YXUrKykgewotLQlpZiAoIGFicyhjb3JyW3RhdV0pL3NpZ21hID4gbWF4X2FsbG93ZWRfc2ln
bWEgKSB7Ci0tCSAgICBwcmludCAiVGF1PSIsIHRhdSAiLCBBdXRvY29ycj0iLCBjb3JyW3RhdV0v
c2lnbWEsICJzaWdtYSI7Ci0tCSAgICBwYXNzZWQ9MDsKLS0JICAgIH0KLSsgICAgICAgIGlmIChz
aWdtYSA8IDFlLTYpIHsKLSsgICAgICAgICAgICBwcmludCAiU2lnbWEgdG9vIHNtYWxsLCByZXRy
eWluZyBydW4iLCByZXRyeQotKyAgICAgICAgICAgIGNvbnRpbnVlCi0gICAgICAgICB9Ci0tICAg
IGlmKCFwYXNzZWQpIHsKLS0JcHJpbnQgIlRlc3QgZmFpbGVkLiIKLS0JZXhpdCgxKTsKLSsKLSsg
ICAgICAgICMgU2VlIGlmIGFueSBvZiB0aGUgY29ycmVsYXRpb25zIGV4Y2VlZCBhIHJlYXNvbmFi
bGUgbnVtYmVyIG9mIHNpZ21hOgotKwotKyAgICAgICAgZm9yKHRhdT0xO3RhdTxuc2FtcGxlcy8y
O3RhdSsrKSB7Ci0rICAgICAgICAgICAgaWYgKGFicyhjb3JyW3RhdV0pL3NpZ21hID4gbWF4X2Fs
bG93ZWRfc2lnbWEpIHsKLSsgICAgICAgICAgICAgICAgcHJpbnQgIlRhdT0iLCB0YXUgIiwgQXV0
b2NvcnI9IiwgY29yclt0YXVdL3NpZ21hLCAic2lnbWEiOwotKyAgICAgICAgICAgICAgICBwcmlu
dCAiVGVzdCBmYWlsZWQuIgotKyAgICAgICAgICAgICAgICBleGl0IDEKLSsgICAgICAgICAgICB9
Ci0gICAgICAgICB9Ci0tICAgIGVsc2UgZXhpdCAoMCk7Ci0rCi0rICAgICAgICBleGl0IDAKLSAg
ICAgfQotIAotKyAgICBwcmludCAiVGVzdCBmYWlsZWQgYWZ0ZXIgcmV0cmllcyBkdWUgdG8gdW5z
dGFibGUgc2lnbWEiCi0rICAgIGV4aXQgMQotK30KLSsKLSBmdW5jdGlvbiBhYnMoYWJzX2lucHV0
KSB7IHJldHVybihzcXJ0KGFic19pbnB1dF4yKSkgOyB9Ci0gJwotIAotLS0gCi0yLjM0LjEKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2dhd2svZ2F3ay8wMDAxLWNvbmZpZ3Vy
ZS5hYy1yZS1lbmFibGUtZGlzYWJsZWQtcHJpbnRmLWZlYXR1cmVzLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2dhd2svZ2F3ay8wMDAxLWNvbmZpZ3VyZS5hYy1yZS1lbmFibGUtZGlzYWJs
ZWQtcHJpbnRmLWZlYXR1cmVzLnBhdGNoCmluZGV4IGJjYmM1Njk1MzEuLjg4MmVkY2ExMTIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2svMDAwMS1jb25maWd1cmUu
YWMtcmUtZW5hYmxlLWRpc2FibGVkLXByaW50Zi1mZWF0dXJlcy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrLzAwMDEtY29uZmlndXJlLmFjLXJlLWVuYWJsZS1kaXNh
YmxlZC1wcmludGYtZmVhdHVyZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDljZTMxODQx
ODhlM2ZhMjc1ZmRlMDI1OGExNjVmNDQ0NmE2ZTgwZjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDUzODA4Y2JkYWIxZDEyYzk5YTRmYmFkZjRlYTEzNGI5ODY2NGU4YzcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4
LmRlPgogRGF0ZTogRnJpLCAyMiBOb3YgMjAyNCAxMjoxMzo1OCArMDEwMAogU3ViamVjdDogW1BB
VENIXSBjb25maWd1cmUuYWM6IHJlLWVuYWJsZSBkaXNhYmxlZCBwcmludGYgZmVhdHVyZXMKQEAg
LTEyLDEwICsxMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBs
aW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4
IDBjY2Q0NjAuLjdkZjdlNWIgMTAwNjQ0CitpbmRleCA0NzFmYmMxLi5kN2QxNzNhIDEwMDY0NAog
LS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC00MDAsNyArNDAwLDcg
QEAgaW50IG1haW4oKQorQEAgLTQwMiw3ICs0MDIsNyBAQCBpbnQgbWFpbigpCiAgXSldLAogIAlo
YXNfZl9mb3JtYXQ9eWVzLAogIAloYXNfZl9mb3JtYXQ9bm8sCkBAIC0yNCw3ICsyNCw3IEBAIGlu
ZGV4IDBjY2Q0NjAuLjdkZjdlNWIgMTAwNjQ0CiAgKQogIGlmIHRlc3QgIiRoYXNfZl9mb3JtYXQi
ID0geWVzCiAgdGhlbgotQEAgLTQyOSw3ICs0MjksNyBAQCBpbnQgbWFpbigpCitAQCAtNDMxLDcg
KzQzMSw3IEBAIGludCBtYWluKCkKICBdKV0sCiAgCWhhc19hX2Zvcm1hdD15ZXMsCiAgCWhhc19h
X2Zvcm1hdD1ubywKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2tf
NS40LjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUuNC4xLmJiCnNpbWls
YXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dh
d2tfNS40LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9nYXdrL2dhd2tfNS40
LjEuYmIKaW5kZXggNDE5MzQ1NmMxNC4uOGU4YmMzNDE1MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2dhd2svZ2F3a181LjQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvZ2F3ay9nYXdrXzUuNC4xLmJiCkBAIC0yOCwxMCArMjgsOSBAQCBQQUNLQUdFQ09ORklHW3Bt
YS1pZi02NGJpdF0gPSAiLS1lbmFibGUtcG1hLC0tZGlzYWJsZS1wbWEsICIKIFNSQ19VUkkgPSAi
JHtHTlVfTUlSUk9SfS9nYXdrL2dhd2stJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTov
L3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbmZpZ3VyZS5hYy1yZS1lbmFi
bGUtZGlzYWJsZWQtcHJpbnRmLWZlYXR1cmVzLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL3Jh
bmR0ZXN0LWZpeC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjNkZDQzMGYwY2QzYjQ0MjhjNmMzZjZhZmMwMjFiOWNkM2MxZjhjOTNmN2E2ODhkYzI2OGNhNDI4
YTkwYjRhYzEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDdmNmY3MzQyYjdmZWJlNDMxM2ZjMmMy
NTQyYWQ5M2Q2NGZlMjBhZDg3MTcyMDAxMDlmMTA1YTgyNmY1ZmQzNyIKIAogaW5oZXJpdCBhdXRv
dG9vbHMgZ2V0dGV4dCB0ZXhpbmZvIHVwZGF0ZS1hbHRlcm5hdGl2ZXMKIAotLSAKMi40Ny4xCgo=

--===============8374942937643486534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gawk/gawk-dbg: PKGSIZE changed from 3708912 to 3617496 (-2%)
packages/x86-64-v3-poky-linux/gawk/gawk-dbg: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-dbg: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-dev: PKGSIZE changed from 42496 to 42425 (-0%)
packages/x86-64-v3-poky-linux/gawk/gawk-dev: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-dev: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-doc: PKGSIZE changed from 2513532 to 2518754 (+0%)
packages/x86-64-v3-poky-linux/gawk/gawk-doc: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-doc: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-doc: FILELIST: removed "/usr/share/info/notes.info", added "/usr/share/info/gawknotes.info /usr/share/man/man3/intdiv.3am"
packages/x86-64-v3-poky-linux/gawk/gawk-gawkbug: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-gawkbug: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ar: PKGSIZE changed from 106437 to 107223 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ar: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ar: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-bg: PKGSIZE changed from 127208 to 128056 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-bg: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-bg: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-de: PKGSIZE changed from 98142 to 98839 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-de: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-de: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-es: PKGSIZE changed from 96998 to 97735 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-es: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-es: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-fr: PKGSIZE changed from 98361 to 99076 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-fr: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-fr: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-he: PKGSIZE changed from 87025 to 86827 (-0%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-he: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-he: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-id: PKGSIZE changed from 92616 to 93278 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-id: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-id: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-it: PKGSIZE changed from 94489 to 95333 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-it: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-it: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ko: PKGSIZE changed from 101914 to 102621 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ko: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ko: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-nl: PKGSIZE changed from 67087 to 77277 (+15%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-nl: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-nl: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pl: PKGSIZE changed from 96063 to 96733 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pl: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pl: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt-br: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt-br: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt: PKGSIZE changed from 92987 to 93683 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-pt: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ro: PKGSIZE changed from 99131 to 99851 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ro: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-ro: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sr: PKGSIZE changed from 116081 to 119300 (+3%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sr: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sr: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sv: PKGSIZE changed from 93870 to 94647 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sv: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-sv: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-tr: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-tr: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-uk: PKGSIZE changed from 123160 to 122991 (-0%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-uk: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-uk: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-locale-zh-cn: PKGSIZE changed from 85505 to 85361 (-0%)
packages/x86-64-v3-poky-linux/gawk/gawk-locale-zh-cn: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-locale-zh-cn: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-ptest: PKGSIZE changed from 1425742 to 1434598 (+1%)
packages/x86-64-v3-poky-linux/gawk/gawk-ptest: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-ptest: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-ptest: FILELIST: added "/usr/lib/gawk/ptest/test/fieldindex.ok /usr/lib/gawk/ptest/test/memleak4.awk /usr/lib/gawk/ptest/test/mdim9.ok /usr/lib/gawk/ptest/test/fieldindex.in /usr/lib/gawk/ptest/test/posix-inf.awk /usr/lib/gawk/ptest/test/memleak4.ok /usr/lib/gawk/ptest/test/splitany.awk /usr/lib/gawk/ptest/test/regexpbrack3.ok /usr/lib/gawk/ptest/test/fmtmix.awk /usr/lib/gawk/ptest/test/posix-inf.ok /usr/lib/gawk/ptest/test/fmtmix.ok /usr/lib/gawk/ptest/test/uplus2.ok /usr/lib/gawk/ptest/test/regexpbrack3.awk /usr/lib/gawk/ptest/test/fmtmix.in /usr/lib/gawk/ptest/test/uplus2.awk /usr/lib/gawk/ptest/test/greek-utf.ok /usr/lib/gawk/ptest/test/greek-equiv.ok /usr/lib/gawk/ptest/test/assignnumfield3.ok /usr/lib/gawk/ptest/test/greek-utf.awk /usr/lib/gawk/ptest/test/gensub5.in /usr/lib/gawk/ptest/test/gensub5.awk /usr/lib/gawk/ptest/test/fieldindex.awk /usr/lib/gawk/ptest/test/mdim9.awk /usr/lib/gawk/ptest/test/splitany.ok /usr/lib/gawk/ptest/test/g
 ensub5.ok /usr/lib/gawk/ptest/test/splitany.in /usr/lib/gawk/ptest/test/greek-equiv.awk /usr/lib/gawk/ptest/test/assignnumfield3.awk /usr/lib/gawk/ptest/test/posix-inf.ok2"
packages/x86-64-v3-poky-linux/gawk/gawk-src: PKGSIZE changed from 2709523 to 2715880 (+0%)
packages/x86-64-v3-poky-linux/gawk/gawk-src: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-src: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk-src: FILELIST: directory renamed /usr/src/debug/gawk/5.4.0/awklib -> /usr/src/debug/gawk/5.4.1/awklib, directory renamed /usr/src/debug/gawk/5.4.0/extension -> /usr/src/debug/gawk/5.4.1/extension, directory renamed /usr/src/debug/gawk/5.4.0 -> /usr/src/debug/gawk/5.4.1, directory renamed /usr/src/debug/gawk/5.4.0/posix -> /usr/src/debug/gawk/5.4.1/posix, directory renamed /usr/src/debug/gawk/5.4.0/support/malloc -> /usr/src/debug/gawk/5.4.1/support/malloc, directory renamed /usr/src/debug/gawk/5.4.0/support -> /usr/src/debug/gawk/5.4.1/support
packages/x86-64-v3-poky-linux/gawk/gawk-staticdev: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk-staticdev: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk: PKGSIZE changed from 1548653 to 1532198 (-1%)
packages/x86-64-v3-poky-linux/gawk/gawk: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk/gawk: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gawk/gawk: FILELIST: removed "/usr/bin/gawk-5.4.0", added "/usr/bin/gawk-5.4.1"
packages/x86-64-v3-poky-linux/gawk: PACKAGES: added "gawk-locale-ka"
packages/x86-64-v3-poky-linux/gawk: PV changed from "5.4.0" to "5.4.1"
packages/x86-64-v3-poky-linux/gawk: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/gawk/gawk-5.4.0.tar.xz file://run-ptest file://0001-configure.ac-re-enable-disabled-printf-features.patch file://randtest-fix.patch" to "https://ftpmirror.gnu.org/gnu/gawk/gawk-5.4.1.tar.xz file://run-ptest file://0001-configure.ac-re-enable-disabled-printf-features.patch"
packages/x86-64-v3-poky-linux/gawk: PKGV changed from 5.4.0 [default] to 5.4.1 [default]
packages/x86-64-v3-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 11330424 to 11130992 (-2%)
packages/x86-64-v3-poky-linux/glibc/glibc-src: PKGSIZE changed from 20246200 to 20246224 (+0%)
Changes to packages/x86_64-linux/gawk-native (sysroot):
  /usr/bin/gawk-5.4.0 moved to /usr/bin/gawk-5.4.1
Changes to packages/x86_64-linux/python3-build-native (sysroot):
  /usr/lib/python3.14/site-packages/build-1.5.1.dist-info moved to /usr/lib/python3.14/site-packages/build-1.5.0.dist-info

--===============8374942937643486534==--

