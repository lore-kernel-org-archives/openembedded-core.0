Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E90FE78327
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 18:56:18 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id s11so8092049pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 10:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=kgtwL/HZ7xOhmGYbp8Z0Y471n2wjEss4kp7/sBDylR4=;
	b=vBAJ0TR5duBeuIYGj+5LKVaxFkIXnkV+Ov7lioIA58QROqM/XQyO6s6eCGLrWe3Zxl
	fjSNBjbQ5/3e+8lC0lGp7sTz0yZxenhr5UGOk9m4GweebcH0HuBqDtStaJVjfx/lt7EN
	TRbLFhB0aX+8kUYcFkTVLaeGKssbOUH0fQdgW/Zay/QTxIz0w7csX9JYrzHOIWnjXfIr
	kBsaQL6umNdddOhvpuxyL9mThmCPGp7cSigWQ1kAY6lOfmWHX0GAQPd/01CT/xC20peP
	4Zjl/k6XYckhzlwWFDwqgXtQ5brVxEwV20tnJtlcf2xg6uFYM0NX++S7QXRsJ6Zs98HD
	d7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kgtwL/HZ7xOhmGYbp8Z0Y471n2wjEss4kp7/sBDylR4=;
	b=ikgabumt8nm2I7LrD9gkCqaZrn+lgofDP0J5THz+yQBP9/mCr6M+D/7YMh4j6Frthd
	O1yLFjVuaNfG4stM6hTtoBubyv4mVm5czsZ86vur6YnRLNX/IE8ErKPpES8BZVcjP9tQ
	44Cbn+vlUM+6Uw7PAC9ulIsbQYV+gqj+X3TvUZCS5xTV5FlSgbYTfQFkxa6vQvofJJOz
	iaM2LXJDEn2mCGR106YyC6t84q51U/vIIjmLvf5316KFujCnBMi2yCOo2SJIcI2OFHCQ
	KlUyGjsPjPIuqZ1S54gsgwkeVg73oPzAWwNUQ6kzK7lkaonwXaS7tXxyFgDqJBS6ih27
	Atbg==
X-Gm-Message-State: AJaThX5dsIH+oWccwdzlMSZh3PUQYpoaTMHHL8KvHYNhh+rtd8KVtma6
	0nq6aZdni9YOpUiqkEzqbNzxjw==
X-Google-Smtp-Source: AGs4zMbfhQ7LGcjqxt27jllGwfs3cnqZZq1i+8javTyyhB+EnEm9WAEOYVrt88Nls2at01tfUCThcg==
X-Received: by 10.99.152.68 with SMTP id l4mr14630828pgo.208.1511204179694;
	Mon, 20 Nov 2017 10:56:19 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:6887:1a1e:fe67:2f7c?
	([2601:202:4001:9ea0:6887:1a1e:fe67:2f7c])
	by smtp.gmail.com with ESMTPSA id
	n72sm22290424pfg.109.2017.11.20.10.56.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Nov 2017 10:56:19 -0800 (PST)
To: George McCollister <george.mccollister@gmail.com>
References: <20171115203605.19088-1-george.mccollister@gmail.com>
	<896364ab-7d3e-45a7-cbfd-621079b79724@gmail.com>
	<CAFSKS=MR0Kd_8J+BCf63fYe0-U9h7QtNzuamhXhksByHOTx5uA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <81b36768-1b1e-9f1a-881d-096ab6f00067@gmail.com>
Date: Mon, 20 Nov 2017 10:56:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFSKS=MR0Kd_8J+BCf63fYe0-U9h7QtNzuamhXhksByHOTx5uA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2 1/2] glibc: Fix CVE-2015-5180
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
X-List-Received-Date: Mon, 20 Nov 2017 18:56:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/16/2017 02:46 PM, George McCollister wrote:
> On Thu, Nov 16, 2017 at 12:45 PM, akuster808 <akuster808@gmail.com> wrote:
>>
>> On 11/15/2017 12:36 PM, George McCollister wrote:
>>> Add backported patch to fix CVE-2015-5180 from the upstream
>>> release/2.24/master branch.
>>>
>>> Signed-off-by: George McCollister <george.mccollister@gmail.com>
>> Thanks for this series. I will have to wait until I address this in Pyro.
> CVE-2015-5180 should not be an issue in glibc 2.25.
>
> The CVE-2017-1000366 commits backported to glibc 2.25 are here:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=3c7cd21290cabdadd72984fb69bc51e64ff1002d
> https://sourceware.org/git/?p=glibc.git;a=commit;h=46703a3995aa3ca2b816814aa4ad05ed524194dd
> https://sourceware.org/git/?p=glibc.git;a=commit;h=c69d4a0f680a24fdbe323764a50382ad324041e9
>
> Would it help if I sent Pyro patches for these?
yes it would help.

thanks,
Armin
>
>> - armin


