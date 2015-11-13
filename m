Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2B543772D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:54:16 +0000 (UTC)
Received: by ioir85 with SMTP id r85so51812904ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 01:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=nCVlJhxSBHYN82PA35RkP0xTgtyqNXk2FFvY9gAicoc=;
	b=wcNeNeqPZAnKjP53UB8SDHAE8edoN6MU0obDSlCVeybAQEaxlt4hoVHxvRnJorUvoa
	RNmsqMn2xLcB7HaHzAref1garMB+ye3y/oKjdD3rsmRgTqix3qHJtBpnXgZ8hjRHZFhK
	AELDKeTubRPHL/SPxHKdbeeUJ7Ppxsaojp+Ar2AkQ5XHHjLr58RR9sXcafVIAGLBslZB
	6JpK57aQzOaXdnHeSlFzFQmI2lCXS3iJHQpA0PtPmOLxDbvR7BWowb/eyZi+fqla87jh
	ivvCYmpSsOEX/Xq3bXgkHwFnwcIFlKGwxPaHr1svBtjZ5YD+lpOTAWcxPueyZKCmM8+r
	FDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nCVlJhxSBHYN82PA35RkP0xTgtyqNXk2FFvY9gAicoc=;
	b=LvuP61iKVVV2YD9Y9xspkRXOMhPdE5alrS4znWFE9339GToSBu8LGcIUDUNfBSwsyO
	h22mt7wzQ8CLE1g+tZdmpU9kxG6NrTpe4OxJg1wu2RslJgW+FxzV0+d8SjaET8VE4D5W
	WRgb/bPvjfVMk5m3viQztchJtD9oXkzEwpPZYLqFNd12gB7RCapckSJxiE5rqXVgZvHJ
	TfY9fkp8xjd4aBORMI7H6CL9vGUI9AUQkLGNfvVfJt96mgpOfq+ONvIcGILZQw6/knGS
	Lid2aJsL0J9NxDr155YQ04EchPCSCiH4m4cXYVFZiQsn/264F6KBXWyMPd1EtOcf449I
	0F4Q==
X-Gm-Message-State: ALoCoQlXXkahMTs81hZUWBENXz3EwAHLFNQYbHYwTUEaiK+guEo+iCVDCqHs7OIfvLrVUGISPZMY
X-Received: by 10.107.3.144 with SMTP id e16mr15592995ioi.99.1447408456648;
	Fri, 13 Nov 2015 01:54:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 13 Nov 2015 01:53:57 -0800 (PST)
In-Reply-To: <CAJTo0LYqWk_2oqjFxZ44b+yAfAq8c_a1QiCH5erFKTmFvxg-Kw@mail.gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<CAJTo0Lb7w0XAJ-H-T2Uz-mdmjUZGFX9wQyzCUJ_4bU8re9rswQ@mail.gmail.com>
	<A2AEDEA2-FB1D-4D6F-8B2F-F420AC123C9B@gmail.com>
	<CAJTo0LYOMeiaie9=3i908aAj3H4U0_qSdf7RmXSofosBMzcW9w@mail.gmail.com>
	<E909DBB3-5F90-4E81-949D-93E7D3960988@gmail.com>
	<CAJTo0LYqWk_2oqjFxZ44b+yAfAq8c_a1QiCH5erFKTmFvxg-Kw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Nov 2015 09:53:57 +0000
Message-ID: <CAJTo0LYa6-gOECqfbfDZeDXcJKwMNesiUR9Z-N7j0bxKK-pjhw@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Fri, 13 Nov 2015 09:54:17 -0000
Content-Type: multipart/alternative; boundary=001a113ecf40e75f2a0524690a47

--001a113ecf40e75f2a0524690a47
Content-Type: text/plain; charset=UTF-8

On 10 November 2015 at 13:14, Burton, Ross <ross.burton@intel.com> wrote:

> I can't see anything obviously wrong with the makefile.  I'll merge it and
> give it another run on the AB.
>

http://errors.yoctoproject.org/Errors/Latest/Autobuilder/?filter=libusb1&type=recipe

Failed twice last night.  There's definitely a race in there.

Ross

--001a113ecf40e75f2a0524690a47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2015 at 13:14, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div>I can&#39;t see anything obvious=
ly wrong with the makefile.=C2=A0 I&#39;ll merge it and give it another run=
 on the AB.</div><div class=3D""><div id=3D":2ju" class=3D"" tabindex=3D"0"=
></div></div></blockquote></div><br><a href=3D"http://errors.yoctoproject.o=
rg/Errors/Latest/Autobuilder/?filter=3Dlibusb1&amp;type=3Drecipe">http://er=
rors.yoctoproject.org/Errors/Latest/Autobuilder/?filter=3Dlibusb1&amp;type=
=3Drecipe</a><br></div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Failed twice last night.=C2=A0 There&#39;s definitely a race in=
 there.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a113ecf40e75f2a0524690a47--
