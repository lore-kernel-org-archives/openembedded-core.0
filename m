Return-Path: <bassem.boubaker@actia.fr>
X-Greylist: delayed 45043 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 09 Mar 2019 05:29:21 UTC
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
	(mail-eopbgr90052.outbound.protection.outlook.com [40.107.9.52])
	by mail.openembedded.org (Postfix) with ESMTP id F2AD17C53B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Mar 2019 05:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=actia.fr; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=O9DrZ/5jrVmFvG40oq81SZ2HG/j5LjCemiv/zLe6fEo=;
	b=AmjJrVOCZj4lR0CgICB7QvypPTEPGmL59c5CDxCxriRbugi9rFHlX3iTkfqT43u528P/jy5AjLXnr1LYUE4o9mPrp5XswXGJTUPdmw2jzcE7c+Lr/FHSB3nkLjxQxpLyrmTfB6z9vKnCfcOf3EhOgrx2G9eNkzF/Ucir4khXhXQ=
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (52.134.38.15) by
	MR2P264MB0066.FRAP264.PROD.OUTLOOK.COM (52.134.37.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.17; Sat, 9 Mar 2019 00:55:19 +0000
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2]) by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2%5]) with mapi id 15.20.1686.018;
	Sat, 9 Mar 2019 00:55:19 +0000
From: BOUBAKER Bassem <bassem.boubaker@actia.fr>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] cpulimit: introduce support for this package
Thread-Index: AQHU1giaq3MNuDYcuUWPxulwLz35/aYCeF+E
Date: Sat, 9 Mar 2019 00:55:19 +0000
Message-ID: <MR2P264MB01963B961389353B48E897FE9C4E0@MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM>
References: <1552063426-25272-1-git-send-email-bassem.boubaker@actia.fr>,
	<CAJTo0LaaErr7-OKin51sON0qjt0xFDO1Qsjb5tU29oD1jyezqw@mail.gmail.com>
