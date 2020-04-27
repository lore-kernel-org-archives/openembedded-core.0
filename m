Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.1716.1588018823153205979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 13:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ms88ARF7;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id e26so28660200otr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 13:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=MVvmoJLsjM//H33PYVr7mrkyhl73ouQD12omMbhyqok=;
        b=ms88ARF7ebnoerXuFAvcbNoF3b3+p8FEFKFigCLz49+XkW4IZkoWkwnGBeyAWducxB
         BPNbXj8mWAl4/OBLOH/10dh23MiDsp1tiH2j2SeSEUm3l3xE0cZC/b+O+SxagWuojgS9
         0sKqRW/XLAtvSi+gWHEqNYPuIQ0VZzxmojVq1iB2OiUDVwU5JnMgUZv5aKIJd1ZqOPhK
         Bg24nyFhjI8pTcJaIZJ2SV1SzcrJw9PYdq9O9S7/fEalr1yiZEHGB3+jE+Ccie0Q8EhJ
         qnB5KuaFrAbSnb9odOWwyCsDZJSRmgYtnW6FvdN23azNgErdszt/1LJzyHuA5w+6OLMJ
         2Llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=MVvmoJLsjM//H33PYVr7mrkyhl73ouQD12omMbhyqok=;
        b=GS25+QiB+0C9mJaKBAwjRiqRCH3H/yKAbyJryo7RG54LPGtBp5LF/qOn1y24A4avgz
         5sqq8fXTJrSJQLVtMqGm4wmrJKsEWUm0owGYq2+hocmsx5m+j0KFj7w0e3p+05NjAJJU
         /mffSbd2OvTZPguUT9H8naFalVrMq5VnO/p8OC67M7aHLlyUk7xHTiWaoxdNfz4f9Rrr
         5wrJcVX1mpELfKKvVSVU+JyGF8oMZKshCg5oYiqlhvUXYGiLzYCAqTFvMJ3v2GW3cTPp
         8a2tCE6XxhVUN7L4wPZETVZ6/TLAxg8is6Hh/i4Oi4lBuIsgrV1a0ecOo9S86zS7Dfkw
         IWEA==
X-Gm-Message-State: AGi0PuZTyUWwYfIK+HwjTzwnRgRkPF9Jgfc1rTgjD26xJIVgV4YHhQcB
	mZo16VMvJeKhZiUukM2ncH0dXIzl
X-Google-Smtp-Source: APiQypImk6P0OmCrQDZzLT9rXfb/ctW2IeXCFOO4pzkWQ2btXnjaV9UU+kq0osRfjB4szihqd306+w==
X-Received: by 2002:aca:d410:: with SMTP id l16mr343186oig.50.1588018822139;
        Mon, 27 Apr 2020 13:20:22 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:5a:78db:f520:4bc? ([2605:a601:ac3d:c100:5a:78db:f520:4bc])
        by smtp.gmail.com with ESMTPSA id u197sm4266323oie.7.2020.04.27.13.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 13:20:21 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: make sure mingw builds use mingw32-w64 configs
To: Samuli Piippo <samuli.piippo@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Samuli Piippo <samuli.piippo@qt.io>,
 openembedded-core@lists.openembedded.org
References: <20200427131328.12044-1-samuli.piippo@qt.io>
 <ef0f940014c41b2cd66e4e74c85fea6389f66fe1.camel@linuxfoundation.org>
 <CABXoSoX--qaiLGJM0MJ2Uo=jZDd+Srav+-xaXb60PqtyVOm=Uw@mail.gmail.com>
Message-ID: <a7b33d1d-49ef-c20d-c8e8-32e9d155ec1b@gmail.com>
Date: Mon, 27 Apr 2020 15:20:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABXoSoX--qaiLGJM0MJ2Uo=jZDd+Srav+-xaXb60PqtyVOm=Uw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------4B4A0B0755966B149B5E86E3"
Content-Language: en-US

