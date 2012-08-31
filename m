Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T7UQv-00059x-Uk
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 18:51:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Aug 2012 09:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,348,1344236400"; d="scan'208";a="216375520"
Received: from unknown (HELO helios.localnet) ([10.252.121.160])
	by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2012 09:38:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Fri, 31 Aug 2012 17:38:42 +0100
Message-ID: <1409702.3ge2L51VIb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CALbNGRT51iB+D_7ShwYYx=KzDL=uafR_WTyYwQyjU+OSyFzknA@mail.gmail.com>
References: <CALbNGRT51iB+D_7ShwYYx=KzDL=uafR_WTyYwQyjU+OSyFzknA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Last update breaks build
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
X-List-Received-Date: Fri, 31 Aug 2012 16:51:02 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Friday 31 August 2012 18:30:55 Andreas M=FCller wrote:
> Hi,
>=20
> since the last layer updates I am not able to build. First I got
>=20
> WARNING: Consider updating kde-artwork-active recipe to use "protocol=
"
> not "proto" in SRC_URI.
>=20
>                                                    | ETA:  00:01:13
>=20
> WARNING: OPIE_VERSION has not been set; if you are going to build
> Opie, you need to 'require' an appropriate .inc file from
> meta-opie/conf/distro/include                                        =
|
> ETA:  00:01:47
> ERROR: Error executing a python function in <code>:
> ExpansionError: Failure expanding variable FILESPATH, expression was
> ${@base_set_filespath([
> "/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-ico=
n-reloa
> d/opie-icon-reload-0-${OPIE_SRCREV}-r0",
> "/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-ico=
n-relo
> ad/opie-icon-reload-0-${OPIE_SRCREV}",
> "/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-ico=
n-relo
> ad/opie-icon-reload",
> "/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-ico=
n-relo
> ad/opie-icon-reload-0-${OPIE_SRCREV}",
> "/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-ico=
n-relo
> ad/opie-icon-reload",
> "/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-ico=
n-relo
> ad/files",
> "/home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-ico=
n-relo
> ad" ], d)} which triggered exception SyntaxError: EOL while scanning
> string literal (FILESPATH, line 1)
>=20
> ERROR: The stack trace of python calls that resulted in this
> exception/failure was:
> ERROR:   File "<code>", line 2, in <module>
> ERROR:
> ERROR:   File
> "__anon_564__home_Superandy_data_oe_core_sources_openembedded_core_me=
ta_cla
> sses_base_bbclass", line 200, in
> __anon_564__home_Superandy_data_oe_core_sources_openembedded_core_met=
a_clas
> ses_base_bbclass ERROR:
> ERROR:   File
> "/home/Superandy/oe-core/sources/bitbake/lib/bb/data_smart.py", line =
290,
> in getVar
> ERROR:     return self.expand(value, var)
> ERROR:
> ERROR:   File
> "/home/Superandy/oe-core/sources/bitbake/lib/bb/data_smart.py", line =
154,
> in expand
> ERROR:     return self.expandWithRefs(s, varname).value
> ERROR:
> ERROR:   File
> "/home/Superandy/oe-core/sources/bitbake/lib/bb/data_smart.py", line =
144,
> in expandWithRefs
> ERROR:     raise ExpansionError(varname, s, exc)
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:    =20
> 0001:__anon_125__home_Superandy_data_oe_core_sources_openembedded_cor=
e_meta
> _classes_staging_bbclass(d) ERROR:  ***
> 0002:__anon_564__home_Superandy_data_oe_core_sources_openembedded_cor=
e_meta
> _classes_base_bbclass(d) ERROR:    =20
> 0003:__anon_218__home_Superandy_data_oe_core_sources_openembedded_cor=
e_meta
> _classes_package_bbclass(d) ERROR:    =20
> 0004:__anon_452__home_Superandy_data_oe_core_sources_openembedded_cor=
e_meta
> _classes_package_ipk_bbclass(d) ERROR:    =20
> 0005:__anon_756__home_Superandy_data_oe_core_sources_openembedded_cor=
e_meta
> _classes_insane_bbclass(d) ERROR:    =20
> 0006:__anon_20__home_Superandy_data_oe_core_sources_openembedded_core=
_meta_
> classes_debian_bbclass(d) ERROR: [From file: '<code>', lineno: 2, fun=
ction:
> <module>]
> ERROR:      0196:    #
> ERROR:      0197:    override =3D d.getVar('SRC_URI_OVERRIDES_PACKAGE=
_ARCH',
> True) ERROR:      0198:    if override !=3D '0':
> ERROR:      0199:        paths =3D []
> ERROR:  *** 0200:        fpaths =3D (d.getVar('FILESPATH', True) or
> '').split(':') ERROR:      0201:        machine =3D d.getVar('MACHINE=
', True)
> ERROR:      0202:        for p in fpaths:
> ERROR:      0203:            if os.path.basename(p) =3D=3D machine an=
d
> os.path.isdir(p):
> ERROR:      0204:                paths.append(p)
> ERROR: [From file:
> '__anon_564__home_Superandy_data_oe_core_sources_openembedded_core_me=
ta_clas
> ses_base_bbclass', lineno: 200, function:
> __anon_564__home_Superandy_data_oe_core_sources_openembedded_core_met=
a_class
> es_base_bbclass] ERROR: Failed to parse recipe:
> /home/Superandy/data/oe-core/sources/meta-opie/recipes-opie/opie-icon=
-reload
> /opie-icon-reload_git.bb WARNING: OPIE_VERSION has not been set; if y=
ou are
> going to build
> Opie, you need to 'require' an appropriate .inc file from
> meta-opie/conf/distro/include
> ERROR: Command execution failed: Exited with 1
>=20
>=20
> After removing meta-opie I now get
>=20
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration. Either fix the cause of this error or at your own r=
isk
> disable the checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
>=20
>     DISTRO 'angstrom-v2012.x' not found. Please set a valid DISTRO in=

> your local.conf
>=20
> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
> ERROR: Command execution failed: Exited with 1
>=20
> Do we have now poky world domination?

Er, don't blame poky for the rename of angstrom-2012.x to angstrom-next=
 in=20
meta-angstrom master...

(Although granted, this error spew is rather nasty and hides the actual=
=20
problem.)

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


