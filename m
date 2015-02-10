Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id EAD3665CF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 15:44:05 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id j5so12043858qga.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 07:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+e2MnBPUZgyIHMUSqzOaS8Bcz4UCbI98GaadRrn9B2g=;
	b=Ti178IzfgpoRa3Uq0iszFiwfd88soQIiHxcw/SaIGuQoYWX0mvyZcqzv9WTgA61cco
	SiWf8cUjNTMU15uiwyoyW5TB+727opX/2iTtwk2qKWo9WAWyQCF6tSMoQAm29Q3KiLa6
	Y0C3PDLNbEDqPhTLCetm08lH1GHrXwowXxXYOMSruVMdq5uxLYJsd4eWJ1V/xcAwC2+3
	hPWHHnz8gt2Li3Cyi5uCpsF+I1e2GI4cJq3g5mUuIESpTRzeKK7PFG+lubfPOjCGqRgO
	4hqTbFyVRvPFxjgoB4c49YDvnMHpRLJ/8mgh1wLoM1z49mWkV5R4+sIYKp4tFCCZpNDI
	r07A==
X-Gm-Message-State: ALoCoQlSt82vZK7XpfITif9phgOaJ94snsTLJy2TpDAVGzdwJ/YCVudRai12G3ggYqaCIvDO+7tI
X-Received: by 10.140.49.5 with SMTP id p5mr51906960qga.15.1423583046648; Tue,
	10 Feb 2015 07:44:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 10 Feb 2015 07:43:46 -0800 (PST)
In-Reply-To: <CABcZANmkGNPwvdt==h_LAA-Q6e5Umwti2g=qvj3r_vyQrqxjHA@mail.gmail.com>
References: <cover.1423420390.git.pab@pabigot.com>
	<CABcZANmkGNPwvdt==h_LAA-Q6e5Umwti2g=qvj3r_vyQrqxjHA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Feb 2015 15:43:46 +0000
Message-ID: <CAJTo0LaNQLGjMWDUQr0SMFDDRe3KTH_MxoUbHMJ9ex9W854jKg@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 00/10] bluez4/bluez5 selection fixing Yocto 5031
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
X-List-Received-Date: Tue, 10 Feb 2015 15:44:11 -0000
Content-Type: multipart/alternative; boundary=001a11351944cddbe7050ebdc169

--001a11351944cddbe7050ebdc169
Content-Type: text/plain; charset=UTF-8

On 8 February 2015 at 21:16, Christopher Larson <clarson@kergoth.com> wrote:

>     DISTRO_FEATURES_append = " bluez5"
>>     PREFERRED_PROVIDER_bluez-hcidump = "bluez5"
>>     PNBLACKLIST[bluez-hcidump] = "superseded by bluez5"
>>     PNBLACKLIST[gst-plugin-bluetooth] = "dropped from bluez5"
>>     PNBLACKLIST[bluez4] = "superseded by bluez5"
>>
>
> For what it's worth, I like the look of this series (and have since they
> were first posted). Hopefully it gets merged.


My concern with this series is using DISTRO_FEATURES to control what
version of BlueZ is used in the image.  What makes BlueZ so special that it
deserves a DISTRO_FEATURE as opposed to a PREFERRED_PROVIDER_virtual/bluez
or a variable such as BLUEZ_VERSION defined in bluetooth.bbclass?

Oh, and gst-plugins-bad has support for BlueZ5 but this series doesn't
enable it.

Ross

--001a11351944cddbe7050ebdc169
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 February 2015 at 21:16, Christopher Larson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow=
:hidden">=C2=A0 =C2=A0 DISTRO_FEATURES_append =3D &quot; bluez5&quot;<br>
=C2=A0 =C2=A0 PREFERRED_PROVIDER_bluez-hcidump =3D &quot;bluez5&quot;<br>
=C2=A0 =C2=A0 PNBLACKLIST[bluez-hcidump] =3D &quot;superseded by bluez5&quo=
t;<br>
=C2=A0 =C2=A0 PNBLACKLIST[gst-plugin-bluetooth] =3D &quot;dropped from blue=
z5&quot;<br>
=C2=A0 =C2=A0 PNBLACKLIST[bluez4] =3D &quot;superseded by bluez5&quot;</div=
></blockquote></div><br></span>For what it&#39;s worth, I like the look of =
this series (and have since they were first posted). Hopefully it gets merg=
ed.</blockquote></div><br>My concern with this series is using DISTRO_FEATU=
RES to control what version of BlueZ is used in the image.=C2=A0 What makes=
 BlueZ so special that it deserves a DISTRO_FEATURE as opposed to a PREFERR=
ED_PROVIDER_virtual/bluez or a variable such as BLUEZ_VERSION defined in bl=
uetooth.bbclass?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Oh, and gst-plugins-bad has support for BlueZ5 but this series d=
oesn&#39;t enable it.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11351944cddbe7050ebdc169--
