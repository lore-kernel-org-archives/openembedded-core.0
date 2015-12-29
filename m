Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id A147462133
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 20:40:38 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id mv3so137796806igc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 12:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=g49EbUo0rigi1f3zEQHywPTu+AP9zDvRuQlxA4P26I0=;
	b=TRyZ2Xwsi9PxnuZ2RAROTxw4Sd0m1bkZziDTj9W51uF1FU3vj8yeeplOcFIIOLqTB1
	LLw9gOsZSkevjFrOcgABdFtieIT3WL3ts0+j2fooLZ8Q5sbNK6oj84tETrnq2El+yeZf
	epdrdeaXlD6g9VB1W5npmhqLXKziRrgefjMC0ah3MInopcKqeSQ0A/w+yi8M2wj8js19
	jqeVZtiLR19f0c5BZ0YyFT3p6V08luefJyaAq2PYUSVAa/UbNel1C5RV57kqUiHjZmi3
	G+MEkxDkI2onm2v+KiPUADn0IRMtc8RxcIlLUTki1Ur2kJi7pYEOat4ZNtddpeRyrvz8
	uHLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=g49EbUo0rigi1f3zEQHywPTu+AP9zDvRuQlxA4P26I0=;
	b=MAnvkXJ6LjlCGyrvzBGeE9q9N/3nU0GnTl1uLpDtBuDJlY3bjWQSmcs/IgrzaSw8UV
	bhjlGoX4KIjvYycTyRugwhQFLgi48o5indM1lWh6tEAjU2dxOm/TQfnsb1UXfCzPVAd1
	/hBwYFZuCxhxbusDCP3YmC/e+1fZt6w5kmIvxzoLqfEC39k7r46bbgGgCSKsThrD5Z4N
	Br3lKTzLpDpkV6vQ+26f1tsi+uwtWwCrFcxWr0PomahTSpVgfgFLRlOocp53ebCdMRYW
	4JOJoH4NqPeE5emsSeVqlBy12sLzEU/2IjIt00sse/u0+dxNjHYtHX/ykPTkRvv8DPsJ
	mVmA==
X-Received: by 10.50.131.201 with SMTP id oo9mr20496048igb.68.1451421638881;
	Tue, 29 Dec 2015 12:40:38 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.104.194 with HTTP; Tue, 29 Dec 2015 12:40:19 -0800 (PST)
In-Reply-To: <CAH=96PH06f+uQqNVed2Tz_z1rNB3-nLO8xgxecq9SmOU4rK=vw@mail.gmail.com>
References: <CAH=96PH06f+uQqNVed2Tz_z1rNB3-nLO8xgxecq9SmOU4rK=vw@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 29 Dec 2015 13:40:19 -0700
X-Google-Sender-Auth: VAr2A9wUTTHeLjIK20X5a2Jnvfo
Message-ID: <CABcZANmh8C2WDd_=zvZBPuFPvDX8w_tT5u0=Da_RTbSOs8__7A@mail.gmail.com>
To: Logan Buchy <logan.buchy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multiple recipes sharing the same source
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
X-List-Received-Date: Tue, 29 Dec 2015 20:40:41 -0000
Content-Type: multipart/alternative; boundary=047d7b2e47c8347a6a05280f6f70

--047d7b2e47c8347a6a05280f6f70
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 29, 2015 at 1:30 PM, Logan Buchy <logan.buchy@gmail.com> wrote:

> I've got a third-party SDK given to me by our SoC provider.  The SDK
> contains
> * Vanilla Linux kernel with a set of patches that adds drivers for SoC
> peripherals
> * Proprietary bootloader
> * Proprietary binary libraries
> * Proprietary firmware for on-chip peripherals
> * A build system which compiles everything
>
> This SDK comes a a big tarball.  Splitting the tarball into separate
> tarballs is not desirable since this would need to be done every time the
> provider issues an update (which comes as another big tarball).
>
> What I have now is a recipe that compiles and installs the entire SDK,
> which works alright but I am looking to split up the SDK into separate
> packages with associated do_configure/do_compile/do_install tasks.  For
> example, I would like to split this into packages that provide:
> * virtual/kernel
> * proprietary-binary-blob
> * soc-kernel-drivers
> * proprietary-firmware-blob
>
> What I am wondering about is how would I go about writing multiple recipes
> that share the same tarball without having bitbake untar it for each
> recipe.  Is this even possible?  Are there any examples of packages that do
> this?
>
> My best guess about how to go about this would be to create a class which
> defines a do_fetch/do_unpack routine and then for each package, inherit the
> class and define custom do_configure/do_compile/do_install routines.
>

See the gcc-source recipe and gcc-shared-source.inc.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b2e47c8347a6a05280f6f70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Dec 29, 2015 at 1:30 PM, Logan Buchy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:logan.buchy@gmail.com" target=3D"_blank">logan.buchy@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I&#39;ve got a =
third-party SDK given to me by our SoC provider.=C2=A0 The SDK contains</di=
v><div>* Vanilla Linux kernel with a set of patches that adds drivers for S=
oC peripherals</div><div>* Proprietary bootloader</div><div>* Proprietary b=
inary libraries</div><div>* Proprietary firmware for on-chip peripherals</d=
iv><div>* A build system which compiles everything</div><div><br></div><div=
>This SDK comes a a big tarball.=C2=A0 Splitting the tarball into separate =
tarballs is not desirable since this would need to be done every time the p=
rovider issues an update (which comes as another big tarball).</div><div><b=
r></div><div>What I have now is a recipe that compiles and installs the ent=
ire SDK, which works alright but I am looking to split up the SDK into sepa=
rate packages with associated do_configure/do_compile/do_install tasks.=C2=
=A0 For example, I would like to split this into packages that provide:</di=
v><div>* virtual/kernel</div><div>* proprietary-binary-blob</div><div>* soc=
-kernel-drivers</div><div>* proprietary-firmware-blob</div><div><br></div><=
div>What I am wondering about is how would I go about writing multiple reci=
pes that share the same tarball without having bitbake untar it for each re=
cipe.=C2=A0 Is this even possible?=C2=A0 Are there any examples of packages=
 that do this?</div><div><br></div><div>My best guess about how to go about=
 this would be to create a class which defines a do_fetch/do_unpack routine=
 and then for each package, inherit the class and define custom do_configur=
e/do_compile/do_install routines.</div></blockquote></div><br></div><div cl=
ass=3D"gmail_extra">See the gcc-source recipe and gcc-shared-source.inc.<br=
>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at ker=
goth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer -=
 Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--047d7b2e47c8347a6a05280f6f70--
