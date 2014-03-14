Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB716F873
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 19:11:51 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id jz11so3141730veb.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=1Nzrj4XBk15QE4s2fL1jNXthwc3BajfCG4lsBZrudBg=;
	b=Na/anVLQ40Dns/0KBpOEGtzVeYbzeFpWMIA3ks9hEH5kxXFRHxkVmQyPZ/gkUNPV6h
	hkeyO4cJd6A8n7bT5XsgRy/EefUi0usz46gDEafDtThnKnP0t5QyOTJoDT8IZJ0xOaBb
	ojALA2iT3xktOMCuCj0ALbOYJwb2XMmnOtXm2a/v4INlk1xR0CUqN3RqsamckGqu8vHH
	BOY236YntxZlpXv/nVfWp6bMBp+jjlIhfjk0f24b0z5g+ql/mqpDriVGpL6oVTa1voIX
	X+tV37rQzz7DhxsAY3GOhehy6wwiWzNXWnr0f0ngnvmbgfCijLWxX2HGt3CPofZZENxa
	fPMA==
X-Received: by 10.52.18.70 with SMTP id u6mr6518906vdd.11.1394824312563; Fri,
	14 Mar 2014 12:11:52 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Fri, 14 Mar 2014 12:11:11 -0700 (PDT)
In-Reply-To: <CABcZANkrJYK7xgf=A=WcL9+xHbX1=jTkcDGs=pC3wjpwS-G3sw@mail.gmail.com>
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
	<CAMKF1so_=HgkVWr4ftsFny+9ipZ-Yy4PSRXx+=b=Z9NQAq1GaQ@mail.gmail.com>
	<CANyK_8euVvKOgKbKGmYwwGnYwC+w=L8EFEfCdMy==+qBEnhrTA@mail.gmail.com>
	<CAMKF1sp0WUMyC8zsnQEei8=azDsy5xpM9UWUUsnw5rNqjytWVQ@mail.gmail.com>
	<CABcZANkrJYK7xgf=A=WcL9+xHbX1=jTkcDGs=pC3wjpwS-G3sw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 14 Mar 2014 19:11:11 +0000
X-Google-Sender-Auth: c0iYoYmKmSTZxGjRGRpBMmK0o4Q
Message-ID: <CANyK_8ex42HU9pDjkMri4vCs7hyGQTSk4eZ_dB25NXSXRY3JSA@mail.gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dylan] Backport request
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
X-List-Received-Date: Fri, 14 Mar 2014 19:11:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 14 March 2014 19:06, Chris Larson <clarson@kergoth.com> wrote:
>
> On Fri, Mar 14, 2014 at 11:46 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Fri, Mar 14, 2014 at 11:44 AM, Paul Barker <paul@paulbarker.me.uk>
>> wrote:
>> > On 14 March 2014 18:37, Khem Raj <raj.khem@gmail.com> wrote:
>> >> On Fri, Mar 14, 2014 at 11:34 AM, Paul Barker <paul@paulbarker.me.uk>
>> >> wrote:
>> >>> I'm stuck using Dylan for a project as I need a 3.2 series kernel.
>> >>> Building on my current development machine I ran into two failures:
>> >>>
>> >>> eglibc-initial, do_configure: Make 4.0 isn't recognised
>> >>>
>> >>> This can be fixed by backporting
>> >>> a678243d6e4add90c1e9459da42de34d3724db5d (already in Dora).
>> >>>
>> >>> linux-yocto_3.2: do_patch: Unsupported version of git (1.9.0)
>> >>>
>> >>> I fixed this by removing git-native from ASSUME_PROVIDED in
>> >>> meta/conf/bitbake.conf so that git-native-1.8.1.4 was built and used.
>> >>> That isn't something we should commit in Dylan but may be useful for
>> >>> others to know the solution if they run into the same problem.
>> >>
>> >> I think if you also lock your build machine OS along with yocto
>> >> release, it is less painful.
>> >
>> > It is definitely less painful. I'm lacking the spare hardware though
>> > and I want to avoid building inside a VM if I can as I'll be limited
>> > on how much RAM I can allocate to it and I think the performance will
>> > take a hit. Thankfully this project isn't far off end-of-life now.
>>
>> I use containers. systemd-nspawn goes long way
>
>
> Yeah, containers (systemd-nspawn, docker) or even a chroot can be
> invaluable. schroot on a debian machine works quite well too for something
> as simple as builds. I end up aliasing bb and bitbake to transparently run
> in the chroot at all times.

It's time I learnt how to use these newfangled containers then...

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

