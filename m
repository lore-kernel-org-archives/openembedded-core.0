Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7AEB87CC97
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 00:08:25 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id h8so2291720pgp.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 16:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=de3I/p5uoHdrdqjP//ys982LvObKKvEJqhPS2hqJ3AA=;
	b=Kl0xDfFsFo/aEHWwFyc0pR1RsfNtkrPvjEjIqmoCD9LMUibENRO3N5ziB6AZHQ5fHz
	LJCYiI/Avu0WHJTR2Pm7Ja3ZEv29Cqmw/oKVXnkNFaZgZVAUQDXgog3YtWb87+N6xZA1
	FjbTwa0NVXtau6hKstvdQ3/Z4ekGKNeP7X/f+aQm2BPPXe1AKv91LKgUGVPHGKwdDhha
	Rk+euqAa6vYORBXHC+eAm7o/M4DM8NP/Q3BLSeaviJ79dBZrtJhSZ98L9/+YsQIaX1FM
	SYrh0KpYsUwSeZFEnfNPo9MK9xgxmgqjp4waftGptnWN/A+Deikbdbxy0r6/04Eq0sG+
	Bq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=de3I/p5uoHdrdqjP//ys982LvObKKvEJqhPS2hqJ3AA=;
	b=UMAxHCjlOoLB0K3yuz5l+IsTu7J1wCcPVIZgzk9auTbocUy2NVgAU0qkr3bn+G+cRJ
	TVV555aTmkR8oHMhhRX2L3uTHPCKgYu4/fzkq5agN62shmTADjHKPQ/l7HH9PTE+CwP1
	v0EXpDJcvErw1b1MiP36UtwMm72EZBmgaB2YZEf3kwR8qKspAKuRzVs/v131089l/JDM
	WmnAw3olsdPXSaaXlU7Mc877OOO6bOHpfr83P11CNnQ9mTY7E+hw8T3F3KZEq0ywdyaw
	iXw089gF42c867rFWPOGPX8l8QPqyv2jGFGD+Js3f8eZ2m22D1SkJK30C4hoRx2Ikip4
	dfUQ==
X-Gm-Message-State: AHQUAubk2Xh7vHpWuMA/P7C1M3eZafnVVB2NO5A0QJ8g28+NwsrAP272
	tDc2oeiOGIwIY9TY3uveqnXXZ0XI
X-Google-Smtp-Source: AHgI3IaQvS6VgRLID4FOFSK9YtdyMhuVAPZMdDhhKaCskk/B0fXPkjBVoBcDTheNUs0pzz1NDLttwA==
X-Received: by 2002:a63:f310:: with SMTP id l16mr10770199pgh.72.1550966906225; 
	Sat, 23 Feb 2019 16:08:26 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:70ef:357b:adf:5cc4?
	([2601:202:4180:c33:70ef:357b:adf:5cc4])
	by smtp.gmail.com with ESMTPSA id
	j13sm3059653pfh.32.2019.02.23.16.08.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Feb 2019 16:08:25 -0800 (PST)
To: George McCollister <george.mccollister@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190222165450.30773-1-george.mccollister@gmail.com>
	<CANNYZj-Fx7W5MKb8hp9F5mPC05fhxq1S56_F9-PDr38yK1ofVw@mail.gmail.com>
	<CAFSKS=M3WckCq3mwaMVWUoo6HaBOR1tBbMyYrg5nJw6=E_0XZQ@mail.gmail.com>
	<CANNYZj-dz6xKtuuOTVAKz-j-+w_qeQXrC_5PTG8cxNeJFs4ZDg@mail.gmail.com>
	<CAFSKS=O3B17J_5oOD6_xhKU7_obNcD4rVm3-zqP4tWQjEroiww@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a2e02826-1247-be96-6f62-0e5851b0c687@gmail.com>
Date: Sat, 23 Feb 2019 16:08:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFSKS=O3B17J_5oOD6_xhKU7_obNcD4rVm3-zqP4tWQjEroiww@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix CVE-2019-6454
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
X-List-Received-Date: Sun, 24 Feb 2019 00:08:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

George,

On 2/22/19 9:22 AM, George McCollister wrote:
> I missed that some how.
>
> Thanks for correcting me.

thanks for the patch. it should apply to Thud so it wont go to waste.

- armin
> -George
>
> On Fri, Feb 22, 2019 at 11:18 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>> On Fri, 22 Feb 2019 at 18:13, George McCollister
>> <george.mccollister@gmail.com> wrote:
>>> I believe this was discussed before and the recommendation was to wait
>>> until 241 to be release. In any case I currently have no interest in
>>> upgrading it. My main motivation is to patch this CVE in sumo but
>>> maintainers seem to want it in master first (even though different
>>> version of the patches are required).
>> 241 has been released:
>> https://github.com/systemd/systemd/releases
>>
>> It's fine if you don't want to do the upgrade, just wanted to correct
>> that point.
>>
>> Alex


