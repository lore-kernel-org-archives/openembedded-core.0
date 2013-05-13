Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1Ubz0V-0005lJ-Bg
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 22:06:05 +0200
Received: by mail-wg0-f52.google.com with SMTP id k13so6506004wgh.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 12:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=DOlrVDOMGZ4qGB1EngUeeUOxZKkcLRS4LeZCIrjcm0Q=;
	b=gdfrU7+u2XIdF7gal3lVpfnuR+bwrIsbMB4V9boU7zMvl8Bwija1Zn1AP5r6N2/1xU
	Y1PPtF3+SYnW+7x4QToN7FrqSzw3VFkjAOttR7RZSKmLXLuOLZhwctFpu2/ROCik2aBV
	Eqi7Am098ofpNTE9/9V1uqGx556XuuleCpCDMnjecKjTCPz/SQFoudObYKehGbtg1LqZ
	6rZBJyAkPBBjrGATw7OafI/rTCuiw4gwTV7bSHc9l0JEJn5qF91kyXV5hIw9y5kxRLpa
	p287OhCtjkZaqBbhAk3ZOZ4lkix6B0eMgwLcBckrLp/9FwhPRgSnjexPtBduhtnu4wky
	6OFw==
MIME-Version: 1.0
X-Received: by 10.180.20.148 with SMTP id n20mr21739283wie.8.1368474473433;
	Mon, 13 May 2013 12:47:53 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 13 May 2013 12:47:53 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1305131536070.2354@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
Date: Mon, 13 May 2013 15:47:53 -0400
Message-ID: <CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 May 2013 20:06:27 -0000
Content-Type: multipart/alternative; boundary=bcaec53f345ddf900504dc9eca42

--bcaec53f345ddf900504dc9eca42
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 13, 2013 at 3:38 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:
>   having unwisely wandered into this MIPS64 minefield a couple weeks
> back, i might as well see if i can get a build.  in short:
>
> * switch to kraj/qemumips64 branch of openembedded-core-contrib
> * add that as another layer along with oe-core


I believe you only need to add this oe-core/meta layer once. My
bblayers.conf contains:

     BBLAYERS ?= " \
          /home/trevor/devel/yocto/git/meta-poky/meta-yocto \
          /home/trevor/devel/yocto/git/meta-poky/meta-yocto-bsp \
          /home/trevor/devel/yocto/git/openembedded-core/meta \
          "
     BBLAYERS_NON_REMOVABLE ?= " \
          /home/trevor/devel/yocto/git/openembedded-core/meta \
          /home/trevor/devel/yocto/git/meta-poky/meta-yocto \
          "


> * MACHINE = "qemumips64"
> * bitbake a core-image-minimal
>
>   is there anything critical i'm forgetting? what's the safest simple
> image to try to build?  fetching is now underway ...

That's exactly what I tried.

I also removed the (default) poky/meta layer since (as I
understand it) the openembedded-core/meta layer replaces it.

--bcaec53f345ddf900504dc9eca42
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Mon, May 13, 2013 at 3:38 PM, Robert P. J. Day &lt;<a h=
ref=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<b=
r>&gt; =A0 having unwisely wandered into this MIPS64 minefield a couple wee=
ks<br>
&gt; back, i might as well see if i can get a build. =A0in short:<br>&gt;<b=
r>&gt; * switch to kraj/qemumips64 branch of openembedded-core-contrib<br>&=
gt; * add that as another layer along with oe-core<br><br><br>I believe you=
 only need to add this oe-core/meta layer once. My<div>
bblayers.conf contains:<br><br>=A0 =A0 =A0BBLAYERS ?=3D &quot; \<br>=A0 =A0=
 =A0 =A0 =A0 /home/trevor/devel/yocto/git/meta-poky/meta-yocto \<br>=A0 =A0=
 =A0 =A0 =A0 /home/trevor/devel/yocto/git/meta-poky/meta-yocto-bsp \<br>=A0=
 =A0 =A0 =A0 =A0 /home/trevor/devel/yocto/git/openembedded-core/meta \<br>
=A0 =A0 =A0 =A0 =A0 &quot;<br>=A0 =A0 =A0BBLAYERS_NON_REMOVABLE ?=3D &quot;=
 \<br>=A0 =A0 =A0 =A0 =A0 /home/trevor/devel/yocto/git/openembedded-core/me=
ta \<br>=A0 =A0 =A0 =A0 =A0 /home/trevor/devel/yocto/git/meta-poky/meta-yoc=
to \<br>=A0 =A0 =A0 =A0 =A0 &quot;<br><br><br>
&gt; * MACHINE =3D &quot;qemumips64&quot;<br>&gt; * bitbake a core-image-mi=
nimal<br>&gt;<br>&gt; =A0 is there anything critical i&#39;m forgetting? wh=
at&#39;s the safest simple<br>&gt; image to try to build? =A0fetching is no=
w underway ...<br>
<br>That&#39;s exactly what I tried.<br><br>I also removed the (default) po=
ky/meta layer since (as I</div><div>understand it) the openembedded-core/me=
ta layer replaces it.</div></div>

--bcaec53f345ddf900504dc9eca42--
