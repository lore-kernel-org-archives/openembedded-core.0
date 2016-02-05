Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id BF53B7719F;
	Fri,  5 Feb 2016 12:02:11 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id mw1so12161075igb.1;
	Fri, 05 Feb 2016 04:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=z9SyM34OaWQAHFwr2HiHpDU8N3GeLHS7TysbSYcI4cM=;
	b=mxXK9DH8vAJf9RMnsq/OHfjtWaiA1QhzWnKv4yFEu+2VUEsnKn8HcQCVJ6FELwopej
	TrS+YPXpLuqW7l3zuYE8JISlFwASSw/u8S+2SCPQdCgv4ExN+DTmKkSppkeGcFDCksm0
	7/lXkoF7g53jmu0wX+Js751lFUNTpNcd3AGmdaf5EeJFZFlZdS3hKIBNVoGHCenNzRvE
	AJW7SK/iIObazq5A7932edA1K0uoFAEW97AUBDVNOALM3zE2SaLekg3vfKU4Uz9IrfdN
	cReoo8VUKIiOyz/fNIlOK1WPoxK5mG+0s8/2/DFOAVU4eWB7naqIGw5xYuehhGTjSeCz
	lPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=z9SyM34OaWQAHFwr2HiHpDU8N3GeLHS7TysbSYcI4cM=;
	b=Wgdkcj3dTi4C05C8XJugRxeTwDIl49NoADFFiJgcIqf6y9RQw2rkXuGQGgfiECtZ92
	+n2Adrvz3CwkptpZwaMdSpxBrPPDepEy31x8hZS8oeA+m36tDiWdrNZoqi7rl1i/p/XB
	7QU9QoKdYqOxm2iayja6yVzG9olIqVA7SH0Fs2IlDzEhFHqnHIPbRUa4crca9rKJ7oZy
	KotWMDuK5XXjiEmSuRpW9TTkyIBut/tNKNLVOyV8HiR0VDR9uGuDx34+mdZIO7I3fof6
	FEqqAyPyYzAL8jTezMnrbfr/25MQ1IVt0ZzxB6L9c+Cgy+HkaXXFyifr05l7DoaI8KbO
	xuvw==
X-Gm-Message-State: AG10YOTix6iddzLs96l2/oO3E6n7RRKOHlxoc6BlbTI5meJy/Pk+Y9Bcxm/sFXgy4rmxoRYE99V2E+o1uPhrNw==
MIME-Version: 1.0
X-Received: by 10.50.43.133 with SMTP id w5mr9253459igl.52.1454673731939; Fri,
	05 Feb 2016 04:02:11 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Fri, 5 Feb 2016 04:02:11 -0800 (PST)
In-Reply-To: <1454511012.27087.183.camel@linuxfoundation.org>
References: <CALbNGRRmD=4QUi=+_fx48M4GDB9VwTX5m5wH12j4ed1OK6SW6Q@mail.gmail.com>
	<1454511012.27087.183.camel@linuxfoundation.org>
Date: Fri, 5 Feb 2016 13:02:11 +0100
Message-ID: <CALbNGRRWrvs7JL6V8ePoofYvWU0Lxs-vBq1=qU2OE7syOOgDXw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, rehsack@gmail.com
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Language settings GTK (glibc?) problem
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
X-List-Received-Date: Fri, 05 Feb 2016 12:02:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 3, 2016 at 3:50 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2016-02-03 at 12:49 +0100, Andreas M=C3=BCller wrote:
>> Hi,
>>
>> while testing libreoffice language packets I found that language
>> settings for GTK based apps are broken. Interestingly QT based
>> applications (tested with qtcreator and lxqt) and libreoffice are
>> working fine.
>>
>> I did some research and hope for some expert with helping hints.
>> Details are:
>>
>> * I am testing with jethro environment
>
> I did wonder about http://git.yoctoproject.org/cgit.cgi/poky/commit/?id
> =3D3b5288f0a28205289063424afc474675cbaa05b8
>
> or possibly:
>
> https://github.com/rehsack/poky/commit/46ac36953e2e76ba716c7ba42ddfe41c9a=
19a11d
After seeing that Jens just sent this ^^ for Jethro, I think I have
read this email the wrong way around: This commit does not break
things it fixes them.

Background: I saw the mentioned error

_nl_intern_locale_data: Assertion `cnt < (sizeof
(_nl_value_type_LC_COLLATE) / sizeof (_nl_value_type_LC_COLLATE[0]))'
failed.

when running my images but wiped them away by [1] without fixing the root c=
ause.

My excuse: This error was thrown in lxdm greeter. I thought it was a
problem with lxdm which I 'fixed' by adding the patch.

Will give the backport a test and hope I'll get i18n back for GTK (and
most likely others).

Andreas

