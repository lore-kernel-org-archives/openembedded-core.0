Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QZ2o3-0005Su-Hh
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 17:23:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jun 2011 08:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,401,1304319600"; d="scan'208";a="16413083"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 21 Jun 2011 08:20:24 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 21 Jun 2011 23:20:08 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 21 Jun 2011 23:20:08 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Tue, 21 Jun 2011 23:20:07 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Otavio Salvador' <otavio@ossystems.com.br>
Date: Tue, 21 Jun 2011 23:20:07 +0800
Thread-Topic: [OE-core] BUG: intltool depends on libxml-parser-perl to be
	installed on host
Thread-Index: AcwvQ3VTXmo1wj0zTUeHMKLDKIRiaQAE8PSw
Message-ID: <1865303E0DED764181A9D882DEF65FB6997B5E7679@shsmsx502.ccr.corp.intel.com>
References: <BANLkTin20ZXvBnT9phab1KZcZ1iCkO8RaQ@mail.gmail.com>
	<4DFD379B.8010701@mentor.com>
	<BANLkTimkH5e4ViO7aNP9typLSBvBKrSNxw@mail.gmail.com>
	<1865303E0DED764181A9D882DEF65FB6997B5E766E@shsmsx502.ccr.corp.intel.com>
	<BANLkTikJq-eeWNEAdAeZ7O3+qm7OZiH+zA@mail.gmail.com>
In-Reply-To: <BANLkTikJq-eeWNEAdAeZ7O3+qm7OZiH+zA@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: BUG: intltool depends on libxml-parser-perl to be installed on host
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
X-List-Received-Date: Tue, 21 Jun 2011 15:23:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Otavio Salvador wrote:
> On Sun, Jun 19, 2011 at 22:28, Cui, Dexuan <dexuan.cui@intel.com>
> wrote:=20
>> And I guess you're using incremental building? Does building from
>> scratch work?=20
>=20
> No; I got it when rebuilding from scratch.
>=20
>>>>> into host system to it to build.
>>>>=20
>>>> Do the DEPENDS look right? =A0Maybe this needs the class for bringing
>>>> in perl-native...
>>>=20
>>> It seems to do so.
>>>=20
>>> Are you able to reproduce it?
>> Hi Otavio,
>> I can't reproduce the issue.
>> Could you please report a bug at http://bugzilla.yoctoproject.org/
>> so we can better track the issue?=20
>=20
> First it would be better to be able to reproduce it.
>=20
> (devel)~/hacking/el/openembedded-core% bitbake intltool -c cleansstate
> ...
> NOTE: Running task 1 of 2 (ID: 0,
> /home/otavio/hacking/el/openembedded-core/meta/recipes-devtools/intltool/=
intltool_0.40.6.bb,
> do_clean)
> NOTE: package intltool-0.40.6-r1: task do_clean: Started
> NOTE: package intltool-0.40.6-r1: task do_clean: Succeeded
> NOTE: Running task 2 of 2 (ID: 1,
> /home/otavio/hacking/el/openembedded-core/meta/recipes-devtools/intltool/=
intltool_0.40.6.bb,
> do_cleansstate)
> NOTE: package intltool-0.40.6-r1: task do_cleansstate: Started
> NOTE: package intltool-0.40.6-r1: task do_cleansstate: Succeeded
> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be
> rerun and 0 failed.
> bitbake intltool -c cleansstate  7.07s user 1.27s system 150% cpu
> 5.541 total=20
>=20
> (devel)~/hacking/el/openembedded-core% sudo apt-get remove
> libxml-parser-perl [sudo] password for otavio:
> Reading package lists... Done
> Building dependency tree
> Reading state information... Done
> The following packages will be REMOVED:
>   libxml-parser-perl
> 0 upgraded, 0 newly installed, 1 to remove and 0 not upgraded.
> After this operation, 758 kB disk space will be freed.
> Do you want to continue [Y/n]?
> (Reading database ... 38363 files and directories currently
> installed.) Removing libxml-parser-perl ...
> Processing triggers for man-db ...
>=20
> I am attaching the configure log of intltool for reference.
Hi Otavio,
I think I can reproduce the issue with the same steps on a Ubuntu 10.10 hos=
t.
I'm going to further look into this.
Please report a bug on the bugzilla, so we can better track it. :-)

Thanks,
-- Dexuan


