Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 60C206F770
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 18:46:58 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id uq10so20947987igb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 11:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NHl59GLScnUw9qhKvC/XX4Badvb4nEogq8sXIIHlZeo=;
	b=KC1DU1xeXq6uucy/Ts1zWxRrBEZEtXAk/0GCUUGUuNQZCYXYDi4sp9x9fOcXOeE0ns
	737O5RgUC2JMBR6h5MYoCFfwxxRyPuFceS2Nl5KAy9RqTwl81nT5wXYs+9lCtpBvM7UJ
	7OQK8U06g8LEArKvO6Bh7X6v+J9IXUnes5P83kNWJhPOIN+UslS7XHWjabVG6nciMVJT
	tKyUqloBooza98l1qXYnZsSgMs1q4nsdTYrDfMnR9l2nRPY4DiAzcaNetLQAp57QMXKR
	TmBsVc6xiJncsycj6Mxe3kGPHrBeRC6yNMmcvisJP5yJEQ479AsNMvM3ukY+Npkdnuux
	TpOw==
X-Received: by 10.42.20.6 with SMTP id e6mr7750763icb.29.1394822819834; Fri,
	14 Mar 2014 11:46:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Fri, 14 Mar 2014 11:46:28 -0700 (PDT)
In-Reply-To: <CANyK_8euVvKOgKbKGmYwwGnYwC+w=L8EFEfCdMy==+qBEnhrTA@mail.gmail.com>
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
	<CAMKF1so_=HgkVWr4ftsFny+9ipZ-Yy4PSRXx+=b=Z9NQAq1GaQ@mail.gmail.com>
	<CANyK_8euVvKOgKbKGmYwwGnYwC+w=L8EFEfCdMy==+qBEnhrTA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Mar 2014 11:46:28 -0700
Message-ID: <CAMKF1sp0WUMyC8zsnQEei8=azDsy5xpM9UWUUsnw5rNqjytWVQ@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
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
X-List-Received-Date: Fri, 14 Mar 2014 18:46:59 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 14, 2014 at 11:44 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 14 March 2014 18:37, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Mar 14, 2014 at 11:34 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>>> I'm stuck using Dylan for a project as I need a 3.2 series kernel.
>>> Building on my current development machine I ran into two failures:
>>>
>>> eglibc-initial, do_configure: Make 4.0 isn't recognised
>>>
>>> This can be fixed by backporting
>>> a678243d6e4add90c1e9459da42de34d3724db5d (already in Dora).
>>>
>>> linux-yocto_3.2: do_patch: Unsupported version of git (1.9.0)
>>>
>>> I fixed this by removing git-native from ASSUME_PROVIDED in
>>> meta/conf/bitbake.conf so that git-native-1.8.1.4 was built and used.
>>> That isn't something we should commit in Dylan but may be useful for
>>> others to know the solution if they run into the same problem.
>>
>> I think if you also lock your build machine OS along with yocto
>> release, it is less painful.
>
> It is definitely less painful. I'm lacking the spare hardware though
> and I want to avoid building inside a VM if I can as I'll be limited
> on how much RAM I can allocate to it and I think the performance will
> take a hit. Thankfully this project isn't far off end-of-life now.

I use containers. systemd-nspawn goes long way

