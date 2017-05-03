Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 3613 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 May 2017 15:26:58 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0095.outbound.protection.outlook.com [104.47.42.95])
	by mail.openembedded.org (Postfix) with ESMTP id A8CEC71AB7
	for <Openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/zZHLmxvppr6DW33iLoBq44oFqs2039osOFOX8YngkI=;
	b=aL2XxyBdOK6qICsojbbuBJRq2Gc5tz1KpM6J+Gp350M29cmdvG3WucmmMlVU7iNz57Nof5IDCt0gioFDumFmxEzr0/lvYISs/TWXRMGRkh5N89e5roDLomhBfAqzYqsY/STvttRaUWozc0I+OoVjPdsZP+x0ihRQnEyzA/dKz4Y=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2953.namprd05.prod.outlook.com (10.168.176.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1075.1; Wed, 3 May 2017 13:54:35 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.1075.005; Wed, 3 May 2017 13:54:35 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Larger kernel with gcc-6.2 than gcc-5.x
Thread-Index: AdLEEBdvgMQWQIYHS0+8IzO7Y5a0Cw==
Date: Wed, 3 May 2017 13:54:34 +0000
Message-ID: <DM5PR05MB29548C824DE985678F072B67BB160@DM5PR05MB2954.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=melinkcorp.com;
x-originating-ip: [98.100.91.242]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2953;
	7:v/qSJUKfMgMhrASdbr7f18mZoLGMFNrAchUQwoC0RGVTq09BoFanQFUa9OX2WWFOdG4LFEcJpoWBEkJvtTqf6j+/GY1+e9eN8Qha6gTAlouRVbX9B737W/DKaa28ieHMVxXGxYozrDFuCoz97WsYtlTvuYFgy6qJjKhnT9+DKtXTlmqyvtKtudD6HKZJF5G6Q3Rh6WEYXBs8HbGNKqtW89hfKhrSaRWPKdDRCnl75L95l15SW2lfrUxWeSy6ue3NPC3x9WXlzJQefdp2hsjUfeVuC/6AqihSg1BUT1nmRvMBapakM9pHUU4afpBDtN2URFrhxgUwFLCCRfT98xxVOA==
x-ms-office365-filtering-correlation-id: 75bdf4f4-032b-421e-9a42-08d4922beea4
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:DM5PR05MB2953; 
x-microsoft-antispam-prvs: <DM5PR05MB295336F5380CF1863C1B10CFBB160@DM5PR05MB2953.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123564025)(20161123560025)(20161123555025)(20161123558100)(6072148);
	SRVR:DM5PR05MB2953; BCL:0; PCL:0; RULEID:; SRVR:DM5PR05MB2953; 
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39400400002)(39830400002)(39450400003)(25786009)(2906002)(74316002)(8676002)(6116002)(5640700003)(38730400002)(6916009)(66066001)(110136004)(53936002)(6436002)(50986999)(2501003)(7696004)(3280700002)(3846002)(478600001)(54356999)(3660700001)(102836003)(99286003)(86362001)(9686003)(8936002)(122556002)(6506006)(77096006)(55016002)(7736002)(305945005)(189998001)(81166006)(2351001)(5660300001)(33656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2953;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2017 13:54:34.9515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2953
Subject: Larger kernel with gcc-6.2 than gcc-5.x
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
X-List-Received-Date: Wed, 03 May 2017 15:27:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

I'm on poky/krogoth and I am in the process of moving to poky/morty on an A=
tmel AT91SAM9G25 platform (arm926ejste architecture).  On the first try boo=
ting with my image built under morty, I noticed that the kernel image was l=
arger.  I've done some more testing and I see that the rest of the image is=
 the same size, just the kernel got larger.  I'm using a custom kernel, so =
the kernel image is using the same commit, patches and configuration.

I decided to try building with both gcc-6.2 and gcc-5.4 and see what the si=
ze differences were.  My results:
Kernel size under poky/morty with gcc-6.2: 3158616 bytes
Kernel size under poky/morty with gcc-5.4: 3141312 bytes
Kernel size under poky/krogoth with gcc-5.3: 3144200 bytes

It's not a huge change and I have the space for the larger kernel.  However=
, I was curious if this was a sign that something else changed that I shoul=
d be concerned about.  Has anyone else seen gcc-6.2 producing larger binari=
es?  If so, does anyone know why?

Thanks,
Bryan


