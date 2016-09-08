Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0053.outbound.protection.outlook.com [104.47.2.53])
	by mail.openembedded.org (Postfix) with ESMTP id C14E4731AE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 05:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JA1UAK6yzfKq8A8BiKNM35VBMF5sDZu3gG4Q6O5f/pE=;
	b=e4+EznwDUM0LC9XQi74kL8bKaquqX9If2eOd8jUd7XcLZezrfm6Rws49HtG2o91yz3CmCCUHy9k5Ir87JsHpGbxKKXZdtHT60Vj8Z6M9hywkInQNJTXK4JEh2ub6b95jNIdrAD4in4zoatNro5TEyQM8EB9isrbAfeoJ8hl7JF0=
Received: from AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) by
	HE1PR0401MB1820.eurprd04.prod.outlook.com (10.169.119.14) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.619.3; Thu, 8 Sep 2016 22:46:13 +0000
Received: from AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) by
	AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) with mapi id
	15.01.0609.016; Thu, 8 Sep 2016 22:46:13 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "Patches and discussions about the oe-core layer
	(openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: weston startup problem
Thread-Index: AdH+Gmj4j19wpGnHQBeMpmKyoktQhQMCDDcw
Date: Thu, 8 Sep 2016 22:46:13 +0000
Message-ID: <AMSPR04MB3090B1F226090ACAE040CADE2FB0@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <AMSPR04MB3092135C0903E60A9999689E2EA0@AMSPR04MB309.eurprd04.prod.outlook.com>
In-Reply-To: <AMSPR04MB3092135C0903E60A9999689E2EA0@AMSPR04MB309.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
x-originating-ip: [63.246.163.81]
x-ms-office365-filtering-correlation-id: 611c9303-48f5-404a-3824-08d3d839efda
x-microsoft-exchange-diagnostics: 1; HE1PR0401MB1820;
	6:oy7pXAtG1e6oJ48AZlCdxic5lloGZoeixLVceZf1EKx6969L12j3mxlG5t4GWHlCcBCS1Ac3AGJ9wd4XYBEPePuKwwnWWFsGRllcbiP7Y8Kn1GV/WLRsiztaUR+5X3PMvTKmFDx4EajLsJ3m5L06voSKcIbhAkVcQFe/RlTUPGygVRhj5PX8HCgtrB8unDMgUEEs3nnxJKFPAKuvPm/aYnIZss6xmvOjOuCuY0DKOu4nafqVx2JOULs/3LZn4BbmuNo5ZblDjnIV5JlP4/sdwmqiOQ9Icd9HRFzpgl/vfT5nui68f0YwJZE/K7BTY9h7JAVa3aDdqmLZL0Au66u3gQ==;
	5:jKstqWXMPGhcvSKBz4LXuJ6Vg+56LUooph+DDHrF5iI4sGtwjzl04E68C4Sr/s8jJOQKf6pGFrKDUEjnmmqjffJr2EthN55q2GbEtcJOpDaL0KPwqf6oZ2HTRYOkwLuUADlGe6MWUsYDmcWShUJGyw==;
	24:nfOkTWc8krCBVZShme34LpsvAjlYrUA/hdaFpQGeA4m79T7F9Fkpu7My9QqGCzA9tvQjZShOwAevLEhne6819ijMMoe52jHkoEh9ZAGNvI8=;
	7:IWmfZAgBvLUX7xSltwB8Z+7/jlB4H3OqQB6XdJ0Z3vJcqabBUFLkupqeBU5QATvnvqqCCMysAK/7SrxV40aFpw6x61rTpbj0uDawXSNi9ZJ7/Tiiuu0n2Y9TuCCmbM5b3XEdUzC+m5M2h0mp8DCBtouRdLEzuyhZ0mSouEkRyKL51thjfvRC8e8/OqBn6Ra2vxO5TWmrmwqddWlZAYKrcKU3O3NnrB09KHN60iTt3PEthpDkw7oo33q1cqXHpYYJ
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:HE1PR0401MB1820;
x-microsoft-antispam-prvs: <HE1PR0401MB1820D43A67BC9ED49C5D8088E2FB0@HE1PR0401MB1820.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:HE1PR0401MB1820; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0401MB1820; 
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(53754006)(13464003)(377454003)(199003)(189002)(19580395003)(81156014)(76176999)(50986999)(81166006)(5002640100001)(2906002)(122556002)(3660700001)(8936002)(5660300001)(7736002)(7116003)(3280700002)(19580405001)(8676002)(54356999)(101416001)(4326007)(7846002)(3480700004)(86362001)(77096005)(9686002)(97736004)(10400500002)(3846002)(586003)(102836003)(6116002)(189998001)(11100500001)(87936001)(76576001)(92566002)(33656002)(2950100001)(74316002)(66066001)(68736007)(305945005)(106356001)(110136002)(105586002)(2900100001)(7696004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0401MB1820;
	H:AMSPR04MB309.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2016 22:46:13.6982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB1820
Cc: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: weston startup problem
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
X-List-Received-Date: Fri, 09 Sep 2016 05:20:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Tom Hochstein
Sent: Wednesday, August 24, 2016 12:08 PM
To: Patches and discussions about the oe-core layer (openembedded-core@list=
s.openembedded.org) <openembedded-core@lists.openembedded.org>
Subject: [OE-core] weston startup problem

Hi All,

The weston systemd startup implementation is not working correctly and I ne=
ed some help fixing it.

With systemd and pam on the image, the expected behavior is that XDG_RUNTIM=
E_DIR would already be set when weston is launched from weston.service. Tur=
ns out XDG_RUNTIME_DIR is not set, and weston.service sets it itself. This =
is already a problem, and the problem would be worse except that weston hap=
pens to use a different folder. If weston.service is modified to use the sa=
me folder name, the folder ends up getting replaced later by pam.

From looking at the weston-launch code and its pam handling, I thought to t=
ry the weston-launch option '--user=3Droot' to force the creation of the pa=
m session. This does seem to help, and I was able to get it mostly working =
by modifying the openvt args in weston-start, removing -e and adding -w:

openvt -v -s -w -- weston-launch --user=3Droot -- --modules=3Dxwayland.so -=
-log=3D/var/log/weston.log

The problem I have now is that keyboard input goes to both weston and the d=
esktop. I tried with and without the -s option, and there is no difference.

I'm stuck at this point and would appreciate some help.

Tom


