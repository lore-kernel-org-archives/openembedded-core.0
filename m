Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.3658.1586828938359168261
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 18:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=m00aCPA1;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.221.54, mailfrom: rahulk@mvista.com)
Received: by mail-wr1-f54.google.com with SMTP id i10so12413426wrv.10
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2020 18:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Km4/DQoQqh7w9jMZGVPtVVPkj9MEOgcgX15OSPdg0ps=;
        b=m00aCPA1zB2AK2PK9wHSOlVxW301IEpuPSZ8FK5+QUS5yzqdsdXnfVNhzOdosUFEe2
         4u/YPieAiIq8EfiGsNV+mYSQvh7csK1io5rDPAG3T7o9bR91tMwnLVGANlb+oJ/y1y8B
         0kwz2aagwt9MlkAsucNjtS41cxQIyAODeFf6OXWvJiWME5elOKoIklREmXZDS80Vzggi
         ET+0M/8slD86VuoFtA9pH3RiW6f2X871fh6pisllVXjLysJfTL+d914W4UKw8Vsh9Zld
         VCrHipTBEccHJNCKVZaUwStbe68/Vz1PphURl/lAvwib26/Rd9f7FXaG9+zN9v/f2jUD
         rbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Km4/DQoQqh7w9jMZGVPtVVPkj9MEOgcgX15OSPdg0ps=;
        b=UIpGGRzqaMPqs+iDgLn7jbLGCggqLvYSfYkskhrspmRLdsbZN9MoN38n5/t04yiCYj
         mBbuHmKoxRnLQndXfX5/L0LNGeOYZC8cbns6m6sm8Mr29tfiOKNFKFVHHVtZDQg4Z5JE
         NILAoxoCl26FEc+hOeaXDUEwVZWfAJKDGZ2gBDY1PhjfnzrPiMYrDBSgvoeMhl+vCpg5
         gUc0LMIBZoqvoZQ+CeP++UHytTdGnQ5L9u7lG2JuBTZVYmxHoOITw6J0hBPyU+JdqJ4i
         gopM2SsKvFjDO9BEXHIoXvz4Ph+sSwiE4zRpssOpH40holNkNbU2U7PtwNEz1G75np6V
         FqsA==
X-Gm-Message-State: AGi0Pub8r74drr6E/VAqwgaKlsgdyFtIS1ITQCcPyIVt9fNhrDKDLUcR
	eIPn+Hs8/TCxYPbYrWJwbqw/zgwliFExh5zXdhUouQ==
X-Google-Smtp-Source: APiQypKOmsQ7Q6bExw0DQauh/UAZirdjq++AuaQXFl3UApyuFCrIKBOP4IlhUhPmVH/iBIXyjE2XTYeZRroJhhe9xJs=
X-Received: by 2002:a5d:688f:: with SMTP id h15mr21534272wru.352.1586828936685;
 Mon, 13 Apr 2020 18:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <1585825857-28025-1-git-send-email-rahulk@mvista.com>
 <90e01eab-2485-8a01-fae5-10f970d3242c@windriver.com> <CANv91vPJHYCKucMSRV3hsEQTBcLVYO4porSUr1DJX3TCiizk4A@mail.gmail.com>
 <92f149f2-051b-e67f-6fd5-e329da893e39@windriver.com>
In-Reply-To: <92f149f2-051b-e67f-6fd5-e329da893e39@windriver.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Tue, 14 Apr 2020 07:18:45 +0530
Message-ID: <CANv91vOGzdA52oLRuzDOB2hUA2dzeOb3vcMVO42F4T2iSSyRkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bzip2: Add test suite for bzip2
To: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000173c8805a336670d"

--000000000000173c8805a336670d
Content-Type: text/plain; charset="UTF-8"

Hi Randy,

Thanks for your  feedback.
As per your suggestion,I am working on that.

currently my patch has Upstream-Status: Inappropriate.

