Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QFYkV-0000ws-9Y
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 23:27:47 +0200
Received: by ewy5 with SMTP id 5so991837ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2011 14:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=koytmOVo5SmNXWqZaHj3jOffF7eyTz+zB3VmuDqwTMI=;
	b=RZ2znHdX2TNWowizoQam4thktHuAToparwUlwOXJ7OAwJ53pMvpzQhBYD4cSfC7cjW
	FjFEpIvyqNQCbYawTaZU7nKIL3Ii7oINeMR2AitbJFcJRQLioxdiQLpd8O3zRA2uDwEC
	NbSXxf1T6s2ShSMyHs4ZvfONBEa/owF2oPcho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=iQB56T1eT4gPUDQs8UIFeFZHH+AU2IHKHJnJW+do0VWFhMDlLdkMRS4Tb8rb3e2rcb
	lEuCzBH74cbm3eHF6z/RfyZUaZ/GtWixmv752+neK+3vP1N5CSTG39JF26Z9IGOiZnoi
	BXilFAatRc2EhIRkE4rN+2XUkhxGkMWh1G/Y8=
Received: by 10.14.17.103 with SMTP id i79mr1858577eei.13.1304025913160; Thu,
	28 Apr 2011 14:25:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Thu, 28 Apr 2011 14:24:43 -0700 (PDT)
In-Reply-To: <4DB9D856.7030709@windriver.com>
References: <4DB9D856.7030709@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2011 14:24:43 -0700
Message-ID: <BANLkTik8RuWrHsg6sNPq7peW6=9agGYwuA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core and MacOS X
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
X-List-Received-Date: Thu, 28 Apr 2011 21:27:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2011 at 2:12 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> I've started working on getting bitbake and OE-Core building on MacOS X. =
=C2=A0So far
> what I have are some pretty hacky patches.. but they should be a reasonab=
le start.
>

You might be interested in
http://git.openembedded.org/cgit.cgi/openembedded/log/?h=3Dkoen/darwin-host=
-fixes
there might be some interesting bits still relevant

> I've pushed my changes to the git://git.pokylinux.org/poky-contrib.git
> repository and the "mhatle/macosx/bitbake" and "mhatle/macosx/oe-core" br=
anches.
>
> The way I am doing builds is:
>
> git clone git://git.pokylinux.org/poky-contrib.git oe-core
> cd oe-core
> git checkout mhatle/macosx/oe-core
> git clone . bitbake
> cd bitbake
> git checkout mhatle/macosx/bitbake
> cd ..
> . ./oe-init-build-env build-macosx
>
>
> Then you edit the conf/local.conf, add the following to the top of the fi=
le:
>
> BUILD_ARCH =3D "x86_64"
> TARGET_OS =3D "linux"
>
> PREFERRED_VERSION_pseudo-native =3D "1.0+git%"
> PSEUDOSRCREV =3D "481c6ff64f8aa6de01d3cb4042914f8e9f8d0abb"
>
> PATCHRESOLVE =3D 'noop'
>
> DISTRO =3D 'poky'
>
>
> This allows me to build through the stage 1 part of the build (pseudo) an=
d onto
> the second stage.. it gets the 'gmp' and fails.
>
> On my Mac OS X machine, I need to install the following items (beyond the=
 normal
> BSD tools):
>
> gawk, git, mercurial, sed, tar and wget
>
> --Mark
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


