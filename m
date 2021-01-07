Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web12.984.1610044990026726566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 10:43:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aQWcUizM;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 15so8452307oix.8
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 10:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=lTnDuSa9yKFefetumkQ1hi0yS5NDIRqnW8TIDL8Le3I=;
        b=aQWcUizMHzodRljMs81ivhqg8AIQahiNGDHIx9BPPaQ6nqWHFiZ2EV4PRcNW6RSBKm
         x5qp8pKr+Iio4OsHW7Gm3wxa3XqbLTmy464S7E/rSqkdtIzMd1MGxLwEr1KCfYld9jCx
         lUXREWRbtS8vDHFb9ZL2zpUaorlplFATT9dRwihGCR6IcNGkdo8p+bWq5XOclq0+XdnL
         T3faaEDMEo5zaKXYxbL5tfWTD3ChYmxutouHpzsO+60AJovXBS4yc0Da0064ohBbc+Qy
         I8PP/ZvXkzFh2jv8iIh7txSFXzph1ZkrBi0HHOgvWsxrQc9M5z+s+gfncgvGICf/tSLw
         HPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=lTnDuSa9yKFefetumkQ1hi0yS5NDIRqnW8TIDL8Le3I=;
        b=rVSRrAF3MmZrLVl4tACXdUB8XYZT5YUkobxmEOlnKnpm4lqaQi+z+Af4V+V2jh+/In
         wnI8MSkAqcQ0jLtgJHJr9nWSIpruP8rBg/miodNJbSvzwK8rxevdDHo+14+yYaFjrZPd
         IDnBlpcuIizIV591ptaO+TIa+bOR3vJmIstctGkVJF00jrPSgRPeHz6h/ureFoHoUQCr
         yNdp8YpzzqNeHCZjsi+AvSbWTNke/n5ewJgV/daRYk2bflaOJT2xEnJP3cXjWsjfzDm3
         MW5lb9tlVTyUzCyEALWTY25WNFtiXpO75EYHnhS15j6J2+MZh4JihlgYmvKVzdgaO02R
         gnvQ==
X-Gm-Message-State: AOAM532uPr59a/yN75Odlg0cf5P/rHBG1DDr6HegK8DpjeV9Et6HvPZY
	69KMO2IRPDGwVPByxbVkLtbSY5otfpXgAA==
X-Google-Smtp-Source: ABdhPJwUctwkVm8qNl1FELY+iuzqi+up12rSU4VxM0rnlQyEf4QxCPy3zB240F0XqdEZJIyvQpNJlw==
X-Received: by 2002:aca:d54a:: with SMTP id m71mr29663oig.30.1610044989176;
        Thu, 07 Jan 2021 10:43:09 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y35sm1274245otb.5.2021.01.07.10.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 10:43:08 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH 13/22] bash: update 5.0 -> 5.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
 <20201228200436.78130-13-alex.kanavin@gmail.com>
 <1b8809a765eb36211ecc39a9e096ac207178884d.camel@linuxfoundation.org>
Message-ID: <a75c31fd-9617-1bc0-e895-ac40802245ce@gmail.com>
Date: Thu, 7 Jan 2021 12:43:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1b8809a765eb36211ecc39a9e096ac207178884d.camel@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------B4E94AF06FE01DF7CD8C552E"
Content-Language: en-US

--------------B4E94AF06FE01DF7CD8C552E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/7/21 11:57 AM, Richard Purdie wrote:
> On Mon, 2020-12-28 at 21:04 +0100, Alexander Kanavin wrote:
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>   meta/recipes-extended/bash/bash.inc           |   1 +
>>   .../bash/bash/CVE-2019-18276.patch            | 386 ------------------
>>   .../bash/bash/build-tests.patch               |  16 +-
>>   meta/recipes-extended/bash/bash_5.0.bb        |  80 ----
>>   meta/recipes-extended/bash/bash_5.1.bb        |  30 ++
>>   5 files changed, 40 insertions(+), 473 deletions(-)
>>   delete mode 100644 meta/recipes-extended/bash/bash/CVE-2019-18276.patch
>>   delete mode 100644 meta/recipes-extended/bash/bash_5.0.bb
>>   create mode 100644 meta/recipes-extended/bash/bash_5.1.bb
> There is a reproducibility issue in bash 5.1:
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210107-8jzr3hc5/packages/diff-html/
>
> looks like the issue in in redir.c and I think at a really quick
> glance, the computation of PIPESIZE. Seems to tbe 0x1000 on some
> systems and 0x10000 on others.
>
> bash 5.1 hasn't merged yet and is in master-next.
>
> If nobody else gets to it I will dig further when I have time but
> wanted to mention it.

I looked at this. It appears that bash runs a host program to determine 
the pipe size by writing to a pipe until it gets SIGPIPE 
(builtin/psize.c). I'm not sure why this would result in a different 
size on different hosts... perhaps the pipe size is configurable in the 
kernel? Anyway, I suspect that the fix is to add -DHEREDOC_PIPESIZE=4096 
to CFLAGS in the recipe.... it's not my favorite fix, but the bash 
configure script does the same thing to set the pipe size for FreeBSD.

>
> Cheers,
>
> Richard
>
>
>
>
> 
>

--------------B4E94AF06FE01DF7CD8C552E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/7/21 11:57 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:1b8809a765eb36211ecc39a9e096ac207178884d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Mon, 2020-12-28 at 21:04 +0100, Alexander Kanavin wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
---
 meta/recipes-extended/bash/bash.inc           |   1 +
 .../bash/bash/CVE-2019-18276.patch            | 386 ------------------
 .../bash/bash/build-tests.patch               |  16 +-
 meta/recipes-extended/bash/bash_5.0.bb        |  80 ----
 meta/recipes-extended/bash/bash_5.1.bb        |  30 ++
 5 files changed, 40 insertions(+), 473 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/CVE-2019-18276.patch
 delete mode 100644 meta/recipes-extended/bash/bash_5.0.bb
 create mode 100644 meta/recipes-extended/bash/bash_5.1.bb
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There is a reproducibility issue in bash 5.1:

<a class="moz-txt-link-freetext" href="https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210107-8jzr3hc5/packages/diff-html/">https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210107-8jzr3hc5/packages/diff-html/</a>

looks like the issue in in redir.c and I think at a really quick
glance, the computation of PIPESIZE. Seems to tbe 0x1000 on some
systems and 0x10000 on others.

bash 5.1 hasn't merged yet and is in master-next. 

If nobody else gets to it I will dig further when I have time but
wanted to mention it.</pre>
    </blockquote>
    <p>I looked at this. It appears that bash runs a host program to
      determine the pipe size by writing to a pipe until it gets SIGPIPE
      (builtin/psize.c). I'm not sure why this would result in a
      different size on different hosts... perhaps the pipe size is
      configurable in the kernel? Anyway, I suspect that the fix is to
      add -DHEREDOC_PIPESIZE=4096 to CFLAGS in the recipe.... it's not
      my favorite fix, but the bash configure script does the same thing
      to set the pipe size for FreeBSD.<br>
    </p>
    <blockquote type="cite"
cite="mid:1b8809a765eb36211ecc39a9e096ac207178884d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">

Cheers,

Richard



</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B4E94AF06FE01DF7CD8C552E--
