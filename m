Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.36565.1595795974406244330
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 13:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NtdwMJby;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id j20so7952466pfe.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=DVgQjZ1uiu2vT1FUd9e//p/I25hGwUdLEvWG1bTBQCc=;
        b=NtdwMJby9IJNBRd+VH3djprp21+ST66QFalIB7fMcjFadr8ygCdkptWAifgOLlI+sK
         hgsGSM+W6ARcPAZjM7I+RwQGnIfsh/hs4qJp8KBFzLo7WMI3a4J7v5Hb1B5i7dHW5hfh
         2wJDmlQt0DZ68y9MQS01yf2RYAPGd59BaBQF/WxXCk/lZbypZGRpYf2im0RrH6Ht/2im
         iWHQHpJXlk7XRyYMH9xZV5hewYuYUrRUDRo61KL4VFDLHmUYHAxAKs+Uv93dG5JQ9EGu
         iyRWXGHl99rhAGw2paDlkZy2WR8ztJ1Jj8tmEqA8Wd2QfShOIome4upWzJLtzAO38hsN
         lsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=DVgQjZ1uiu2vT1FUd9e//p/I25hGwUdLEvWG1bTBQCc=;
        b=c10vLumSEJV4QA7sd8DCx/Xboueff/ZMNZYWRs8dkifmb2MslWR4M+bNVw5+3Hj/ch
         fGfSfNjQc/a2IO42ehnp/4BXrEll5DUmru/imOt09lbKscc7EEBCNUlNP7TU+qju0X2D
         oBlq3Vq2nNKZJe4xVf5iQU2BKJVplvz/O33Hhv3sHXBMR5RhczC/oT9McX0uJjeQotf6
         vllTie/ZaTzfnwMpbSzqDbtTjGuFYs0vopC1j3sp2/UP5UmM2k5BvMMGSHqTaS0nPZK7
         YFIt67sEvvM+qL112WUtSgysHOvq1XMGrCnhkZbufP34L3mRLK3MBJL63Tkd6CsVj129
         UXXQ==
X-Gm-Message-State: AOAM532bvOkmvXvsO7ikFgXJBn/CxA5VtHSqVqu0P7GANPGmGBJBfmzL
	b2GxxKWuUKYv/+WEdwV+QEkR6xKWnCQ=
X-Google-Smtp-Source: ABdhPJzO4XFKjvq2zeTIoq8k2R0tIYaFWJBNrhjUrStjEv88JC8B5VYYymTqnS2Y4ppb1VXpFJkACw==
X-Received: by 2002:a63:f814:: with SMTP id n20mr16406946pgh.92.1595795973341;
        Sun, 26 Jul 2020 13:39:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:957c:826:e40f:5fde? ([2601:202:4180:a5c0:957c:826:e40f:5fde])
        by smtp.gmail.com with ESMTPSA id z11sm12835887pfj.104.2020.07.26.13.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 13:39:32 -0700 (PDT)
Subject: Re: [OE-core][PATCH] llvm: upgrade 9.0.1 -> 10.0.0
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200527134844.105405-1-trevor.gamblin@windriver.com>
 <CAMKF1soY7W40VRw-puspRKkmQ0FEiFk35=W_z=uz93Hj2mWVxA@mail.gmail.com>
 <f6d9c9c0-71e1-439e-f20e-00f7cc721c0e@windriver.com>
 <CANNYZj8J_ZrcQNLqPg0NRUfu042kCBJWmiDaxejTyuWnv9MMmw@mail.gmail.com>
 <5226bca8-5917-7783-c832-899256caea4d@gmail.com>
 <e2dcf5dc-9bec-9f14-2bb2-b24978b28478@windriver.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <29d5cef4-ed7b-6d7a-a098-628e27d52c44@gmail.com>
Date: Sun, 26 Jul 2020 13:39:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e2dcf5dc-9bec-9f14-2bb2-b24978b28478@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------1D6FFAEB5C08392003600E4F"
Content-Language: en-US

--------------1D6FFAEB5C08392003600E4F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 7/26/20 10:11 AM, Trevor Gamblin wrote:
>
>
> On 7/25/20 10:58 AM, akuster808 wrote:
>> Per release notes, riscv is now supported.
>> https://releases.llvm.org/10.0.0/docs/ReleaseNotes.html#changes-to-the-risc-v-target
>>
>> If you have time, can you also double check Riscv so these two can be
>> removed, if not maybe we can wait until this is in core.
>>
>> |
>> COMPATIBLE_HOST_riscv64 = "null"
>> COMPATIBLE_HOST_riscv32 = "null"|
>>
>> There is a qemuriscv64 machine in core.
>
> llvm broke during do_compile when I tested it against qemuriscv64.
> I'll submit the upgrade patch and look into the riscv targets issue as
> a separate patch.
>
Ah, ok. Thanks for checking.  sounds reasonable.

