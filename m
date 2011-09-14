Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R3dzi-0003Wn-FX
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 03:10:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Sep 2011 18:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="48014125"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 13 Sep 2011 18:05:18 -0700
Received: from pgsmsx101.gar.corp.intel.com (10.221.44.78) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 14 Sep 2011 09:03:34 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 14 Sep 2011 09:03:33 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 14 Sep 2011 09:03:25 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 14 Sep 2011 09:03:24 +0800
Thread-Topic: [OE-core] [PATCH 1/3] package_rpm: add architecture info in
	rpm spec file
Thread-Index: AcxyLg9kKiSqtdZHRsmG9LLQxei46QAQUtBg
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D81DF002@shsmsx501.ccr.corp.intel.com>
References: <cover.1315815933.git.dongxiao.xu@intel.com>
	<85e223c8783eca48835226c2786e60b2c67e66df.1315815933.git.dongxiao.xu@intel.com>
	<4E6E1C8A.5060508@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D754AFF1@shsmsx501.ccr.corp.intel.com>
	<4E6F76C7.6050606@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D754B5B6@shsmsx501.ccr.corp.intel.com>
	<4E6F7DC2.4010000@windriver.com>
In-Reply-To: <4E6F7DC2.4010000@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] package_rpm: add architecture info in rpm spec file
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
X-List-Received-Date: Wed, 14 Sep 2011 01:10:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> -----Original Message-----
> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> Sent: Tuesday, September 13, 2011 11:59 PM
> To: Xu, Dongxiao
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/3] package_rpm: add architecture info in =
rpm
> spec file
>=20
> On 9/13/11 10:41 AM, Xu, Dongxiao wrote:
> > Hi Mark,
> >
> >> -----Original Message-----
> >> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> >> Sent: Tuesday, September 13, 2011 11:29 PM
> >> To: Xu, Dongxiao
> >> Cc: Patches and discussions about the oe-core layer
> >> Subject: Re: [OE-core] [PATCH 1/3] package_rpm: add architecture info
> >> in rpm spec file
> >>
> >> On 9/12/11 9:24 PM, Xu, Dongxiao wrote:
> >>> Hi Mark,
> >>>
> >>>> -----Original Message-----
> >>>> From: openembedded-core-bounces@lists.openembedded.org
> >>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf
> >>>> Of Mark Hatle
> >>>> Sent: Monday, September 12, 2011 10:52 PM
> >>>> To: openembedded-core@lists.openembedded.org
> >>>> Subject: Re: [OE-core] [PATCH 1/3] package_rpm: add architecture
> >>>> info in rpm spec file
> >>>>
> >>>> This patch is incorrect.  Architectural information should not be
> >>>> in the dependencies within RPM packages.
> >>>>
> >>>> RPM is expected to find the proper version of a package to install
> >>>> based on the existing dependency information.  I'm in the process
> >>>> of investigating why certain items are not found properly.
> >>>
> >>> Take "task-core-boot-1.0-r8.qemux86_64.rpm" as an example, and it
> >>> has
> >> dependency on tinylogin, how can it determine whether it is depends on=
 "
> >> tinylogin-1.4-r7.x86_64.rpm" or "tinylogin-1.4-r7.x86.rpm".
> >>
> >> In this case, it should not matter which one it uses.  If the
> >> dependency is on "tinylogin", then either of them fulfills the
> >> dependency.  RPM should be selecting which one to bring in using it's
> >> internal policy manager.  (I believe the default is that 64-bit
> >> wins...)
> >
> > I think it DOES matter on which one it uses. Thinking the case that if =
a user
> wants to build a pure 64 bit system, and if it could not correctly choose=
 the 64
> bit of tinylogin, then his system will be contaminated with 32bit
> programs/libraries.
>=20
> With the current way oe-core processes packages into images it uses the
> dependencies.. so no matter what you have built you are only guaranteed t=
hat
> the resulting image contains that final dependency and whatever is needed=
 to
> make it "work".  There is nothing that says (today) that you will get a p=
ure
> 64-bit or 32-bit system -- other then as an artifact of only building 32-=
bit or
> 64-bit software.

Let me take another case as an example during my debugging to this issue.

Thinking that you have built out an base qemux86-64 image, and several lib3=
2 multilib packages. Due to the wrong selection when doing RPM, we have sev=
eral packages (like libgtk), which need x86-64 version installed, however t=
hey are replace by 32bit packages. The do_rootfs process succeeded, but whe=
n booting the image, some Xserver programs fail to find /usr/lib64/libgtk.s=
o, because in the system only /usr/lib/libgtk.so is installed, which caused=
 the X start failure.

