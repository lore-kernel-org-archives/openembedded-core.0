Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id E909860229
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 01:57:36 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d19-v6so6887938pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 18:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zQq8/CjvS+yzZci3hF4MmJL7APfpLP3d0P+HcPzBgCs=;
	b=ldyrEG9+Iiup6cAgKxuzZ8o2lTF1ffCopNjq4Axb/F5tWwfvp42NqXSxhh+K0Q2nrS
	Yob5Z1s5bZAMVj57WnPI9Yb1/Br3AhPwgnVcW9hA23Eo/FS0++Dt5Iv3BJ+m731R3rvG
	OPw/zAX6ifStWRuV08henKCWPN59dTP/qL9omYYzY9QDBHR5ApWWjaZdFT589NtKWzsM
	6cJf1lzJcNWHng//yBukt7Y+lY5pfF07v4/XKjoJr1H2h4Nyunw4fQvXYFl9M+KssEfn
	ENKujULxnpP1qAU22X6HPI5gS4A0nM/ibQ2zfjOkl+oMtiP6eMfLgpkfO1sUlsEy8bvM
	n+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=zQq8/CjvS+yzZci3hF4MmJL7APfpLP3d0P+HcPzBgCs=;
	b=OLoycl8n94H9s6/yDBStZS7k9x+5MRQxvJVtUTe5/g7eSVkI0fWlWhFufBjhsRidig
	OF/xFFpLkPhGbA6quAFFTzs7ddMu4C0K/8f/nL9Ssop7Xn298hhanqotb2fMpJQUYKPx
	PmsxiVisxEnJwn3yvH7MS2p6q0mT3QEebTz/S3mHs0vz3OeUru8ts7Bh0hPIzwOqrTEV
	xX8aAwhQ1yNdafPnja5Jm8XEPjlFZ8E8UJKWViLvztjFd6dfc4oekT7/EPVOSQpdxBJi
	gu+M2+zBqabhc65vT64zqQmZH70RYOafGMdh+RlKvlBFK8aj1vBs6qo0xF7SMbQHMHAz
	13SQ==
X-Gm-Message-State: APzg51A47PStxqRg+q3Yz2CtV9At4kVZKBXB0CHfYYaZx3j6ODVHRTTi
	aXS7ZmvJEp3ptV/n/w5scR4=
X-Google-Smtp-Source: ANB0VdZ0Q+Vy1ChSiwHqms8iq+pc+ymL7fNnH2gPFRWl4rFcAIO9t/mKu0yfbYXPM7djQ4gN/9bgXA==
X-Received: by 2002:a63:f501:: with SMTP id
	w1-v6mr21485728pgh.446.1537149458037; 
	Sun, 16 Sep 2018 18:57:38 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:5894:ddfc:ffa2:b108?
	([2601:202:4180:c33:5894:ddfc:ffa2:b108])
	by smtp.gmail.com with ESMTPSA id
	g7-v6sm17120065pfi.175.2018.09.16.18.57.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Sep 2018 18:57:37 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
References: <20180916211625.18597-1-otavio@ossystems.com.br>
	<20180916211625.18597-4-otavio@ossystems.com.br>
	<CAP9ODKoKv05L0=NVUnY7LamEbjsZwTgsAqnNokQr8KS64SThBQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <690c79c0-b182-a2ff-997e-a978ed2d9be4@gmail.com>
Date: Sun, 16 Sep 2018 18:57:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoKv05L0=NVUnY7LamEbjsZwTgsAqnNokQr8KS64SThBQ@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] u-boot: Upgrade 2018.07 -> 2018.09
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
X-List-Received-Date: Mon, 17 Sep 2018 01:57:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 09/16/2018 06:14 PM, Otavio Salvador wrote:
> On Sun, Sep 16, 2018 at 6:16 PM Otavio Salvador <otavio@ossystems.com.b=
r> wrote:
>> This upgrades U-Boot to 2018.09 release and drop the backported
>> security fixes which are now included upstream.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> When I mentioned, on IRC, about this bump to Marek, he mentioned that
> there is a regression on x86 being worked on upstream so this patch
> should wait for this to be sorted out before we update it.

What is the difference in regression when there is a kernel issue
identified after they release or any other package update?

Granted this most likely wont make 2.6 so is a moot point in 6 months.=C2=
=A0
Is there a benefit to the many over the few with this?

- armin
>



