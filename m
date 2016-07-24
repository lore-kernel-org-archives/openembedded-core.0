Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6643F606BF;
	Sun, 24 Jul 2016 14:54:08 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u25so7465045qtb.3;
	Sun, 24 Jul 2016 07:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u8v8Vp6WJcEMb6SBk6pZsDwFiNhgDs25gw8oU1Pp9TY=;
	b=zuI3BRMwL0F8dRzwphNXvRyZp2pS2k6woXBtgx8Su4MvixrBg+rPnARyde2x0TspF5
	Uhcw6KR7Wab55/Pq1FOABB0EPyAqgZQ5OfgU+oAkHuyd6VkLSOoz1OKOxRH5ZW860ii5
	Uw0hOd5P3MZ8wovSWylB10/019J/TYSwJYbnmVAgFXEc2GAa4awilU+O2bkCZKZI0I6h
	dKvBtCjokPzhCMSX/YCgxPb7H4lNWMO74ZuZFBw3Qtqhky18C9c0I55aARVTiiXaN3YL
	TV6cs5reCLarHyZJ5ephQVldUcn+A7FRuEz8BvdBac7xlEFO51rHpPd8hEbVpkVJ2BU8
	+99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u8v8Vp6WJcEMb6SBk6pZsDwFiNhgDs25gw8oU1Pp9TY=;
	b=bCMih5c3FWXRLgmkG7DaoGe0aZhD7Kbfs+DmBZl1py1LCc6DuCO6ECKyfV+uU+uLKG
	bBgIlXWEp7gyK5JGqb6qdiV6ok28WUPHYqen4/BmFHGxxCZ6RDR6DmaDxNU51BR5qkcA
	0dtt4KdUVMs30+3M+sjBwsNINIjpMUbT0NhXW5jn1Cutclo4RwlqRx09Kek6DhvgdsoE
	PKUFhOfyTE2oxA6Mrt+axZHWUuKrzmTucy8xIGOsR3R6D5GiHqTL2B8Gz8wOJdkUCPTn
	iE85312sYKa8zMTEM2BAD/03QB14XllBet4NqN1hY0WPak2AmPu67IxzwVBntC5RoQKx
	adQw==
X-Gm-Message-State: AEkoouvvSWEuHp4aye0Kss67irlAJs34Y16GIEJOjDgHGgoZ5Pb4JFWC9yv4cWYvtdQiH4ToT3PXyKj9Y0fefg==
X-Received: by 10.200.56.155 with SMTP id f27mr22326268qtc.26.1469372048652;
	Sun, 24 Jul 2016 07:54:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Sun, 24 Jul 2016 07:53:39 -0700 (PDT)
In-Reply-To: <20160724121138.i7fp26ateflny4kl@jama>
References: <20160708085912.13734.77555@opal.openembedded.org>
	<20160708085918.3A528501B3@opal.openembedded.org>
	<20160724121138.i7fp26ateflny4kl@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Jul 2016 07:53:39 -0700
Message-ID: <CAMKF1spvPZ_tSZ_FDeZt6baoG4afvvys++PwVRnGY6j_DFsSZw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 21/28: rt-tests: move ptest to python3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Jul 2016 14:54:12 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 24, 2016 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Any idea why it fails now like this:
>
> http://errors.yoctoproject.org/Errors/Details/73086/
>

it shows --sysroot=TOPDIR/tmp-glibc/sysroots/qemuarm-O2

is that what you see in your logs  too. I know they get edited before
uploading so may be its just the log munging issue.
but this could be problem.

