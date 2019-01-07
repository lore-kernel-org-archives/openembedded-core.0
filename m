Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98A7160102
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 02:11:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x072ACWB015311
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 6 Jan 2019 18:10:43 -0800
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 6 Jan 2019 18:10:02 -0800
To: Khem Raj <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <efccb653-580b-3a5f-6e3d-be5d51b6b8c1@windriver.com>
	<8569515ec23ddf8ca122621a6f59d89b024066df.camel@linuxfoundation.org>
	<298dd0b5-f2f8-23dc-3a0d-cf05958e038c@windriver.com>
	<cc3405fd6c7f18dfa7dc9f545ae33e4515b7b856.camel@linuxfoundation.org>
	<ab613fa4-f4b8-9415-bedf-e2a2b6a52101@gmail.com>
	<90c78052-ac1a-cf6c-f252-28a074e029e3@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <b6fcd328-da29-22db-1ee2-b0ba177ce4f0@windriver.com>
Date: Mon, 7 Jan 2019 10:18:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <90c78052-ac1a-cf6c-f252-28a074e029e3@windriver.com>
X-Originating-IP: [128.224.163.141]
Subject: Re: gdb failure on simplest hello world program -- oe-selftest
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
X-List-Received-Date: Mon, 07 Jan 2019 02:11:25 -0000
Content-Type: multipart/alternative;
	boundary="------------1A4C8AAE691EC4A277DC8EA7"

--------------1A4C8AAE691EC4A277DC8EA7
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I've filed a bug for this issue.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13123

I could spend time to work on it, but I really don't know how to start.
Hope some experts could help or give me some advice.

Best Regards,
Chen Qi

