Received: from mail-wg0-f53.google.com ([74.125.82.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UcfgT-00017Z-6R
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 19:41:05 +0200
Received: by mail-wg0-f53.google.com with SMTP id y10so1884534wgg.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=5lbOk1Hp2b6yJbZUZk8Z7kHKK6AzlAubxU7gIWM4Nuo=;
	b=IvHmnV03PfWP0yk9p22Yc9OzU34ijKyx8os8CP62FnsYhHrctaii5dTXzx9p0UdqnG
	7WbrMUYtWn8we/RGwdsGQYPzKCSEQl0sJFpSRB1IvEjkugtVT8LoRCrDWMIIXCKTPCPK
	ELCmirbiHg7z9JjngxdXSyZRVgjROc2kaY9fKglpf99y38F/1li5yza1FmFAOoEsd9zp
	Ze41F4ElZB9Yn9Ev7BX/UoCUPslc4tRlNaCxu6VHEbmr8Im2ZrwXmaCpIW0t0SIj7K2q
	PXvpFzA3svQEqJ1Ap5Ws2dqm/4EE79cMMPS21BKUIuuMzTE13KZSna/PL8e1a6WYdHv7
	pcnw==
MIME-Version: 1.0
X-Received: by 10.180.21.242 with SMTP id y18mr16282147wie.7.1368638520284;
	Wed, 15 May 2013 10:22:00 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Wed, 15 May 2013 10:22:00 -0700 (PDT)
In-Reply-To: <CADkTA4M+Ya24qHwFbB-ETyGwTM-8p_OvuzkUF4yDaQ+=iDZQuA@mail.gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
	<D9D792CF-EAA0-4B7B-8C5D-9429196AEC70@gmail.com>
	<alpine.DEB.2.02.1305140423590.26605@oneiric>
	<CADkTA4O1VFk1juzepWzjV1FjF9F2J_A83ga92USdgxwegd3Qwg@mail.gmail.com>
	<alpine.DEB.2.02.1305140824360.23009@oneiric>
	<CADkTA4M+Ya24qHwFbB-ETyGwTM-8p_OvuzkUF4yDaQ+=iDZQuA@mail.gmail.com>
Date: Wed, 15 May 2013 13:22:00 -0400
Message-ID: <CAHUNapTw8-B5AEk2YN3t+vRkjwVOS65Ehs6HV5RkbipYUWpS3A@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 15 May 2013 17:41:23 -0000
X-List-Received-Date: Wed, 15 May 2013 17:41:23 -0000
Content-Type: multipart/alternative; boundary=047d7bb70b2cd3dae304dcc4fcf8

--047d7bb70b2cd3dae304dcc4fcf8
Content-Type: text/plain; charset=ISO-8859-1

What really confuses me about the attempts I was making is that in
my local.conf file I have explicitly asked for kernel version 3.8.11:

    PREFERRED_VERSION_linux-yocto := "3.8.11%"

When I watch the build messages fly by I see that linux-yocto_3.8.11
is being built.

In my work directory there is a directory called:


tmp/work/qemumips64-poky-linux/linux-yocto/3.8.11+gitAUTOINC+8482dcdf68f9f7501118f4c01fdcb8f851882997_bbefde394205a1b317eae31942bfc13afce0b0ac-r4.1/

but when I got into the


tmp/work/qemumips64-poky-linux/linux-yocto/3.8.11+gitAUTOINC+8482dcdf68f9f7501118f4c01fdcb8f851882997_bbefde394205a1b317eae31942bfc13afce0b0ac-r4.1/linux

directory and have a look at the Makefile, I see:

     VERSION = 3
     PATCHLEVEL = 8
     SUBLEVEL = 4
     EXTRAVERSION =
     NAME = Unicycling Gorilla

and when I boot the image the kernel banner says:

    Linux version 3.8.4-yocto-standard (trevor@zzz) (gcc version 4.7.2
(GCC) ) #1 PREEMPT Tue May 14 11:10:07 EDT 2013

Can anyone explain the discrepancy?

--047d7bb70b2cd3dae304dcc4fcf8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What really confuses me about the attempts I was making is=
 that in<br>my local.conf file I have explicitly asked for kernel version 3=
.8.11:<br><br>=A0 =A0 PREFERRED_VERSION_linux-yocto :=3D &quot;3.8.11%&quot=
;<br>
<br>When I watch the build messages fly by I see that linux-yocto_3.8.11<br=
>is being built.<br><br>In my work directory there is a directory called:<b=
r><br>=A0 =A0 tmp/work/qemumips64-poky-linux/linux-yocto/3.8.11+gitAUTOINC+=
8482dcdf68f9f7501118f4c01fdcb8f851882997_bbefde394205a1b317eae31942bfc13afc=
e0b0ac-r4.1/<br>
<br>but when I got into the<br><br>=A0 =A0 tmp/work/qemumips64-poky-linux/l=
inux-yocto/3.8.11+gitAUTOINC+8482dcdf68f9f7501118f4c01fdcb8f851882997_bbefd=
e394205a1b317eae31942bfc13afce0b0ac-r4.1/linux<br><br>directory and have a =
look at the Makefile, I see:<br>
<br>=A0 =A0 =A0VERSION =3D 3<br>=A0 =A0 =A0PATCHLEVEL =3D 8<br>=A0 =A0 =A0S=
UBLEVEL =3D 4<br>=A0 =A0 =A0EXTRAVERSION =3D<br>=A0 =A0 =A0NAME =3D Unicycl=
ing Gorilla<br><br>and when I boot the image the kernel banner says:<br><br=
>=A0 =A0 Linux version 3.8.4-yocto-standard (trevor@zzz) (gcc version 4.7.2=
 (GCC) ) #1 PREEMPT Tue May 14 11:10:07 EDT 2013<div>
<br></div><div>Can anyone explain the discrepancy?</div></div>

--047d7bb70b2cd3dae304dcc4fcf8--