--------------4B4A0B0755966B149B5E86E3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/27/20 12:35 PM, Samuli Piippo wrote:
> On Mon, 27 Apr 2020 at 17:51, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2020-04-27 at 16:13 +0300, Samuli Piippo wrote:
>>> meta-mingw is using Mingw-w64 but the host triplet does not match
>>> the expected pattern. config/os/mingw32-w64 enables more features
>>> that were not working with mingw32.
>>>
>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>>> ---
>>>   meta/recipes-devtools/gcc/gcc-9.3.inc         |  1 +
>>>   ...nfig-os-mingw32-w64-for-mingw-builds.patch | 36 +++++++++++++++++++
>>>   2 files changed, 37 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
>>> index b0411078d3..4c8275bf2a 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-9.3.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
>>> @@ -67,6 +67,7 @@ SRC_URI = "\
>>>              file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
>>>              file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
>>>              file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
>>> +           file://0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch \
>>>   "
>>>   S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>>>   SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
>>> diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
>>> new file mode 100644
>>> index 0000000000..5a167f252c
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
>>> @@ -0,0 +1,36 @@
>>> +From 052f7e5db0d793155015530b639c4e42d37eb7eb Mon Sep 17 00:00:00 2001
>>> +From: Samuli Piippo <samuli.piippo@qt.io>
>>> +Date: Fri, 23 Aug 2019 10:10:43 +0300
>>> +Subject: [PATCH] Always use config/os/mingw32-w64 for mingw builds
>>> +
>>> +Make sure we use the w64 version of the configs, since that's what
>>> +meta-mingw is using.
>>> +
>>> +Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>>> +---
>>> + libstdc++-v3/configure.host | 12 ++----------
>>> + 1 file changed, 2 insertions(+), 10 deletions(-)
>>> +
>>> +diff --git a/libstdc++-v3/configure.host b/libstdc++-v3/configure.host
>>> +index 155a3cdea..adbda8784 100644
>>> +--- a/libstdc++-v3/configure.host
>>> ++++ b/libstdc++-v3/configure.host
>>> +@@ -277,16 +277,8 @@ case "${host_os}" in
>>> +     os_include_dir="os/hpux"
>>> +     ;;
>>> +   mingw32*)
>>> +-    case "$host" in
>>> +-      *-w64-*)
>>> +-        os_include_dir="os/mingw32-w64"
>>> +-        error_constants_dir="os/mingw32-w64"
>>> +-        ;;
>>> +-      *)
>>> +-        os_include_dir="os/mingw32"
>>> +-        error_constants_dir="os/mingw32"
>>> +-        ;;
>>> +-    esac
>>> ++    os_include_dir="os/mingw32-w64"
>>> ++    error_constants_dir="os/mingw32-w64"
>>> +     OPT_LDFLAGS="${OPT_LDFLAGS} \$(lt_host_flags)"
>> It might make things a bit more obvious and upstreamable to just change
>>        *-w64-*)
>> to
>>        *-w64*)
>> if I understand correct?
> With meta-mingw, the host triplet is actually either
> i686-pokysdk-mingw32 or x86_64-pokysdk-mingw32, depending on bitness
> in the SDKMACHINE value.

Hmm, it does indeed look like we are not correctly setting the host in a 
way it can be detected by GCC. It's a little surprising this hasn't 
caused any actual problems (at least up to this point)... is this 
something new to gcc 9.3, and do we have any idea why the AB MinGW tests 
aren't seeing any problems?

Either way, it would probably be better to figure out a way to make the 
host look correct in meta-mingw if at all possible.

Your commit message is also a little confusing because the first few 
times I read it, I thought we were configuring for 64-bit when 32-bit is 
desired, but based on the current GCC code being replaced and the value 
of the host-triplets, it would seem to be the opposite (we are getting 
32-bit when 64-bit is desired).


>
> 

--------------4B4A0B0755966B149B5E86E3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/27/20 12:35 PM, Samuli Piippo
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CABXoSoX--qaiLGJM0MJ2Uo=jZDd+Srav+-xaXb60PqtyVOm=Uw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 27 Apr 2020 at 17:51, Richard Purdie
<a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On Mon, 2020-04-27 at 16:13 +0300, Samuli Piippo wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">meta-mingw is using Mingw-w64 but the host triplet does not match
the expected pattern. config/os/mingw32-w64 enables more features
that were not working with mingw32.