thanks,
Armin
>
> Trevor
>
>>
>> -armin
>>
>> On 7/25/20 4:07 AM, Alexander Kanavin wrote:
>>> Llvm 10.0.1 is now out, please rebase and resend the patches :)
>>>
>>> Alex
>>>
>>> On Fri, 29 May 2020 at 15:30, Trevor Gamblin
>>> <trevor.gamblin@windriver.com <mailto:trevor.gamblin@windriver.com>>
>>> wrote:
>>>
>>>
>>>     On 5/28/20 9:57 PM, Khem Raj wrote:
>>>     > On Wed, May 27, 2020 at 6:48 AM Trevor Gamblin
>>>     > <trevor.gamblin@windriver.com
>>>     <mailto:trevor.gamblin@windriver.com>> wrote:
>>>     >> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com
>>>     <mailto:trevor.gamblin@windriver.com>>
>>>     >> ---
>>>     >>   meta/recipes-devtools/llvm/llvm_git.bb <http://llvm_git.bb>
>>>     | 6 +++---
>>>     >>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>     >>
>>>     >> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
>>>     <http://llvm_git.bb> b/meta/recipes-devtools/llvm/llvm_git.bb
>>>     <http://llvm_git.bb>
>>>     >> index d24ed761bf..787cc3adcf 100644
>>>     >> --- a/meta/recipes-devtools/llvm/llvm_git.bb <http://llvm_git.bb>
>>>     >> +++ b/meta/recipes-devtools/llvm/llvm_git.bb <http://llvm_git.bb>
>>>     >> @@ -19,9 +19,9 @@ inherit cmake pkgconfig
>>>     >>
>>>     >>   PROVIDES += "llvm${PV}"
>>>     >>
>>>     >> -MAJOR_VERSION = "9"
>>>     >> +MAJOR_VERSION = "10"
>>>     >>   MINOR_VERSION = "0"
>>>     >> -PATCH_VERSION = "1"
>>>     >> +PATCH_VERSION = "0"
>>>     >>
>>>     > It also needs updating LLVMVERSION in
>>>     > meta/conf/distro/include/tcmode-default.inc
>>>     > secondly, I would suggest to wait for 10.0.1 which is
>>>     releasing in a weeks time.
>>>
>>>     Alright, I'll watch for that release.
>>>
>>>     Thanks!
>>>
>>>     >
>>>     >>   PV = "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"
>>>     >>
>>>     >> @@ -29,7 +29,7 @@ LLVM_RELEASE = "${PV}"
>>>     >>   LLVM_DIR = "llvm${LLVM_RELEASE}"
>>>     >>
>>>     >>   BRANCH = "release/${MAJOR_VERSION}.x"
>>>     >> -SRCREV = "c1a0a213378a458fbea1a5c77b315c7dce08fd05"
>>>     >> +SRCREV = "d32170dbd5b0d54436537b6b75beaf44324e0c28"
>>>     >>   SRC_URI =
>>>     "git://github.com/llvm/llvm-project.git;branch=${BRANCH}
>>>     <http://github.com/llvm/llvm-project.git;branch=$%7BBRANCH%7D> \
>>>     >>             
>>>     file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2
>>>     \
>>>     >>             
>>>     file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
>>>     >> --
>>>     >> 2.24.1
>>>     >>
>>>     >>
>>>
>>>
>>> 
>>


--------------1D6FFAEB5C08392003600E4F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/26/20 10:11 AM, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e2dcf5dc-9bec-9f14-2bb2-b24978b28478@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 7/25/20 10:58 AM, akuster808
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:5226bca8-5917-7783-c832-899256caea4d@gmail.com"> Per
        release notes, riscv is now supported. <br>
        <a class="moz-txt-link-freetext"
href="https://releases.llvm.org/10.0.0/docs/ReleaseNotes.html#changes-to-the-risc-v-target"
          moz-do-not-send="true">https://releases.llvm.org/10.0.0/docs/ReleaseNotes.html#changes-to-the-risc-v-target</a><br>
        <br>
        If you have time, can you also double check Riscv so these two
        can be removed, if not maybe we can wait until this is in core.<br>
        <br>
        <pre><code><pre><span class="nv">COMPATIBLE_HOST_riscv64</span> <span class="o">=</span> <span class="s2">"null"</span>
<span class="nv">COMPATIBLE_HOST_riscv32</span> <span class="o">=</span> <span class="s2">"null"</span></pre></code></pre>
        <br>
        There is a qemuriscv64 machine in core.<br>
      </blockquote>
      <p>llvm broke during do_compile when I tested it against
        qemuriscv64. I'll submit the upgrade patch and look into the
        riscv targets issue as a separate patch.</p>
    </blockquote>
    Ah, ok. Thanks for checking.  sounds reasonable.<br>
    <br>
    thanks,<br>
    Armin<br>
    <blockquote type="cite"
      cite="mid:e2dcf5dc-9bec-9f14-2bb2-b24978b28478@windriver.com">
      <p>Trevor<br>
      </p>
      <blockquote type="cite"
        cite="mid:5226bca8-5917-7783-c832-899256caea4d@gmail.com"> <br>
        -armin<br>
        <br>
        <div class="moz-cite-prefix">On 7/25/20 4:07 AM, Alexander
          Kanavin wrote:<br>
        </div>
        <blockquote type="cite"
