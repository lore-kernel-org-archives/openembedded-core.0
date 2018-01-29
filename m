Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id A4799787F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 12:40:27 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id h129so2889637ita.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 04:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3p46nlh7pH7Q6aYI2YOIR6Oynv+oJ0QPz5n9frc1kjs=;
	b=C06XfphN1hhRxVb4U7/YDb2TWmqtTJ2MUFbYxS0RbTarRlV6BLbU65yniJP/3kwxTY
	RPy1zcVTE6deUFN3K9UyolyybqfcTUMESok6jsH/0YCjj6JL5XabIzt0B5mItMxXdDED
	rNZ/LezPvxpdFPgTyB5qTQRSBw3Yn12axaRlvKkjljGUWQd0NbpyFYSv2+NpEvJI70YJ
	+5nBPPxb8FFAkXiqCHOVX26X4dBnUT40gq4e1xV0E7uJfuegAjZS1tVGjaMGBcckQq3/
	9xkCR3mFszSxiJMbI81N2RTWgc0PgnqVAU0CfPmPXEEScIcYNAl/M5p/U4VGPNQ76FLp
	RaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3p46nlh7pH7Q6aYI2YOIR6Oynv+oJ0QPz5n9frc1kjs=;
	b=TpsYdYyHMwjDfWIgBZ3Vncr13v4G2Iv3LgC31xJeRnDfchVMfSinKV6uy2uwoMgmQZ
	7wx43wwHpfN9OakNfh7Vv5XHfTdMnDwgFzmdKITO2mt11XVC3E0jy49WzbYSBCTEPoAB
	Ii5084AT39HXqZNTAgNX0YJaL0vBL1gVIdDVk+VWqNF/XftJxcElbXYkK7P5Bn5ZgtyN
	4Nqn0rAJsY8D9aF33K8fGaxZmX8gtoA0wNjOh8ez6tnzF/GLBs4RktLQbWoiAK08zjW/
	S0MkTlRHmwOV9bVwCf3iqFCO56nUBupACB/jJRq17TVGRtuxVIu0e2xsQWDdgjySqZpi
	9hkQ==
X-Gm-Message-State: AKwxyteoUX3Q8bZMvLjoX27IgPq8Euxc1sNS/3AFiTEyM2TVxaLxxGAC
	CAGY7keoDhMTitXRGA7eR3I0J23MYv6Ss0chLQMMLA==
X-Google-Smtp-Source: AH8x225a1r+h80EjGFeZguvSzQ/UMmsasGjImycP6dT4dljihvfNqwVAnEgcNyzbZ4FkocJjhtQQfXtgMho7MMIKH1U=
X-Received: by 10.36.86.20 with SMTP id o20mr27288944itb.53.1517229628817;
	Mon, 29 Jan 2018 04:40:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 29 Jan 2018 04:40:08 -0800 (PST)
In-Reply-To: <45db0f72-d93f-ebbd-83aa-80ceaeabc083@gmail.com>
References: <45db0f72-d93f-ebbd-83aa-80ceaeabc083@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jan 2018 12:40:08 +0000
Message-ID: <CAJTo0Lbnb1PSJiP4v99mUt-uAFz+KeAxjPf4j3jdL=iBs2USGQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] Glibc 2.27
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
X-List-Received-Date: Mon, 29 Jan 2018 12:40:27 -0000
Content-Type: multipart/alternative; boundary="001a1144d5ea1198780563e98d5f"

--001a1144d5ea1198780563e98d5f
Content-Type: text/plain; charset="UTF-8"

The yocto autobuilder was idle so I fired it, fingers crossed :)

On 27 January 2018 at 21:44, Khem Raj <raj.khem@gmail.com> wrote:

> Hi All
>
> glibc 2.27 is releasing soon in few weeks. I have put together the recipes
> for upgrade, along with fixes for some of packages that I ran into here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?
> h=kraj/glibc-2.27
>
> This has gotten limited testing. I plan to put the package fixes as we
> plough through. Please test this out in your setups and report problems or
> fixes ( preferred ) to get various packages working on 2.27 release
>
> Thanks
> -Khem
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144d5ea1198780563e98d5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The yocto autobuilder was idle so I fired it, fingers cros=
sed :)</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 27=
 January 2018 at 21:44, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Hi All<br>
<br>
glibc 2.27 is releasing soon in few weeks. I have put together the recipes =
for upgrade, along with fixes for some of packages that I ran into here<br>
<br>
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dk=
raj/glibc-2.27" rel=3D"noreferrer" target=3D"_blank">http://git.openembedde=
d.org/op<wbr>enembedded-core-contrib/log/?<wbr>h=3Dkraj/glibc-2.27</a><br>
<br>
This has gotten limited testing. I plan to put the package fixes as we plou=
gh through. Please test this out in your setups and report problems or fixe=
s ( preferred ) to get various packages working on 2.27 release<br>
<br>
Thanks<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-Khem<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1144d5ea1198780563e98d5f--
