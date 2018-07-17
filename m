Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6448078A0A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 18:34:47 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id g18-v6so1308655uam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7pyNXUeR0vyICUhUm4UIz2nhCB/lmLnf3ju/68ho23U=;
	b=RNcxPJbJ70OeJZJt5IDyPs08SKbNptQDCGqi5XcnJnAYiQ/B3/vpUYwbDnYi6Z6z5O
	W6LHvuHoeXhQPQoXsW5A3b7MwSfnpH80yYXrPp4LmH5JpHSHqsx+KT3nu+fU5BD++X3B
	9ehCbDxXJ6fSCpbjmLxcRasK8eTs09QiR8XUz9qYeU7lTGWNI37ubmWqdLdIUJ2Morgu
	vfDhvZUuFbXaESDV++ge3y/+ipo0tdaTo6Nh0JSIGx93PaJguJ6a1x3OY5Cnhfib1+nj
	JSEYvK+SSIy9IZXoAh6OLikQOiC+f0E9ot5ffts0bJ0Hl0RxOqBy2IgBIJ5Mrm9MXFbY
	Ad4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7pyNXUeR0vyICUhUm4UIz2nhCB/lmLnf3ju/68ho23U=;
	b=M5ZCfb3wqT9jPOq4JO0EpXoktJ6PRelLlRxZGeJIXX5I+ml8sZgPBHf91zRXKIMM8A
	g+UWIl80Xvf67mXtkfiTFpy+CYkFYdQZO68IiUL3q4yNg+WehrMyvh+9v7jT3CfhBSK7
	d8cvJ5QI/E17TMHsSU7GaVqIZfsTFg7O+3NGSlUutsqpBFI3fIdVYzcUS/TmCUtCX+e1
	abLVCfKNwGD3uGIX8C8QaDDvLBzEfX3rJR+ozOKoNGg5mO/BTK8DmrdasQELKRGsJQBo
	lVF1xzjJk+GeI1fnxb8kT8LFIS2zTIElpm8F1saouVFuqScRACB9mbUUH/j84Bhp/7R9
	9eyg==
X-Gm-Message-State: AOUpUlEFbGWfahEYKJV0kEakkg2AlAMmefzsU8+6vY9thkjpi67oQIkb
	GUXR/0DH0Wm+h16Xgeeq8HLCWh3WfJsQzBgmH7s=
X-Google-Smtp-Source: AAOMgpeapkE4Gii6wd7fRR3SDP93vnPxWN4aJ6zau0AazrjaYn40pq1LxcmjzNUJa59iRT7XrPICSSe/dYGUrfyF+SQ=
X-Received: by 2002:ab0:6654:: with SMTP id
	b20-v6mr1908211uaq.193.1531852488131; 
	Tue, 17 Jul 2018 11:34:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Tue, 17 Jul 2018 11:34:47 -0700 (PDT)
In-Reply-To: <CAMKF1sp3z1n+t5QKgbiWn6MkXEGOEFF_8G_X=1dYFTcx48U3RQ@mail.gmail.com>
References: <1531850817-26274-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sp3z1n+t5QKgbiWn6MkXEGOEFF_8G_X=1dYFTcx48U3RQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 17 Jul 2018 11:34:47 -0700
Message-ID: <CAJ86T=WYor_Gf2dpio37Yu86bmCfeDht9s6p02XFgH_2QDOv9w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: disable C source code generator
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
X-List-Received-Date: Tue, 17 Jul 2018 18:34:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 17, 2018 at 11:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jul 17, 2018 at 11:07 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> The --libcurl command line option causes curl to generate C source
>> code which, when compiled and linked with libcurl, creates a binary
>> which behaves in the same way as curl when run with the other options
>> passed on the curl command line.
>>
>>   https://curl.haxx.se/docs/manpage.html#--libcurl
>>
>> It's a development tool and not generally useful on the target,
>> especially if the target doesn't contain a toolchain etc.
>>
>
> probably better to have it controlled via packageconfig knob

Really? Why?

>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-support/curl/curl_7.61.0.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
>> index 03d627e..cc983fd 100644
>> --- a/meta/recipes-support/curl/curl_7.61.0.bb
>> +++ b/meta/recipes-support/curl/curl_7.61.0.bb
>> @@ -49,6 +49,7 @@ PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
>>  PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
>>
>>  EXTRA_OECONF = " \
>> +    --disable-libcurl-option \
>>      --disable-ntlm-wb \
>>      --enable-crypto-auth \
>>      --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

