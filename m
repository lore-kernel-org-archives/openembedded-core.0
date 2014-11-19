Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id BF4046AC93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 09:00:52 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id hy10so62476vcb.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 01:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=CyRwlr7iiKQYXLZu3txew049ziKq1T/WyHgsIa4GL9M=;
	b=ggUQiC3OejN1eOlFMfwTG4waAv9A6fwoa5qj2NMEYNeMPZtmMHAK1Jz01o8wAMYhBA
	SNH67L02WoHyXM8urEZl2d8hb26w+wFyvdUHhmXcZajrMAYVFE6atwd4ZFB7A5ulQOPF
	rCATlsL3tdsxRKVuMJV1cIgZgui5rflasRT5GbvVIvZ+KXugGfem6sNUXKhCci2HE6O4
	n+m9zfteHgNLu5fdGRx5afltggjdMyb5nFSnidwuaZxfaAW/Cq+GYJKX3fj/xenx4zv2
	JUSeXKoWEcJUSyykFmZKVftMN752x0Gn3rlmnNivFFNwu841d13EO3oIio1v1VFY9Vt7
	K5Hg==
MIME-Version: 1.0
X-Received: by 10.53.6.6 with SMTP id cq6mr30143998vdd.16.1416387652728; Wed,
	19 Nov 2014 01:00:52 -0800 (PST)
Received: by 10.52.178.6 with HTTP; Wed, 19 Nov 2014 01:00:52 -0800 (PST)
In-Reply-To: <CALbNGRQxMHoRLC0u2CbT90BfKVSWNRrovEwdr1ggSfzYkbgHAQ@mail.gmail.com>
References: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
	<1415346729-16760-3-git-send-email-schnitzeltony@googlemail.com>
	<1415458061.2820.23.camel@linuxfoundation.org>
	<1415528861.2820.25.camel@linuxfoundation.org>
	<CALbNGRQxMHoRLC0u2CbT90BfKVSWNRrovEwdr1ggSfzYkbgHAQ@mail.gmail.com>
Date: Wed, 19 Nov 2014 10:00:52 +0100
Message-ID: <CALbNGRQ_CjEnK_UAjrjAQtbEHYSGoK9gdTevF+m091stjZgn1Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] xserver-xorg: update to 1.16.1
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
X-List-Received-Date: Wed, 19 Nov 2014 09:01:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2014 at 9:32 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Sun, Nov 9, 2014 at 11:27 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Sat, 2014-11-08 at 14:47 +0000, Richard Purdie wrote:
>>> On Fri, 2014-11-07 at 08:52 +0100, Andreas M=C3=BCller wrote:
>>> > * first version supporting rootless X (not tested yet)
>>> > * modesetting working for non PCI gpus (tested on gumstix overo)
>>> >
>>> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> > ---
>>> >  .../xorg-xserver/xserver-xorg/crosscompile.patch   | 22 --------
>>> >  .../xserver-xorg/mips64-compiler.patch             | 29 ----------
>>> >  .../xorg-xserver/xserver-xorg/present-module.patch | 66 ------------=
----------
>>> >  ...erver-xorg_1.15.1.bb =3D> xserver-xorg_1.16.1.bb} |  9 +--
>>> >  4 files changed, 3 insertions(+), 123 deletions(-)
>>> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/c=
rosscompile.patch
>>> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/m=
ips64-compiler.patch
>>> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/p=
resent-module.patch
>>> >  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.1.bb =
=3D> xserver-xorg_1.16.1.bb} (75%)
>>>
>>> Whilst I haven't 100% confirmed it:
>>>
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/build=
s/96
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-logrotate=
/builds/95
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-skeleton/=
builds/95
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/b=
uilds/94
>>> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/9=
5
>>>
>>> all look like it may well be as a result of this change (which was
>>> included in the master-next build in question). This change will be
>>> delayed merging until we figure out if this patch is responsible and ho=
w
>>> to fix whatever the cause is. Obviously any help in doing that is much
>>> appreciated.
>>
>> It is 100% confirmed now, with the patch reverted there was a green
>> build.
>>
>> Cheers,
>>
>> Richard
>>
> Will look into this this week
>
'This week' is over and I don't find the time to look into this (and
my boss would kill me if I do) - sorry. So if somebody else wants to
take care - feel free.

Andreas