>=20
> There are different strategies we can use to deal with these situations.
>=20
> 1) Resolve the "base" non-multilib system "first", then augment it with t=
he
> multilib components.  This results in a "base system" + alternative packa=
ges.
>=20
> 2) Resolve the system as whole, including multilibs, and use the policy
> components to determine the "best match".  (best match may not be working
> right
> today)  This results in a system based purely on dependency matches.
>=20
> Either way, our current implementation doesn't quite match either of them=
.
> We're closer to the second version of the implementation today....
>=20
> If the base system approach is what we want, vs the pure dependency based
> system, then we will need to change the way the dependencies are being
> resolved and the ordering of the resolution in the packages_rpm.bbclass (=
or
> rootfs_rpm.bbclass).  Basically:
>=20
> *) take the list of dependencies and filter out any multilibs, and only s=
can them
> against the base archs.
>=20
> *) add to that resolution any multilib components that had been filtered =
out
> and scan against the all archs.
>=20
> ....
>=20
> *) install as we do today

I ever tried the second approach to fix the problem, however it failed.

I split the installation into two parts as you mentioned, first part is to =
install the base arch packages, and it does succeed. The second part is to =
install resolution to multilib components, when calculating the dependency,=
 we will find "package xxx is already installed" error will be detected aga=
in by the "justdb" installation. I think there are wrong RPM dependency whe=
n installing lib32 multilib packages. showed as follows:

Processing locale-base-en-us...
Processing locale-base-en-gb...
Processing task-core-boot...
Processing task-core-apps-console...
Processing task-core-ssh-dropbear...
Processing task-core-apps-x11-pimlico...
Processing task-core-x11-sato...
Processing zypper...
Processing task-core-x11-base...
Processing task-core-apps-x11-games...
Processing task-core-apps-x11-core...
Processing task-base-extended...
Processing rpm...
Manifest: /distro/dongxiao/build-ml6/tmp/work/qemux86_64-poky-linux/core-im=
age-sato-1.0-r0/rootfs/install/install.manifest
Preparing...                ###############################################=
###
libc6                       ###############################################=
###
update-rc.d-dbg             ###############################################=
###
gst-meta-audio              ###############################################=
###
pciutils-ids                ###############################################=
###
...
...
Processing lib32-connman-gnome...
Processing lib32-task-base-3g...
Processing lib32-task-base-wifi...
Processing lib32-task-base-bluetooth...
Manifest: /distro/dongxiao/build-ml6/tmp/work/qemux86_64-poky-linux/core-im=
age-sato-1.0-r0/rootfs/install/install_multilib.manifest
Preparing...                ###############################################=
###
error: Install/Erase problems:
        package libc6-2.13-r14+svnr14157.x86_64 is already installed
        package update-rc.d-dbg-0.7-r4.all is already installed
        package gst-meta-audio-0.10-r10.x86_64 is already installed
        package pciutils-ids-3.1.7-r2.x86_64 is already installed
        package udev-extraconf-0.0-r1.x86_64 is already installed
...

Thanks,
Dongxiao