Since I am not aware of the patch submission process on bzip2, I posted a
query on bzip2 mailing list (2 days back)  but I did not get any response
from there.
If they are not responding, in this case shall i keep Upstream-Status:
Inappropriate and send the v2 to oe-core  Or  should i wait for his
response?
Or
Do you have any idea how to submit the patch for bzip2-test repo.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Tue, Apr 14, 2020 at 12:48 AM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2020-04-13 1:22 p.m., Rahul Kumar wrote:
>
> Hi Randy,
>
> Kindly find the attached bzip2 ptest logs file.
>
> Hi Rahul,
>
> Most or even all of the tests that fail are due to:
>
>   bzip2: No space left on device
>
> For a [de]compression utility ptest suite, it's certainly reasonable
> to add extra space to the test image:
>
> https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-IMAGE_ROOTFS_EXTRA_SPACE
>
> Make note of what how much extra space is needed in your commit log since
> we don't have a way for ptests to declare this and for it to be added
> automatically.
>
> It would also be really nice to see a summary of your ptest result
> in the long log. For example in my recent update to rsyslog in meta-oe:
>    1ec13d7d9 rsyslog: 8.1911.0 -> 8.2002.0
> ...
>
>     On qemux86-64/kvm the ptest results with extra filesystem
>     space and a timeout of 800 seconds are:
>              1911   2002
>      TOTAL:   389    408
>      PASS:    339    357
>      SKIP:     39     39
>      XFAIL:     0      0
>      FAIL:     11     12
>      XPASS:     0      0
>      ERROR:     0      0
>
> I probably should have listed the extra space used! oops. :)
>
> I answered your Question here .
> Kindly take a look and feel free to point out if i am wrong at any place
> and let me know if i missed anything.
> ==========
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
> Can you explain why you did this? Maybe upstream would accept it ?
>
> Ans:
> we need to parse the TEST_DIR Path because we are running runtest.sh
> script outside the bzip2-tests directory.
> But I figured out a more convenient way for this.
> I will parse the TEST_DIR path during running the runscript.sh.
>
> I can implement this by adding below line in makefile.am file.
> ./bzip2-tests/run-tests.sh --tests-dir="$(PWD)/bzip2-tests"
>
> Ah good.
>
>
> In Next version of patch I will implement it.
>
> ===========
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
>
> Explanation:
>
>    if ! type "valgrind" > /dev/null;
>    suppose if valgrind is not present in my image at that time it is
> showing
> ./bzip2-tests/run-tests.sh: line 43: type: valgrind: not found
>
>    Since we are displaying a message in script that valgrind is used or
> not.
>
>    So i redirect the output
>    BY Modifying this line with "if ! type "valgrind" > /dev/null 2>&1"
>
> ==========
>
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
>
> Explanation:
> I Simply modified valgrind and md5sum messages with Yes/No
>
> I is worth seeing if upstream will accept the change, IMO.
>
>
> ==========
>
> > + # Remove any left over tesfilecopies from previous runs first.
> > +@@ -76,16 +76,16 @@ while IFS= read -r -d '' bzfile; do
> > +   echo "Processing ${bzfile}"
> > +
> > +   # Decompress it.
> > +-  echo "  Decompress..."
> > ++  # echo "  Decompress..."
>
> Explanation:
> Initially for each file It is printing Decompress...
> I think which is not required to display in ptest logs so i comment it out.
>
> Does it cause a problem?
> We try to minimize our changes so if it's just aesthetic, don't change it.
>
>
> ==========
> > +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
> > +-    md5sum --check --status ${md5file} < ${file} \
> > +-      || { echo "!!! md5sum doesn't match decompressed file";
> > ++    md5sum -c ${md5file} < ${file} && { echo "PASS: ${bzfile} md5sum
> Matched"; } \
> > ++      || { echo "FAIL: ${bzfile} md5sum Matched";
> > +            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
> > +            nogood=$[${nogood}+1]; conti
>
> Explanation:
> for md5sum there is no short form option for --status option.
> use of --status is "don't output anything, status code shows success"
>
> md5sum -c ${md5file} < ${copy}
> so i removed the --status option due to this below line is coming in ptest
> log
> -: OK
>
> The discrete md5sum doesn't have a short form of --status and
>
> busybox md5sum only supports '-s'; that's a shame.
>
> I guess we'd need to drop the argument for now but
> this is another case where perhaps upstream bzip2 will
> accommodate our desire to run the tests with busybox so
> it would be nice if you could ask and track the upstream status.
>
>
>
> ==========
>
> +   echo "Bad results, look for !!! in the logs above"
> +   printf ' - %s\n' "${badtests[@]}"
> +-  exit 1
> + fi
> +--
>
> Explanation:
> if some test failed then script is returning with exit 1 status due to
> this at the end of ptest below message is printing
> make: *** [Makefile:14: runtest] Error 1
>
> logs wil looks like below if script returning with exit 1 status
>
> PASS: Correctly found data integrity errors in
> ./bzip2-tests/lbzip2/void.bz2.bad during decompress (small)
>
> Correctly found all bad file data integrity errors.
>
> Bad results, look for !!! in the logs above
>  - ./bzip2-tests/commons-compress/zip64support.tar.bz2 bad decompress
> result
>  - ./bzip2-tests/go/regexp/re2-exhaustive.txt.bz2 bad decompress result
>  - ./bzip2-tests/lbzip2/idx899999.bz2 bad decompress result
>  - ./bzip2-tests/lbzip2/ch255.bz2 bad decompress result
>  - ./bzip2-tests/pyflate/45MB-fb.bz2 bad decompress result
>  - ./bzip2-tests/pyflate/45MB-00.bz2 bad decompress result
> make: *** [Makefile:14: runtest] Error 1
>
> ERROR: Exit status is 512
> DURATION: 31
> END: /usr/lib/bzip2/ptest
> 2020-04-13T16:05
> STOP: ptest-runner
> root@qemux86-64:~#
>
> To avoid "make: *** [Makefile:14: runtest] Error 1" messgae
> I removed exit 1 line from the script.
> May be i am wrong please suggest me i should keep it or remove.
>
>
> I this it's useful information and as long as when you add
> additional filesystem space and the test all pass then we
> don't need to make the failure cases look nice! ;-)
>
>
> ==========
>
> >              file://configure.ac;subdir=${BP} \
> >              file://Makefile.am;subdir=${BP} \
> >              file://run-ptest \
> > +           file://0001-bzip2-modify-run-tests-script.patch;patchdir=${WORKDIR}/git
> \
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
> Ans.
> This script is based on array concept and Arrays are not part of the POSIX
> sh specification.
> so i think we should go with bash script.
>
>
> Maybe just add a comment above the RDEPENDS so that if
> someone wants to get rid of the bash dependency, they know
> where to start. Ideally upstream would get rid of the bashisms
> but their run-tests.sh does use: #!/bin/bash so this is fine for now.
>
>
> ==========
>
> > diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> > index dcf6458..f917b23 100644
> > --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
> > +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
> > @@ -46,6 +46,7 @@ runtest:
> >   else echo "FAIL: sample2 decompress"; fi
> >   @if cmp sample3.tst sample3.ref; then echo "PASS: sample3 decompress";\
> >   else echo "FAIL: sample3 decompress"; fi
> > + ./bzip2-tests/run-tests.sh
> >
> >   install-ptest:
> >   sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
> > @@ -56,6 +57,7 @@ install-ptest:
> >   cp $(srcdir)/sample1.bz2 $(DESTDIR)/
> >   cp $(srcdir)/sample2.bz2 $(DESTDIR)/
> >   cp $(srcdir)/sample3.bz2 $(DESTDIR)/
> > + cp -rf $(srcdir)/../git $(DESTDIR)/bzip2-tests
> >   ln -s $(bindir)/bzip2 $(DESTDIR)/bzip2
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
> > +LIC_FILES_CHKSUM = "
> file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664
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
> Ans:
> I don't have much knowledge about the licensing part so I populated all
> the licenses which are present in the bzip2-tests source code.
> can you please provide any suggestions on what basis we should take the
> decision of the license population.
>
> You should use:
>
> LICENSE = "GPLv3+"
>
> since the only code is the run-tests.sh script and that
> the license given in the script.
>
> The rest of the LICENSE information in the git repo seems
> to have been copied from the packages where these compressed
> _data_ files came from. Since we are not compiling any source,
> we only need to have a LIC_FILES_CHKSUM entry for run-tests.sh.
> We are simply using the compressed files as data so we can
> ignore the license info. Ideally the upstream repo would remove
> the misleading files but IANAL and I don't think it's a problem
> for us really. It's probably worth explaining this in a sentence or
> two in your commit log.
>
>
> ==========
>
> Let me know if I missed anything here.
>
> I think there are a few changes to make for a v2.
>
> Hopefully you will write a commit log that explains the
> changes that we have agreed to make.  The idea is
> that someone should be able to read the long log and
> have a general idea of what the code changes are.
>
> Thanks for working on this ptest addition, it looks like it's
> heading in the right direction and almost done now.
>
> ../Randy
>
>
> *Thanks & Regards,*
> Rahul Kumar
> Software Engineer,Linux Solutions Engineering
> Group,Montavista Software LLC
> Email Id: rahulk@mvista.com
> <https://plus.google.com/+CodeTwoSoftware>
>
>
> On Fri, Apr 3, 2020 at 4:02 AM Randy MacLeod <randy.macleod@windriver.com>
> wrote:
>
>> On 2020-04-02 7:10 a.m., Rahul Kumar wrote:
>> > [YOCTO #13444]
>>
>> Thanks for contributing this work Rahul.
>>
>> It would be good if the long log explained the changes made
>> in a sentence or two. I've made some comments and asked
>> some questions inline below. I may have gone overboard but
>> I hope you get the idea that we'd like to see not just the
>> changes but the reason for the changes.
>>
>> Also, can you present the results of running:
>> # ptest-runner bzip2
>> on qemux86-64 with kvm enabled in the long log?
>> If there are tests that fail or are skipped
>> comment on that even it it's to say that you don't know what is wrong.
>>
>> >
>> > Signed-off-by: Rahul Kumar <rahulk@mvista.com>
>> > ---
>> >   .../bzip2/0001-bzip2-modify-run-tests-script.patch | 220
>> +++++++++++++++++++++
>> >   meta/recipes-extended/bzip2/bzip2/Makefile.am      |   2 +
>> >   meta/recipes-extended/bzip2/bzip2_1.0.8.bb         |  15 +-
>> >   3 files changed, 234 insertions(+), 3 deletions(-)
>> >   create mode 100644
>> meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
>> >
>> > diff --git
>> a/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
>> b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
>> > new file mode 100644
>> > index 0000000..8ae3c4e
>> > --- /dev/null
>> > +++
>> b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch
>> > @@ -0,0 +1,220 @@
>> > +From 42e6258485030085285d4b30854bfb94bcf43880 Mon Sep 17 00:00:00 2001
>> > +From: Rahul Kumar <rahulk@mvista.com>
>> > +Date: Mon, 30 Mar 2020 12:17:00 +0530
>> > +Subject: [PATCH] bzip2: modify run-tests script
>> > +
>> > +Upstream-Status: Inappropriate [ modify run-tests script for ptest
>> infrastructure ]
>>
>> It seems that some of the changes are to make the tests less verbose and
>> to 'tighten-up' the language and formatting used. Upstream might accept
>> them, have you checked? If you change the status to Pending I think it
>> would be better for now because that would force someone check on the
>> progress at some point.
>>
>> > +
>> > +modify run-tests script to write PASS/FAIL as expected by the ptest
>> infrastructure
>> > +
>> > +Signed-off-by: Rahul Kumar <rahulk@mvista.com>
>> > +---
>> > + run-tests.sh | 83
>> +++++++++++++++++++++++++++++++-----------------------------
>> > + 1 file changed, 43 insertions(+), 40 deletions(-)
>> > +
>> > +diff --git a/run-tests.sh b/run-tests.sh
>> > +index 1ba8c27..1eff62a 100755
>> > +--- a/run-tests.sh
>> > ++++ b/run-tests.sh
>> > +@@ -10,7 +10,7 @@
>> > + VALGRIND="valgrind"
>> > + VALGRIND_ARGS="-q --error-exitcode=9"
>> > + BZIP2="bzip2"
>> > +-TESTS_DIR="."
>> > ++TESTS_DIR="./bzip2-tests"
>>
>> Can you explain why you did this? Maybe upstream would accept it.
>>
>> > + IGNORE_MD5=0
>> > +
>> > + for i in "$@"
>> > +@@ -40,21 +40,21 @@ case $i in
>> > + esac
>> > + done
>> > +
>> > +-if ! type "valgrind" > /dev/null; then
>> > ++if ! type "valgrind" > /dev/null 2>&1; then
>> > +   VALGRIND=""
>> > +   VALGRIND_ARGS=""
>> > + fi
>> > +
>> > + echo "Testing ${BZIP2} in directory ${TESTS_DIR}"
>> > + if [ "$VALGRIND" != "" ]; then
>> > +-  echo "  using valgrind"
>> > ++  echo "Using valgrind: Yes"
>> > + else
>> > +-  echo "  NOT using valgrind"
>> > ++  echo "Using valgrind: No"
>> > + fi
>> > + if [[ ${IGNORE_MD5} -eq 0 ]]; then
>> > +-  echo "  checking md5 sums"
>> > ++  echo "Checking md5 sums: Yes"
>> > + else
>> > +-  echo "  NOT checking md5 sums"
>> > ++  echo "Checking md5 sums: No"
>> > + fi
>> > +
>> > + # Remove any left over tesfilecopies from previous runs first.
>> > +@@ -76,16 +76,16 @@ while IFS= read -r -d '' bzfile; do
>> > +   echo "Processing ${bzfile}"
>> > +
>> > +   # Decompress it.
>> > +-  echo "  Decompress..."
>> > ++  # echo "  Decompress..."
>>
>> Without an explanation in the long log, I can't tell if this
>> comment was removed intentionally or perhaps when you were debugging.
>> I expect you have a good reason to remove it but an explaination would
>> be helpful.
>>
>> > +   rm -f "${file}"
>> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} \
>> > +-    || { echo "!!! bad decompress result $?";
>> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${bzfile} && { echo
>> "PASS: ${bzfile} Decompress"; } \
>> > ++    || { echo "FAIL: ${bzfile} Decompress";
>> > +          badtests=("${badtests[@]}" $"${bzfile} bad decompress
>> result")
>> > +          nogood=$[${nogood}+1]; continue; }
>> > +
>> > +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
>> > +-    md5sum --check --status ${md5file} < ${file} \
>> > +-      || { echo "!!! md5sum doesn't match decompressed file";
>> > ++    md5sum -c ${md5file} < ${file} && { echo "PASS: ${bzfile} md5sum
>> Matched"; } \
>> > ++      || { echo "FAIL: ${bzfile} md5sum Matched";
>> > +            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
>> > +            nogood=$[${nogood}+1]; continue; }
>> > +   fi
>> > +@@ -93,20 +93,20 @@ while IFS= read -r -d '' bzfile; do
>> > +   # Compress and decompress a copy
>> > +   mv "${file}" "${copy}"
>> > +   rm -f "${bzcopy}"
>> > +-  echo "  Recompress..."
>> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
>> > +-    || { echo "!!! bad compress result $?";
>> > ++  # echo "  Recompress..."
>> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo
>> "PASS: ${bzfile} Recompress "; } \
>> > ++    || { echo "FAIL: ${bzfile} Recompress";
>> > +          badtests=("${badtests[@]}" $"${copy} bad result")
>> > +          nogood=$[${nogood}+1]; continue; }
>> > +-  echo "  Redecompress..."
>> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
>> > +-    || { echo "!!! bad (re)decompress result $?";
>> > ++  # echo "  Redecompress..."
>> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} && { echo
>> "PASS: ${bzfile} Redecompress"; } \
>> > ++    || { echo "FAIL: ${bzfile} Redecompress";
>> > +          badtests=("${badtests[@]}" $"${bzcopy} bad result")
>> > +          nogood=$[${nogood}+1]; continue; }
>> > +
>> > +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
>> > +-    md5sum --check --status ${md5file} < ${copy} \
>> > +-      || { echo "!!! md5sum doesn't match (re)decompressed file";
>> > ++    md5sum -c ${md5file} < ${copy} && { echo "PASS: ${bzfile} md5sum
>> Matched"; } \
>> > ++      || { echo "FAIL: ${bzfile} md5sum Matched";
>> > +            badtests=("${badtests[@]}" $"${copy} md5sum doesn't match")
>> > +            nogood=$[${nogood}+1]; continue; }
>> > +   fi
>> > +@@ -114,16 +114,16 @@ while IFS= read -r -d '' bzfile; do
>> > +   rm "${copy}"
>> > +
>> > +   # Now do it all again in "small" mode.
>> > +-  echo "  Decompress (small)..."
>> > ++  # echo "  Decompress (small)..."
>> > +   rm -f "${file}"
>> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} \
>> > +-    || { echo "!!! bad decompress result $?";
>> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${bzfile} &&{
>> echo "PASS: ${bzfile} Decompress (small)"; } \
>> > ++    || { echo "FAIL: ${bzfile} Decompress (small)";
>> > +          badtests=("${badtests[@]}" $"${bzfile} bad decompress
>> result")
>> > +          nogood=$[${nogood}+1]; continue; }
>> > +
>> > +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
>> > +-    md5sum --check --status ${md5file} < ${file} \
>> > +-      || { echo "!!! md5sum doesn't match decompressed file";
>> > ++    md5sum -c ${md5file} < ${file} > /dev/null 2>&1 && { echo "PASS:
>> ${bzfile} Md5sum Matched"; } \
>> > ++      || { echo "FAIL: ${bzfile} Md5sum Matched";
>> > +            badtests=("${badtests[@]}" $"${file} md5sum doesn't match")
>> > +            nogood=$[${nogood}+1]; continue; }
>> > +   fi
>> > +@@ -131,20 +131,20 @@ while IFS= read -r -d '' bzfile; do
>> > +   # Compress and decompress a copy
>> > +   mv "${file}" "${copy}"
>> > +   rm -f "${bzcopy}"
>> > +-  echo "  Recompress (small)..."
>> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} \
>> > +-    || { echo "!!! bad compress result $?";
>> > ++  # echo "  Recompress (small)..."
>> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s ${copy} && { echo
>> "PASS: ${bzfile} Recompress (small)"; } \
>> > ++    || { echo "FAIL: ${bzfile} Recompress (small)";
>> > +          badtests=("${badtests[@]}" $"${copy} bad result")
>> > +          nogood=$[${nogood}+1]; continue; }
>> > +-  echo "  Redecompress (small)..."
>> > +-  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} \
>> > +-    || { echo "!!! bad (re)decompress result $?";
>> > ++  # echo "  Redecompress (small)..."
>> > ++  ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s ${bzcopy} && { echo
>> "PASS: ${bzfile} Redecompress (small)"; } \
>> > ++    || { echo "FAIL: ${bzfile} Redecompress (small)";
>> > +          badtests=("${badtests[@]}" $"${bzcopy} bad result")
>> > +          nogood=$[${nogood}+1]; continue; }
>> > +
>> > +   if [[ ${IGNORE_MD5} -ne 1 ]]; then
>> > +-    md5sum --check --status ${md5file} < ${copy} \
>> > +-      || { echo "!!! md5sum doesn't match (re)decompressed file";
>> > ++    md5sum -c ${md5file} < ${copy} && { echo "PASS: ${bzfile} md5sum
>> Matched"; } \
>> > ++      || { echo "FAIL: ${bzfile} md5sum : Miss Matched";
>> > +            badtests=("${badtests[@]}" $"${copy} md5sum doesn't match")
>> > +            nogood=$[${nogood}+1]; continue; }
>> > +   fi
>> > +@@ -169,14 +169,14 @@ nobad=0
>> > + badbad=0
>> > + while IFS= read -r -d '' badfile; do
>> > +
>> > +-  echo "Processing ${badfile}"
>> > ++  # echo "Processing ${badfile}"
>> > +
>> > +-  echo "  Trying to decompress..."
>> > ++  # echo "  Trying to decompress..."
>> > +   ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q ${badfile}
>> > +   ret=$?
>> > +
>> > +   if [[ ${ret} -eq 0 ]]; then
>> > +-    echo "!!! badness not detected"
>> > ++    echo "FAIL: badness not detected"
>> > +     nobad=$[${nobad}+1]
>> > +     badtests=("${badtests[@]}" $"${badfile} badness not detected")
>> > +     continue
>> > +@@ -185,18 +185,20 @@ while IFS= read -r -d '' badfile; do
>> > +   # Assumes "normal" badness is detected by exit code 1 or 2.
>> > +   # A crash or valgrind issue will be reported with something else.
>> > +   if [[ ${ret} != 1 ]] && [[ ${ret} != 2 ]]; then
>> > +-    echo "!!! baddness caused baddness in ${BZIP2}"
>> > ++    echo "FAIL: baddness caused baddness in ${BZIP2}"
>> It's 'badness':
>> https://www.merriam-webster.com/thesaurus/badness
>> > +     badbad=$[${badbad}+1]
>> > +     badtests=("${badtests[@]}" $"${badfile} badness caused baddness")
>> > +     continue
>> > ++  else
>> > ++    echo "PASS: Correctly found data integrity errors in ${badfile}
>> during decompress."
>> > +   fi
>> > +
>> > +-  echo "  Trying to decompress (small)..."
>> > ++  # echo "  Trying to decompress (small)..."
>> > +   ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s ${badfile}
>> > +   ret=$?
>> > +
>> > +   if [[ ${ret} -eq 0 ]]; then
>> > +-    echo "!!! badness not detected"
>> > ++    echo "FAIL: badness not detected "
>> > +     nobad=$[${nobad}+1]
>> > +     badtests=("${badtests[@]}" $"${badfile} badness not detected")
>> > +     continue
>> > +@@ -205,10 +207,12 @@ while IFS= read -r -d '' badfile; do
>> > +   # Assumes "normal" badness is detected by exit code 1 or 2.
>> > +   # A crash or valgrind issue will be reported with something else.
>> > +   if [[ ${ret} != 1 ]] && [[ ${ret} != 2 ]]; then
>> > +-    echo "!!! baddness caused baddness in ${BZIP2}"
>> > ++    echo "FAIL: baddness caused baddness in ${BZIP2}"
>> > +     badbad=$[${badbad}+1]
>> > +     badtests=("${badtests[@]}" $"${badfile} badness caused baddness")
>> > +     continue
>> > ++  else
>> > ++    echo "PASS: Correctly found data integrity errors in ${badfile}
>> during decompress (small)"
>> > +   fi
>> > +
>> > + done < <(find ${TESTS_DIR} -type f -name \*\.bz2.bad -print0)
>> > +@@ -234,5 +238,4 @@ if [[ ${results} -eq 0 ]]; then
>> > + else
>> > +   echo "Bad results, look for !!! in the logs above"
>> > +   printf ' - %s\n' "${badtests[@]}"
>> > +-  exit 1
>> > + fi
>> > +--
>> > +2.7.4
>> > diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am
>> b/meta/recipes-extended/bzip2/bzip2/Makefile.am
>> > index dcf6458..f917b23 100644
>> > --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
>> > +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
>> > @@ -46,6 +46,7 @@ runtest:
>> >       else echo "FAIL: sample2 decompress"; fi
>> >       @if cmp sample3.tst sample3.ref; then echo "PASS: sample3
>> decompress";\
>> >       else echo "FAIL: sample3 decompress"; fi
>> > +     ./bzip2-tests/run-tests.sh
>> >
>> >   install-ptest:
>> >       sed  -n '/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}' \
>> > @@ -56,6 +57,7 @@ install-ptest:
>> >       cp $(srcdir)/sample1.bz2        $(DESTDIR)/
>> >       cp $(srcdir)/sample2.bz2        $(DESTDIR)/
>> >       cp $(srcdir)/sample3.bz2        $(DESTDIR)/
>> > +     cp -rf $(srcdir)/../git         $(DESTDIR)/bzip2-tests
>> >       ln -s $(bindir)/bzip2           $(DESTDIR)/bzip2
>> >
>> >   install-exec-hook:
>> > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
>> b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
>> > index 8e9b779..e8ec5c6 100644
>> > --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
>> > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
>> > @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and approaches the
>> performance of the PPM family of
>> >   HOMEPAGE = "https://sourceware.org/bzip2/"
>> >   SECTION = "console/utils"
>> >   LICENSE = "bzip2"
>> > -LIC_FILES_CHKSUM =
>> "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
>> > -
>> > +LIC_FILES_CHKSUM = "
>> file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664
>> \
>> > +
>> file://../git/go/LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707 \
>> > +
>> file://../git/dotnetzip/License.txt;md5=9cb56871eed4e748c3bc7e8ff352a54f
>> \
>> > +
>> file://../git/dotnetzip/License.zlib.txt;md5=cc421ccd22eeb2e5db6b79e6de0a029f
>> \
>> > +
>> file://../git/commons-compress/LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327
>> \
>>
>> What's all this additional license info about?
>> Please explain in when replying as well as in the long log.
>>
>> > +                   "
>> >   SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
>> > +           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests \
>>
>> Mention how big this repo is in the long log.
>>
>> >              file://configure.ac;subdir=${BP} \
>> >              file://Makefile.am;subdir=${BP} \
>> >              file://run-ptest \
>> > +           file://0001-bzip2-modify-run-tests-script.patch;patchdir=${WORKDIR}/git
>> \
>> >              "
>> > +
>> >   SRC_URI[md5sum] = "67e051268d0c475ea773822f7500d0e5"
>> >   SRC_URI[sha256sum] =
>> "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269"
>> >
>> > +SRCREV_bzip2-tests = "8b0198efda1603cf81fa2c7a9bb673dd22ae1661"
>> > +
>> >   UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
>> >
>> >   PACKAGES =+ "libbz2"
>> > @@ -39,7 +48,7 @@ do_install_ptest () {
>> >
>> >   FILES_libbz2 = "${libdir}/lib*${SOLIBS}"
>> >
>> > -RDEPENDS_${PN}-ptest += "make"
>> > +RDEPENDS_${PN}-ptest += "make bash"
>>
>> Does it really depend on bash or just a POSIX compliant /bin/sh ?
>> If it requires bash, how bad are the scripts and can they be made
>> POSIX compliant with the help of:
>>     https://www.shellcheck.net/
>>
>> ../Randy
>>
>> >
>> >   PROVIDES_append_class-native = " bzip2-replacement-native"
>> >   BBCLASSEXTEND = "native nativesdk"
>> >
>> >
>> > 
>> >
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>

--000000000000173c8805a336670d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi Randy,</div><div class=3D"gmail_default" style=
=
=3D"font-family:verdana,sans-serif;color:#0b5394"><br></div><div class=3D"=
gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b5394">Thank=
s for your=C2=A0 feedback.=C2=A0</div><div class=3D"gmail_default" style=3D=
"font-family:verdana,sans-serif;color:#0b5394">As per your suggestion,I am =
working on that.</div><div class=3D"gmail_default" style=3D"font-family:ver=
dana,sans-serif;color:#0b5394"><br></div><div class=3D"gmail_default" style=
=
=3D"font-family:verdana,sans-serif;color:#0b5394">currently my patch has U=
pstream-Status: Inappropriate.</div><div class=3D"gmail_default" style=3D"f=
ont-family:verdana,sans-serif;color:#0b5394"><br></div><div class=3D"gmail_=
default" style=3D"font-family:verdana,sans-serif;color:#0b5394">Since I am =
not aware of the patch submission process on bzip2, I posted a query on bzi=
p2 mailing list (2 days back)=C2=A0 but I did not get any response from the=
re.<br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans=
-serif;color:#0b5394">If they are not responding, in this case shall=C2=A0i=
 keep=C2=A0Upstream-Status: Inappropriate and send the v2 to oe-core=C2=A0 =
Or=C2=A0 should i wait for his response?</div><div class=3D"gmail_default" =
style=3D"font-family:verdana,sans-serif;color:#0b5394">Or</div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#0b5394">=
Do you have any idea how to submit the patch for bzip2-test repo.<br></div>=
<div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:=
#0b5394"><br></div><div><div dir=3D"ltr" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><span style=3D"c=
olor:rgb(111,168,220)">	=09
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
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 14=
, 2020 at 12:48 AM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windri=
ver.com" target=3D"_blank">randy.macleod@windriver.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
  
    
  
  <div>
    <div>On 2020-04-13 1:22 p.m., Rahul Kumar
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)">Hi Randy,<br>
          <br>
          Kindly find the attached bzip2 ptest logs file.<br>
        </div>
      </div>
    </blockquote>
    <p>Hi Rahul,<br>
    </p>
    <p>Most or even all of the tests that fail are due to:</p>
    <p>=C2=A0 bzip2: No space left on device</p>
    <p>For a [de]compression utility ptest suite, it&#39;s certainly
      reasonable<br>
      to add extra space to the test image:<br>
      =C2=A0
<a href=3D"https://www.yoctoproject.org/docs/current/ref-manual/ref-manual=
.html#var-IMAGE_ROOTFS_EXTRA_SPACE" target=3D"_blank">https://www.yoctoproj=
ect.org/docs/current/ref-manual/ref-manual.html#var-IMAGE_ROOTFS_EXTRA_SPAC=
E</a></p>
    <p>Make note of what how much extra space is needed in your commit
      log since<br>
      we don&#39;t have a way for ptests to declare this and for it to be
      added automatically.</p>
    <p>It would also be really nice to see a summary of your ptest
      result<br>
      in the long log. For example in my recent update to rsyslog in
      meta-oe:<br>
      =C2=A0=C2=A0 1ec13d7d9 rsyslog: 8.1911.0 -&gt; 8.2002.0<br>
      ...<br>
    </p>
    <p>=C2=A0=C2=A0=C2=A0 On qemux86-64/kvm the ptest results with extra f=
ilesystem<br>
      =C2=A0=C2=A0=C2=A0 space and a timeout of 800 seconds are:<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1911=C2=A0=C2=A0 2002<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 TOTAL:=C2=A0=C2=A0 389=C2=A0=C2=A0=C2=A0 40=
8<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 PASS:=C2=A0=C2=A0=C2=A0 339=C2=A0=C2=A0=C2=
=A0 357<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 SKIP:=C2=A0=C2=A0=C2=A0=C2=A0 39=C2=A0=C2=
=A0=C2=A0=C2=A0 39<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 XFAIL:=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 FAIL:=C2=A0=C2=A0=C2=A0=C2=A0 11=C2=A0=C2=
=A0=C2=A0=C2=A0 12<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 XPASS:=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 ERROR:=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0<br>
    </p>
    <p>I probably should have listed the extra space used! oops. :)<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)">I
          answered your Question here .</div>
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)">Kindly
          take a look and feel free to point out if i am wrong at any
          place and let me know if i missed anything.=C2=A0</div>
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          &gt; +<br>
          &gt; +modify run-tests script to write PASS/FAIL as expected
          by the ptest infrastructure<br>
          &gt; +<br>
          &gt; +Signed-off-by: Rahul Kumar &lt;<a href=3D"mailto:rahulk@mv=
ista.com" target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
          &gt; +---<br>
          &gt; + run-tests.sh | 83
          +++++++++++++++++++++++++++++++-----------------------------<br>
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
          Can you explain why you did this? Maybe upstream would accept
          it ?<br>
          <br>
          Ans: <br>
          we need to parse the TEST_DIR Path because we are running
          runtest.sh script outside the bzip2-tests directory.<br>
          But I figured out a more convenient way for this.<br>
          I will parse the TEST_DIR path during running the
          runscript.sh.<br>
          <br>
          I can implement this by adding below line in <a href=3D"http://m=
akefile.am" target=3D"_blank">makefile.am</a> file.<br>
          ./bzip2-tests/run-tests.sh --tests-dir=3D&quot;$(PWD)/bzip2-test=
s&quot; <br>
        </div>
      </div>
    </blockquote>
    Ah good.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)"><br>
          In Next version of patch I will implement it.<br>
          <br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          &gt; + IGNORE_MD5=3D0<br>
          &gt; +<br>
          &gt; + for i in &quot;$@&quot;<br>
          &gt; +@@ -40,21 +40,21 @@ case $i in<br>
          &gt; + esac<br>
          &gt; + done<br>
          &gt; +<br>
          &gt; +-if ! type &quot;valgrind&quot; &gt; /dev/null; then<br>
          &gt; ++if ! type &quot;valgrind&quot; &gt; /dev/null 2&gt;&amp;1=
; then<br>
          &gt; + =C2=A0 VALGRIND=3D&quot;&quot;<br>
          &gt; + =C2=A0 VALGRIND_ARGS=3D&quot;&quot;<br>
          &gt; + fi<br>
          <br>
          Explanation:<br>
          =C2=A0<br>
          =C2=A0 =C2=A0if ! type &quot;valgrind&quot; &gt; /dev/null;<br>
          =C2=A0 =C2=A0suppose if valgrind is not present in my image at t=
hat time
          it is showing <br>
          ./bzip2-tests/run-tests.sh: line 43: type: valgrind: not found<b=
r>
          <br>
          =C2=A0 =C2=A0Since we are displaying a message in script that va=
lgrind
          is used or not. =C2=A0 =C2=A0<br>
          =C2=A0 =C2=A0 <br>
          =C2=A0 =C2=A0So i redirect the output<br>
          =C2=A0 =C2=A0BY Modifying this line with &quot;if ! type &quot;v=
algrind&quot; &gt;
          /dev/null 2&gt;&amp;1&quot; <br>
          =C2=A0 =C2=A0 =C2=A0<br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          &gt; + echo &quot;Testing ${BZIP2} in directory ${TESTS_DIR}&quo=
t;<br>
          &gt; + if [ &quot;$VALGRIND&quot; !=3D &quot;&quot; ]; then<br>
          &gt; +- =C2=A0echo &quot; =C2=A0using valgrind&quot;<br>
          &gt; ++ =C2=A0echo &quot;Using valgrind: Yes&quot;<br>
          &gt; + else<br>
          &gt; +- =C2=A0echo &quot; =C2=A0NOT using valgrind&quot;<br>
          &gt; ++ =C2=A0echo &quot;Using valgrind: No&quot;<br>
          &gt; + fi<br>
          &gt; + if [[ ${IGNORE_MD5} -eq 0 ]]; then<br>
          &gt; +- =C2=A0echo &quot; =C2=A0checking md5 sums&quot;<br>
          &gt; ++ =C2=A0echo &quot;Checking md5 sums: Yes&quot;<br>
          &gt; + else<br>
          &gt; +- =C2=A0echo &quot; =C2=A0NOT checking md5 sums&quot;<br>
          &gt; ++ =C2=A0echo &quot;Checking md5 sums: No&quot;<br>
          &gt; + fi<br>
          &gt; +<br>
          <br>
          Explanation:<br>
          I Simply modified valgrind and md5sum messages with Yes/No<br>
        </div>
      </div>
    </blockquote>
    I is worth seeing if upstream will accept the change, IMO.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)"><br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          &gt; + # Remove any left over tesfilecopies from previous runs
          first.<br>
          &gt; +@@ -76,16 +76,16 @@ while IFS=3D read -r -d &#39;&#39; bzf=
ile; do<br>
          &gt; + =C2=A0 echo &quot;Processing ${bzfile}&quot;<br>
          &gt; +<br>
          &gt; + =C2=A0 # Decompress it.<br>
          &gt; +- =C2=A0echo &quot; =C2=A0Decompress...&quot;<br>
          &gt; ++ =C2=A0# echo &quot; =C2=A0Decompress...&quot;<br>
          <br>
          Explanation:<br>
          Initially for each file It is printing Decompress... <br>
          I think which is not required to display in ptest logs so i
          comment it out.<br>
        </div>
      </div>
    </blockquote>
    Does it cause a problem?<br>
    We try to minimize our changes so if it&#39;s just aesthetic, don&#39;=
t
    change it.<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)"><br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          &gt; + =C2=A0 if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
          &gt; +- =C2=A0 =C2=A0md5sum --check --status ${md5file} &lt; ${f=
ile} \<br>
          &gt; +- =C2=A0 =C2=A0 =C2=A0|| { echo &quot;!!! md5sum doesn&#39=
;t match decompressed
          file&quot;;<br>
          &gt; ++ =C2=A0 =C2=A0md5sum -c ${md5file} &lt; ${file} &amp;&amp=
; { echo
          &quot;PASS: ${bzfile} md5sum Matched&quot;; } \<br>
          &gt; ++ =C2=A0 =C2=A0 =C2=A0|| { echo &quot;FAIL: ${bzfile} md5s=
um Matched&quot;;<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0badtests=3D(&quo=
t;${badtests[@]}&quot; $&quot;${file} md5sum
          doesn&#39;t match&quot;)<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nogood=3D$[${nog=
ood}+1]; conti<br>
          <br>
          Explanation:<br>
          for md5sum there is no short form option for --status option.
          <br>
          use of --status is &quot;don&#39;t output anything, status code =
shows
          success&quot; <br>
          <br>
          md5sum -c ${md5file} &lt; ${copy}<br>
          so i removed the --status option due to this below line is
          coming in ptest log<br>
          -: OK<br>
        </div>
      </div>
    </blockquote>
    <p>The discrete md5sum doesn&#39;t have a short form of --status and</=
p>
    <p>busybox md5sum only supports &#39;-s&#39;; that&#39;s a shame.</p>
    <p>I guess we&#39;d need to drop the argument for now but<br>
      this is another case where perhaps upstream bzip2 will<br>
      accommodate our desire to run the tests with busybox so<br>
      it would be nice if you could ask and track the upstream status.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)"><br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          + =C2=A0 echo &quot;Bad results, look for !!! in the logs above&=
quot;<br>
          + =C2=A0 printf &#39; - %s\n&#39; &quot;${badtests[@]}&quot;<br>
          +- =C2=A0exit 1<br>
          + fi<br>
          +--<br>
          <br>
          Explanation:<br>
          if some test failed then script is returning with exit 1
          status due to this at the end of ptest below message is
          printing<br>
          make: *** [Makefile:14: runtest] Error 1<br>
          <br>
          logs wil looks like below if script returning with exit 1
          status=C2=A0<br>
          <br>
          PASS: Correctly found data integrity errors in
          ./bzip2-tests/lbzip2/void.bz2.bad during decompress (small)<br>
          <br>
          Correctly found all bad file data integrity errors.<br>
          <br>
          Bad results, look for !!! in the logs above<br>
          =C2=A0- ./bzip2-tests/commons-compress/zip64support.tar.bz2 bad
          decompress result<br>
          =C2=A0- ./bzip2-tests/go/regexp/re2-exhaustive.txt.bz2 bad
          decompress result<br>
          =C2=A0- ./bzip2-tests/lbzip2/idx899999.bz2 bad decompress result=
<br>
          =C2=A0- ./bzip2-tests/lbzip2/ch255.bz2 bad decompress result<br>
          =C2=A0- ./bzip2-tests/pyflate/45MB-fb.bz2 bad decompress result<=
br>
          =C2=A0- ./bzip2-tests/pyflate/45MB-00.bz2 bad decompress result<=
br>
          make: *** [Makefile:14: runtest] Error 1<br>
          <br>
          ERROR: Exit status is 512<br>
          DURATION: 31<br>
          END: /usr/lib/bzip2/ptest<br>
          2020-04-13T16:05<br>
          STOP: ptest-runner<br>
          root@qemux86-64:~#<br>
          <br>
          To avoid &quot;make: *** [Makefile:14: runtest] Error 1&quot; me=
ssgae<br>
          I removed exit 1 line from the script.<br>
          May be i am wrong please suggest me i should keep it or
          remove.<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I this it&#39;s useful information and as long as when you add<br>
      additional filesystem space and the test all pass then we<br>
      don&#39;t need to make the failure cases look nice! ;-)<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)"><br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://<=
/a><a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a>;subdi=
r=3D${BP}
          \<br>
          &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://M=
akefile.am;subdir=3D$</a>{BP} \<br>
          &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://r=
un-ptest</a> \<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
          <a>file://0001-bzip2-modify-run-tests-script.patch;patchdir=3D$<=
/a>{WORKDIR}/git
          \<br>
          &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
          &gt; +<br>
          &gt; =C2=A0 SRC_URI[md5sum] =3D &quot;67e051268d0c475ea773822f75=
00d0e5&quot;<br>
          &gt; =C2=A0 SRC_URI[sha256sum] =3D
          &quot;ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c=
4a2269&quot;<br>
          &gt; =C2=A0 <br>
          &gt; +SRCREV_bzip2-tests =3D
          &quot;8b0198efda1603cf81fa2c7a9bb673dd22ae1661&quot;<br>
          &gt; +<br>
          &gt; =C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://www.=
sourceware.org/pub/bzip2/" target=3D"_blank">https://www.sourceware.org/pub=
/bzip2/</a>&quot;<br>
          &gt; =C2=A0 <br>
          &gt; =C2=A0 PACKAGES =3D+ &quot;libbz2&quot;<br>
          &gt; @@ -39,7 +48,7 @@ do_install_ptest () {<br>
          &gt; =C2=A0 <br>
          &gt; =C2=A0 FILES_libbz2 =3D &quot;${libdir}/lib*${SOLIBS}&quot;=
<br>
          &gt; =C2=A0 <br>
          &gt; -RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>
          &gt; +RDEPENDS_${PN}-ptest +=3D &quot;make bash&quot;<br>
          <br>
          Does it really depend on bash or just a POSIX compliant
          /bin/sh ?<br>
          If it requires bash, how bad are the scripts and can they be
          made<br>
          POSIX compliant with the help of:<br>
          =C2=A0 =C2=A0 <a href=3D"https://www.shellcheck.net/" target=3D"=
_blank">https://www.shellcheck.net/</a><br>
          Ans.<br>
          This script is based on array concept and Arrays are not part
          of the POSIX sh specification. <br>
          so i think we should go with bash script.<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Maybe just add a comment above the RDEPENDS so that if<br>
      someone wants to get rid of the bash dependency, they know<br>
      where to start. Ideally upstream would get rid of the bashisms<br>
      but their run-tests.sh does use: #!/bin/bash so this is fine for
      now.<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)"><br>
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          <br>
          &gt; diff --git
          a/meta/recipes-extended/bzip2/bzip2/Makefile.am
          b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; index dcf6458..f917b23 100644<br>
          &gt; --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; @@ -46,6 +46,7 @@ runtest:<br>
          &gt; =C2=A0 else echo &quot;FAIL: sample2 decompress&quot;; fi<b=
r>
          &gt; =C2=A0 @if cmp sample3.tst sample3.ref; then echo &quot;PAS=
S:
          sample3 decompress&quot;;\<br>
          &gt; =C2=A0 else echo &quot;FAIL: sample3 decompress&quot;; fi<b=
r>
          &gt; + ./bzip2-tests/run-tests.sh<br>
          &gt; =C2=A0 <br>
          &gt; =C2=A0 install-ptest:<br>
          &gt; =C2=A0 sed =C2=A0-n
          &#39;/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}&#39; \<b=
r>
          &gt; @@ -56,6 +57,7 @@ install-ptest:<br>
          &gt; =C2=A0 cp $(srcdir)/sample1.bz2 $(DESTDIR)/<br>
          &gt; =C2=A0 cp $(srcdir)/sample2.bz2 $(DESTDIR)/<br>
          &gt; =C2=A0 cp $(srcdir)/sample3.bz2 $(DESTDIR)/<br>
          &gt; + cp -rf $(srcdir)/../git $(DESTDIR)/bzip2-tests<br>
          &gt; =C2=A0 ln -s $(bindir)/bzip2 $(DESTDIR)/bzip2<br>
          &gt; =C2=A0 <br>
          &gt; =C2=A0 install-exec-hook:<br>
          &gt; diff --git a/meta/recipes-extended/bzip2/<a href=3D"http://=
bzip2_1.0.8.bb" target=3D"_blank">bzip2_1.0.8.bb</a>
          b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" =
target=3D"_blank">bzip2_1.0.8.bb</a><br>
          &gt; index 8e9b779..e8ec5c6 100644<br>
          &gt; --- a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1=
.0.8.bb" target=3D"_blank">bzip2_1.0.8.bb</a><br>
          &gt; +++ b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1=
.0.8.bb" target=3D"_blank">bzip2_1.0.8.bb</a><br>
          &gt; @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and
          approaches the performance of the PPM family of<br>
          &gt; =C2=A0 HOMEPAGE =3D &quot;<a href=3D"https://sourceware.org=
/bzip2/" target=3D"_blank">https://sourceware.org/bzip2/</a>&quot;<br>
          &gt; =C2=A0 SECTION =3D &quot;console/utils&quot;<br>
          &gt; =C2=A0 LICENSE =3D &quot;bzip2&quot;<br>
          &gt; -LIC_FILES_CHKSUM =3D
<a>&quot;file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82=
e32f19b32df4664&quot;</a><br>
          &gt; -<br>
          &gt; +LIC_FILES_CHKSUM =3D
&quot;<a>file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82=
e32f19b32df4664</a>
          \<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
          =C2=A0<a>file://../git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e=
0dd74707</a>
          \<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
=C2=A0<a>file://../git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3bc7e8=
ff352a54f</a>
          \<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
=C2=A0<a>file://../git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5db=
6b79e6de0a029f</a>
          \<br>
          &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
=C2=A0<a>file://../git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c94=
79bd8986968f4327</a>
          \<br>
          <br>
          What&#39;s all this additional license info about?<br>
          Please explain in when replying as well as in the long log.<br>
          <br>
          Ans:<br>
          I don&#39;t have much knowledge about the licensing part so I
          populated all the licenses which are present in the
          bzip2-tests source code.<br>
          can you please provide any suggestions on what basis we should
          take the decision of the license population. <br>
        </div>
      </div>
    </blockquote>
    <p>You should use:</p>
    <p>LICENSE =3D &quot;GPLv3+&quot;</p>
    <p>since the only code is the run-tests.sh script and that<br>
      the license given in the script.</p>
    <p>The rest of the LICENSE information in the git repo seems<br>
      to have been copied from the packages where these compressed<br>
      _data_ files came from. Since we are not compiling any source,<br>
      we only need to have a LIC_FILES_CHKSUM entry for run-tests.sh.<br>
      We are simply using the compressed files as data so we can<br>
      ignore the license info. Ideally the upstream repo would remove <br>
      the misleading files but IANAL and I don&#39;t think it&#39;s a prob=
lem<br>
      for us really. It&#39;s probably worth explaining this in a sentence
      or<br>
      two in your commit log.<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)"><br>
        </div>
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)">Let me
          know if I missed anything here. <br>
        </div>
      </div>
    </blockquote>
    <p>I think there are a few changes to make for a v2.</p>
    <p>Hopefully you will write a commit log that explains the<br>
      changes that we have agreed to make.=C2=A0 The idea is <br>
      that someone should be able to read the long log and<br>
      have a general idea of what the code changes are.</p>
    <p>Thanks for working on this ptest addition, it looks like it&#39;s<b=
r>
      heading in the right direction and almost done now.</p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if;color:rgb(11,83,148)"><br>
        </div>
        <div>
          <div dir=3D"ltr">
            <div dir=3D"ltr">
              <div>
                <div dir=3D"ltr">
                  <div>
                    <div dir=3D"ltr">
                      <div>
                        <div dir=3D"ltr">
                          <div>
                            <div dir=3D"ltr">
                              <div>
                                <div dir=3D"ltr">
                                  <div><span style=3D"color:rgb(111,168,22=
0)"> <b><span style=3D"color:rgb(11,83,148)">Thanks
                                          &amp; Regards,</span></b></span>=
