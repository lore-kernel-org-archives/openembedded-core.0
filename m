Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.4288.1610729018659870316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 08:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qYFe/0UC;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id d8so9106268otq.6
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 08:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=x5m/xz6SHfNdGgN1WeKULe1VONJV9lmxCQnUSsIH4Y8=;
        b=qYFe/0UCa4RmcxjtiAeSCRbSD1MfYluY5d18yABP23oJMYiEkq1SUuPagPuFC61U60
         t5ljYUnO7hI8BfzcZ2sHvr/6bQwckD/y2+nt/9gVQps1hbGwVC25WBR4rgbyGee7newS
         PTFk1A+xcnxgvPA4qLdUwmwp6lqhEbBKFiWRUrEd8lRHJfl4xzE+/kxpEIX8tdikwg1s
         qpGBk5Uu/PX1kbucZfUvJ/60fFkHtxsbHeCYA2H7okL2e3ooenODDPRu1htHgUgMljjK
         oiwvicrObmkmVI/sn6MZ5/ve6l163ExZlGQNKjboXXeUJ6yrsGuN4pD3fF/jJ2pCeFvM
         JRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=x5m/xz6SHfNdGgN1WeKULe1VONJV9lmxCQnUSsIH4Y8=;
        b=P0GsKnoF0t9ArCLD2KMbay8NJcEmolRia9J3/NlObrz9MfzToZIUVLev1qcJI/NL/O
         661tAETIjGyyPhsntdHbQfLcP++Dt51cRmqXXKK7NSvxGKoCLp3uLdhZimKQI2etdUuj
         ZFMSDQHPTfu+gvrrlQ/9vPrYYekvlX6/4RMNpyEuDUxGOwXRmXWKsTqOPTH7yp1szcJy
         Xo83GpY363hc60mZSlP6KVM07jgXD29c9I3hHEc12c8FlNK4w7yu/CT3mU3+O1Lv335K
         gctxQ5oaDnUuvqsbmkhyZdug6KoOjVyLoL1DNPgi2DzQsWTpJCZX4fff2FBFyAbdP2lt
         haTw==
X-Gm-Message-State: AOAM530G/DFzXQwLUEeq1Ik+OKcWXZ2FccL2Z5Skhik4YO6GA1it+R71
	G97Pe2D1lNIVVPSsLbwvtwI=
X-Google-Smtp-Source: ABdhPJxa9VzAfGRJr0uLv3nuo8LFT8i0IVwKl/T35iTYyJTt6LAvGCvewxyQ85w8IKvXFo7WmCiAiQ==
X-Received: by 2002:a9d:2065:: with SMTP id n92mr8766153ota.150.1610729018004;
        Fri, 15 Jan 2021 08:43:38 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id r10sm1903904oom.2.2021.01.15.08.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 08:43:37 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] Question about security_flags.inc and CC_ARCH
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Michael Ho <Michael.Ho@bmw.de>, openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <CBE0B95A-C2E7-4FAF-AD1D-E0EEBCB177C2@bmw.de>
 <ee564b97e176be05739442e9c271bbce565da4d5.camel@linuxfoundation.org>
Message-ID: <18270ad6-5a21-a9c7-cd13-2e7f3d0884e0@gmail.com>
Date: Fri, 15 Jan 2021 10:43:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ee564b97e176be05739442e9c271bbce565da4d5.camel@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------1CB935E2AE5E7B01428DEB9D"
Content-Language: en-US

--------------1CB935E2AE5E7B01428DEB9D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/15/21 10:05 AM, Richard Purdie wrote:
> On Fri, 2021-01-15 at 13:46 +0000, Michael Ho wrote:
>> I wanted to get a bit more understanding of why security_flags.inc
>> tweaks CC_ARCH instead of CFLAGS.
>>   
>> Some developers who consume an SDK we produce using Yocto noticed
>> that CC and
>> CXX has FORTIFY_SOURCE embedded in the variables. These developers
>> sometimes
>> want to compile software in the SDK with compiler optimisations
>> turned off in order
>> to run code coverage tools like gcov. Typically they drop
>> CFLAGS/CXXFLAGS in order
>> to do this but they noted that with the SDK they also have to
>> manually tweak CC/CXX
>> to remove the FORTIFY_SOURCE references (because compilation fails
>> without
>> optimisation flags when using FORTIFY_SOURCE).
>>   
>> This comes from:
>> https://patchwork.openembedded.org/patch/167198/ and
>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=6733a7873ca121295a2e309a6915b9816e1ae36b
>>   
>> I would’ve expected actually that FORTIFY_SOURCE bundles itself with
>> CFLAGS/CXXFLAGS as it is dependent on being with the compiler
>> optimisations. This is also how the Debian hardening wiki seems to
>> describe it used [1].
>>   
>> I am guessing that this is moved to CC_ARCH to ensure FORTIFY_SOURCE
>> is being enforced around the build system in case components are
>> skipping out on CFLAGS and CXXFLAGS. Is that right?
> In theory we should be giving an error if CFLAGS or LDFLAGS aren't
> being used to compile our output. You're right that we probably don't
> detect every case though and that was probably why we did that. I don't
> really remember though. Khem might remember more, I suspect he'd have
> done that for a reason.

