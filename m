Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com [209.85.161.65])
 by mx.groups.io with SMTP id smtpd.web10.63.1589224920233553435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 12:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=G+Hh6Dst;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.161.65, mailfrom: jpuhlman@mvista.com)
Received: by mail-oo1-f65.google.com with SMTP id x16so2191341oop.13
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=cfcO08DNomTiG6WO/cy27miI3Je1egE388+pYVt206A=;
        b=G+Hh6Dst9/K4nDNW+amRcrEVYQAS/syJZQ2UMcpVFDYN9BOlXm5ie4ggDPzmeIDMjj
         FjdZjv7zgta5MM7j8HxDnvQopx/s2WOJa5NFkmCrikJPqRdT/b66WYg6plDs2o6WsUIp
         oxyGTt0UXIeIkLwcXE8Tr0IDOOsmG/R9ZDvVwAzqhxzCV5WRqia9jiv6W5IW9/FbfWaf
         uDx9C7Eu6DmxFCWRg7jEo0Qc4ZPEvyR17c/XYJzfYfImsshAA3Lq1QCZTbiwCa9liDNk
         ZBE5hy0i4qOr0BDzY6TAQVr5eVZ2Sa27h1tNJa31M3GgI5aUdJFoXKcwCgJh8zZ7Txnj
         4/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=cfcO08DNomTiG6WO/cy27miI3Je1egE388+pYVt206A=;
        b=WH8DBznz1/CEoA4ImWCpU8CO5q5cuAlvL73GZSIfpmjhmRxi6dH+g8soJDLjZw9x5X
         na3nYkgECE+d2IbWO/Z4DcXg+n/1Jz8ROQgXWhFIsDokXbSYr2Pvgpj7PZJJkjnQnIci
         dAf6z3H5ot8JzjJDXDp+DSkJr6Hlmr5uCkjbtjvCZLZfcG4AX1OFsF1lpovx/UDHrlTo
         16uUtgcG5nI6ZcnKGB4uwsutTO4ji2X5EHhz1gMGlY6emmN6BUiWFXAh6nGpCJtviOgR
         Nmso9tUGnvXRYzXsL3vGJhxnqSBXy2xnohhzfnw8jDITVFSoEtGVxJlMtpmMqDlLmEer
         ZFyw==
X-Gm-Message-State: AGi0Pub2dpCPQjNlUCsRiPPto/VW1LC5ahViJNsThKpB/j/lKoil5HNp
	qL61RE+HGU0EsFeZfCUifYpPZ6uA2iQ=
X-Google-Smtp-Source: APiQypIqmORWVLqm6tUC1n0sMt/r3CWhIqK7EzkeLnslQ9EBi0ogwa+aAP0FqEgrbS+Oa4nPGMV5bw==
X-Received: by 2002:a4a:e704:: with SMTP id y4mr13573820oou.64.1589224919189;
        Mon, 11 May 2020 12:21:59 -0700 (PDT)
Return-Path: <jpuhlman@mvista.com>
Received: from ?IPv6:2600:1700:4c90:60a0:60de:efe0:93f3:c162? ([2600:1700:4c90:60a0:60de:efe0:93f3:c162])
        by smtp.gmail.com with ESMTPSA id f9sm2882449ote.30.2020.05.11.12.21.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 12:21:58 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] buildtools-extended-tarball: add nativesdk-glibc
To: openembedded-core@lists.openembedded.org
References: <20200506015447.13003-1-kai.kang@windriver.com>
 <080c0849554edd5710f68f6283a020f578968de9.camel@linuxfoundation.org>
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
Message-ID: <05a97ff4-f8c8-369e-7623-d460017ccfdb@mvista.com>
Date: Mon, 11 May 2020 12:21:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <080c0849554edd5710f68f6283a020f578968de9.camel@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------A20283C259450084BF3C963F"
Content-Language: en-US

--------------A20283C259450084BF3C963F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/10/2020 6:40 AM, Richard Purdie wrote:
> On Wed, 2020-05-06 at 09:54 +0800, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It requires gcc 5.0 via OE-Core rev abc741a. On centos 7, the gcc
>> version is too low then it has to build with buildtools-extended-
>> tarball
>> which provides nativesdk-gcc.
>>
>> But it fails to build nspr-native:
>>
>>> gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib
>>> -lnspr4 -lpthread -o abstract
>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>> undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>> undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>> undefined reference to `__clock_settime@GLIBC_PRIVATE'
>>> /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
>>> undefined reference to `__clock_getres@GLIBC_PRIVATE'
>>> collect2: error: ld returned 1 exit status
>>> make: *** [Makefile:379: abstract] Error 1
>> Add nativesdk-glibc to buildtools-extended-tarball. And it increases
>> size of buildtools-extended-tarball about 3K from 48356989 to
>> 48360329.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
>>   1 file changed, 1 insertion(+)
> This doesn't make sense. Does it mean we need a new uninative version
> instead?

This works in dunfell, as of right now. This should have been fixed with:

https://patchwork.openembedded.org/patch/171584/



>
> Cheers,
>
> Richard
>
>
>
>
> 

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


--------------A20283C259450084BF3C963F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 5/10/2020 6:40 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:080c0849554edd5710f68f6283a020f578968de9.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Wed, 2020-05-06 at 09:54 +0800, kai wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

It requires gcc 5.0 via OE-Core rev abc741a. On centos 7, the gcc
version is too low then it has to build with buildtools-extended-
tarball
which provides nativesdk-gcc.

But it fails to build nspr-native:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib
-lnspr4 -lpthread -o abstract
/PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
/PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
/PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
undefined reference to `__clock_settime@GLIBC_PRIVATE'
/PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
undefined reference to `__clock_getres@GLIBC_PRIVATE'
collect2: error: ld returned 1 exit status
make: *** [Makefile:379: abstract] Error 1
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Add nativesdk-glibc to buildtools-extended-tarball. And it increases
size of buildtools-extended-tarball about 3K from 48356989 to
48360329.

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This doesn't make sense. Does it mean we need a new uninative version
instead?</pre>
    </blockquote>
    <br>
    This works in dunfell, as of right now. This should have been fixed
    with:<br>
    <br>
    <a href="https://patchwork.openembedded.org/patch/171584/">https://patchwork.openembedded.org/patch/171584/</a><br>
    <br>
    <br>
    <br>
    <blockquote type="cite"
cite="mid:080c0849554edd5710f68f6283a020f578968de9.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard



</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Jeremy A. Puhlman
<a class="moz-txt-link-abbreviated" href="mailto:jpuhlman@mvista.com">jpuhlman@mvista.com</a></pre>
  </body>
</html>

--------------A20283C259450084BF3C963F--
