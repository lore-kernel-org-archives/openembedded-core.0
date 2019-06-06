Return-Path: <matthias.schoepfer@googlemail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 818807D258
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 15:46:58 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n9so2979297wru.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=WYkK4Q4XxgNuGC/BEAysHNOtG2XmJsPdCUBN4EbKBaE=;
	b=PmELpB5T/Y3WNe88C68qAmeD6YWUPLkgx3z7brkCrLxYNJ6np9x+3ek79BwFRuIb3W
	tlle+OOwkDHnbsTHDVSygbg5qUWR5GRLn6iDyKDOHxE2sRTljhG/840ojkxr9UfyWUaW
	hvBtrNnpMX4s454NUKSYjvM93EM/COk5QEQ5BzhsBcR3xprku2xWd1fu86SHIbzrJerF
	LoHKePYePyfcOpYvOIEujZ+OhwOorNEJgf80m2pzz3jIu1vacecH0eM/wieSRxzgiU+2
	izI+jFEAH/1U3/NlY+6l6u/Z3aFs2JiNWnsLQyhCzozAZGs5B5lcEmOJpfi/HT7IZ0xq
	jOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=WYkK4Q4XxgNuGC/BEAysHNOtG2XmJsPdCUBN4EbKBaE=;
	b=hbCfC4KLw+pYwan4Pdx+Av3/UfjdHvZ2Tj9McqfxshkBtVCav8LxXz0HOwQjz5kjGE
	MDLOfjLUbNlrh8mvXB2vHSUlBUY4aRO5Rw6AN4fEKm8X7oQRzMbNd2PL88BqqGUm5gsL
	IqiTvcqLsvuo2qF2VRilaKfHrI68SOu3DKcEbmi47/VDWwWrosrqz+pmfWqIDdl0E6rN
	WFdhe2Evf97rMCcKeqyBbDS4jOtUDGsr9nVzAY4syYJqCK9srJgW3nevMttWu72Hx6ni
	i+xHgY9Sq6H8fWiqjDeHw8NF6G7QdNqvXoOh1ITDuTv5QJ5G5nbSINOokmsHyYcKyNVm
	8VNg==
X-Gm-Message-State: APjAAAUvrkKU/2fpx7Tw/4XTtuoA6JLPT7sS718aMKzP42e+GM7MNXcs
	DCxBuUsuTMH/9JWp46UbrPSUMaub
X-Google-Smtp-Source: APXvYqxkhBA+C/PdX5gGdN2H+XQgqS9+lFpbY0L993fNB8r/bHNkfnSuFAG0YL1cYVc7ma5jXS/E1w==
X-Received: by 2002:adf:f50c:: with SMTP id q12mr3513435wro.300.1559836018944; 
	Thu, 06 Jun 2019 08:46:58 -0700 (PDT)
Received: from [172.16.100.14] ([213.168.66.146])
	by smtp.gmail.com with ESMTPSA id
	q21sm2169250wmq.13.2019.06.06.08.46.58
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 08:46:58 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190606151357.21453-1-matthias.schoepfer@ithinx.io>
	<CAJTo0La-MG7hctC+qAfJtNQ=T5grgVt7U8aQhPLKN+tahARBng@mail.gmail.com>
From: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
Message-ID: <9c4ca1e9-9698-9b89-d54d-a909d5e73994@googlemail.com>
Date: Thu, 6 Jun 2019 17:46:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La-MG7hctC+qAfJtNQ=T5grgVt7U8aQhPLKN+tahARBng@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fixing python3 build for mips softfloat targets
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
X-List-Received-Date: Thu, 06 Jun 2019 15:46:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Ross,

On 6/6/19 5:29 PM, Burton, Ross wrote:
> On Thu, 6 Jun 2019 at 16:15, Matthias Schoepfer via Openembedded-core
> <openembedded-core@lists.openembedded.org> wrote:
>
> The shortlog should be "python3: fix build on softfloat mips".
Do you want me to send an v2 for it?
>
>> Applied / backported patch from upstream (pending review)
> Is this patch backported, or is it still in review?

Unfortunately, it is still to be reviewed. I have opened a yocto bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13340

And here is the PR:

https://github.com/python/cpython/pull/13196

And here the python bug:

https://bugs.python.org/issue36852


>
>> +From 7535c39951b9d15dd64c4669092a8582ba555466 Mon Sep 17 00:00:00 2001
>> +From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
>> +Date: Fri, 31 May 2019 15:34:34 +0200
>> +Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
>> + float
>> +
>> +When (cross) compiling for softfloat mips, __mips_hard_float will not be
>> +defined and detection of OS triplet in configure.ac / configure will fail.
>> +
>> +This also has to do with the custom detection of the build triplet. Trying
>> +to do this in a more autoconf/autotools manner.
> The patch should have your Signed-off-by, and an Upstream-Status
> (Submitted or Backport in this case).
>
> Ross

