Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9324065CBB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 20:03:01 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id p63so131321744wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 12:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QU/EO3aIvn5qkKJXsaxM9k9wKo/YsMXeJznnCJM0/Jc=;
	b=AJd1wwg1QXPt5Beq1qCNQPScsgvtNdLhDjAVOhYf3pKiaj8HT9aUZYYZI5SkfdzIBx
	jkhcm2mloxfiHBH1x0xRugMX24JdHN/1DXZFMwqZUEl3S5FgUQgeczExxpZeoT6iscVX
	n/sswzAADMHDL/xzNfUkwjhZnfZzgrMuVpitoVFrynreeLlxllNf/6peclEgKwZSlp6P
	+fgrjCgHniWXbs+WlzALRk7TGM2mBs0Y8iAINOfWwATEp2YqVOxiw5lKWSCNIA9fAQiy
	dL5AnRDf0TxEQou2kTqEMdMtqyL8IcFsJg0FEU4GNvBL06Pd89dRw3qtnxQjq8QSBBiP
	0bFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=QU/EO3aIvn5qkKJXsaxM9k9wKo/YsMXeJznnCJM0/Jc=;
	b=RY+W1eXqFJrEusXB8AyGWsHf6qH36d+8R3K9RULZAe0VYOf3UGtdbBG15re6hvM7q6
	KFoA0N2ib5lu4u9FXF7srzGvQYH4iHv1P1fZqnQ0tKK9MFIlEhkcixX46YUYex8C64//
	GS0QduYmB94vVb3ok976NMPOaV0/koUv36Rme6jW6HXHibYjKaME0KPQV2NGK+uEQshf
	donblxm42iUkJQNbadSh0UMvQa9UZI6PZHx/vE8Z0loTk/GzC4CiEovM1BxxGS05ldGQ
	xrQbqDWyeNNFtH6Evl16yP9PDNlTChg3M04J9sYLKiN62CRemZ+jCkSllD1ZyIwvcmjJ
	VaGg==
X-Gm-Message-State: AG10YOQfYk0uv9hSVZM5uklAIVRMgLW+3H1jTO0fhB6R2ZJ3GHEuJhNMmAqT859kjQwfNQR1HrGLiLYe1LooLw==
MIME-Version: 1.0
X-Received: by 10.28.220.134 with SMTP id t128mr562924wmg.61.1454961781853;
	Mon, 08 Feb 2016 12:03:01 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 8 Feb 2016 12:03:01 -0800 (PST)
In-Reply-To: <CAMKF1sqdRHprniyiaiUNrghVwZ4tY=hn7gEHwf1g2fxi3SWEtA@mail.gmail.com>
References: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
	<CAMKF1sqdRHprniyiaiUNrghVwZ4tY=hn7gEHwf1g2fxi3SWEtA@mail.gmail.com>
Date: Mon, 8 Feb 2016 12:03:01 -0800
Message-ID: <CAJ86T=UjJMJ_44ws-Esuak2nGC8ML-_-=vPAGHXJS0=0rU0fEQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: TARGET_CFLAGS for non-target builds
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
X-List-Received-Date: Mon, 08 Feb 2016 20:03:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 11:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Feb 8, 2016 at 11:52 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Although I don't see it on the mailing list, oe-core master now
>> contains the following patch:
>>
>>   http://git.openembedded.org/openembedded-core/commit/?id=ff2c8af73046f55aa733ce8289b6236c88300290
>>
>> Is this necessary? Aren't TARGET_CFLAGS by definition only used for the target?
>
> when doing native class TARGET_FLAGS are mutated to represent build
> flags but it still is TARGET_FLAGS
> and when you append to it then the flags go into your
> native/cross/nativesdk builds as well. Not something you
> are looking for.

Can you give an example? Looking at native.bbclass it seems to replace
TARGET_CFLAGS with BUILD_CFLAGS, not manipulate it.

(I've had -fstack-protector-strong in SECURITY_CFLAGS in my own distro
for a long time and all the build failures it caused for native
packages have turned out to be bugs in the packages or the recipes).

>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

