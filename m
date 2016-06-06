Return-Path: <rm.santos.caldas@gmail.com>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 93717771CE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 11:35:10 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id b73so92478229lfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2016 04:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Une5MznZNZiWHIvCgS7abM6Z97sGIqFVr2XcFMyK2PY=;
	b=hAPShGPbyYSorkh94tPsFF/WuvxrQk7ANN01ENaZ3FFz3rJyY8DHnwGp4M/jTvKgTV
	u7TLAAJoavxU1i4Bse/hlmwwK21qoi8M/r6Y8r5nR9iaTeNoYOWyQ8ll4Bg0dwJQ2Ob3
	togWIXUSwVT9qyfCtG8LHp3qhzH5AArsZxFarolJtClE7axTYc1rf3Kko1UOLM+vjKfg
	Tb9NToiE6ixdewKVSH0BM2Qg43zr3n2ApdC/JAklEcI1UoBxd0R6uJ3A10+x+3dBYzGO
	LGOzlijzNn58F1srGUlVioKtbtqF8tcWmAZ6+mstr7M9cDkd2fgQTqFXESvuO/4OFOjx
	FJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Une5MznZNZiWHIvCgS7abM6Z97sGIqFVr2XcFMyK2PY=;
	b=dZYXuzoIfqsdqHtcUrtTvWSKgA1g2ofXE8nmJ2bsnPX80I4Cc4XFeXhUL7sYgINZuN
	QmArn30tty+HdL9SScIiLtkAbY6v4BklRPCsUCUElai4i/cdiyVc2qJZQ/vAU+xqGIHx
	CLOnX0PAO+kDVpi82xreQXRx18LAU+AmtSA+Nc+u9lzmu06+ks5FQOnOuhFvDEgMWSQV
	nGTnLBA2+RBVSD9zXWvXjYcaAKLlPBVqKlcJnGSJOdNcaKTxUSP/a23MA2WeuDGXoFPj
	BzyfhQ4ATLUO5VY0MNLplMusVrN33p18jg0ul9QKzugkP1n2JJHIP/fPllRpoYKqP2ZO
	Jp9g==
X-Gm-Message-State: ALyK8tLZGE/0QpiIh0rd3TyCFfDzjmEJP++LArKErDCSPNEvANXpG5ylvy36WPH5HH8KNjbai95mFYuy8vesGw==
X-Received: by 10.25.23.215 with SMTP id 84mr1341057lfx.200.1465212909998;
	Mon, 06 Jun 2016 04:35:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.207.149 with HTTP; Mon, 6 Jun 2016 04:35:09 -0700 (PDT)
In-Reply-To: <575128CF.8010308@pengutronix.de>
References: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
	<1464613445-18617-1-git-send-email-ejo@pengutronix.de>
	<CA+21M5DUAvp1csE=kARmE2Fg3SyfzxDO0L2GuBsvpSMjiiN2Xg@mail.gmail.com>
	<575128CF.8010308@pengutronix.de>
From: Renato Caldas <rm.santos.caldas@gmail.com>
Date: Mon, 6 Jun 2016 12:35:09 +0100
Message-ID: <CA+21M5CpZUbrxLMHYJ92jP+6xK7W6e41FX_f_dLS8OOf5ap2Eg@mail.gmail.com>
To: Enrico Joerns <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl-ptest.inc: fix tar call to prevent objcopy failure
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
X-List-Received-Date: Mon, 06 Jun 2016 11:35:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Enrico,

2016-06-03 7:50 GMT+01:00 Enrico Joerns <ejo@pengutronix.de>:
> Hi Renato,
>
> thanks for the comments on my changes.
>
> On 05/31/2016 01:35 PM, Renato Caldas wrote:
>>
>> My suggestion is that you submit a new patch with those improvements
>> on top of the quick fix I made. I suggest you also add quotes to the
>> --exclude options per tar's man page.
>
>
> I did not find any hints about quotes, where is it written? It also seems=
 to
> me that the man page in current tar (1.29) is a bit incomplete as it does
> not mention any 'exclude' option, anymore. At least on my distro (debian)=
.

You can find the man page online, this is the relevant section about
the recommended --exclude option quotes:
http://www.gnu.org/software/tar/manual/tar.html#SEC112

>
>> You might also want to simplify the commit message a bit. I'm fairly
>> new to yocto (and my view may be wrong), but this is how I would do
>> it:
>> - change the component name from "perl-ptest.inc:" to "perl:"
>
>
> Maybe "perl-ptest" would be ok, too, as it matches the resulting packages
> name.
>
>> - use the commit title to describe the change you made, not exactly
>> what bug it fixed. Example: "fix tar call according to its man page"
>> (or something like that)
>> - describe the change in simpler terms. Taking what you wrote, I would
>> rewrite it like this:
>>
>> "The existing tar call on do_install_ptest() did not match the man
>> page, but worked with older tar versions. The new 1.29 version of tar
>> has stricter argument handling, and future versions may be even
>> stricter. Failure to use it according to its manual may result in
>> arguments being silently ignored and breaking the build."
>>
>
> Yes, sounds good to me. And my original message does not match the remain=
ing
> changes anymore. Is it ok if I take your text, and add you as Signed-off =
for
> the patch then?

Yes, it would be fine, but your patch was already merged as-was. Maybe
next time :)

Cheers,
  Renato

>
>>
>> So while changing the position of the "*" fixed it for tar 1.29, your
>> proposed changes are important to future-proof the perl recipe for
>> newer tar versions. As such, please do submit a new patch.
>
>
> I will do so, then.
>
>
> Best regard, Enrico
>
> --
> Pengutronix e.K.                           | Enrico J=C3=B6rns           =
     |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
>

