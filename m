Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id DCB6C6C4E6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 16:33:19 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id j89so4476953ljb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 09:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=/de6ja4UXikF+okSfZbM1byRDJoum03iSx9PZDK6Wm4=;
	b=FrZAX0L07ZAtyuPveSlbpb9IfNIVOYy+7wnjP7C4pVDunUh0err+zXgu2tDAR+vZ3I
	DI3ikHa2lRrlpPVtcR9GQKb4JSiB27MHiZl8arTcQML1o2cw+sJct+ECwuJFQlsrl+0W
	S7h0LcXJDAYf9KACJyeie2TH6+AbWCc6RKEJD4Z8zPotsD9VEAOBBFL9IdY1F2UD6o8S
	cJKAe4nChfsJ+7JVzYYuDQBrKaZU8rKePr3T0hHwRjnW8DeD0Cr3RScPx4zKFyfkNFFO
	KaL3Jiqb4ve5qxdk6fpqzf4xhYtxsy85NIvmZpA+u9d6GYK2f3BVsHek4sATVNq9YEJI
	W8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/de6ja4UXikF+okSfZbM1byRDJoum03iSx9PZDK6Wm4=;
	b=PlBcbY3eoDeiu4ftOFLUz41Jenv36qrto/7YHWNF/yibCgrVF8in9q52x/OuBNF0ZJ
	T3dRbxkFPsVTORRMKTwOSHLRi9T0rKb2z63vAYfiMIE8IpvO8cJIrxHooZQJVn+bmfAm
	zjI/C5WN5OiHk0DsBxEoiRUvddCp7eZHQU0q0dMw0AYIu7AFbnsfzoNL1fJG0zIQAy/h
	xG6zkB/cv9ydwZx3wNX60wY7s0NO8Q+9AAeEmS5deUif+NRZxQhYj+zvoLRvF4DaJCFp
	wBC6F2XBxUhT1aTUZa7IBoJjh8Jj5aI9EfeaM86Ls9wrHGu07GZ8QMIJxe5Hffpbk1yR
	WBLA==
X-Gm-Message-State: APjAAAWSbjVCoQTGAkDGK0u9J6kDqFAcNOP7sIsu+c07GQ4QEAV2SazC
	8D9lML3vYI1uwbADAawnv4j9eHw+UIU=
X-Google-Smtp-Source: APXvYqya3RZB0Z2VP4x7Lm4E2RvBBTbJffo868VlRcZUvVgU+cXrqHw4vYSwbchy7PUBJfqxEFcYrQ==
X-Received: by 2002:a2e:219:: with SMTP id 25mr4790926ljc.34.1553358799601;
	Sat, 23 Mar 2019 09:33:19 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	f16sm2503295lfa.91.2019.03.23.09.33.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Mar 2019 09:33:18 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20190320230557.7094-1-open.source@oleksandr-kravchuk.com>
	<d42f9e5f5f57a33eb445c083017da4a9aabd1010.camel@linuxfoundation.org>
	<CAMKF1spV_jnyW354ic24sT5EJND1k-8b2W_GesDm70tW29fqVA@mail.gmail.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <dd6f86dc-af6b-aa50-bc7b-cc18029a52d2@oleksandr-kravchuk.com>
Date: Sat, 23 Mar 2019 17:33:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spV_jnyW354ic24sT5EJND1k-8b2W_GesDm70tW29fqVA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ninja: upate to 1.9.0
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
X-List-Received-Date: Sat, 23 Mar 2019 16:33:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Alright, I have fixed the musl build.

doxygen issue will require changes to doxygen itself:
https://github.com/doxygen/doxygen/pull/712

On 22/03/2019 22:51, Khem Raj wrote:
> On Fri, Mar 22, 2019 at 4:44 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2019-03-21 at 00:05 +0100, Oleksandr Kravchuk wrote:
>>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com
>>> ---
>>>  meta/recipes-devtools/ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb} | 2
>>> +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>  rename meta/recipes-devtools/ninja/{ninja_1.8.2.bb =>
>>> ninja_1.9.0.bb} (92%)
>> Fails to build on musl:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/423
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/424
>>
> doxygen fails too
>
> https://errors.yoctoproject.org/Errors/Details/234025/
>
>> Cheers,
>>
>> Richard
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