</div>
                                  <div><span style=3D"color:rgb(111,168,22=
0)"><span style=3D"color:rgb(11,83,148)"></span></span><span style=3D"color=
:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)"></span></span></div=
>
                                  <div><span style=3D"color:rgb(111,168,22=
0)"><span style=3D"color:rgb(11,83,148)">Rahul
                                        Kumar</span></span></div>
                                  <div><span style=3D"color:rgb(11,83,148)=
">Software
                                      Engineer,Linux Solutions
                                      Engineering</span></div>
                                  <div><span style=3D"color:rgb(11,83,148)=
">
                                      Group,Montavista Software LLC</span>=
</div>
                                  <div><span style=3D"color:rgb(11,83,148)=
">Email
                                      Id: <span style=3D"font-size:10pt"><=
a href=3D"mailto:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a>=
</span></span><span><a href=3D"https://plus.google.com/+CodeTwoSoftware" re=
l=3D"noopener" target=3D"_blank"><span style=3D"font-family:Verdana,sans-se=
rif;font-size:10pt;color:rgb(42,42,42)"><br>
                                        </span></a></span></div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <br>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 3, 2020 at 4:02 =
AM
          Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com"=
 target=3D"_blank">randy.macleod@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          2020-04-02 7:10 a.m., Rahul Kumar wrote:<br>
          &gt; [YOCTO #13444]<br>
          <br>
          Thanks for contributing this work Rahul.<br>
          <br>
          It would be good if the long log explained the changes made<br>
          in a sentence or two. I&#39;ve made some comments and asked<br>
          some questions inline below. I may have gone overboard but<br>
          I hope you get the idea that we&#39;d like to see not just the<b=
r>
          changes but the reason for the changes.<br>
          <br>
          Also, can you present the results of running:<br>
          # ptest-runner bzip2<br>
          on qemux86-64 with kvm enabled in the long log?<br>
          If there are tests that fail or are skipped<br>
          comment on that even it it&#39;s to say that you don&#39;t know =
what
          is wrong.<br>
          <br>
          &gt; <br>
          &gt; Signed-off-by: Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvi=
sta.com" target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
          &gt; ---<br>
          &gt;=C2=A0 =C2=A0.../bzip2/0001-bzip2-modify-run-tests-script.pa=
tch |
          220 +++++++++++++++++++++<br>
          &gt;=C2=A0 =C2=A0meta/recipes-extended/bzip2/bzip2/Makefile.am=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0
          =C2=A02 +<br>
          &gt;=C2=A0 =C2=A0meta/recipes-extended/bzip2/<a href=3D"http://b=
zip2_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a>=C2=
=A0 =C2=A0
          =C2=A0 =C2=A0 =C2=A0|=C2=A0 15 +-<br>
          &gt;=C2=A0 =C2=A03 files changed, 234 insertions(+), 3 deletions=
(-)<br>
          &gt;=C2=A0 =C2=A0create mode 100644
meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.patch=
<br>
          &gt; <br>
          &gt; diff --git
a/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.pat=
ch
b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.pat=
ch<br>
          &gt; new file mode 100644<br>
          &gt; index 0000000..8ae3c4e<br>
          &gt; --- /dev/null<br>
          &gt; +++
b/meta/recipes-extended/bzip2/bzip2/0001-bzip2-modify-run-tests-script.pat=
ch<br>
          &gt; @@ -0,0 +1,220 @@<br>
          &gt; +From 42e6258485030085285d4b30854bfb94bcf43880 Mon Sep 17
          00:00:00 2001<br>
          &gt; +From: Rahul Kumar &lt;<a href=3D"mailto:rahulk@mvista.com"=
 target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
          &gt; +Date: Mon, 30 Mar 2020 12:17:00 +0530<br>
          &gt; +Subject: [PATCH] bzip2: modify run-tests script<br>
          &gt; +<br>
          &gt; +Upstream-Status: Inappropriate [ modify run-tests script
          for ptest infrastructure ]<br>
          <br>
          It seems that some of the changes are to make the tests less
          verbose and<br>
          to &#39;tighten-up&#39; the language and formatting used. Upstre=
am
          might accept<br>
          them, have you checked? If you change the status to Pending I
          think it<br>
          would be better for now because that would force someone check
          on the<br>
          progress at some point.<br>
          <br>
          &gt; +<br>
          &gt; +modify run-tests script to write PASS/FAIL as expected
          by the ptest infrastructure<br>
          &gt; +<br>
          &gt; +Signed-off-by: Rahul Kumar &lt;<a href=3D"mailto:rahulk@mv=
ista.com" target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
          &gt; +---<br>
          &gt; + run-tests.sh | 83
          +++++++++++++++++++++++++++++++-----------------------------<br>
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
          Can you explain why you did this? Maybe upstream would accept
          it.<br>
          <br>
          &gt; + IGNORE_MD5=3D0<br>
          &gt; +<br>
          &gt; + for i in &quot;$@&quot;<br>
          &gt; +@@ -40,21 +40,21 @@ case $i in<br>
          &gt; + esac<br>
          &gt; + done<br>
          &gt; +<br>
          &gt; +-if ! type &quot;valgrind&quot; &gt; /dev/null; then<br>
          &gt; ++if ! type &quot;valgrind&quot; &gt; /dev/null 2&gt;&amp;1=
; then<br>
          &gt; +=C2=A0 =C2=A0VALGRIND=3D&quot;&quot;<br>
          &gt; +=C2=A0 =C2=A0VALGRIND_ARGS=3D&quot;&quot;<br>
          &gt; + fi<br>
          &gt; +<br>
          &gt; + echo &quot;Testing ${BZIP2} in directory ${TESTS_DIR}&quo=
t;<br>
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
          &gt; + # Remove any left over tesfilecopies from previous runs
          first.<br>
          &gt; +@@ -76,16 +76,16 @@ while IFS=3D read -r -d &#39;&#39; bzf=
ile; do<br>
          &gt; +=C2=A0 =C2=A0echo &quot;Processing ${bzfile}&quot;<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0# Decompress it.<br>
          &gt; +-=C2=A0 echo &quot;=C2=A0 Decompress...&quot;<br>
          &gt; ++=C2=A0 # echo &quot;=C2=A0 Decompress...&quot;<br>
          <br>
          Without an explanation in the long log, I can&#39;t tell if this=
<br>
          comment was removed intentionally or perhaps when you were
          debugging.<br>
          I expect you have a good reason to remove it but an
          explaination would<br>
          be helpful.<br>
          <br>
          &gt; +=C2=A0 =C2=A0rm -f &quot;${file}&quot;<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q
          ${bzfile} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad decompress result $=
?&quot;;<br>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q
          ${bzfile} &amp;&amp; { echo &quot;PASS: ${bzfile} Decompress&quo=
t;; } \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Decompress&=
quot;;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${bad=
tests[@]}&quot; $&quot;${bzfile} bad
          decompress result&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${f=
ile} \<br>
          &gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo &quot;!!! md5sum doesn&#39=
;t match decompressed
          file&quot;;<br>
          &gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${file} &amp;&amp=
; { echo
          &quot;PASS: ${bzfile} md5sum Matched&quot;; } \<br>
          &gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} md5s=
