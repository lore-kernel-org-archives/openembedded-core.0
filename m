Return-Path: <Nate.Karstens@garmin.com>
X-Greylist: delayed 15423 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Dec 2015 21:30:59 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0116.outbound.protection.outlook.com [65.55.169.116])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7A57319E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 21:30:59 +0000 (UTC)
Received: from BN3PR0401CA0029.namprd04.prod.outlook.com (10.162.159.167) by
	BN1PR04MB391.namprd04.prod.outlook.com (10.141.60.150) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Tue, 22 Dec 2015 21:30:58 +0000
Received: from BL2FFO11FD010.protection.gbl (2a01:111:f400:7c09::123) by
	BN3PR0401CA0029.outlook.office365.com (2a01:111:e400:51d1::39) with
	Microsoft SMTP Server (TLS) id 15.1.361.13 via Frontend Transport;
	Tue, 22 Dec 2015 21:30:58 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.247)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.247 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.247; helo=garmin.com;
Received: from garmin.com (204.77.163.247) by
	BL2FFO11FD010.mail.protection.outlook.com (10.173.161.16) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Tue, 22 Dec 2015 21:30:58 +0000
Received: from OLAWPA-EXHT01.ad.garmin.com (10.5.143.141) by
	edgetransport.garmin.com (192.168.18.220) with Microsoft SMTP Server
	(TLS) id 14.3.266.1; Tue, 22 Dec 2015 15:30:53 -0600
Received: from OLAWPA-EXMB03.ad.garmin.com ([169.254.2.163]) by
	OLAWPA-EXHT01.ad.garmin.com ([10.5.143.141]) with mapi id
	14.03.0248.002; Tue, 22 Dec 2015 15:30:57 -0600
From: "Karstens, Nate" <Nate.Karstens@garmin.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] dhcpcd: add recipe for dhcpcd
Thread-Index: AQHRO/EHyhi3jjWSdkqs3ACrg645pJ7XolSA//+b0PCAAKuuAP//ng+A
Date: Tue, 22 Dec 2015 21:30:55 +0000
Message-ID: <145451D4E6785E4DA4DFA353A58CB7B2F7E4C625@OLAWPA-EXMB03.ad.garmin.com>
References: <1449718597-2085-1-git-send-email-nate.karstens@garmin.com>
	<CAJTo0LbEMPzVs6JsjtnagwfHqxuyHmTXGXyKc302gCRrb4LKAw@mail.gmail.com>
	<145451D4E6785E4DA4DFA353A58CB7B2F7E4C174@OLAWPA-EXMB03.ad.garmin.com>
	<CAJTo0LbQJFobJgJVP5qDHxATgfz3i7V+h1De1+PY627Zpgr-eQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbQJFobJgJVP5qDHxATgfz3i7V+h1De1+PY627Zpgr-eQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.5.143.129]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.000.1202-22018.003
x-tm-as-result: No--45.663000-0.000000-31
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD010;
	1:CzrL8hIntR1H6qgmdEFzglx+K5g1Pc2ScOwPrse+bhurPHxkoJ1LFK+uxFIG8TC82o3E//XqK81Co+zHf3gkSZFEjOFca49BDRptbyMhGev7oiiy9LKgkyiMQuvCwEnQOPiqePLRVFEHtiBJo3dj+2Zijxu5yCkNt/zrSnXR6M6bglvjcwy7Xbolklvk6oH+dl7K8+Nhdwto4N1S2UX+vn5RDjaQ87mnO+300YNgt34oqjP+58VY89HNVuPQn39PbIGQT7QMCPIwVUMuNJfY+C9btjQfPZoq2L8Csj4gD+1hltgSr/R9DC8+EWXcDBxSXNdWaMFe1+nu6rdnFPUuk0R/6xlZ0FBqDmCCkOpzgZleuB/AoYNLoUyZrfXODFiJrVaQjkBoVBAi2vzRLW4JHQ==