On 12/29/2018 11:26 AM, ChenQi wrote:
> On 12/29/2018 01:09 AM, Khem Raj wrote:
>>
>>
>> On 12/28/18 8:31 AM, richard.purdie@linuxfoundation.org wrote:
>>> On Fri, 2018-12-28 at 17:49 +0800, ChenQi wrote:
>>>> On 12/26/2018 07:06 PM, richard.purdie@linuxfoundation.org wrote:
>>>>> On Wed, 2018-12-26 at 10:09 +0800, ChenQi wrote:
>>>>>> Hi All,
>>>>>>
>>>>>> 'oe-selftest -r package.PackageTests.test_gdb_hardlink_debug'
>>>>>> fails.
>>>>>> I did the tests on both my Fedora27 and ubuntu16.04 servers. They
>>>>>> both
>>>>>> failed.
>>>>>> I can also reproduce this issue manually.
>>>>>>
>>>>>> I did some investigation. No clue how to fix this it. So I want
>>>>>> to seek
>>>>>> help from community.
>>>>>>
>>>>>> Below is some output from oe-selftest.
>>>>>> [snip]
>>>>>> 2018-12-26 09:27:58,440 - oe-selftest - INFO -
>>>>>> test_gdb_hardlink_debug
>>>>>> (package.PackageTests)
>>>>>> 2018-12-26 09:37:55,333 - oe-selftest - INFO - gdbtest
>>>>>> /usr/bin/hello1
>>>>>> 2018-12-26 09:37:59,904 - oe-selftest - ERROR - GDB result:
>>>>>> 1: Reading symbols from /usr/bin/hello1...Reading symbols from
>>>>>> /usr/bin/.debug/hello4...done.
>>>>>> done.
>>>>>> (gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h,
>>>>>> line 107.
>>>>>> (gdb) Starting program: /usr/bin/hello1
>>>>>>
>>>>>> Breakpoint 1, main () at /usr/include/bits/stdio2.h:107
>>>>>> 107    /usr/include/bits/stdio2.h: No such file or directory.
>>>>>> (gdb) Continuing.
>>>>>> Hello World!
>>>>>> [Inferior 1 (process 312) exited normally]
>>>>>> (gdb)
>>>>>> 2018-12-26 09:38:00,907 - oe-selftest - INFO -  ... FAIL
>>>>>> [snip]
>>>>>>
>>>>>> The hello world problem is as follows.
>>>>>> $ cat
>>>>>> meta-selftest/recipes-test/selftest-hardlink/selftest-
>>>>>> hardlink/hello.c
>>>>>> #include <stdio.h>
>>>>>>
>>>>>> int main() {
>>>>>>       printf("Hello World!\n");
>>>>>> }
>>>>>>
>>>>>> Some extra information:
>>>>>> 1. Remove '-O2' or '-D_FORTIFY_SOURCE=2', and it works correctly.
>>>>>> 2. Adding some system call like daemon(0,0) before printf also
>>>>>> works.
>>>>>> 3. Reverting poky repo to
>>>>>> 1c048479af7cc98e30f9a33d1f3bef03711544aa,
>>>>>> which adds this selftest case, does not work. It still fails.
>>>>>> 4. Hongxu confirms that things work on his host.
>>>>>> 5. I also don't see failure about this test case on yocto's
>>>>>> autobuilder.
>>>>>>
>>>>>> Could somebody help to provide some suggestions?
>>>>>
>>>>> This is strange and there must be some difference between your
>>>>> configuration and what what we test on the autobuilder or on
>>>>> Hongxu's
>>>>> setup.
>>>>   Hi Richard,
>>>>
>>>> I have talked with Hongxu and we can now both confirm that there does
>>>> exist some problem.
>>>>
>>>>> Which DISTRO and MACHINE are you using?
>>>>   DISTRO is poky
>>>> MACHINE is qemux86.
>>>>
>>>> It seems that if MACHINE is qemux86-64, the test case could pass. But
>>>> that's just because the test case only checks 'Breakpoint 1, main ()
>>>> at hello.c:4'. See the console output below.
>>>> (gdb) b main
>>>> Breakpoint 1 at 0x1050: file /usr/include/bits/stdio2.h, line 107.
>>>> (gdb) r
>>>> Starting program: /usr/bin/hello1
>>>>
>>>> Breakpoint 1, main () at hello.c:4
>>>> 4        printf("Hello World!\n");
>>>> (gdb) c
>>>> Continuing.
>>>> Hello World!
>>>> [Inferior 1 (process 156) exited normally]
>>>> (gdb) q
>>>>
>>>> Even in this case, the 'b main' does not give correct result. The
>>>> test case passes because 'Breakpoint 1, main () at hello.c:4' is
>>>> there.
>>>>
>>>> On qemux86, we have:
>>>> (gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h, line
>>>> 107.
>>>> (gdb) Starting program: /usr/bin/hello1
>>>>
>>>> Breakpoint 1, main () at /usr/include/bits/stdio2.h:107
>>>> 107    /usr/include/bits/stdio2.h: No such file or directory.
>>>> (gdb) Continuing.
>>>> Hello World!
>>>> [Inferior 1 (process 156) exited normally]
>>>> (gdb)
>>>>
>>>>> I think the key to resolving this is will be to understanding how
>>>>> to
>>>>> reproduce it...
>>>>   Two ways to reproduce the problem:
>>>>
>>>> I) reproduce it via oe-selftest
>>>> 1) . oe-init-build-env build-selftest
>>>> 2) SANITY_TESTED_DISTROS = ""
>>>> 3) oe-selftest -r package.PackageTests.test_gdb_hardlink_debug
>>>>
>>>> II) reproduce it manually
>>>> 1) add meta-selftest to bblayers.conf
>>>> 2) IMAGE_INSTALL_append = " selftest-hardlink selftest-hardlink-dbg
>>>> selftest-hardlink-gdb"
>>>> 3) bitbake core-image-minimal
>>>> 4) On target:
>>>>       gdb /usr/bin/hello1
>>>>       (gdb) b main
>>>
>>> I confirmed I could also reproduce it. We've just been lucky with the
>>> configuration the autobuilder tests.
>>>
>>> I think we need to improve the test case. Does installing the libc
>>> headers/dev package so that stdio2.h is there help?
>>
>> This is not exported API so libc headers may not work but installing 
>> libc dev package should help here.
>>
>
> Hi Richard and Khem,
>
> Unfortunately installing libc-dev package does not help.
>
> On qemux86:
> 1: Reading symbols from /usr/bin/hello1...Reading symbols from 
> /usr/bin/.debug/hello4...done.
> done.
> *(gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h, line 107.*
> (gdb) Starting program: /usr/bin/hello1
>
> *Breakpoint 1, main () at /usr/include/bits/stdio2.h:107**
> **107      return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, 
> __va_arg_pack ());*
> (gdb) Continuing.
> Hello World!
> [Inferior 1 (process 309) exited normally]
> (gdb)
> 2018-12-29 10:58:11,538 - oe-selftest - INFO -  ... FAIL
>
> For qemux86-64, things are the same.
>
> Best Regards,
> Chen Qi
>
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>
>
>
>


