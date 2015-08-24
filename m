Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9D20B6AC1E;
	Mon, 24 Aug 2015 11:11:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 24 Aug 2015 04:11:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,737,1432623600"; d="scan'208";a="774490230"
Received: from achalot-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.62])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2015 04:11:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Date: Mon, 24 Aug 2015 12:11:34 +0100
Message-ID: <5607133.YNgYITpZsc@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAFeBWL6xGuzEcOR5B1sfEgZR=i-T=EZ-b-TKPT9DGZpCmDPy4g@mail.gmail.com>
References: <CAFeBWL6xGuzEcOR5B1sfEgZR=i-T=EZ-b-TKPT9DGZpCmDPy4g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Extensible SDK install errors
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
X-List-Received-Date: Mon, 24 Aug 2015 11:11:39 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Adam,

On Friday 21 August 2015 15:06:25 Adam Lee wrote:
> Hello, I built the Extensible SDK on Fido (bitbake core-image-minimal=
 -c
> populate_sdk_ext).
>=20
> During the installation I get this permission error:
>=20
> $ ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh
>=20
> > Enter target directory for SDK (default: /opt/poky/1.8):
> > You are about to install the SDK to "/opt/poky/1.8". Proceed[Y/n]?
> > Extracting SDK...done
> > Setting it up...
> > Extracting buildtools...
> > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:=
 line
> > 148: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: Per=
mission
> > denied
> > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:=
 line
> > 151: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: Per=
mission
> > denied
> > ./poky-glibc-x86_64-core-image-minimal-armv5e-toolchain-ext-1.8.sh:=
 line
> > 155: /opt/poky/1.8/environment-setup-armv5e-poky-linux-gnueabi: Per=
mission
> > denied
> > mv: cannot move =E2=80=98x86_64-nativesdk-libc.tar.bz2=E2=80=99 to
> > =E2=80=98/opt/poky/1.8/layers/poky/x86_64-nativesdk-libc.tar.bz2=E2=
=80=99: Permission
> > denied Preparing build system...
> > sh: 1: cannot create preparing_build_system.log: Permission denied
> > SDK preparation failed: see /opt/poky/1.8/preparing_build_system.lo=
g
>=20
>  It looks like `/opt/poky/1.8/layers/poky` directory belongs to the r=
oot
> user:
>=20
> $ ls -l /opt/poky/1.8/layers/
>=20
> > total 36
> > drwxrwxr-x 9 root root 4096 Jun 16 10:25 meta-gnome
> > drwxrwxr-x 9 root root 4096 Jun 15 10:44 meta-multimedia
> > drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-networking
> > drwxrwxr-x 20 root root 4096 Jun 15 10:44 meta-oe
> > drwxrwxr-x 7 root root 4096 Jun 15 10:44 meta-python
> > drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-ruby
> > drwxrwxr-x 5 root root 4096 Jun 15 10:44 meta-systemd
> > drwxrwxr-x 11 root root 4096 Jun 15 10:44 meta-xfce
> > drwxrwxr-x 13 root root 4096 Aug 21 14:46 poky
>=20
>  I may have missed something obvious. Has anyone seen this?

Basically you shouldn't be installing the extensible SDK as root. We ou=
ght to=20
be telling you about this up front and we should have a more reasonable=
=20
default path - these are open bugs and patches are in review on the lis=
t to fix=20
them.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

