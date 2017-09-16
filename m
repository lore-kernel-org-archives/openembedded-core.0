Return-Path: <will.page@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 2822370101
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Sep 2017 02:22:03 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v8G2LLRq003155; Fri, 15 Sep 2017 21:22:04 -0500
Received: from nam03-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam03lp0023.outbound.protection.outlook.com [207.46.163.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2cw6r7e65g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2017 21:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/B4bitpJdKwrsrOZIF48uk1TPogukyARieOEmXKiqjc=;
	b=e5z1hgmTECD3n1OzYXDfalI/tA/pXYCPKHNkyZsdiL378gI9Nzesm3cmY6qqtEzAb32dx0J5lNiq8DX5XHMjg+/ZNigdhkdN2mhK9VtE7VPBcj0a4idkVIOVPD/XSiN9ZNIUJvQq3eDUf1fRLOrlBRr6qs5LDD7bH6thb+oz9m4=
Received: from CO2PR04MB619.namprd04.prod.outlook.com (10.141.197.152) by
	CO2PR04MB2343.namprd04.prod.outlook.com (10.166.94.149) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.56.11; Sat, 16 Sep 2017 02:22:01 +0000
Received: from CO2PR04MB619.namprd04.prod.outlook.com ([10.141.197.152]) by
	CO2PR04MB619.namprd04.prod.outlook.com ([10.141.197.152]) with mapi id
	15.20.0035.021; Sat, 16 Sep 2017 02:22:01 +0000
From: Will Page <will.page@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [pseudo][PATCH] Fix to fcntl guts to ignore flags that
	can be ORed into cmd
Thread-Index: AQHTLnHKyyEfyqRzhUmMnCf4cIb9nKK2jLIAgAA7IBc=
Date: Sat, 16 Sep 2017 02:22:01 +0000
Message-ID: <CO2PR04MB619C119668833BC7B259C21916D0@CO2PR04MB619.namprd04.prod.outlook.com>
References: <20170915222700.GA15457@canismajor>,
	<CAJTo0LbA_fr5bd8kAa-ma3zb4X8oEy3YUwrtqvSDjpAdNnxUow@mail.gmail.com>
In-Reply-To: <CAJTo0LbA_fr5bd8kAa-ma3zb4X8oEy3YUwrtqvSDjpAdNnxUow@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2601:1c2:5000:cdc7:cdd7:185d:c42e:ea0d]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CO2PR04MB2343;
	6:rzpChOY/AiKZn2ioj8SnwNnSYSkRxc8VhZw2P0tnterJTJ/QNCvL7Hlx/GbAkxvU/Nsd5Xab6LU1Gn57eOpdjeEyUY47owRo6EybzWjdLNlnY/OBEasomw0jbe+LFXkhEyMO9j5EvaU3VtySkE+mQ14koJB0RnMX2EidALE05x7ZEb9xqoQIUvsbFf1G7VPX7xMwIx9AkeHeDE++d6lzrnXW0j1LISCUMXi3JJGuRZCvS7Kc3ZivHKDOeBNlQVAL8VyVqa3Y0UKkYhGDJj6GCMvwrpPYP2e8PkwMmkxJCrtjYTUwPO4TcdKGawlxvhymtQpzURitQHaRlY3YFD9GdA==;
	5:4AjeMrN/lclIZCHrXX1/ygyiiyE3Cat5aFuZD1xcylpW9DnrsKAJRJdbXkwc/yp+LDP5lLmzlMjbFEFop+VRy99IyM9VBH0DtXmXTdxEwZ56EUIazceMxPECNGVZdB3i2U2NpYw9xb1XTtEtRoWxvA==;
	24:zUpphZQW/m6YedqUJYGxC7nK2SPYVWumV3B6t02c17UP29lpjY+E24iIfBfMyWfmjk5JmR9CRGBkHEHg58qE2OIQtzn3+c/+P4wldLeG0Ig=;
	7:vgoVmZkXxXAt7mdqRzzXvsuNQE2wbxDanc79YvCaDomG6flo/e6gktysF7VKVGsSfPxbygfwoNiAtpDJ234TrYhiKWUkZJjem2sK9MCU2FQQXYX9HT3+ewEX/J3kyb46rLG7ClZQs8a8wzCvnOJf+lmoIKm93Fc2ozT0skxi3vRk0VteA4NNKlNnwpsJvdkyES41dgA/IfdPQOsab2xiBeDuAlW/Qy93KJ97GUZdhUU=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 4ff1da9a-7669-410c-b502-08d4fca9b721
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:CO2PR04MB2343; 
x-ms-traffictypediagnostic: CO2PR04MB2343:
x-exchange-antispam-report-test: UriScan:(10436049006162)(264703809997249)(228905959029699)(145744241990776);
x-microsoft-antispam-prvs: <CO2PR04MB234329DE990381EA10A4DBDD916D0@CO2PR04MB2343.namprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(10201501046)(93006095)(93001095)(6041248)(20161123555025)(20161123560025)(20161123562025)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CO2PR04MB2343; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CO2PR04MB2343; 
x-forefront-prvs: 0432A04947
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(376002)(346002)(199003)(24454002)(189002)(377454003)(4326008)(76176999)(54356999)(7736002)(101416001)(6246003)(77096006)(2906002)(97736004)(8936002)(229853002)(478600001)(50986999)(189998001)(74316002)(3280700002)(316002)(2900100001)(110136004)(14454004)(305945005)(54906002)(99286003)(55016002)(9686003)(53936002)(53546010)(3660700001)(68736007)(102836003)(6116002)(6306002)(8676002)(6916009)(2950100002)(25786009)(6436002)(81166006)(966005)(6506006)(81156014)(86362001)(33656002)(5660300001)(105586002)(7696004)(106356001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2343;
	H:CO2PR04MB619.namprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2017 02:22:01.5850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2343
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-09-15_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1709160033
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [pseudo][PATCH] Fix to fcntl guts to ignore flags that can be ORed into cmd
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
X-List-Received-Date: Sat, 16 Sep 2017 02:22:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks, Ross.

I had contacted the maintainer off list to ask where I should submit my pat=
ch.  I may have misunderstood his reply.

I'll go ahead and resend this patch to the yocto list.

________________________________________________________

Will Page
Senior Software Engineer
National instruments

O +1.512.683.6956
Will.Page@ni.com


________________________________________
From: Burton, Ross <ross.burton@intel.com>
Sent: Friday, September 15, 2017 3:48 PM
To: Will Page
Cc: OE-core; Seebs
Subject: Re: [OE-core] [pseudo][PATCH] Fix to fcntl guts to ignore flags th=
at can be ORed into cmd

Hi Will,

This should go to the yocto@yoctoproject.org<mailto:yocto@yoctoproject.org>=
 list really.  I've CC'd the maintainer to be sure he spots it.

Ross

On 15 September 2017 at 23:27, Will Page <Will.Page@ni.com<mailto:Will.Page=
@ni.com>> wrote:
The fcntl guts switch on "cmd" parameter to identify the fcntl
command being issued, but isn't aware of the file creation flags that
can be ORed in.

This change masks out the flags from the command only for the switch
statement so that it can correctly determine whether it needs to pass
"lock" or "arg".  When real_fcntl() is called, the original value is
still passed on. This corrects an issue observed using pseudo on modern
linux desktops resulting in "pseudo: unknown fcntl argument 1030,
assuming long argument." diagnostics in the output.  Decimal 1030 is
0x0406, which translates to O_NOCTTY | F_SETLK, and should call
"rc =3D real_fcntl(fd, cmd, lock);", but instead falls through to the
default case instead calling "rc =3D real_fcntl(fd, cmd, arg);".

Tested the change using perftest - without this patch, the issue is
trivially reproducible on my Ubuntu Xenial system, and after patching it
emitted no "unknown fcntl argument" diagnostics.

Signed-off-by: Will Page <Will.Page@ni.com<mailto:Will.Page@ni.com>>
---
 ports/linux/guts/fcntl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
index 639fd24..d278a8c 100644
--- a/ports/linux/guts/fcntl.c
+++ b/ports/linux/guts/fcntl.c
@@ -8,6 +8,10 @@
  */
        long arg;
        int save_errno;
+       /* some bits can be ORed into the cmd should be explicitly ignored
+        * see fcntl documentation on F_SETFL */
+       int o_mode_mask =3D (O_RDONLY | O_WRONLY | O_RDWR) |
+               (O_CREAT | O_EXCL | O_NOCTTY | O_TRUNC);

        /* we don't know whether we need lock or arg; grab both, which
         * should be safe enough on Linuxy systems. */
@@ -15,7 +19,7 @@
        arg =3D va_arg(ap, long);
        va_end(ap);

-       switch (cmd) {
+       switch (cmd & ~(o_mode_mask)) {
        case F_DUPFD:
 #ifdef F_DUPFD_CLOEXEC
        case F_DUPFD_CLOEXEC:
--
2.7.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.ope=
nembedded.org>
http://lists.openembedded.org/mailman/listinfo/openembedded-core<https://ur=
ldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org_mailman_=
listinfo_openembedded-2Dcore&d=3DDwMFaQ&c=3DI_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZ=
ZuIPelcSjixA&r=3D-PS0OYZ7YP1crHfex64Ojw&m=3DGwerYyJqZysRsEI2Ua5_9TJVT-a8KZx=
s2fec7a3M6ig&s=3D_U2-_Ub2i1xoGVV3H1m1I2IuNiovYWvZUapKZG7swPY&e=3D>


