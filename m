Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1418473C63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:06:20 +0000 (UTC)
Received: by qcgx3 with SMTP id x3so12476325qcg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 06:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rUCXIdlmB7/boUu5KBfr96/manatuBrdQe6WJKMIo6g=;
	b=mB03EQadcrXCQsrc7pNVl+D3tQc6KYhqVB/c3N0MaOojdW9VH1IJPzTFNQiYnv4wUS
	zCKFrswuCwkz7loh4ID1k+Vqx5yn0oz1IonSbbDrMyvH1Z4HtcMaqHmUEMElYpsuC/+9
	2PAfH0MdVicEv9ehuHMLfxyPE/hnxiWK+RhgXbXQzqZorK+vw7Qhq9wVZoEk1O5eybXt
	suQFyuwikkNMlq2jZHuHcGNGezrRB+xeYYWOoLVLSB1WMs2I5V4x+dxMZHuUDmmJ8UDG
	WTEBa6GZBIAO8yY7kn1FJQPC1rNXcJ279mmASWwiUZuzV7SeX3/Yz6e6ef9e6OFUMuCz
	EIsw==
X-Gm-Message-State: ALoCoQnyP8NiLcV/b8TnZu9Nk2wl7qC+cNL2MIhczCappqXoi3EsaIIMjkGBa2KKvD8i/RcvNuTd
X-Received: by 10.140.85.137 with SMTP id n9mr45873730qgd.40.1427807181217;
	Tue, 31 Mar 2015 06:06:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 31 Mar 2015 06:06:01 -0700 (PDT)
In-Reply-To: <BN3PR0501MB109038A56A57CC04DE09E55CBBF40@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB1090B5CDC1B3FF89CCC4D286BBF50@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<1427747268.14020.326.camel@linuxfoundation.org>
	<5519B425.1040906@windriver.com>
	<1427751808.14020.327.camel@linuxfoundation.org>
	<BN3PR0501MB109038A56A57CC04DE09E55CBBF40@BN3PR0501MB1090.namprd05.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Mar 2015 14:06:01 +0100
Message-ID: <CAJTo0LZNKPFw1-+9OE+UPGv+0AKGAAdrYo2v4=DU_DD1F-Mzug@mail.gmail.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Verification on how TARGET_CFLAGS is set
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
X-List-Received-Date: Tue, 31 Mar 2015 13:06:23 -0000
Content-Type: multipart/alternative; boundary=001a11c12894d83a4e0512954313

--001a11c12894d83a4e0512954313
Content-Type: text/plain; charset=UTF-8

On 31 March 2015 at 13:28, Bryan Evenson <bevenson@melinkcorp.com> wrote:

> Is that all that it is?  I was under the impression that adding -g adds
> the debug symbols to the executable, not just the hooks to include the
> debug symbols.  If the -g flag really does just add a few bytes to each
> executable, then I won't worry about it.
>

At build time it adds the full debug symbols to the executable, but at
packaging time we split out the debugging information to separate files and
then separate packages.  So the difference between a binary produced
without -g and with -g but with debug info split is just the identifiers so
that GDB can find the debug symbols.

Ross

--001a11c12894d83a4e0512954313
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 March 2015 at 13:28, Bryan Evenson <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:bevenson@melinkcorp.com" target=3D"_blank">bevenson@melinkcorp.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1lb" clas=
s=3D"a3s" style=3D"overflow:hidden">Is that all that it is?=C2=A0 I was und=
er the impression that adding -g adds the debug symbols to the executable, =
not just the hooks to include the debug symbols.=C2=A0 If the -g flag reall=
y does just add a few bytes to each executable, then I won&#39;t worry abou=
t it.<br></div></blockquote></div><br>At build time it adds the full debug =
symbols to the executable, but at packaging time we split out the debugging=
 information to separate files and then separate packages.=C2=A0 So the dif=
ference between a binary produced without -g and with -g but with debug inf=
o split is just the identifiers so that GDB can find the debug symbols.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a11c12894d83a4e0512954313--