In-Reply-To: <CAJTo0LaaErr7-OKin51sON0qjt0xFDO1Qsjb5tU29oD1jyezqw@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bassem.boubaker@actia.fr; 
x-originating-ip: [185.69.189.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd2be975-a4e9-4627-58bd-08d6a429e6c9
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:MR2P264MB0066; 
x-ms-traffictypediagnostic: MR2P264MB0066:
x-ms-exchange-purlcount: 2
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MR2P264MB0066;
	23:0H/QDqsgjJPfKQOd4mUa1rUZHFAfoP6L+DGPGs6?=
	=?iso-8859-1?Q?vEC8Oh46XSVY/atCeeEfiDyFUHTDgEN9QTLAwqUrurR+y9eeVG+0ds/JyD?=
	=?iso-8859-1?Q?Amy2rRTXVOu4gDA3d4a01uOlnZNmS0MeWEcTKjRn75UoiNTqc6JkuZmsNz?=
	=?iso-8859-1?Q?6iEf+Cz6vnpQyRcno70JyG1io6/KkVkaehs86VU0t9t0j+J0iCyAWw2GO7?=
	=?iso-8859-1?Q?SKjPXiZCxTdrjOAuaKPzwSFNLNBpV53+qSgf89LRacSoenC4nDzSH6dRLe?=
	=?iso-8859-1?Q?TvtfU0GWZ/Tf/7ICvet0g+XFC//4TL4flsfJZU3gPtna9W7LNFl134BxJz?=
	=?iso-8859-1?Q?PSfbl+EWI91CAxAEFj1VtFpkLsKeYmbBcOme1y9ZwMRDjs0wkEXhq2uGXr?=
	=?iso-8859-1?Q?m8MO9V2ZfymxpGIsVGSfqV0Gzqxq2E1Nj8PPAu0D4k6NNUMuKay3ktVm46?=
	=?iso-8859-1?Q?8LGKvaG5Bkbh2msiUK1Igt6ZUqJtC4gpgTrlu0+hLgVoTFqP1U4uGZHBKI?=
	=?iso-8859-1?Q?M96CqKg0IZOThcnpxE2pTttmzVHAg7wFGwTyEFl67vVIp/j+LNE9rMH/E6?=
	=?iso-8859-1?Q?F1w78cdFZoy5SJ/2CMIuCUGkGw6teJ18KBCOwjJJHO4L3fFuMWxuIUUdud?=
	=?iso-8859-1?Q?GQrONwbRfyeGv+DzOADHhNBPOvCy4bifylGGS44pdr3DhytMICS9duqLd0?=
	=?iso-8859-1?Q?kSmTfpuPjWbWuQYhWZc4AEh8T8XIeP3qZHTCuKNXRK5XeIPhKnMhRzLqWw?=
	=?iso-8859-1?Q?9Dp3U8cAxK8XPl4qUOmlygS1bQzqylYdiwi7599QmyptwBgNai1FO6z9UN?=
	=?iso-8859-1?Q?ynEh0h9K90LldEyj5XzeKtsZTVsBCuySBrc+xNZwRd5/80iaQINa9FnUyp?=
	=?iso-8859-1?Q?20iXzddn0OtHkKU/iTIO+VG9FoC5RFJ0m1ZvF/BY3GVxJZvdOIdnmdk6Rk?=
	=?iso-8859-1?Q?xvl2o7F/WKkEOK5G5iXuWna9kmVhfxQH1n8jlhFEwHKyzzPUHgkL3D01RI?=
	=?iso-8859-1?Q?gcrX5c+N+rMEvOJ2GgX0jENI0/i7eCo4Q8I3NQhC3o/9LWMGjKGG83wMyV?=
	=?iso-8859-1?Q?41dnGIcspNU4+/L/uqxWO7EzGtL3hsZej490zvFWC+ObJaIdSQOsl3Oeqk?=
	=?iso-8859-1?Q?zS8aOE3PNZvzwVSVwXlgOqhqjf+Xb3knguBu1uHatODYBtwPgUZe1kjh09?=
	=?iso-8859-1?Q?o5GhM8D7qPKMg2TxHulLc2Jqk0cyShkofMB/b6EJM/tjcQyAf9tyDGEPyj?=
	=?iso-8859-1?Q?NlqFaIyRvfUu38fmq08Cv2N9845/WUq8OPymMSiiUE2HoGfSYA3nQs7Pmu?=
	=?iso-8859-1?Q?NqtTU9tNnBv2qqLf0/vnT48t/+2ckdmr9mPt9/B6QDBEg=3D=3D?=
x-microsoft-antispam-prvs: <MR2P264MB00663FFC32461020890071489C4E0@MR2P264MB0066.FRAP264.PROD.OUTLOOK.COM>
x-forefront-prvs: 0971922F40
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(376002)(136003)(366004)(39850400004)(396003)(189003)(199004)(446003)(6436002)(74316002)(55016002)(6306002)(53936002)(9686003)(14454004)(256004)(966005)(74482002)(97736004)(14444005)(305945005)(7736002)(478600001)(86362001)(76176011)(81166006)(25786009)(81156014)(7696005)(99286004)(8936002)(8676002)(5660300002)(6506007)(4326008)(6916009)(106356001)(68736007)(71200400001)(26005)(105586002)(102836004)(107886003)(6246003)(33656002)(316002)(71190400001)(54906003)(2906002)(486006)(476003)(186003)(11346002)(66066001)(229853002)(6116002)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MR2P264MB0066;
	H:MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: actia.fr does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cVi4gEr8/o5/2CnbO/1B+EVjLWjn2+L4Oy7mJOnYcu9Jup1pt2wIzs9qz0p6LMk8Vz7Skd1b1Q/7HE5dzrRGvDTZAHeO9R+flZ31Tp0rTnNqAQam6CFFsHN0UWDkgzgqybrLHcQiPObvwrzdu0jFEJ28TFl8mqkfEnVfN8jwvoze0R+WqP6xe6hoEtY7MNSMSe3E5PIj2jCl4BfYHijTN/0+lT7Di7mcsS4m8AZWb3gnzXIddtDX3Lo/8K1KQojk0Oz4iIikD7nQRpa/wqH3SRrZfb3aaEvQXQPkdPCn/dJ/BHalRqwhKRtV1ihUFsYB8QzceIz8fCY7mhsap5Fb7QKuSlKOJwJ3E7ysbiLC5dk6f3EmRuI8uFujRLcHi0u9Tm7cPUwd4+QELFMq090cG8Bby2sy17izJWY009jUFpc=
MIME-Version: 1.0
X-OriginatorOrg: actia.fr
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2be975-a4e9-4627-58bd-08d6a429e6c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2019 00:55:19.1102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86314f06-03e8-4460-82f3-a44f992a19c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0066
Cc: SAMMOUDA Ahmed <ahmed.sammouda@actia.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpulimit: introduce support for this package
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
X-List-Received-Date: Sat, 09 Mar 2019 05:29:22 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Submitted on meta-oe mailing list with some fixes of the recipe.

Bassem

>Unless there's a great reason to put this into oe-core, I suggest that
>it be added to meta-oe instead.
>
>Ross
>
>On Fri, 8 Mar 2019 at 23:24, BOUBAKER Bassem via Openembedded-core
><openembedded-core@lists.openembedded.org> wrote:
>>
>>=A0=A0=A0=A0 * Now, cpulimit recipe is put under recipes-support. Binary =
will be installed by the recipe under /usr/sbin
>>
>>=A0=A0=A0=A0=A0=A0=A0=A0 # cpulimit -h
>>=A0=A0=A0=A0=A0=A0=A0=A0 Usage: cpulimit [OPTIONS...] TARGET
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 OPTIONS
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -l, --limit=3DN=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 percentage of cpu allowed from 0 to 100 (required)
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -v, --verbose=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 show control statistics
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -z, --lazy=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 exit if there is no target process, or if it dies
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -i, --include-children l=
imit also the children processes
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -h, --help=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 display this help and exit
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 TARGET must be exactly o=
ne of these:
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -p, --pid=3DN=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 pid of the process (implies -z)
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 -e, --exe=3DFILE=A0=A0=
=A0=A0=A0=A0=A0=A0 name of the executable program file or path name
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 COMMAND [ARGS]=A0=A0=A0=
=A0=A0=A0=A0=A0 run this command and limit it (implies -z)
>>
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Report bugs to <marlonx8=
0@hotmail.com>.
>>
>> Signed-off-by: Bassem Boubaker <bassem.boubaker@actia.fr>
>> ---
>>=A0 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 22 +++++++++++++++=
+++++++
>>=A0 1 file changed, 22 insertions(+)
>>=A0 create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
>>
>> diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/=
recipes-support/cpulimit/cpulimit_0.2.bb
>> new file mode 100644
>> index 0000000..d0c524e
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION =3D "cpulimit is a tool which limits the CPU usage of a pro=
cess from bash prespective"
>> +HOMEPAGE =3D "http://cpulimit.sourceforge.net/"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86c1c0d961a437e529db93aa3bb3=
2dc4"
>> +
>> +PR =3D "r0"
>> +
>> +SRCREV ?=3D "f4d2682804931e7aea02a869137344bb5452a3cd"
>> +
>> +SRC_URI =3D "git://git@github.com/opsengine/cpulimit.git;protocol=3Dhtt=
ps"
>> +
>> +SRC_URI[md5sum] =3D "4f805fe26c8cf28e8251d64d0ace21d4"
>> +SRC_URI[sha256sum] =3D "544516d0d80c685b1df1344a71c900e845270551cf21030=
0fa4d13876e10817a"
>> +
>> +inherit autotools
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_install() {
>> +=A0=A0=A0=A0=A0=A0=A0 install -d ${D}${sbindir}
>> +=A0=A0=A0=A0=A0=A0=A0 install -m 0755 ${S}/src/${PN} ${D}${sbindir}/
>> +}
>> \ No newline at end of file
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
    =

