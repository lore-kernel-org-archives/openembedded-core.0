Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id AD5FA71C75
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:54:50 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id 12so46984990qtm.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 08:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TvuSFLdgyicchfOsyG1VrVN6YYE02GDA1hpIZ036Wvk=;
	b=gWI/xbtlCJEHktpzczr9Vd9NyiosMcaIU5UzxVBnKWKwHD4nBIiCJcH/u4m7Imp72U
	4VL7mvgR0XIOlaLI0QSaTibWVXNcgjrKm0oYWPD7JqiivaN5LFCOPLgC96cm4YrgokIK
	LwItbuvPQvQmmH9zaFiti7ZrjodHGnmGz/1jUqGA8gTsuV2LX+TJbvNeNzQeHNj5JqiT
	UR11AaxNypVD+xTleLtpMh3vTRqWJHtdyVh9NuB4h/t8faN9eVqNazBkMFzFzzaMIZRX
	qcdQmTEuX6QVXwI267t85HK4zq612WPfuzvpnnFC+UNisI0m2Ld5RrOVGKcF70Biny/n
	SdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TvuSFLdgyicchfOsyG1VrVN6YYE02GDA1hpIZ036Wvk=;
	b=gjTeDJ4B8FX6lAwDGbtai44y84HfXr4i8AxFSHlguOSkdZqq5AwcEogCO538D1ZB0a
	CIrg6COo8GSlqa5s0VsovXI7E2uIiBknSf/XnqmkW8CDWrkFQAbQ068UR1oyjkrhomcp
	V1fNxsWg2YTc5331DH/tE3saYwopqvf7lGhrDklGcGOhs0QUJWV1NegVm+QRGvnV/fxj
	fU53x7MgCMaum+/Fknem9CTphm0XMIYjjSHs3ezGe8b93Uz3Sh9cOMwb1x59zuYYKsvR
	4sRhdimm1RW4pkbX0qqc/gd93uuWn2phhgCawiOT+asyjG+QaFZE7JK/1YtEUkO0oeCK
	herA==
X-Gm-Message-State: ABUngvcJq8LruV0mMtreOPdLHlqkxvJvEQiCtO0JyY9O09hHazIBN3+AFEYDhj2TGJr2cxbTxAReT/sj7qpDK0Pj
X-Received: by 10.200.50.35 with SMTP id x32mr6304845qta.78.1477670091475;
	Fri, 28 Oct 2016 08:54:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Fri, 28 Oct 2016 08:54:31 -0700 (PDT)
In-Reply-To: <1477418985-28961-1-git-send-email-daniel.diaz@linaro.org>
References: <1477418985-28961-1-git-send-email-daniel.diaz@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Oct 2016 16:54:31 +0100
Message-ID: <CAJTo0LaJdDBiUA29J0VZF_VU=rpZXknH3WdCJc3h6LZrCg8Xog@mail.gmail.com>
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][krogoth] weston: Add no-input-device patch to 1.9.0.
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
X-List-Received-Date: Fri, 28 Oct 2016 15:54:50 -0000
Content-Type: multipart/alternative; boundary=001a1143e1dae6286d053feee067

--001a1143e1dae6286d053feee067
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25 October 2016 at 19:09, Daniel D=C3=ADaz <daniel.diaz@linaro.org> wrot=
e:

> The included patch, backported from Weston master, allows
> it to run without any input device at launch. An ini option
> is introduced for this purpose, so there is no behavioral
> change.
>

The patch process requires that unless there are exceptional circumstances,
patches should be submitted to master and then past releases in order.
Does the weston in oe-core master/morty have this patch included already?

Ross

--001a1143e1dae6286d053feee067
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 October 2016 at 19:09, Daniel D=C3=ADaz <span dir=3D"ltr">&lt;<a href=
=3D"mailto:daniel.diaz@linaro.org" target=3D"_blank">daniel.diaz@linaro.org=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":nq" cl=
ass=3D"a3s aXjCH m157fd0e1ccc9bd3d">The included patch, backported from Wes=
ton master, allows<br>
it to run without any input device at launch. An ini option<br>
is introduced for this purpose, so there is no behavioral<br>
change.</div></blockquote></div><br>The patch process requires that unless =
there are exceptional circumstances, patches should be submitted to master =
and then past releases in order.=C2=A0 Does the weston in oe-core master/mo=
rty have this patch included already?</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1143e1dae6286d053feee067--
