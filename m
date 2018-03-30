Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 2014 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Mar 2018 07:02:07 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0062.outbound.protection.outlook.com [104.47.32.62])
	by mail.openembedded.org (Postfix) with ESMTP id 655DB74663
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 07:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=vTAF5f92yebVR1JLV2Xs+6pAE6vaKcXpnGEDJTJFaMs=;
	b=rYDap9rRzHG8uyY+Zdd4YsI1mxdxnlVMeEmlkADstKNZjyGFuBHKak99wuoD2kI94rlkVGgujCfk+BnqTXYr21U23dk0EpPzVNK/xKBruOK4krBIRQOpKPkwbZXNiE0wqQo7hVwLaUMhPVdqwAHB55vL0YANsiLuAqvJ20Aci9c=
Received: from SN4PR0201MB3504.namprd02.prod.outlook.com (10.167.129.14) by
	SN4PR0201MB3407.namprd02.prod.outlook.com (10.167.128.140) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.609.10;
	Fri, 30 Mar 2018 06:29:15 +0000
Received: from SN4PR0201MB3504.namprd02.prod.outlook.com
	([fe80::e001:2d14:e708:8a0]) by
	SN4PR0201MB3504.namprd02.prod.outlook.com
	([fe80::e001:2d14:e708:8a0%13]) with mapi id 15.20.0609.012;
	Fri, 30 Mar 2018 06:29:13 +0000
From: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
To: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] python3: consolidate sqlite3 files
Thread-Index: AQHTxtIeYLIfN7tWT0C/1hXh8V+R2aPnloYAgAC8h2A=
Date: Fri, 30 Mar 2018 06:29:12 +0000
Message-ID: <SN4PR0201MB350478DD7262E55ABE7545CCACA10@SN4PR0201MB3504.namprd02.prod.outlook.com>
References: <20180328201929.6810-1-ross.burton@intel.com>
	<7ac15a26-eb00-74bc-4ab0-933802389240@xilinx.com>
In-Reply-To: <7ac15a26-eb00-74bc-4ab0-933802389240@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alejandr@xilinx.com; 
x-originating-ip: [108.65.76.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN4PR0201MB3407;
	7:mzDpgpJiU6bLKUmTclW6ad0Y7UHrFZyHTxqNQGhEbxT81INXwyPbopSTX59ityEX+aYRIt61Z9MhS+7kAhGsQn6g9KN8Ov6xaO58YH4IwAt4dB2SfNEj+jr5kvpf8yFKUEpjnHAfHZZXnhoTb7gdeo6hcBG0dZ7qGfl2jNhrS/Swr/B35ZnikBGvAbrT5CKy7TZJNXtq7dnVFZhoiUQT/aSc7AxCV4YAoFIjOMY0e3d+N0nhTrjF/TE/AcT7OJGQ
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(346002)(366004)(39380400002)(396003)(376002)(39840400004)(13464003)(189003)(199004)(110136005)(3846002)(5250100002)(2501003)(33656002)(97736004)(6116002)(7736002)(66066001)(105586002)(478600001)(6436002)(102836004)(305945005)(74316002)(316002)(6506007)(86362001)(486005)(6306002)(11346002)(106356001)(81166006)(14454004)(3280700002)(1720100001)(99286004)(229853002)(7696005)(8936002)(446003)(966005)(476003)(8676002)(2906002)(81156014)(2900100001)(53936002)(68736007)(55016002)(5660300001)(26005)(53546011)(9686003)(6246003)(486005)(3660700001)(25786009)(76176011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN4PR0201MB3407;
	H:SN4PR0201MB3504.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6cce8c51-5475-4626-d64b-08d596078dc7
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(2017052603328)(7153060)(7193020);
	SRVR:SN4PR0201MB3407; 
x-ms-traffictypediagnostic: SN4PR0201MB3407:
x-microsoft-antispam-prvs: <SN4PR0201MB34078C2B7C9A126556F76465ACA10@SN4PR0201MB3407.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(228905959029699)(17755550239193); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231221)(944501327)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(6041310)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:SN4PR0201MB3407; BCL:0; PCL:0; RULEID:;
	SRVR:SN4PR0201MB3407; 
x-forefront-prvs: 06274D1C43
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: qKf7eH9t9AlOzhOBGHdmXUr+e8s67HG+jN9CpYPUWqW2fK02Hj0mKILqYqy4i08Nu6000RovHI2UqafvrylwJwIYOfMuh1tjPxCDs5GMy0jO0SHIzruoxsuZu2Epyt90NQZbvnWCq/84Y1uUHsgmDQcohbqmgROQkCPrCjWSp+CU4bppnmXmSPTlVaVWUl2KpRaoeH0+kFGdszGhpTq8jwZmeBwZjfpvuGAQnUUsZ8dlvrLaqMYQ4rBidg+hXQBC+QoeI/29rsM3w5FDrFdWgsjMCKInfP5zFSjMN/AYZQLjk5iy683AjLHdd5ReZt60Yrepx/3Aw/GT1GZ/NA1uT2xnWqgNpTjsZrYJLOeWtld66TOYlowM9KrHXkpM944j3DaBYd2eSDTTpSaxPmKiR3rP5Na48v8l3f5fhiSrYKM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cce8c51-5475-4626-d64b-08d596078dc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2018 06:29:12.9164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB3407
Subject: Re: [PATCH] python3: consolidate sqlite3 files
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
X-List-Received-Date: Fri, 30 Mar 2018 07:02:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hey Ross,

I just sent you a patch that goes on top of this that fixes things.

Thanks

Alejandro

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Alejandro Enedino Hernan=
dez Samaniego
Sent: Thursday, March 29, 2018 7:14 PM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3: consolidate sqlite3 files

Hey Ross,


On 03/28/2018 01:19 PM, Ross Burton wrote:

python3-sqlite3 happens to be a very special and unique package, its folder=
 inside ${libdir}/python3.5/ called sqlite3, which would be fine, we usuall=
y  handle those packages by adding the whole folder, but in this case, we s=
eparated the sqlite3-tests (which is a folder inside the
sqlite3 folder)
into another package, so if we add the folder to sqlite3 there would be not=
hing for sqlite3-tests to get.

> Some of the sqlite3 module was in python3-misc by accident, move the=20
> files into python3-sqlite3 where they belong.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-devtools/python/python3/python3-manifest.json | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git=20
> a/meta/recipes-devtools/python/python3/python3-manifest.json=20
> b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 1914a4c43ba..95071c53f5a 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -977,9 +977,12 @@
>           "summary": "Python Simple Mail Transport Daemon"
>       },
>       "sqlite3": {
> -        "cached": [],
> +        "cached": [
> +            "${libdir}/python3.5/sqlite3/__pycache__/*.pyc"
> +        ],
>           "files": [
> -            "${libdir}/python3.5/lib-dynload/_sqlite3.*.so"
> +            "${libdir}/python3.5/lib-dynload/_sqlite3.*.so",

While this will work for splitting packages now, we dont support wildcards =
on the manifest file anymore, at least not for the whole filename, because =
when we try to get dependencies for a module the wildcard becomes useless, =
so this will likely kill the do_create_manifest task, it'll go fine but the=
 next time you run it, it wont get the module name it will disregard that d=
ependency.
> +            "${libdir}/python3.5/sqlite3/*.py"
>           ],
>           "rdepends": [
>               "core"

The right way would be to get rid of sqlite3-tests but I know we cant do th=
at, so I'm working on a fix for the do_create_manifest task that could hand=
le this situation.
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

