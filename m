Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id CAB336067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 17:56:11 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n202so1584857qke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 10:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mIICeHV2TRhihn2wzzvcKzwyiYwmeTeE+fqo++2aOvc=;
	b=VDnMFwF9Ou22JC6BEg2tuza31ywW3XWLEvHON+9lT5/38/bDL/X/+9kedEVqyAhf2V
	BAI7z6hrpLqdfW2m4FEM6GfMp3UebCygv0Wy/e7x8hfOtUirrBYvP4y72NgB6tIkTwEH
	nmq98ZomSBQwfYjR7x5/WCFYH/55zGV5tDHtL9n3HUMcWYM/rumnuagd5K3uIH3cTnq2
	nuMKOlY3TtqoiyA8e+jc+MuJrU0h7USHH8epQtaMsm1viJ+IIdi+bHc5e//jqhaC9Lwf
	y8+4ADhbA6F7nExTCPbEgZHf4XMiirxn5eMCzwckobPFk7X9m5YKrP1swAziqT/xZ9X7
	Vx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mIICeHV2TRhihn2wzzvcKzwyiYwmeTeE+fqo++2aOvc=;
	b=PlTRS3u4OYfl96XIs9yLFo0bvFmADRyLWWSpDQQJoOvxVyE82xO2nJ/1a8oQm4QtzB
	9PcGfR82OrvbGueqE1ZZXZACD7rekjuT221kUlWf4NyJMZ4mnhmK0K9HXYLUZh4uud3u
	ILuMemXFrYdz8Gt3SNkmlOG+lN/rHez98cygq8tAt168j1dx3NAEilTn/UnYJoFrTkLm
	7j90l1SRq05fBflnoysRR2kV9qCc2OMczQwzZdNlkPtMdV8wVp7hun9DU1t5ea/bivM0
	yC5G9J09t9oJCw9qxqT8VHd7l/xwBm47VIu3CnylVYtzwMC2RYaN5DEdc47pR7l0eGn5
	GySw==
X-Gm-Message-State: ALyK8tJSlUpJXDrXINiFABu6FANsDqfS3TGlej8eJsiy2ViZIRvNQJ2DDP876wgv8RYrAEs3LqCfWUA3CrwVmg==
X-Received: by 10.55.97.80 with SMTP id v77mr12399450qkb.41.1468432572223;
	Wed, 13 Jul 2016 10:56:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 13 Jul 2016 10:55:42 -0700 (PDT)
In-Reply-To: <1468404872.23527.7.camel@andred.net>
References: <cover.1467914773.git.raj.khem@gmail.com>
	<cee6d405-3fdf-157b-967b-91022d5e9b9c@linux.intel.com>
	<CAMKF1sp+XRQ5bUd-8387q5PcWuQRspRj+UJS9LkuGGhr1WPw6w@mail.gmail.com>
	<aa5165d3-c97f-3a37-73b3-31cd5cc704e9@linux.intel.com>
	<1468404872.23527.7.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jul 2016 10:55:42 -0700
Message-ID: <CAMKF1spdhS2dQTRWDUChjVnSX+Bh_=-7mhFzUbKVoCKVu=+ZUg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] musl/glibc/binutils updates
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
X-List-Received-Date: Wed, 13 Jul 2016 17:56:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 3:14 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Fr, 2016-07-08 at 17:19 +0300, Alexander Kanavin wrote:
>> On 07/08/2016 05:07 PM, Khem Raj wrote:
>> > > > Fix gcc5 hang in SDK with -mmusl
>> > > > Update musl to 1.1.15 release
>> > > > Update binutils to 2.26.1
>> > > > Update glibc to latest on 2.24 freeze tree
>> > >
>> > >
>> > > What about uclibc? It should be updated as well.
>> >
>> > I do not test it regularly. If there are users who want it we can
>> > continue
>>
>> Maybe we should reassign the recipes to Andr=C3=A9 Draszik then?
>
> Thanks for thinking of me :-) I do have a plan to move away from uClibc a=
s
> well, though.
>
> Ross, so if consensus is to remove it from OE, I don't really have a prob=
lem
> with that.

Ross send the patch please

>
>
> Cheers,
> Andre'
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

