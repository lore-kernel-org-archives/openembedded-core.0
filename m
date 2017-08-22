Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 7298 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 Aug 2017 01:55:09 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0134.outbound.protection.outlook.com [104.47.0.134])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFD4782E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 01:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CambrionixLtd.onmicrosoft.com; s=selector1-cambrionix-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=KduqcvwzuQYgfHp12MM1TPzdy6LgG5VPfrDTnG0lr+k=;
	b=OUeQA+tkxqGGYlC9k/Jn83xLeoWd+u/r2NAanUl0QM4YZoDvuvhJGJXslkHlAdqREXnBbMyZltBvCvZcKl09agdaZBrGLEY69QO0RovE/O3Oqdvh3aKXIs6dodsSrbsIsW9eJkaaj0t/RI3be374rgIYAU7Wgr749veOxd8JdO8=
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB0006.GBRP123.PROD.OUTLOOK.COM (10.166.249.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1362.18; Tue, 22 Aug 2017 12:19:17 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.01.1362.019; Tue, 22 Aug 2017 12:19:17 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Change to kernel.bbclass broke kernel build when gcc does not
	support -ffile-prefix-map
Thread-Index: AdMbP/IAS7YtOOP4SGipYQJELqD0gg==
Date: Tue, 22 Aug 2017 12:19:17 +0000
Message-ID: <LOXP123MB011794376CC584AF9CC750B485840@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; LOXP123MB0006;
	6:AJ4P7Qu0ZedUwuCP1QNsenVA43yEkjX5c6HaOz1Lapcy1pbjAA/ePBIcZHv0mciMMZvc89bmJyeivI//fvB49DUJ/1c1O99aezxrWRh05Dk8PF/WFp8xr8gKUjDTbvIeWwiFffNJDiN4AT+pcIH7UxdUrr0FwTlZpkj86uJ96otW3DqgL4hF9o0gogAncJ0qvA3FiEcP1Lv7uRj43wDwFHQucJfDUqoV77QxKuXJXflvkN286+FCJb3cOPAk8uujNO8I8qeWvdVR7FtOMOKdsobtXcUn7Z4Ua8fa/Itsih2+dlODim3TRfpRgYv4HIx3TF+MSiJXCVSWzzle20viCA==;
	5:2Mel+2sLeY3GFlJtB9U8nBRopot4k2R+By8ftgfCaV2QvFUIq7Cw4IKFwE8bS6ERLr3J4R1X8vH93TfMuzqoX+3BiSBIeiIHnm7D+4w/gvexJIJe9ImHFhqAp2zbS6hy+jIyvHSR0UezhUgKDXVjvQ==;
	24:HJqmg0rjJYKZ5cCNErjK7qzGPXaM1chHdQcndOWzXrZJk+zWkZhQWEpzTFNbrvWorONEgyQRzj8WppSrXdLPN7OTUB7R5UV3G6ESznXfs1A=;
	7:5TG4EBd7glPbFfxNBRgLta6Cj+s2EdX14Em5ND963KTdlps3HRKdWGNSSurH3z89ZHxFyng34xmpFVbWELn3zrGmWWPPoRY7+V0nxcW2ckf/Wd9tLhX/WImCQTLMOaTHxIRxCsARm5IExN+bDcPgESKG0RiF8Uzjf+NP1kz7Gbp3kIz3UZA64D5O7eleSdp24xUtnq0XML4BjHSUvmq8B0k83deNiwhXf07rXkuuuNs=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 1835c7e3-a7b8-40ce-9462-08d4e95802a3
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(2017082002075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:LOXP123MB0006; 
x-ms-traffictypediagnostic: LOXP123MB0006:
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <LOXP123MB000645232241BFA3275289DA85840@LOXP123MB0006.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(100000703101)(100105400095)(6041248)(2016111802025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123562025)(20161123555025)(20161123560025)(6043046)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:LOXP123MB0006; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:LOXP123MB0006; 
x-forefront-prvs: 04073E895A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39830400002)(199003)(189002)(14454004)(101416001)(105586002)(6506006)(305945005)(2351001)(8676002)(6436002)(7736002)(66066001)(97736004)(53936002)(77096006)(4326008)(74316002)(8936002)(106356001)(2501003)(189998001)(6116002)(54356999)(5640700003)(102836003)(33656002)(3846002)(86362001)(50986999)(230783001)(81156014)(478600001)(110136004)(68736007)(81166006)(3280700002)(9686003)(5660300001)(3660700001)(6916009)(2906002)(25786009)(7696004)(55016002)(2900100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB0006;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2017 12:19:17.5501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOXP123MB0006
Subject: Change to kernel.bbclass broke kernel build when gcc does not support -ffile-prefix-map
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
X-List-Received-Date: Wed, 23 Aug 2017 01:55:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My build uses a version of gcc that does not support -ffile-prefix-map and =
this is now broken after I updated the tree to include the latest commit to=
 kernel.bbclass "improve reproducibility" 012a70da7ae0617 by Juro Bystricky=
.

The patch introduces the line
cc_option_supported=3D`${KERNEL_CC} -Q --help=3Djoined | grep ffile-prefix-=
map`
When gcc does not support -ffile-prefix-map, the grep will exit with a non-=
zero return code which is caught and causes the do_compile step to fail.

Thanks,
Andrew