FWIW, I've always veiwed it as things in CC_ARCH (which is rolled into 
$CC in the SDK) are flags you *must* have for the code to run on the 
platform (e.g. -march, API related things, etc.). Stuff in CFLAGS is 
stuff you probably want, but the program will still run if you don't use 
them. For the most part, this has been true, with SECURITY_FLAGS being 
the only recent notable exception.

We unfortunately do have cases were we disregard CFLAGS and use our own, 
but the compiled programs have still run on the platform.

>   
>> Would there be some objection to moving the security flags to
>> CFLAGS/CXXFLAGS for the cross-canadian target (sdk)?
> Yes, I'm fairly against people getting a different view of the flags in
> the SDK compared to the main build environment, that just creates a
> different set of problems unfortunately.
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

--------------1CB935E2AE5E7B01428DEB9D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/15/21 10:05 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:ee564b97e176be05739442e9c271bbce565da4d5.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Fri, 2021-01-15 at 13:46 +0000, Michael Ho wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I wanted to get a bit more understanding of why security_flags.inc
tweaks CC_ARCH instead of CFLAGS.
 
Some developers who consume an SDK we produce using Yocto noticed
that CC and
CXX has FORTIFY_SOURCE embedded in the variables. These developers
sometimes
want to compile software in the SDK with compiler optimisations
turned off in order
to run code coverage tools like gcov. Typically they drop
CFLAGS/CXXFLAGS in order
to do this but they noted that with the SDK they also have to
manually tweak CC/CXX
to remove the FORTIFY_SOURCE references (because compilation fails
without
optimisation flags when using FORTIFY_SOURCE).
 
This comes from:
<a class="moz-txt-link-freetext" href="https://patchwork.openembedded.org/patch/167198/">https://patchwork.openembedded.org/patch/167198/</a> and
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=6733a7873ca121295a2e309a6915b9816e1ae36b">http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=6733a7873ca121295a2e309a6915b9816e1ae36b</a>
 
I would’ve expected actually that FORTIFY_SOURCE bundles itself with
CFLAGS/CXXFLAGS as it is dependent on being with the compiler
optimisations. This is also how the Debian hardening wiki seems to
describe it used [1].
 
I am guessing that this is moved to CC_ARCH to ensure FORTIFY_SOURCE
is being enforced around the build system in case components are
skipping out on CFLAGS and CXXFLAGS. Is that right?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
In theory we should be giving an error if CFLAGS or LDFLAGS aren't
being used to compile our output. You're right that we probably don't
detect every case though and that was probably why we did that. I don't
really remember though. Khem might remember more, I suspect he'd have
done that for a reason.</pre>
    </blockquote>
    <p>FWIW, I've always veiwed it as things in CC_ARCH (which is rolled
      into $CC in the SDK) are flags you *must* have for the code to run
      on the platform (e.g. -march, API related things, etc.). Stuff in
      CFLAGS is stuff you probably want, but the program will still run
      if you don't use them. For the most part, this has been true, with
      SECURITY_FLAGS being the only recent notable exception.<br>
    </p>
    <p>We unfortunately do have cases were we disregard CFLAGS and use
      our own, but the compiled programs have still run on the platform.<br>
    </p>
    <blockquote type="cite"
cite="mid:ee564b97e176be05739442e9c271bbce565da4d5.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">
 
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Would there be some objection to moving the security flags to
CFLAGS/CXXFLAGS for the cross-canadian target (sdk)?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, I'm fairly against people getting a different view of the flags in
the SDK compared to the main build environment, that just creates a
different set of problems unfortunately.

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

--------------1CB935E2AE5E7B01428DEB9D--
