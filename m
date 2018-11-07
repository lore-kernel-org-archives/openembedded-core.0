Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 21599 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Nov 2018 23:46:03 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0045.outbound.protection.outlook.com [104.47.2.45])
	by mail.openembedded.org (Postfix) with ESMTP id 658BC60017
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 23:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qrNwWNcmoKYLEXRVWmY3GNdPMA91owaTPgKMfFSeikE=;
	b=tYcmGFIf/+TvguufMdq87GORyEO2F0dl2pDrACuvQst1yO296wLzjZuykzpTH1l3h30s19UXo5QIQUHwfLOB5ElFC9JG2qLwnACieZ3aD39LT8BIAyFnvFj8R3TMRablhWd1Cysk6oHBn9FeaoVYRXP86K0TTPOLPwn41eHT8Wg=
Received: from AM6PR0602MB3544.eurprd06.prod.outlook.com (52.133.23.17) by
	AM6PR0602MB3685.eurprd06.prod.outlook.com (52.133.31.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.28; Wed, 7 Nov 2018 12:40:08 +0000
Received: from AM6PR0602MB3544.eurprd06.prod.outlook.com
	([fe80::70b3:f9f3:a5a5:df3a]) by
	AM6PR0602MB3544.eurprd06.prod.outlook.com
	([fe80::70b3:f9f3:a5a5:df3a%5]) with mapi id 15.20.1294.032;
	Wed, 7 Nov 2018 12:40:07 +0000
From: Mauno Niko <niko.mauno@vaisala.com>
To: Ross Burton <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] glib-2.0: add missing locale dependencies to
	PN-ptest
Thread-Index: AQHUdpcDEyGUlR4q2EOmSzEwT68tdg==
Date: Wed, 7 Nov 2018 12:40:07 +0000
Message-ID: <162e1306-d521-ebe9-c969-f55fe86afa9e@vaisala.com>
References: <20181009110019.16171-1-ross.burton@intel.com>
In-Reply-To: <20181009110019.16171-1-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
x-originating-ip: [193.143.230.131]
x-clientproxiedby: AM5P194CA0024.EURP194.PROD.OUTLOOK.COM
	(2603:10a6:203:8f::34) To AM6PR0602MB3544.eurprd06.prod.outlook.com
	(2603:10a6:209:e::17)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR0602MB3685;
	6:sRJIuaTbl9EThNKX2YwGSk+DrpKkb2mk1CWTe+9uLj5gxAtFbUZ8bUTbB7RNfBi3wQNZoNvaNfq1HWmhWSF/JwHZ3eQFsG0i3BwgG36DugPDqhkoe8MHl6W4sTEuhir1z8JbgY/1KOGkJLYIiTw7Szup0RkmEVBqO/2//UfUEjxkDLHhTMdZLRFyVg/qLqZx5LZgbajFWxRTDrvx7U1IJSmjoObttZ9NgPYBjahLbmEHr+/Fc8IrXLZ9jszytX11nvYXvqbyij2YdWeO7UlCwd3RMYlz4qs+hwHXVEeic1CnsB2mSp0ZVE7m6hwL3a5r5jHtxtrJVziDGC/kuPKcVJE3Xg3hM2lLrDmzRCkZ5tEdEq4js8V670N3iO8MYa4XV/0r9XOi798EeZu1LAXXyf/8QHb4WpfsFIfEizf17mHvuFelq7Z7L7yJWVIvq4E+wNKlm/jqBVSQsxN9NkF0kw==;
	5:5X2i1EperbUHW24qigwXNM2bmiIRJ1IUzVcQSFCbC16ilX1c2r7J9YBibENepf9DrLi62ZVDwF5qPqSBX1a9qhptOSP+Pz/AcrUQIDYxO1LT11X3sSSGIyUiwmTpxYjB/m/3uzsOxCCOAf2DhtGCYEP1DpdY2oSbsOSMLP6Qobg=;
	7:BMeVsW1fi58E15PpV36apt7pwoQ3pmaVR/K0lAKk32nf37cqo4GePGpY1FlP52Li8hHHrTLlFkWsvSTFtpUVYpiRlLiuFdWN6nmcMUTMPhZ70CG7TQXShCeE2JY0IkbNO9DT2KCx+GlJPh5UqlMnZA==
x-ms-office365-filtering-correlation-id: 7083ef64-4911-4032-858b-08d644ae2603
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR0602MB3685; 
X-MS-TrafficTypeDiagnostic: AM6PR0602MB3685:|AM6PR0602MB3685:
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-microsoft-antispam-prvs: <AM6PR0602MB3685A1370E0771614E553F5481C40@AM6PR0602MB3685.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(228905959029699);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:AM6PR0602MB3685; BCL:0; PCL:0; RULEID:;
	SRVR:AM6PR0602MB3685; 
