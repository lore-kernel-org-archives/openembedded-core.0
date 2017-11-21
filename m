Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DFA4171985
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 01:56:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAL1uMDn012273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Nov 2017 17:56:22 -0800 (PST)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.97]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Mon, 20 Nov 2017 17:56:21 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Thread-Topic: =?Windows-1252?Q?[OE-core]_Yocto_Project_Status_WW47=9217?=
Thread-Index: AQHTYmcmgqTPpRsuNECxbskG01ShP6MeD2JQ
Date: Tue, 21 Nov 2017 01:56:20 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B91BBEA@ALA-MBC.corp.ad.wrs.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155EC71D2023@fmsmsx111.amr.corp.intel.com>
	<45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
In-Reply-To: <45922039-30bd-7fbc-89be-c037c068a0db@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.140]
MIME-Version: 1.0
Cc: "Xu, Chi" <Chi.Xu@windriver.com>, "WOLD, SAUL" <saul.wold@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDfigJkxNw==?=
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
X-List-Received-Date: Tue, 21 Nov 2017 01:56:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>=20
>=20
> From: MacLeod, Randy=20
> Sent: Tuesday, November 21, 2017 09:22
> To: openembedded-core@lists.openembedded.org; Armin Kuster; Huang, Jie (J=
ackie); Xu, Chi; Yang, Liezhi; WOLD, SAUL
> Subject: Re: [OE-core] Yocto Project Status WW47=9217
>=20
> On 2017-11-20 10:36 AM, Jolley, Stephen K wrote:
> Current Dev Position: YP 2.5 Planning and M1 development
> Next Deadline: YP 2.5 M1 cut off of 12/4/17
> =20
> SWAT team rotation: Juro -> Paul on Nov.17, 2017.
> SWAT team rotation: Paul -> Todor on Nov. 24, 2017.
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
> =20
> Key Status/Updates:
> ?        There is no real change to the status from last week. We continu=
e to suffer intermittent build failures and are continuing to attempt to de=
bug these.
> ?        Currently open issues are:
>=20
> Some US-based people may be on holiday later this week so I'm offering=20
> help from the frozen Northland and more importantly from the team in Beij=
ing. ;-)
>=20
>=20
> o   qemuppc continues to demonstrate random hangs in boot  in userspace
>=20
> Is we can create a defect for this and point / copy the wiki notes into i=
t, that
> would help.
>    https://wiki.yoctoproject.org/wiki/Qemuppc_Boot_Hangs
>=20
> I think I had asked Chi to see if he could reproduce this a week or two a=
go.
> When the lack of entropy problem was identified and fix, many people thou=
ght
> this hang went away as well. Chi can you read the wiki report and see if =
you
> can add anything to them?
>=20
>=20
> o   Issues with 4.13.10 host kernels booting kvm x86 guests on Tumbleweed=
 (Suse) and Fedora 26 (attempting to see if 4.13.12 helps)
>=20
> Robert, can you test Fedora 26. It would help to have a defect open with =
steps to reproduce or
> something about the typical workflow/ build time/ day of the week/ phase =
of the moon.=20
>=20
>=20
> o   nfs inode count for the sstate/dldir share appears to break periodica=
lly causing the disk monitor to halt the builds (bug 12267)
>=20
> Likely specific to the AB server so no plans to do anything for this bug.
>=20
>=20
> o   a perf build race (bug 12302)
>  I'll take a look to:
>  - see if I can duplicate the bug on a fast build host
>  - check upstream to see if the bug is known/fixed
>  - see if I can spot a race in the build rules.
>=20
>=20
> o   An ext filesystem creation/sizing issue (bug 12304)
>=20
> Saul, Are you around this week? Do you have any additional information be=
fore
> leaving for Thanksgiving?
>=20
> Jackie,=20
> Can you look at the code around the image creation and try to reproduce t=
his one?

There is no steps to reproduce in this bug and it seems to be a rare issue,=
 but yes, I can=20
take a look at the code and info from yocto's autobuilder and try to reprod=
uce it.

Thanks,
Jackie

>=20
> ../Randy
>=20
>=20
> ?        Until we resolve these issues patches will continue to be slow t=
o merge, if at all. This also blocks several core developers from doing any=
 feature work at this point in time (e.g. layer setup tool is on hold, agai=
n).
> ?        We can only continue to stress that unless others step up and he=
lp to try and root cause these issues, things will stall with the project.
> =20
> Planned upcoming dot releases:
> YP 2.2.3 is planned and should be out in the next few weeks.
> YP 2.3.3 is planned, but date TBD during YP 2.5 planning.
> YP 2.4.1 is planned, but date TBD during YP 2.5 planning.
> =20
> Key YP 2.5 Dates are:
> YP 2.5 M1 cut off of 12/4/17
> YP 2.5 M1 release of 12/15/17
> YP 2.5 M2 cut off of 1/15/18
> YP 2.5 M2 release of 1/26/18
> YP 2.5 M3 cut off of 2/19/18
> YP 2.5 M3 release of 3/2/18
> YP 2.5 M4 cut off of 4/2/18
> YP 2.5 M4 release of 4/27/18
> =20
> Tracking Metrics:
>             WDD 2655 (last week 2640)
>        (https://wiki.yoctoproject.org/charts/combo.html)
> =20
> Key Status Links for YP:
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status
> https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule
> https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features
> [If anyone has suggestions for other information you=92d like to see on t=
his weekly status update, let us know!]
> =20
> Thanks,
> =20
> Stephen K. Jolley
> Yocto Project Program Manager
> INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124=20
>     Work Telephone:        (503) 712-0534
> 4    Cell:                              (208) 244-4460
> 00Email:                            stephen.k.jolley@intel.com
> =20
>=20
>=20
>=20
> --=20
> # Randy MacLeod.  WR Linux
> # Wind River an Intel Company
>

