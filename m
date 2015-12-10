Return-Path: <haris.okanovic@ni.com>
X-Greylist: delayed 1959 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 10 Dec 2015 19:32:23 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0109.outbound.protection.outlook.com [207.46.100.109])
	by mail.openembedded.org (Postfix) with ESMTP id B67A26FF86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 19:32:23 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=haris.okanovic@ni.com; 
Received: from [10.2.106.52] (130.164.62.171) by
	BLUPR04MB005.namprd04.prod.outlook.com (10.255.210.12) with Microsoft
	SMTP Server (TLS) id 15.1.355.11; Thu, 10 Dec 2015 18:59:43 +0000
To: Andre McCurdy <armccurdy@gmail.com>
References: <1449608008-25611-1-git-send-email-haris.okanovic@ni.com>
	<CAJ86T=VSauxfhwap_96w3SHnEPm1-NA469=cpm2emoJtgmZ31Q@mail.gmail.com>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <5669CB99.1070505@ni.com>
Date: Thu, 10 Dec 2015 12:59:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VSauxfhwap_96w3SHnEPm1-NA469=cpm2emoJtgmZ31Q@mail.gmail.com>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: CY1PR13CA0016.namprd13.prod.outlook.com (25.162.30.154) To
	BLUPR04MB005.namprd04.prod.outlook.com (10.255.210.12)
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB005;
	2:d/tPMAlevKU4XOVm5tQFx3ow9S5F2tRO1H6V/Rh9RpVxA8vzpe6Qy/Fc4JnrlaZnXXUjtf1i2XPaWpnQEPAAqALjSRAAQbQYOloL1jiTzgBFF87XUE7xhcs67lq3enRvog1JeDBiTAN7htZCp63xAw==;
	3:E9143nbdxrZS0gpI4vn94Eft1Fz+WRcq0WYOXDuDuj62Ss7FwcAeE3xsF1oQs881piFiZ5JzjVcPY66FPHAntDPQFQTOgzwp9xHCPy6NSeaCmX1vT80y5Z9owUmDw5u8;
	25:Cq/uRSwXVWbHE1rNCPBjRW3kEkXznXt4aRYiOWsefw1/NjBzsI3U5sgK6CpuD8Ndg4+w5KFmzj9FoephbRV9buMdIzJfG2WCTnw9G4D0GzKKpS4KpoNE26IiNHEKToiPoeAvWNehqVfWMfw4goKFbnP3zu8st01eInSYh3ByDnUwzMk2Gj1hKV8TiZcWADLll3p6x+n329Hdrcqyzbc5PY74TVifhAydRbtz2zVP+f15KAJrTGQnGcEIxfCalJ9fC3A59UDAE2fQE5irTnVBzA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR04MB005;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB005;
	20:GkqcWzCIAM3r5diQkhiYF1DABfIITeO/RhwVtoo59le4v0TXUNzOmdba1ohFMZc+xF9p7pG3I2IWdNmP0AcvipP0LUfhklgu47/ujK5S8R//fWdjvR15smxn0FpUC5xP5KWpkAlK3T3hwMSRpBdJCCwzfmSf4xjmxC7iS09LzYsb23zU/uH+haS3sohek0EXXjvqOmWFosBc64Mx6Qec4a7Au99pqz8+S+mfYIiK3B0Qic+40skfKoorXpFa0CU5t/Ls2nRJjHpZsJ9MshR/Fws8yIT/5VqGHC2xQ/TdOtw8CRjWIt8C3X55LItklRhntWVDtLG4C+gGss1epJVwpWbLOvcMUSBFfKrJXe+eId4VRUtpYnjXmqsgPkjCkch1E2th8DBFCnmL+f4ujWJqgoqzlxD3tmcPx0UQ48Liyjh2z6MCtIT+zh5RV4lHKsbRoXPuddi05f33ApAcYxUG4VIg+/kzhhpsQMowZAPeAhFSdevEsXuZ0WIMDzmKkAy+Abr/gfXCM8gJ9PIZ4zt+rZEokDmYqSpVyRnXl9e6aNU+6K6WlNy+xXkLfJ0SV+0bCrW+XKbXXL5V1ClDpfFWpdOhJc4HnKU4zJD+vG2fS5U=