X-Forefront-Antispam-Report: CIP:204.77.163.247; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(2980300002)(438002)(189002)(36304003)(377454003)(24454002)(164054003)(199003)(97736004)(54356999)(76176999)(33656002)(5001960100002)(69596002)(512874002)(93886004)(87936001)(16236675004)(19300405004)(55846006)(84326002)(19580405001)(2920100001)(5003600100002)(19580395003)(2900100001)(102836003)(189998001)(586003)(2950100001)(77096005)(86362001)(790700001)(5890100001)(6116002)(16796002)(6806005)(15975445007)(1096002)(5008740100001)(40036005)(1220700001)(11100500001)(106116001)(92566002)(19625215002)(5004730100002)(300700001)(21086003)(3846002)(81156007)(106466001)(110136002)(50986999)(129583001)(17423001)(156123004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR04MB391; H:garmin.com; FPR:;
	SPF:Pass; PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB391;
	2:YtdCJsg//3Ji2FW7xAAj7CqFTMimZESawWCjld4N79SXG+Nvx29A6BPHfmfrMUCNDzu4MTJ9l64I8RGHLzKqe+Cz5GMpRUhSDkXd1QzVAfOkle6LzpGMg/qij+yr+O7N5MnysLOVDtFS/Uq2yl/R1w==;
	3:ipRyPXHkvNPbMcd3qFYlWoHR2Y09j71D6vOtrQOaV6cLO6fMPAuyXAPDGUGPmgy+DSVOkPJz03bNjIhXX+81i5FYSiHYQj5MMtWfP6hoPQnjXKhMq6VYviUvecnbUs2jFQ00RxikwIUtHMqHpWHvwcAMLjc4yl6/bhrJOMVJKUJjy9J64hWLDzWD+ZGueFk3Voi+RflDiknhcxacSXcsLJYFeq1FV/T2MmmRmuFKFn3RUqrIHaRNk+5jmWGkqTVR1jFE0dVpdpW5b/qWlY0QAQ==;
	25:wK7fbSYhGJ0zG9RfO90kQei/Wmk8BJGajlvw3CZKEbJa8WdFwYNL1Z6BeJTtJenQSLS91r4a9iPpWFdNz5zMiX57wi5VWNVayD0HK1AmvgwfF+vmjN9xYenKqIYNcWongqQdRFq2qFjJRavWHi/PYQTThKDJL2ar/sXWY/Ng9O8WpTK4pjsuVwxh5exYWPMc51SEJhQTVEsnI4/Y3HUWIfUizNM5gxAjV9+MY6pwTB6g9Jj41VLckqyKrTq7+mgl
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501001);
	SRVR:BN1PR04MB391; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB391;
	20:pJVgvg1/AexQABw1+bTVL4Z+qqVa/STpqA0S2+4onSl3aOh6pidhVU0giJJjTGeuTDq62LUHtNIdVoCB4z4HG2SeHbyaMrpY6RlDmfLCToBCZxf7hmrzzLtnrol0WGq+b7LsAWHQf4+LUNxC6ACX2wRwMH7Y1/BkZtPtU7LK+8A3RXjohSnSGYp+WnfKU7lAwzEaSI68xrTkNRcsFt4Zq1r/PAULYHqA6d3aSTTGx7pyQgx6g9RMG28IxIgrF+VH/R/IJjzW2Hgq208o36gdtPWzRrCmOQZoqYmL3jvABGEXjGMd+rkyYHSYfzknZ3bBY4g/4z6mUXom8D/VBkj7BhEeWFvRggka2Kcv/3Fm4QFXCWg4bM1LPdjdu5DAyFAlwNIEpxMHO7NlfOTxGIC2AY30QJX8Ub7h6GefINqc23q14zmijSFTiMU1f5LlqeZIbFD8ans/03UxvI8gTlBN4lNaD+ZF4WhbeN2KqW79J/kt32KdO5yFkvDEo+Nqshqu;
	4:bRtx0z26JQ7IFGBVM/OZbJ261QWq+Eqmwp0YzkWaKow7daV+T2WPq9JxUrHXnOB0qGHgRh6J02+lLtJROGLC+C+otHeku41ydv5EJg3keGVbipG4WguOF2TCEORa8F0vqYHAx3fy5qJkdw/r8vXWmTOSUz+EznRO9wMyl01lfReuLtssOSrXmuFjVd7MNlLx9X1H9WQo5l9kBobPwQz8k+c2u+JOUjpl+1dDuJuBYkY7DgJTPZ4KLyTEdMLyctcywl8BPqJoyC+88yWqS7CkDi9FhoW2CRW7/ErgdhNGs3nvIsB5zM6lI7HL6WCJ2sjJRP5JBl/0wmAlopbVsnD4+2ajdbo1G9zANgiM8azBvJAi6RE8EZ7U15yi1J8ih6CJaFk9BJsgBzfTJBEmMG4J5wqKEsYjNYeeZlPiokNIbQM=
