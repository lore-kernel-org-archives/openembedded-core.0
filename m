Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB5F60111
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 11:40:08 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id o2so37636362uae.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 04:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DKKcjD3OZjQ+S/bltBpXllpTGbBG8Cy8ORhObwxkfrk=;
	b=AyAsukfEp3YzA+yA1i2Qb8VVGpAt/M2d1d7hQSP6I7t3qZ5izNYKyoPlJlj01TIkEu
	WhT4hOseSwnwxqOrDejP43wyb3Yi1tLEYRoitXvaxc+8zEt4u50AVohCJZsYXn97kmKw
	f5X9rrhxF/kb878OGm417tGA9ry2srrxPls1RL72uK3TVFv8NCllC+UdqkUoxvg5YZoa
	paUn0JBnUZ8tRwPgZBpKNglTuQIUq8dCzvQK5CMzOW5Orgss5wxwbTH4bgFDOEX/aYUd
	c6cBKUbFFLl+HQTDkvV1INws5JxYLpc7NHBbqSjimObo7//twMKQgcWPgUToGfGgh/Mw
	GUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DKKcjD3OZjQ+S/bltBpXllpTGbBG8Cy8ORhObwxkfrk=;
	b=Ptkpw2jR6MHWexd7QeN9K7Yk094SPd8CxhgptP43IhTy4M8FejlQSIVucXQql+tc8Z
	b4tDpdtg9ehUr231dswGyp1/kmDbRwQXR/bZEkNlXQaF9eDBxca8gyUaa9aqz1mlGuQG
	1ULjdcS9u30Y1jS9kdN/7Nq2ix4/rUt+/CwvMG/fbbYjnDhhrGdmsG8y87wEbhBwGDbp
	kUOniFg5GUNahCWk2LOHHLsR15OcyLIjLlsWPyaaJfIy8iCpBzQibmr1xlq88n5ULNb8
	QD7DB+C0WTDr75vehHjawDbWpbPbqOrZVL/SwktNn4hxvR0iKT3znROAfAAWfWPG3VQj
	wQCg==
X-Gm-Message-State: APjAAAXQAoCl8Tx5POxTZ0YeFL3KvdApkl5Ek474PFrpeZkYFYkstWkS
	LjQbnlg7kFojBxsoYCTa9YKHdnOe8wBXa0ogqhKqTL2v6ek=
X-Google-Smtp-Source: APXvYqz3nbK4eHYCXtIgoDYq/huxoENoSg3z5FXnLUSaLz4sxd8hJsqtRVjhCU+AoBCMSoWyCp7tkXQ72bAmrmIxti0=
X-Received: by 2002:ab0:70c8:: with SMTP id r8mr12005319ual.89.1565350809331; 
	Fri, 09 Aug 2019 04:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190809111519.54789-1-alex.kanavin@gmail.com>
	<20190809113622.GA13062@localhost>
In-Reply-To: <20190809113622.GA13062@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Aug 2019 13:39:58 +0200
Message-ID: <CANNYZj-pHBnFgu_3csepO8NRUjMxWRy-GSBf_DhOE6RAd3odgg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gcc-cross-canadian: add missing runtime dependencies
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
X-List-Received-Date: Fri, 09 Aug 2019 11:40:08 -0000
Content-Type: multipart/alternative; boundary="000000000000f06cab058fada224"

--000000000000f06cab058fada224
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Aug 2019 at 13:36, Adrian Bunk <bunk@stusta.de> wrote:

> >  ELFUTILS = "nativesdk-elfutils"
> >  DEPENDS += "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}
> nativesdk-zlib"
> > -RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}"
> > +RDEPENDS_${PN} += "nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}
> nativesdk-glibc nativesdk-libgcc nativesdk-libstdc++ nativesdk-zlib
> nativesdk-gmp"
> > +RDEPENDS_${PN}_remove_sdkmingw32 = "nativesdk-glibc"
> >...
>
> These nativesdk-glibc dependencies look wrong for musl builds.
>

musl does not actually support nativesdk (only target builds), so it's safe
to hardcode glibc here.

Alex

--000000000000f06cab058fada224
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 9 Aug 2019 at 13:36, Adrian Bunk =
&lt;<a href=3D"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></di=
v><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">&gt;=C2=A0 ELFUTILS =3D &quot;nativesdk-elfutils&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;nativesdk-gmp nativesdk-mpfr nativesdk-libmpc=
 ${ELFUTILS} nativesdk-zlib&quot;<br>
&gt; -RDEPENDS_${PN} +=3D &quot;nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}=
&quot;<br>
&gt; +RDEPENDS_${PN} +=3D &quot;nativesdk-mpfr nativesdk-libmpc ${ELFUTILS}=
 nativesdk-glibc nativesdk-libgcc nativesdk-libstdc++ nativesdk-zlib native=
sdk-gmp&quot;<br>
&gt; +RDEPENDS_${PN}_remove_sdkmingw32 =3D &quot;nativesdk-glibc&quot;<br>
&gt;...<br>
<br>
These nativesdk-glibc dependencies look wrong for musl builds.<br></blockqu=
ote><div><br></div><div>musl does not actually support nativesdk (only targ=
et builds), so it&#39;s safe to hardcode glibc here.</div><div><br></div><d=
iv>Alex<br></div></div></div>

--000000000000f06cab058fada224--