X-Microsoft-Antispam-PRVS: <BLUPR04MB005BF2020BA2DD2E5B037C3E5E90@BLUPR04MB005.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:BLUPR04MB005; BCL:0; PCL:0; RULEID:; SRVR:BLUPR04MB005; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB005;
	4:xxKIsb3eROxG+xabLAwMrD/oShJGUqbvF77lqRX4qeCJlH7r59jOXDRPfkrui93xigi38I8sPPfl40RZ8/AjwhvlgxB0o3Si7GWnVo8mObdCeB9J7zyTPPL3X0FJ4bnPiTz1+8OENlwWnAf+hNjqKmcsKdImTNiPzWOx2xvH0I8IgwSpNCXF+IgayXdT2N0Fx08QntvpSMSvql+OBmGNk9AXZXmQmT7JXdy4Ql6XnZKsx8AufEpnChWO6MRrAG1Jyy7Nxh8zxLkHMGIhFbFLLX9SSm+U3/AOR2/j7yorwUFFBPWWd+EexrG/WgDaVOMF1vud9YEz4e9e1B2umtwvjq1+IUCRdAF+nGE87210LeSFSesm1LiXPPDxWr8olRCI
X-Forefront-PRVS: 078693968A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(189002)(479174004)(377454003)(54094003)(24454002)(164054003)(199003)(51914003)(51444003)(33656002)(50986999)(5008740100001)(36756003)(54356999)(1096002)(23676002)(561944003)(106356001)(50466002)(5001960100002)(122386002)(101416001)(5004730100002)(76176999)(87266999)(105586002)(59896002)(230700001)(92566002)(80316001)(65816999)(189998001)(77096005)(40100003)(3846002)(15975445007)(6116002)(110136002)(65956001)(4001350100001)(1720100001)(2950100001)(87976001)(86362001)(65806001)(97736004)(1411001)(47776003)(42186005)(19580405001)(64126003)(19580395003)(586003)(66066001)(81156007)(83506001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR04MB005; H:[10.2.106.52];
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTFVQUjA0TUIwMDU7MjM6eU1TaFlJdjNtWG5JWWsxVDdYQ2U0cWxYS1N1?=
	=?utf-8?B?aWFZNmxvK0dzQUtjWGZkeGttNXpqZVQ2Vk55SU40dURjYy9mVEQyNGZhVk9l?=
	=?utf-8?B?UnFVcjUzdGFaSGdzajQ5NWtaWTNTdEVmMGFmWC9wbWd5enh2TVlaYnB2TmRS?=
	=?utf-8?B?NUNrMGJrWHZVZWx0Mkt2akNQMWx2NWFSSkg1VG1KTVBEeFcrMERZaG5mczFk?=
	=?utf-8?B?UTBkUm5HcWVxVGc2OEdCMHhGVEV5VWg2cFRsbnlkRGR0M2hKcVJvRnlBNjJk?=
	=?utf-8?B?Z01kSVV3ODMvSitTTW5LUHk0Y0FpblpjQlZJamxHbWttSEN0NWVBZ0JDMEht?=
	=?utf-8?B?dXQzV0h3eVg5NDJuMCtlRllBSGtwMmR2ZnQ3THpNblpvOHBKaDNJaUkwMnVx?=
	=?utf-8?B?UG4yNE5rdUNEUlhBbi8ybVEwajNYVk5xTnM4ckZXT2p3REF2Nk5zQjJZMHFa?=
	=?utf-8?B?YWxxQVY3eVY1UmJlMDB5N1VaMFFOdElBeHZFYzBEdlZsd1lHZXVBUm1PVWhi?=
	=?utf-8?B?K01SSUt2OWptS0JGaUpqVHl3eklSNU1GZWNQcWJ6RDhyVVphcDZxYlYyWTky?=
	=?utf-8?B?YllPckhhdDhwcHFEWnBhMUlGUC8zTnhuRUpvYm5QZXFFeVV3djJaQVNGSDNJ?=
	=?utf-8?B?QmJ6Wmo3bXhieklTdnBzdG9LOGpKRjN4WEJ4d0tvNXRkWnR6SmdCUTJ5WW80?=
	=?utf-8?B?dXFGY1JRY3MwZ3VTcmFiT2hFRUFvU2dnV1p0andMY0F5ZWp0WE1PSXYvbmJO?=
	=?utf-8?B?WHFnV0hvUVBKVmQ3VDYwMVlEWUxNNnZuVnN1a1NXaDNZcjc4Y3BxdW5zdGdO?=
	=?utf-8?B?QUJJQzVaY1NyK1Nud0FnNGQ2dUdJZDZ2WE1xTlg0cVh0aFBidDFqYTJGUVlQ?=
	=?utf-8?B?RUgzRWxxUUw4NnBkQlI4K3BLaGd5NHNyQ2ZuMHBOK09MUk9pV2pzMkdQdmYw?=
	=?utf-8?B?akx6VzJTMDR3L0FHL1l5Y05lbjFZQW93aFVQN2o2YkQveVdBTGxUSXcvWGQz?=
	=?utf-8?B?dFB1VVZiM0g1eXlIZVZsVW5DWXN3bG9tSVplcm1CYXZEaVRDWUk1STNCVVpG?=
	=?utf-8?B?Tlcvc3lXM2NhdkNEaGV2SkY5WlhFTE5SV2l6WTREcDZtMUk1WDhydGxuaWtx?=
	=?utf-8?B?Mi9Gb3pzdE1obHc1NmFMNWJaMmtwZzdDWU1zQXdMdS82TUxzdEt0UjNVWDl2?=
	=?utf-8?B?ckJqdGZXV2gxODR6ZmpBellRV0NvYzFraFlKZWNTMGhtTWVZZHpaYyszODNO?=
	=?utf-8?B?djY1dG1KbUN3YkE4UkJpV1JXbS9FUVQ3K2pYTnlIN0VjakNXc2dPWnlhQndy?=
	=?utf-8?B?Wm1lZlQzVXV0QzV3K3N4bjJhUVluWTdzaUIrZHVpUnd2bllVc1ltaXpBckpS?=
	=?utf-8?B?Qk5KWjVKUlZTQXB2RUtia0FnN1VDUm12Y2lYMytRdkNmYzhsTnl1WFJFUCtu?=
	=?utf-8?B?YWpUaDY4OGxlSDJUUStDK1FwaitlVmZzUGNOd1RxbUFYY2xtdFR1YVQrZ1JE?=
	=?utf-8?B?c1lIMFNsT002T3UyODdZOC9kUEVhNk5TTnVUQ09yb1Vmak9ZcUQzbEZyVjRH?=
	=?utf-8?B?R1lWTzFsNVh3eUJsUHg3VDR4T09OUWNVNnZCdGN6a05jTjdYMTUzSklYbWNC?=
	=?utf-8?B?ODQxMXFrWkowZDdxcmg1ZWxGM2RReWdYTG9PZ1VzaHZqSlFCLzZaTUdFdEhr?=
	=?utf-8?B?cTZ1aS9CWHVEaThnZFRKanhPL1FYeGFwNkhDMXFCV0hjREdTbmdMcEpUSklU?=
	=?utf-8?B?MTd4OCs0M1d4MFNPaWwvRW1jUkQrR2YrQmlMdjlYczVJTGpuV3lVcGUxWTJE?=
	=?utf-8?B?TGFBbmxnV1A2dDN3ejYwT3o3R1VPcmZLYVFGb080Vndtak5NKzArZFE2OEF6?=
	=?utf-8?B?UWVqTUhvK1gvd1dOc1FuOCtWUzdrWHNka0NmWmYvbW9hbmdsSmJQWWFSa202?=
	=?utf-8?B?K3BJU1RKTE1mZHRQRDhjTVRoelloOCszdXJ1bzl3SVVvUXhxblBlS3dBYWNK?=
	=?utf-8?Q?uCZFI?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR04MB005;
	5:oKLOSRt5rw7mnmceCGSEP2MCCivf7z5WIEzWGgjY3eqdgPfgBEAkkUmsw5JzMyFTW2RalYAMrUaeV0wYsoYRQnPE6y2/T8dZ//Ewr9kllgr1Y3O4PRPYiu4wqUfebDlij18Ugd4gGjY6W6uelxlxSw==;
	24:pvR2x23C6T6BVac61wNdUIySSYqa4Q04bFNkgtCl4JqjFWcdDNBs7EUP0VYZsV+kn90zZ//cEiy2kzneHNccd3RkR/aUgaSLfDn/B++PFvA=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2015 18:59:43.4632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR04MB005
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Source packages
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
X-List-Received-Date: Thu, 10 Dec 2015 19:32:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andre,

Thanks for the quick response!

On 12/09/2015 11:56 AM, Andre McCurdy wrote:
> Hi Haris,
>
> On Tue, Dec 8, 2015 at 12:53 PM, Haris Okanovic <haris.okanovic@ni.com> wrote:
>> This change enables creation of ${PN}-src packages which provide recipe
>> source code on target machines. A distribution might use this facility
>> to provide a feed of source packages for user reference and
>> debugging/development activities.
>>
>> The packaged source code is copy of SRC_URI files + a manifest declaring
>> the contents in order of appearance in SRC_URI. For example, it might
>> include a tarball + patch files, which could be used to reconstruct the
>> state of a recipe's working dir after do_patch() by unpacking the
>> archive and applying patches in order.
>>
>> At the moment, unpacking need to be done by hand. However, RPM and Dpkg
>> can both do this automatically upon install when the source is packaged
>> in a src.rpm or dsc file, respectively, as opposed to a binary archive
>> (rpm or deb). A good future improvement might be to provide proper
>> src.rpm's or .dsc's for distributions using those package manager.
>>
>> I don't believe opkg can distinguish between binary and source archives
>> at the moment, so this may be the best we can do at the moment for IPK
>> distributions.
>>
>>
>> Classic OE provided a similar facility for IPKs only with
>> sourceipk.bbclass [1]. It was dropped at some point in modern OE and I'm
>> not familiar enough with OE's history pre Yocto to track down exactly
>> why. I'm curious if this was this a deliberate change or just an
>> accidental regression, and the reasons it was removed in the former
>> case.
>>
>> One significant difference between the classic sourceipk.bbclass and my
>> proposal is what gets packaged: sourceipk simply archived the entire
>> ${S} dir after do_patch() but before do_configure() pollutes it. I opted
>> not to go this route because it's seems at odds with RPM and Dpkg, both
>> of which use the aforementioned tarball+patch file scheme. This may
>> allow us to re-use the staging logic should we implement proper
>> src.rpm's and dsc's in the future.
>>
>>
>> Not all recipes have useful source to package: For example,
>> linux-libc-headers build from the kernel source, which is is already
>> provided by the kernel recipe. base-files just provides initial system
>> configuration, so it's source package provides no additional info than
>> it's binary.
>>
>> I couldn't find a clever way to filter out these edge cases, other than
>> disabling source packages inside those recipes which would require a
>> lengthy review of OE meta layers.
>>
>> I imagine many OE distro also target small, resource constrained,
>> systems, that couldn't benefit from source packaging.
>>
>> Therefore I've made this an opt-in feature for individual distro
>> maintainers to enable as needed. It can be enabled per recipe via the
>> ENABLE_SRC_INSTALL_${PN} var or globally via ENABLE_SRC_INSTALL from
>> distribution confs.
>>
>>
>> === Implementation details ===
>>
>> [PATCH 1/3] package.bbclass/package.py: Add do_install_source() task
>>
>> Add do_install_source() task to stage a recipe's SRC_URI files under
>> SRC_D.
>>
>> Dependencies:
>>   After do_fetch() to ensure SRC_URI files are downloaded
>>   After do_install() because it resets ${D} that's also used by this task
>>   Before do_package() to stage files before writing installers
>>
>> No-ops unless ENABLE_SRC_INSTALL_${PN} = 1, which needs to be set in
>> distro config or recipes wanting to use this facility.
>>
>> [PATCH 2/3] documentation.conf: Document do_install_source()
>>
>> [PATCH 3/3] bitbake.conf: Define source package, disabled by default
>>
>> Add ${PN}-src to PACKAGES with a default set of FILES_{PV}-src
>> per FHS [2].
>>
>> Define a staging directory SRC_D under ${D}.
>>
>> Define ENABLE_SRC_INSTALL to enable source staging via package.bbclass's
>> do_install_source() task. It's disabled by default, but may be
>> overridden by distro configs or individual recipes as needed.
>>
>>
>> === References ===
>>
>> [1] https://github.com/openembedded/openembedded/blob/master/classes/sourceipk.bbclass
>> [2] https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.html#usrsrcSourceCode
>>
>>
>> Comments, opinions, and other meandering thoughts welcome....
>>
>> Thanks,
>> Haris
>> ---
>>   meta/classes/package.bbclass |  5 +++
>>   meta/conf/bitbake.conf       |  9 ++++-
>>   meta/conf/documentation.conf |  1 +
>>   meta/lib/oe/package.py       | 96 ++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 110 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index d731757..98f01e5 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -2079,3 +2079,8 @@ def mapping_rename_hook(d):
>>       runtime_mapping_rename("RRECOMMENDS", pkg, d)
>>       runtime_mapping_rename("RSUGGESTS", pkg, d)
>>
>> +addtask do_install_source after do_fetch after do_install before do_package
>> +
>> +python do_install_source () {
>> +    oe.package.do_install_source(d)
>> +}
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 06971da..431865d 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -36,6 +36,7 @@ export systemd_unitdir = "${nonarch_base_libdir}/systemd"
>>   export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
>>   export nonarch_libdir = "${exec_prefix}/lib"
>>   export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
>> +export srcdir = "${prefix}/src"
>
> I wonder if globally exporting a "srcdir" environment variable is the
> correct thing to do. If it's not expected to be recognised or used
> directly by any package's "make install", etc, then perhaps it should
> just be a bitbake internal variable to avoid any concerns about
> namespace pollution.
>
> (AFAIK, variables like "prefix" are only exported to support legacy
> packages which rely on environment variables + "make -e" to ensure
> that "make install", etc, do the right thing. For autotools packages,
> for example, prefix etc are all passed directly on the configure
> command line so exporting them too is mostly redundant. If we succeed
> in getting rid of "make -e" then I guess eventually none of these
> directory variables will need to be exported any more?).
>

srcdir is only used by bitbake.conf atm, so I agree there's really no 
practical benefit to exporting it. Removed.

--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -36,7 +36,7 @@ export systemd_unitdir = "${nonarch_base_libdir}/systemd"
  export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
  export nonarch_libdir = "${exec_prefix}/lib"
  export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
-export srcdir = "${prefix}/src"
+srcdir = "${prefix}/src"

  # Architecture dependent paths
  export bindir = "${exec_prefix}/bin"
---

>>   # Architecture dependent paths
>>   export bindir = "${exec_prefix}/bin"
>> @@ -267,7 +268,7 @@ SOLIBSDEV = ".so"
>>   SOLIBSDEV_darwin = ".dylibbroken"
>>
>>   PACKAGE_BEFORE_PN ?= ""
>> -PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>> +PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>>   PACKAGES_DYNAMIC = "^${PN}-locale-.*"
>>   FILES = ""
>>
>> @@ -313,6 +314,12 @@ ALLOW_EMPTY_${PN}-dbg = "1"
>>
>>   FILES_${PN}-locale = "${datadir}/locale"
>>
>> +FILES_${PN}-src = "${srcdir}/${PN}"
>> +SRC_D = "${D}${srcdir}/${PN}"
>> +
>> +ENABLE_SRC_INSTALL = "0"
>> +ENABLE_SRC_INSTALL_${PN} = "${ENABLE_SRC_INSTALL}"
>> +
>>   # File manifest
>>
>>   FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE', False))}"
>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
>> index 845559a..0df8a2f 100644
>> --- a/meta/conf/documentation.conf
>> +++ b/meta/conf/documentation.conf
>> @@ -26,6 +26,7 @@ do_fetchall[doc] = "Fetches all remote sources required to build a target"
>>   do_generate_qt_config_file[doc] = "Writes a qt.conf file for building a Qt-based application"
>>   do_install[doc] = "Copies files from the compilation directory to a holding area"
>>   do_install_ptest_base[doc] = "Copies the runtime test suite files from the compilation directory to a holding area"
>> +do_install_source[doc] = "Stages source code for packaging"
>>   do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto style kernel"
>>   do_kernel_configcheck[doc] = "Validates the kernel configuration for a linux-yocto style kernel"
>>   do_kernel_configme[doc] = "Assembles the kernel configuration for a linux-yocto style kernel"
>> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
>> index ea6feaa..f980f25 100644
>> --- a/meta/lib/oe/package.py
>> +++ b/meta/lib/oe/package.py
>> @@ -123,3 +123,99 @@ def read_shlib_providers(d):
>>                           shlib_provider[s[0]] = {}
>>                       shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
>>       return shlib_provider
>> +
>> +def archive_dir(dirPath, archivePath):
>> +    ''' Create tar.bz2 archive at archivePath from dirPath '''
>> +    import os, oe, bb
>> +
>> +    arDir = os.path.dirname(dirPath)
>> +    arName = os.path.basename(dirPath)
>> +
>> +    cmd = 'tar -c -j -f \"%s\" -C \"%s\" -p \"%s\"' % (archivePath, arDir, arName)
>
> Perhaps try to make use of pbzip2 instead of "tar -j" to create
> tar.bz2 files. See:
>
>    http://git.openembedded.org/openembedded-core/commit/?id=670f5cda06070ae888d17cca7a07aa74d751c2f7
>

I think that's a good idea, it might be a little faster that way. 
Setting `-I pbzip2` instead of `-j` in cmd.

Built xinetd and verified it's Git source got tarred up as before.

--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -131,7 +131,7 @@ def archive_dir(dirPath, archivePath):
      arDir = os.path.dirname(dirPath)
      arName = os.path.basename(dirPath)

-    cmd = 'tar -c -j -f \"%s\" -C \"%s\" -p \"%s\"' % (archivePath, 
arDir, arName)
+    cmd = 'tar -c -I pbzip2 -f \"%s\" -C \"%s\" -p \"%s\"' % 
(archivePath, arDir, arName)
      (retval, output) = oe.utils.getstatusoutput(cmd)
      if retval:
          bb.fatal('Failed to archive %s --> %s: %s %s' % (dirPath, 
archivePath, cmd, output))
---

>> +    (retval, output) = oe.utils.getstatusoutput(cmd)
>> +    if retval:
>> +        bb.fatal('Failed to archive %s --> %s: %s %s' % (dirPath, archivePath, cmd, output))
>> +
>> +def do_install_source(d):
>> +    ''' Stage recipe's source for packaging '''
>> +    import os, oe, bb
>> +
>> +    pn = d.getVar("PN", True)
>> +
>> +    if d.getVar("ENABLE_SRC_INSTALL_%s" % pn, True) != "1":
>> +        return
>> +
>> +    packages = (d.getVar("PACKAGES") or "").split()
>> +    if ("%s-src" % pn) not in packages:
>> +        # Some recipes redefine PACKAGES without ${PN}-src. Don't stage
>> +        # anything in this case to avoid installed-vs-shipped warning.
>> +        return
>> +
>> +    urls = (d.getVar('SRC_URI', True) or "").split()
>> +    if len(urls) == 0:
>> +        return
>> +
>> +    workdir = d.getVar('WORKDIR', True)
>> +
>> +    # TODO rm_work() should clean this up
>> +    unpackTempDir = os.path.join(workdir, 'install-source-unpack-temp')
>> +    if os.path.exists(unpackTempDir):
>> +        bb.utils.remove(unpackTempDir, recurse=True)
>> +    os.makedirs(unpackTempDir, 0755)
>> +
>> +    src_d = d.getVar("SRC_D", True)
>> +    if os.path.exists(src_d):
>> +        bb.warn("SRC_D already exist. Removing.")
>> +        bb.utils.remove(src_d, recurse=True)
>> +    os.makedirs(src_d, 0755)
>> +
>> +    fetcher = bb.fetch2.Fetch(urls, d)
>> +
>> +    fileManif = []
>> +    for url in urls:
>> +        urlScheme = bb.fetch2.decodeurl(url)[0]
>> +        srcPath = fetcher.localpath(url)
>> +        srcName = os.path.basename(srcPath)
>> +
>> +        dstName = srcName
>> +        if os.path.isdir(srcPath):
>> +            dstName += '.tar.bz2'
>> +
>> +        dstPath = os.path.join(src_d, dstName)
>> +
>> +        # fetch() doesn't retrieve any actual files from git:// URLs,
>> +        # so we do an additional unpack() step to get something useful
>> +        # for these.
>> +        # TODO: May need to pre-process other revision control schemes
>> +        if urlScheme == 'git':
>> +            unpackPath = os.path.join(unpackTempDir, srcName)
>> +            if os.path.exists(unpackPath):
>> +                bb.utils.remove(unpackPath, recurse=True)
>> +            os.makedirs(unpackPath, 0755)
>> +
>> +            fetcher.unpack(unpackPath, [url])
>> +
>> +            # unpack() puts actual source in a 'git' subdir
>> +            srcPath = os.path.join(unpackPath, 'git')
>> +
>> +        if os.path.exists(dstPath):
>> +            bb.warn('Duplicate file %s in SRC_URI. Overwriting.' % dstName)
>> +            bb.utils.remove(dstPath, recurse=True)
>> +
>> +        if not dstName in fileManif:
>> +            fileManif.append(dstName)
>> +
>> +        if os.path.isdir(srcPath):
>> +            archive_dir(srcPath, dstPath)
>> +        else:
>> +            bb.utils.copyfile(srcPath, dstPath)
>> +
>> +    manifFilePath = os.path.join(src_d, 'manifest')
>> +    if os.path.exists(manifFilePath):
>> +        bb.warn('manifest file found in SRC_URI. Overwriting.')
>> +        bb.utils.remove(manifFilePath, recurse=True)
>> +
>> +    with open(manifFilePath, 'wb') as manif:
>> +        for fname in fileManif:
>> +            manif.write(fname)
>> +            manif.write('\n')
>> --
>> 2.6.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- Haris