--------------1A4C8AAE691EC4A277DC8EA7
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi All,<br>
      <br>
      I've filed a bug for this issue.<br>
      <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=13123">https://bugzilla.yoctoproject.org/show_bug.cgi?id=13123</a><br>
      <br>
      I could spend time to work on it, but I really don't know how to
      start.<br>
      Hope some experts could help or give me some advice.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 12/29/2018 11:26 AM, ChenQi wrote:<br>
    </div>
    <blockquote
      cite="mid:90c78052-ac1a-cf6c-f252-28a074e029e3@windriver.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <div class="moz-cite-prefix">On 12/29/2018 01:09 AM, Khem Raj
        wrote:<br>
      </div>
      <blockquote
        cite="mid:ab613fa4-f4b8-9415-bedf-e2a2b6a52101@gmail.com"
        type="cite"> <br>
        <br>
        On 12/28/18 8:31 AM, <a moz-do-not-send="true"
          class="moz-txt-link-abbreviated"
          href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>
        wrote: <br>
        <blockquote type="cite">On Fri, 2018-12-28 at 17:49 +0800,
          ChenQi wrote: <br>
          <blockquote type="cite">On 12/26/2018 07:06 PM, <a
              moz-do-not-send="true" class="moz-txt-link-abbreviated"
              href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>
            wrote: <br>
            <blockquote type="cite">On Wed, 2018-12-26 at 10:09 +0800,
              ChenQi wrote: <br>
              <blockquote type="cite">Hi All, <br>
                <br>
                'oe-selftest -r
                package.PackageTests.test_gdb_hardlink_debug' <br>
                fails. <br>
                I did the tests on both my Fedora27 and ubuntu16.04
                servers. They <br>
                both <br>
                failed. <br>
                I can also reproduce this issue manually. <br>
                <br>
                I did some investigation. No clue how to fix this it. So
                I want <br>
                to seek <br>
                help from community. <br>
                <br>
                Below is some output from oe-selftest. <br>
                [snip] <br>
                2018-12-26 09:27:58,440 - oe-selftest - INFO - <br>
                test_gdb_hardlink_debug <br>
                (package.PackageTests) <br>
                2018-12-26 09:37:55,333 - oe-selftest - INFO - gdbtest <br>
                /usr/bin/hello1 <br>
                2018-12-26 09:37:59,904 - oe-selftest - ERROR - GDB
                result: <br>
                1: Reading symbols from /usr/bin/hello1...Reading
                symbols from <br>
                /usr/bin/.debug/hello4...done. <br>
                done. <br>
                (gdb) Breakpoint 1 at 0x1060: file
                /usr/include/bits/stdio2.h, <br>
                line 107. <br>
                (gdb) Starting program: /usr/bin/hello1 <br>
                <br>
                Breakpoint 1, main () at /usr/include/bits/stdio2.h:107
                <br>
                107    /usr/include/bits/stdio2.h: No such file or
                directory. <br>
                (gdb) Continuing. <br>
                Hello World! <br>
                [Inferior 1 (process 312) exited normally] <br>
                (gdb) <br>
                2018-12-26 09:38:00,907 - oe-selftest - INFO -  ... FAIL
                <br>
                [snip] <br>
                <br>
                The hello world problem is as follows. <br>
                $ cat <br>
                meta-selftest/recipes-test/selftest-hardlink/selftest- <br>
                hardlink/hello.c <br>
                #include &lt;stdio.h&gt; <br>
                <br>
                int main() { <br>
                      printf("Hello World!\n"); <br>
                } <br>
                <br>
                Some extra information: <br>
                1. Remove '-O2' or '-D_FORTIFY_SOURCE=2', and it works
                correctly. <br>
                2. Adding some system call like daemon(0,0) before
                printf also <br>
                works. <br>
                3. Reverting poky repo to <br>
                1c048479af7cc98e30f9a33d1f3bef03711544aa, <br>
                which adds this selftest case, does not work. It still
                fails. <br>
                4. Hongxu confirms that things work on his host. <br>
                5. I also don't see failure about this test case on
                yocto's <br>
                autobuilder. <br>
                <br>
                Could somebody help to provide some suggestions? <br>
              </blockquote>
              <br>
              This is strange and there must be some difference between
              your <br>
              configuration and what what we test on the autobuilder or
              on <br>
              Hongxu's <br>
              setup. <br>
            </blockquote>
              Hi Richard, <br>
            <br>
            I have talked with Hongxu and we can now both confirm that
            there does <br>
            exist some problem. <br>
            <br>
            <blockquote type="cite">Which DISTRO and MACHINE are you
              using? <br>
            </blockquote>
              DISTRO is poky <br>
            MACHINE is qemux86. <br>
            <br>
            It seems that if MACHINE is qemux86-64, the test case could
            pass. But <br>
            that's just because the test case only checks 'Breakpoint 1,
            main () <br>
            at hello.c:4'. See the console output below. <br>
            (gdb) b main <br>
            Breakpoint 1 at 0x1050: file /usr/include/bits/stdio2.h,
            line 107. <br>
            (gdb) r <br>
            Starting program: /usr/bin/hello1 <br>
            <br>
            Breakpoint 1, main () at hello.c:4 <br>
            4        printf("Hello World!\n"); <br>
            (gdb) c <br>
            Continuing. <br>
            Hello World! <br>
            [Inferior 1 (process 156) exited normally] <br>
            (gdb) q <br>
            <br>
            Even in this case, the 'b main' does not give correct
            result. The <br>
            test case passes because 'Breakpoint 1, main () at
            hello.c:4' is <br>
            there. <br>
            <br>
            On qemux86, we have: <br>
            (gdb) Breakpoint 1 at 0x1060: file
            /usr/include/bits/stdio2.h, line <br>
            107. <br>
            (gdb) Starting program: /usr/bin/hello1 <br>
            <br>
            Breakpoint 1, main () at /usr/include/bits/stdio2.h:107 <br>
            107    /usr/include/bits/stdio2.h: No such file or
            directory. <br>
            (gdb) Continuing. <br>
            Hello World! <br>
            [Inferior 1 (process 156) exited normally] <br>
            (gdb) <br>
            <br>
            <blockquote type="cite">I think the key to resolving this is
              will be to understanding how <br>
              to <br>
              reproduce it... <br>
            </blockquote>
              Two ways to reproduce the problem: <br>
            <br>
            I) reproduce it via oe-selftest <br>
            1) . oe-init-build-env build-selftest <br>
            2) SANITY_TESTED_DISTROS = "" <br>
            3) oe-selftest -r
            package.PackageTests.test_gdb_hardlink_debug <br>
            <br>
            II) reproduce it manually <br>
            1) add meta-selftest to bblayers.conf <br>
            2) IMAGE_INSTALL_append = " selftest-hardlink
            selftest-hardlink-dbg <br>
            selftest-hardlink-gdb" <br>
            3) bitbake core-image-minimal <br>
            4) On target: <br>
                  gdb /usr/bin/hello1 <br>
                  (gdb) b main <br>
          </blockquote>
          <br>
          I confirmed I could also reproduce it. We've just been lucky
          with the <br>
          configuration the autobuilder tests. <br>
          <br>
          I think we need to improve the test case. Does installing the
          libc <br>
          headers/dev package so that stdio2.h is there help? <br>
        </blockquote>
        <br>
        This is not exported API so libc headers may not work but
        installing libc dev package should help here. <br>
        <br>
      </blockquote>
      <br>
      Hi Richard and Khem,<br>
      <br>
      Unfortunately installing libc-dev package does not help.<br>
      <br>
      On qemux86:<br>
      1: Reading symbols from /usr/bin/hello1...Reading symbols from
      /usr/bin/.debug/hello4...done.<br>
      done.<br>
      <b>(gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h,
        line 107.</b><br>
      (gdb) Starting program: /usr/bin/hello1 <br>
      <br>
      <b>Breakpoint 1, main () at /usr/include/bits/stdio2.h:107</b><b><br>
      </b><b>107      return __printf_chk (__USE_FORTIFY_LEVEL - 1,
        __fmt, __va_arg_pack ());</b><br>
      (gdb) Continuing.<br>
      Hello World!<br>
      [Inferior 1 (process 309) exited normally]<br>
      (gdb) <br>
      2018-12-29 10:58:11,538 - oe-selftest - INFO -  ... FAIL<br>
      <br>
      For qemux86-64, things are the same.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      <blockquote
        cite="mid:ab613fa4-f4b8-9415-bedf-e2a2b6a52101@gmail.com"
        type="cite">
        <blockquote type="cite"> <br>
          Cheers, <br>
          <br>
          Richard <br>
          <br>
        </blockquote>
        <br>
      </blockquote>
      <p><br>
      </p>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------1A4C8AAE691EC4A277DC8EA7--
