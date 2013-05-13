Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Uc0j6-0000TS-U0
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 23:56:15 +0200
Received: by mail-wg0-f54.google.com with SMTP id x12so6595370wgg.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 14:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=y+c25tbzNdCtWrCrCAwFQf3+Ydndeu3GiEAnaJNMm9I=;
	b=j31UvPZzsWYDJVI9VU8i7uhQ2CRCmovs1gKAvzFcdQ9GGfjiWUs5z7AlV0Pl4/Wsia
	iqaoWjHNUhfK9zNMcxw/BUQO35JgZ+2AmSaPfU1B3xZcKwTHopXYnLudME8vrFhaZ2Gx
	vrGHFaZWp540SmYaO0bUNh1d2mDPpkFP1dPBLkiKhWRMEq00lEBSYxZ5BEOeIYCaAc4j
	7D3d3p5h1Cgs0BsiVnXzD6Fe/L1FW7Nw/kl2mA3dJgLtM8TWpuLAPO7wxnsS/UzmCsEC
	Hxo3bSAOl9bjHDRKbUijjaJMz1EWeg2SPNkLik+nuSaPUkO/gbgcc3Aq6narngZe42wj
	so9A==
MIME-Version: 1.0
X-Received: by 10.180.37.133 with SMTP id y5mr149484wij.20.1368481082236; Mon,
	13 May 2013 14:38:02 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 14:38:02 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305131729130.13480@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131704540.13080@oneiric>
	<CAHUNapSJe0JNi2EikxLTFtTaoNWm3m9+_Lk68qreY+vSbdQsrg@mail.gmail.com>
	<alpine.DEB.2.02.1305131712570.13256@oneiric>
	<CAHUNapTaTrZ8A8zMiaAiqwYbZx09s096EHNDRCo0nOw5-EO8HA@mail.gmail.com>
	<alpine.DEB.2.02.1305131729130.13480@oneiric>
Date: Mon, 13 May 2013 17:38:02 -0400
Message-ID: <CAHUNapQcmVKd2iruA5ubzLBLJx6asQZK5Y_NhgBPZRnFUfUxcQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 21:56:21 -0000
Content-Type: multipart/alternative; boundary=e89a8f50335ac9e5fe04dca05421

--e89a8f50335ac9e5fe04dca05421
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 5:30 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Mon, 13 May 2013, Trevor Woerner wrote:
>
> > I'm building core-image-minimal, I assume that's what everyone else is
> doing.
> > When I run the "bitbake -s" as Robert is, I get the following:
> >
> > $ bitbake -s | grep linux
> > linux-dummy                                           :1.0-r1
>
> > linux-firmware
>  1:0.0+gitAUTOINC+c530a75c1e6a472b0eb9558310b518f0dfcd8860-r0
>
> >
> > linux-libc-headers                                    :3.8-r0
>
> > linux-libc-headers-yocto
> >
>  :3.4+git-AUTOINC+a1cdb60720c452c3965eaec3ec2cd10f06261cc5_a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r6
>
> >
> > linux-yocto
> >
> :3.8.11+gitAUTOINC+8482dcdf68f9f7501118f4c01fdcb8f851882997_dd089cb5ba37ea14e8f90a884bf2a5be64ed817d-r4.1
> >
> :3.4.43+gitAUTOINC+1bab5bd090948b4cc4c4ed57c834603a3cf9f235_fff57da7886cf5e99c07adf6649610cb1cd89330-r4.4
>
>  i'm confused ... why would you be building two versions of the
> kernel?
>

I'm not explicitly trying to build two versions of the kernel :-)

--e89a8f50335ac9e5fe04dca05421
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, May 13, 2013 at 5:30 PM, Robert P. J. Day <span di=
r=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rp=
jday@crashcourse.ca</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Mon, 13 May 2013, Trevo=
r Woerner wrote:<br>
<br>
</div><div class=3D"im">&gt; I&#39;m building core-image-minimal, I assume =
that&#39;s what everyone else is doing.<br>
&gt; When I run the &quot;bitbake -s&quot; as Robert is, I get the followin=
g:<br>
&gt;<br>
&gt; $ bitbake -s | grep linux<br>
&gt; linux-dummy =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 :1.0-r1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0<br>
&gt; linux-firmware =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01:0.0+gitAUT=
OINC+c530a75c1e6a472b0eb9558310b518f0dfcd8860-r0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0<br>
&gt; =A0 =A0 =A0<br>
&gt; linux-libc-headers =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0:3.8-r0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0<br>
&gt; linux-libc-headers-yocto =A0 =A0 =A0 =A0 =A0<br>
&gt; =A0:3.4+git-AUTOINC+a1cdb60720c452c3965eaec3ec2cd10f06261cc5_a1cdb6072=
0c452c3965eaec3ec2cd10f06261cc5-r6 =A0 =A0 =A0 =A0 =A0 =A0 =A0<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0<br>
&gt; linux-yocto =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<br>
&gt; :3.8.11+gitAUTOINC+8482dcdf68f9f7501118f4c01fdcb8f851882997_dd089cb5ba=
37ea14e8f90a884bf2a5be64ed817d-r4.1<br>
&gt; :3.4.43+gitAUTOINC+1bab5bd090948b4cc4c4ed57c834603a3cf9f235_fff57da788=
6cf5e99c07adf6649610cb1cd89330-r4.4<br>
<br>
</div>=A0i&#39;m confused ... why would you be building two versions of the=
<br>
kernel?<br>
<div class=3D"HOEnZb"><div class=3D"h5"></div></div></blockquote></div><br>=
</div><div class=3D"gmail_extra" style>I&#39;m not explicitly trying to bui=
ld two versions of the kernel :-)</div><div class=3D"gmail_extra" style><br=
></div>
<div class=3D"gmail_extra" style><br></div></div>

--e89a8f50335ac9e5fe04dca05421--
