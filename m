Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B91C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 12:30:48 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.5683.1654691443764273819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 05:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y6GUS6fm;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id t25so32966693lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 05:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to;
        bh=0VgoANaiIZnGVj1zsqZSDIEd97pkeaE/kyF7o4bktAw=;
        b=Y6GUS6fmrM9UbawR1mS7P3QBGOaC8VTq1sv0dnz0F8vaEjo+TgYQd4cmc5/PMBlQLK
         6WbegRUDDTrcuFNFbkbRbfolv1m2qvMW8i8kr8hkD+1uwRgDqz0G9y9aYbF8d50TtvbQ
         WvtgSX07ae+q+STGi315VqByIaxqqpeQ1vDGixzt8IpNaTEBJsPi4lH5inMzLVJFvk5J
         ej92j/7/XVkLV/7RRcXo+I058GUNylVWD9s+CgjsnelWNiB0l4s9zdb+SdL8dqZMhjsF
         awM8bdukBwJE1qZw2VatFpYCpuVYu0CSCN/b7RFSX5TJReaTUyUvVVg/+5uE8ENlQfVS
         tDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to;
        bh=0VgoANaiIZnGVj1zsqZSDIEd97pkeaE/kyF7o4bktAw=;
        b=RLrqm6bnEVcHuz593fUypolb7VnQpt0TbDcw5M+uswqfidH1abhW9a4snEmVj4jYwW
         7BQluZlmMADcQpNpQs45cnQ8qngzmDoZQzpYWMtePenm5xezriAyMXvWvNPTDgLVSgis
         WAqw3gN9FtnsxMgmiTZEKhQtsnLArhdHoiHqY9L3R8zHYY8XA1pNfNfAmEwn3b1nBC0x
         acVqYFaTSehrA7t0p/4PqavhuaFrdcCz1ituQMKK+ZVtcSBlplFBLcUxspsD4xdyWPpl
         h8XwiFXSdwF4TaPg3jL1RBfjE69OP4d8bCJaLa6hBkllvBDDNCp4ehZwwvCyunmb7lk2
         uHEQ==
X-Gm-Message-State: AOAM530zkLE2UFJBHrMncyXAIF1pJIGZbggv2eFGkeeP5d3ys9ayrvAE
	pSfsc3LKEUtq7GjcdQMiBQ==
X-Google-Smtp-Source: 
 ABdhPJwDAXGX5tTzSqeCCvdwfv2MI69MLv/0LVoBMFGuXDdrbgITWKaliOGw3jYaTKoPS365SCeRcQ==
X-Received: by 2002:a05:6512:1588:b0:477:a556:4ab2 with SMTP id
 bp8-20020a056512158800b00477a5564ab2mr21647290lfb.376.1654691441452;
        Wed, 08 Jun 2022 05:30:41 -0700 (PDT)
Received: from [10.67.202.36] (85-128-83-172.static.ip.netia.com.pl.
 [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a2ea90c000000b00255a658f9c8sm852065ljq.54.2022.06.08.05.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 05:30:41 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------8e7g1at66GkbFMqgXSFSmiI0"
Message-ID: <85ab03f4-72dc-6b9c-23fa-5319a6dbe6a8@gmail.com>
Date: Wed, 8 Jun 2022 14:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH] vim: put xxd in its own package
Content-Language: en-US
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 openembedded-core@lists.openembedded.org
References: <20220608074245.1962967-1-rasmus.villemoes@prevas.dk>
 <29553.1654689480120240103@lists.openembedded.org>
 <b3e2924f-9b00-f950-67a9-ff774d68d3c6@prevas.dk>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: <b3e2924f-9b00-f950-67a9-ff774d68d3c6@prevas.dk>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 12:30:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166704

This is a multi-part message in MIME format.
--------------8e7g1at66GkbFMqgXSFSmiI0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/22 14:13, Rasmus Villemoes wrote:

> On 08/06/2022 13.58, Paulo Neves via lists.openembedded.org wrote:
>> Forgive me if it is a stupid question, but does xxd not rdepend on
>> ncurses-terminfo-base as well?
> No, it does not, it's a trivial standalone utility whose only dynamic
> dependency is libc.

The original RDEPENDS on ncurses-terminfo-base is not about dynamic
libraries but about terminfo files that are used for describing capabilities
of terminals. They are usually in /etc/terminfo directory.
There are programs that load these files and without them will
display broken output our refuse to run. vim seemed to be one of those programs.
Have you tested that xxd works without these files?

>> I ask because before your patch it could
>> was implied it that it did, s part of PN.
> I don't understand what you're trying to say. I just put the extra
> RDEPENDS from vim to vim-xxd into the existing RDEPENDS:vim line. That
> doesn't imply any dependency either way between the two items listed on
> the RHS.

I mean that your patch allows for a new standalone package ${PN}-xxd.
Were somebody to use this package standalone, meaning without installing vim,
the ncurses-terminfo-base would not be installed, possibly breaking xxd.

Before your patch this risk did not occur due to xxd being include in the ${PN}
which had an RDEPENDS to ncurses-terminfo-base.

> Rasmus

Paulo Neves
--------------8e7g1at66GkbFMqgXSFSmiI0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>On 6/8/22 14:13, Rasmus Villemoes wrote:</pre>
    <blockquote type="cite"
      cite="mid:b3e2924f-9b00-f950-67a9-ff774d68d3c6@prevas.dk">
      <pre class="moz-quote-pre" wrap="">On 08/06/2022 13.58, Paulo Neves via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Forgive me if it is a stupid question, but does xxd not rdepend on
ncurses-terminfo-base as well?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No, it does not, it's a trivial standalone utility whose only dynamic
dependency is libc.
</pre>
    </blockquote>
    <pre>The original RDEPENDS on ncurses-terminfo-base is not about dynamic
libraries but about terminfo files that are used for describing capabilities
of terminals. They are usually in /etc/terminfo directory.
There are programs that load these files and without them will
display broken output our refuse to run. vim seemed to be one of those programs.
Have you tested that xxd works without these files?
</pre>
    <blockquote type="cite"
      cite="mid:b3e2924f-9b00-f950-67a9-ff774d68d3c6@prevas.dk">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I ask because before your patch it could
was implied it that it did, s part of PN.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't understand what you're trying to say. I just put the extra
RDEPENDS from vim to vim-xxd into the existing RDEPENDS:vim line. That
doesn't imply any dependency either way between the two items listed on
the RHS.
</pre>
    </blockquote>
    <pre>I mean that your patch allows for a new standalone package ${PN}-xxd.
Were somebody to use this package standalone, meaning without installing vim,
the ncurses-terminfo-base would not be installed, possibly breaking xxd.

Before your patch this risk did not occur due to xxd being include in the ${PN}
which had an RDEPENDS to ncurses-terminfo-base.
</pre>
    <blockquote type="cite"
      cite="mid:b3e2924f-9b00-f950-67a9-ff774d68d3c6@prevas.dk">
      <pre class="moz-quote-pre" wrap="">
Rasmus
</pre>
    </blockquote>
    <br>
    Paulo Neves<br>
  </body>
</html>

--------------8e7g1at66GkbFMqgXSFSmiI0--

