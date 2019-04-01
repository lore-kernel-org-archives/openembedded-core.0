Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA936D688
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 00:14:21 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id f23so6479444ljc.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 17:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=xr7qntkH0iNs9X89T4VM8La/3aa1B5XDvs0h/5Igmck=;
	b=C9U/Wykk+9urReaW+fKIKJjfEAxVVOgAFjz1zVeSYZYkKtlgGoUenZb9YfmrjkplRi
	ArlEaEFmfHSH70x/7YMtN6zQ+QlTFEBlu2WTkotGqdekowPrjkKkRIKi2A4V/BGywaVZ
	mQUWAgyixgnA8Wpu1dw875cHVK9nAAV9BICt2bK83Bq/RX/1Scxb9Ar+K+Rd5Q3E0L+J
	975+6QK+FYjpwe1LyB5BvbU9Iivca38Bn5yTgrRfLqq3/GMK06yyKXrudOoYW8z66KTf
	lwLC7Gzo/H2sIX9o/kmMw0iMwjknAmGZIdXqQpOnOeFPODjnCt7+9GvqGZygOrYmI9I/
	hYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=xr7qntkH0iNs9X89T4VM8La/3aa1B5XDvs0h/5Igmck=;
	b=Tsktg4Wa/IsM++kyZXHdWo0EWn4mt07Cn+/nNStYSEYe8ZKmylTJM6R9uFcLF8/frm
	gk+b8x1zNa4IGzsQsZ+q2qPP/Q8Zk0npcRornJxIgxzNxBDTLBA9M1KtfjuDQGEzlOA8
	OYEr9hnRvMxpChZBBPSMCtF2U+WQOKW4YEuNIjWf6woMWP8caYO7QrgFxHgIwDjJYF7S
	Yu5yykFaZX5s+nKBS82f3pihcSVRq9Tn7sXJ6u8Iya4K9wiokC+owKIFCU3KRNz1lqBs
	Ijp95DPu5QW6uaPoIn1nB/sn7L+/22zRnumaLfwOB2eXtCG2E4WT8ErhM5YFLkTLG3WS
	moHA==
X-Gm-Message-State: APjAAAU1gfFjSj5di8o5plReZpWJX48Vi0FtzlKw38stKp7SZwMEYdgj
	uynrRv9wB4KurfeMy2PFTbUxcQ4Mqes=
X-Google-Smtp-Source: APXvYqw7R0vR1hiWe1Y2Ecvg516qoYUIzOA5oIp7CFvuOAKxgmnM+u28V7u9oPHJcig8dOMswNsM2A==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr21319485ljk.158.1554077662418;
	Sun, 31 Mar 2019 17:14:22 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id g6sm1736001lja.64.2019.03.31.17.14.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 17:14:21 -0700 (PDT)
To: Tom Rini <trini@konsulko.com>, Paul Barker <paul@betafive.co.uk>
References: <20190331155012.3085-1-open.source@oleksandr-kravchuk.com>
	<20190331201141.GH18421@bill-the-cat>
	<CANNYZj9QeaLU8AC03CmtczcVJ_jbuaL7gQEQ6HQVnDB82z+taw@mail.gmail.com>
	<20190331205613.GA4664@bill-the-cat>
	<05e3208a-24a2-4a6d-ba33-a23f00ffe41f@www.fastmail.com>
	<20190331223147.GC4664@bill-the-cat>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <b230699e-d926-afbc-2d3e-6bdcec402e69@oleksandr-kravchuk.com>
Date: Mon, 1 Apr 2019 02:14:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190331223147.GC4664@bill-the-cat>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] vim: update to 8.1.1097
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
X-List-Received-Date: Mon, 01 Apr 2019 00:14:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 01/04/2019 00:31, Tom Rini wrote:
> On Sun, Mar 31, 2019 at 06:28:31PM -0400, Paul Barker wrote:
>> On Sun, 31 Mar 2019, at 21:56, Tom Rini wrote:
>>> On Sun, Mar 31, 2019 at 10:19:51PM +0200, Alexander Kanavin wrote:
>>>> On Sun, 31 Mar 2019 at 22:12, Tom Rini <trini@konsulko.com> wrote:
>>>>> Looks better, thanks. Is there a particular fix / change you're doing
>>>>> this for? I ask since every commit is a version bump we might want to
>>>>> set a guideline of once a month or so for bumping vim to the latest.
>>>> It's a bit insane upstream is doing that.
>>>> Should we set PV to something like PV = "8.1+git${SRCPV}"? That way
>>>> devtool/AUH/RRS will not be reporting a new version for each commit,
>>>> and will only do that when 8.2 is out.
>>> No, we should follow what upstream does for version numbers, it's what
>>> other distros do. And on the related topic of "is it a stable branch?",
>>> it does seem like yes, it is. We should just remember to not update it
>>> more often than say the first of the month, without a specific reason.
>> When I've done vim updates in the past I aimed for once every 3
>> months. I also looked at Debian/Fedora/etc to find a version that
>> someone else has already tested in a distribution - with vim having so
>> many "releases" you have the same issue you'd get from picking a
>> random commit off the master branch from another project. Matching
>> against a version used somewhere else gives us something to compare to
>> when we hit a bug.
> That's also a good idea, yes.  My only concern is finding something
> moving forward otherwise quickly enough, but Fedora might do well for
> that.

I think it is indeed a good idea for maintainers to look up for stable
projects, e.g Debian.

It would be nice to have those guidelines set and clear though.


