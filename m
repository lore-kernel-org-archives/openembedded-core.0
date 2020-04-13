Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.20344.1586798533825892172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 10:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=xr28b02Y;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.128.47, mailfrom: rahulk@mvista.com)
Received: by mail-wm1-f47.google.com with SMTP id h2so9985154wmb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2020 10:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=z7OP7Ijp7FiD7CizoiH3FbTM7goQV5EM/vzzajS7+OM=;
        b=xr28b02Y4Q6hBEN63tRjeYM1JWYhqy0cwBpwmpxEhvMaOuEvGXT6rRLCnB9Zotnx2L
         YkHbNFhp/uP8IHtv+8QUhqnuWgQnq4xwxsQYbt5y28PEv4/LvfqQZ6eEwrKpKAuonCNL
         7wrkbDyT5AmFnuvUCxaCdzDwrJeIZLIyz+B65snjSbi6WAmac4SDW2PpMr+mTbs7cxFs
         YYNqUZeXcNmke4OhzMP5fi8vDbi3a0kncqmbyOjsy2GnRymSVlCYFxNpdVinUF23gnrR
         /aSoFYoCPcgeSIFyjOR6LBebRjEHX/WdPMJf3lTum/WFgAxeiTj2R5KCX1oeIEVkZz4g
         P+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=z7OP7Ijp7FiD7CizoiH3FbTM7goQV5EM/vzzajS7+OM=;
        b=TBIqwXW4XkmP7MTct1FGy4DrqE5/4wStRaB5B4+r4Xlw+aqG2SGHAWnAiuZdTmxZCC
         g+n+pRbVnhnX4lpFmvB0IKurgEWg8BskqaExaGgEve3PAFBAgd/i+6aKAFcW7EVK8L93
         QUY6tEaP/b+5fUBsxcSjvW8+nhPQ67Oq13mM2ob2EbK7PcrtqRTWcFc8YHS7HdfYgxc7
         st+Iv7ZQtEjV46KAo3dqTv/e0KHPjyXvg+sm96VoHmvCZB5WMciQwD0lCa+1PEk66/As
         c9SAiTPUUTAh0KXZz2Kf1poNpr6jy78gLra4GeghjRjtnL6KO1Mw/ibYSTCpp90hmX4h
         JpKQ==
X-Gm-Message-State: AGi0PuYGbITWJTCM6Wl96FohGH1yywjiRRE4tFgV+U6g5hgRMmdUXthi
	RpHZiRjsYile8s/tBVMFsh/snEpXT1j+txBAJd674w==
X-Google-Smtp-Source: APiQypIbN3buvQyn3z1In40LXd8YUWeYFX429slear4RrzYBdlx5lgPkY6567gbwagnc7XMuKXGBPtnO1GX9iwIZT4E=
X-Received: by 2002:a1c:3d83:: with SMTP id k125mr21164010wma.177.1586798532134;
 Mon, 13 Apr 2020 10:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <1585825857-28025-1-git-send-email-rahulk@mvista.com> <90e01eab-2485-8a01-fae5-10f970d3242c@windriver.com>
In-Reply-To: <90e01eab-2485-8a01-fae5-10f970d3242c@windriver.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Mon, 13 Apr 2020 22:52:00 +0530
Message-ID: <CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bzip2: Add test suite for bzip2
To: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org
X-Groupsio-MsgNum: 137200
Content-Type: multipart/mixed; boundary="000000000000d7237505a32f52c9"

--000000000000d7237505a32f52c9
Content-Type: multipart/alternative; boundary="000000000000d7237205a32f52c7"

--000000000000d7237205a32f52c7
Content-Type: text/plain; charset="UTF-8"

Hi Randy,

Kindly find the attached bzip2 ptest logs file.
I answered your Question here .
Kindly take a look and feel free to point out if i am wrong at any place
and let me know if i missed anything.
==========
> +
> +modify run-tests script to write PASS/FAIL as expected by the ptest
infrastructure
> +
> +Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> +---
> + run-tests.sh | 83
+++++++++++++++++++++++++++++++-----------------------------
> + 1 file changed, 43 insertions(+), 40 deletions(-)
> +
> +diff --git a/run-tests.sh b/run-tests.sh
> +index 1ba8c27..1eff62a 100755
> +--- a/run-tests.sh
> ++++ b/run-tests.sh
> +@@ -10,7 +10,7 @@
> + VALGRIND="valgrind"
> + VALGRIND_ARGS="-q --error-exitcode=9"
> + BZIP2="bzip2"
> +-TESTS_DIR="."
> ++TESTS_DIR="./bzip2-tests"

Can you explain why you did this? Maybe upstream would accept it ?

Ans:
we need to parse the TEST_DIR Path because we are running runtest.sh script
outside the bzip2-tests directory.
But I figured out a more convenient way for this.
I will parse the TEST_DIR path during running the runscript.sh.

I can implement this by adding below line in makefile.am file.
./bzip2-tests/run-tests.sh --tests-dir="$(PWD)/bzip2-tests"

In Next version of patch I will implement it.

===========

> + IGNORE_MD5=0
> +
> + for i in "$@"
> +@@ -40,21 +40,21 @@ case $i in
> + esac
> + done
> +
> +-if ! type "valgrind" > /dev/null; then
> ++if ! type "valgrind" > /dev/null 2>&1; then
> +   VALGRIND=""
> +   VALGRIND_ARGS=""
> + fi

Explanation:

   if ! type "valgrind" > /dev/null;
   suppose if valgrind is not present in my image at that time it is
showing
./bzip2-tests/run-tests.sh: line 43: type: valgrind: not found

   Since we are displaying a message in script that valgrind is used or
not.

   So i redirect the output
   BY Modifying this line with "if ! type "valgrind" > /dev/null 2>&1"

==========

> + echo "Testing ${BZIP2} in directory ${TESTS_DIR}"
> + if [ "$VALGRIND" != "" ]; then
> +-  echo "  using valgrind"
> ++  echo "Using valgrind: Yes"
> + else
> +-  echo "  NOT using valgrind"
> ++  echo "Using valgrind: No"
> + fi
> + if [[ ${IGNORE_MD5} -eq 0 ]]; then
> +-  echo "  checking md5 sums"
> ++  echo "Checking md5 sums: Yes"
> + else
> +-  echo "  NOT checking md5 sums"
> ++  echo "Checking md5 sums: No"
> + fi
> +

Explanation:
I Simply modified valgrind and md5sum messages with Yes/No

==========

> + # Remove any left over tesfilecopies from previous runs first.
> +@@ -76,16 +76,16 @@ while IFS= read -r -d '' bzfile; do
> +   echo "Processing ${bzfile}"
> +
> +   # Decompress it.
> +-  echo "  Decompress..."
> ++  # echo "  Decompress..."

Explanation:
Initially for each file It is printing Decompress...
I think which is not required to display in ptest logs so i comment it out.

