Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wj0-f176.google.com (mail-wj0-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 473CE71DD2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 10:40:18 +0000 (UTC)
Received: by mail-wj0-f176.google.com with SMTP id v7so26300928wjy.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 02:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4qJP81uCV3C5aWE5QZ766ST5u9i0NPKFyslpqyjVW2I=;
	b=FJWrfdXyuVcCJiTvLGWaww3dKe0B3v0tOqlMSd29FwoXERggdVByMmh2wQCIzKzQ61
	m/IbWD4kqr0f5+qJY9urm7AChxM1WlTr+1xOXFF4LHb6jI+wAPh3W8jGN82iRFqxgdho
	Fyn1R4Mz4s3eFG0fvcfwQ9VR5cwZ16McQ0zXjZbqaIFuJ+QdodSyf2T8GbFRF1ldqOfi
	/LTGIj9mTphV/UDReF1ZQx3m1ugPPlYKeY9dEENjWsn5LeGQN0fEAl7325YNwp5u/6rA
	9XLwu1i20DMI+nuYlbw22X7iMYcYstZi+JgQqZEnfv6l59JD/Ce7W6DEzgZ65QPHCkIc
	Fulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4qJP81uCV3C5aWE5QZ766ST5u9i0NPKFyslpqyjVW2I=;
	b=Tarsg+ShYm12sJ5X+YoYWVN5CYo1HehKcEXec3hM+W6Ote7RttAWoyuehCmt3cc0/h
	6JPnjSvz5t6qE23RORNiSAnuedbQwpOheteRQj3GHJ+Sn8+fS+dgAVYdpFT5DiYwjPnF
	5xgmvJJ27GfBq2OJ1c5OizX7UxvNwX/5AvU7+J49bQPPEYpcNZazV9HVUEFCj71sj2Q1
	GhjdbJssfXskm0Z1HGv2+vg04St4ItC2LPfAVfKkBJbqEHk3ELCjm2kiYeHi4qRHbK4a
	ne5VnEt5tJ5ViJbajKznYYZOaqZBDe2P+nzg8+KpVlrjx66BRi6fgzUHFGq0du5tq5v/
	npsA==
X-Gm-Message-State: AKaTC03dfQm0hIgFBd+HMeH0Yg1qztWxB9MmfsWf/IS33g4qQO/w/nNAWfEtsep+fvcQmXzbsGgb1N5uu3vArA==
X-Received: by 10.194.231.8 with SMTP id tc8mr87357000wjc.193.1481712019933;
	Wed, 14 Dec 2016 02:40:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.10.69 with HTTP; Wed, 14 Dec 2016 02:39:59 -0800 (PST)
In-Reply-To: <20161213185317.GA6550@linux.intel.com>
References: <cover.1479970230.git.maciej.borzecki@rndity.com>
	<CAD4b0_LMUu4=kTEon3nk+_8-1+nG+zQsph9yPB-SNabahhKsbQ@mail.gmail.com>
	<20161213185317.GA6550@linux.intel.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Wed, 14 Dec 2016 11:39:59 +0100
Message-ID: <CAD4b0_Lqf98SyMapN=Tt18Ld5NyzkEU-FnobHQUOefMBY_mhXQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 0/6] wic: bugfixes & --fixed-size support, tests, oe-selftest: minor fixes
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
X-List-Received-Date: Wed, 14 Dec 2016 10:40:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 7:53 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wr=
ote:
> On Tue, Dec 13, 2016 at 09:07:30AM +0100, Maciej Borz=C4=99cki wrote:
>> On Thu, Nov 24, 2016 at 8:08 AM, Maciej Borzecki
>> <maciej.borzecki@rndity.com> wrote:
>> > v5 of a patch series previously posted here [1].
>> >
>> > Changes since v4:
>> >
>> > * dropped `wic: selftest: do not repeat core-image-minimal` & rebased
>> >   dependant patches
>> >
>> > * minor formatting fix in `wic: selftest: add tests for --fixed-size
>> >   partition flags`
>> >
>> > [1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-No=
vember/129103.html
>> >
>> > Maciej Borzecki (6):
>> >   oe-selftest: enforce en_US.UTF-8 locale
>> >   oeqa/utils/commands.py: allow use of binaries from native sysroot
>> >   wic: add --fixed-size wks option
>> >   wic: selftest: avoid COMPATIBLE_HOST issues
>> >   wic: selftest: do not assume bzImage kernel image
>> >   wic: selftest: add tests for --fixed-size partition flags
>> >
>> >  meta/lib/oeqa/selftest/wic.py          | 123 ++++++++++++++++++++++++=
+++++++--
>> >  meta/lib/oeqa/utils/commands.py        |   9 ++-
>> >  scripts/lib/wic/help.py                |  14 +++-
>> >  scripts/lib/wic/imager/direct.py       |   2 +-
>> >  scripts/lib/wic/ksparser.py            |  41 +++++++++--
>> >  scripts/lib/wic/partition.py           |  88 ++++++++++++++---------
>> >  scripts/lib/wic/utils/partitionedfs.py |   2 +-
>> >  scripts/oe-selftest                    |   3 +
>> >  8 files changed, 234 insertions(+), 48 deletions(-)
>>
>> Is there any additional action needed from me at this point? A rebase
>> or a resend perhaps?
>>
>
> Rebase&resend would be nice as at lest one patch from this patchset is al=
ready accepted.
>

I will be posting a v6 later today or tomorrow.

--=20
Maciej Borzecki
RnDity

