Return-Path: <zhenhua.luo@nxp.com>
X-Greylist: delayed 8353 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 May 2016 12:16:06 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0094.outbound.protection.outlook.com [157.56.112.94])
	by mail.openembedded.org (Postfix) with ESMTP id A70546057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=V9GlqIVAK72HjLE/8Ua2pdgt37J7GMdvxJgH+8A0sBo=;
	b=kdisd5cIpdMssY75DKv6CLfi8y+7vR8UKPMH7i/1Gm2q7BKG9S+NzzKEnnAVXCHtATpX0qXR0BHU8ydkH1GrybKmlitWiJZC2iMcxgYYGEML0tH8MqFQW/YNxnAoeb4V7X8kGgeC6e94uWS1aAXI28tqCzmhHou+8SdVyj4JcSY=
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::14) by DB3PR04MB0682.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::12) with Microsoft SMTP Server (TLS) id
	15.1.492.11; Thu, 12 May 2016 09:42:39 +0000
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::4424:55f9:e3a5:451e]) by
	DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::4424:55f9:e3a5:451e%16]) with mapi id 15.01.0492.016;
	Thu, 12 May 2016 09:42:39 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Samba users are cleared after board reboot
Thread-Index: AdGsL+I4aGtTyUcZR0+ME65a/WO0Gg==
Date: Thu, 12 May 2016 09:42:38 +0000
Message-ID: <DB3PR04MB068453053D79523275254DA9EE730@DB3PR04MB0684.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
x-originating-ip: [199.59.225.131]
x-ms-office365-filtering-correlation-id: 036586da-8441-4f33-522f-08d37a49c1d4
x-microsoft-exchange-diagnostics: 1; DB3PR04MB0682;
	5:w/1YJJSg/Fki7k0at9SfPPRq77wMUIolQIcr3lS3OI1zQMPsPE+D+tBJipBaua/aWM5w2zXMOtVxDRZJUySawEDkwZFPcGvT5uubRykczT0hUgiSLBoIq78N72KeuiRStP7Zzuf2+UTQankRJssBLQ==;
	24:MJb8VIk576aXnNiwZT0bNH2tNjcTpXgfFh5f7pNOy+ONHoDHWCoVpR3WTI6ClgCe7q9GJ9trmyxnYR8fZKJj7/guQy/byWcbARu6zJ9nm+Q=;
	7:SMoTVbo8FObikgegb3cooxdyQ24iwTPKXXksv9h9hiMQhdTYrPyhvgqeq2zjoIr76G4Bdau91PvGwt3AzbFfsHsvLOv30EMyPGD/yBzd0x2w/e87SapPzBhrOszPOsHY3MA1KUl+ACy2RtUj8BKY86Jcx582o84i0aVng4u3q6dDkHQqE1NnYUvXWRG2kpEj
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR04MB0682;
x-microsoft-antispam-prvs: <DB3PR04MB068202223D159FD4E55F7807EE730@DB3PR04MB0682.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:DB3PR04MB0682; BCL:0; PCL:0; RULEID:; SRVR:DB3PR04MB0682; 
x-forefront-prvs: 0940A19703
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(53754006)(5004730100002)(15975445007)(86362001)(74316001)(19580395003)(9686002)(19300405004)(189998001)(8936002)(5003600100002)(107886002)(110136002)(11100500001)(2900100001)(551544002)(16236675004)(87936001)(2906002)(5008740100001)(54356999)(3846002)(50986999)(586003)(102836003)(6116002)(2351001)(450100001)(5250100002)(19625215002)(5002640100001)(2501003)(229853001)(33656002)(66066001)(3280700002)(92566002)(76576001)(790700001)(81166006)(3660700001)(1220700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR04MB0682;
	H:DB3PR04MB0684.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2016 09:42:39.0771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR04MB0682
Subject: Samba users are cleared after board reboot
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
X-List-Received-Date: Thu, 12 May 2016 12:16:07 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB3PR04MB068453053D79523275254DA9EE730DB3PR04MB0684eurp_"

--_000_DB3PR04MB068453053D79523275254DA9EE730DB3PR04MB0684eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

I build samba(3.6.8).into rootfs by Yocto 1.4.1 (dylan), the rootfs can boo=
t up the board via NFS and samba service can start successfully, then I use=
 "smbpasswd -a samba" to create "samba" user, "samba" is a valid user to lo=
gin Linux, "smbclient -L <board-ip> -U samba" can be executed on host to co=
nnect to samba server normally.

When the target board reboot, samba service can be launched, but "smbclient=
 -L <board-ip> -U samba" reports the following error. The password storage =
file(/var/volatile/lock/passdb.tdb) is recreated and the users information =
is cleaned.
"session setup failed: NT_STATUS_LOGON_FAILURE"

Does somebody know what's the problem and how to store the samba user/passw=
ord information in rootfs permantly?


Best Regards,

Zhenhua

--_000_DB3PR04MB068453053D79523275254DA9EE730DB3PR04MB0684eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello all, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I build samba(3.6.8).into rootfs by Yocto 1.4.1 (dyl=
an), the rootfs can boot up the board via NFS and samba service can start s=
uccessfully, then I use &#8220;smbpasswd &#8211;a samba&#8221; to create &#=
8220;samba&#8221; user, &#8220;samba&#8221; is a valid user to login Linux,
 &#8220;smbclient -L &lt;board-ip&gt; -U samba&#8221; can be executed on ho=
st to connect to samba server normally.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When the target board reboot, samba service can be l=
aunched, but &#8220;smbclient -L &lt;board-ip&gt; -U samba&#8221; reports t=
he following error. The password storage file(/var/volatile/lock/passdb.tdb=
) is recreated and the users information is cleaned.
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in">&#8220;session setup fail=
ed: NT_STATUS_LOGON_FAILURE&#8221;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does somebody know what&#8217;s the problem and how =
to store the samba user/password information in rootfs permantly?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Zhenhua <o:p></o:p></p>
</div>
</body>
</html>

--_000_DB3PR04MB068453053D79523275254DA9EE730DB3PR04MB0684eurp_--
