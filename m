Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 02D7771AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 03:08:51 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id n190so2639629pga.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 20:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=QT85Y8y8YVsr/UXqM9IA80Q5ViXMi3nZItwlr17sq7Q=;
	b=h6BFem8PU3ky/OCNy50dokUGp1tcCpQeQhz70PIIHHwhMNtFtwEpI72cQjxMvryV+J
	1FwTj5gE55PKESW4kHNldy2YUMxT7x+Ncb4xIprDkl+jw+iJ5kNhOrtETOQrHbSR1C0N
	+bp3ReXW0OKsC52mSNt+XCJGlBXGw/7WlM8rZldQ28pf/SVSAP6ZXOTwpo7ipu835Vf5
	buloJCe9vS8M/vuZFWsNjPoBD1XB2rPHZzUNcvKBZv7BsgHRa+4UenVeVgQkyOV+vWpf
	hQeayHKsHmfzrFmoj17GMiIE0cFobILI6rF3PQ3X9fOerBoKwxbZ9xu5ABxyeN5QFphO
	NkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=QT85Y8y8YVsr/UXqM9IA80Q5ViXMi3nZItwlr17sq7Q=;
	b=phsuJHY4mXvlvyfUTs7xwy4gtwrEjfwymyqU2HWXAwR9Eppmk9Cea4jfH64Zm3YHMe
	Tq55fsYDAqsIzJ26bzYRjn3fT7W/ufXC/bYrB+NCoRf+1/eKRmUhCXdQkkxNV7/XORcz
	imA8dgSGPoHQkpK9Xzx17rh3A6XR8UBzTQdgllaFYi7pNZNQO4jNnmgWJ/8dVzxFolui
	LpUSLZ7S5Kw732e1rmalDfBs1jItWNcBCmH5Y/q9R5dRpVre+aXGoS1JtCtZbty4Q19T
	e6/ryZFofFhd341A8QkXW9lYlaFLeU7B+v8H6GnWa9bU1u0Qt/6Mw3oxHebYfK3BojOz
	zeUA==
X-Gm-Message-State: AFeK/H1qZptdVldDBSASkmKGdV7Wwnu7lTSnezBbWkYU0+SodnGpj2ibNawQ0zaNOsQX9w==
X-Received: by 10.99.124.1 with SMTP id x1mr1120112pgc.208.1489547332989;
	Tue, 14 Mar 2017 20:08:52 -0700 (PDT)
Received: from [10.5.7.41] ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id u75sm580577pfk.3.2017.03.14.20.08.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 20:08:52 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <1487700290-3110-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=Vji6+uo25xxB0rir_HcCo2UzEcrmsa_q-3kdUJJUF5rg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <42b3cca7-a268-ea8c-2e35-02c1624bf290@gmail.com>
Date: Tue, 14 Mar 2017 20:08:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Vji6+uo25xxB0rir_HcCo2UzEcrmsa_q-3kdUJJUF5rg@mail.gmail.com>
Subject: Re: [PATCH 0/2][morty] Backport image dependency chain fixes
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
X-List-Received-Date: Wed, 15 Mar 2017 03:08:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/14/2017 07:14 PM, Andre McCurdy wrote:
> On Tue, Feb 21, 2017 at 10:04 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Andre McCurdy (1):
>>    image_types.bbclass: fix image dependency chain collection
>>
>> Randy Witt (1):
>>    image_types.bbclass: IMAGE_TYPEDEP_ now adds deps for conversion types
I tried applying these changes and they fail. maybe I can grabbing the 
wrong changes.

- armin


> Ping (and CC'ing Armin this time...)

>
>>   meta/classes/image_types.bbclass | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> --
>> 1.9.1
>>


