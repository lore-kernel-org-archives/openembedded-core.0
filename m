Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0097.outbound.protection.outlook.com [157.56.111.97])
	by mail.openembedded.org (Postfix) with ESMTP id F26E9724DC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Apr 2015 15:36:37 +0000 (UTC)
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com (25.160.105.12) by
	BY1PR0701MB1143.namprd07.prod.outlook.com (25.160.105.11) with
	Microsoft SMTP
	Server (TLS) id 15.1.125.19; Fri, 3 Apr 2015 15:36:36 +0000
Received: from BY1PR0701MB1144.namprd07.prod.outlook.com ([25.160.105.12]) by
	BY1PR0701MB1144.namprd07.prod.outlook.com ([25.160.105.12]) with
	mapi id 15.01.0130.020; Fri, 3 Apr 2015 15:36:37 +0000
From: "Krishnanjanappa, Jagadeesh"
	<Jagadeesh.Krishnanjanappa@caviumnetworks.com>
To: Mark Hatle <mark.hatle@windriver.com>
Thread-Topic: [OE-core] [PATCH] valgrind: Add INSANE_SKIP of arch for valgrind
	and valgrind-dbg
Thread-Index: AQHQbbokoquEYwCCw02pIj9ulnIb8507YC0YgAAFloCAAAYCCQ==
Date: Fri, 3 Apr 2015 15:36:36 +0000
Message-ID: <1428075386805.48015@caviumnetworks.com>
References: <1428000427-31985-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>,
	<8A26CDB0-D56F-4FBD-8F92-4EF3D4B664F1@gmail.com>
	<1428073036712.25265@caviumnetworks.com>,
	<551EADE1.4010805@windriver.com>
In-Reply-To: <551EADE1.4010805@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [12.108.191.226]
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0701MB1143;
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(164054003)(377454003)(479174004)(51704005)(24454002)(110136001)(106116001)(66066001)(50986999)(77156002)(2950100001)(99286002)(122556002)(62966003)(93886004)(54356999)(36756003)(76176999)(46102003)(87936001)(15975445007)(19580395003)(86362001)(19580405001)(40100003)(102836002)(117636001)(1720100001)(2656002)(575784001)(92566002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1143;
	H:BY1PR0701MB1144.namprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BY1PR0701MB1143A7EB82F1B96E4C86BA488EF10@BY1PR0701MB1143.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BY1PR0701MB1143; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0701MB1143; 
x-forefront-prvs: 05352A48BE
MIME-Version: 1.0
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2015 15:36:36.6452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1143
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: Add INSANE_SKIP of arch for valgrind and valgrind-dbg
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
X-List-Received-Date: Fri, 03 Apr 2015 15:36:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>With a multilib configuration, these things should be packaged per-multili=
b and
>then only the installed multilib components are available on the device.  =
It
>saves space and preserves the checking in place to catch situations where =
you
>may accidentally provide software that isn't runnable.

>The other problem with permitting the system to query the compiler is the =
output
>of the build is no longer deterministic.  If the toolchain configuration
>changes, then the output of valgrind changes.  That should not happen.

Ok, got it.
Then disabling the generation of other set of binaries via configure option=
s is=20
needed here, i.e install only 32-bit and 64-bit binaries when 32-bit=20
and 64-bit valgrind applications are built respectively.

Thanks,
Jagadeesh

________________________________________
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Mark Hatle <mark.hatle@windrive=
r.com>
Sent: Friday, April 3, 2015 8:42 PM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] valgrind: Add INSANE_SKIP of arch for valgri=
nd and valgrind-dbg

On 4/3/15 9:57 AM, Krishnanjanappa, Jagadeesh wrote:
>> what is the point of packaging files for which there won=92t be any runt=
ime >environment. You are just better of removing them.
>> IMO unless you have multilib environment working
>> this patch is just relaxing the QA
>
> With compilers supporting generation of multilib and yocto framework supp=
orting generation of multilib rootfs, one can have this environment often. =
Instead of removing them, as said we can disable them from generation using=
 configure options. Also the valgrind rpm package do include this files in =
