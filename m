Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0BC6072C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 09:15:43 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id e185so21957601vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=mYtkx/fFDifjRwSXLMiBgQlhuWmhR1/2sAmgclklEWg=;
	b=NRI0576PqD5jfVkO+YsbRqWZQi5MOpEl1ic9QdoYO5cjqY1almHJ3i/C+ZSkySTQGt
	5WmwnxrzWe8t6ezXqUEJJO4vZsRjD2r4cFbVOjwRTsyFoJQZ0hHCNPgc7MD0Qp9mU3FG
	Q4S1L11t+0skpiNwlewwoHhm3ZcA59N7+7s6BHZxYMIfrS4maVI23D3UYpjXMv/8x9xU
	3oVyofzh/dSs79FEnk5JKt6Zla7qPs3dHyHqyan567JaPT680ZO/ld5yA3PrBKb1/waB
	vUh8se6OFwEhRFKPC2QC/G8dkrqt3x8mYK8jA0ecBmW2i+LDxDT/CY79r+CqM5paWRGG
	Lg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=mYtkx/fFDifjRwSXLMiBgQlhuWmhR1/2sAmgclklEWg=;
	b=mlhStxfMdMue1C8Zsk/bOqdZG9QBopKFvFtbSgHl8hErwCLYwFxjHLCUPloUnHKU/i
	bCVOjg9RiLDuHXQcWIgjs2HYAfsB6F1GqTJG/9hK0kn8sj9ynu1GvW/x1E1vxZzre38/
	Jp88ShblPoSjK8MoJEYX7Dy7B1ZPZuonjqDqiVIg3jXJTtG78Q8FAOIFd5txQhi5k8/c
	by3frJy2Z8I5tRgLpMZvfAt73MeTDolWBtuHrEc3LWt5a+Rr8UIuBAiihfxqLeaaMR8g
	8gaCuRmzn3TYdxd4ovRozW2tcqlef/poTPITFvBa+nShL7ZnQBf1QBqvArMEJV4JV3bL
	VDwQ==
X-Gm-Message-State: AOPr4FVjbrWBdI1POlr+KTrdR+U4y8YNC2jppoUu4KGU+n7bJdnfhqGsmiS/PJ/i6RpgGwghsBcBBKoRgZy5jA==
MIME-Version: 1.0
X-Received: by 10.31.129.211 with SMTP id c202mr15772920vkd.52.1460970942551; 
	Mon, 18 Apr 2016 02:15:42 -0700 (PDT)
Received: by 10.176.2.141 with HTTP; Mon, 18 Apr 2016 02:15:42 -0700 (PDT)
In-Reply-To: <5714A30A.9000204@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
Date: Mon, 18 Apr 2016 11:15:42 +0200
Message-ID: <CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 09:15:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 11:04 AM, Hongxu Jia <hongxu.jia@windriver.com> wro=
te:
> On 04/18/2016 04:47 PM, Andreas M=C3=BCller wrote:
>>>
>>> debug gzip.
>>
>> Ehm dbg packages?? No - I just want remote debugging
>
>
> Since -fdebug-prefix-map were added to DEBUG_FLAGS, the prefix in debuggi=
ng
> info
> will be remapped, I am afraid your remote debug with build path sysroot
> could not work.
>
> I am afraid you need to tweak sysroot location to target path. Or directl=
y
> remove -fdebug-prefix-map
> from DEBUG_FLAGS.
>
> //Hongxu
>
So remote debugging is no more available for standard settings. I am
tempted to send a revert: Installing -dbg causes bloated images and
debugging on machine is slow and last resort only.

Andreas

