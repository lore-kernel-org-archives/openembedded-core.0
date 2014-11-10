Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id E1AB565D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 08:32:39 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id a3so5041288oib.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 00:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=xU0fDkuNJWaHwkERrbkY59SwpHIJOpRoIRc5NJ/hBmE=;
	b=AktTtAuiBoX0U6nRH5bay+HpiQr4UQBLiuRk3txHWrWt8csZyPvx3kIHAB5KQHkJY0
	Lm2rhCHRCzi0IYqeHLDoYp2YESxza9StHxT/tlSy2wx7/qKfaFv3BSPXVR1e5Xkbuvi3
	EwNbLYhfcITQFaB+PC4KsoG597PLz+asgbMNB0+1lMGW8Pgw6WUYX9oBdbj9yj358czF
	1ta3+L2f/FH6yiW0H+kbtUDNICoAElRhZJx6k2vixiA4rkvAf3uU5VPQY4/KNSAvU262
	81sKnup2uaOkW1KBVlTJQkKZMFq0uMLyj3bc7UwKRb4JAtw4smEaYDxoolMNwmja/3u+
	+9gg==
MIME-Version: 1.0
X-Received: by 10.60.134.20 with SMTP id pg20mr25411824oeb.36.1415608360485;
	Mon, 10 Nov 2014 00:32:40 -0800 (PST)
Received: by 10.202.67.84 with HTTP; Mon, 10 Nov 2014 00:32:40 -0800 (PST)
In-Reply-To: <1415528861.2820.25.camel@linuxfoundation.org>
References: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
	<1415346729-16760-3-git-send-email-schnitzeltony@googlemail.com>
	<1415458061.2820.23.camel@linuxfoundation.org>
	<1415528861.2820.25.camel@linuxfoundation.org>
Date: Mon, 10 Nov 2014 09:32:40 +0100
Message-ID: <CALbNGRQxMHoRLC0u2CbT90BfKVSWNRrovEwdr1ggSfzYkbgHAQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Nov 2014 08:32:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 9, 2014 at 11:27 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2014-11-08 at 14:47 +0000, Richard Purdie wrote:
>> On Fri, 2014-11-07 at 08:52 +0100, Andreas M=C3=BCller wrote:
>> > * first version supporting rootless X (not tested yet)
>> > * modesetting working for non PCI gpus (tested on gumstix overo)
>> >
>> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> > ---
>> >  .../xorg-xserver/xserver-xorg/crosscompile.patch   | 22 --------
>> >  .../xserver-xorg/mips64-compiler.patch             | 29 ----------
>> >  .../xorg-xserver/xserver-xorg/present-module.patch | 66 -------------=
---------
>> >  ...erver-xorg_1.15.1.bb =3D> xserver-xorg_1.16.1.bb} |  9 +--
>> >  4 files changed, 3 insertions(+), 123 deletions(-)
>> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/cr=
osscompile.patch
>> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/mi=
ps64-compiler.patch
>> >  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/pr=
esent-module.patch
>> >  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.1.bb =3D=
> xserver-xorg_1.16.1.bb} (75%)
>>
>> Whilst I haven't 100% confirmed it:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds=
/96
>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-logrotate/=
builds/95
>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-skeleton/b=
uilds/95
>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/bu=
ilds/94
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/95
>>
>> all look like it may well be as a result of this change (which was
>> included in the master-next build in question). This change will be
>> delayed merging until we figure out if this patch is responsible and how
>> to fix whatever the cause is. Obviously any help in doing that is much
>> appreciated.
>
> It is 100% confirmed now, with the patch reverted there was a green
> build.
>
> Cheers,
>
> Richard
>
Will look into this this week

Andreas

