Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 932E060720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 16:59:11 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 21so5542345pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=uwQJwN8ZFi7mfoBoKa627ULboPKXsOjiogVNqgjO424=;
	b=q8gE3J2S13ARCROBZQbsp1fEKDrynCl0iPzW/K1xuSevBcdvme1GKKAm9zlBa61il+
	nZNawpSxwzTJHejHKyt32UMhBhdB2AA2WM7Q2D+aeY6JgMhyVxQWjOLClk39xX4g2OUG
	QzbYI3izPw76QX54d/19za/TVFxqCkSm7E50i7nnHY/STuYgWjjdzq69ZRppyHS5F/ko
	G9P9ADMfHyGfm4Q+8dAOBu24MKfCo/OivlJdacQR17twABaWcPkbkG94ZS0x7qf16Vav
	gTOWBKY+egYP6ePonyx6HavLqgeW2RZ16yaKnyyQzSUR5nqOR9l20pBlhlx5oHPy3UqC
	QdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=uwQJwN8ZFi7mfoBoKa627ULboPKXsOjiogVNqgjO424=;
	b=CpqqiFZzI8j5Iua/m6BlZzHmEWCvyj5scw6jcxscq8afPBXC+o/jKFaF1R1weqUFl7
	z+EU30JMXNEzzf66CA49efevhCuNPuh4Y090C93rrH/z1d635b3gWlgPZuC0RrQ7Gz2n
	B1rVMpLVby6qOumDJ0Rmz4+H8baFNUH0lgSp/R9qI8dB19bkl51SVpwYgg96mPilm4QK
	g8sj+CrDPeB1oXLFftCLuU270fymeFTNEwAKFh5gPGTlLfXkXwY9440WrWXVVfy1TqiS
	Uu0Ab/y5iGvQechk3VvSYZ0n0jA+iLclo2sv1B1ZAnHoeP9wGzzU+shlp2xO9McDrLW2
	sgTQ==
X-Gm-Message-State: AE9vXwP9CHLfCx9uTsrbRnOnyfhS9BCIOIz0/cXbFQnwg3vjf+BwWEekCDG9KNeahBMJ8Q==
X-Received: by 10.98.149.82 with SMTP id p79mr14099854pfd.150.1474649952812;
	Fri, 23 Sep 2016 09:59:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c560:5d36:d9b:7d07?
	([2601:202:4001:9ea0:c560:5d36:d9b:7d07])
	by smtp.gmail.com with ESMTPSA id m11sm415297pfi.30.2016.09.23.09.59.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 09:59:11 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1474620517-4809-1-git-send-email-anujx.mittal@intel.com>
	<20160923085640.GA17846@mbabyjoh-desk.ger.corp.intel.com>
	<5465751.PuAniykgrn@peggleto-mobl.ger.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <fbfe3643-bd33-f515-6f1e-e04cb34937b3@gmail.com>
Date: Fri, 23 Sep 2016 09:59:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <5465751.PuAniykgrn@peggleto-mobl.ger.corp.intel.com>
Cc: Patrick Ohly <patrick.ohly@gmx.de>, Armin Kuster <akuster@mvista.com>
Subject: Re: [master][PATCH] openssl: security fix CVE-2016-6304
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
X-List-Received-Date: Fri, 23 Sep 2016 16:59:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/23/2016 02:06 AM, Paul Eggleton wrote:
> On Fri, 23 Sep 2016 11:56:41 Maxin B. John wrote:
>> On Fri, Sep 23, 2016 at 04:48:37PM +0800, Anuj Mittal wrote:
>>> Reference:
>>> https://www.openssl.org/news/secadv/20160922.txt
>>>
>>> Upstream fix:
>>> https://github.com/openssl/openssl/commit/e408c09bbf7c3057bda4b8d20bec1b3a
>>> 7771c15b
>>>
>>> Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
>>> ---
>>>
>>>   .../openssl/openssl/CVE-2016-6304.patch            | 75
>>>   ++++++++++++++++++++++
>> Mid air collision with Patrick's patch.
> I guess for krogoth and jethro we have the choice of applying just this fix or
> the upgrade.
The last time we upgraded openssl, we broke  stuff in other layers. I am 
more nervous about upgrading jethro than krogoth do to the age of the 
other packages openssl supports.

> Looking over the commits for 1.0.2i it does look like quite a lot
> more than the list of CVEs in the recent security advisory were fixed,
Its hard to say at this time if some of the other commits are in support 
of a CVE fix.

- armin
>   and
> it's somewhat concerning that the 1.0.2i release went out with an apparently
> compile-breaking typo in it (subsequently fixed, patch applied in Patrick's
> upgrade).
>
> Cheers,
> Paul
>


