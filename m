Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8046873259
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:01:35 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id mw1so58409617igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 09:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=v4u6X05n4C389k6+RN9uJJolefoV1yfemXblAnpwJsY=;
	b=suvhGJJNwNOdrTxEzBzMAdUtF0iQUY0+O4GBg1Kj4Eji3kQFcifExdYxqgcmdDy/gO
	V3x0AmTGV4Ki23kxZcQohsE/l9yyNhPXNgMJkl9SUwqSTBQaWgE5Itmu6whoSKShVJqy
	0fYV6xLr9bixoPq8cnKq03+6DKJg2e51/r2jHr0uCbHT3Y0ISseKlWIZAJf6lzYq6Tw5
	hZ2Lh0w99q3KSkcubqExneGCCo1qKFP2Xhlhx/R+SBNzPhMHRm1NxbqEAgLaKg4bYdL9
	GRpWZFxzfym+WhI4HSgkf2GP8vD58d5x3H+Pt39MkoCMLQYC3ur5D3zzC+eEe+ERf4h5
	Xh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v4u6X05n4C389k6+RN9uJJolefoV1yfemXblAnpwJsY=;
	b=izomsAVzSOAUoPJL3sFTdTfrF8TommYHM7lCaql+T6+OYdQCBezTI4ZJn0LK6LBI+j
	Sb2taUnA++L9lRwUoKSrdjYiuxR3q0xmC4RbIvAlZvPPlS9YlBkKYWPtjIaKlYDvIxWR
	T4/qT5h3EHZOjAfNjhfYjpnL4y+83o71tNudvdnF4YrG64FKUIlZgFsWvfCxoolLAy0I
	JMbIlyaZlw0Z4/9pGx9qeChBRfVl5Sve/bQYdEmYTqxl/QftLJX0DxOPR6u1DmsATzJE
	T914xUuBf+r3UfsqyeLcSHmJHUM0783Wa9goaLUvGzLMFF0+PbEukJA6RNXLoTtJzteX
	NIpQ==
X-Gm-Message-State: AG10YOR0YxhyrUhImGlTJp90RlWE77bQUa1f2HRdIPQs0Te09fYhrO4hgV4HC3QlCclSIhJxkCs9f1njXjUxdw==
X-Received: by 10.50.171.200 with SMTP id aw8mr4793970igc.77.1453482096129;
	Fri, 22 Jan 2016 09:01:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 22 Jan 2016 09:01:06 -0800 (PST)
In-Reply-To: <CAJTo0LaXcMADdSEyTQQ7QrfpJmUmy8TsaJ+BfbEb0C2aJ0aRyw@mail.gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<30b9847bc3bd6931817a7c1d1ceceddb81ec7cc4.1453029952.git.raj.khem@gmail.com>
	<CAJTo0LaXcMADdSEyTQQ7QrfpJmUmy8TsaJ+BfbEb0C2aJ0aRyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jan 2016 09:01:06 -0800
Message-ID: <CAMKF1soiBiARYVoaZLtj2vonkFqAYr8wghhWjTKJzJUcc5qLbw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/73] elfutils: Fix build with uclibc/musl
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
X-List-Received-Date: Fri, 22 Jan 2016 17:01:38 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 22, 2016 at 4:26 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 January 2016 at 11:35, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Remove mempcpy patch its already in uclibc now
>> refresh libargp patch to match latest elfutils
>>
>> Add ALLOW_EMPTY for musl
>>
>> core-image-cmdline-full asks for elfutils package to be added to package
>> it has all eu-* tools but we dont build them on musl. nevertheless lets
>> satisfy the dependency so image can build for musl
>>
>> Build libdw,libasm,libebl along with libelf
>>
>> enhance the musl portability patch to compile every other library
>> except the eu-* tools
>>
>> Fix build on aarch64/musl issues
>>
>> Header inclusion ends up with duplicate definitions of iovec struct
>> since uclibc defines the same in usersapce, we have been depending upong
>> including the kernel header on aarch64, using sys/uio.h is the right
>> approach
>>
>> Fix x86 build warning seen on musl
>
>
> The new patches are missing their Upstream-Status tags.
>

updated
https://github.com/kraj/openembedded-core/commit/df09f6aac44253dbf6a313a588f877206264ea64

> Ross