um Matched&quot;;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quo=
t;${badtests[@]}&quot; $&quot;${file} md5sum
          doesn&#39;t match&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nog=
ood}+1]; continue; }<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +@@ -93,20 +93,20 @@ while IFS=3D read -r -d &#39;&#39; bzf=
ile; do<br>
          &gt; +=C2=A0 =C2=A0# Compress and decompress a copy<br>
          &gt; +=C2=A0 =C2=A0mv &quot;${file}&quot; &quot;${copy}&quot;<br=
>
          &gt; +=C2=A0 =C2=A0rm -f &quot;${bzcopy}&quot;<br>
          &gt; +-=C2=A0 echo &quot;=C2=A0 Recompress...&quot;<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s
          ${copy} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad compress result $?&=
quot;;<br>
          &gt; ++=C2=A0 # echo &quot;=C2=A0 Recompress...&quot;<br>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s
          ${copy} &amp;&amp; { echo &quot;PASS: ${bzfile} Recompress &quot=
;; } \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Recompress&=
quot;;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${bad=
tests[@]}&quot; $&quot;${copy} bad
          result&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +-=C2=A0 echo &quot;=C2=A0 Redecompress...&quot;<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s
          ${bzcopy} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad (re)decompress resu=
lt $?&quot;;<br>
          &gt; ++=C2=A0 # echo &quot;=C2=A0 Redecompress...&quot;<br>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s
          ${bzcopy} &amp;&amp; { echo &quot;PASS: ${bzfile} Redecompress&q=
uot;; }
          \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Redecompres=
