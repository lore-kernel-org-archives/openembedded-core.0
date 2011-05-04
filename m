Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QHkKb-00073N-En
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 00:14:05 +0200
Received: by pxi6 with SMTP id 6so1058779pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 15:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=3z0i3tVXV9h2o+RSWsluvftoYqEPUvvzWfNF7AiohYQ=;
	b=HwrW/75IRStE11/aQ/9cYZU6ENg180RBQdkpzL44VRIShEDDda+Fnp55CkN53zLu1p
	ZBHzeaCi9IWbrtI8wKqqqMcV52Om1mdOxk1zxAR7hfzOO6wYMhP8Vz8zETzApxE+/+8g
	z9KmtuhHj19RPKEfKrsf97OAEOgiEx0RWGh0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lJ2n71ryWLqGPdj16ja1HK04r1+urV3Vs3MPLdDPja2Y4CdtC8yHe8dpM59QSifRt8
	F66ytAiFyCEKRILE8b7PMqT+GtnzzE4FVFa82xPFl1uBaFEX/ZWK5o5iw2UXoG6Hg3TP
	nl6z7Yq5YysDau1PlwPR1kaj0qRa0lgZtenRw=
MIME-Version: 1.0
Received: by 10.68.25.166 with SMTP id d6mr2144879pbg.136.1304547085344; Wed,
	04 May 2011 15:11:25 -0700 (PDT)
Received: by 10.68.56.161 with HTTP; Wed, 4 May 2011 15:11:25 -0700 (PDT)
In-Reply-To: <4DC08242.4030009@windriver.com>
References: <BANLkTikxo4jWt7zKciXt1w4iiJYHg=WnqQ@mail.gmail.com>
	<4DC08242.4030009@windriver.com>
Date: Thu, 5 May 2011 00:11:25 +0200
Message-ID: <BANLkTi=1tm0iGL6m168cHxP6uaLN5CVj3A@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: error: LOOP: udev/ libudev during do_rootfs?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2011 22:14:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Mark,

thanks for your response.

On Wed, May 4, 2011 at 12:31 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 5/3/11 5:19 PM, Leon Woestenberg wrote:
>> on oe-core I'm testing the addition of powerpc-linux-gnuspe targets.
>> | error: LOOP:
>> | error: removing udev-164-r1.ppce500v2 "Requires: libudev0 >=3D 164"
>> from tsort relations.
>> | error: removing libudev0-164-r1.ppce500v2 "Requires: udev =3D 164-r1"
>> from tsort relations.
>> | Preparing... =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0##########################=
########################
>> | ERROR: Function 'do_rootfs' failed (see
>
> In the past I've only seen this type of "mystery" failure when PSEUDO was=
 not be
> run properly. =A0(pseudo is being configured by the "bitbake" wrapper, lo=
cated in
> the scripts directory. =A0It has to be preloaded by the wrapper for perfo=
rmance
> reasons during the build.) =A0If you are not using the bitbake wrapper sc=
ript
> (automatically added to your environment when you use the environment set=
up
> script oe-init-build-env) you will need to either use the environment set=
up
> script, or add the wrapper to your path [or call it directly].
>
> If the wrapper is being invoked, I have some further checks to verify beh=
avior
> on your system.
>
> If the failures continue, what type of host system do you have (distro), =
and
> what version of libc? =A0Do you have both 32-bit and 64-bit libraries and
> executables installed?
>
Ubuntu 10.04 32-bit only, glibc 2.11.1
Linux sideways 2.6.32-25-generic-pae #44-Ubuntu SMP Fri Sep 17
21:57:48 UTC 2010 i686 GNU/Linux

$ . oe-init-build-env
$ which bitbake
/home/leon/sandbox/sidebranch/yocto/oe-core/scripts/bitbake

OE Build Configuration:
BB_VERSION        =3D "1.13.0"
METADATA_BRANCH   =3D "master"
METADATA_REVISION =3D "472c04ed1a8715243de0c5430883bc23d60aca19"
TARGET_ARCH       =3D "powerpc"
TARGET_OS         =3D "linux-gnuspe"
MACHINE           =3D "p2020rdb"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "0.9+snapshot-20110504"
TARGET_FPU        =3D ""

I could reproduce twice from scratch, and the problem repeats by
running bitbake core-image-minimal again.

On an earlier snapshot of oe-core with meta-openembedded, I didn't run
into this.

I will now rerun against MACHINE=3Dmpc8315e-rdb.

Regards,

Leon.