> ?
>
> On Fri, Jul 08, 2016 at 08:59:33AM +0000, git@git.openembedded.org wrote:
>> rpurdie pushed a commit to branch master
>> in repository openembedded-core.
>>
>> commit 2767cbe014f84c9ad42ed8ef1eca7caa862e5196
>> Author: Maxin B. John <maxin.john@intel.com>
>> AuthorDate: Fri Jul 1 11:39:02 2016 +0300
>>
>>     rt-tests: move ptest to python3
>>
>>     convert python2 based ptest of rt-tests package to python3
>>
>>     Signed-off-by: Maxin B. John <maxin.john@intel.com>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-rt/rt-tests/files/rt_bmark.py | 26 +++++++++++++-------------
>>  meta/recipes-rt/rt-tests/files/run-ptest   |  2 +-
>>  meta/recipes-rt/rt-tests/rt-tests_2.0.bb   |  2 +-
>>  3 files changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
>> index 0e2b105..080a655 100755
>> --- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
>> +++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
>> @@ -1,4 +1,4 @@
>> -#!/usr/bin/python
>> +#!/usr/bin/env python3
>>  # -*- coding: utf-8 -*-
>>
>>  # SPDX-License-Identifier:     BSD-3-Clause
>> @@ -106,8 +106,8 @@ def tc_name(sub_name):
>>
>>  def log(*msg):
>>          tmp = "".join(map(str, msg)) # 'map(str, ...' allows numbers
>> -        for line in tmp.split("\n"):
>> -                print "#", line
>> +        for line in tmp.splitlines():
>> +                print("#", line)
>>
>>  #-------------------------------------------------------------------------------
>>  # Like log(), but with a timestamp added
>> @@ -265,7 +265,7 @@ cmd = ("cyclictest",
>>         "-d", str(interval_delta),
>>         "-l", str(loop_count)
>>         )
>> -rex = re.compile("C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
>> +rex = re.compile(b"C:\s*(\d+).*Min:\s*(\d+).*Avg:\s*(\d+).*Max:\s*(\d+)")
>>
>>  def run_cyclictest_once():
>>          res = subprocess.check_output(cmd)
>> @@ -283,7 +283,7 @@ def run_cyclictest_once():
>>          avg_sum = 0
>>          avg_cnt = 0
>>
>> -        for line in res.split("\n"):
>> +        for line in res.splitlines():
>>                  m = rex.search(line)
>>                  if m is not None:
>>                          minlist.append(int(m.group(2)))
>> @@ -376,11 +376,11 @@ class cyclictest_runner:
>>                          log()
>>                          log("PASS")
>>
>> -                        print
>> -                        print tc_name(name), "[Min/us,Avg/us,Max/us]:",
>> -                        print "%d,%.1f,%d" % (bm_min,bm_avg, bm_max)
>> -                        print "PASS:", tc_name(name)
>> -                        print
>> +                        print()
>> +                        print(tc_name(name), "[Min/us,Avg/us,Max/us]:",)
>> +                        print("%d,%.1f,%d" % (bm_min,bm_avg, bm_max))
>> +                        print("PASS:", tc_name(name))
>> +                        print()
>>
>>                  except Exception:
>>                          log()
>> @@ -391,9 +391,9 @@ class cyclictest_runner:
>>                          log("WD: ", os.getcwd())
>>                          log()
>>                          log("FAIL")
>> -                        print
>> -                        print "FAIL:", tc_name(name)
>> -                        print
>> +                        print()
>> +                        print("FAIL:", tc_name(name))
>> +                        print()
>>
>>  #-------------------------------------------------------------------------------
>>
>> diff --git a/meta/recipes-rt/rt-tests/files/run-ptest b/meta/recipes-rt/rt-tests/files/run-ptest
>> index 8e6d3e3..b7c5e29 100644
>> --- a/meta/recipes-rt/rt-tests/files/run-ptest
>> +++ b/meta/recipes-rt/rt-tests/files/run-ptest
>> @@ -1,3 +1,3 @@
>>  #!/bin/sh
>>
>> -python ./rt_bmark.py
>> +python3 ./rt_bmark.py
>> diff --git a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
>> index 21780d1..83869b8 100644
>> --- a/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
>> +++ b/meta/recipes-rt/rt-tests/rt-tests_2.0.bb
>> @@ -28,6 +28,6 @@ do_install_ptest() {
>>          cp ${WORKDIR}/rt_bmark.py ${D}${PTEST_PATH}
>>  }
>>
>> -RDEPENDS_${PN}-ptest += " stress python python-subprocess python-multiprocessing python-datetime python-re python-lang"
>> +RDEPENDS_${PN}-ptest += " stress python3 python3-subprocess python3-multiprocessing python3-datetime python3-re python3-lang python3-misc"
>>
>>  FILES_${PN} += "${prefix}/src/backfire"
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