s&quot;;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${bad=
tests[@]}&quot; $&quot;${bzcopy} bad
          result&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${c=
opy} \<br>
          &gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo &quot;!!! md5sum doesn&#39=
;t match
          (re)decompressed file&quot;;<br>
          &gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${copy} &amp;&amp=
; { echo
          &quot;PASS: ${bzfile} md5sum Matched&quot;; } \<br>
          &gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} md5s=
um Matched&quot;;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quo=
t;${badtests[@]}&quot; $&quot;${copy} md5sum
          doesn&#39;t match&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nog=
ood}+1]; continue; }<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +@@ -114,16 +114,16 @@ while IFS=3D read -r -d &#39;&#39; b=
zfile;
          do<br>
          &gt; +=C2=A0 =C2=A0rm &quot;${copy}&quot;<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0# Now do it all again in &quot;small&quot; mo=
de.<br>
          &gt; +-=C2=A0 echo &quot;=C2=A0 Decompress (small)...&quot;<br>
          &gt; ++=C2=A0 # echo &quot;=C2=A0 Decompress (small)...&quot;<br=
>
          &gt; +=C2=A0 =C2=A0rm -f &quot;${file}&quot;<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s
          ${bzfile} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad decompress result $=
?&quot;;<br>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -q -s
          ${bzfile} &amp;&amp;{ echo &quot;PASS: ${bzfile} Decompress
          (small)&quot;; } \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Decompress =
