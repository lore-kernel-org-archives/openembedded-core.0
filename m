Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3A560761
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 19:06:54 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 190so19721903iow.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=epht39EoUX0/ZAY3N4E9sF2bVdSatRUqd0of8zyhzrM=;
	b=cuhV+gQ6WEa6IvV9SXk9TiELZ5sfatPibnEtw+u/FAOf6wFIPb8yN2o861EmJANaOW
	7FUULzUR8TkPPtvv6V98jiYatW0s6CPgoTBYD3C++wGdNQ7hYsgQ8TGWlwMhgkjQ6V+J
	HiNiL0nocv6Ig2JbJNEAxooLdnnlgRQGlEHwYycpyXazlWBVa+/iSdu5HRW9h/5Xj6Ls
	fkgwOAJJOZmitdrIn7xvbmMBrb5a6eUs2yrYGJcgMtzsAnqeh4Q1D2PowVzm5sSBmPln
	lygtRl39FbuHPcADGphi2jUmiVNLEpEL/m+bg7geJ/9K4ugqVm7OLmuHafAZYSv8Zmds
	059A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=epht39EoUX0/ZAY3N4E9sF2bVdSatRUqd0of8zyhzrM=;
	b=YqFpzG2XHPT/QmpPjScOghz8X9IJiej/B4vwPziWuQ1fK7QyO+sgio4pF2RqQZSO9l
	8HaUa1ZBIFOT+29K1wuEUdqYE/jS8fNJc+KP5GeTAF5bg9JmLLHF4iqL4EIIGHNZQRcq
	4+0f/LVtxdk54bVAQTHNnbCACcnLc18usBMf2WeIm+jmVStBuRMOdPDJwu1iKIaXjavJ
	RJ/7GXSE+00dEauJKXVD5IvQfFbWwEdLjp/loZwaIY7tJSqdRT8bblhWGdo+yRFdKeTJ
	Ifs2agcpy8jEbyQdxKDfPsv6EL+W1pQY86hxTflP3z0AJcmPL1T4S8Ke7mD7MVEnqLLB
	ab1w==
X-Gm-Message-State: AOPr4FVuZDFOBhfpiaa+XpGHt5wz9h9P8b4sZV97EIjO+iAkwb4D6JJ76FpzXhEdIY1+R22cfnF/FuE5zSbKQ/+y
X-Received: by 10.107.179.136 with SMTP id c130mr5230408iof.99.1461697615029; 
	Tue, 26 Apr 2016 12:06:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Tue, 26 Apr 2016 12:06:35 -0700 (PDT)
In-Reply-To: <CAJTo0LaE9PTEG6zsasGc_H6ngw4Oq=BFZBTZQ4ynszdtUTV3QQ@mail.gmail.com>
References: <20160422000519.GR16135@denix.org>
	<CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
	<CAJTo0LaE9PTEG6zsasGc_H6ngw4Oq=BFZBTZQ4ynszdtUTV3QQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Apr 2016 20:06:35 +0100
Message-ID: <CAJTo0LYfkePDuqUQ2WMNZ-v6JqfPZv1wA2KrKPw1qGojmzpa7A@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>,
	Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: mesa, libgbm and weston
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
X-List-Received-Date: Tue, 26 Apr 2016 19:06:56 -0000
Content-Type: multipart/alternative; boundary=001a1148578c1d0dec053167ff13

--001a1148578c1d0dec053167ff13
Content-Type: text/plain; charset=UTF-8

On 26 April 2016 at 12:36, Burton, Ross <ross.burton@intel.com> wrote:

> We used virtual/mesa to mean "the Mesa APIs and so on" so libgbm is
> covered by this.  Of course at the time there was only one implementation
> in mesa.  Now that there are genuine alternative reimplementations of
> libgdm then I agree that a virtual/libgbm is a good move, and replacing all
> of the virtual/mesa instances that are actually just for libgdm.


Just had a chat with a friendly graphics developer.  Currently libgbm is
tied to the drivers and GL stack implementation, so it makes perfect sense
that mesa's libgbm should probably be renamed along with the GL bits to
libgbm-mesa, and other drivers ship their own libgbm, and we have a
virtual/libgbm to pick between.

Patches welcome from someone who has relevant hardware to test it actually
works.

Ross

--001a1148578c1d0dec053167ff13
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 April 2016 at 12:36, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">We used virtual/mesa to me=
an &quot;the Mesa APIs and so on&quot; so libgbm is covered by this.=C2=A0 =
Of course at the time there was only one implementation in mesa.=C2=A0 Now =
that there are genuine alternative reimplementations of libgdm then I agree=
 that a virtual/libgbm is a good move, and replacing all of the virtual/mes=
a instances that are actually just for libgdm.</blockquote></div><br>Just h=
ad a chat with a friendly graphics developer.=C2=A0 Currently libgbm is tie=
d to the drivers and GL stack implementation, so it makes perfect sense tha=
t mesa&#39;s libgbm should probably be renamed along with the GL bits to li=
bgbm-mesa, and other drivers ship their own libgbm, and we have a virtual/l=
ibgbm to pick between.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Patches welcome from someone who has relevant hardware to =
test it actually works.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a1148578c1d0dec053167ff13--
