Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 47247745CD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 19:47:39 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id w8-v6so4364673pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 12:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=G15+rVgjdwMlWRBIci2tG3An9hRmYzxc6CmXfhV8twM=;
	b=BlpWEK8fEIw8fBsIAD5olMtSsezI7atIKOFL8Scx0wro3QxN6Jxw3oWiDOlD/62GFt
	XQh/MK5Pwj3F7+1HhmiefLyskdIh42EJL+VZTD7mdMvSCyiVq1oCpQtL0tIQdrZ2Gevv
	4fWH+odisgWWv4P50X0VlDzrSB0s8NgvMaNT9q8fbHsmOZ1GnGmLkFVACrIu2YuymxDY
	C/hZkNztf6iwtKV1CL3XgA7J5KsXOYa69gLZyYlVgjTNS2dCntvf1b+xcLxJkAopd9nH
	OABYd5eNTTPF6moD2dBhQM675yNFI29t29veHOMZPX5sGupJRk9MPyvgBB2xtkp5X36+
	GfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=G15+rVgjdwMlWRBIci2tG3An9hRmYzxc6CmXfhV8twM=;
	b=oWX5kX7U/NSpPCoSLeSGf1PhnHYArGmlzDCjiLxDiiJ9Oaw8BDW9vbdR+slW+aMO9+
	fn7i9GGvH2LBtABB8aVEVdEmCcSBcV0Zzl4o2KUXHCo6WAaxswkv2vMZwHrxwCx26dOF
	bLrUXMr00vYK2nD+3zPEIWPdr/hd++8ib06P9VWHSAyK19njGApQHmt2JmGJTYDmDXAo
	YOhmq+M/i2eSShl/tULTUIk4pOu9XI+LbEDgYFeLSS5uctoVy+bF2v+xdQhd92lGRgNI
	ln+B0ovhzCHeugokZsrauYBKeRFHogR8aS3eKc3pzqoLY3HjsqaaRVgeeCWIqSofeow/
	qGJQ==
X-Gm-Message-State: APt69E0ul0e6y5sYpSa3s38MyUY2c/GQPLKFWdWSYGZZA0XlTW8TfotP
	N2EZivo8oMeVBNWPW986AeZbAA==
X-Google-Smtp-Source: ADUXVKJ3r/WpJ1WpXtY+oZDppg5zowK43kxJSmCy0x/ZwXnAtAdWl1sl4OLWRgsDi+6x8CxmO5PHWQ==
X-Received: by 2002:a63:9a52:: with SMTP id
	e18-v6mr5612290pgo.188.1529783260228; 
	Sat, 23 Jun 2018 12:47:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:c85:69e7:cc7c:c735?
	([2601:202:4000:1184:c85:69e7:cc7c:c735])
	by smtp.gmail.com with ESMTPSA id
	l85-v6sm20467401pfk.79.2018.06.23.12.47.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 12:47:39 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1529328356-10653-1-git-send-email-akuster808@gmail.com>
	<7878cafe90bb5d01e33569bd05ed8c08719c2ad9.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3b620f0c-9cfd-95c5-8468-3d4221d011d8@gmail.com>
Date: Sat, 23 Jun 2018 12:47:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <7878cafe90bb5d01e33569bd05ed8c08719c2ad9.camel@linuxfoundation.org>
Subject: Re: [V5][PATCH] bind: update to 9.12.1
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
X-List-Received-Date: Sat, 23 Jun 2018 19:47:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 06/19/2018 08:13 AM, Richard Purdie wrote:
> On Mon, 2018-06-18 at 06:25 -0700, Armin Kuster wrote:
>> LIC_FILES_CHKSUM changed do to updated year
>>
>> removed:
>> dont-test-on-host.patch, no longer implemented
>> drop use-python3-and-fix-install-lib-path.patch, they added the
>> ability to pass in lib dir loctions
>> drop bind-confgen-build-unix.o-once.patch, fix included in update
>>
>> Refresh other patches:
>> add python3 flag for PACKAGECONFIG to pull in python
>> add new config option --with-eddsa=3D
>>
>> [v2]
>> Remove python3 in default PACKACKECONFIG
>> include https://patchwork.openembedded.org/patch/148257/
>> Because of the newly added dependency on meta-python, the python(3)
>> packageconfig is no longer "default-on".
>>
>> Signed-off-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>
>>
>> [v3]
>> Made formating and spelling changes per Martin
>>
>> [v4]
>> Minor typo fixes
>> cleanup python3 support

Will looking into the errors, I finally made the connection that dhcp
and bind should by linked by version.=C2=A0 I updated dhcp and is really
should be aligned with bind 9.11.x. This happens to be ISC ESV so I will
update bind to 9.11 instead.

- armin
> Something in -next is causing dhcp to fail to compile:
>
> http://errors.yoctoproject.org/Errors/Details/180628/
> http://errors.yoctoproject.org/Errors/Details/180624/
> http://errors.yoctoproject.org/Errors/Details/180635/
> http://errors.yoctoproject.org/Errors/Details/180619/
>
> probably the bind upgrade...
>
> Cheers,
>
> Richard



