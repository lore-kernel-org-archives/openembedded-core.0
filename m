Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id EE51165D40
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 23:04:50 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id n4so4910684qaq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 15:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OuqNEc9+nxfLlImILdbbl0P9I1FpXbrMbNH/p9WUolQ=;
	b=Ricm9wZnLKB3XZlB0cz5jfC+mXeSFGT/zvUchXKk5HBBftzI9R9h7Pxae8fqtz9G8n
	Jq0BeFqAoPYOigNfpuxY+kWpKtk7Qu+nMM+1t0SEXTwGbyX5KGvmahaclWyuDe0YFrY3
	326LD8ncABDDzJQTE0x3KlsIriy4wByoP7Sh6dOJXkNBYxJVVL+4Q5hUwpUKTp9b8PrJ
	t7cpDPKrAlmF0p0ZDYlwC3mR2gwBLpxM6gqABXsBnEQT0anLlBtnvExMZKqlS6X4S5z+
	PXdt0RnOgswaTYMQZhnTpwXqKNB8yBl6Kpf3ubq1gGeCmTJdQ/T0IbjeE8GONYJEuMj4
	+l/w==
X-Gm-Message-State: ALoCoQmowLjChDahlfD5lhguNwDzLkc84Ip7PHmMl/wcDKw50hwSQfToRyPAhjtpYTChP5qK+fd3
X-Received: by 10.224.93.6 with SMTP id t6mr9111164qam.93.1420671890579; Wed,
	07 Jan 2015 15:04:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 7 Jan 2015 15:04:30 -0800 (PST)
In-Reply-To: <54ADACDE.2080404@linux.intel.com>
References: <cover.1418337489.git.alejandro.hernandez@linux.intel.com>
	<4bedbe90e0589179b7c6010818a63596a9502671.1418337489.git.alejandro.hernandez@linux.intel.com>
	<54ADACDE.2080404@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Jan 2015 23:04:30 +0000
Message-ID: <CAJTo0LYCCBLaT+iAkBH7P6WaPuiePuTCTTrZDw5dV-S6m5a1DQ@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] insane.bbclass: Added QA test for expanded ${D}
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
X-List-Received-Date: Wed, 07 Jan 2015 23:04:54 -0000
Content-Type: multipart/alternative; boundary=089e01495028617742050c17f34c

--089e01495028617742050c17f34c
Content-Type: text/plain; charset=UTF-8

On 7 January 2015 at 22:02, Randy Witt <randy.e.witt@linux.intel.com> wrote:

> Would it be simpler to do "bbvar = d.getVar(var + "_" + pak, False)" so
> you don't get the expanded value, and then just check for ${D}? I suppose
> it would save one extra variable and a couple of expansions.
>

Alejandro answered this point in the original thread:

"using the existing package variable handling infrastructure within the
class, ends up expanding the variables before being able to check them ,
using getVar('FOO', False) is useless in this case, any suggestions?"

Ross

--089e01495028617742050c17f34c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 January 2015 at 22:02, Randy Witt <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204=
,204);border-left-style:solid;padding-left:1ex"><div id=3D":9ie" class=3D""=
 style=3D"overflow:hidden">Would it be simpler to do &quot;bbvar =3D d.getV=
ar(var + &quot;_&quot; + pak, False)&quot; so you don&#39;t get the expande=
d value, and then just check for ${D}? I suppose it would save one extra va=
riable and a couple of expansions.<div class=3D""><div id=3D":9hj" class=3D=
"" tabindex=3D"0"></div></div></div></blockquote></div><br>Alejandro answer=
ed this point in the original thread:</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra"><span style=3D"font-size:13px">&quot;using =
the existing package variable handling infrastructure within the class, end=
s up expanding the variables before being able to check them , using getVar=
(&#39;FOO&#39;, False) is useless in this case, any suggestions?&quot;</spa=
n><br></div><div class=3D"gmail_extra"><span style=3D"font-size:13px"><br><=
/span></div><div class=3D"gmail_extra"><span style=3D"font-size:13px">Ross<=
/span></div></div>

--089e01495028617742050c17f34c--
