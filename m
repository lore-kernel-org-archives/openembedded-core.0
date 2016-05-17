Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id CEA23766A3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 14:57:48 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id w36so9433027qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 07:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wwPkwejref/G3ateM2Jjv6n3xfXXIJcCN7YFshVpyKg=;
	b=YMsRRKT2E0SY+ycCNxyz81yQDrdlneu23uddB1LN11xyRVS07M720GmlocMON6mOFQ
	rPT3btjB4Nfj1KNBZULq9w7nqXsWNhcIprulqeefAyxOXIBuSUn7qksFlAAkmdBBvurw
	1mbu6Y1OsO2sF2b2e9HLR5YbBzMgIrH2xVOL+Wkc7NORbtg2tgQ0ZQV+BALqNk7Zbuv8
	0/ci5n0p4P1k8V7XkjqzLREUc2v+4g1CsC4LWkdOoklGyRTyhq54CLSFSJCAjotEVbJU
	Wd9b2IT1dPdSr1SHz4Dhz3DEcPrwjrH/BvOej9+L4F+0wSjn6/1e8xNSTYfr00qwe/uT
	LVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wwPkwejref/G3ateM2Jjv6n3xfXXIJcCN7YFshVpyKg=;
	b=MZduiI7maIawjBX+gUK2FIcc48JgFESwFFEFQa4Zr0mkeYGKYHI0A5nG0QplNK/Eom
	DSIM7dGCsCOCqs6HpNHs+xd7c5EM55m8LcDVcgswejG3gPLCxtk9GyP/8yXX/q1qyT/l
	0jW/7JggbIneWvpKOGnScxZ91tzaoBVVVha6DYB3o1cr2rbXXFlIF33YJOOCwKTCTNqX
	CQPEVQhtWTL8iD0pBq21ECMP+TvApr5APfuabf/fvJDfy8k4LQaw26QzpFkF4VZzPluD
	OL1W5ORetoZQVeVDjHWyCx7D/9k/6r5zUMYX62QmdeWaRqkyYeuCG4AKYZ3tCKRtbEuW
	KmXw==
X-Gm-Message-State: AOPr4FWavIH7H83dcLXai56t6eq7WqY6mI2SEAhE953CufxyJcnmKBJ0fJr0lT80+oauIcjoiQ/LKHdDz6KxgA==
X-Received: by 10.140.204.204 with SMTP id z195mr2052974qha.41.1463497068938; 
	Tue, 17 May 2016 07:57:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Tue, 17 May 2016 07:57:19 -0700 (PDT)
In-Reply-To: <CAJTo0Layx=y-gVv0vVFTKTKu7pud81+ExzKKC7GT1mBZeBcj3g@mail.gmail.com>
References: <1463415451-21779-1-git-send-email-akuster808@gmail.com>
	<C6187355-EA77-4B31-8638-C5D64613DE0E@gmail.com>
	<573A8171.50002@gmail.com>
	<9A2A2982-674F-4453-935D-DFA3FDD3DB4B@gmail.com>
	<73863eef-56c3-9085-7aa2-7408d52a5355@gmail.com>
	<FA10CE49-93CB-4CB9-9F20-F8F5396020DC@gmail.com>
	<573B1A78.7070907@gmail.com>
	<CAJTo0Layx=y-gVv0vVFTKTKu7pud81+ExzKKC7GT1mBZeBcj3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2016 07:57:19 -0700
Message-ID: <CAMKF1spVr4PxGVPUJx0rnv7G8k_QBPYmXQXta-rPoK6-CtKfKw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][krogoth][PATCH] python-numpy: fix build failure with python-matplotlib
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
X-List-Received-Date: Tue, 17 May 2016 14:57:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 17, 2016 at 7:22 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 May 2016 at 14:19, akuster808 <akuster808@gmail.com> wrote:
>>
>> Sorry, missed this email last night.
>>
>> Not sure what you mean by generated. Both config and _numpyconfig.h are
>> files that reside under an "arch" dir and brought in when building. I
>> don't know why this needed to be done this way. Don't you recall, you
>> did a patch for this package too ; ) Maybe Ross remembers,  his
>> fingerprints are all over this package.
>
>
> I just beat it into submission when it moved from meta-oe to oe-core.  The
> config and numpyconfig crazy already existed and yes it's hideous but I was
> worried about changing something so fundamental.

Thats fine. I was just wondering if we are caching things which could
some how be generated.

>
> Ross

