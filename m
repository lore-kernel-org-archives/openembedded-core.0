Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5627F6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Apr 2017 19:59:04 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id c45so100064838qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Apr 2017 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j3i+yX+IO0s9yQF1PtaLnhekAG0IBr9hSDiKk/GQXas=;
	b=jjR8Sfx5ypPVKt369X0Idc5NQ5Izu7smzvdqhSWrYDNigDfZq4vUFGseGK9V0IIt/Y
	GbUeyIpGnkhve6Prjic/pSB6/HV/5okQYc3ngcnrbsCQkF6h8vN8Axg2IA3ezY66RTlw
	gq/qhT+Y1oChbhfGysvbxit/gdHXNdSddDSzfjXYgFIJsFvaqWk1xcjHNHuRib1G0Iy5
	ro5OaVqizNOBNoRdzWU4ldsxZY/DudeqbtXypAKmJtewYOp3X9uTV3C7r0Rt7aSUJ1yd
	vCuvWk2SkgGUvAQqm9WN1GtZBiNfYSknkkLs2ryDXsGtcTJTDYi0Su5vIVh/1O16225q
	VUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j3i+yX+IO0s9yQF1PtaLnhekAG0IBr9hSDiKk/GQXas=;
	b=SrBjS6mNTUZZLyTJdMhDW+wClgHq7s+EJ6/UyYgoIqs/EcXsjy3AO96LiP64PebehY
	qZ5sSKBt2gxeX4kkLCTVxRSfrSMNJ6pr1ekzzvubvGcTsPBZkCPSJ/RrtINjiKIWh4uO
	uqoEL25ooL2qMv8K/1by/xqyfxhnmTwi5bm8brdKSMyjO/HlqdH3stfGRbVGE7d7Rgoy
	EYi4Vuf4fFkc05oK83gCHkQiNXlhCkLDmqvEdTTQDTZ4alPuYod+U1gYX00S9OjMzkVT
	w7bBKkEG/tKOuSlphaDvyzVc5M14EEovb49JcUVyWbdcnYNzW8v4AW7iF7QcZWbw6Q9k
	oB0g==
X-Gm-Message-State: AN3rC/5NMobAarrl187yGg+b8UrUXyxzbwSfmQGjtl4vhxpSZGpjBkec
	TbHoUrO5qXt+E3hTJIQ/1xMbicVt8hX2
X-Received: by 10.200.56.56 with SMTP id q53mr24788497qtb.105.1492977545344;
	Sun, 23 Apr 2017 12:59:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Sun, 23 Apr 2017 12:58:44 -0700 (PDT)
In-Reply-To: <20170421121145.9797-3-andreas.reichel@tngtech.com>
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
	<20170421121145.9797-3-andreas.reichel@tngtech.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 23 Apr 2017 20:58:44 +0100
Message-ID: <CAJTo0LaJWXe_QfhbOi-Xi9WPYpwgL0Z59=A+PLy-TJRLf+fu5A@mail.gmail.com>
To: "Andreas J. Reichel" <andreas.reichel@tngtech.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [wic patch 2/5] wic: Use argparse instead of optparse
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
X-List-Received-Date: Sun, 23 Apr 2017 19:59:04 -0000
Content-Type: multipart/alternative; boundary=001a1137aca23f8dc5054ddaec69

--001a1137aca23f8dc5054ddaec69
Content-Type: text/plain; charset=UTF-8

On 21 April 2017 at 13:11, Andreas J. Reichel <andreas.reichel@tngtech.com>
wrote:

> * optparse is deprecated and will not be developed further
>     (see: https://docs.python.org/2/library/optparse.html)
> * argparse supports subcommands, which simplifies definition of
>     arguments and options
> * reimplement help mechanism through sub-subcommands
>

This results in a behaviour change and breaks the selftest:

FAIL [0.535s]: test_unsupported_subcommand (oeqa.selftest.wic.Wic)
----------------------------------------------------------------------
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py",
line 109, in wrapped_f
    return func(*args, **kwargs)
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/wic.py",
line 163, in test_unsupported_subcommand
    ignore_status=True).status)
AssertionError: 1 != 2

Ross

--001a1137aca23f8dc5054ddaec69
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 April 2017 at 13:11, Andreas J. Reichel <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andreas.reichel@tngtech.com" target=3D"_blank">andreas.reichel@t=
ngtech.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:4np"=
 class=3D"gmail-a3s gmail-aXjCH gmail-m15b9071e308bf2ce">* optparse is depr=
ecated and will not be developed further<br>
=C2=A0 =C2=A0 (see: <a href=3D"https://docs.python.org/2/library/optparse.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/2/<wbr>li=
brary/optparse.html</a>)<br>
* argparse supports <span class=3D"gmail-il">subcommands</span>, which simp=
lifies definition of<br>
=C2=A0 =C2=A0 arguments and options<br>
* reimplement help mechanism through <span class=3D"gmail-il">sub</span>-<s=
pan class=3D"gmail-il">subcommands</span></div></blockquote></div><br>This =
results in a behaviour change and breaks the selftest:</div><br>FAIL [0.535=
s]: test_unsupported_subcommand (oeqa.selftest.wic.Wic)<br>----------------=
------------------------------------------------------<br>Traceback (most r=
ecent call last):<br>=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yo=
cto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py&quot=
;, line 109, in wrapped_f<br>=C2=A0 =C2=A0 return func(*args, **kwargs)<br>=
=C2=A0 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe=
-selftest/build/meta/lib/oeqa/selftest/wic.py&quot;, line 163, in test_unsu=
pported_subcommand<br>=C2=A0 =C2=A0 ignore_status=3DTrue).status)<br>Assert=
ionError: 1 !=3D 2<br><br>Ross</div>

--001a1137aca23f8dc5054ddaec69--
