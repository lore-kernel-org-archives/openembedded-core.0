Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 116C16C132
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jan 2020 03:47:40 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id d71so21448685qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 19:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R9F7KJzjIX+xED8pHUJ4GAdFYeXgB/iTaq4sfkpDr9A=;
	b=e1A09vptUcTerPKGeo4wI6OsBw7TU03Fmr36jU7tBVY+OFG82NIePvLKegcV89m9Vs
	EopItqhXGrweRvjuqKbc7u41YRZV4cUGf7wFEyfOL3aqfRcclPLGyMHYe4909N51eRxw
	+lODw9Uw7tHJTJZxuKLxc1K1QuJfzpoMA5UzBYy/7A7l2OpD9+AJOQlYmQRd7GWEHTuY
	ldiMw4As2/Q6GEcbOsilMYuzrfvY45QCSFdQIteKtY8ThWzKVq3cs76CyDXmZ082GepN
	dmCwaqNKTZAAWhvR0RgTPk0ZYvCFd3FS9SMd5sxXX9zT5a8pL29HwDtwGGLXjW1v/xPU
	I4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R9F7KJzjIX+xED8pHUJ4GAdFYeXgB/iTaq4sfkpDr9A=;
	b=HgM5KKwXtZz3MPI6pICCmmkySqT5yruZ1AOgggsl1+V2PGXA2mvzSL0/o+R4ZKD9Ry
	Q9hDCYVTC+Ga/H3WoWkCjahnIz1rKmDpef8Mn1CjiERByqaNRF+dG8cr8AjCbhHPGxKH
	CAueAA+fr1R6ouxvqWDnt0/CS2iibTP/jeDELq+CB+yiyfEbciQhWwZl8b8HGyRS4VIz
	JTJoOO/hWIKTa2FAcnOHcD1FLcEUg9jBh71F+f/MexUQ5wUjikBn8gIbm7nMlGEviKTU
	WDMaFjpwnGBqQwTn/OvVY/Engj5lqpCCVPEYOsaTPC++Hd//v8WWCUhir/8lrV6/XKtm
	K/Mw==
X-Gm-Message-State: APjAAAUkSY/NR1xcE3DY+d+qOXCD3YBW66ZHjWpo2IjQHOK+SYuvGm3h
	7fSr/gOehqRXV4eeCb1qBAQHWgS1U+Sh7ktC0J0=
X-Google-Smtp-Source: APXvYqx7EVYGd3oBntJigVgmR7ROgygInVNMsYtksFlJVe1f4vfDXHZkO//AssvHYeOta6U36bhspzlP1oY9YVgUiTE=
X-Received: by 2002:a37:de05:: with SMTP id h5mr62672720qkj.474.1577850461351; 
	Tue, 31 Dec 2019 19:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-3-alex.kanavin@gmail.com>
	<b4e0b39cda58583411b3e6c05cb0566053e6cdb1.camel@linuxfoundation.org>
	<CANNYZj9tf5c9_XOn1P-tTXSSHjKUSp6QMfsNYX_swJAp+h7Krg@mail.gmail.com>
	<CANNYZj-mywh64iuGoUPVkMTJm8ka4m4a6UYVY3cOd2+hVvU62A@mail.gmail.com>
	<CAMKF1sojJ_biZa2cN6iJP_HFk-U5snWi3pojfyv1LKR1jNP22Q@mail.gmail.com>
	<CANNYZj9H7kj6x+GsUc5q23tBGz+Jh7YJz79V44wC-rUD0Q3Dew@mail.gmail.com>
In-Reply-To: <CANNYZj9H7kj6x+GsUc5q23tBGz+Jh7YJz79V44wC-rUD0Q3Dew@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Dec 2019 19:47:14 -0800
Message-ID: <CAMKF1sp02J_cnFNRL=FeB6bJXDbJukQLv1cXx_TmxxnymD_4tw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/30] gettext: update to 0.20.1
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
X-List-Received-Date: Wed, 01 Jan 2020 03:47:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 20, 2019 at 5:10 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> hddtemp is dead upstream and hasn't seen an upstream update in 14 years, so prime candidate for removal.
>
> gtkperf is similarly ancient, and gtk2 only.
>
> netcat is just as ancient, and superseded by netcat-openbsd.
>
> A patch for the other three (sharutils/indent/enscript) is now on the oe-devel list.
>

I have fixes for hddtemp, gtkperf and netcat as well as vorbis-tools,
so now we are left with one package
udisks2 which seems to be exposing a bug in gettext see

http://errors.yoctoproject.org/Errors/Details/301238/

The relevant discussion is here

https://lists.gnu.org/archive/html/bug-gettext/2019-05/msg00125.html

we need to backport

https://git.savannah.gnu.org/gitweb/?p=gettext.git;a=commitdiff;h=2336451ed68d91ff4b5ae1acbc1eca30e47a86a9

to gettext which should help above case.

I have cooked up a patch and sent it to ml, it should apply on
oe-core/master-next

Please give it a whirl.

> Alex
>
> On Fri, 20 Dec 2019 at 09:18, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Dec 17, 2019 at 8:02 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > On Mon, 16 Dec 2019 at 14:25, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> >>
>> >>
>> >>> In an effort to try and get to the bottom of which patches cause which
>> >>> failures I ran the gettext updates pieces by themselves (patches 2-5).
>> >>>
>> >>> systemtap fails:
>> >>>
>> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1354
>> >>>
>> >>> the main a-full build in case there are other issues:
>> >>>
>> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/580
>> >>>
>> >>> I know there is a fix for the check-layer/mingw pieces in master-next
>> >>> of meta-mingw, just forgot to set that branch.
>> >>
>> >>
>> >> Thanks, there are also failures in meta-gpl2, for which I will also make patches.
>> >> Systemtap issue is now fixed.
>> >
>> >
>> > I have now sent the meta-gplv2 patches to yocto@ and the patchset for gettext+systemtap here.
>> >
>> > Alex
>>
>> few meta-oe failures with poky/master-next
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/173/steps/8/logs/step1b

