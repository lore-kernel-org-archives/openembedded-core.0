Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3125165CC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:37:51 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id g23so101618359wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 06:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=toyCldpax/Tx4iWtIs+Cqq1oFlb43renJhDgOwJ7s8c=;
	b=l3OyPV7kTQydUL77GRqV8MfwxMv4JoeYJ5mxyJRWkFil3v1B500W+YAZciSEAC/pt1
	lc29tfczlP9aq3TTQD7jECjV0H97mVq9JB3uQD44dTRvVYi/iw7Pccns7XcHFjelqtXf
	ydlw0O73tdKJuw20m3c57nzjS6vrGi9wD0xOotD5QCbNsplMbRvbb3eSRYCC5U/MSeUr
	fnFVP9OPL1d25rEnCb/pcOwYTg8WIeEWJXO9N1jdcizzbmWK8XBb6KKNT2NNSfbso0cV
	4QY7NVJH4Tx6UCupRvc5eII6w0y4hy9EiBUxXndA2IfXVnB8IP4fgi2oDfmtggm0wHIJ
	7B1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=toyCldpax/Tx4iWtIs+Cqq1oFlb43renJhDgOwJ7s8c=;
	b=SSKqbg98EwT2yCXVa+P1bfo+7sQAqyTyZh1ItmjGkT7bnDsMQIiVmq5hJIjzwzzVCS
	KAHMeAB4oNBqIIY86TlMYNiPL3QZkuG/ooW3RRJdYMJtws4x49zhJbfSYkGbvZiahg5O
	zvbkYXhNxvvQflhdbwUvaPgniG+Z12HYUzoYWljH0A0n2ULzvD7bEXc158EqC6JoOThu
	e9RFRuKcC/2c6zk380OATroOZng/2A5Uz/69t+V1t41ZFfr7xy2+khZTmRateHyS+Kxf
	s+hd8cv0mo9oWXGOBuoRvvAnwdrgLQm34dYSqxeNR/1mMYfAcgOX5o7HBK/jaifQ7CfA
	NkVQ==
X-Gm-Message-State: ABUngvckpDta4UYyEv+AiV3IrmroTl6NTjTOXjvfD5NQxWnTypEW0U919ndF0lDEqL2F6Qf+hktxnGvXsiC+Yw==
X-Received: by 10.28.8.202 with SMTP id 193mr10093201wmi.101.1479134272230;
	Mon, 14 Nov 2016 06:37:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Mon, 14 Nov 2016 06:37:31 -0800 (PST)
In-Reply-To: <CAJTo0Lby4RLXxxe8cG_Kr8Uq-srb8nv2tZCTCuQxBYD8hY5YyA@mail.gmail.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<CAJTo0LZiXenXy8WC28z+5a4+ibJekaqeD+0_O84aejyi9XNH4w@mail.gmail.com>
	<CAD4b0_J6hKetcbiXvUS3wAeo19QSGF=5DCFZnLK-0Lz904-6DA@mail.gmail.com>
	<CAJTo0LaLwE+VOJwa3vad2XOc0FmwPpcGOxUvev=7RbnatnOKRg@mail.gmail.com>
	<CAD4b0_LBO_WbaGdaYne7U8KT0QiBb=P5_Th0MjzR24F6px-vXA@mail.gmail.com>
	<CAJTo0LZ+JpE8G-qvLOQburPb+vFCJ-GB6HnGpKZD80tnLpv86A@mail.gmail.com>
	<CAD4b0_KC108KpwO3kvWqt7LCoqAQZ88_R0b_BXmmuSFAv_xVfQ@mail.gmail.com>
	<CAJTo0Lby4RLXxxe8cG_Kr8Uq-srb8nv2tZCTCuQxBYD8hY5YyA@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 14 Nov 2016 15:37:31 +0100
Message-ID: <CAD4b0_+P2+VECFC3s-RG3urDaArb8v+7sTet98fvgVniQM8Kqw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/10] wic: bugfixes & --fixed-size support, tests, selftest: minor fixes
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
X-List-Received-Date: Mon, 14 Nov 2016 14:37:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 3:07 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 14 November 2016 at 14:03, Maciej Borz=C4=99cki <maciej.borzecki@rndit=
y.com>
> wrote:
>>
>> TARGET_ARCH is in fact not exported as you have indicated, there's this
>> piece in meta/conf/bitbake.conf:
>
>
> Ah yes there's a bit of bad interaction between unexport variables, the h=
ack
> that is -e, and the even greater hack that is get_bb_var.
>
> I actually have a patch to change the -e output, I've just noticed that i=
t
> will break selftest as that makes assumptions about -e output, but it doe=
s
> solve the problem that you can't reliably use get_bb_var() on unexport.

I suppose that settles it then. I will stick with HOST_ARCH in v3 of the se=
ries.


--=20
Maciej Borzecki
RnDity

