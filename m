Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id EB88160111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 14:20:41 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id c13so5016975lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 06:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=nIR0dGt/iYgaQhiAxftjy4YpS9b4uV+BupEYNKGfMkE=;
	b=UeEYAjg3IoE6AugZ6VWmG2g4ejcDJ1Eqkpn3mr6hqfCQoF8g5I4o6Lhp8vJ7ZQSi21
	7Na2nNgTWZ2zsDKab2K/Ay/l21CGOIR0n7cGPE5Tg/3mf6TV9WYbUeu6Pi52m+8g70Ez
	osFGnTP1BnTZvuvL+JPZnTMFyNNn4OU62HHzOJcEAFH3qoA52SEvFeyIu5BFQ4HHaYka
	TM3UiV5/EoWcPQrdWZV4TTkz0AFXg/A+CezFx9/+UtIbr18xWrvcjfIAta/kNvq2+f6n
	mtF98eODrg7OZcuHDnTvSagmaBjFTnrXHWqbJ4vGnXRDXGGHAAYQchv1jU0AZT/YEotI
	4l+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=nIR0dGt/iYgaQhiAxftjy4YpS9b4uV+BupEYNKGfMkE=;
	b=HvWFEe7wzABgbE87lcO68hyDz/1OcR9ybKpwR4U3/flCoeZWcIowYHu1uqUfkrvXiU
	pUiM4FmMakrIUVdnphSmeRamnKleyGdn9QNoGxoHoPWwAmxuSE/si7CVwC2rKQCT0810
	0WmaFrBRk15yim54Q/xPGh7OcmTj1xFze0i3VLYsFfpgqqJ8HDbrYb3cux17TYnZGWTN
	vzEdx0siGCRLoornLeh2IjyAtk6d6ojQYbrYX8FdZtCTR+BsTT2iWEj8SXRxBgfvbWZn
	533kDnRhCSx0k1MWdPOprAHAakWXksn0Y0t2e/dCmL9tX0wmrCsadfodS9XKf9FPs/r7
	5+og==
X-Gm-Message-State: AKaTC01r5tMSZYmxsEKEmGpR1gAmxtKwJ+s10gq3VqW6dWXtGXEoL8YK3N7mmkfVkCAisg==
X-Received: by 10.25.76.194 with SMTP id z185mr1005597lfa.182.1479910842269;
	Wed, 23 Nov 2016 06:20:42 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	g38sm7274086lfi.40.2016.11.23.06.20.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 06:20:41 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123134404.GC13863@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <d86cb76f-0278-2f2b-d503-5975b1470abd@mender.io>
Date: Wed, 23 Nov 2016 15:20:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161123134404.GC13863@linux.intel.com>
Cc: Eduard Bartosh <eduard.bartosh@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Wed, 23 Nov 2016 14:20:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 23/11/16 14:44, Ed Bartosh wrote:
> On Wed, Nov 23, 2016 at 02:08:28PM +0100, Kristian Amlie wrote:
>> On 23/11/16 13:08, Ed Bartosh wrote:
>>> I support the idea. Let's discuss the details of implementation and
>>> create a bug in bugzilla to track the development 
>>
>> Do you want me to create the ticket? (it'll be my first, so apologies in
>> advance if I omit something important)
>>
> Yes, please create an issue in bugzilla and assign it to me. Don't
> worry. If you miss something other people will point to in in the
> comments :)

Done, I have added https://bugzilla.yoctoproject.org/show_bug.cgi?id=10712

-- 
Kristian

