Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id B08CA60553
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 16:04:04 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f8so32730566qta.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 09:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=PQ4SKnM7FwWpPi+3vTw+YoFvd0vwWBhVqVuhdumNdY0=;
	b=s9ldj6LXX1ch+CpWAxKp+nX9W1RI8q7AGvjCOe97oOGtbj2GYyZlDQezkhGqlg1N3p
	PCKW+FSReb52rVbB4Gra1n+oboTaLhXGtK7XTftueM4m8OlI6btRPdBTWXrEeTvpsRhl
	XFsWwCEa6QXkSOxRmntltT1N34TtvryoigUpIscXECpaKg0wjfqlPBOYOrV53r9DxPSS
	HtPwxuXHfHCL24YeqvC+/oJ/009DZy9gKGPrAUn48zaJLdlsTgsOaupyI3yIgKsTGFvQ
	DCalnkvN1heagn+AnAbjUDGPEIanUy0y9fzjW21s4cF/6Sqk/Ryw4EXPq0pXhqJZ8U+z
	5bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=PQ4SKnM7FwWpPi+3vTw+YoFvd0vwWBhVqVuhdumNdY0=;
	b=MDLWFQHUTk0RkHEiM3G2vp6UdKYCT6k8qxwNpjXlHF0Oo286auaTq8PU1g/pzW45uJ
	MCAZSa0K59AMQCooF6VGMgnDyc0WOGYuouUxNZedDNRB/urOS0V0DfBxhPq7Er3638xZ
	Af2W2gOGWCZg9GRLz9daH/k2VVHN96bIz4RftyJCjFqvF5nuNHW6V8WVrZWjAzcErWoH
	9PpzVzI3l/3vMwSpwoVU/Mewez+tkn2p0B4AU3quxF6L7sMtVrn52tlglz+yeAO1MrDU
	WWXM8XdXBSaZGxY751zCH7cFxyYurb6dzdIYlnedQbqpzLLUNOlYJK56aKpO0r6byG2N
	Sq1A==
X-Gm-Message-State: AMCzsaVttKaBdrvyMfFG7YupWodJz2axXPJITzbh9TDBU1NRM9fssHs5
	b64e9FIFXAsO+4dBeHHtfXs6bzpx
X-Received: by 10.37.54.13 with SMTP id d13mr726790yba.477.1508169845016;
	Mon, 16 Oct 2017 09:04:05 -0700 (PDT)
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com.
	[209.85.218.43])
	by smtp.gmail.com with ESMTPSA id x2sm3975010ywj.46.2017.10.16.09.04.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 09:04:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f43.google.com with SMTP id v9so25890232oif.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 09:04:03 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SnmaYBOXvEmI30mz04XNC3kyuVxT5ruE5OlJ03fhNkA/39Qdr/eX07FHFqaC8eM3jWE9gze/2QyTZ70cfnkt4=
X-Received: by 10.157.22.187 with SMTP id c56mr683532ote.364.1508169843119;
	Mon, 16 Oct 2017 09:04:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 16 Oct 2017 09:04:02 -0700 (PDT)
In-Reply-To: <CAMKF1sqt+oPS4acyBVX7qm9bb_1k3nRW8MuSckrmwAJFE+qC6g@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-6-raj.khem@gmail.com>
	<06c9bf77-9781-f521-c450-c46f985c7dd3@gmail.com>
	<CAJ86T=Wr_u_x8Zn2n5SX2C8dyO1vbpMFX=3ufZA8X_gtG53p6w@mail.gmail.com>
	<CAP9ODKp1H_netdtLEs_thSGNJRfcOETwU6O+b4zfHe+ZSg=w2A@mail.gmail.com>
	<CAMKF1sqt+oPS4acyBVX7qm9bb_1k3nRW8MuSckrmwAJFE+qC6g@mail.gmail.com>
Date: Mon, 16 Oct 2017 14:04:02 -0200
X-Gmail-Original-Message-ID: <CAP9ODKra3W86NOWEvSqZ_72jTw=_dQp5ujYap+S-du-voQY_rA@mail.gmail.com>
Message-ID: <CAP9ODKra3W86NOWEvSqZ_72jTw=_dQp5ujYap+S-du-voQY_rA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] gcc6: Upgrade to 6.4
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
X-List-Received-Date: Mon, 16 Oct 2017 16:04:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 16, 2017 at 1:50 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Oct 16, 2017 at 4:53 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Sun, Oct 15, 2017 at 5:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Sat, Oct 14, 2017 at 10:21 PM, akuster808 <akuster808@gmail.com> wrote:
>>>> why do we continue to maintain 2 versions of gcc?
>>>
>>> Probably the same reason why Buildroot continues to maintain 4
>>> versions of gcc, it's useful for end users.
>>>
>>>   https://git.buildroot.net/buildroot/tree/package/gcc
>>
>> We keep all user space and toolchain up to date so upgrading the GCC
>> is straightforward.  That said the gcc cannot vary from one machine to
>> another so if a vendor wants to use an old release, it can be done
>> using their distro.
>>
>> I am against maintaining two GCC versions as it increases the amount
>> of testing needed. Instead I'd prefer to have clang merged on oe-core
>> instead and easy its adoption / test.
>
> In practice, there are a large set of applications that customers have porting
> to do when major compiler version changes (e.g. 6 to 7), unless there
> is a feasible path for upgrade people
> will refrain from upgrading to newer versions of releases. Its not a
> trivial task
> to upgrade systemdwide compiler in any distro. So its a good strategy to have
> two versions overlapping for few releases, this smoothens the migration for
> large application bases.

Agreed and rocko has this; for 2.5 we don't need to provide two
versions one more time.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

