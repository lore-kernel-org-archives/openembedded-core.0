Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Uc5Pi-0002pX-QZ
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 04:56:38 +0200
Received: by mail-pb0-f45.google.com with SMTP id mc8so13904pbc.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 19:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=6TQF0a1ENVS9Yhn/PMuKSGM4GmPGGzpOAFzI85HIM1w=;
	b=0rdjEsr0sSs46LQhVRvfOPPKgrg2qfPULHfPHdn0wfFqmmBOB6qJvQIjxERx2kzYG3
	ccheHwBAplzCWzFeSlSwqAfi+JsOPpQavjRG8HSV89rqVa4qaW3FQJKh38lsIlucK3Z/
	b3spMfsigoJVfLzL/6ULJ4DYh1L1ipcIqWu1Y/O554ylaZO2LF6Yz0erMjcykLlTcO5c
	aZn6kBgllMdpvWP/ybPCffsLdVUs3dtVPLtQVmOT/Ltmb74C2xe9bADsI//UVuPZk8Ty
	1fFEPWgrodsSthV+yUdhaBFtB1gG0A1ZocgP1i9ohMl8Fnn+gYQ/pD+hbR0+gKIRZJhu
	q4iw==
X-Received: by 10.66.91.107 with SMTP id cd11mr32181295pab.74.1368499099600;
	Mon, 13 May 2013 19:38:19 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	kv2sm16123323pbc.28.2013.05.13.19.38.17 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 May 2013 19:38:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
Date: Mon, 13 May 2013 19:38:16 -0700
Message-Id: <D9D792CF-EAA0-4B7B-8C5D-9429196AEC70@gmail.com>
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
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.1503)
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
X-List-Received-Date: Tue, 14 May 2013 02:56:53 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

can you try this=20

add

SRCREV_machine_qemumips64 =3D "bbefde394205a1b317eae31942bfc13afce0b0ac"

to linux-yocto_3.8.bb

and rebuild the kernel and see if that boots

On May 13, 2013, at 7:18 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> On Mon, May 13, 2013 at 10:03 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Mon, May 13, 2013 at 10:01 PM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>>> By adding:
>>>=20
>>>    PREFERRED_VERSION_linux-yocto :=3D "3.8%"
>>=20
>> Yep. This is what I was about to recommend, but did you apply Khem's =
patches, or
>> use his contrib branch ?
>=20
> His contrib branch:
>=20
> Build Configuration:
> BB_VERSION        =3D "1.19.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "openSUSE-project-12.3"
> TARGET_SYS        =3D "mips64-poky-linux"
> MACHINE           =3D "qemumips64"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.3+snapshot-20130514"
> TUNE_FEATURES     =3D "n64 bigendian fpu-hard"
> TARGET_FPU        =3D ""
> meta-yocto        =3D =
"master:a9f5bf0ed398bf9cb861feaa8b6fefd8645b1d09"
> meta              =3D =
"kraj/qemumips64:b0592ab08273e17cb1511384ad189281f88c8b03"
>=20
>=20
> Are there patches to apply too?