(small)&quot;;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${bad=
tests[@]}&quot; $&quot;${bzfile} bad
          decompress result&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${f=
ile} \<br>
          &gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo &quot;!!! md5sum doesn&#39=
;t match decompressed
          file&quot;;<br>
          &gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${file} &gt; /dev=
/null
          2&gt;&amp;1 &amp;&amp; { echo &quot;PASS: ${bzfile} Md5sum
          Matched&quot;; } \<br>
          &gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Md5s=
um Matched&quot;;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quo=
t;${badtests[@]}&quot; $&quot;${file} md5sum
          doesn&#39;t match&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nog=
ood}+1]; continue; }<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +@@ -131,20 +131,20 @@ while IFS=3D read -r -d &#39;&#39; b=
zfile;
          do<br>
          &gt; +=C2=A0 =C2=A0# Compress and decompress a copy<br>
          &gt; +=C2=A0 =C2=A0mv &quot;${file}&quot; &quot;${copy}&quot;<br=
>
          &gt; +=C2=A0 =C2=A0rm -f &quot;${bzcopy}&quot;<br>
          &gt; +-=C2=A0 echo &quot;=C2=A0 Recompress (small)...&quot;<br>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s
          ${copy} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad compress result $?&=
quot;;<br>
          &gt; ++=C2=A0 # echo &quot;=C2=A0 Recompress (small)...&quot;<br=