==========
> +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> +-    md5sum --check --status ${md5file} < ${file} \
> +-      || { echo "!!! md5sum doesn't match decompressed file";
> ++    md5sum -c ${md5file} < ${file} && { echo "PASS: ${bzfile} md5sum
Matched"; } \
> ++      || { echo "FAIL: ${bzfile} md5sum Matched";
> +            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
> +            nogood=$[${nogood}+1]; conti

Explanation:
for md5sum there is no short form option for --status option.
use of --status is "don't output anything, status code shows success"

md5sum -c ${md5file} < ${copy}
so i removed the --status option due to this below line is coming in ptest
log
-: OK

==========

+   echo "Bad results, look for !!! in the logs above"
+   printf ' - %s\n' "${badtests[@]}"
+-  exit 1
+ fi
+--

Explanation:
if some test failed then script is returning with exit 1 status due to this
at the end of ptest below message is printing
make: *** [Makefile:14: runtest] Error 1

logs wil looks like below if script returning with exit 1 status

PASS: Correctly found data integrity errors in
./bzip2-tests/lbzip2/void.bz2.bad during decompress (small)

Correctly found all bad file data integrity errors.

Bad results, look for !!! in the logs above
 - ./bzip2-tests/commons-compress/zip64support.tar.bz2 bad decompress result
 - ./bzip2-tests/go/regexp/re2-exhaustive.txt.bz2 bad decompress result
 - ./bzip2-tests/lbzip2/idx899999.bz2 bad decompress result
 - ./bzip2-tests/lbzip2/ch255.bz2 bad decompress result
 - ./bzip2-tests/pyflate/45MB-fb.bz2 bad decompress result
 - ./bzip2-tests/pyflate/45MB-00.bz2 bad decompress result
make: *** [Makefile:14: runtest] Error 1

ERROR: Exit status is 512
DURATION: 31
END: /usr/lib/bzip2/ptest
2020-04-13T16:05
STOP: ptest-runner
root@qemux86-64:~#

To avoid "make: *** [Makefile:14: runtest] Error 1" messgae
I removed exit 1 line from the script.
May be i am wrong please suggest me i should keep it or remove.

==========

>              file://configure.ac;subdir=${BP} \
>              file://Makefile.am;subdir=${BP} \
>              file://run-ptest \
> +
file://0001-bzip2-modify-run-tests-script.patch;patchdir=${WORKDIR}/git \
>              "
> +
>   SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
>   SRC_URI[sha256sum] =
"ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
>
> +SRCREV_bzip2-tests = "8b0198efda1603cf81fa2c7a9bb673dd22ae1661"
> +
>   UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
>
>   PACKAGES =+ "libbz2"
> @@ -39,7 +48,7 @@ do_install_ptest () {
>
>   FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
>
> -RDEPENDS_${PN}-ptest += "make"
> +RDEPENDS_${PN}-ptest += "make bash"

Does it really depend on bash or just a POSIX compliant /bin/sh ?
If it requires bash, how bad are the scripts and can they be made
POSIX compliant with the help of:
    https://www.shellcheck.net/
Ans.
This script is based on array concept and Arrays are not part of the POSIX
sh specification.
so i think we should go with bash script.

==========

> diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am
b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> index dcf6458..f917b23 100644
> --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> @@ -46,6 +46,7 @@ runtest:
>   else echo "FAIL: sample2 decompress"; fi
>   @if cmp sample3.tst sample3.ref; then echo "PASS: sample3 decompress";\
>   else echo "FAIL: sample3 decompress"; fi
> + ./bzip2-tests/run-tests.sh
>
>   install-ptest:
>   sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> @@ -56,6 +57,7 @@ install-ptest:
>   cp $(srcdir)/sample1.bz2 $(DESTDIR)/
>   cp $(srcdir)/sample2.bz2 $(DESTDIR)/
>   cp $(srcdir)/sample3.bz2 $(DESTDIR)/
> + cp -rf $(srcdir)/../git $(DESTDIR)/bzip2-tests
>   ln -s $(bindir)/bzip2 $(DESTDIR)/bzip2
>
>   install-exec-hook:
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> index 8e9b779..e8ec5c6 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and approaches the
performance of the PPM family of
>   HOMEPAGE = "https://sourceware.org/bzip2/"
>   SECTION = "console/utils"
>   LICENSE = "bzip2"
> -LIC_FILES_CHKSUM =
"file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
> -
> +LIC_FILES_CHKSUM =
"file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664
\
> +
 file://../git/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
> +
 file://../git/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f \
> +
 file://../git/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f
\
> +
 file://../git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327
\

What's all this additional license info about?
Please explain in when replying as well as in the long log.

Ans:
I don't have much knowledge about the licensing part so I populated all the
licenses which are present in the bzip2-tests source code.
can you please provide any suggestions on what basis we should take the
decision of the license population.
==========

Let me know if I missed anything here.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Fri, Apr 3, 2020 at 4:02 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2020-04-02 7:10 a.m., Rahul Kumar wrote:
> > [YOCTO #13444]
>
> Thanks for contributing this work Rahul.
>
> It would be good if the long log explained the changes made
> in a sentence or two. I've made some comments and asked
> some questions inline below. I may have gone overboard but
> I hope you get the idea that we'd like to see not just the
> changes but the reason for the changes.
>
> Also, can you present the results of running:
> # ptest-runner bzip2
> on qemux86-64 with kvm enabled in the long log?
> If there are tests that fail or are skipped
> comment on that even it it's to say that you don't know what is wrong.
>
> >
> > Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> > ---
> >   .../bzip2/0001-bzip2-modify-run-tests-script.patch | 220
> +++++++++++++++++++++
> >   meta/recipes-extended/bzip2/bzip2/Makefile.am      |   2 +
> >   meta/recipes-extended/bzip2/bzip2_1.0.8.bb         |  15 +-
> >   3 files changed, 234 insertions(+), 3 deletions(-)
> >   create mode 100644
> meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
> >
> > diff --git
> a/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
> b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
> > new file mode 100644
> > index 0000000..8ae3c4e
> > --- /dev/null
> > +++
> b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
> > @@ -0,0 +1,220 @@
> > +From 42e6258485030085285d4b30854bfb94bcf43880 Mon Sep 17 00:00:00 2001
> > +From: Rahul Kumar <rahulk@mvista.com>
> > +Date: Mon, 30 Mar 2020 12:17:00 +0530
> > +Subject: [PATCH] bzip2: modify run-tests script
> > +
> > +Upstream-Status: Inappropriate [ modify run-tests script for ptest
> infrastructure ]
>
> It seems that some of the changes are to make the tests less verbose and
> to 'tighten-up' the language and formatting used. Upstream might accept
> them, have you checked? If you change the status to Pending I think it
> would be better for now because that would force someone check on the
> progress at some point.
>
> > +
> > +modify run-tests script to write PASS/FAIL as expected by the ptest
> infrastructure
> > +
> > +Signed-off-by: Rahul Kumar <rahulk@mvista.com>
> > +---
> > + run-tests.sh | 83
> +++++++++++++++++++++++++++++++-----------------------------
> > + 1 file changed, 43 insertions(+), 40 deletions(-)
> > +
> > +diff --git a/run-tests.sh b/run-tests.sh
> > +index 1ba8c27..1eff62a 100755
> > +--- a/run-tests.sh
> > ++++ b/run-tests.sh
> > +@@ -10,7 +10,7 @@
> > + VALGRIND="valgrind"
> > + VALGRIND_ARGS="-q --error-exitcode=9"
> > + BZIP2="bzip2"
> > +-TESTS_DIR="."
> > ++TESTS_DIR="./bzip2-tests"
>
> Can you explain why you did this? Maybe upstream would accept it.
>
> > + IGNORE_MD5=0
> > +
> > + for i in "$@"
> > +@@ -40,21 +40,21 @@ case $i in
> > + esac
> > + done
> > +
> > +-if ! type "valgrind" > /dev/null; then
> > ++if ! type "valgrind" > /dev/null 2>&1; then
> > +   VALGRIND=""
> > +   VALGRIND_ARGS=""
> > + fi
> > +
> > + echo "Testing ${BZIP2} in directory ${TESTS_DIR}"
> > + if [ "$VALGRIND" != "" ]; then
> > +-  echo "  using valgrind"
> > ++  echo "Using valgrind: Yes"
> > + else
> > +-  echo "  NOT using valgrind"
> > ++  echo "Using valgrind: No"
> > + fi
> > + if [[ ${IGNORE_MD5} -eq 0 ]]; then
> > +-  echo "  checking md5 sums"
> > ++  echo "Checking md5 sums: Yes"
> > + else
> > +-  echo "  NOT checking md5 sums"
> > ++  echo "Checking md5 sums: No"
> > + fi
> > +
> > + # Remove any left over tesfilecopies from previous runs first.
> > +@@ -76,16 +76,16 @@ while IFS= read -r -d '' bzfile; do
> > +   echo "Processing ${bzfile}"
> > +
> > +   # Decompress it.
> > +-  echo "  Decompress..."
> > ++  # echo "  Decompress..."
>
> Without an explanation in the long log, I can't tell if this
> comment was removed intentionally or perhaps when you were debugging.
> I expect you have a good reason to remove it but an explaination would
> be helpful.
>
> > +   rm -f "${file}"
> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} \
> > +-    || { echo "!!! bad decompress result $?";
> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} && { echo
> "PASS: ${bzfile} Decompress"; } \
> > ++    || { echo "FAIL: ${bzfile} Decompress";
> > +          badtests=("${badtests[@]}" $"${bzfile} bad decompress result")
> > +          nogood=$[${nogood}+1]; continue; }
> > +
> > +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> > +-    md5sum --check --status ${md5file} < ${file} \
> > +-      || { echo "!!! md5sum doesn't match decompressed file";
> > ++    md5sum -c ${md5file} < ${file} && { echo "PASS: ${bzfile} md5sum
> Matched"; } \
> > ++      || { echo "FAIL: ${bzfile} md5sum Matched";
> > +            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
> > +            nogood=$[${nogood}+1]; continue; }
> > +   fi
> > +@@ -93,20 +93,20 @@ while IFS= read -r -d '' bzfile; do
> > +   # Compress and decompress a copy
> > +   mv "${file}" "${copy}"
> > +   rm -f "${bzcopy}"
> > +-  echo "  Recompress..."
> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
> > +-    || { echo "!!! bad compress result $?";
> > ++  # echo "  Recompress..."
> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo
> "PASS: ${bzfile} Recompress "; } \
> > ++    || { echo "FAIL: ${bzfile} Recompress";
> > +          badtests=("${badtests[@]}" $"${copy} bad result")
> > +          nogood=$[${nogood}+1]; continue; }
> > +-  echo "  Redecompress..."
> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
> > +-    || { echo "!!! bad (re)decompress result $?";
> > ++  # echo "  Redecompress..."
> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} && { echo
> "PASS: ${bzfile} Redecompress"; } \
> > ++    || { echo "FAIL: ${bzfile} Redecompress";
> > +          badtests=("${badtests[@]}" $"${bzcopy} bad result")
> > +          nogood=$[${nogood}+1]; continue; }
> > +
> > +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> > +-    md5sum --check --status ${md5file} < ${copy} \
> > +-      || { echo "!!! md5sum doesn't match (re)decompressed file";
> > ++    md5sum -c ${md5file} < ${copy} && { echo "PASS: ${bzfile} md5sum
> Matched"; } \
> > ++      || { echo "FAIL: ${bzfile} md5sum Matched";
> > +            badtests=("${badtests[@]}" $"${copy} md5sum doesn't match")
> > +            nogood=$[${nogood}+1]; continue; }
> > +   fi
> > +@@ -114,16 +114,16 @@ while IFS= read -r -d '' bzfile; do
> > +   rm "${copy}"
> > +
> > +   # Now do it all again in "small" mode.
> > +-  echo "  Decompress (small)..."
> > ++  # echo "  Decompress (small)..."
> > +   rm -f "${file}"
> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} \
> > +-    || { echo "!!! bad decompress result $?";
> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} &&{ echo
> "PASS: ${bzfile} Decompress (small)"; } \
> > ++    || { echo "FAIL: ${bzfile} Decompress (small)";
> > +          badtests=("${badtests[@]}" $"${bzfile} bad decompress result")
> > +          nogood=$[${nogood}+1]; continue; }
> > +
> > +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> > +-    md5sum --check --status ${md5file} < ${file} \
> > +-      || { echo "!!! md5sum doesn't match decompressed file";
> > ++    md5sum -c ${md5file} < ${file} > /dev/null 2>&1 && { echo "PASS:
> ${bzfile} Md5sum Matched"; } \
> > ++      || { echo "FAIL: ${bzfile} Md5sum Matched";
> > +            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
> > +            nogood=$[${nogood}+1]; continue; }
> > +   fi
> > +@@ -131,20 +131,20 @@ while IFS= read -r -d '' bzfile; do
> > +   # Compress and decompress a copy
> > +   mv "${file}" "${copy}"
> > +   rm -f "${bzcopy}"
> > +-  echo "  Recompress (small)..."
> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
> > +-    || { echo "!!! bad compress result $?";
> > ++  # echo "  Recompress (small)..."
> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo
> "PASS: ${bzfile} Recompress (small)"; } \
> > ++    || { echo "FAIL: ${bzfile} Recompress (small)";
> > +          badtests=("${badtests[@]}" $"${copy} bad result")
> > +          nogood=$[${nogood}+1]; continue; }
> > +-  echo "  Redecompress (small)..."
> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
> > +-    || { echo "!!! bad (re)decompress result $?";
> > ++  # echo "  Redecompress (small)..."
> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} && { echo
> "PASS: ${bzfile} Redecompress (small)"; } \
> > ++    || { echo "FAIL: ${bzfile} Redecompress (small)";
> > +          badtests=("${badtests[@]}" $"${bzcopy} bad result")
> > +          nogood=$[${nogood}+1]; continue; }
> > +
> > +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> > +-    md5sum --check --status ${md5file} < ${copy} \
> > +-      || { echo "!!! md5sum doesn't match (re)decompressed file";
> > ++    md5sum -c ${md5file} < ${copy} && { echo "PASS: ${bzfile} md5sum
> Matched"; } \
> > ++      || { echo "FAIL: ${bzfile} md5sum : Miss Matched";
> > +            badtests=("${badtests[@]}" $"${copy} md5sum doesn't match")
> > +            nogood=$[${nogood}+1]; continue; }
> > +   fi
> > +@@ -169,14 +169,14 @@ nobad=0
> > + badbad=0
> > + while IFS= read -r -d '' badfile; do
> > +
> > +-  echo "Processing ${badfile}"
> > ++  # echo "Processing ${badfile}"
> > +
> > +-  echo "  Trying to decompress..."
> > ++  # echo "  Trying to decompress..."
> > +   ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${badfile}
> > +   ret=$?
> > +
> > +   if [[ ${ret} -eq 0 ]]; then
> > +-    echo "!!! badness not detected"
> > ++    echo "FAIL: badness not detected"
> > +     nobad=$[${nobad}+1]
> > +     badtests=("${badtests[@]}" $"${badfile} badness not detected")
> > +     continue
> > +@@ -185,18 +185,20 @@ while IFS= read -r -d '' badfile; do
> > +   # Assumes "normal" badness is detected by exit code 1 or 2.
> > +   # A crash or valgrind issue will be reported with something else.
> > +   if [[ ${ret} != 1 ]] && [[ ${ret} != 2 ]]; then
> > +-    echo "!!! baddness caused baddness in ${BZIP2}"
> > ++    echo "FAIL: baddness caused baddness in ${BZIP2}"
> It's 'badness':
> https://www.merriam-webster.com/thesaurus/badness
> > +     badbad=$[${badbad}+1]
> > +     badtests=("${badtests[@]}" $"${badfile} badness caused baddness")
> > +     continue
> > ++  else
> > ++    echo "PASS: Correctly found data integrity errors in ${badfile}
> during decompress."
> > +   fi
> > +
> > +-  echo "  Trying to decompress (small)..."
> > ++  # echo "  Trying to decompress (small)..."
> > +   ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${badfile}
> > +   ret=$?
> > +
> > +   if [[ ${ret} -eq 0 ]]; then
> > +-    echo "!!! badness not detected"
> > ++    echo "FAIL: badness not detected "
> > +     nobad=$[${nobad}+1]
> > +     badtests=("${badtests[@]}" $"${badfile} badness not detected")
> > +     continue
> > +@@ -205,10 +207,12 @@ while IFS= read -r -d '' badfile; do
> > +   # Assumes "normal" badness is detected by exit code 1 or 2.
> > +   # A crash or valgrind issue will be reported with something else.
> > +   if [[ ${ret} != 1 ]] && [[ ${ret} != 2 ]]; then
> > +-    echo "!!! baddness caused baddness in ${BZIP2}"
> > ++    echo "FAIL: baddness caused baddness in ${BZIP2}"
> > +     badbad=$[${badbad}+1]
> > +     badtests=("${badtests[@]}" $"${badfile} badness caused baddness")
> > +     continue
> > ++  else
> > ++    echo "PASS: Correctly found data integrity errors in ${badfile}
> during decompress (small)"
> > +   fi
> > +
> > + done < <(find ${TESTS_DIR} -type f -name \*\.bz2.bad -print0)
> > +@@ -234,5 +238,4 @@ if [[ ${results} -eq 0 ]]; then
> > + else
> > +   echo "Bad results, look for !!! in the logs above"
> > +   printf ' - %s\n' "${badtests[@]}"
> > +-  exit 1
> > + fi
> > +--
> > +2.7.4
> > diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> > index dcf6458..f917b23 100644
> > --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> > +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> > @@ -46,6 +46,7 @@ runtest:
> >       else echo "FAIL: sample2 decompress"; fi
> >       @if cmp sample3.tst sample3.ref; then echo "PASS: sample3
> decompress";\
> >       else echo "FAIL: sample3 decompress"; fi
> > +     ./bzip2-tests/run-tests.sh
> >
> >   install-ptest:
> >       sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> > @@ -56,6 +57,7 @@ install-ptest:
> >       cp $(srcdir)/sample1.bz2        $(DESTDIR)/
> >       cp $(srcdir)/sample2.bz2        $(DESTDIR)/
> >       cp $(srcdir)/sample3.bz2        $(DESTDIR)/
> > +     cp -rf $(srcdir)/../git         $(DESTDIR)/bzip2-tests
> >       ln -s $(bindir)/bzip2           $(DESTDIR)/bzip2
> >
> >   install-exec-hook:
> > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > index 8e9b779..e8ec5c6 100644
> > --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and approaches the
> performance of the PPM family of
> >   HOMEPAGE = "https://sourceware.org/bzip2/"
> >   SECTION = "console/utils"
> >   LICENSE = "bzip2"
> > -LIC_FILES_CHKSUM =
> "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
> > -
> > +LIC_FILES_CHKSUM =
> "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664
> \
> > +
> file://../git/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
> > +
> file://../git/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f \
> > +
> file://../git/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f
> \
> > +
> file://../git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327
> \
>
> What's all this additional license info about?
> Please explain in when replying as well as in the long log.
>
> > +                   "
> >   SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
> > +           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \
>
> Mention how big this repo is in the long log.
>
> >              file://configure.ac;subdir=${BP} \
> >              file://Makefile.am;subdir=${BP} \
> >              file://run-ptest \
> > +
>  file://0001-bzip2-modify-run-tests-script.patch;patchdir=${WORKDIR}/git \
> >              "
> > +
> >   SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
> >   SRC_URI[sha256sum] =
> "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
> >
> > +SRCREV_bzip2-tests = "8b0198efda1603cf81fa2c7a9bb673dd22ae1661"
> > +
> >   UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
> >
> >   PACKAGES =+ "libbz2"
> > @@ -39,7 +48,7 @@ do_install_ptest () {
> >
> >   FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
> >
> > -RDEPENDS_${PN}-ptest += "make"
> > +RDEPENDS_${PN}-ptest += "make bash"
>
> Does it really depend on bash or just a POSIX compliant /bin/sh ?
> If it requires bash, how bad are the scripts and can they be made
> POSIX compliant with the help of:
>     https://www.shellcheck.net/
>
> ../Randy
>
> >
> >   PROVIDES_append_class-native = " bzip2-replacement-native"
> >   BBCLASSEXTEND = "native nativesdk"
> >
> >
> > 
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

--000000000000d7237205a32f52c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi Randy,<br><br>Kindly find the attached bzip2 p=
test logs file.<br>I answered your Question here .</div><div class=3D"gmail=
_default" style=3D"font-family:verdana,sans-serif;color:#0b5394">Kindly tak=
e a look and feel free to point out if i am wrong at any place and let me k=
now if i missed anything.=C2=A0</div><div class=3D"gmail_default" style=3D"=
font-family:verdana,sans-serif;color:#0b5394">=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>&gt; +<br>&gt; +modify run-tests script to write PASS/FAIL as expec=
ted by the ptest infrastructure<br>&gt; +<br>&gt; +Signed-off-by: Rahul Kum=
ar &lt;<a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@mvista=
.com</a>&gt;<br>&gt; +---<br>&gt; + run-tests.sh | 83 +++++++++++++++++++++=
++++++++++-----------------------------<br>&gt; + 1 file changed, 43 insert=
ions(+), 40 deletions(-)<br>&gt; +<br>&gt; +diff --git a/run-tests.sh b/run=
-tests.sh<br>&gt; +index 1ba8c27..1eff62a 100755<br>&gt; +--- a/run-tests.s=
h<br>&gt; ++++ b/run-tests.sh<br>&gt; +@@ -10,7 +10,7 @@<br>&gt; + VALGRIND=
=
=3D&quot;valgrind&quot;<br>&gt; + VALGRIND_ARGS=3D&quot;-q --error-exitcod=
e=3D9&quot;<br>&gt; + BZIP2=3D&quot;bzip2&quot;<br>&gt; +-TESTS_DIR=3D&quot=
;.&quot;<br>&gt; ++TESTS_DIR=3D&quot;./bzip2-tests&quot;<br><br>Can you exp=
lain why you did this? Maybe upstream would accept it ?<br><br>Ans: <br>we =
need to parse the TEST_DIR Path because we are running runtest.sh script ou=
tside the bzip2-tests directory.<br>But I figured out a more convenient way=
 for this.<br>I will parse the TEST_DIR path during running the runscript.s=
h.<br><br>I can implement this by adding below line in <a href=3D"http://ma=
kefile.am" target=3D"_blank">makefile.am</a> file.<br>./bzip2-tests/run-tes=
ts.sh --tests-dir=3D&quot;$(PWD)/bzip2-tests&quot; <br><br>In Next version =
of patch I will implement it.<br><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><=
br>&gt; + IGNORE_MD5=3D0<br>&gt; +<br>&gt; + for i in &quot;$@&quot;<br>&gt=
; +@@ -40,21 +40,21 @@ case $i in<br>&gt; + esac<br>&gt; + done<br>&gt; +<b=
r>&gt; +-if ! type &quot;valgrind&quot; &gt; /dev/null; then<br>&gt; ++if !=
 type &quot;valgrind&quot; &gt; /dev/null 2&gt;&amp;1; then<br>&gt; + =C2=
=A0 VALGRIND=3D&quot;&quot;<br>&gt; + =C2=A0 VALGRIND_ARGS=3D&quot;&quot;<=
br>&gt; + fi<br><br>Explanation:<br>=C2=A0<br>=C2=A0 =C2=A0if ! type &quot;=
valgrind&quot; &gt; /dev/null;<br>=C2=A0 =C2=A0suppose if valgrind is not p=
resent in my image at that time it is showing <br>	./bzip2-tests/run-tests.=
sh: line 43: type: valgrind: not found<br><br>=C2=A0 =C2=A0Since we are dis=
playing a message in script that valgrind is used or not. =C2=A0 =C2=A0<br>=
=
=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0So i redirect the output<br>=C2=A0 =C2=A0BY=
 Modifying this line with &quot;if ! type &quot;valgrind&quot; &gt; /dev/nu=
ll 2&gt;&amp;1&quot; <br>=C2=A0 =C2=A0 =C2=A0<br>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D<br><br>&gt; + echo &quot;Testing ${BZIP2} in directory ${TESTS_DIR}=
&quot;<br>&gt; + if [ &quot;$VALGRIND&quot; !=3D &quot;&quot; ]; then<br>&g=
t; +- =C2=A0echo &quot; =C2=A0using valgrind&quot;<br>&gt; ++ =C2=A0echo &q=
uot;Using valgrind: Yes&quot;<br>&gt; + else<br>&gt; +- =C2=A0echo &quot; =
=C2=A0NOT using valgrind&quot;<br>&gt; ++ =C2=A0echo &quot;Using valgrind:=
 No&quot;<br>&gt; + fi<br>&gt; + if [[ ${IGNORE_MD5} -eq 0 ]]; then<br>&gt;=
 +- =C2=A0echo &quot; =C2=A0checking md5 sums&quot;<br>&gt; ++ =C2=A0echo &=
quot;Checking md5 sums: Yes&quot;<br>&gt; + else<br>&gt; +- =C2=A0echo &quo=
t; =C2=A0NOT checking md5 sums&quot;<br>&gt; ++ =C2=A0echo &quot;Checking m=
d5 sums: No&quot;<br>&gt; + fi<br>&gt; +<br><br>Explanation:<br>I Simply mo=
dified valgrind and md5sum messages with Yes/No<br><br>=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br><br>&gt; + # Remove any left over tesfilecopies from previ=
ous runs first.<br>&gt; +@@ -76,16 +76,16 @@ while IFS=3D read -r -d &#39;&=
#39; bzfile; do<br>&gt; + =C2=A0 echo &quot;Processing ${bzfile}&quot;<br>&=
gt; +<br>&gt; + =C2=A0 # Decompress it.<br>&gt; +- =C2=A0echo &quot; =C2=A0=
Decompress...&quot;<br>&gt; ++ =C2=A0# echo &quot; =C2=A0Decompress...&quot=
;<br><br>Explanation:<br>Initially for each file It is printing Decompress.=
.. <br>I think which is not required to display in ptest logs so i comment =
it out.<br><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; + =C2=A0 if [[ ${IGNO=
RE_MD5} -ne 1 ]]; then<br>&gt; +- =C2=A0 =C2=A0md5sum --check --status ${md=
5file} &lt; ${file} \<br>&gt; +- =C2=A0 =C2=A0 =C2=A0|| { echo &quot;!!! md=
5sum doesn&#39;t match decompressed file&quot;;<br>&gt; ++ =C2=A0 =C2=A0md5=
sum -c ${md5file} &lt; ${file} &amp;&amp; { echo &quot;PASS: ${bzfile} md5s=
um Matched&quot;; } \<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0|| { echo &quot;FAIL: =
${bzfile} md5sum Matched&quot;;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0badtests=3D(&quot;${badtests[@]}&quot; $&quot;${file} md5sum doe=
sn&#39;t match&quot;)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no=
good=3D$[${nogood}+1]; conti<br><br>Explanation:<br>for md5sum there is no =
short form option for --status option. <br>use of --status is &quot;don&#39=
;t output anything, status code shows success&quot; <br><br>md5sum -c ${md5=
file} &lt; ${copy}<br>so i removed the --status option due to this below li=
ne is coming in ptest log<br>-: OK<br><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
><br>+ =C2=A0 echo &quot;Bad results, look for !!! in the logs above&quot;<=
br>+ =C2=A0 printf &#39; - %s\n&#39; &quot;${badtests[@]}&quot;<br>+- =C2=
=A0exit 1<br>+ fi<br>+--<br><br>Explanation:<br>if some test failed then s=
cript is returning with exit 1 status due to this at the end of ptest below=
 message is printing<br>make: *** [Makefile:14: runtest] Error 1<br><br>log=
s wil looks like below if script returning with exit 1 status=C2=A0<br><br>=
PASS: Correctly found data integrity errors in ./bzip2-tests/lbzip2/void.bz=
2.bad during decompress (small)<br><br>Correctly found all bad file data in=
tegrity errors.<br><br>Bad results, look for !!! in the logs above<br>=C2=
=A0- ./bzip2-tests/commons-compress/zip64support.tar.bz2 bad decompress re=
sult<br>=C2=A0- ./bzip2-tests/go/regexp/re2-exhaustive.txt.bz2 bad decompre=
ss result<br>=C2=A0- ./bzip2-tests/lbzip2/idx899999.bz2 bad decompress resu=
lt<br>=C2=A0- ./bzip2-tests/lbzip2/ch255.bz2 bad decompress result<br>=C2=
=A0- ./bzip2-tests/pyflate/45MB-fb.bz2 bad decompress result<br>=C2=A0- ./=
bzip2-tests/pyflate/45MB-00.bz2 bad decompress result<br>make: *** [Makefil=
e:14: runtest] Error 1<br><br>ERROR: Exit status is 512<br>DURATION: 31<br>=
END: /usr/lib/bzip2/ptest<br>2020-04-13T16:05<br>STOP: ptest-runner<br>root=
@qemux86-64:~#<br><br>To avoid &quot;make: *** [Makefile:14: runtest] Error=
 1&quot; messgae<br>I removed exit 1 line from the script.<br>May be i am w=
rong please suggest me i should keep it or remove.<br><br>=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br><br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</=
a>;subdir=3D${BP} \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://Makefile.am;subdir=3D${BP} \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file://0001-bzip2-modify-run-tests-script.patch;patchdir=3D${WO=
RKDIR}/git \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>&gt; +<br>&gt; =C2=A0 SRC_URI[md5sum] =3D &quot;67e051268d0c475ea773822=
f7500d0e5&quot;<br>&gt; =C2=A0 SRC_URI[sha256sum] =3D &quot;ab5a03176ee106d=
3f0fa90e381da478ddae405918153cca248e682cd0c4a2269&quot;<br>&gt; =C2=A0 <br>=
&gt; +SRCREV_bzip2-tests =3D &quot;8b0198efda1603cf81fa2c7a9bb673dd22ae1661=
&quot;<br>&gt; +<br>&gt; =C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"htt=
ps://www.sourceware.org/pub/bzip2/" target=3D"_blank">https://www.sourcewar=
e.org/pub/bzip2/</a>&quot;<br>&gt; =C2=A0 <br>&gt; =C2=A0 PACKAGES =3D+ &qu=
ot;libbz2&quot;<br>&gt; @@ -39,7 +48,7 @@ do_install_ptest () {<br>&gt; =C2=
=
=A0 <br>&gt; =C2=A0 FILES_libbz2 =3D &quot;${libdir}/lib*${SOLIBS}&quot;<b=
r>&gt; =C2=A0 <br>&gt; -RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>&gt; =
+RDEPENDS_${PN}-ptest +=3D &quot;make bash&quot;<br><br>Does it really depe=
nd on bash or just a POSIX compliant /bin/sh ?<br>If it requires bash, how =
bad are the scripts and can they be made<br>POSIX compliant with the help o=
f:<br>=C2=A0 =C2=A0 <a href=3D"https://www.shellcheck.net/" target=3D"_blan=
k">https://www.shellcheck.net/</a><br>Ans.<br>This script is based on array=
 concept and Arrays are not part of the POSIX sh specification. <br>so i th=
ink we should go with bash script.<br><br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
><br>&gt; diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta=
/recipes-extended/bzip2/bzip2/Makefile.am<br>&gt; index dcf6458..f917b23 10=
0644<br>&gt; --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>&gt; ++=
+ b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>&gt; @@ -46,6 +46,7 @@=
 runtest:<br>&gt; =C2=A0 =09else echo &quot;FAIL: sample2 decompress&quot;;=
 fi<br>&gt; =C2=A0 =09@if cmp sample3.tst sample3.ref; then echo &quot;PASS=
: sample3 decompress&quot;;\<br>&gt; =C2=A0 =09else echo &quot;FAIL: sample=
3 decompress&quot;; fi<br>&gt; +	./bzip2-tests/run-tests.sh<br>&gt; =C2=A0 =
<br>&gt; =C2=A0 install-ptest:<br>&gt; =C2=A0 =09sed =C2=A0-n &#39;/^runtes=
t:/,/^install-ptest:/{/^install-ptest:/!p}&#39; \<br>&gt; @@ -56,6 +57,7 @@=
 install-ptest:<br>&gt; =C2=A0 =09cp $(srcdir)/sample1.bz2	$(DESTDIR)/<br>&=
gt; =C2=A0 =09cp $(srcdir)/sample2.bz2	$(DESTDIR)/<br>&gt; =C2=A0 =09cp $(s=
rcdir)/sample3.bz2	$(DESTDIR)/<br>&gt; +	cp -rf $(srcdir)/../git	=09$(DESTD=
IR)/bzip2-tests<br>&gt; =C2=A0 =09ln -s $(bindir)/bzip2	=09$(DESTDIR)/bzip2=
<br>&gt; =C2=A0 <br>&gt; =C2=A0 install-exec-hook:<br>&gt; diff --git a/met=
a/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" target=3D"_blank=
">bzip2_1.0.8.bb</a> b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_=
1.0.8.bb" target=3D"_blank">bzip2_1.0.8.bb</a><br>&gt; index 8e9b779..e8ec5=
c6 100644<br>&gt; --- a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2=
_1.0.8.bb" target=3D"_blank">bzip2_1.0.8.bb</a><br>&gt; +++ b/meta/recipes-=
extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" target=3D"_blank">bzip2_1.=
0.8.bb</a><br>&gt; @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and appro=
aches the performance of the PPM family of<br>&gt; =C2=A0 HOMEPAGE =3D &quo=
t;<a href=3D"https://sourceware.org/bzip2/" target=3D"_blank">https://sourc=
eware.org/bzip2/</a>&quot;<br>&gt; =C2=A0 SECTION =3D &quot;console/utils&q=
uot;<br>&gt; =C2=A0 LICENSE =3D &quot;bzip2&quot;<br>&gt; -LIC_FILES_CHKSUM=
 =3D &quot;file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb8=
2e32f19b32df4664&quot;<br>&gt; -<br>&gt; +LIC_FILES_CHKSUM =3D &quot;file:/=
/LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82e32f19b32df4664 =
\<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0file://../git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \<br=
>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://../git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7e8ff352a=
54f \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0file://../git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5d=
b6b79e6de0a029f \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0file://../git/commons-compress/LICENSE.txt;md5=3D8=
6d3f3a95c324c9479bd8986968f4327 \<br><br>What&#39;s all this additional lic=
ense info about?<br>Please explain in when replying as well as in the long =
log.<br><br>Ans:<br>I don&#39;t have much knowledge about the licensing par=
t so I populated all the licenses which are present in the bzip2-tests sour=
ce code.<br>can you please provide any suggestions on what basis we should =
take the decision of the license population. <br>=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D</div><div class=3D"gmail_default" style=3D"font-family:verdana,sans=
-serif;color:#0b5394"><br></div><div class=3D"gmail_default" style=3D"font-=
family:verdana,sans-serif;color:#0b5394">Let me know if I missed anything h=
ere.=C2=A0<br><br></div><div><div dir=3D"ltr" data-smartmail=3D"gmail_signa=
ture"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><span style=
=3D"color:rgb(111,168,220)">	=09
  =09
  
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b=
></span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"co=
lor:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><s=
pan style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"=
color:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</s=
pan></span></div><div><span style=3D"color:rgb(11,83,148)">Software Enginee=
r,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,=
83,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"col=
or:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mail=
to:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span>=
<span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener"=
 target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:=
10pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 3,=
 2020 at 4:02 AM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windrive=
r.com" target=3D"_blank">randy.macleod@windriver.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On 2020-04-02 7:10 a.m.=
, Rahul Kumar wrote:<br>
&gt; [YOCTO #13444]<br>
<br>
Thanks for contributing this work Rahul.<br>
<br>
It would be good if the long log explained the changes made<br>
in a sentence or two. I&#39;ve made some comments and asked<br>
some questions inline below. I may have gone overboard but<br>
I hope you get the idea that we&#39;d like to see not just the<br>
changes but the reason for the changes.<br>
<br>
Also, can you present the results of running:<br>
# ptest-runner bzip2<br>
on qemux86-64 with kvm enabled in the long log?<br>
If there are tests that fail or are skipped<br>
comment on that even it it&#39;s to say that you don&#39;t know what is wr=
ong.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com" t=
arget=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../bzip2/0001-bzip2-modify-run-tests-script.patch | 220 =
+++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0meta/recipes-extended/bzip2/bzip2/Makefile.am=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8=
.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +-<br>
&gt;=C2=A0 =C2=A03 files changed, 234 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-extended/bzip2/bzip2/0001=
-bzip2-modify-run-tests-script.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-=
tests-script.patch b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-ru=
n-tests-script.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..8ae3c4e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-s=
cript.patch<br>
&gt; @@ -0,0 +1,220 @@<br>
&gt; +From 42e6258485030085285d4b30854bfb94bcf43880 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com" target=3D=
"_blank">rahulk@mvista.com</a>&gt;<br>
&gt; +Date: Mon, 30 Mar 2020 12:17:00 +0530<br>
&gt; +Subject: [PATCH] bzip2: modify run-tests script<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [ modify run-tests script for ptest i=
nfrastructure ]<br>
<br>
It seems that some of the changes are to make the tests less verbose and<b=
r>
to &#39;tighten-up&#39; the language and formatting used. Upstream might a=
ccept<br>
them, have you checked? If you change the status to Pending I think it<br>
would be better for now because that would force someone check on the<br>
progress at some point.<br>
<br>
&gt; +<br>
&gt; +modify run-tests script to write PASS/FAIL as expected by the ptest =
infrastructure<br>
&gt; +<br>
&gt; +Signed-off-by: Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com" =
target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + run-tests.sh | 83 +++++++++++++++++++++++++++++++------------------=
-----------<br>
&gt; + 1 file changed, 43 insertions(+), 40 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/run-tests.sh b/run-tests.sh<br>
&gt; +index 1ba8c27..1eff62a 100755<br>
&gt; +--- a/run-tests.sh<br>
&gt; ++++ b/run-tests.sh<br>
&gt; +@@ -10,7 +10,7 @@<br>
&gt; + VALGRIND=3D&quot;valgrind&quot;<br>
&gt; + VALGRIND_ARGS=3D&quot;-q --error-exitcode=3D9&quot;<br>
&gt; + BZIP2=3D&quot;bzip2&quot;<br>
&gt; +-TESTS_DIR=3D&quot;.&quot;<br>
&gt; ++TESTS_DIR=3D&quot;./bzip2-tests&quot;<br>
<br>
Can you explain why you did this? Maybe upstream would accept it.<br>
<br>
&gt; + IGNORE_MD5=3D0<br>
&gt; +<br>
&gt; + for i in &quot;$@&quot;<br>
&gt; +@@ -40,21 +40,21 @@ case $i in<br>
&gt; + esac<br>
&gt; + done<br>
&gt; +<br>
&gt; +-if ! type &quot;valgrind&quot; &gt; /dev/null; then<br>
&gt; ++if ! type &quot;valgrind&quot; &gt; /dev/null 2&gt;&amp;1; then<br>
&gt; +=C2=A0 =C2=A0VALGRIND=3D&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0VALGRIND_ARGS=3D&quot;&quot;<br>
&gt; + fi<br>
&gt; +<br>
&gt; + echo &quot;Testing ${BZIP2} in directory ${TESTS_DIR}&quot;<br>
&gt; + if [ &quot;$VALGRIND&quot; !=3D &quot;&quot; ]; then<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 using valgrind&quot;<br>
&gt; ++=C2=A0 echo &quot;Using valgrind: Yes&quot;<br>
&gt; + else<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 NOT using valgrind&quot;<br>
&gt; ++=C2=A0 echo &quot;Using valgrind: No&quot;<br>
&gt; + fi<br>
&gt; + if [[ ${IGNORE_MD5} -eq 0 ]]; then<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 checking md5 sums&quot;<br>
&gt; ++=C2=A0 echo &quot;Checking md5 sums: Yes&quot;<br>
&gt; + else<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 NOT checking md5 sums&quot;<br>
&gt; ++=C2=A0 echo &quot;Checking md5 sums: No&quot;<br>
&gt; + fi<br>
&gt; +<br>
&gt; + # Remove any left over tesfilecopies from previous runs first.<br>
&gt; +@@ -76,16 +76,16 @@ while IFS=3D read -r -d &#39;&#39; bzfile; do<br=
>
&gt; +=C2=A0 =C2=A0echo &quot;Processing ${bzfile}&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0# Decompress it.<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 Decompress...&quot;<br>
&gt; ++=C2=A0 # echo &quot;=C2=A0 Decompress...&quot;<br>
<br>
Without an explanation in the long log, I can&#39;t tell if this<br>
comment was removed intentionally or perhaps when you were debugging.<br>
I expect you have a good reason to remove it but an explaination would<br>
be helpful.<br>
<br>
&gt; +=C2=A0 =C2=A0rm -f &quot;${file}&quot;<br>
&gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} \<b=
r>
&gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad decompress result $?&quot;;<b=
r>
&gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} &am=
p;&amp; { echo &quot;PASS: ${bzfile} Decompress&quot;; } \<br>
&gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Decompress&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${badtests[@]}&=
quot; $&quot;${bzfile} bad decompress result&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; continue=
; }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
&gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${file} \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo &quot;!!! md5sum doesn&#39;t match d=
ecompressed file&quot;;<br>
&gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${file} &amp;&amp; { echo &=
quot;PASS: ${bzfile} md5sum Matched&quot;; } \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} md5sum Matched=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${badtes=
ts[@]}&quot; $&quot;${file} md5sum doesn&#39;t match&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; c=
ontinue; }<br>
&gt; +=C2=A0 =C2=A0fi<br>
&gt; +@@ -93,20 +93,20 @@ while IFS=3D read -r -d &#39;&#39; bzfile; do<br=
>
&gt; +=C2=A0 =C2=A0# Compress and decompress a copy<br>
&gt; +=C2=A0 =C2=A0mv &quot;${file}&quot; &quot;${copy}&quot;<br>
&gt; +=C2=A0 =C2=A0rm -f &quot;${bzcopy}&quot;<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 Recompress...&quot;<br>
&gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \<br>
&gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad compress result $?&quot;;<br>
&gt; ++=C2=A0 # echo &quot;=C2=A0 Recompress...&quot;<br>
&gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} &amp;=
&amp; { echo &quot;PASS: ${bzfile} Recompress &quot;; } \<br>
&gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Recompress&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${badtests[@]}&=
quot; $&quot;${copy} bad result&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; continue=
; }<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 Redecompress...&quot;<br>
&gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \<b=
r>
&gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad (re)decompress result $?&quot=
;;<br>
&gt; ++=C2=A0 # echo &quot;=C2=A0 Redecompress...&quot;<br>
&gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} &am=
p;&amp; { echo &quot;PASS: ${bzfile} Redecompress&quot;; } \<br>
&gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Redecompress&quot;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${badtests[@]}&=
quot; $&quot;${bzcopy} bad result&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; continue=
; }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
&gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${copy} \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo &quot;!!! md5sum doesn&#39;t match (=
re)decompressed file&quot;;<br>
&gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${copy} &amp;&amp; { echo &=
quot;PASS: ${bzfile} md5sum Matched&quot;; } \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} md5sum Matched=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${badtes=
ts[@]}&quot; $&quot;${copy} md5sum doesn&#39;t match&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; c=
ontinue; }<br>
&gt; +=C2=A0 =C2=A0fi<br>
&gt; +@@ -114,16 +114,16 @@ while IFS=3D read -r -d &#39;&#39; bzfile; do<=
br>
&gt; +=C2=A0 =C2=A0rm &quot;${copy}&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0# Now do it all again in &quot;small&quot; mode.<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 Decompress (small)...&quot;<br>
&gt; ++=C2=A0 # echo &quot;=C2=A0 Decompress (small)...&quot;<br>
&gt; +=C2=A0 =C2=A0rm -f &quot;${file}&quot;<br>
&gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} =
\<br>
&gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad decompress result $?&quot;;<b=
r>
&gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} =
&amp;&amp;{ echo &quot;PASS: ${bzfile} Decompress (small)&quot;; } \<br>
&gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Decompress (small)&qu=
ot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${badtests[@]}&=
quot; $&quot;${bzfile} bad decompress result&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; continue=
; }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
&gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${file} \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo &quot;!!! md5sum doesn&#39;t match d=
ecompressed file&quot;;<br>
&gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${file} &gt; /dev/null 2&gt=
;&amp;1 &amp;&amp; { echo &quot;PASS: ${bzfile} Md5sum Matched&quot;; } \<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Md5sum Matched=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${badtes=
ts[@]}&quot; $&quot;${file} md5sum doesn&#39;t match&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; c=
ontinue; }<br>
&gt; +=C2=A0 =C2=A0fi<br>
&gt; +@@ -131,20 +131,20 @@ while IFS=3D read -r -d &#39;&#39; bzfile; do<=
br>
&gt; +=C2=A0 =C2=A0# Compress and decompress a copy<br>
&gt; +=C2=A0 =C2=A0mv &quot;${file}&quot; &quot;${copy}&quot;<br>
&gt; +=C2=A0 =C2=A0rm -f &quot;${bzcopy}&quot;<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 Recompress (small)...&quot;<br>
&gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \<br>
&gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad compress result $?&quot;;<br>
&gt; ++=C2=A0 # echo &quot;=C2=A0 Recompress (small)...&quot;<br>
&gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} &amp;=
&amp; { echo &quot;PASS: ${bzfile} Recompress (small)&quot;; } \<br>
&gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Recompress (small)&qu=
ot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${badtests[@]}&=
quot; $&quot;${copy} bad result&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; continue=
; }<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 Redecompress (small)...&quot;<br>
&gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \<b=
r>
&gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad (re)decompress result $?&quot=
;;<br>
&gt; ++=C2=A0 # echo &quot;=C2=A0 Redecompress (small)...&quot;<br>
&gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} &am=
p;&amp; { echo &quot;PASS: ${bzfile} Redecompress (small)&quot;; } \<br>
&gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Redecompress (small)&=
quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${badtests[@]}&=
quot; $&quot;${bzcopy} bad result&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; continue=
; }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
&gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${copy} \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo &quot;!!! md5sum doesn&#39;t match (=
re)decompressed file&quot;;<br>
&gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${copy} &amp;&amp; { echo &=
quot;PASS: ${bzfile} md5sum Matched&quot;; } \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} md5sum : Miss =
Matched&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${badtes=
ts[@]}&quot; $&quot;${copy} md5sum doesn&#39;t match&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]; c=
ontinue; }<br>
&gt; +=C2=A0 =C2=A0fi<br>
&gt; +@@ -169,14 +169,14 @@ nobad=3D0<br>
&gt; + badbad=3D0<br>
&gt; + while IFS=3D read -r -d &#39;&#39; badfile; do<br>
&gt; +<br>
&gt; +-=C2=A0 echo &quot;Processing ${badfile}&quot;<br>
&gt; ++=C2=A0 # echo &quot;Processing ${badfile}&quot;<br>
&gt; +<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 Trying to decompress...&quot;<br>
&gt; ++=C2=A0 # echo &quot;=C2=A0 Trying to decompress...&quot;<br>
&gt; +=C2=A0 =C2=A0${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${badfil=
e}<br>
&gt; +=C2=A0 =C2=A0ret=3D$?<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if [[ ${ret} -eq 0 ]]; then<br>
&gt; +-=C2=A0 =C2=A0 echo &quot;!!! badness not detected&quot;<br>
&gt; ++=C2=A0 =C2=A0 echo &quot;FAIL: badness not detected&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nobad=3D$[${nobad}+1]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D(&quot;${badtests[@]}&quot; $&quot;${=
badfile} badness not detected&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
&gt; +@@ -185,18 +185,20 @@ while IFS=3D read -r -d &#39;&#39; badfile; do=
<br>
&gt; +=C2=A0 =C2=A0# Assumes &quot;normal&quot; badness is detected by exi=
t code 1 or 2.<br>
&gt; +=C2=A0 =C2=A0# A crash or valgrind issue will be reported with somet=
hing else.<br>
&gt; +=C2=A0 =C2=A0if [[ ${ret} !=3D 1 ]] &amp;&amp; [[ ${ret} !=3D 2 ]]; =
then<br>
&gt; +-=C2=A0 =C2=A0 echo &quot;!!! baddness caused baddness in ${BZIP2}&q=
uot;<br>
&gt; ++=C2=A0 =C2=A0 echo &quot;FAIL: baddness caused baddness in ${BZIP2}=
&quot;<br>
It&#39;s &#39;badness&#39;:<br>
<a href=3D"https://www.merriam-webster.com/thesaurus/badness" rel=3D"noref=
errer" target=3D"_blank">https://www.merriam-webster.com/thesaurus/badness<=
/a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0badbad=3D$[${badbad}+1]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D(&quot;${badtests[@]}&quot; $&quot;${=
badfile} badness caused baddness&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
&gt; ++=C2=A0 else<br>
&gt; ++=C2=A0 =C2=A0 echo &quot;PASS: Correctly found data integrity error=
s in ${badfile} during decompress.&quot;<br>
&gt; +=C2=A0 =C2=A0fi<br>
&gt; +<br>
&gt; +-=C2=A0 echo &quot;=C2=A0 Trying to decompress (small)...&quot;<br>
&gt; ++=C2=A0 # echo &quot;=C2=A0 Trying to decompress (small)...&quot;<br=
>
&gt; +=C2=A0 =C2=A0${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bad=
file}<br>
&gt; +=C2=A0 =C2=A0ret=3D$?<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if [[ ${ret} -eq 0 ]]; then<br>
&gt; +-=C2=A0 =C2=A0 echo &quot;!!! badness not detected&quot;<br>
&gt; ++=C2=A0 =C2=A0 echo &quot;FAIL: badness not detected &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nobad=3D$[${nobad}+1]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D(&quot;${badtests[@]}&quot; $&quot;${=
badfile} badness not detected&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
&gt; +@@ -205,10 +207,12 @@ while IFS=3D read -r -d &#39;&#39; badfile; do=
<br>
&gt; +=C2=A0 =C2=A0# Assumes &quot;normal&quot; badness is detected by exi=
t code 1 or 2.<br>
&gt; +=C2=A0 =C2=A0# A crash or valgrind issue will be reported with somet=
hing else.<br>
&gt; +=C2=A0 =C2=A0if [[ ${ret} !=3D 1 ]] &amp;&amp; [[ ${ret} !=3D 2 ]]; =
then<br>
&gt; +-=C2=A0 =C2=A0 echo &quot;!!! baddness caused baddness in ${BZIP2}&q=
uot;<br>
&gt; ++=C2=A0 =C2=A0 echo &quot;FAIL: baddness caused baddness in ${BZIP2}=
&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0badbad=3D$[${badbad}+1]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D(&quot;${badtests[@]}&quot; $&quot;${=
badfile} badness caused baddness&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
&gt; ++=C2=A0 else<br>
&gt; ++=C2=A0 =C2=A0 echo &quot;PASS: Correctly found data integrity error=
s in ${badfile} during decompress (small)&quot;<br>
&gt; +=C2=A0 =C2=A0fi<br>
&gt; +<br>
&gt; + done &lt; &lt;(find ${TESTS_DIR} -type f -name \*\.bz2.bad -print0)=
<br>
&gt; +@@ -234,5 +238,4 @@ if [[ ${results} -eq 0 ]]; then<br>
&gt; + else<br>
&gt; +=C2=A0 =C2=A0echo &quot;Bad results, look for !!! in the logs above&=
quot;<br>
&gt; +=C2=A0 =C2=A0printf &#39; - %s\n&#39; &quot;${badtests[@]}&quot;<br>
&gt; +-=C2=A0 exit 1<br>
&gt; + fi<br>
&gt; +--<br>
&gt; +2.7.4<br>
&gt; diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/rec=
ipes-extended/bzip2/bzip2/Makefile.am<br>
&gt; index dcf6458..f917b23 100644<br>
&gt; --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
&gt; +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
&gt; @@ -46,6 +46,7 @@ runtest:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else echo &quot;FAIL: sample2 decompress&qu=
ot;; fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@if cmp sample3.tst sample3.ref; then echo =
&quot;PASS: sample3 decompress&quot;;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else echo &quot;FAIL: sample3 decompress&qu=
ot;; fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0./bzip2-tests/run-tests.sh<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0install-ptest:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=C2=A0 -n &#39;/^runtest:/,/^install-pte=
st:/{/^install-ptest:/!p}&#39; \<br>
&gt; @@ -56,6 +57,7 @@ install-ptest:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample1.bz2=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(DESTDIR)/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample2.bz2=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(DESTDIR)/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample3.bz2=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(DESTDIR)/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp -rf $(srcdir)/../git=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$(DESTDIR)/bzip2-tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s $(bindir)/bzip2=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0$(DESTDIR)/bzip2<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0install-exec-hook:<br>
&gt; diff --git a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.=
8.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a> b/meta/recipe=
s-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" rel=3D"noreferrer" targe=
t=3D"_blank">bzip2_1.0.8.bb</a><br>
&gt; index 8e9b779..e8ec5c6 100644<br>
&gt; --- a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" r=
el=3D"noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a><br>
&gt; +++ b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" r=
el=3D"noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a><br>
&gt; @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and approaches the per=
formance of the PPM family of<br>
&gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"https://sourceware.org/bzip=
2/" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/bzip2/</a>&=
quot;<br>
&gt;=C2=A0 =C2=A0SECTION =3D &quot;console/utils&quot;<br>
&gt;=C2=A0 =C2=A0LICENSE =3D &quot;bzip2&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=3D4;endline=3D37=
;md5=3D600af43c50f1fcb82e32f19b32df4664&quot;<br>
&gt; -<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=3D4;endline=3D37=
;md5=3D600af43c50f1fcb82e32f19b32df4664 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://../git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74707 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://../git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7e8ff352=
a54f \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://../git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5db6b79e=
6de0a029f \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://../git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c9479bd8=
986968f4327 \<br>
<br>
What&#39;s all this additional license info about?<br>
Please explain in when replying as well as in the long log.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/$=
%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank"=
>https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://sou=
rceware.org/git/bzip2-tests.git;name=3Dbzip2-tests" rel=3D"noreferrer" targ=
et=3D"_blank">sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests</a> \<b=
r>
<br>
Mention how big this repo is in the long log.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"htt=
p://configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a>;sub=
dir=3D${BP} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile.am;su=
bdir=3D${BP} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-bzip2-modify-ru=
n-tests-script.patch;patchdir=3D${WORKDIR}/git \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0SRC_URI[md5sum] =3D &quot;67e051268d0c475ea773822f7500d0e=
5&quot;<br>
&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D &quot;ab5a03176ee106d3f0fa90e381da=
478ddae405918153cca248e682cd0c4a2269&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +SRCREV_bzip2-tests =3D &quot;8b0198efda1603cf81fa2c7a9bb673dd22ae166=
1&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.sourc=
eware.org/pub/bzip2/" rel=3D"noreferrer" target=3D"_blank">https://www.sour=
ceware.org/pub/bzip2/</a>&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGES =3D+ &quot;libbz2&quot;<br>
&gt; @@ -39,7 +48,7 @@ do_install_ptest () {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0FILES_libbz2 =3D &quot;${libdir}/lib*${SOLIBS}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>
&gt; +RDEPENDS_${PN}-ptest +=3D &quot;make bash&quot;<br>
<br>
Does it really depend on bash or just a POSIX compliant /bin/sh ?<br>
If it requires bash, how bad are the scripts and can they be made<br>
POSIX compliant with the help of:<br>
=C2=A0 =C2=A0 <a href=3D"https://www.shellcheck.net/" rel=3D"noreferrer" t=
arget=3D"_blank">https://www.shellcheck.net/</a><br>
<br>
../Randy<br>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PROVIDES_append_class-native =3D &quot; bzip2-replacement=
-native&quot;<br>
&gt;=C2=A0 =C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
# Randy MacLeod<br>
# Wind River Linux<br>
</blockquote></div>

--000000000000d7237205a32f52c7--

--000000000000d7237505a32f52c9
Content-Type: text/plain; charset="US-ASCII"; name="ptest-logs.txt"
Content-Disposition: attachment; filename="ptest-logs.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_k8yqgtqi0>
X-Attachment-Id: f_k8yqgtqi0

cm9vdEBxZW11eDg2LTY0On4jIHB0ZXN0LXJ1bm5lciBiemlwMgpTVEFSVDogcHRlc3QtcnVubmVy
CjIwMjAtMDQtMTNUMTc6MDgKQkVHSU46IC91c3IvbGliL2J6aXAyL3B0ZXN0Ci4vYnppcDIgLTEg
IDwgc2FtcGxlMS5yZWYgPiBzYW1wbGUxLnJiMgouL2J6aXAyIC0yICA8IHNhbXBsZTIucmVmID4g
c2FtcGxlMi5yYjIKLi9iemlwMiAtMyAgPCBzYW1wbGUzLnJlZiA+IHNhbXBsZTMucmIyCi4vYnpp
cDIgLWQgIDwgc2FtcGxlMS5iejIgPiBzYW1wbGUxLnRzdAouL2J6aXAyIC1kICA8IHNhbXBsZTIu
YnoyID4gc2FtcGxlMi50c3QKLi9iemlwMiAtZHMgPCBzYW1wbGUzLmJ6MiA+IHNhbXBsZTMudHN0
ClBBU1M6IHNhbXBsZTEgY29tcHJlc3MKUEFTUzogc2FtcGxlMiBjb21wcmVzcwpQQVNTOiBzYW1w
bGUzIGNvbXByZXNzClBBU1M6IHNhbXBsZTEgZGVjb21wcmVzcwpQQVNTOiBzYW1wbGUyIGRlY29t
cHJlc3MKUEFTUzogc2FtcGxlMyBkZWNvbXByZXNzCi4vYnppcDItdGVzdHMvcnVuLXRlc3RzLnNo
ClRlc3RpbmcgYnppcDIgaW4gZGlyZWN0b3J5IC4vYnppcDItdGVzdHMKVXNpbmcgdmFsZ3JpbmQ6
IE5vCkNoZWNraW5nIG1kNSBzdW1zOiBZZXMKVGVzdGluZyBkZWNvbXByZXNzaW9uIGFuZCByZWNv
bXByZXNzaW9uLi4uCgpQcm9jZXNzaW5nIC4vYnppcDItdGVzdHMvY29tbW9ucy1jb21wcmVzcy9i
bGEudGFyLmJ6MgpQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3MvYmxhLnRhci5i
ejIgRGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3Mv
YmxhLnRhci5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25zLWNv
bXByZXNzL2JsYS50YXIuYnoyIFJlY29tcHJlc3MgClBBU1M6IC4vYnppcDItdGVzdHMvY29tbW9u
cy1jb21wcmVzcy9ibGEudGFyLmJ6MiBSZWRlY29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10
ZXN0cy9jb21tb25zLWNvbXByZXNzL2JsYS50YXIuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4v
YnppcDItdGVzdHMvY29tbW9ucy1jb21wcmVzcy9ibGEudGFyLmJ6MiBEZWNvbXByZXNzIChzbWFs
bCkKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL2JsYS50YXIuYnoyIE1kNXN1
bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvY29tbW9ucy1jb21wcmVzcy9ibGEudGFyLmJ6
MiBSZWNvbXByZXNzIChzbWFsbCkKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNz
L2JsYS50YXIuYnoyIFJlZGVjb21wcmVzcyAoc21hbGwpCi06IE9LClBBU1M6IC4vYnppcDItdGVz
dHMvY29tbW9ucy1jb21wcmVzcy9ibGEudGFyLmJ6MiBtZDVzdW0gTWF0Y2hlZApQcm9jZXNzaW5n
IC4vYnppcDItdGVzdHMvY29tbW9ucy1jb21wcmVzcy9tdWx0aXBsZS5iejIKUEFTUzogLi9iemlw
Mi10ZXN0cy9jb21tb25zLWNvbXByZXNzL211bHRpcGxlLmJ6MiBEZWNvbXByZXNzCi06IE9LClBB
U1M6IC4vYnppcDItdGVzdHMvY29tbW9ucy1jb21wcmVzcy9tdWx0aXBsZS5iejIgbWQ1c3VtIE1h
dGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL211bHRpcGxlLmJ6MiBS
ZWNvbXByZXNzIApQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3MvbXVsdGlwbGUu
YnoyIFJlZGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJl
c3MvbXVsdGlwbGUuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvY29tbW9u
cy1jb21wcmVzcy9tdWx0aXBsZS5iejIgRGVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDIt
dGVzdHMvY29tbW9ucy1jb21wcmVzcy9tdWx0aXBsZS5iejIgTWQ1c3VtIE1hdGNoZWQKUEFTUzog
Li9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL211bHRpcGxlLmJ6MiBSZWNvbXByZXNzIChz
bWFsbCkKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL211bHRpcGxlLmJ6MiBS
ZWRlY29tcHJlc3MgKHNtYWxsKQotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29t
cHJlc3MvbXVsdGlwbGUuYnoyIG1kNXN1bSBNYXRjaGVkClByb2Nlc3NpbmcgLi9iemlwMi10ZXN0
cy9jb21tb25zLWNvbXByZXNzL2JsYS54bWwuYnoyClBBU1M6IC4vYnppcDItdGVzdHMvY29tbW9u
cy1jb21wcmVzcy9ibGEueG1sLmJ6MiBEZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVz
dHMvY29tbW9ucy1jb21wcmVzcy9ibGEueG1sLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6
aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3MvYmxhLnhtbC5iejIgUmVjb21wcmVzcyAKUEFTUzog
Li9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL2JsYS54bWwuYnoyIFJlZGVjb21wcmVzcwot
OiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3MvYmxhLnhtbC5iejIgbWQ1
c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL2JsYS54bWwu
YnoyIERlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJl
c3MvYmxhLnhtbC5iejIgTWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25z
LWNvbXByZXNzL2JsYS54bWwuYnoyIFJlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAyLXRl
c3RzL2NvbW1vbnMtY29tcHJlc3MvYmxhLnhtbC5iejIgUmVkZWNvbXByZXNzIChzbWFsbCkKLTog
T0sKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL2JsYS54bWwuYnoyIG1kNXN1
bSBNYXRjaGVkClByb2Nlc3NpbmcgLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL3ppcDY0
c3VwcG9ydC50YXIuYnoyCgpiemlwMjogSS9PIG9yIG90aGVyIGVycm9yLCBiYWlsaW5nIG91dC4g
IFBvc3NpYmxlIHJlYXNvbiBmb2xsb3dzLgpiemlwMjogTm8gc3BhY2UgbGVmdCBvbiBkZXZpY2UK
RkFJTDogLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL3ppcDY0c3VwcG9ydC50YXIuYnoy
IERlY29tcHJlc3MKUHJvY2Vzc2luZyAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3MvQ09N
UFJFU1MtMTMxLmJ6MgpQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3MvQ09NUFJF
U1MtMTMxLmJ6MiBEZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvY29tbW9ucy1j
b21wcmVzcy9DT01QUkVTUy0xMzEuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVz
dHMvY29tbW9ucy1jb21wcmVzcy9DT01QUkVTUy0xMzEuYnoyIFJlY29tcHJlc3MgClBBU1M6IC4v
YnppcDItdGVzdHMvY29tbW9ucy1jb21wcmVzcy9DT01QUkVTUy0xMzEuYnoyIFJlZGVjb21wcmVz
cwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3MvQ09NUFJFU1MtMTMx
LmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3Mv
Q09NUFJFU1MtMTMxLmJ6MiBEZWNvbXByZXNzIChzbWFsbCkKUEFTUzogLi9iemlwMi10ZXN0cy9j
b21tb25zLWNvbXByZXNzL0NPTVBSRVNTLTEzMS5iejIgTWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9i
emlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL0NPTVBSRVNTLTEzMS5iejIgUmVjb21wcmVzcyAo
c21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvY29tbW9ucy1jb21wcmVzcy9DT01QUkVTUy0xMzEu
YnoyIFJlZGVjb21wcmVzcyAoc21hbGwpCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvY29tbW9u
cy1jb21wcmVzcy9DT01QUkVTUy0xMzEuYnoyIG1kNXN1bSBNYXRjaGVkClByb2Nlc3NpbmcgLi9i
emlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL2JsYS50eHQuYnoyClBBU1M6IC4vYnppcDItdGVz
dHMvY29tbW9ucy1jb21wcmVzcy9ibGEudHh0LmJ6MiBEZWNvbXByZXNzCi06IE9LClBBU1M6IC4v
YnppcDItdGVzdHMvY29tbW9ucy1jb21wcmVzcy9ibGEudHh0LmJ6MiBtZDVzdW0gTWF0Y2hlZApQ
QVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3MvYmxhLnR4dC5iejIgUmVjb21wcmVz
cyAKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL2JsYS50eHQuYnoyIFJlZGVj
b21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3MvYmxhLnR4
dC5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNz
L2JsYS50eHQuYnoyIERlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAyLXRlc3RzL2NvbW1v
bnMtY29tcHJlc3MvYmxhLnR4dC5iejIgTWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0
cy9jb21tb25zLWNvbXByZXNzL2JsYS50eHQuYnoyIFJlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAu
L2J6aXAyLXRlc3RzL2NvbW1vbnMtY29tcHJlc3MvYmxhLnR4dC5iejIgUmVkZWNvbXByZXNzIChz
bWFsbCkKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9jb21tb25zLWNvbXByZXNzL2JsYS50eHQu
YnoyIG1kNXN1bSBNYXRjaGVkClByb2Nlc3NpbmcgLi9iemlwMi10ZXN0cy9nby9yZWdleHAvcmUy
LWV4aGF1c3RpdmUudHh0LmJ6MgoKYnppcDI6IEkvTyBvciBvdGhlciBlcnJvciwgYmFpbGluZyBv
dXQuICBQb3NzaWJsZSByZWFzb24gZm9sbG93cy4KYnppcDI6IE5vIHNwYWNlIGxlZnQgb24gZGV2
aWNlCkZBSUw6IC4vYnppcDItdGVzdHMvZ28vcmVnZXhwL3JlMi1leGhhdXN0aXZlLnR4dC5iejIg
RGVjb21wcmVzcwpQcm9jZXNzaW5nIC4vYnppcDItdGVzdHMvZ28vY3J5cHRvL3Bzcy12ZWN0LnR4
dC5iejIKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jcnlwdG8vcHNzLXZlY3QudHh0LmJ6MiBEZWNv
bXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY3J5cHRvL3Bzcy12ZWN0LnR4dC5i
ejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jcnlwdG8vcHNzLXZlY3Qu
dHh0LmJ6MiBSZWNvbXByZXNzIApQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NyeXB0by9wc3MtdmVj
dC50eHQuYnoyIFJlZGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NyeXB0
by9wc3MtdmVjdC50eHQuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvZ28v
Y3J5cHRvL3Bzcy12ZWN0LnR4dC5iejIgRGVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDIt
dGVzdHMvZ28vY3J5cHRvL3Bzcy12ZWN0LnR4dC5iejIgTWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9i
emlwMi10ZXN0cy9nby9jcnlwdG8vcHNzLXZlY3QudHh0LmJ6MiBSZWNvbXByZXNzIChzbWFsbCkK
UEFTUzogLi9iemlwMi10ZXN0cy9nby9jcnlwdG8vcHNzLXZlY3QudHh0LmJ6MiBSZWRlY29tcHJl
c3MgKHNtYWxsKQotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NyeXB0by9wc3MtdmVjdC50
eHQuYnoyIG1kNXN1bSBNYXRjaGVkClByb2Nlc3NpbmcgLi9iemlwMi10ZXN0cy9nby9jcnlwdG8v
U2lnVmVyLnJzcC5iejIKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jcnlwdG8vU2lnVmVyLnJzcC5i
ejIgRGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NyeXB0by9TaWdWZXIu
cnNwLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NyeXB0by9TaWdW
ZXIucnNwLmJ6MiBSZWNvbXByZXNzIApQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NyeXB0by9TaWdW
ZXIucnNwLmJ6MiBSZWRlY29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jcnlw
dG8vU2lnVmVyLnJzcC5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9nby9j
cnlwdG8vU2lnVmVyLnJzcC5iejIgRGVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVz
dHMvZ28vY3J5cHRvL1NpZ1Zlci5yc3AuYnoyIE1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDIt
dGVzdHMvZ28vY3J5cHRvL1NpZ1Zlci5yc3AuYnoyIFJlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAu
L2J6aXAyLXRlc3RzL2dvL2NyeXB0by9TaWdWZXIucnNwLmJ6MiBSZWRlY29tcHJlc3MgKHNtYWxs
KQotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NyeXB0by9TaWdWZXIucnNwLmJ6MiBtZDVz
dW0gTWF0Y2hlZApQcm9jZXNzaW5nIC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcGFzcy1zYXd0
b290aC5iejIKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9wYXNzLXNhd3Rvb3RoLmJ6
MiBEZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcGFzcy1z
YXd0b290aC5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVz
cy9wYXNzLXNhd3Rvb3RoLmJ6MiBSZWNvbXByZXNzIApQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2Nv
bXByZXNzL3Bhc3Mtc2F3dG9vdGguYnoyIFJlZGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAy
LXRlc3RzL2dvL2NvbXByZXNzL3Bhc3Mtc2F3dG9vdGguYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6
IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcGFzcy1zYXd0b290aC5iejIgRGVjb21wcmVzcyAo
c21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcGFzcy1zYXd0b290aC5iejIg
TWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9wYXNzLXNhd3Rv
b3RoLmJ6MiBSZWNvbXByZXNzIChzbWFsbCkKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVz
cy9wYXNzLXNhd3Rvb3RoLmJ6MiBSZWRlY29tcHJlc3MgKHNtYWxsKQotOiBPSwpQQVNTOiAuL2J6
aXAyLXRlc3RzL2dvL2NvbXByZXNzL3Bhc3Mtc2F3dG9vdGguYnoyIG1kNXN1bSBNYXRjaGVkClBy
b2Nlc3NpbmcgLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9wYXNzLXJhbmRvbTEuYnoyClBBU1M6
IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcGFzcy1yYW5kb20xLmJ6MiBEZWNvbXByZXNzCi06
IE9LClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcGFzcy1yYW5kb20xLmJ6MiBtZDVz
dW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NvbXByZXNzL3Bhc3MtcmFuZG9tMS5i
ejIgUmVjb21wcmVzcyAKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9wYXNzLXJhbmRv
bTEuYnoyIFJlZGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NvbXByZXNz
L3Bhc3MtcmFuZG9tMS5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9nby9j
b21wcmVzcy9wYXNzLXJhbmRvbTEuYnoyIERlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAy
LXRlc3RzL2dvL2NvbXByZXNzL3Bhc3MtcmFuZG9tMS5iejIgTWQ1c3VtIE1hdGNoZWQKUEFTUzog
Li9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9wYXNzLXJhbmRvbTEuYnoyIFJlY29tcHJlc3MgKHNt
YWxsKQpQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NvbXByZXNzL3Bhc3MtcmFuZG9tMS5iejIgUmVk
ZWNvbXByZXNzIChzbWFsbCkKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9w
YXNzLXJhbmRvbTEuYnoyIG1kNXN1bSBNYXRjaGVkClByb2Nlc3NpbmcgLi9iemlwMi10ZXN0cy9n
by9jb21wcmVzcy9yYW5kb20uZGF0YS5iejIKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVz
cy9yYW5kb20uZGF0YS5iejIgRGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2dv
L2NvbXByZXNzL3JhbmRvbS5kYXRhLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRl
c3RzL2dvL2NvbXByZXNzL3JhbmRvbS5kYXRhLmJ6MiBSZWNvbXByZXNzIApQQVNTOiAuL2J6aXAy
LXRlc3RzL2dvL2NvbXByZXNzL3JhbmRvbS5kYXRhLmJ6MiBSZWRlY29tcHJlc3MKLTogT0sKUEFT
UzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9yYW5kb20uZGF0YS5iejIgbWQ1c3VtIE1hdGNo
ZWQKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9yYW5kb20uZGF0YS5iejIgRGVjb21w
cmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcmFuZG9tLmRhdGEu
YnoyIE1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcmFuZG9t
LmRhdGEuYnoyIFJlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NvbXBy
ZXNzL3JhbmRvbS5kYXRhLmJ6MiBSZWRlY29tcHJlc3MgKHNtYWxsKQotOiBPSwpQQVNTOiAuL2J6
aXAyLXRlc3RzL2dvL2NvbXByZXNzL3JhbmRvbS5kYXRhLmJ6MiBtZDVzdW0gTWF0Y2hlZApQcm9j
ZXNzaW5nIC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcGFzcy1yYW5kb20yLmJ6MgpQQVNTOiAu
L2J6aXAyLXRlc3RzL2dvL2NvbXByZXNzL3Bhc3MtcmFuZG9tMi5iejIgRGVjb21wcmVzcwotOiBP
SwpQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NvbXByZXNzL3Bhc3MtcmFuZG9tMi5iejIgbWQ1c3Vt
IE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9wYXNzLXJhbmRvbTIuYnoy
IFJlY29tcHJlc3MgClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcGFzcy1yYW5kb20y
LmJ6MiBSZWRlY29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9w
YXNzLXJhbmRvbTIuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29t
cHJlc3MvcGFzcy1yYW5kb20yLmJ6MiBEZWNvbXByZXNzIChzbWFsbCkKUEFTUzogLi9iemlwMi10
ZXN0cy9nby9jb21wcmVzcy9wYXNzLXJhbmRvbTIuYnoyIE1kNXN1bSBNYXRjaGVkClBBU1M6IC4v
YnppcDItdGVzdHMvZ28vY29tcHJlc3MvcGFzcy1yYW5kb20yLmJ6MiBSZWNvbXByZXNzIChzbWFs
bCkKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9wYXNzLXJhbmRvbTIuYnoyIFJlZGVj
b21wcmVzcyAoc21hbGwpCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvcGFz
cy1yYW5kb20yLmJ6MiBtZDVzdW0gTWF0Y2hlZApQcm9jZXNzaW5nIC4vYnppcDItdGVzdHMvZ28v
Y29tcHJlc3MvZS50eHQuYnoyClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvZS50eHQu
YnoyIERlY29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9lLnR4
dC5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9lLnR4
dC5iejIgUmVjb21wcmVzcyAKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9lLnR4dC5i
ejIgUmVkZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvZS50
eHQuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvZS50
eHQuYnoyIERlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NvbXByZXNz
L2UudHh0LmJ6MiBNZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NvbXByZXNz
L2UudHh0LmJ6MiBSZWNvbXByZXNzIChzbWFsbCkKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21w
cmVzcy9lLnR4dC5iejIgUmVkZWNvbXByZXNzIChzbWFsbCkKLTogT0sKUEFTUzogLi9iemlwMi10
ZXN0cy9nby9jb21wcmVzcy9lLnR4dC5iejIgbWQ1c3VtIE1hdGNoZWQKUHJvY2Vzc2luZyAuL2J6
aXAyLXRlc3RzL2dvL2NvbXByZXNzL0lzYWFjLk5ld3Rvbi1PcHRpY2tzLnR4dC5iejIKUEFTUzog
Li9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9Jc2FhYy5OZXd0b24tT3B0aWNrcy50eHQuYnoyIERl
Y29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9nby9jb21wcmVzcy9Jc2FhYy5OZXd0
b24tT3B0aWNrcy50eHQuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvZ28v
Y29tcHJlc3MvSXNhYWMuTmV3dG9uLU9wdGlja3MudHh0LmJ6MiBSZWNvbXByZXNzIApQQVNTOiAu
L2J6aXAyLXRlc3RzL2dvL2NvbXByZXNzL0lzYWFjLk5ld3Rvbi1PcHRpY2tzLnR4dC5iejIgUmVk
ZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvSXNhYWMuTmV3
dG9uLU9wdGlja3MudHh0LmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2dv
L2NvbXByZXNzL0lzYWFjLk5ld3Rvbi1PcHRpY2tzLnR4dC5iejIgRGVjb21wcmVzcyAoc21hbGwp
ClBBU1M6IC4vYnppcDItdGVzdHMvZ28vY29tcHJlc3MvSXNhYWMuTmV3dG9uLU9wdGlja3MudHh0
LmJ6MiBNZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NvbXByZXNzL0lzYWFj
Lk5ld3Rvbi1PcHRpY2tzLnR4dC5iejIgUmVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDIt
dGVzdHMvZ28vY29tcHJlc3MvSXNhYWMuTmV3dG9uLU9wdGlja3MudHh0LmJ6MiBSZWRlY29tcHJl
c3MgKHNtYWxsKQotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2dvL2NvbXByZXNzL0lzYWFjLk5l
d3Rvbi1PcHRpY2tzLnR4dC5iejIgbWQ1c3VtIE1hdGNoZWQKUHJvY2Vzc2luZyAuL2J6aXAyLXRl
c3RzL2xiemlwMi9yYW5kLmJ6MgpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9yYW5kLmJ6MiBE
ZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL3JhbmQuYnoyIG1kNXN1
bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL3JhbmQuYnoyIFJlY29tcHJlc3Mg
ClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL3JhbmQuYnoyIFJlZGVjb21wcmVzcwotOiBPSwpQ
QVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9yYW5kLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAu
L2J6aXAyLXRlc3RzL2xiemlwMi9yYW5kLmJ6MiBEZWNvbXByZXNzIChzbWFsbCkKUEFTUzogLi9i
emlwMi10ZXN0cy9sYnppcDIvcmFuZC5iejIgTWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10
ZXN0cy9sYnppcDIvcmFuZC5iejIgUmVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVz
dHMvbGJ6aXAyL3JhbmQuYnoyIFJlZGVjb21wcmVzcyAoc21hbGwpCi06IE9LClBBU1M6IC4vYnpp
cDItdGVzdHMvbGJ6aXAyL3JhbmQuYnoyIG1kNXN1bSBNYXRjaGVkClByb2Nlc3NpbmcgLi9iemlw
Mi10ZXN0cy9sYnppcDIvMzI3NjcuYnoyClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyLzMyNzY3
LmJ6MiBEZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyLzMyNzY3LmJ6
MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi8zMjc2Ny5iejIgUmVj
b21wcmVzcyAKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvMzI3NjcuYnoyIFJlZGVjb21wcmVz
cwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi8zMjc2Ny5iejIgbWQ1c3VtIE1hdGNo
ZWQKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvMzI3NjcuYnoyIERlY29tcHJlc3MgKHNtYWxs
KQpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi8zMjc2Ny5iejIgTWQ1c3VtIE1hdGNoZWQKUEFT
UzogLi9iemlwMi10ZXN0cy9sYnppcDIvMzI3NjcuYnoyIFJlY29tcHJlc3MgKHNtYWxsKQpQQVNT
OiAuL2J6aXAyLXRlc3RzL2xiemlwMi8zMjc2Ny5iejIgUmVkZWNvbXByZXNzIChzbWFsbCkKLTog
T0sKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvMzI3NjcuYnoyIG1kNXN1bSBNYXRjaGVkClBy
b2Nlc3NpbmcgLi9iemlwMi10ZXN0cy9sYnppcDIvaWR4ODk5OTk5LmJ6MgoKYnppcDI6IEkvTyBv
ciBvdGhlciBlcnJvciwgYmFpbGluZyBvdXQuICBQb3NzaWJsZSByZWFzb24gZm9sbG93cy4KYnpp
cDI6IE5vIHNwYWNlIGxlZnQgb24gZGV2aWNlCkZBSUw6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2lk
eDg5OTk5OS5iejIgRGVjb21wcmVzcwpQcm9jZXNzaW5nIC4vYnppcDItdGVzdHMvbGJ6aXAyL2Nv
bmNhdC5iejIKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvY29uY2F0LmJ6MiBEZWNvbXByZXNz
Ci06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2NvbmNhdC5iejIgbWQ1c3VtIE1hdGNo
ZWQKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvY29uY2F0LmJ6MiBSZWNvbXByZXNzIApQQVNT
OiAuL2J6aXAyLXRlc3RzL2xiemlwMi9jb25jYXQuYnoyIFJlZGVjb21wcmVzcwotOiBPSwpQQVNT
OiAuL2J6aXAyLXRlc3RzL2xiemlwMi9jb25jYXQuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4v
YnppcDItdGVzdHMvbGJ6aXAyL2NvbmNhdC5iejIgRGVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4v
YnppcDItdGVzdHMvbGJ6aXAyL2NvbmNhdC5iejIgTWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlw
Mi10ZXN0cy9sYnppcDIvY29uY2F0LmJ6MiBSZWNvbXByZXNzIChzbWFsbCkKUEFTUzogLi9iemlw
Mi10ZXN0cy9sYnppcDIvY29uY2F0LmJ6MiBSZWRlY29tcHJlc3MgKHNtYWxsKQotOiBPSwpQQVNT
OiAuL2J6aXAyLXRlc3RzL2xiemlwMi9jb25jYXQuYnoyIG1kNXN1bSBNYXRjaGVkClByb2Nlc3Np
bmcgLi9iemlwMi10ZXN0cy9sYnppcDIvY29kZWxlbjIwLmJ6MgpQQVNTOiAuL2J6aXAyLXRlc3Rz
L2xiemlwMi9jb2RlbGVuMjAuYnoyIERlY29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0
cy9sYnppcDIvY29kZWxlbjIwLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3Rz
L2xiemlwMi9jb2RlbGVuMjAuYnoyIFJlY29tcHJlc3MgClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6
aXAyL2NvZGVsZW4yMC5iejIgUmVkZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMv
bGJ6aXAyL2NvZGVsZW4yMC5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9s
YnppcDIvY29kZWxlbjIwLmJ6MiBEZWNvbXByZXNzIChzbWFsbCkKUEFTUzogLi9iemlwMi10ZXN0
cy9sYnppcDIvY29kZWxlbjIwLmJ6MiBNZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3Rz
L2xiemlwMi9jb2RlbGVuMjAuYnoyIFJlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAyLXRl
c3RzL2xiemlwMi9jb2RlbGVuMjAuYnoyIFJlZGVjb21wcmVzcyAoc21hbGwpCi06IE9LClBBU1M6
IC4vYnppcDItdGVzdHMvbGJ6aXAyL2NvZGVsZW4yMC5iejIgbWQ1c3VtIE1hdGNoZWQKUHJvY2Vz
c2luZyAuL2J6aXAyLXRlc3RzL2xiemlwMi9pbmNvbXAtMS5iejIKUEFTUzogLi9iemlwMi10ZXN0
cy9sYnppcDIvaW5jb21wLTEuYnoyIERlY29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0
cy9sYnppcDIvaW5jb21wLTEuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMv
bGJ6aXAyL2luY29tcC0xLmJ6MiBSZWNvbXByZXNzIApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlw
Mi9pbmNvbXAtMS5iejIgUmVkZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6
aXAyL2luY29tcC0xLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlw
Mi9pbmNvbXAtMS5iejIgRGVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6
aXAyL2luY29tcC0xLmJ6MiBNZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlw
Mi9pbmNvbXAtMS5iejIgUmVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6
aXAyL2luY29tcC0xLmJ6MiBSZWRlY29tcHJlc3MgKHNtYWxsKQotOiBPSwpQQVNTOiAuL2J6aXAy
LXRlc3RzL2xiemlwMi9pbmNvbXAtMS5iejIgbWQ1c3VtIE1hdGNoZWQKUHJvY2Vzc2luZyAuL2J6
aXAyLXRlc3RzL2xiemlwMi9pbmNvbXAtMi5iejIKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIv
aW5jb21wLTIuYnoyIERlY29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIv
aW5jb21wLTIuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2lu
Y29tcC0yLmJ6MiBSZWNvbXByZXNzIApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9pbmNvbXAt
Mi5iejIgUmVkZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2luY29t
cC0yLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9pbmNvbXAt
Mi5iejIgRGVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2luY29t
cC0yLmJ6MiBNZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9pbmNvbXAt
Mi5iejIgUmVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2luY29t
cC0yLmJ6MiBSZWRlY29tcHJlc3MgKHNtYWxsKQotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2xi
emlwMi9pbmNvbXAtMi5iejIgbWQ1c3VtIE1hdGNoZWQKUHJvY2Vzc2luZyAuL2J6aXAyLXRlc3Rz
L2xiemlwMi9jaDI1NS5iejIKCmJ6aXAyOiBJL08gb3Igb3RoZXIgZXJyb3IsIGJhaWxpbmcgb3V0
LiAgUG9zc2libGUgcmVhc29uIGZvbGxvd3MuCmJ6aXAyOiBObyBzcGFjZSBsZWZ0IG9uIGRldmlj
ZQpGQUlMOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9jaDI1NS5iejIgRGVjb21wcmVzcwpQcm9jZXNz
aW5nIC4vYnppcDItdGVzdHMvbGJ6aXAyL3JlcGV0LmJ6MgpQQVNTOiAuL2J6aXAyLXRlc3RzL2xi
emlwMi9yZXBldC5iejIgRGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlw
Mi9yZXBldC5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvcmVw
ZXQuYnoyIFJlY29tcHJlc3MgClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL3JlcGV0LmJ6MiBS
ZWRlY29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvcmVwZXQuYnoyIG1k
NXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL3JlcGV0LmJ6MiBEZWNvbXBy
ZXNzIChzbWFsbCkKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvcmVwZXQuYnoyIE1kNXN1bSBN
YXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL3JlcGV0LmJ6MiBSZWNvbXByZXNzIChz
bWFsbCkKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvcmVwZXQuYnoyIFJlZGVjb21wcmVzcyAo
c21hbGwpCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL3JlcGV0LmJ6MiBtZDVzdW0g
TWF0Y2hlZApQcm9jZXNzaW5nIC4vYnppcDItdGVzdHMvbGJ6aXAyL2ZpYi5iejIKUEFTUzogLi9i
emlwMi10ZXN0cy9sYnppcDIvZmliLmJ6MiBEZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDIt
dGVzdHMvbGJ6aXAyL2ZpYi5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9s
YnppcDIvZmliLmJ6MiBSZWNvbXByZXNzIApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9maWIu
YnoyIFJlZGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9maWIuYnoy
IG1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2ZpYi5iejIgRGVjb21w
cmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2ZpYi5iejIgTWQ1c3VtIE1h
dGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvZmliLmJ6MiBSZWNvbXByZXNzIChzbWFs
bCkKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvZmliLmJ6MiBSZWRlY29tcHJlc3MgKHNtYWxs
KQotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9maWIuYnoyIG1kNXN1bSBNYXRjaGVk
ClByb2Nlc3NpbmcgLi9iemlwMi10ZXN0cy9sYnppcDIvdHJhc2guYnoyClBBU1M6IC4vYnppcDIt
dGVzdHMvbGJ6aXAyL3RyYXNoLmJ6MiBEZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVz
dHMvbGJ6aXAyL3RyYXNoLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2xi
emlwMi90cmFzaC5iejIgUmVjb21wcmVzcyAKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvdHJh
c2guYnoyIFJlZGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi90cmFz
aC5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvdHJhc2guYnoy
IERlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi90cmFzaC5iejIg
TWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvdHJhc2guYnoyIFJlY29t
cHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi90cmFzaC5iejIgUmVkZWNv
bXByZXNzIChzbWFsbCkKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvdHJhc2guYnoy
IG1kNXN1bSBNYXRjaGVkClByb2Nlc3NpbmcgLi9iemlwMi10ZXN0cy9sYnppcDIvZ2FwLmJ6MgpQ
QVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9nYXAuYnoyIERlY29tcHJlc3MKLTogT0sKUEFTUzog
Li9iemlwMi10ZXN0cy9sYnppcDIvZ2FwLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAy
LXRlc3RzL2xiemlwMi9nYXAuYnoyIFJlY29tcHJlc3MgClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6
aXAyL2dhcC5iejIgUmVkZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAy
L2dhcC5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvZ2FwLmJ6
MiBEZWNvbXByZXNzIChzbWFsbCkKUEFTUzogLi9iemlwMi10ZXN0cy9sYnppcDIvZ2FwLmJ6MiBN
ZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9nYXAuYnoyIFJlY29tcHJl
c3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9nYXAuYnoyIFJlZGVjb21wcmVz
cyAoc21hbGwpCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2dhcC5iejIgbWQ1c3Vt
IE1hdGNoZWQKUHJvY2Vzc2luZyAuL2J6aXAyLXRlc3RzL2xiemlwMi9lbXB0eS5iejIKUEFTUzog
Li9iemlwMi10ZXN0cy9sYnppcDIvZW1wdHkuYnoyIERlY29tcHJlc3MKLTogT0sKUEFTUzogLi9i
emlwMi10ZXN0cy9sYnppcDIvZW1wdHkuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDIt
dGVzdHMvbGJ6aXAyL2VtcHR5LmJ6MiBSZWNvbXByZXNzIApQQVNTOiAuL2J6aXAyLXRlc3RzL2xi
emlwMi9lbXB0eS5iejIgUmVkZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6
aXAyL2VtcHR5LmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9l
bXB0eS5iejIgRGVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2Vt
cHR5LmJ6MiBNZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9lbXB0eS5i
ejIgUmVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvbGJ6aXAyL2VtcHR5LmJ6
MiBSZWRlY29tcHJlc3MgKHNtYWxsKQotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2xiemlwMi9l
bXB0eS5iejIgbWQ1c3VtIE1hdGNoZWQKUHJvY2Vzc2luZyAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUv
NzY1Qi5iejIKUEFTUzogLi9iemlwMi10ZXN0cy9weWZsYXRlLzc2NUIuYnoyIERlY29tcHJlc3MK
LTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9weWZsYXRlLzc2NUIuYnoyIG1kNXN1bSBNYXRjaGVk
ClBBU1M6IC4vYnppcDItdGVzdHMvcHlmbGF0ZS83NjVCLmJ6MiBSZWNvbXByZXNzIApQQVNTOiAu
L2J6aXAyLXRlc3RzL3B5ZmxhdGUvNzY1Qi5iejIgUmVkZWNvbXByZXNzCi06IE9LClBBU1M6IC4v
YnppcDItdGVzdHMvcHlmbGF0ZS83NjVCLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAy
LXRlc3RzL3B5ZmxhdGUvNzY1Qi5iejIgRGVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDIt
dGVzdHMvcHlmbGF0ZS83NjVCLmJ6MiBNZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3Rz
L3B5ZmxhdGUvNzY1Qi5iejIgUmVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMv
cHlmbGF0ZS83NjVCLmJ6MiBSZWRlY29tcHJlc3MgKHNtYWxsKQotOiBPSwpQQVNTOiAuL2J6aXAy
LXRlc3RzL3B5ZmxhdGUvNzY1Qi5iejIgbWQ1c3VtIE1hdGNoZWQKUHJvY2Vzc2luZyAuL2J6aXAy
LXRlc3RzL3B5ZmxhdGUvNDVNQi1mYi5iejIKCmJ6aXAyOiBJL08gb3Igb3RoZXIgZXJyb3IsIGJh
aWxpbmcgb3V0LiAgUG9zc2libGUgcmVhc29uIGZvbGxvd3MuCmJ6aXAyOiBObyBzcGFjZSBsZWZ0
IG9uIGRldmljZQpGQUlMOiAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUvNDVNQi1mYi5iejIgRGVjb21w
cmVzcwpQcm9jZXNzaW5nIC4vYnppcDItdGVzdHMvcHlmbGF0ZS80NU1CLTAwLmJ6MgoKYnppcDI6
IEkvTyBvciBvdGhlciBlcnJvciwgYmFpbGluZyBvdXQuICBQb3NzaWJsZSByZWFzb24gZm9sbG93
cy4KYnppcDI6IE5vIHNwYWNlIGxlZnQgb24gZGV2aWNlCkZBSUw6IC4vYnppcDItdGVzdHMvcHlm
bGF0ZS80NU1CLTAwLmJ6MiBEZWNvbXByZXNzClByb2Nlc3NpbmcgLi9iemlwMi10ZXN0cy9weWZs
YXRlLzUxMEIuYnoyClBBU1M6IC4vYnppcDItdGVzdHMvcHlmbGF0ZS81MTBCLmJ6MiBEZWNvbXBy
ZXNzCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvcHlmbGF0ZS81MTBCLmJ6MiBtZDVzdW0gTWF0
Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUvNTEwQi5iejIgUmVjb21wcmVzcyAKUEFT
UzogLi9iemlwMi10ZXN0cy9weWZsYXRlLzUxMEIuYnoyIFJlZGVjb21wcmVzcwotOiBPSwpQQVNT
OiAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUvNTEwQi5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9i
emlwMi10ZXN0cy9weWZsYXRlLzUxMEIuYnoyIERlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6
aXAyLXRlc3RzL3B5ZmxhdGUvNTEwQi5iejIgTWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10
ZXN0cy9weWZsYXRlLzUxMEIuYnoyIFJlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6aXAyLXRl
c3RzL3B5ZmxhdGUvNTEwQi5iejIgUmVkZWNvbXByZXNzIChzbWFsbCkKLTogT0sKUEFTUzogLi9i
emlwMi10ZXN0cy9weWZsYXRlLzUxMEIuYnoyIG1kNXN1bSBNYXRjaGVkClByb2Nlc3NpbmcgLi9i
emlwMi10ZXN0cy9weWZsYXRlL2hlbGxvLXdvcmxkLmJ6MgpQQVNTOiAuL2J6aXAyLXRlc3RzL3B5
ZmxhdGUvaGVsbG8td29ybGQuYnoyIERlY29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0
cy9weWZsYXRlL2hlbGxvLXdvcmxkLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRl
c3RzL3B5ZmxhdGUvaGVsbG8td29ybGQuYnoyIFJlY29tcHJlc3MgClBBU1M6IC4vYnppcDItdGVz
dHMvcHlmbGF0ZS9oZWxsby13b3JsZC5iejIgUmVkZWNvbXByZXNzCi06IE9LClBBU1M6IC4vYnpp
cDItdGVzdHMvcHlmbGF0ZS9oZWxsby13b3JsZC5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9i
emlwMi10ZXN0cy9weWZsYXRlL2hlbGxvLXdvcmxkLmJ6MiBEZWNvbXByZXNzIChzbWFsbCkKUEFT
UzogLi9iemlwMi10ZXN0cy9weWZsYXRlL2hlbGxvLXdvcmxkLmJ6MiBNZDVzdW0gTWF0Y2hlZApQ
QVNTOiAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUvaGVsbG8td29ybGQuYnoyIFJlY29tcHJlc3MgKHNt
YWxsKQpQQVNTOiAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUvaGVsbG8td29ybGQuYnoyIFJlZGVjb21w
cmVzcyAoc21hbGwpCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvcHlmbGF0ZS9oZWxsby13b3Js
ZC5iejIgbWQ1c3VtIE1hdGNoZWQKUHJvY2Vzc2luZyAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUvYWFh
LmJ6MgpQQVNTOiAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUvYWFhLmJ6MiBEZWNvbXByZXNzCi06IE9L
ClBBU1M6IC4vYnppcDItdGVzdHMvcHlmbGF0ZS9hYWEuYnoyIG1kNXN1bSBNYXRjaGVkClBBU1M6
IC4vYnppcDItdGVzdHMvcHlmbGF0ZS9hYWEuYnoyIFJlY29tcHJlc3MgClBBU1M6IC4vYnppcDIt
dGVzdHMvcHlmbGF0ZS9hYWEuYnoyIFJlZGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRl
c3RzL3B5ZmxhdGUvYWFhLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL3B5
ZmxhdGUvYWFhLmJ6MiBEZWNvbXByZXNzIChzbWFsbCkKUEFTUzogLi9iemlwMi10ZXN0cy9weWZs
YXRlL2FhYS5iejIgTWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9weWZsYXRlL2Fh
YS5iejIgUmVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvcHlmbGF0ZS9hYWEu
YnoyIFJlZGVjb21wcmVzcyAoc21hbGwpCi06IE9LClBBU1M6IC4vYnppcDItdGVzdHMvcHlmbGF0
ZS9hYWEuYnoyIG1kNXN1bSBNYXRjaGVkClByb2Nlc3NpbmcgLi9iemlwMi10ZXN0cy9weWZsYXRl
L2VtcHR5LmJ6MgpQQVNTOiAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUvZW1wdHkuYnoyIERlY29tcHJl
c3MKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9weWZsYXRlL2VtcHR5LmJ6MiBtZDVzdW0gTWF0
Y2hlZApQQVNTOiAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUvZW1wdHkuYnoyIFJlY29tcHJlc3MgClBB
U1M6IC4vYnppcDItdGVzdHMvcHlmbGF0ZS9lbXB0eS5iejIgUmVkZWNvbXByZXNzCi06IE9LClBB
U1M6IC4vYnppcDItdGVzdHMvcHlmbGF0ZS9lbXB0eS5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzog
Li9iemlwMi10ZXN0cy9weWZsYXRlL2VtcHR5LmJ6MiBEZWNvbXByZXNzIChzbWFsbCkKUEFTUzog
Li9iemlwMi10ZXN0cy9weWZsYXRlL2VtcHR5LmJ6MiBNZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6
aXAyLXRlc3RzL3B5ZmxhdGUvZW1wdHkuYnoyIFJlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAuL2J6
aXAyLXRlc3RzL3B5ZmxhdGUvZW1wdHkuYnoyIFJlZGVjb21wcmVzcyAoc21hbGwpCi06IE9LClBB
U1M6IC4vYnppcDItdGVzdHMvcHlmbGF0ZS9lbXB0eS5iejIgbWQ1c3VtIE1hdGNoZWQKUHJvY2Vz
c2luZyAuL2J6aXAyLXRlc3RzL2RvdG5ldHppcC9kYW5jaW5nLWNvbG9yLnBzLmJ6MgpQQVNTOiAu
L2J6aXAyLXRlc3RzL2RvdG5ldHppcC9kYW5jaW5nLWNvbG9yLnBzLmJ6MiBEZWNvbXByZXNzCi06
IE9LClBBU1M6IC4vYnppcDItdGVzdHMvZG90bmV0emlwL2RhbmNpbmctY29sb3IucHMuYnoyIG1k
NXN1bSBNYXRjaGVkClBBU1M6IC4vYnppcDItdGVzdHMvZG90bmV0emlwL2RhbmNpbmctY29sb3Iu
cHMuYnoyIFJlY29tcHJlc3MgClBBU1M6IC4vYnppcDItdGVzdHMvZG90bmV0emlwL2RhbmNpbmct
Y29sb3IucHMuYnoyIFJlZGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2RvdG5l
dHppcC9kYW5jaW5nLWNvbG9yLnBzLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRl
c3RzL2RvdG5ldHppcC9kYW5jaW5nLWNvbG9yLnBzLmJ6MiBEZWNvbXByZXNzIChzbWFsbCkKUEFT
UzogLi9iemlwMi10ZXN0cy9kb3RuZXR6aXAvZGFuY2luZy1jb2xvci5wcy5iejIgTWQ1c3VtIE1h
dGNoZWQKUEFTUzogLi9iemlwMi10ZXN0cy9kb3RuZXR6aXAvZGFuY2luZy1jb2xvci5wcy5iejIg
UmVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnppcDItdGVzdHMvZG90bmV0emlwL2RhbmNpbmct
Y29sb3IucHMuYnoyIFJlZGVjb21wcmVzcyAoc21hbGwpCi06IE9LClBBU1M6IC4vYnppcDItdGVz
dHMvZG90bmV0emlwL2RhbmNpbmctY29sb3IucHMuYnoyIG1kNXN1bSBNYXRjaGVkClByb2Nlc3Np
bmcgLi9iemlwMi10ZXN0cy9kb3RuZXR6aXAvc2FtcGxlMS5iejIKUEFTUzogLi9iemlwMi10ZXN0
cy9kb3RuZXR6aXAvc2FtcGxlMS5iejIgRGVjb21wcmVzcwotOiBPSwpQQVNTOiAuL2J6aXAyLXRl
c3RzL2RvdG5ldHppcC9zYW1wbGUxLmJ6MiBtZDVzdW0gTWF0Y2hlZApQQVNTOiAuL2J6aXAyLXRl
c3RzL2RvdG5ldHppcC9zYW1wbGUxLmJ6MiBSZWNvbXByZXNzIApQQVNTOiAuL2J6aXAyLXRlc3Rz
L2RvdG5ldHppcC9zYW1wbGUxLmJ6MiBSZWRlY29tcHJlc3MKLTogT0sKUEFTUzogLi9iemlwMi10
ZXN0cy9kb3RuZXR6aXAvc2FtcGxlMS5iejIgbWQ1c3VtIE1hdGNoZWQKUEFTUzogLi9iemlwMi10
ZXN0cy9kb3RuZXR6aXAvc2FtcGxlMS5iejIgRGVjb21wcmVzcyAoc21hbGwpClBBU1M6IC4vYnpp
cDItdGVzdHMvZG90bmV0emlwL3NhbXBsZTEuYnoyIE1kNXN1bSBNYXRjaGVkClBBU1M6IC4vYnpp
cDItdGVzdHMvZG90bmV0emlwL3NhbXBsZTEuYnoyIFJlY29tcHJlc3MgKHNtYWxsKQpQQVNTOiAu
L2J6aXAyLXRlc3RzL2RvdG5ldHppcC9zYW1wbGUxLmJ6MiBSZWRlY29tcHJlc3MgKHNtYWxsKQot
OiBPSwpQQVNTOiAuL2J6aXAyLXRlc3RzL2RvdG5ldHppcC9zYW1wbGUxLmJ6MiBtZDVzdW0gTWF0
Y2hlZApQcm9jZXNzaW5nIC4vYnppcDItdGVzdHMvZG90bmV0emlwL3NhbXBsZTIuYnoyClBBU1M6
IC4vYnppcDItdGVzdHMvZG90bmV0emlwL3NhbXBsZTIuYnoyIERlY29tcHJlc3MKLTogT0sKUEFT
UzogLi9iemlwMi10ZXN0cy9kb3RuZXR6aXAvc2FtcGxlMi5iejIgbWQ1c3VtIE1hdGNoZWQKUEFT
UzogLi9iemlwMi10ZXN0cy9kb3RuZXR6aXAvc2FtcGxlMi5iejIgUmVjb21wcmVzcyAKUEFTUzog
Li9iemlwMi10ZXN0cy9kb3RuZXR6aXAvc2FtcGxlMi5iejIgUmVkZWNvbXByZXNzCi06IE9LClBB
U1M6IC4vYnppcDItdGVzdHMvZG90bmV0emlwL3NhbXBsZTIuYnoyIG1kNXN1bSBNYXRjaGVkClBB
U1M6IC4vYnppcDItdGVzdHMvZG90bmV0emlwL3NhbXBsZTIuYnoyIERlY29tcHJlc3MgKHNtYWxs
KQpQQVNTOiAuL2J6aXAyLXRlc3RzL2RvdG5ldHppcC9zYW1wbGUyLmJ6MiBNZDVzdW0gTWF0Y2hl
ZApQQVNTOiAuL2J6aXAyLXRlc3RzL2RvdG5ldHppcC9zYW1wbGUyLmJ6MiBSZWNvbXByZXNzIChz
bWFsbCkKUEFTUzogLi9iemlwMi10ZXN0cy9kb3RuZXR6aXAvc2FtcGxlMi5iejIgUmVkZWNvbXBy
ZXNzIChzbWFsbCkKLTogT0sKUEFTUzogLi9iemlwMi10ZXN0cy9kb3RuZXR6aXAvc2FtcGxlMi5i
ejIgbWQ1c3VtIE1hdGNoZWQKCiEhISA2IC5ieiBmaWxlcyBkaWQgbm90IGRlY29tcHJlc3NlZC9y
ZWNvbXByZXNzZWQgY29ycmVjdGx5LgoKVGVzdGluZyBkZXRlY3Rpb24gb2YgYmFkIGlucHV0IGRh
dGEuLi4KCgpiemlwMjogRGF0YSBpbnRlZ3JpdHkgZXJyb3Igd2hlbiBkZWNvbXByZXNzaW5nLgpQ
QVNTOiBDb3JyZWN0bHkgZm91bmQgZGF0YSBpbnRlZ3JpdHkgZXJyb3JzIGluIC4vYnppcDItdGVz
dHMvZ28vY29tcHJlc3MvZmFpbC1pc3N1ZTU3NDcuYnoyLmJhZCBkdXJpbmcgZGVjb21wcmVzcy4K
CmJ6aXAyOiBEYXRhIGludGVncml0eSBlcnJvciB3aGVuIGRlY29tcHJlc3NpbmcuClBBU1M6IENv
cnJlY3RseSBmb3VuZCBkYXRhIGludGVncml0eSBlcnJvcnMgaW4gLi9iemlwMi10ZXN0cy9nby9j
b21wcmVzcy9mYWlsLWlzc3VlNTc0Ny5iejIuYmFkIGR1cmluZyBkZWNvbXByZXNzIChzbWFsbCkK
CmJ6aXAyOiBEYXRhIGludGVncml0eSBlcnJvciB3aGVuIGRlY29tcHJlc3NpbmcuClBBU1M6IENv
cnJlY3RseSBmb3VuZCBkYXRhIGludGVncml0eSBlcnJvcnMgaW4gLi9iemlwMi10ZXN0cy9sYnpp
cDIvb3ZlcnJ1bi5iejIuYmFkIGR1cmluZyBkZWNvbXByZXNzLgoKYnppcDI6IERhdGEgaW50ZWdy
aXR5IGVycm9yIHdoZW4gZGVjb21wcmVzc2luZy4KUEFTUzogQ29ycmVjdGx5IGZvdW5kIGRhdGEg
aW50ZWdyaXR5IGVycm9ycyBpbiAuL2J6aXAyLXRlc3RzL2xiemlwMi9vdmVycnVuLmJ6Mi5iYWQg
ZHVyaW5nIGRlY29tcHJlc3MgKHNtYWxsKQoKYnppcDI6IERhdGEgaW50ZWdyaXR5IGVycm9yIHdo
ZW4gZGVjb21wcmVzc2luZy4KUEFTUzogQ29ycmVjdGx5IGZvdW5kIGRhdGEgaW50ZWdyaXR5IGVy
cm9ycyBpbiAuL2J6aXAyLXRlc3RzL2xiemlwMi9jcmMyLmJ6Mi5iYWQgZHVyaW5nIGRlY29tcHJl
c3MuCgpiemlwMjogRGF0YSBpbnRlZ3JpdHkgZXJyb3Igd2hlbiBkZWNvbXByZXNzaW5nLgpQQVNT
OiBDb3JyZWN0bHkgZm91bmQgZGF0YSBpbnRlZ3JpdHkgZXJyb3JzIGluIC4vYnppcDItdGVzdHMv
bGJ6aXAyL2NyYzIuYnoyLmJhZCBkdXJpbmcgZGVjb21wcmVzcyAoc21hbGwpCgpiemlwMjogRGF0
YSBpbnRlZ3JpdHkgZXJyb3Igd2hlbiBkZWNvbXByZXNzaW5nLgpQQVNTOiBDb3JyZWN0bHkgZm91
bmQgZGF0YSBpbnRlZ3JpdHkgZXJyb3JzIGluIC4vYnppcDItdGVzdHMvbGJ6aXAyL2NyYzEuYnoy
LmJhZCBkdXJpbmcgZGVjb21wcmVzcy4KCmJ6aXAyOiBEYXRhIGludGVncml0eSBlcnJvciB3aGVu
IGRlY29tcHJlc3NpbmcuClBBU1M6IENvcnJlY3RseSBmb3VuZCBkYXRhIGludGVncml0eSBlcnJv
cnMgaW4gLi9iemlwMi10ZXN0cy9sYnppcDIvY3JjMS5iejIuYmFkIGR1cmluZyBkZWNvbXByZXNz
IChzbWFsbCkKCmJ6aXAyOiBEYXRhIGludGVncml0eSBlcnJvciB3aGVuIGRlY29tcHJlc3Npbmcu
ClBBU1M6IENvcnJlY3RseSBmb3VuZCBkYXRhIGludGVncml0eSBlcnJvcnMgaW4gLi9iemlwMi10
ZXN0cy9sYnppcDIvb3ZlcnJ1bjIuYnoyLmJhZCBkdXJpbmcgZGVjb21wcmVzcy4KCmJ6aXAyOiBE
YXRhIGludGVncml0eSBlcnJvciB3aGVuIGRlY29tcHJlc3NpbmcuClBBU1M6IENvcnJlY3RseSBm
b3VuZCBkYXRhIGludGVncml0eSBlcnJvcnMgaW4gLi9iemlwMi10ZXN0cy9sYnppcDIvb3ZlcnJ1
bjIuYnoyLmJhZCBkdXJpbmcgZGVjb21wcmVzcyAoc21hbGwpCgpiemlwMjogRGF0YSBpbnRlZ3Jp
dHkgZXJyb3Igd2hlbiBkZWNvbXByZXNzaW5nLgpQQVNTOiBDb3JyZWN0bHkgZm91bmQgZGF0YSBp
bnRlZ3JpdHkgZXJyb3JzIGluIC4vYnppcDItdGVzdHMvbGJ6aXAyL2N2ZS5iejIuYmFkIGR1cmlu
ZyBkZWNvbXByZXNzLgoKYnppcDI6IERhdGEgaW50ZWdyaXR5IGVycm9yIHdoZW4gZGVjb21wcmVz
c2luZy4KUEFTUzogQ29ycmVjdGx5IGZvdW5kIGRhdGEgaW50ZWdyaXR5IGVycm9ycyBpbiAuL2J6
aXAyLXRlc3RzL2xiemlwMi9jdmUuYnoyLmJhZCBkdXJpbmcgZGVjb21wcmVzcyAoc21hbGwpCgpi
emlwMjogRGF0YSBpbnRlZ3JpdHkgZXJyb3Igd2hlbiBkZWNvbXByZXNzaW5nLgpQQVNTOiBDb3Jy
ZWN0bHkgZm91bmQgZGF0YSBpbnRlZ3JpdHkgZXJyb3JzIGluIC4vYnppcDItdGVzdHMvbGJ6aXAy
L2N2ZTIuYnoyLmJhZCBkdXJpbmcgZGVjb21wcmVzcy4KCmJ6aXAyOiBEYXRhIGludGVncml0eSBl
cnJvciB3aGVuIGRlY29tcHJlc3NpbmcuClBBU1M6IENvcnJlY3RseSBmb3VuZCBkYXRhIGludGVn
cml0eSBlcnJvcnMgaW4gLi9iemlwMi10ZXN0cy9sYnppcDIvY3ZlMi5iejIuYmFkIGR1cmluZyBk
ZWNvbXByZXNzIChzbWFsbCkKUEFTUzogQ29ycmVjdGx5IGZvdW5kIGRhdGEgaW50ZWdyaXR5IGVy
cm9ycyBpbiAuL2J6aXAyLXRlc3RzL2xiemlwMi92b2lkLmJ6Mi5iYWQgZHVyaW5nIGRlY29tcHJl
c3MuClBBU1M6IENvcnJlY3RseSBmb3VuZCBkYXRhIGludGVncml0eSBlcnJvcnMgaW4gLi9iemlw
Mi10ZXN0cy9sYnppcDIvdm9pZC5iejIuYmFkIGR1cmluZyBkZWNvbXByZXNzIChzbWFsbCkKCkNv
cnJlY3RseSBmb3VuZCBhbGwgYmFkIGZpbGUgZGF0YSBpbnRlZ3JpdHkgZXJyb3JzLgoKQmFkIHJl
c3VsdHMsIGxvb2sgZm9yICEhISBpbiB0aGUgbG9ncyBhYm92ZQogLSAuL2J6aXAyLXRlc3RzL2Nv
bW1vbnMtY29tcHJlc3MvemlwNjRzdXBwb3J0LnRhci5iejIgYmFkIGRlY29tcHJlc3MgcmVzdWx0
CiAtIC4vYnppcDItdGVzdHMvZ28vcmVnZXhwL3JlMi1leGhhdXN0aXZlLnR4dC5iejIgYmFkIGRl
Y29tcHJlc3MgcmVzdWx0CiAtIC4vYnppcDItdGVzdHMvbGJ6aXAyL2lkeDg5OTk5OS5iejIgYmFk
IGRlY29tcHJlc3MgcmVzdWx0CiAtIC4vYnppcDItdGVzdHMvbGJ6aXAyL2NoMjU1LmJ6MiBiYWQg
ZGVjb21wcmVzcyByZXN1bHQKIC0gLi9iemlwMi10ZXN0cy9weWZsYXRlLzQ1TUItZmIuYnoyIGJh
ZCBkZWNvbXByZXNzIHJlc3VsdAogLSAuL2J6aXAyLXRlc3RzL3B5ZmxhdGUvNDVNQi0wMC5iejIg
YmFkIGRlY29tcHJlc3MgcmVzdWx0CkRVUkFUSU9OOiAzNApFTkQ6IC91c3IvbGliL2J6aXAyL3B0
ZXN0CjIwMjAtMDQtMTNUMTc6MDkKU1RPUDogcHRlc3QtcnVubmVyCnJvb3RAcWVtdXg4Ni02NDp+
IyAK

--000000000000d7237505a32f52c9--