X-Microsoft-Antispam-PRVS: <BN1PR04MB391B1815838A01C7ED027D89CE50@BN1PR04MB391.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(210672237334638);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(520078)(5005006)(3002001)(10201501046);
	SRVR:BN1PR04MB391; BCL:0; PCL:0; RULEID:; SRVR:BN1PR04MB391; 
X-Forefront-PRVS: 0798146F16
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR04MB391;
	23:C5lKcakx1yHFEa6WIzQpYT2xEyd15tzeOCczxjQc9D?=
	=?us-ascii?Q?j3sTcpEwmCr4op2QPp4itYj7jZXuiZsZxR3SSH/Uo3LyCFqi7CRqjozv2Uao?=
	=?us-ascii?Q?SUjcAHMOJtV3CXoHry83BAzYbaUpTBoadV5fsBOR15J+j9ltefuZ22Z0H7IV?=
	=?us-ascii?Q?HLQRYMTRswGw4tlNLmg2Iget1HjNQukXGCN3VZYsfFJ0dO1HKqYQoVlJhgmg?=
	=?us-ascii?Q?dvKX+09rq38WcT+0gFMpFKC/SZ2KHgnnQMCC2OIeXoq4q7kZvt+Zj6kQukPj?=
	=?us-ascii?Q?qnTks/1pwLjUcQWwHpzoFHCLlj5NsS92xhOCuIDguBTFMriCZ5ky2wRcHVw1?=
	=?us-ascii?Q?xLZs1khhNtrUV7gtB/OqhRUlO98ogyn+MdGRnDk1vMF0GVR6HgIlFj+OHo6P?=
	=?us-ascii?Q?uYOjgQlN3PHHytrJ+3642mCOqD8/C9/EtMBMYNQ6Gdl7HsQcWAgF0MpEPdvv?=
	=?us-ascii?Q?bqmSMS4vmN7VDlU0wXee5pu48NOP3lElSmnTLpLi+DmnlBWCCq7+sB7fk9hk?=
	=?us-ascii?Q?Sbc47O7G/ijFhUCrfwI9kEg/hX2je+SpZwNYlz8fhOy2x5m6a6nBzkNCUzrn?=
	=?us-ascii?Q?qgwcp7ujybTL4+a73FCcbfHqaS0kepyoAHYz3mmTG/HwICjFMxM/6WUYGCPO?=
	=?us-ascii?Q?Xf3EhmSSeaCwyWzKKEoM2IvCDuSmFNRJDrlGqkBpI8Dvqs7z7ET5h2iwbfO6?=
	=?us-ascii?Q?OuLeTQNgWw2T4ncTgR8Ozj9ko0oXVIOcbXUNoOBq5qv+YSZn8tQDij/it8Lh?=
	=?us-ascii?Q?Ss1cnAL1GHSWbdl4YJYw8ZsyFdTEO9ZQxrjVg03rREtwYiw3vKtawMpLnHJ6?=
	=?us-ascii?Q?ZpVvOvnsafwXKOTmDLNKbWtAnZXBrvSYbGQ5BWriaCqEPbHWDvZFrL7G/ATv?=
	=?us-ascii?Q?E14J7ePgU8CQ5Lf0kZL3SzMoCG5ZGcxKO3DrXsN1UZk47P7ExDeTP1bwD+qI?=
	=?us-ascii?Q?8LVSM9FxOIgCe6gdNWQiW8ID6SkREN6sTvmKVzC0d2dHVaz+pf+9eSaOfJvs?=
	=?us-ascii?Q?zDTiiMyIzoREM2NpHD1bg/OO2wID+B99wYphoZImWi8We3iXC+VEv0UC1u38?=
	=?us-ascii?Q?wRcbxWAoeK/sezzRpvGzNXsxf6d6GnEnf+dVYbWJ3j7YywD5pTU00zDeblZU?=
	=?us-ascii?Q?Skfx03+2oiF7Nwdrdc/W5zvzWbxpYWfmM1NaUf4qi7V/43dCQ3NEaEUDE1cr?=
	=?us-ascii?Q?IBGcjzqVnEWQ+iQy4LZAcnnHoJcf+fFiwPrjNbp1BozjmHmLmmamcfKr/OX2?=
	=?us-ascii?Q?/wWHB5IEDj731CgfZ53U65LDIK46Xz6HS6Tvs3tVAxRALikS0iI79GMGY48A?=
	=?us-ascii?Q?xDXNNnKfjHw5Ue/RssDsfqpjHcO4Z8AOIei7ZDEtVHKTyplAsXCqiSwmev/I?=
	=?us-ascii?Q?PP45VboarGS2Tjka9CdSNDLF48iU2YSOBbhp0sY901nq76MvebIH6NA+jjc3?=
	=?us-ascii?Q?YyBMs9X7urEPKFjxkYhoaNBkkZ7AST38wXW2lmDSBice3rhzqGD3v9e09/6P?=
	=?us-ascii?Q?+ipW1iYlFg7g=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB391;
	5:Y14P6J01btT/OiftIOhUXD83ff9L/FQMoIbprhxMcg67pmmmV50/9iiyqoM7bxOaRx3gr+/NqFfQvA2ribyjUgX3QNV++CMtDUoRJ1zilJDK4t64bsRzOBTG4Ulbie8vxY+hX7Qw+TmvPjOM0Ve+zA==;
	24:5j/x8AwrdaL0n4n9o27/T1+wBi/4hrLAHEHxq18xoUwECe0EXq7pcridzs6PgXJC5M3z+XwXs2gzW6UvRvHp6ibMx1vvqEKQ231xvOhOa6k=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2015 21:30:58.3714 (UTC)
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.247]; Helo=[garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR04MB391
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcpcd: add recipe for dhcpcd
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
X-List-Received-Date: Tue, 22 Dec 2015 21:31:00 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_145451D4E6785E4DA4DFA353A58CB7B2F7E4C625OLAWPAEXMB03adg_"

--_000_145451D4E6785E4DA4DFA353A58CB7B2F7E4C625OLAWPAEXMB03adg_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U291bmRzIGdvb2QuIEnigJlsbCByZXN1Ym1pdCB0byBtZXRhLW5ldHdvcmtpbmcuIE9uY2UgdGhh
dCBnb2VzIHRocm91Z2ggSeKAmWxsIHN1Ym1pdCBhIHBhdGNoIHRvIHJlbW92ZSBpdCBmcm9tIG1l
dGEtYWx0LWRlc2t0b3AtZXh0cmFzLg0KDQpUaGFua3MsDQoNCk5hdGUNCg0KRnJvbTogQnVydG9u
LCBSb3NzIFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KU2VudDogVHVlc2RheSwgRGVj
ZW1iZXIgMjIsIDIwMTUgMzoyMCBQTQ0KVG86IEthcnN0ZW5zLCBOYXRlIDxOYXRlLkthcnN0ZW5z
QGdhcm1pbi5jb20+DQpDYzogT0UtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBkaGNwY2Q6IGFkZCBy
ZWNpcGUgZm9yIGRoY3BjZA0KDQoNCk9uIDIyIERlY2VtYmVyIDIwMTUgYXQgMTc6MTMsIEthcnN0
ZW5zLCBOYXRlIDxOYXRlLkthcnN0ZW5zQGdhcm1pbi5jb208bWFpbHRvOk5hdGUuS2Fyc3RlbnNA
Z2FybWluLmNvbT4+IHdyb3RlOg0KQmFzZWQgb24gdGhpcyBJIGNhbiBzZWUgdHdvIGFwcHJvYWNo
ZXM6IDEpIGxvY2F0ZSBhbGwgREhDUCBjbGllbnQgcmVjaXBlcyBpbiB0aGUgc2FtZSBsYXllciBi
ZWNhdXNlIHRoZXkgYWxsIHByb3ZpZGUgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eSBvciAyKSBpbmNs
dWRlIGFsdGVybmF0aXZlcyBpbiBvdGhlciBsYXllcnMgKHdoaWNoIGluIHRoaXMgY2FzZSByZWFs
bHkganVzdCBtZWFucyBkaGNwY2QgYXMgdGhlIElTQyBESENQIGNsaWVudCBhbmQgYnVzeWJveCBz
aG91bGRu4oCZdCByZWFsbHkgYmUgY29uc2lkZXJlZCDigJxhbHRlcm5hdGl2ZXPigJ0pLg0KDQpJ
biBlaXRoZXIgY2FzZSBpdCBwcm9iYWJseSBtYWtlcyBzZW5zZSB0byByZW1vdmUgdGhlIG9sZCBy
ZWNpcGUgZnJvbSBtZXRhLWFsdC1kZXNrdG9wLWV4dHJhcy4NCg0KDQpEZWZpbml0ZWx5ICgyKSwg
b2UtY29yZSBuZWVkcyAqc29tZXRoaW5nKiB0byBwcm92aWRlIERIQ1AgZnVuY3Rpb25hbGl0eSBi
dXQgbWV0YS1uZXR3b3JraW5nIGlzIHRoZSBvYnZpb3VzIGZpdCBmb3IgYW4gYWx0ZXJuYXRpdmUg
Y2hvaWNlLg0KDQpSb3NzDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNCkNP
TkZJREVOVElBTElUWSBOT1RJQ0U6IFRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUg
Zm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpIGFuZCBjb250YWlu
IGluZm9ybWF0aW9uIHRoYXQgbWF5IGJlIGNvbmZpZGVudGlhbCBhbmQvb3IgbGVnYWxseSBwcml2
aWxlZ2VkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ug
bm90aWZ5IHRoZSBzZW5kZXIgYnkgcmVwbHkgZW1haWwgYW5kIGRlbGV0ZSB0aGUgbWVzc2FnZS4g
QW55IGRpc2Nsb3N1cmUsIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBvciB1c2Ugb2YgdGhpcyBjb21t
dW5pY2F0aW9uIChpbmNsdWRpbmcgYXR0YWNobWVudHMpIGJ5IHNvbWVvbmUgb3RoZXIgdGhhbiB0
aGUgaW50ZW5kZWQgcmVjaXBpZW50IGlzIHByb2hpYml0ZWQuIFRoYW5rIHlvdS4NCg==

--_000_145451D4E6785E4DA4DFA353A58CB7B2F7E4C625OLAWPAEXMB03adg_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9
DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCglj
b2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjpw
dXJwbGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpzcGFuLkVtYWlsU3R5bGUxNw0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIs
c2Fucy1zZXJpZjsNCgljb2xvcjojMUY0OTdEO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHls
ZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30N
CkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4g
MS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9u
MTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0
cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1b
aWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRt
YXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5k
aWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1
cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZx
dW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPlNvdW5kcyBnb29kLiBJ4oCZbGwgcmVzdWJt
aXQgdG8gbWV0YS1uZXR3b3JraW5nLiBPbmNlIHRoYXQgZ29lcyB0aHJvdWdoIEnigJlsbCBzdWJt
aXQgYSBwYXRjaCB0byByZW1vdmUgaXQgZnJvbSBtZXRhLWFsdC1kZXNrdG9wLWV4dHJhcy48bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7
Y29sb3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7
Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPlRoYW5rcyw8bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6
IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJy
aSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPk5hdGU8bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtm
b250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3RCI+
PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90
OyxzYW5zLXNlcmlmIj5Gcm9tOjwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj4gQnVydG9uLCBS
b3NzIFttYWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPGJyPg0KPGI+U2VudDo8L2I+IFR1
ZXNkYXksIERlY2VtYmVyIDIyLCAyMDE1IDM6MjAgUE08YnI+DQo8Yj5Ubzo8L2I+IEthcnN0ZW5z
LCBOYXRlICZsdDtOYXRlLkthcnN0ZW5zQGdhcm1pbi5jb20mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBP
RS1jb3JlICZsdDtvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnJmd0Ozxi
cj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZGhjcGNkOiBhZGQgcmVj
aXBlIGZvciBkaGNwY2Q8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T24g
MjIgRGVjZW1iZXIgMjAxNSBhdCAxNzoxMywgS2Fyc3RlbnMsIE5hdGUgJmx0OzxhIGhyZWY9Im1h
aWx0bzpOYXRlLkthcnN0ZW5zQGdhcm1pbi5jb20iIHRhcmdldD0iX2JsYW5rIj5OYXRlLkthcnN0
ZW5zQGdhcm1pbi5jb208L2E+Jmd0OyB3cm90ZTo8bzpwPjwvbzpwPjwvcD4NCjxibG9ja3F1b3Rl
IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0NDIDEuMHB0O3BhZGRp
bmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2luLXJpZ2h0OjBpbiI+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNv
LW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2Zv
bnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj5C
YXNlZCBvbiB0aGlzIEkgY2FuIHNlZSB0d28gYXBwcm9hY2hlczogMSkgbG9jYXRlIGFsbCBESENQ
IGNsaWVudCByZWNpcGVzIGluIHRoZSBzYW1lIGxheWVyIGJlY2F1c2UNCiB0aGV5IGFsbCBwcm92
aWRlIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgb3IgMikgaW5jbHVkZSBhbHRlcm5hdGl2ZXMgaW4g
b3RoZXIgbGF5ZXJzICh3aGljaCBpbiB0aGlzIGNhc2UgcmVhbGx5IGp1c3QgbWVhbnMgZGhjcGNk
IGFzIHRoZSBJU0MgREhDUCBjbGllbnQgYW5kIGJ1c3lib3ggc2hvdWxkbuKAmXQgcmVhbGx5IGJl
IGNvbnNpZGVyZWQg4oCcYWx0ZXJuYXRpdmVz4oCdKS48L3NwYW4+PG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1h
cmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQt
ZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj4mbmJz
cDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNv
LW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fu
cy1zZXJpZjtjb2xvcjojMUY0OTdEIj5JbiBlaXRoZXIgY2FzZSBpdCBwcm9iYWJseSBtYWtlcyBz
ZW5zZSB0byByZW1vdmUgdGhlIG9sZCByZWNpcGUgZnJvbSBtZXRhLWFsdC1kZXNrdG9wLWV4dHJh
cy48L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNv
LW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fu
cy1zZXJpZjtjb2xvcjojMUY0OTdEIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8L2Js
b2NrcXVvdGU+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxicj4NCkRlZmluaXRlbHkg
KDIpLCBvZS1jb3JlIG5lZWRzICpzb21ldGhpbmcqIHRvIHByb3ZpZGUgREhDUCBmdW5jdGlvbmFs
aXR5IGJ1dCBtZXRhLW5ldHdvcmtpbmcgaXMgdGhlIG9idmlvdXMgZml0IGZvciBhbiBhbHRlcm5h
dGl2ZSBjaG9pY2UuPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPlJvc3M8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjxi
cj4NCjxocj4NCjxmb250IGZhY2U9IkFyaWFsIiBjb2xvcj0iR3JheSIgc2l6ZT0iMSI+PGJyPg0K
Q09ORklERU5USUFMSVRZIE5PVElDRTogVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFy
ZSBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgYW5kIGNvbnRh
aW4gaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgY29uZmlkZW50aWFsIGFuZC9vciBsZWdhbGx5IHBy
aXZpbGVnZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFz
ZSBub3RpZnkgdGhlIHNlbmRlciBieSByZXBseQ0KIGVtYWlsIGFuZCBkZWxldGUgdGhlIG1lc3Nh
Z2UuIEFueSBkaXNjbG9zdXJlLCBjb3B5aW5nLCBkaXN0cmlidXRpb24gb3IgdXNlIG9mIHRoaXMg
Y29tbXVuaWNhdGlvbiAoaW5jbHVkaW5nIGF0dGFjaG1lbnRzKSBieSBzb21lb25lIG90aGVyIHRo
YW4gdGhlIGludGVuZGVkIHJlY2lwaWVudCBpcyBwcm9oaWJpdGVkLiBUaGFuayB5b3UuPGJyPg0K
PC9mb250Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_145451D4E6785E4DA4DFA353A58CB7B2F7E4C625OLAWPAEXMB03adg_--
