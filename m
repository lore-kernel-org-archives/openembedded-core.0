Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 498C27F2AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 16:03:12 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d1so9011654pgp.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=JHbktv017xAJr4TphxWE+hxfmxIXsivj3kVfZiLlJEk=;
	b=u8uYvUy2fHE6yaAXIaYVlwJiQZtgZt3lwVcqiChxxif8vZpPyqohqJR49LZxBOSQZH
	wxevuBsLTIcp6AKH9CVj3IeViPHWybZEPbFAnkmv8FtfR3qekpYxGAVQLrQd8OVTzhu9
	XvyYIR+EhwT5N/O3ndtOOqfTr/d1PSopTCJM2dujK5zgmxkpECnuwHrPUnQ14btcpu0M
	2obIcwMp8q3+bYhWjlRveIxDzf3si+n4qE9P4auW2M59NL1uB+K5pKYYRdVazkc1mawR
	iPyyd7wXjlv5gFPE49Ys0mPZmnL94co8bAQj1mbIbAdYM0/BcsvDrbkabjf/prHJf1mz
	x8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=JHbktv017xAJr4TphxWE+hxfmxIXsivj3kVfZiLlJEk=;
	b=AHmxEiYKfn+qFit7rNQ3eBuIGakLQaRUnL8bkaLns2Ls/5GGH1aKqvj6mMIHHUlJzk
	ka2Kaq19VCqpPInP//rvXbBPDI7oEscqXb/tD1F+zBaoH5xPqGjVDx5tL/tcuop63BO9
	8INgsrZuZvETGX4kLNkNvFo/LJmp4ct8c03u8OH2Slo/75SIh4hgGcCaBTGp24DLxHzL
	a/3yrGR56s3piQcPM0K1bzDcCvPwIXbJRlIPltXelLEpI3hgUtorHhE5p1wlyif9TddL
	4HdkFL3oT739sm/qJEemHxZpLNZX/8Y6YOxhqH3SmfBcHejkKNpFqYtpcgn1T0xz8tR6
	8zjg==
X-Gm-Message-State: APjAAAVFZYmX3HFMZQCJLBBdOtYWCg5yWBMvh9YgCy//lixA4enqVz8D
	cgYkZFdrBj5lyEEzrCN+CsJGMgKMyGI=
X-Google-Smtp-Source: APXvYqz5RIyu2oubMNYZbQn1TJlheYssYVLI7H77J7YWfZDZOeRd/QaUsYwfIQxiku1TGzd4jfhORw==
X-Received: by 2002:a17:90a:25c8:: with SMTP id
	k66mr3954729pje.129.1565107392855; 
	Tue, 06 Aug 2019 09:03:12 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::baaf? ([2601:646:8500:6bc6::baaf])
	by smtp.gmail.com with ESMTPSA id
	q126sm47159846pfb.56.2019.08.06.09.03.12
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 09:03:12 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190804000313.34500-1-raj.khem@gmail.com>
	<542cb1bf478aac542ec319a84fb6c3b4a1be097a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <04bfdf5f-0026-a541-d842-d225313c37e9@gmail.com>
Date: Tue, 6 Aug 2019 09:03:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <542cb1bf478aac542ec319a84fb6c3b4a1be097a.camel@linuxfoundation.org>
Subject: Re: [PATCH] musl: Update to master tip
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
X-List-Received-Date: Tue, 06 Aug 2019 16:03:12 -0000
X-Groupsio-MsgNum: 127584
Content-Type: multipart/mixed; boundary="------------E2E220D3B206015E381E0B76"
Content-Language: en-US

--------------E2E220D3B206015E381E0B76
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 8/6/19 3:48 AM, Richard Purdie wrote:
> On Sat, 2019-08-03 at 17:03 -0700, Khem Raj wrote:
>> Fix for RISC-V build regression
>>
>> 64bit time syscall plumbing
>>
>> Changes are here [1]
>>
>> [1]=20
>> https://git.musl-libc.org/cgit/musl/log/?qt=3Drange&q=3D0ce49d0a301b41=
42741b32773492af90f66ed3ca..6fcb440d91ad972d970984ae3e781d30c0602c9f
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-core/musl/musl_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> This didn't pass automated testing for qemux86 or qemux86-64:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/899
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/900


seems ssh test failed. I will check

> Cheers,
>
> Richard
>

--------------E2E220D3B206015E381E0B76
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------E2E220D3B206015E381E0B76--
