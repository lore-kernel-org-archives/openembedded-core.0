Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TBVrj-0004Ng-5d
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:11:19 +0200
Received: from mail48-ch1-R.bigfish.com (10.43.68.237) by
	CH1EHSOBE020.bigfish.com (10.43.70.77) with Microsoft SMTP Server id
	14.1.225.23; Tue, 11 Sep 2012 18:58:47 +0000
Received: from mail48-ch1 (localhost [127.0.0.1])	by mail48-ch1-R.bigfish.com
	(Postfix) with ESMTP id 586A12C0157;
	Tue, 11 Sep 2012 18:58:47 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I936eI1432Izz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail48-ch1 (localhost.localdomain [127.0.0.1]) by mail48-ch1
	(MessageSwitch) id 1347389925625372_2213;
	Tue, 11 Sep 2012 18:58:45 +0000 (UTC)
Received: from CH1EHSMHS008.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.250])	by mail48-ch1.bigfish.com (Postfix) with ESMTP id
	9621B22006A;	Tue, 11 Sep 2012 18:58:45 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS008.bigfish.com
	(10.43.70.8) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 11 Sep 2012 18:58:44 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Tue, 11 Sep 2012 13:58:44 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [CONSOLIDATED REQUEST 00/13] Misc Fixes (cover only)
Thread-Index: AQHNkE92gBM7GTc7F0SLRTipq5mb7g==
Date: Tue, 11 Sep 2012 18:58:43 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A66FF0D@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1347379806.git.sgw@linux.intel.com>
	<504F6482.8090701@linux.intel.com>
In-Reply-To: <504F6482.8090701@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED REQUEST 00/13] Misc Fixes (cover only)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 19:11:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C871F5AF899E054F916F12A94BDA7774@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 11:19 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 09/11/2012 09:14 AM, Saul Wold wrote:
>>
>>
>> The following changes since commit
>> 48169c6bc44c546cecaa06207b6c36da558b81f7:
>>
>>    classes/packageinfo: use better method to check if package exists
>> (2012-09-10 21:52:37 +0100)
>>
>> are available in the git repository at:
>>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dsgw/stage
>>
>> Bruce Ashfield (1):
>>    linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
>>
>> Khem Raj (2):
>>    gcc-4.7: Fix build for armv4/EABI and ppc/Os
>>    gcc-4.7: Backport libgcc fixes to appease the new build sequence
>>
>> Mark Asselstine (1):
>>    base-files: provide a mechanism to skip creation of the hostname file
>>
>> Mark Hatle (3):
>>    image.bbclass: Enable the complementary install to be called w/
>>      globbing params
>>    package_rpm.bbclass: Avoid unnecessary installs in complementary pass
>>    qt4: Update qt4.inc to remove staticdev deps in -dbg packages
>>
>> Matthew McClintock (1):
>>    sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we
>>      have items to check
>>
> Scratch this one, I missed the v2 posted while I was heads down prepping
> this!

v3 now!

-M

>
> Sau!
>
>
>> Phil Blundell (3):
>>    perl-native: PROVIDE libmodule-build-perl-native for consistency with
>>      non-native perl
>>    shadow: Fix various invalid assumptions about directory layout
>>    shadow-native: Ensure that ${sbindir} and ${base_sbindir} are
>>      respected
>>
>> Ross Burton (2):
>>    webkit-gtk: work around Make bug by re-running make
>>    telepathy-idle: fix parallel build
>>
>>   meta/classes/image.bbclass                         |    4 +-
>>   meta/classes/package_rpm.bbclass                   |    9 ++-
>>   .../build-fix-for-make-j-safety.patch              |   39 ++++++++
>>   .../fix-svc-gtk-doc.h-target.patch                 |   24 +-----
>>   .../telepathy/telepathy-idle_0.1.12.bb             |    5 +-
>>   meta/recipes-core/base-files/base-files_3.0.14.bb  |   14 ++--
>>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    6 +-
>>   meta/recipes-devtools/gcc/gcc-4.7.inc              |    6 +-
>>   ...-vis_hide-gen-hide-list-Do-not-make-defin.patch |   93
>> ++++++++++++++++++++
>>   ...USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch |   49 ++++++++++
>>   .../gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch    |   31 +++++++
>>   .../gcc/gcc-4.7/ppc_no_crtsavres.patch             |   72
>> +++++++++++++++
>>   meta/recipes-devtools/perl/perl-native_5.14.2.bb   |    3 +
>>   .../shadow/shadow-native_4.1.4.3.bb                |   11 ++-
>>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   17 +++-
>>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    8 +-
>>   meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   16 ++--
>>   meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
>>   meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
>>   meta/recipes-qt/qt4/qt4.inc                        |    2 +-
>>   meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb       |   22 +++++
>>   21 files changed, 380 insertions(+), 55 deletions(-)
>>   create mode 100644
>> meta/recipes-connectivity/telepathy/telepathy-idle-0.1.12/build-fix-for-=
make-j-safety.patch
>>   create mode 100644
>> meta/recipes-devtools/gcc/gcc-4.7/0001-Makefile.in-vis_hide-gen-hide-lis=
t-Do-not-make-defin.patch
>>   create mode 100644
>> meta/recipes-devtools/gcc/gcc-4.7/0001-crtstuff.c-USE_PT_GNU_EH_FRAME-De=
fine-for-systems-us.patch
>>   create mode 100644
>> meta/recipes-devtools/gcc/gcc-4.7/gcc-armv4-pass-fix-v4bx-to-ld.patch
>>   create mode 100644
>> meta/recipes-devtools/gcc/gcc-4.7/ppc_no_crtsavres.patch
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



