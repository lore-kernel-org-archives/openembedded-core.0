Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id DA9FF747F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 04:05:32 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v24-v6so10056990plo.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 21:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ejihfcWeSH2DctEDPf/QnILwxFfyaxS+/mY1l+jD4GM=;
	b=KxoT8FdL0M1x0Cz0PeSKQVPYg9RSgl8FTFx6QCDwu2Dg9BDtfMNMSyzKxnhOcfeCVj
	mwkw4NyTNcgPTgQlZLGcg4a8nBe5IVeQS0GL3DL3n6DnzjfaK/9T1dnmQLoI/F/LaF7F
	gCwtr/dHMeeCvj1XlXC28wSTNeZqGwXxizL99vbVkQ5WiGcfjtRH0wHtMLiPLKd1LGEd
	1nRU41IQuyrFXrsCQ3MH8+4m8Ogc8F88YdUUHBNc2NErMECItaI/s4VsTmZYWM3Cfogr
	+nIup9qvsNtgqdGG2DmyHOWGg7pHHZd9QB0xI9ZcurXHzGUKEiRgrtLQxQGUOiEeSqGB
	F35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ejihfcWeSH2DctEDPf/QnILwxFfyaxS+/mY1l+jD4GM=;
	b=RzZx47esAL5XsI4q12/N3RpSrqs9EW19zf9eFtO38NYpsBMb44He6dRGiQM6ksaEmN
	F1aYQyk/eDE1BlWaYXOmIKeO7R60uTlUPmTRJetH6WEoQvgCRMXoCPAcqS9igXQp1W+S
	GoQ73z6NcCT1qPFsCY29PsKiRhUwQoAgIoRWJPLp3EAmbzM1qzVznTojkHY5SSbV4lUV
	vugPN//Mx3oBvHj1qKVyQ+C7c3yNUS1KuAmZWzGyLoR3s+/8wTKCiLC4HTaLQ5PjRHlD
	PWbBbxiSX+T6sKZSB8Jrs2WQ7sSI+eNJLYCgCi0v7IgNj2Ydqh2oUzZFj3/4vBwCjZ+U
	3qEA==
X-Gm-Message-State: ALKqPwdTw7GVm8Mxh08jEetZeusXy5TYYUbx6DdFviOCUdkzTNmWxemT
	FJ2na2JQr+GOIdJR/VawcpdK0Q==
X-Google-Smtp-Source: AB8JxZq9IpY8zUHlR7Pf0XSDEl8l72HxMHPm9hiNlJtDDEcNGN3ECBLUO1hkDCzDwioQX2tNd2juYQ==
X-Received: by 2002:a17:902:d681:: with SMTP id
	v1-v6mr22849174ply.16.1526961933504; 
	Mon, 21 May 2018 21:05:33 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:cda1:4d10:a5a1:339b?
	([2601:202:4000:1184:cda1:4d10:a5a1:339b])
	by smtp.gmail.com with ESMTPSA id
	h75-v6sm30080430pfh.148.2018.05.21.21.05.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 21:05:32 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spByqR0tuCeY_iW549mK6K6A9nFd1PcEzebFVCDvpVUOg@mail.gmail.com>
	<8523df99-ce1f-c99e-0379-4b72df9d58ad@gmail.com>
	<CAMKF1so+vefznkou750crbUntgOhzfJ_RXSn+E91bEb4HbjTUA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <04088507-78ee-10e5-da79-e11d90384c2b@gmail.com>
Date: Mon, 21 May 2018 21:05:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1so+vefznkou750crbUntgOhzfJ_RXSn+E91bEb4HbjTUA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] bind update req. new pkg in core
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
X-List-Received-Date: Tue, 22 May 2018 04:05:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 05/21/2018 07:25 PM, Khem Raj wrote:
> On Mon, May 21, 2018 at 9:30 PM, akuster808 <akuster808@gmail.com> wrot=
e:
>>
>> On 05/21/2018 06:06 PM, Khem Raj wrote:
>>
>>
>> On Mon, May 21, 2018 at 3:44 PM Armin Kuster <akuster808@gmail.com> wr=
ote:
>>> With this update, the python-ply package is required.
>>> I copied the one from meta-python to core. Once this hits master,
>>> I will send a patch to remove the same recipe from
>>> meta-python.
>>
>> Can this be turned on/off using packageconfig ?
>>
>> Yes we can and it is already in the PACKAGECONFIG options.
>>
>> If we do disable python, then the python binaries that are currently b=
eing
>> installed will not. Someone decided: dnssec-coverage dnssec-checkds  w=
here
>> important to install in the current Bind solution.   A new one is bein=
g
>> added; dnssec-keymgr. If we don't want dnssec support, thats easy to
>> exclude.
>>
> these all seem to be additional utilities so probably should be
> packaged into a separate package
> may be bind-utils
there is already a bind-utils.=C2=A0 bind-dnssec-utils may be more approp=
riate.
it is the if/conditional when python is enabled to do all the right
things that is going to get ugly.

>
>> BTW, pthon-ply  exists in 4 other layers besides meta-python and  at
>> different versions.
> thats less than ideal, and probably should be consolidated, moving to
> oe-core probably will not
> solve that problem
>
>> let me know which way you want to go.
> I dont have any strong opinion either way is fine.

I will wait to see who else may want to weight in.

thank for the input.

- armin
>
>> - armin
>>
>>
>>
>>
>>
>> If so then it would be ideal
>>
>> If not then please send the removal patches for meta-python regardless=
 so it
>> can be tested together
>>>
>>>
>>> Armin Kuster (2):
>>>   bind: update to 9.12.1
>>>   python3-ply: add package needed by bind 9.12 update
>>>
>>>  ...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++---
>>>  ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++---
>>>  .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 +++---
>>>  .../bind/bind/bind-confgen-build-unix.o-once.patch | 48
>>> ----------------------
>>>  ...-searching-for-json-headers-searches-sysr.patch | 13 +++---
>>>  .../bind/bind/dont-test-on-host.patch              | 17 --------
>>>  .../use-python3-and-fix-install-lib-path.patch     | 36 ------------=
----
>>>  .../bind/{bind_9.10.6.bb =3D> bind_9.12.1.bb}        | 21 ++++------=

>>>  meta/recipes-devtools/python/python-ply.inc        | 18 ++++++++
>>>  meta/recipes-devtools/python/python-ply_3.11.bb    |  2 +
>>>  10 files changed, 49 insertions(+), 145 deletions(-)
>>>  delete mode 100644
>>> meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.pa=
tch
>>>  delete mode 100644
>>> meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
>>>  delete mode 100644
>>> meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-p=
ath.patch
>>>  rename meta/recipes-connectivity/bind/{bind_9.10.6.bb =3D> bind_9.12=
=2E1.bb}
>>> (86%)
>>>  create mode 100644 meta/recipes-devtools/python/python-ply.inc
>>>  create mode 100644 meta/recipes-devtools/python/python-ply_3.11.bb
>>>
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>



