Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id AFC7D71A8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:24:36 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id j29so70346122qtj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 02:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BGUHemUgmhnvLG11os2nDTzNxyhODWUX9z5JpaHsULw=;
	b=apKPlLBek0wa7bsIrOJU6D3qyjxOjp7CBh4moumCixP+EX0FMneNf2SnBQEvjQgxLP
	ypzs1wDrJxLup0qd+TL3EEzx/LCMs82Wsw4A6H5d1SgNjqhY8fetWIJcZ6cUzHAQAmPu
	UIHVVgnI5v0sF2/yioo59OnRYnJ1OCA9Gns5xEdz5249U3SBfJrab3FOieRL8muGuNrx
	93bKgmoLEZLWBDLjZsZ7ZXZ+WhjsxmIwVNAoyXHjkibfbskNiN9ifQlvGqqGhbKwB35e
	nfVc5rVBrH211QAiw/1+H7WF4mwBaZnXvABUMDVUKjVfsJZY++3ZvLe9ugYppKHdetXO
	vCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BGUHemUgmhnvLG11os2nDTzNxyhODWUX9z5JpaHsULw=;
	b=o3kyrrhY5m8G4/f+rFn/0gYtfDtR4VTNeVlE9I3PZao+4UcEgJ+QWVmNNbp3JLFoO9
	8tXlGJA9YCQtaR5nv8VMd3qXKOTCvdIb0YyDY2QUiCUz4YzpXnP8YVCCzx6h86UpYi5T
	Y2xY1Z3c8ZCR7na9PR9YIrDkADUmNBDtlgTrJ2CIi8YWWQaD/CvwNX2SFMq+I8U+7lSj
	Ybgn7/KdjjWYW9BXVJzMumO2SwqMzwj8qTOdPqQ0L3hiUrAXjphm/wY0moJ/TnrY0aIq
	m9af3mzuQMvyCsxHsyENg/MF3WW7/ZqrumlGdh9dGkWt78CyzlA/Ml1Guaw393HcSitd
	angg==
X-Gm-Message-State: AN3rC/5UoJqcd3pnw++HEFVrMubQLEl1bgA15XSwMJFGqOkrJ77/bZP/
	namuvgHJG9S/vIdvaI0rOW9n7BnXfk68
X-Received: by 10.200.42.238 with SMTP id c43mr59725882qta.144.1494321877556; 
	Tue, 09 May 2017 02:24:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Tue, 9 May 2017 02:24:17 -0700 (PDT)
In-Reply-To: <19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 May 2017 10:24:17 +0100
Message-ID: <CAJTo0LZ2vUt4y4YByOEJwW-6ctS_HTKJJbNTGx_yisiwsGTUDQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 09:24:36 -0000
Content-Type: multipart/alternative; boundary=001a113f40e4b141c4054f13ecb8

--001a113f40e4b141c4054f13ecb8
Content-Type: text/plain; charset=UTF-8

On 8 May 2017 at 23:15, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:

> FWIW I think this is a little short-sighted. Why are we ruling out Qt
> exactly?
>

My only strong opinion on what goes into oe-core is that it should be small
(both in size and build time) and basic.  It's not going to fit everyones
needs and is basically there to be a UI until the users replace it with
something more suitable.  Sato does this without being too huge and there's
not currently a strong impetus to replace it.

The development of Wayland does make the long-term prospect of Sato
interesting: do we port Sato to Wayland too, or keep the Wayland images
using the standard Weston demo shell?

Ross

--001a113f40e4b141c4054f13ecb8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 May 2017 at 23:15, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mail=
to:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.int=
el.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
tj" class=3D"a3s aXjCH m15bea21d80149337">FWIW I think this is a little sho=
rt-sighted. Why are we ruling out Qt exactly?<br></div></blockquote></div><=
br>My only strong opinion on what goes into oe-core is that it should be sm=
all (both in size and build time) and basic.=C2=A0 It&#39;s not going to fi=
t everyones needs and is basically there to be a UI until the users replace=
 it with something more suitable.=C2=A0 Sato does this without being too hu=
ge and there&#39;s not currently a strong impetus to replace it.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">The development =
of Wayland does make the long-term prospect of Sato interesting: do we port=
 Sato to Wayland too, or keep the Wayland images using the standard Weston =
demo shell?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a113f40e4b141c4054f13ecb8--
