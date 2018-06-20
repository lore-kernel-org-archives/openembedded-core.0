Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADD8754D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 15:25:54 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id r21-v6so1643614pgv.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kLLbKyes30IwQiSunDgwXs6Kn7HFKAes0ra603ja8uQ=;
	b=UzlkNfnlG2uya4+nScvCDAh1/b2a0xgd405HsMXc4yDaD2XwOiPhRoJtv2kY/1o7yb
	hm3xmUvcyErtWKh3A2LgiXLEKjnYMX0WoKzNMojCXiWp8ztnhPYbdFI/DF3SCy504A66
	VIKWv2p5bRS9o86CogywRhY98Qzj1NiI97wN7953xPQx6ykdQ1f+GobRjGZFwYdjkQdd
	sDA8SgaYiREAZUjJdMyRg7it4qRaRjYcjW2XNCkF5/5i820cP+0+qrlo55neCAmk5wWw
	a0H3JAY5edZivl2DVftixLoASPamXofIsGA+2I4TXIO61/EVE9f2lfyGKG0wrUZjCpCm
	3OOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=kLLbKyes30IwQiSunDgwXs6Kn7HFKAes0ra603ja8uQ=;
	b=OQYXBsvwX6ZOR0AiV8TimxjqEiANBXsltK3RwHcbwImDZ9daBgeQnTzcLcwZqqwcCt
	iXp4fnn5QonhUtAtUb8Bc7R+/Ord52ojICPf5lm8o7EtAknB7Wzyrzi2oE3L9gjAGYvf
	AFFIlDPzy333QNyS4oxpjBNKNgnCZWOwJT+IaJcI5GA+YxMpPaNObAmn26OB0+wjKV74
	+DtcZug3Gu+BPBUDcdXP+9CFMa8rdsWve3z8rkHZ3vMjnfqqUte2LW3ZIB8nvr2uKf88
	P7ZQ+LIMhxGEaFDZgH4DNmgAgypYxeIHUzGkiv4tPv1/x+2HZFRtc11s2eCrwIZlCWS+
	wEpw==
X-Gm-Message-State: APt69E3cYOaaKVLZLR7WPfCbMTmwqK0VpcfpEkchYgXhxFN7qa9azS9a
	x3oZoU9k6VTcZHsUYTjjRU2f/g==
X-Google-Smtp-Source: ADUXVKKpEyYAXiHySVVWaNcDC5zk0KqTLWYXT2BFypJrtD3dh/gY0DkudeSTGHvNYVVyzN1loaiq8Q==
X-Received: by 2002:a62:d0c5:: with SMTP id
	p188-v6mr23611558pfg.101.1529508355429; 
	Wed, 20 Jun 2018 08:25:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:3431:f53:d718:7f78?
	([2601:202:4000:1184:3431:f53:d718:7f78])
	by smtp.gmail.com with ESMTPSA id
	m5-v6sm9471508pfa.93.2018.06.20.08.25.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jun 2018 08:25:54 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1529381411-5045-1-git-send-email-akuster808@gmail.com>
	<1529381411-5045-6-git-send-email-akuster808@gmail.com>
	<64f3d2c4cba24e1f16619e38ae7f0a6d279606be.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <04217776-ac6a-a695-5563-e1cc19a8c92a@gmail.com>
Date: Wed, 20 Jun 2018 08:25:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <64f3d2c4cba24e1f16619e38ae7f0a6d279606be.camel@linuxfoundation.org>
Subject: Re: [PATCH 6/6] nss: update to 3.37.1
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
X-List-Received-Date: Wed, 20 Jun 2018 15:25:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 06/19/2018 08:15 AM, Richard Purdie wrote:
> On Mon, 2018-06-18 at 21:10 -0700, Armin Kuster wrote:
>> remove Fix-compilation-for-X32.patch as a solution simular is
>> included in update.
>>
>> notable changes:
>> The TLS 1.3 implementation was updated to Draft 28.
>> The CA certificates list was updated to version 2.24.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> Failed in -next on qemuarm:
> http://errors.yoctoproject.org/Errors/Details/180618/
> http://errors.yoctoproject.org/Errors/Details/180669/
> http://errors.yoctoproject.org/Errors/Details/180677/
>
> qemuppc:
> http://errors.yoctoproject.org/Errors/Details/180623/
> http://errors.yoctoproject.org/Errors/Details/180639/
> http://errors.yoctoproject.org/Errors/Details/180645/
> http://errors.yoctoproject.org/Errors/Details/180644/
> http://errors.yoctoproject.org/Errors/Details/180643/
>
> qemumips:
> http://errors.yoctoproject.org/Errors/Details/180655/
> http://errors.yoctoproject.org/Errors/Details/180670/
> http://errors.yoctoproject.org/Errors/Details/180678/
>
> and more, you get the idea...
(covers ears) LaLalalalal

it appears to be the same as bug
https://bugzilla.mozilla.org/show_bug.cgi?format=3Ddefault&id=3D1459739

thanks,
Armin


>
> Cheers,
>
> Richard
>



