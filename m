Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3B771999
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 16:09:13 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f144so1404103pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 08:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ytVHsckqr5SIluH5SuMyzpmkTpqnTQ7EfDokEuSi1lY=;
	b=kubGtZfDgNsPpQ2JPWTpNJYnDFxazR73OyatcFgckAqiGFAIEME3MQzN9IF8nOFPrA
	JSSQlDsKpJvwUmeWc3HQ3yZh8BdSc5zeG46vCGj2a9y/cMO4nsiEj5Qg3N97DjCjwJHG
	Oe5P/sa+eg7CWzGo8vuuoctdJJwo1fn1PbwgtXwdt/evHuWQeoQbIjz6STDd6NC0Xozf
	DuFMVV8sLs/y4JBfX0LecR8I2fZZ/nY28UPu1Jc0+gF/h6a88GCzXpqx2knI+SkZN4Ha
	5+z8a0Uukfn6q04r7mElbSSUcagm6LD7VLzi805/AYhdu4Zis7xOhWWW3Al+OsauhWjC
	VaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ytVHsckqr5SIluH5SuMyzpmkTpqnTQ7EfDokEuSi1lY=;
	b=oaF9ARo9+MdGhEo9LO8gkRqeFVN36Do324u+hpwIofBwvX/ULdvCp3p+KbLKqj0Wrx
	cYaDWH3O8SlkBcxI2xnMgZv1e3HLweJ/xjwYN+tBvHpoxTPG3sm0jmceo8vaK7pS6l0v
	62KDnVTTsOyPkjdzOJagiNZI7yhMHcE4LrzyP+I6hLxqlP1CAWk7THz0wcDn/51Ue/JS
	sxI27xiCrvOFHx1MbRYkXt7zv6DtSyOoMooYCxk0lZ7ucln35mzimxJy2kpdmpU27A3x
	EeJ5uFZ80tRf0hkNLZafpJ/odFrUG2rOmfCoCoTBDk5bLijQ5sAyCm4pxELFAFxWKkQ6
	8xqA==
X-Gm-Message-State: AIkVDXKA1jN/0K4tY/DY/9yi0uVCZag0TWrHg82d+K+FnKBM9G6hW3E7P57F54LUhrMO6A==
X-Received: by 10.98.32.221 with SMTP id m90mr4689646pfj.127.1484755753635;
	Wed, 18 Jan 2017 08:09:13 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	a25sm1796726pgd.26.2017.01.18.08.09.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jan 2017 08:09:13 -0800 (PST)
To: Nathan Rossi <nathan@nathanrossi.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2453DBB31E@XSJ-PSEXMBX01.xlnx.xilinx.com>
	<05c7dfd0-38f3-b684-db94-38121b086a67@topic.nl>
	<CA+aJhH03XW19tEX5nP7WgoV6au9xmms6GuASEHMmRvA-1qhh8w@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ee6f0244-0fb1-ad27-6056-a358b5eb0112@gmail.com>
Date: Wed, 18 Jan 2017 08:09:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CA+aJhH03XW19tEX5nP7WgoV6au9xmms6GuASEHMmRvA-1qhh8w@mail.gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Wed, 18 Jan 2017 16:09:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/18/2017 04:08 AM, Nathan Rossi wrote:
> On 18 January 2017 at 19:37, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>> Could someone at least please say "yes" or "no"?
>>
>> I now have three projects waiting for this patch to be included in morty. If
>> it's not going to happen, I'll have to add a bbappend to these layers to fix
>> it.
>>
>> On 16-01-17 18:49, Manjukumar Harthikote Matha wrote:
>>> Ping, this has been applied to master
> Armin, you mentioned on IRC ~1 week ago that you had merged it to your
> staging branch? Any updates?
> Also I had a look and could not find the change in
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akuster/morty-next?
> Maybe I am looking in the wrong place though for your staging tree?
I forgot to press go. Its there now.

- armin
>
> Thanks,
> Nathan


