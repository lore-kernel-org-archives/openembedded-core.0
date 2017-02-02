Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id D133871CCB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 13:47:57 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id x49so30949019qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FMehFT3h+O9E466aYBPZDmyuSpKbUpf8yTEYMGWt6K0=;
	b=tDXVxY3hdrqNUy+6XMeMBqbYqJFag/LZfwKSqOv1jopZrMHSxVhodYT0NF5U5dnAlh
	PhlYYZmTfysAogevfH0X1R6M249N4HIGadoMrMC6qe3CdWG4GPqVVY2t2NaSYwEoQsuf
	/dsSLqfyxSYKTNJtYAroq99fbSlkNAwigC/reZ0eeoRvpoZG+ZHvab/jEBCzpXdlLUjr
	zl2PKqv9inl4XvYA8Yv4uvw57aKI+PdRGGWnv5KmEDdNgxcgXKmzeQ2XeWwIpxe9KdQV
	r19MjcY9SJRD14L6OhZz3Hro9Hq/oXdlPZxXUOPYoCNUe4WSHunJSMS53pOsZ9eD/6Jm
	VfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FMehFT3h+O9E466aYBPZDmyuSpKbUpf8yTEYMGWt6K0=;
	b=ZDvli5LRcJfSYcoHBOARd57uzk1yu0g4UpQm2t+TvQ0FXJUBC/uuSqxPB6K+f4e8PO
	urOI3Dk5/hPjQqvpTjNe4LvEchYhNiB28tYpEgCsc+7FAOE9O2Ire2FDtrokod2/vAlG
	7yhuZt8ORdlMVS0K3LDhMsyWOao0aDhSrgx441KcD7WUmlS6jt7S7EZXTM1AO4ampM1J
	jDJchK1RE/uvT2a34LgIqFzrwH4T55IVofTcjOODzvs1YPHLGGM0LdvEEmc4f2LpYArL
	YRWatLK+L/R8ITa49VZ/I1DGEopLfJKnHA/3dr8YW3lBimAvTjQXo/CgOEeOxa4eyfsP
	tl+Q==
X-Gm-Message-State: AIkVDXLD4gk1lAoj8GycNptZq5j53iaVWqdnklhrX6XDkXIrJJ+fzWECuxWZw7ZzmVyTbYkM32T0+Txx4YehFDVH
X-Received: by 10.200.39.212 with SMTP id x20mr7784450qtx.109.1486043277361;
	Thu, 02 Feb 2017 05:47:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Feb 2017 05:47:36 -0800 (PST)
In-Reply-To: <20170202132602.774-1-alexander.kanavin@linux.intel.com>
References: <20170202132602.774-1-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Feb 2017 13:47:36 +0000
Message-ID: <CAJTo0Lb4vpSwsxno7zKN0UNozYTYTo8wCMjOLNO6JApFcWuCEA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest: do not perform a full build in test_continue
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
X-List-Received-Date: Thu, 02 Feb 2017 13:47:59 -0000
Content-Type: multipart/alternative; boundary=001a1135b542ab1fba05478c6993

--001a1135b542ab1fba05478c6993
Content-Type: text/plain; charset=UTF-8

On 2 February 2017 at 13:26, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

>          runCmd('bitbake -c cleanall man xcursor-transparent-theme')
> -        result = runCmd('bitbake man xcursor-transparent-theme -k',
> ignore_status=True)
> +        result = runCmd('bitbake -c unpack -k man
> xcursor-transparent-theme', ignore_status=True)
>

I also have to ask why it does cleanall.  Why isn't clean sufficient?

Ross

--001a1135b542ab1fba05478c6993
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2017 at 13:26, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":3f6" class=3D"a3s aXjCH m159ff01c48799456">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0runCmd(&#39;bitbake -c cleanall man xcursor-transparent=
-theme&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;bitbake man xcursor-tra=
nsparent-theme -k&#39;, ignore_status=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D runCmd(&#39;bitbake -c unpack -k ma=
n xcursor-transparent-theme&#39;, ignore_status=3DTrue)<br></div></blockquo=
te></div><br>I also have to ask why it does cleanall.=C2=A0 Why isn&#39;t c=
lean sufficient?</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a1135b542ab1fba05478c6993--