cite="mid:CANNYZj8J_ZrcQNLqPg0NRUfu042kCBJWmiDaxejTyuWnv9MMmw@mail.gmail.com">
          <div dir="ltr">
            <div>Llvm 10.0.1 is now out, please rebase and resend the
              patches :)</div>
            <div><br>
            </div>
            <div>Alex<br>
            </div>
          </div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Fri, 29 May 2020 at
              15:30, Trevor Gamblin &lt;<a
                href="mailto:trevor.gamblin@windriver.com"
                moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex"><br>
              On 5/28/20 9:57 PM, Khem Raj wrote:<br>
              &gt; On Wed, May 27, 2020 at 6:48 AM Trevor Gamblin<br>
              &gt; &lt;<a href="mailto:trevor.gamblin@windriver.com"
                target="_blank" moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;
              wrote:<br>
              &gt;&gt; Signed-off-by: Trevor Gamblin &lt;<a
                href="mailto:trevor.gamblin@windriver.com"
                target="_blank" moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;<br>
              &gt;&gt; ---<br>
              &gt;&gt;   meta/recipes-devtools/llvm/<a
                href="http://llvm_git.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">llvm_git.bb</a> |
              6 +++---<br>
              &gt;&gt;   1 file changed, 3 insertions(+), 3 deletions(-)<br>
              &gt;&gt;<br>
              &gt;&gt; diff --git a/meta/recipes-devtools/llvm/<a
                href="http://llvm_git.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">llvm_git.bb</a>
              b/meta/recipes-devtools/llvm/<a href="http://llvm_git.bb"
                rel="noreferrer" target="_blank" moz-do-not-send="true">llvm_git.bb</a><br>
              &gt;&gt; index d24ed761bf..787cc3adcf 100644<br>
              &gt;&gt; --- a/meta/recipes-devtools/llvm/<a
                href="http://llvm_git.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">llvm_git.bb</a><br>
              &gt;&gt; +++ b/meta/recipes-devtools/llvm/<a
                href="http://llvm_git.bb" rel="noreferrer"
                target="_blank" moz-do-not-send="true">llvm_git.bb</a><br>
              &gt;&gt; @@ -19,9 +19,9 @@ inherit cmake pkgconfig<br>
              &gt;&gt;<br>
              &gt;&gt;   PROVIDES += "llvm${PV}"<br>
              &gt;&gt;<br>
              &gt;&gt; -MAJOR_VERSION = "9"<br>
              &gt;&gt; +MAJOR_VERSION = "10"<br>
              &gt;&gt;   MINOR_VERSION = "0"<br>
              &gt;&gt; -PATCH_VERSION = "1"<br>
              &gt;&gt; +PATCH_VERSION = "0"<br>
              &gt;&gt;<br>
              &gt; It also needs updating LLVMVERSION in<br>
              &gt; meta/conf/distro/include/tcmode-default.inc<br>
              &gt; secondly, I would suggest to wait for 10.0.1 which is
              releasing in a weeks time.<br>
              <br>
              Alright, I'll watch for that release.<br>
              <br>
              Thanks!<br>
              <br>
              &gt;<br>
              &gt;&gt;   PV =
              "${MAJOR_VERSION}.${MINOR_VERSION}.${PATCH_VERSION}"<br>
              &gt;&gt;<br>
              &gt;&gt; @@ -29,7 +29,7 @@ LLVM_RELEASE = "${PV}"<br>
              &gt;&gt;   LLVM_DIR = "llvm${LLVM_RELEASE}"<br>
              &gt;&gt;<br>
              &gt;&gt;   BRANCH = "release/${MAJOR_VERSION}.x"<br>
              &gt;&gt; -SRCREV =
              "c1a0a213378a458fbea1a5c77b315c7dce08fd05"<br>
              &gt;&gt; +SRCREV =
              "d32170dbd5b0d54436537b6b75beaf44324e0c28"<br>
              &gt;&gt;   SRC_URI = "git://<a
                href="http://github.com/llvm/llvm-project.git;branch=$%7BBRANCH%7D"
                rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/llvm/llvm-project.git;branch=${BRANCH}</a>
              \<br>
              &gt;&gt;              <a class="moz-txt-link-freetext"
href="file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2"
                moz-do-not-send="true">file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2</a>
              \<br>
              &gt;&gt;              <a class="moz-txt-link-freetext"
href="file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2"
                moz-do-not-send="true">file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2</a>
              \<br>
              &gt;&gt; --<br>
              &gt;&gt; 2.24.1<br>
              &gt;&gt;<br>
              &gt;&gt; <br>
              <br>
            </blockquote>
          </div>
          <br>
          <fieldset class="mimeAttachmentHeader"></fieldset>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
        <br>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------1D6FFAEB5C08392003600E4F--