its package.
> Link: http://www.rpmfind.net//linux/RPM/opensuse/13.2/x86_64/valgrind-3.1=
0.0-1.1.x86_64.html

With a multilib configuration, these things should be packaged per-multilib=
 and
then only the installed multilib components are available on the device.  I=
t
saves space and preserves the checking in place to catch situations where y=
ou
may accidentally provide software that isn't runnable.

The other problem with permitting the system to query the compiler is the o=
utput
of the build is no longer deterministic.  If the toolchain configuration
changes, then the output of valgrind changes.  That should not happen.

--Mark

> Regards,
> Jagadeesh
>
>
>
> ________________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Friday, April 3, 2015 8:28 AM
> To: Krishnanjanappa, Jagadeesh
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] valgrind: Add INSANE_SKIP of arch for valg=
rind and valgrind-dbg
>
>> On Apr 2, 2015, at 11:47 AM, Krishnanjanappa, Jagadeesh <Jagadeesh.Krish=
nanjanappa@caviumnetworks.com> wrote:
>>
>> From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetw=
orks.com>
>>
>> If a complier supports generating 32-bit and 64-bit binaries, then
>> while building valgrind we have two sets of binaries (32-bit and 64-bit)
>> being generated.
>>
>> Example: With compiler supporting generation of both 32-bit and 64-bit
>> binaries, and building valgrind in 64-bit mode, we come across following
>> QA Issue (listing only few of them),
>>
>> (snip)
>> ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valg=
rind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgprel=
oad_exp-sgcheck-x86-linux.so
>> ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valg=
rind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/getoff=
-x86-linux
>> ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valg=
rind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgprel=
oad_core-x86-linux.so
>> ERROR: QA Issue: Architecture did not match (62 to 3) on ${WORKDIR}/valg=
rind/3.10.1-r0/packages-split/valgrind-dbg/usr/lib64/valgrind/.debug/vgprel=
oad_memcheck-x86-linux.so
>> -- CUT --
>>
>> However, we can build only 64-bit or 32-bit binaries in valgrind using
>> "--enable-only64bit" and "--enable-only32bit" configure options respecti=
vely.
>> And the required configure option can be selected based on SITEINFO_BITS=
, but
>> feel that if a compiler supports generation of both type of binaries and=
 it
>> may be useful for users to have/execute both type of binaries on multili=
b
>> environment. So choosing to pack both types of binaries and skip errors =
if the
>> architecture type are different using INSANE_SKIP.
>>
>
> what is the point of packaging files for which there won=92t be any runti=
me environment. You are just better of removing them.
> IMO unless you have multilib environment working
> this patch is just relaxing the QA
>
>
>> Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@cav=
iumnetworks.com>
>> ---
>> meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 9 +++++++++
>> 1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/re=
cipes-devtools/valgrind/valgrind_3.10.1.bb
>> index bf80b16..eaa64c4 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
>> @@ -32,6 +32,8 @@ SRC_URI[sha256sum] =3D "fa253dc26ddb661b6269df58144eff=
607ea3f76a9bcfe574b0c7726e1d
>> COMPATIBLE_HOST =3D '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>> COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>>
>> +PR =3D "r1"
>> +
>> inherit autotools ptest
>>
>> EXTRA_OECONF =3D "--enable-tls --without-mpicc"
>> @@ -52,6 +54,13 @@ RRECOMMENDS_${PN} +=3D "${TCLIBC}-dbg"
>>
>> RDEPENDS_${PN}-ptest +=3D " sed perl glibc-utils perl-module-file-glob"
>>
>> +# skip checking of the Executable and Linkable Format (ELF) type, bit
>> +# size, and endianness of any binaries. If a compiler supports
>> +# generating 32-bit, 64-bit binaries, then we have two sets of
>> +# binaries i.e 32-bit and 64-bit.
>> +INSANE_SKIP_${PN} +=3D "arch"
>> +INSANE_SKIP_${PN}-dbg +=3D "arch"
>> +
>> do_compile_ptest() {
>>     oe_runmake check
>> }
>> --
>> 1.8.2.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core=