x-forefront-prvs: 08497C3D99
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(346002)(396003)(39850400004)(366004)(376002)(189003)(199004)(31696002)(86362001)(2900100001)(486006)(6246003)(478600001)(68736007)(26005)(53936002)(6512007)(6436002)(6116002)(3846002)(97736004)(476003)(7736002)(305945005)(64126003)(2501003)(256004)(14444005)(99286004)(186003)(386003)(6506007)(14454004)(8936002)(76176011)(53546011)(52116002)(11346002)(316002)(5660300001)(2616005)(446003)(65826007)(66066001)(229853002)(71200400001)(8676002)(65806001)(65956001)(25786009)(58126008)(102836004)(2906002)(110136005)(71190400001)(6486002)(106356001)(81156014)(105586002)(31686004)(36756003)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR0602MB3685;
	H:AM6PR0602MB3544.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: eR2TlF3HeaZFfe+GMVBAQz9F2nnM1NeIOOPTNnKUGbnw2ul5zSO5JxMu+WFg/gEJfJJWYf/NnsBvhHIm7uiYZhWauthGrBgngjqSJ4c5mlx3gMSWopb96eWDD/ke0iK98dhnXlinN2zSdUCGwp/sbT0nbFEnoAna/mcQMISS1N8YP+o/VEiMtqKtN3qK9XhacQot1QGuYjdnf4V1KaeuKYbRd3n8yaByND15GPpzN7vKGL7cun+xbAeq2ivu5Al4NZIpGyw1rlrmA+9Jb0OeQkL+6VGbPUOHiq6E65u0uNkSjo3SbMxkAGM7zMebHSkDKM9M3EIN01sapWJ7sNEtF6hkpiGswRBZgu5mBaHlmyU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7083ef64-4911-4032-858b-08d644ae2603
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2018 12:40:07.7736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0602MB3685
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3685;
	23:UZIDLCIQnST8CvWET/tTKGA/+9VwOYGmZPYz8dJbGm1AMHvtKfNyCwx5z5MoMdtG3z/K28jl/qOdX6X/YpBamLyqteaYQNuKjNnozmeS2k2wPiRRbB4xztse1p82KxWUGE/GF1EiqJ6mCObzozATgA==
X-OriginatorOrg: vaisala.com
Subject: Re: [PATCH] glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Thu, 08 Nov 2018 23:46:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <B8344D63B383B04C838FB18F250B575C@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

On 10/09/2018 02:00 PM, Ross Burton wrote:
> The test suite skips several tests if the required locales are not found,=
 so add
> them as dependencies of glib-2.0-ptest.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-core/glib-2.0/glib.inc | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index ad4f2aebd71..f78aa9bfe6d 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -152,6 +152,19 @@ RDEPENDS_${PN}-ptest_append_libc-glibc =3D "\
>               glibc-gconv-iso8859-15 \
>               glibc-charmap-invariant \
>               glibc-localedata-translit-cjk-variants \
> +            locale-base-tr-tr \
> +            locale-base-lt-lt \
> +            locale-base-ja-jp.euc-jp \
> +            locale-base-fa-ir \
> +            locale-base-ru-ru \
> +            locale-base-de-de \
> +            locale-base-pl-pl \
> +            locale-base-hr-hr \
> +            locale-base-el-gr \
> +            locale-base-fr-fr \
> +            locale-base-fr-fr \
> +            locale-base-es-es \
> +            locale-base-en-gb \
>              "
>  =20
>   INSANE_SKIP_${PN}-ptest +=3D "libdir"
>=20

Having GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8" and 'ptest' in DISTRO_FEATU=
RES, it would seem after this commit I'm seeing following warnings during b=
itbake:

  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-de-de, but it isn't a build dependency? [build-deps]
  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-el-gr, but it isn't a build dependency? [build-deps]
  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-en-gb, but it isn't a build dependency? [build-deps]
  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-es-es, but it isn't a build dependency? [build-deps]
  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-fr-fr, but it isn't a build dependency? [build-deps]
  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-ja-jp.euc-jp, but it isn't a build dependency? [build-=
deps]
  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
  WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rde=
pends on locale-base-tr-tr, but it isn't a build dependency? [build-deps]

If I switch GLIBC_GENERATE_LOCALES to 'all' these warnings no longer appear=
.

-Niko