>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -z -q -s
          ${copy} &amp;&amp; { echo &quot;PASS: ${bzfile} Recompress
          (small)&quot;; } \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Recompress =
(small)&quot;;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${bad=
tests[@]}&quot; $&quot;${copy} bad
          result&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +-=C2=A0 echo &quot;=C2=A0 Redecompress (small)...&quot;<br=
>
          &gt; +-=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s
          ${bzcopy} \<br>
          &gt; +-=C2=A0 =C2=A0 || { echo &quot;!!! bad (re)decompress resu=
lt $?&quot;;<br>
          &gt; ++=C2=A0 # echo &quot;=C2=A0 Redecompress (small)...&quot;<=
br>
          &gt; ++=C2=A0 ${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -d -q -s
          ${bzcopy} &amp;&amp; { echo &quot;PASS: ${bzfile} Redecompress
          (small)&quot;; } \<br>
          &gt; ++=C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} Redecompres=
s (small)&quot;;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quot;${bad=
tests[@]}&quot; $&quot;${bzcopy} bad
          result&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nogood}+1]=
; continue; }<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${IGNORE_MD5} -ne 1 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 md5sum --check --status ${md5file} &lt; ${c=
opy} \<br>
          &gt; +-=C2=A0 =C2=A0 =C2=A0 || { echo &quot;!!! md5sum doesn&#39=
;t match
          (re)decompressed file&quot;;<br>
          &gt; ++=C2=A0 =C2=A0 md5sum -c ${md5file} &lt; ${copy} &amp;&amp=
; { echo
          &quot;PASS: ${bzfile} md5sum Matched&quot;; } \<br>
          &gt; ++=C2=A0 =C2=A0 =C2=A0 || { echo &quot;FAIL: ${bzfile} md5s=
um : Miss
          Matched&quot;;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 badtests=3D(&quo=
t;${badtests[@]}&quot; $&quot;${copy} md5sum
          doesn&#39;t match&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nogood=3D$[${nog=
ood}+1]; continue; }<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +@@ -169,14 +169,14 @@ nobad=3D0<br>
          &gt; + badbad=3D0<br>
          &gt; + while IFS=3D read -r -d &#39;&#39; badfile; do<br>
          &gt; +<br>
          &gt; +-=C2=A0 echo &quot;Processing ${badfile}&quot;<br>
          &gt; ++=C2=A0 # echo &quot;Processing ${badfile}&quot;<br>
          &gt; +<br>
          &gt; +-=C2=A0 echo &quot;=C2=A0 Trying to decompress...&quot;<br=
>
          &gt; ++=C2=A0 # echo &quot;=C2=A0 Trying to decompress...&quot;<=
