Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6DAD56D44A;
	Fri, 30 Nov 2018 15:29:07 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id e5so2977169plb.5;
	Fri, 30 Nov 2018 07:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=v5m7UoQqOVYAj1BDmCt+kUZ3c2h03UZocEbioGbro4s=;
	b=YLmzL+k4RUudGotz8Z0vq409pLsiCfx3XNKTr/nHEnAASzAjXAlZ+2mXiiVW+XLADQ
	u/JRFLAS/92imzLe6axBGgTIeogC+Kv6gPZn6pfUlQeFGkNp/nf6fgW3avFsi+JsCfll
	K88W1KEaLMO/ZXbQ6yV5EVVNr/+lCFxmGkcXjH9TsMFh5IVmioxERqjw679ncboUr+9u
	pBjm2z+G5SbO8rd4zj8PGhfPLXGBmo8SvaPq6fQKWpxE4AqKYS0/d2HTiLCykxWr8Zyb
	PV0ePY3xpwbKL7axe/+GqpftwmKteaFKw0wWgdp4LrMiG6P39/93pPnFsHDHL28FmxJZ
	Nw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=v5m7UoQqOVYAj1BDmCt+kUZ3c2h03UZocEbioGbro4s=;
	b=WM1Y8UZ08TR4LI6V7OEVrcrukHKPLuE9ToIYI2VGi8TvY1ibdQkBzGjdEr3HHoy6WA
	jUhwPWHf9MlRPeJa7W0glJzCNmLr3qEq0khegYSb8jaYD5TF2GYConygIcMnZ765zjx9
	GI8EXQ+vOvzB839JP8nH8rw9QP+6l0M0g8QP6vEZYAiHr658VUs1I2V+V/0Z9GYi5vmQ
	zhL4pY53WOJcEk7f8WKTDYOoX9esd++vZXmn1cPh5iVtNhTpfdbDgESJzfnTlIcXjZec
	6L4TSLQUp0I9/+HP3LlahdVHG/cJv7+zephU8BZNlzVDo+EXRK9MsoOZBEvAOxUMZkc1
	eUug==
X-Gm-Message-State: AA+aEWbMloe5KKEl5CUDEy66mMA9le0134ewnrliyRmxpXJQxJaV2WAf
	PyzCNa6WWaMKQrGhiotPhhVs3tpB
X-Google-Smtp-Source: AFSGD/XNNqijl7vrd3tuRL0KnVyX0GIDErUR2u4YyEC5a4+969CfpXgFxmUmu/Vv6vTWkeRVMprYyg==
X-Received: by 2002:a17:902:28e6:: with SMTP id
	f93mr6014843plb.239.1543591748148; 
	Fri, 30 Nov 2018 07:29:08 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:6daa:a077:826a:8a52?
	([2601:202:4180:c33:6daa:a077:826a:8a52])
	by smtp.gmail.com with ESMTPSA id
	v184sm7007531pfb.182.2018.11.30.07.29.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 07:29:07 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, "Eggleton, Paul" <paul.eggleton@intel.com>
References: <2403371.OeEdUFaxhe@localhost.localdomain>
	<CAMKF1srJiBZnB42fhoYOvutDe_Pv0sBRq79p=69UWfgt4QRckg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <65e80112-9ed0-3876-e878-568840fcf675@gmail.com>
Date: Fri, 30 Nov 2018 07:29:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srJiBZnB42fhoYOvutDe_Pv0sBRq79p=69UWfgt4QRckg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Github pull requests
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
X-List-Received-Date: Fri, 30 Nov 2018 15:29:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/29/18 6:31 PM, Khem Raj wrote:
> On Thu, Nov 29, 2018 at 5:26 PM Paul Eggleton <paul.eggleton@intel.com> wrote:
>> Hi folks
>>
>> Someone pointed out that there are quite a few pull requests on github under
>> https://github.com/openembedded/. I know we don't accept these, but it seems
>> to me we ought to clean up the ones that are there in order to avoid people
>> thinking that they might be (and probably comment on the ones where we haven't
>> done so or the submitter hasn't sent them to the mailing list already). I'll
>> volunteer to clean them up, but I don't currently have access - can someone
>> grant that to me?
> I think that will be good. I have taken care of meta-oe ones but I can not
> close them

Does that include the Stable branch requests?
-armin
>
>> Thanks,
>> Paul
>>
>> --
>> Paul Eggleton
>> Intel Open Source Technology Centre
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


