Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3E877E33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 08:59:10 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id g32so4218940ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 01:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JIJtb/rrOoL0YigOiy9nVmhVY2gYFfDGUVLksYi0/2M=;
	b=QrALelvQ8ui4++HivUkpCeT+6k6SH1R0S+javLGaFchwkM1Z8mDsKwM9d/JpApiDbV
	C0jxvRhrkUVk0zIC2AgfpYVPg70KE4ou9iDvTuwNL1vYJ/kgH6uLkp6Egrp/TF3jVQ4X
	uf+0P2fwZOj0HLK+CqV1/POk2bLVcw1SDt6mdLjoOP1N4pzcftfB/TSbRALzc6LYpNEN
	1dIQ7Gq1KQN9tO9dx3x+RWd5hHimJDWpYOSZJjo04sXCq7K94/jlvfRJztMJRdOcH0oN
	4jtII1PS68WjYMmkt/5WMGAaxwfwhAD5R/JZdFD/+a43Xw29ohQb0YYiLMIcUeIzTrIL
	EwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JIJtb/rrOoL0YigOiy9nVmhVY2gYFfDGUVLksYi0/2M=;
	b=AUs8kwbwHVvvsCIZCv/RI/pqR7/zap1Kz9m/1HlOpCCbfq4LDNKDuqxbQil4mnophr
	r+Ahg5Iy/B38ZlyZNUAzRWTttKmmtKc6KHlT/n2gVwWDRDkmqsc6rSXiecH2v0WEENlF
	Ufp2aUMRTA1heUm0mS6RECogkLn4YMd6Z9sxtVa4GmBvgjA7MPxhl/MnK8Yt+Tjb0DQx
	t1HHchxKmY+o3tPhokuF5UG0SP5m3XAwR7/VdXeXbWpKcTSSr+eiIGgOAZw7RZf5bYae
	0w1PN/LhBeBOPDgcuGoFVoJfKbS0IIhg7Ujw1ZpvjX18rwyh4zUeRnlzD4iBlAxpAvsQ
	c8lA==
X-Gm-Message-State: AHPjjUh3A36pfMp7gJ5BG9JnPveku2Wju9nF18pSSnqE3kW85xAShR0q
	REGowAQfN+HoEgEhSwHr70q3IIi8Ve7z
X-Google-Smtp-Source: AOwi7QAnIAClFD0SFRY1N7FlaOG0Wjd6+Dif2PdWkZ6DldYF2zphVaureIY76j3HmvLf7VnlmdDM9p27bLUjISHygKc=
X-Received: by 10.107.164.28 with SMTP id n28mr13746642ioe.175.1505120351388; 
	Mon, 11 Sep 2017 01:59:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 11 Sep 2017 01:58:50 -0700 (PDT)
In-Reply-To: <20170910131446.4555-0-nathan@nathanrossi.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Sep 2017 09:58:50 +0100
Message-ID: <CAJTo0LaqHGMPDF=JHGw5NcBzvTkFbP2bQfmgcG8o-Zx0hTeD3g@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Recipes for Open Source Verilog and Lattice iCE40 FPGAs tools
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
X-List-Received-Date: Mon, 11 Sep 2017 08:59:10 -0000
Content-Type: multipart/alternative; boundary="001a114223ace3aab30558e6231d"

--001a114223ace3aab30558e6231d
Content-Type: text/plain; charset="UTF-8"

On 10 September 2017 at 14:14, Nathan Rossi <nathan@nathanrossi.com> wrote:

> Please note whilst this series is sent for oe-core it may be better
> located in another layer? (e.g. meta-oe). However since the recipes and
> the tools they build are not specific to a single BSP it did not make
> sense to keep in a BSP specific layer.
>

Sounds like a dedicated FPGA layer would be ideal.

Ross

--001a114223ace3aab30558e6231d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 10 September 2017 at 14:14, Nathan Rossi <span dir=3D"l=
tr">&lt;<a href=3D"mailto:nathan@nathanrossi.com" target=3D"_blank">nathan@=
nathanrossi.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Please note whilst this =
series is sent for oe-core it may be better<br>
located in another layer? (e.g. meta-oe). However since the recipes and<br>
the tools they build are not specific to a single BSP it did not make<br>
sense to keep in a BSP specific layer.<br></blockquote><div><br></div><div>=
Sounds like a dedicated FPGA layer would be ideal.</div><div><br></div><div=
>Ross=C2=A0</div></div><br></div></div>

--001a114223ace3aab30558e6231d--
