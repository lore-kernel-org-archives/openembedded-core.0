Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id AB4956072C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 14:13:50 +0000 (UTC)
Received: by iofh3 with SMTP id h3so82052823iof.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 06:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=P7/TgVJNiesWYiXqFvshpiqNici6QoFKiR2F1Q6OwZk=;
	b=RI5+RAYENDvjLQFJmdu5xPLO6H1hAkhcUyA6gzW2e5A7J6mU0wqFeyhl6FX5y596lN
	hcKjOAAdBMDWX5Hw5feIuhEXOCqU8Sihym+iqCCBpP/5nhJP3T2LO93NviVJsNP7YrXV
	iuVW5XbMWPZHB5pNz7ngixSayink2AWJIZh724M07q2wwP8Owf9McrbM9WZgCXPgUTLy
	bwf4V7FlNndaX7tDEPdua1xb6O13pMEEsob+5lsztXDuZg+gJ/mSD1yRPnM9AGgmyLQi
	tdXshskU6VgSv5saQyf9qxWQpHX68RTnZ9KjS2D0xKNM5YOAjs6o1vZAi0AIbhR041tX
	2oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=P7/TgVJNiesWYiXqFvshpiqNici6QoFKiR2F1Q6OwZk=;
	b=mMDIHXXesUKwx43M9YYJc73gZv8Kkca2mdecVkSNyFYVgpcaw0NaT+U+0eLsRlAvAu
	naH7zFs6PKOEveVRvkFzyyZFSZHPJci5zxf8I64+y+MqcseBifq5H30v3W8nwd9lAW2Q
	TlJk1J0AZj8nOq100S1yzbMxItVp0aIsAhetImNqY5OaVh8MnbHCkaSMrYy+wGtZhzyN
	IgDm1AN4+SyC9Nncd6EuZRSa8ApjvdJ9TV++KI8Nq0gUAPyc9P9gBs5hP28tJcG8DBMz
	S+egbdypL4po/AoVNm6N7QvGp2MskSanEirBGiu2iVZHpOphrSE67vefCIxwNGPe6Fq2
	nl9A==
X-Gm-Message-State: ALoCoQm5S7Pm/tELzVcE4G2Ei9+/5L9EvumIb+UFgXX3rQbr+BwcdDPu2X72La3tV8tg2pg89QTd
X-Received: by 10.107.130.155 with SMTP id m27mr10152860ioi.133.1449152031189; 
	Thu, 03 Dec 2015 06:13:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 3 Dec 2015 06:13:31 -0800 (PST)
In-Reply-To: <acbe0c86991efd2efd47b5863d5207c92bb90b70.1449123744.git.kai.kang@windriver.com>
References: <cover.1449123744.git.kai.kang@windriver.com>
	<acbe0c86991efd2efd47b5863d5207c92bb90b70.1449123744.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Dec 2015 14:13:31 +0000
Message-ID: <CAJTo0Lb0qXpx0RL23XCfrh3JV_pDnDrENWyoyoehQTX6uNhqoA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] packagegroup-core-tools-testapps: disable kexec for mips64 and mis64n32
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
X-List-Received-Date: Thu, 03 Dec 2015 14:13:53 -0000
Content-Type: multipart/alternative; boundary=001a113ecd940b8d2d0525ff00f2

--001a113ecd940b8d2d0525ff00f2
Content-Type: text/plain; charset=UTF-8

On 3 December 2015 at 06:32, <kai.kang@windriver.com> wrote:

> @@ -15,6 +15,8 @@ inherit packagegroup
>  KEXECTOOLS ?= "kexec"
>  KEXECTOOLS_mips ?= ""
>  KEXECTOOLS_mipsel ?= ""
> +KEXECTOOLS_mips64 ?= ""
> +KEXECTOOLS_mips64n32 ?= ""
>  KEXECTOOLS_powerpc ?= ""
>  KEXECTOOLS_e5500-64b ?= ""
>  KEXECTOOLS_aarch64 ?= ""
>

I've rebased this on top of Maxin's patch that removed many of these
exclusions (mips, mipsel, powerpc, aarch64), but could you confirm that is
the right thing to do?

Ross

--001a113ecd940b8d2d0525ff00f2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 December 2015 at 06:32,  <span dir=3D"ltr">&lt;<a href=3D"mailto:kai.k=
ang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":6pz" class=3D"a3s" sty=
le=3D"overflow:hidden">@@ -15,6 +15,8 @@ inherit packagegroup<br>
=C2=A0KEXECTOOLS ?=3D &quot;<span class=3D"il">kexec</span>&quot;<br>
=C2=A0KEXECTOOLS_mips ?=3D &quot;&quot;<br>
=C2=A0KEXECTOOLS_mipsel ?=3D &quot;&quot;<br>
+KEXECTOOLS_mips64 ?=3D &quot;&quot;<br>
+KEXECTOOLS_mips64n32 ?=3D &quot;&quot;<br>
=C2=A0KEXECTOOLS_powerpc ?=3D &quot;&quot;<br>
=C2=A0KEXECTOOLS_e5500-64b ?=3D &quot;&quot;<br>
=C2=A0KEXECTOOLS_aarch64 ?=3D &quot;&quot;</div></blockquote></div><br>I&#3=
9;ve rebased this on top of Maxin&#39;s patch that removed many of these ex=
clusions (mips, mipsel, powerpc, aarch64), but could you confirm that is th=
e right thing to do?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113ecd940b8d2d0525ff00f2--
