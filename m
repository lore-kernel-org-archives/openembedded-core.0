Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD9C71AC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 19:55:18 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f4so197883wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KVjWAo1OEKI+UPGVvzi9AYB4/SCyZGboePsxa2SzEXM=;
	b=vCene90dTVojHVjQ/T6pcSA5AqPdUP0tHbFGbNwc8QMMxs8vYYePoOeBP9Cn7OYOX1
	ud1kOjacJQJlG9cggbIAS9Q/ng1s0SeFlTVXVP3dq+jiDC9dOUF0jd52ffIVwforJYCx
	nkveybgw62iuFuj7wSpCyIGi1G0SYdHWbTcm8ED3cLsHwqbbWWISV9Ms93b2MAHEx0qB
	Tod6tz81W5MK30D+8wki5GfoNGaL0CoKes9t3I5xJv0MouSFAyj/Palo2FlMy4MqZZj8
	RNtlpGuY0T+FvxpZqpqZvnIKAbcl8LcCJQi5DQD6HxrBMprrfN/OHNotej3COwnJJQTG
	9aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KVjWAo1OEKI+UPGVvzi9AYB4/SCyZGboePsxa2SzEXM=;
	b=j9nhdKQIORm/GoLa/yX1uFA798RrAf3o8fLD5y8iRye9t9Dx3rpthSXpAqmiqzE/OG
	iA1CAwuFq9e9bFlj4dYkNf60PjKTwMpo8BqxXMkFaOVVI0wvkZTEIWjGzf1hGVzBhwUy
	feqHFV6jmiCBnUxwiSuGy1wehp8DHw0vynaSix9EktwtcDuC//UAe3vE84CliLrQ3y1T
	jSHCJU6bm9Sj6g63hDq3SMXSNL+2jRK2y1+I0KaaJV/6aj8aS0Bb5C8TayFY/fFsVPON
	hGt5UjKexWlJRh2+VUWIy2QUtjcNowW7121LB789Xaukb1DV/vNbufsqVCVfDaUxF3j2
	vATA==
X-Gm-Message-State: AMCzsaUcXE22/m1AxsvreKtEQiJBfeN8DafTr97QajTnT9ptByKGhBzK
	6/qoPM2liZWgVOd0j2AKsGlYJZzp/Xx0L9oZSD0=
X-Google-Smtp-Source: AOwi7QAZ3b36tnJ/uX0yC1keAAaLof7ggCl1hvN2wYfFlk6RGGAMoWot53DxG1FaAoOQpBe4gOZ8+kQ7/bwWdQ/29Fg=
X-Received: by 10.28.65.133 with SMTP id o127mr13227559wma.146.1507665320017; 
	Tue, 10 Oct 2017 12:55:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Tue, 10 Oct 2017 12:55:19 -0700 (PDT)
In-Reply-To: <CAMKF1sobsTEyLA+8ade5ti8dZ5QeH-87qWw1Ot6fwb0Cw8oSRQ@mail.gmail.com>
References: <20171007172923.36429-1-raj.khem@gmail.com>
	<CAJ86T=X78ockUQ_9tVizxo4JZwbDQu9s0B2dG2ud50Xg6q=28A@mail.gmail.com>
	<CAMKF1sobsTEyLA+8ade5ti8dZ5QeH-87qWw1Ot6fwb0Cw8oSRQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 10 Oct 2017 12:55:19 -0700
Message-ID: <CAJ86T=Xw2VTOFKODCXR+UpMmUuTT-TaT75h4i9LiVz7mNiRt1Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-6.3: Backport patch to fix ICE on ARM
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
X-List-Received-Date: Tue, 10 Oct 2017 19:55:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2017 at 12:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Oct 10, 2017 at 10:59 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Sat, Oct 7, 2017 at 10:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Fixes
>>> internal compiler error: Max. number of generated reload insns per insn is achieved (90)
>>
>> Is there a plan to update gcc 6.3 -> 6.4 in OE 2.5?
>
> actually, I was thinking of not touching 6.x at all since it solely
> for backward compatibility
> so upgrading it might cause issues for users

gcc 6.3 to 6.4 isn't really an upgrade in the sense of any new
features, it's just bug fixes, some of which look somewhat important:

  https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=6.4

Since gcc 6.x is now well into the maintenance phase, I'd be inclined
to think that the risk -vs- reward odds of taking these upstream fixes
is pretty good.

>, and since we do not test
> it actively, we would
> not know them. I would rather keep it to the version we have once
> tested but I am open
> to maintaining an upgraded version if community thinks that is
> beneficial for them. there
> wont be any testing on it in 2.5 release cycle,

Just having the upgrade available to the community is useful, even if
there are no guarantees or testing. I've backporting gcc 6.3 into my
morty branch as it fixes build issues with musl. Morty with gcc 6.3 is
not a combination which was ever officially supported or tested
upstream, but I very much appreciate the fact that upgrading gcc 6.2
to 6.3 in morty only requires a few cherry-picks :-)

>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---

