Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id C887779D6C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 15:32:32 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id c25-v6so9506490pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 08:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SnqfG8gf+g/OQh/GpnxAx6tZaWrG4sAs/sdFkXaJT7w=;
	b=rldXe3prKo1mZR53vhmxKhl92vlkDN3Ylts13wHQodgZlDmbgE1lBy+mOyWLE8I9Hd
	CzJrjTeaNhgTxsa0ux/2/efFmQLm2AbFoNb803vaflROEmmiFcfgbE9TNS2Im1+BYyDw
	blPgRoQv3WpuKvXnnH6huzt+LFu0KTgiF0L+0UfclL7TuBI53jAQZzyU684jrVpV7A3F
	M+9InTRH2qrSs0CX5mgJMRNfRpqsbvZczkugr57QqpWXjT4xIviKLbjIwm7QxU0r/YjW
	e1GoXlRXc/nAvQI/5BdIdYkYa8WOozypHupyB5BbtTxQob7TpA1qeYFpUatV5BqStA1X
	/5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=SnqfG8gf+g/OQh/GpnxAx6tZaWrG4sAs/sdFkXaJT7w=;
	b=G+lOnWpmevGbQwzHWRbTeo5FmTLhPY6V9RMLIFfQ2nQfdmUY8HqwwVLowXrinC0QfV
	BHxMV+5KqAm+boeszTxhgsp5Aw1ju+6Ehyp5XUWAk6JUK9oE54umuJC2hql1ZHfkileq
	NzAhdvZ28WMPZXF1ak1FuuDiJZtUxPNcATLwxCabYF1XMnAj1/C/EsNCLYZ6CgdaYFpB
	iuO0UuVSMqlVktup6jgulIIqWQLpH3TsGAEx9kzLD80+3FUygsRNMXf0gsTY1J5C00Rx
	ZSFwIX8+fQFGvK8Mgd3/9/IktI9PmEtzVscwzXQWUlf1AnYFJ2tMhKPTv9Z5I7YRQVFH
	lDxg==
X-Gm-Message-State: AGRZ1gJH06Oqr1NTib5rIsljUwWX6y/IAUhXAIexzz4h7PyTouaf/t3q
	mlkV2EA5ETAlkpxD8ZDiPcg=
X-Google-Smtp-Source: AJdET5ckHTaE2QtvXJmT9Tcc2zifi0Xq+YVq5MHh/DmVLMUP1hMJ3zeNLn5HBiR35+/hqPAnX44fRQ==
X-Received: by 2002:a63:515b:: with SMTP id
	r27-v6mr7604441pgl.419.1541086353496; 
	Thu, 01 Nov 2018 08:32:33 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9100:7129:ced8:dfd3?
	([2601:202:4180:c33:9100:7129:ced8:dfd3])
	by smtp.gmail.com with ESMTPSA id
	s2-v6sm33406593pgo.90.2018.11.01.08.32.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 08:32:32 -0700 (PDT)
To: Trevor Woerner <twoerner@gmail.com>, yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org, yocto-advocacy@yoctoproject.org
References: <20181101140417.GA12376@linux-uys3>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6b8e3db1-d7f1-8abb-dc79-c3fa1c03b97d@gmail.com>
Date: Thu, 1 Nov 2018 08:32:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181101140417.GA12376@linux-uys3>
Subject: Re: OEDAM @ SCaLE 2019
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
X-List-Received-Date: Thu, 01 Nov 2018 15:32:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Trevor,


On 11/1/18 7:04 AM, Trevor Woerner wrote:
> Hello Fellow YP/OE Enthusiasts!
>
> There were discussions at our recent OEDEM regarding:
> - our next developers meeting
> - SCaLE 2019
> - expanding/adding to the YP/OE presence at conferences (i.e. our own
>   miniconf?)
>
> Please see time indices: 12:13 and 16:45
> https://docs.google.com/document/d/1YDAHjIOXCIgvSZVOKCYLxa8h26dkruX8zspoge7zCpk

Could you please give us a day's notice the next time so we can properly
set the perms for our minutes.

- armin

>
> Unfortunately, although lots of opinions were expressed, nothing concrete was
> decided. Many people pointed out that their travel budgets are already
> strained or maxed out, so adding another conference would be difficult if not
> impossible. It's unclear how many "core" YP/OE people might show up at next
> year's SCaLE. Also, given that this year's ELC scheduling hiccup is a one-off,
> maybe it doesn't make as much sense to put in all the work required to run an
> OEDAM at SCaLE if it's only ever going to happen once. Therefore I think I can
> safely say the organizing committee for YP/OE Things at SCaLE 2019 is leaning
> towards not running an OEDAM.
>
> It's not too late to change our plans. If a large number of core people reply
> to this email saying they want and OEDAM in March and will be available in
> Pasadena, then we could accommodate it. It's just that we didn't leave
> Edinburgh with the feeling that an OEDAM at SCaLE was feasible. Also, at this
> point SCaLE isn't on the radars of many of the core YP/OE people, and
> currently the conference tends to attract users rather than developers (or so
> is my impression).
>
> Thoughts?
>
> Best regards,
> 	Trevor