br>
          &gt; +=C2=A0 =C2=A0${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -=
q
          ${badfile}<br>
          &gt; +=C2=A0 =C2=A0ret=3D$?<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${ret} -eq 0 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 echo &quot;!!! badness not detected&quot;<b=
r>
          &gt; ++=C2=A0 =C2=A0 echo &quot;FAIL: badness not detected&quot;=
<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0nobad=3D$[${nobad}+1]<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D(&quot;${badtests[@]}&quot;=
 $&quot;${badfile} badness not
          detected&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
          &gt; +@@ -185,18 +185,20 @@ while IFS=3D read -r -d &#39;&#39; b=
adfile;
          do<br>
          &gt; +=C2=A0 =C2=A0# Assumes &quot;normal&quot; badness is detec=
ted by exit code 1
          or 2.<br>
          &gt; +=C2=A0 =C2=A0# A crash or valgrind issue will be reported =
with
          something else.<br>
          &gt; +=C2=A0 =C2=A0if [[ ${ret} !=3D 1 ]] &amp;&amp; [[ ${ret} !=
=
=3D 2 ]];
          then<br>
          &gt; +-=C2=A0 =C2=A0 echo &quot;!!! baddness caused baddness in =
${BZIP2}&quot;<br>
          &gt; ++=C2=A0 =C2=A0 echo &quot;FAIL: baddness caused baddness i=
n ${BZIP2}&quot;<br>
          It&#39;s &#39;badness&#39;:<br>
          <a href=3D"https://www.merriam-webster.com/thesaurus/badness" re=
l=3D"noreferrer" target=3D"_blank">https://www.merriam-webster.com/thesauru=
s/badness</a><br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badbad=3D$[${badbad}+1]<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D(&quot;${badtests[@]}&quot;=
 $&quot;${badfile} badness
          caused baddness&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
          &gt; ++=C2=A0 else<br>
          &gt; ++=C2=A0 =C2=A0 echo &quot;PASS: Correctly found data integ=
rity errors
          in ${badfile} during decompress.&quot;<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +<br>
          &gt; +-=C2=A0 echo &quot;=C2=A0 Trying to decompress (small)...&=
quot;<br>
          &gt; ++=C2=A0 # echo &quot;=C2=A0 Trying to decompress (small)..=
.&quot;<br>
          &gt; +=C2=A0 =C2=A0${VALGRIND} ${VALGRIND_ARGS} ${BZIP2} -k -d -=
q -s
          ${badfile}<br>
          &gt; +=C2=A0 =C2=A0ret=3D$?<br>
          &gt; +<br>
          &gt; +=C2=A0 =C2=A0if [[ ${ret} -eq 0 ]]; then<br>
          &gt; +-=C2=A0 =C2=A0 echo &quot;!!! badness not detected&quot;<b=
r>
          &gt; ++=C2=A0 =C2=A0 echo &quot;FAIL: badness not detected &quot=
;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0nobad=3D$[${nobad}+1]<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D(&quot;${badtests[@]}&quot;=
 $&quot;${badfile} badness not
          detected&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
          &gt; +@@ -205,10 +207,12 @@ while IFS=3D read -r -d &#39;&#39; b=
adfile;
          do<br>
          &gt; +=C2=A0 =C2=A0# Assumes &quot;normal&quot; badness is detec=
ted by exit code 1
          or 2.<br>
          &gt; +=C2=A0 =C2=A0# A crash or valgrind issue will be reported =
with
          something else.<br>
          &gt; +=C2=A0 =C2=A0if [[ ${ret} !=3D 1 ]] &amp;&amp; [[ ${ret} !=
=
=3D 2 ]];
          then<br>
          &gt; +-=C2=A0 =C2=A0 echo &quot;!!! baddness caused baddness in =
${BZIP2}&quot;<br>
          &gt; ++=C2=A0 =C2=A0 echo &quot;FAIL: baddness caused baddness i=
n ${BZIP2}&quot;<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badbad=3D$[${badbad}+1]<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0badtests=3D(&quot;${badtests[@]}&quot;=
 $&quot;${badfile} badness
          caused baddness&quot;)<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0continue<br>
          &gt; ++=C2=A0 else<br>
          &gt; ++=C2=A0 =C2=A0 echo &quot;PASS: Correctly found data integ=
rity errors
          in ${badfile} during decompress (small)&quot;<br>
          &gt; +=C2=A0 =C2=A0fi<br>
          &gt; +<br>
          &gt; + done &lt; &lt;(find ${TESTS_DIR} -type f -name
          \*\.bz2.bad -print0)<br>
          &gt; +@@ -234,5 +238,4 @@ if [[ ${results} -eq 0 ]]; then<br>
          &gt; + else<br>
          &gt; +=C2=A0 =C2=A0echo &quot;Bad results, look for !!! in the l=
ogs above&quot;<br>
          &gt; +=C2=A0 =C2=A0printf &#39; - %s\n&#39; &quot;${badtests[@]}=
&quot;<br>
          &gt; +-=C2=A0 exit 1<br>
          &gt; + fi<br>
          &gt; +--<br>
          &gt; +2.7.4<br>
          &gt; diff --git
          a/meta/recipes-extended/bzip2/bzip2/Makefile.am
          b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; index dcf6458..f917b23 100644<br>
          &gt; --- a/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; +++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am<br>
          &gt; @@ -46,6 +46,7 @@ runtest:<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else echo &quot;FAIL: sample2 dec=
ompress&quot;; fi<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@if cmp sample3.tst sample3.ref; =
then echo &quot;PASS:
          sample3 decompress&quot;;\<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else echo &quot;FAIL: sample3 dec=
ompress&quot;; fi<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0./bzip2-tests/run-tests.sh<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt;=C2=A0 =C2=A0install-ptest:<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed=C2=A0 -n
          &#39;/^runtest:/,/^install-ptest:/{/^install-ptest:/!p}&#39; \<b=
r>
          &gt; @@ -56,6 +57,7 @@ install-ptest:<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample1.bz2=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $(DESTDIR)/<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample2.bz2=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $(DESTDIR)/<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(srcdir)/sample3.bz2=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 $(DESTDIR)/<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0cp -rf $(srcdir)/../git=C2=A0 =C2=A0 =
=C2=A0 =C2=A0
          =C2=A0$(DESTDIR)/bzip2-tests<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s $(bindir)/bzip2=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(DESTDIR)/bzip2<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt;=C2=A0 =C2=A0install-exec-hook:<br>
          &gt; diff --git a/meta/recipes-extended/bzip2/<a href=3D"http://=
bzip2_1.0.8.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a>
          b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1.0.8.bb" =
rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a><br>
          &gt; index 8e9b779..e8ec5c6 100644<br>
          &gt; --- a/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1=
.0.8.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a><br>
          &gt; +++ b/meta/recipes-extended/bzip2/<a href=3D"http://bzip2_1=
.0.8.bb" rel=3D"noreferrer" target=3D"_blank">bzip2_1.0.8.bb</a><br>
          &gt; @@ -5,16 +5,25 @@ LZ77/LZ78-based compressors, and
          approaches the performance of the PPM family of<br>
          &gt;=C2=A0 =C2=A0HOMEPAGE =3D &quot;<a href=3D"https://sourcewar=
e.org/bzip2/" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/b=
zip2/</a>&quot;<br>
          &gt;=C2=A0 =C2=A0SECTION =3D &quot;console/utils&quot;<br>
          &gt;=C2=A0 =C2=A0LICENSE =3D &quot;bzip2&quot;<br>
          &gt; -LIC_FILES_CHKSUM =3D
<a>&quot;file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82=
e32f19b32df4664&quot;</a><br>
          &gt; -<br>
          &gt; +LIC_FILES_CHKSUM =3D
&quot;<a>file://LICENSE;beginline=3D4;endline=3D37;md5=3D600af43c50f1fcb82=
e32f19b32df4664</a>
          \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
          <a>file://../git/go/LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd747=
07</a>
          \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
          <a>file://../git/dotnetzip/License.txt;md5=3D9cb56871eed4e748c3b=
c7e8ff352a54f</a>
          \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
<a>file://../git/dotnetzip/License.zlib.txt;md5=3Dcc421ccd22eeb2e5db6b79e6=
de0a029f</a>
          \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
<a>file://../git/commons-compress/LICENSE.txt;md5=3D86d3f3a95c324c9479bd89=
86968f4327</a>
          \<br>
          <br>
          What&#39;s all this additional license info about?<br>
          Please explain in when replying as well as in the long log.<br>
          <br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;<br>
          &gt;=C2=A0 =C2=A0SRC_URI =3D &quot;<a href=3D"https://sourceware=
.org/pub/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=
=3D"_blank">https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz</a>
          \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"=
http://sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tests" rel=3D"norefe=
rrer" target=3D"_blank">sourceware.org/git/bzip2-tests.git;name=3Dbzip2-tes=
ts</a>
          \<br>
          <br>
          Mention how big this repo is in the long log.<br>
          <br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://<=
/a><a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a>;subdir=3D${BP}
          \<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://M=
akefile.am;subdir=3D$</a>{BP} \<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>file://r=
un-ptest</a> \<br>
          &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
          =C2=A0<a>file://0001-bzip2-modify-run-tests-script.patch;patchdi=
r=3D$</a>{WORKDIR}/git
          \<br>
          &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
          &gt; +<br>
          &gt;=C2=A0 =C2=A0SRC_URI[md5sum] =3D &quot;67e051268d0c475ea7738=
22f7500d0e5&quot;<br>
          &gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D
          &quot;ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c=
4a2269&quot;<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt; +SRCREV_bzip2-tests =3D
          &quot;8b0198efda1603cf81fa2c7a9bb673dd22ae1661&quot;<br>
          &gt; +<br>
          &gt;=C2=A0 =C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https:/=
/www.sourceware.org/pub/bzip2/" rel=3D"noreferrer" target=3D"_blank">https:=
//www.sourceware.org/pub/bzip2/</a>&quot;<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt;=C2=A0 =C2=A0PACKAGES =3D+ &quot;libbz2&quot;<br>
          &gt; @@ -39,7 +48,7 @@ do_install_ptest () {<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt;=C2=A0 =C2=A0FILES_libbz2 =3D &quot;${libdir}/lib*${SOLIBS}&=
quot;<br>
          &gt;=C2=A0 =C2=A0<br>
          &gt; -RDEPENDS_${PN}-ptest +=3D &quot;make&quot;<br>
          &gt; +RDEPENDS_${PN}-ptest +=3D &quot;make bash&quot;<br>
          <br>
          Does it really depend on bash or just a POSIX compliant
          /bin/sh ?<br>
          If it requires bash, how bad are the scripts and can they be
          made<br>
          POSIX compliant with the help of:<br>
          =C2=A0 =C2=A0 <a href=3D"https://www.shellcheck.net/" rel=3D"nor=
eferrer" target=3D"_blank">https://www.shellcheck.net/</a><br>
          <br>
          ../Randy<br>
          <br>
          &gt;=C2=A0 =C2=A0<br>
          &gt;=C2=A0 =C2=A0PROVIDES_append_class-native =3D &quot;
          bzip2-replacement-native&quot;<br>
          &gt;=C2=A0 =C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<=
br>
          &gt; <br>
          &gt; <br>
          &gt; <br>
          &gt; <br>
          <br>
          <br>
          -- <br>
          # Randy MacLeod<br>
          # Wind River Linux<br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

</blockquote></div>

--000000000000173c8805a336670d--