>=20
> --Mark
>=20
> > Also during my testings, I found rpm will select the "wrong" version (x=
86
> tinylogin).
> >
> > Thanks,
> > Dongxiao
> >
> >>
> >> For libraries where it does matter, the dependency system should
> >> already be finding the correct architecture for the library.
> >>
> >> This does raise an issue in my mind though.  Is an architecture for "t=
asks"
> >> justifiable?  Why isn't the task-core-boot an all or noarch package?
> >>
> >> Is there any difference between a task-core-boot and
> "lib32-task-core-boot"?
> >>
> >> Should we expect a difference between the two?
> >>
> >> --Mark
> >>
> >>> Thanks,
> >>> Dongxiao
> >>>
> >>>>
> >>>> --Mark
> >>>>
> >>>> On 9/12/11 3:33 AM, Dongxiao Xu wrote:
> >>>>> For supporting multilib, architecture information is needed in
> >>>>> package require/provide/suggest/recommend fields.
> >>>>>
> >>>>> Use DEFAULTTUNE value as the postfix.
> >>>>>
> >>>>> For "all" arch recipe, it requires "all" arch recipe with no
> >>>>> postfix, but provides all possible multilib archs.
> >>>>>
> >>>>> For example, qemu-config:
> >>>>>
> >>>>> Requires: rsync
> >>>>> Requires: update-rc.d
> >>>>> Requires: task-core-nfs-server
> >>>>> Requires: distcc
> >>>>> Requires: oprofileui-server
> >>>>> Requires: dbus-x11
> >>>>> Requires: bash
> >>>>> Provides: qemu-config.x86
> >>>>> Provides: qemu-config.x86-64
> >>>>>
> >>>>> For other recipe like zlib:
> >>>>>
> >>>>> Requires: libc6.x86-64 >=3D 2.13
> >>>>> Provides: zlib.x86-64
> >>>>>
> >>>>> [YOCTO #1457]
> >>>>>
> >>>>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> >>>>> ---
> >>>>>  meta/classes/multilib.bbclass    |    1 +
> >>>>>  meta/classes/package_rpm.bbclass |   36
> >>>> ++++++++++++++++++++++++++++++++++++
> >>>>>  2 files changed, 37 insertions(+), 0 deletions(-)
> >>>>>
> >>>>> diff --git a/meta/classes/multilib.bbclass
> >>>>> b/meta/classes/multilib.bbclass index 583d76b..76c86b2 100644
> >>>>> --- a/meta/classes/multilib.bbclass
> >>>>> +++ b/meta/classes/multilib.bbclass
> >>>>> @@ -23,6 +23,7 @@ python multilib_virtclass_handler () {
> >>>>>      e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False)=
)
> >>>>>      e.data.setVar("SHLIBSDIR_virtclass-multilib-" +
> >>>> variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
> >>>>>      e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant,
> >>>>> e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
> >>>>> +    e.data.setVar("SAVED_DEFAULTTUNE",
> >>>> e.data.getVar("DEFAULTTUNE",
> >>>>> + True))
> >>>>>      e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False)
> >>>>> +
> >>>>> override)  }
> >>>>>
> >>>>> diff --git a/meta/classes/package_rpm.bbclass
> >>>>> b/meta/classes/package_rpm.bbclass
> >>>>> index 9ef1acd..ea0a079 100644
> >>>>> --- a/meta/classes/package_rpm.bbclass
> >>>>> +++ b/meta/classes/package_rpm.bbclass
> >>>>> @@ -350,6 +350,7 @@ package_install_internal_rpm () {  python
> >>>>> write_specfile () {
> >>>>>  	import textwrap
> >>>>>  	import oe.packagedata
> >>>>> +	import re
> >>>>>
> >>>>>  	# We need a simple way to remove the MLPREFIX from the package
> >> name,
> >>>>>  	# and dependency information...
> >>>>> @@ -498,6 +499,8 @@ python write_specfile () {
> >>>>>
> >>>>>  		splitname    =3D strip_multilib(pkgname, d)
> >>>>>
> >>>>> +		defaulttune =3D bb.data.getVar('DEFAULTTUNE', localdata, True)
> >>>>> +
> >>>>>  		splitsummary =3D (bb.data.getVar('SUMMARY', localdata, True) or
> >>>> bb.data.getVar('DESCRIPTION', localdata, True) or ".")
> >>>>>  		splitversion =3D (bb.data.getVar('PKGV', localdata, True) or
> >>>> "").replace('-', '+')
> >>>>>  		splitrelease =3D (bb.data.getVar('PKGR', localdata, True) or "")
> >> @@
> >>>>> -528,6 +531,39 @@ python write_specfile () {
> >>>>>  		if pkg =3D=3D d.getVar("PN", True):
> >>>>>  			splitrprovides =3D splitrprovides + " " +
> >>>>> (d.getVar('ALTERNATIVE_LINK', True) or '') + " " +
> >>>>> (d.getVar('ALTERNATIVE_LINKS', True) or '')
> >>>>>
> >>>>> +		package_arch =3D bb.data.getVar('PACKAGE_ARCH', localdata,
> >> True)
> >>>>> +
> >>>>> +		splitrprovides =3D splitrprovides + " " + splitname + "." +
> >> defaulttune
> >>>>> +		if package_arch !=3D "all":
> >>>>> +			pattern =3D '\([^()]*\)'
> >>>>> +			prog =3D re.compile(pattern)
> >>>>> +
> >>>>> +			str_list =3D [splitrdepends, splitrrecommends, splitrsuggests]
> >>>>> +			for e in range(len(str_list)):
> >>>>> +				brackets =3D prog.findall(str_list[e])
> >>>>> +				for i in range(len(brackets)):
> >>>>> +					str_list[e] =3D str_list[e].replace(brackets[i],
> >>>> "#BRACKETS"+str(i)+"#")
> >>>>> +				tmp =3D ""
> >>>>> +				for i in str_list[e].split():
> >>>>> +					if i.startswith("#BRACKETS"):
> >>>>> +						tmp +=3D " " + str(i)
> >>>>> +						continue
> >>>>> +					tmp +=3D " " + str(i) + "." + defaulttune
> >>>>> +				str_list[e] =3D tmp
> >>>>> +				for i in range(len(brackets)):
> >>>>> +					str_list[e] =3D
> >> str_list[e].replace("#BRACKETS"+str(i)+"#",
> >>>>> +brackets[i])
> >>>>> +
> >>>>> +			[splitrdepends, splitrrecommends, splitrsuggests] =3D str_list
> >>>>> +		else:
> >>>>> +			variants =3D (bb.data.getVar("MULTILIB_VARIANTS",
> >> localdata,
> >>>> True) or "").split()
> >>>>> +			for variant in variants:
> >>>>> +				tune =3D
> >> bb.data.getVar("DEFAULTTUNE_virtclass-multilib-" +
> >>>> variant, localdata, True) or ""
> >>>>> +				if tune:
> >>>>> +					splitrprovides =3D splitrprovides + " " + splitname +
> >> "." +
> >>>> tune
> >>>>> +			tune =3D bb.data.getVar("SAVED_DEFAULTTUNE", localdata,
> >> True)
> >>>> or ""
> >>>>> +			if tune:
> >>>>> +				splitrprovides =3D splitrprovides + " " + splitname + "." +
> >> tune
> >>>>> +
> >>>>>  		# Gather special src/first package data
> >>>>>  		if srcname =3D=3D splitname:
> >>>>>  			srcrdepends    =3D splitrdepends
> >>>>
> >>>>
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co
> >>>> re
> >