Signed-off-by: Samuli Piippo <a class="moz-txt-link-rfc2396E" href="mailto:samuli.piippo@qt.io">&lt;samuli.piippo@qt.io&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc         |  1 +
 ...nfig-os-mingw32-w64-for-mingw-builds.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
index b0411078d3..4c8275bf2a 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
@@ -67,6 +67,7 @@ SRC_URI = "\
            <a class="moz-txt-link-freetext" href="file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch">file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch">file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch">file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch">file://0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch</a> \
 "
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 SRC_URI[sha256sum] = "71e197867611f6054aa1119b13a0c0abac12834765fe2d81f35ac57f84f742d1"
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
new file mode 100644
index 0000000000..5a167f252c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0040-Always-use-config-os-mingw32-w64-for-mingw-builds.patch
@@ -0,0 +1,36 @@
+From 052f7e5db0d793155015530b639c4e42d37eb7eb Mon Sep 17 00:00:00 2001
+From: Samuli Piippo <a class="moz-txt-link-rfc2396E" href="mailto:samuli.piippo@qt.io">&lt;samuli.piippo@qt.io&gt;</a>
+Date: Fri, 23 Aug 2019 10:10:43 +0300
+Subject: [PATCH] Always use config/os/mingw32-w64 for mingw builds
+
+Make sure we use the w64 version of the configs, since that's what
+meta-mingw is using.
+
+Signed-off-by: Samuli Piippo <a class="moz-txt-link-rfc2396E" href="mailto:samuli.piippo@qt.io">&lt;samuli.piippo@qt.io&gt;</a>
+---
+ libstdc++-v3/configure.host | 12 ++----------
+ 1 file changed, 2 insertions(+), 10 deletions(-)
+
+diff --git a/libstdc++-v3/configure.host b/libstdc++-v3/configure.host
+index 155a3cdea..adbda8784 100644
+--- a/libstdc++-v3/configure.host
++++ b/libstdc++-v3/configure.host
+@@ -277,16 +277,8 @@ case "${host_os}" in
+     os_include_dir="os/hpux"
+     ;;
+   mingw32*)
+-    case "$host" in
+-      *-w64-*)
+-        os_include_dir="os/mingw32-w64"
+-        error_constants_dir="os/mingw32-w64"
+-        ;;
+-      *)
+-        os_include_dir="os/mingw32"
+-        error_constants_dir="os/mingw32"
+-        ;;
+-    esac
++    os_include_dir="os/mingw32-w64"
++    error_constants_dir="os/mingw32-w64"
+     OPT_LDFLAGS="${OPT_LDFLAGS} \$(lt_host_flags)"
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
It might make things a bit more obvious and upstreamable to just change
      *-w64-*)
to
      *-w64*)
if I understand correct?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
With meta-mingw, the host triplet is actually either
i686-pokysdk-mingw32 or x86_64-pokysdk-mingw32, depending on bitness
in the SDKMACHINE value.</pre>
    </blockquote>
    <p>Hmm, it does indeed look like we are not correctly setting the
      host in a way it can be detected by GCC. It's a little surprising
      this hasn't caused any actual problems (at least up to this
      point)... is this something new to gcc 9.3, and do we have any
      idea why the AB MinGW tests aren't seeing any problems?<br>
    </p>
    <p>Either way, it would probably be better to figure out a way to
      make the host look correct in meta-mingw if at all possible.</p>
    <p>Your commit message is also a little confusing because the first
      few times I read it, I thought we were configuring for 64-bit when
      32-bit is desired, but based on the current GCC code being
      replaced and the value of the host-triplets, it would seem to be
      the opposite (we are getting 32-bit when 64-bit is desired).<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CABXoSoX--qaiLGJM0MJ2Uo=jZDd+Srav+-xaXb60PqtyVOm=Uw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------4B4A0B0755966B149B5E86E3--
