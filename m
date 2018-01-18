Return-Path: <Hakan.Eriksson@verisure.com>
X-Greylist: delayed 3093 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 18 Jan 2018 11:37:47 UTC
Received: from mx08-00271601.pphosted.com (mx07-00271601.pphosted.com
	[91.207.212.217])
	by mail.openembedded.org (Postfix) with ESMTP id 7F64D78776
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 11:37:46 +0000 (UTC)
Received: from pps.filterd (m0107397.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w0IAhE0s028717 for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 11:46:15 +0100
Received: from eur01-he1-obe.outbound.protection.outlook.com
	(mail-he1eur01lp0211.outbound.protection.outlook.com
	[213.199.154.211])
	by mx08-00271601.pphosted.com with ESMTP id 2fj88rndjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 11:46:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=verisure.onmicrosoft.com; s=selector1-verisure-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ffXx0XjUZ5f11r/yOZnhSu1CeO1JszIzbEKogUHjlPg=;
	b=YYRLHmeM89YN4hi1da80DzaoNrGdnFvcW+2dOUwm5sxhsePVkFCAH9SVI5E5em8jshrafpIegZr1tDKZuhm92w9eu4OQnmTmLHegm5fGRj8lSixwj9i3lJlTa8rN0B/koT1s90d6U4QsAe0lzWwB766dl7W+UJ/ixeqOjtD8LQQ=
Received: from HE1PR1001MB1339.EURPRD10.PROD.OUTLOOK.COM (10.171.98.22) by
	HE1PR1001MB1340.EURPRD10.PROD.OUTLOOK.COM (10.171.98.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Thu, 18 Jan 2018 10:46:13 +0000
Received: from HE1PR1001MB1339.EURPRD10.PROD.OUTLOOK.COM
	([fe80::e4c1:8b4e:1a1b:fe48]) by
	HE1PR1001MB1339.EURPRD10.PROD.OUTLOOK.COM
	([fe80::e4c1:8b4e:1a1b:fe48%18]) with mapi id 15.20.0407.012;
	Thu, 18 Jan 2018 10:46:13 +0000
From: =?iso-8859-1?Q?H=E5kan_Eriksson?= <Hakan.Eriksson@verisure.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: devtool deploy-target fails with "no files to deploy"
Thread-Index: AQHTkEmPuldtEHMwD0eBDhJtr6X0Rw==
Date: Thu, 18 Jan 2018 10:46:13 +0000
Message-ID: <HE1PR1001MB13391F01B9DB432BB3B9EF13FBE80@HE1PR1001MB1339.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [91.199.64.30]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR1001MB1340;
	7:41MvSZ5to+2WFWmgarLXCctQ4NvuzVpCbp/gt/vUNyH35whld34I8rtjnclm9sf1JmQtDGq0Otkf24LNgprPHN0BVONciVZFaja1RfTh65ccXfPKzxpQza7N4i5+sCZL9341ptabDUy0xrmdzhCUuq8+5E3yOLjGemHdU87AgmEN9JqoEVkMcvKswTzDiB/1VuOpNdYsnR/8JT95ZyJj8tyMUN04d63ISIebbS4VSNbVb9EQ013TCVGxlbA2GYbM
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: e3ba9929-e95e-43a8-e67c-08d55e60b1b8
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:HE1PR1001MB1340; 
x-ms-traffictypediagnostic: HE1PR1001MB1340:
x-microsoft-antispam-prvs: <HE1PR1001MB1340B2C5CEC431CE9BFED1E6FBE80@HE1PR1001MB1340.EURPRD10.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231023)(2400060)(944501161)(6041268)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(6072148)(201708071742011);
	SRVR:HE1PR1001MB1340; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:HE1PR1001MB1340; 
x-forefront-prvs: 05568D1FF7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39380400002)(376002)(366004)(39860400002)(346002)(396003)(189003)(199004)(316002)(19627405001)(5250100002)(966005)(66066001)(2906002)(72206003)(97736004)(2501003)(74316002)(6606003)(5640700003)(54896002)(6306002)(7696005)(26005)(236005)(6436002)(55016002)(53936002)(478600001)(68736007)(25786009)(2900100001)(33656002)(86362001)(9686003)(8936002)(6916009)(6116002)(6506007)(81166006)(102836004)(81156014)(606006)(3660700001)(105586002)(14454004)(8676002)(3846002)(2351001)(5660300001)(7736002)(106356001)(99286004)(3280700002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR1001MB1340;
	H:HE1PR1001MB1339.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: verisure.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: PbLgQJEkxRf2YYrzKvk27dwEeCgRM9oQiJDnsDZRb3UNlfx6FSOHKmiPqWcRbbWWi46QXyT7GsnkVCmAOQBC0Q==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: verisure.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ba9929-e95e-43a8-e67c-08d55e60b1b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2018 10:46:13.3099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR1001MB1340
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-01-18_05:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: devtool deploy-target fails with "no files to deploy"
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
X-List-Received-Date: Thu, 18 Jan 2018 11:37:47 -0000
Content-Language: sv-SE
Content-Type: multipart/alternative;
	boundary="_000_HE1PR1001MB13391F01B9DB432BB3B9EF13FBE80HE1PR1001MB1339_"

--_000_HE1PR1001MB13391F01B9DB432BB3B9EF13FBE80HE1PR1001MB1339_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!


This is my first post to this mailing list, so I want to start by apologizi=
ng if I go about it in the wrong way, but the impression I got on http://li=
sts.openembedded.org/mailman/listinfo/openembedded-core was that it's OK to=
 simply email the list. I have searched for answers first, both in the list=
 archives and the internet in general, but no luck. This makes me believe t=
hat it probably is something wrong in our configuration/implementation, but=
 I have no clue of what.


We are using Yocto to build Linux for an NXP imx7 device. Everything works =
OK, so the setup we have (which I believe is based on the imx7dsabresd mach=
ine) at least does that right.


At the moment I am trying to evaluate eSDK, so I have built it, installed i=
t, and used it a little bit, but when I tried to deploy to target, devtool =
failed to find any files to deploy. The files are there, though, but not in=
 the place where devtool is searching; the built binaries all are under tmp=
/work/armv7at2hf-neon-fslc-linux-gnueabi, and devtool tries to find them un=
der tmp/work/armv7ahf-neon-fslc-linux-gnueabi.


So, something seems to be wrong in the setup of hardware target (armv7at2hf=
 vs. armv7ahf)? I cannot figure out what, though, since bitbake uses the sa=
me config files to build our image as well as the eSDK.


By the way, using devtool the same way (deploy-target) on a recipe in our n=
ormal bitbake environment produces the same kind of error. So, come to thin=
k of it, it's probably not a problem with eSDK as such.


Best regards,

H=E5kan Eriksson



Openembedded-core Info Page<http://lists.openembedded.org/mailman/listinfo/=
openembedded-core>
lists.openembedded.org
To see the collection of prior postings to the list, visit the Openembedded=
-core Archives. Using Openembedded-core: To post a message to all the list =
...



--_000_HE1PR1001MB13391F01B9DB432BB3B9EF13FBE80HE1PR1001MB1339_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Consolas,Courier,monospace;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi!</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">This is my first post to this mai=
ling list, so&nbsp;I want to start by apologizing if I go about it in the w=
rong way, but the impression I got on&nbsp;<a href=3D"http://lists.openembe=
dded.org/mailman/listinfo/openembedded-core" class=3D"OWAAutoLink" id=3D"LP=
lnk945271" previewremoved=3D"true">http://lists.openembedded.org/mailman/li=
stinfo/openembedded-core</a>&nbsp;was
 that it's OK to simply email the list. I have searched for answers first, =
both in the list archives and the internet in general, but no luck. This ma=
kes me believe that it probably is something wrong in our configuration/imp=
lementation, but I have no clue
 of what.&nbsp;</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">We are using Yocto to build Linux=
 for an NXP&nbsp;imx7 device. Everything works OK, so the setup we have (wh=
ich I believe&nbsp;is based on the&nbsp;imx7dsabresd machine) at least does=
 that right.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">At the moment I am trying to eval=
uate eSDK, so I have built it, installed it, and used it a little bit, but =
when I tried to deploy to target, devtool failed to find any files to deplo=
y. The files are there, though, but
 not in the place where devtool is searching; the built binaries all are un=
der&nbsp;<span>tmp/work/armv7at2hf-neon-fslc-linux-gnueabi, and devtool tri=
es to find them under&nbsp;<span>tmp/work/armv7ahf-neon-fslc-linux-gnueabi.=
&nbsp;</span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span><br>
</span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span>So, something seems t=
o be wrong in the setup of hardware target (<span style=3D"font-family: Con=
solas, Courier, monospace, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;">armv7at2hf
 vs.&nbsp;<span style=3D"font-family: Consolas, Courier, monospace, EmojiFo=
nt, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmo=
ji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; f=
ont-size: 16px;">armv7ahf)? I cannot figure out what, though, since bitbake=
 uses
 the same config files to build our image as well as the eSDK.&nbsp;</span>=
</span></span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span><br>
</span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span><span style=3D"font-f=
amily: Consolas, Courier, monospace, EmojiFont, &quot;Apple Color Emoji&quo=
t;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;=
, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 16px;"><span style=3D=
"font-family: Consolas, Courier, monospace, EmojiFont, &quot;Apple Color Em=
oji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbo=
l&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font-size: 16px;"></span>=
</span>By
 the way, using devtool the same way (deploy-target) on a recipe in our nor=
mal bitbake environment produces the same kind of error. So, come to think =
of it, it's probably not a problem with eSDK as such.&nbsp;</span></span></=
p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span><br>
</span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span>Best regards,&nbsp;</=
span></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span>H=E5kan Eriksson</spa=
n></span></p>
<p style=3D"margin-top:0;margin-bottom:0"><span><span>&nbsp;</span></span><=
/p>
<div id=3D"LPBorder_GT_15162705160320.8546527615897628" style=3D"margin-bot=
tom: 20px; overflow: auto; width: 100%; text-indent: 0px;">
<table id=3D"LPContainer_15162705160270.2799063584449244" role=3D"presentat=
ion" cellspacing=3D"0" style=3D"width: 90%; background-color: rgb(255, 255,=
 255); position: relative; overflow: auto; padding-top: 20px; padding-botto=
m: 20px; margin-top: 20px; border-top: 1px dotted rgb(200, 200, 200); borde=
r-bottom: 1px dotted rgb(200, 200, 200);">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td id=3D"TextCell_15162705160280.983592839268109" colspan=3D"2" style=3D"v=
ertical-align: top; position: relative; padding: 0px; display: table-cell;"=
>
<div id=3D"LPRemovePreviewContainer_15162705160280.8320406519321948"></div>
<div id=3D"LPTitle_15162705160280.48758109487441303" style=3D"top: 0px; col=
or: rgb(160, 163, 166); font-weight: 400; font-size: 21px; font-family: wf_=
segoe-ui_light, &quot;Segoe UI Light&quot;, &quot;Segoe WP Light&quot;, &qu=
ot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; line-he=
ight: 21px;">
<a id=3D"LPUrlAnchor_15162705160300.663155671633956" href=3D"http://lists.o=
penembedded.org/mailman/listinfo/openembedded-core" target=3D"_blank" style=
=3D"text-decoration: none;">Openembedded-core Info Page</a></div>
<div id=3D"LPMetadata_15162705160300.9494617975043163" style=3D"margin: 10p=
x 0px 16px; color: rgb(102, 102, 102); font-weight: 400; font-family: wf_se=
goe-ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, s=
ans-serif; font-size: 14px; line-height: 14px;">
lists.openembedded.org</div>
<div id=3D"LPDescription_15162705160310.8082276028931232" style=3D"display:=
 block; color: rgb(102, 102, 102); font-weight: 400; font-family: wf_segoe-=
ui_normal, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-=
serif; font-size: 14px; line-height: 20px; max-height: 100px; overflow: hid=
den;">
To see the collection of prior postings to the list, visit the Openembedded=
-core Archives. Using Openembedded-core: To post a message to all the list =
...</div>
</td>
</tr>
</tbody>
</table>
</div>
<br>
</div>
</body>
</html>

--_000_HE1PR1001MB13391F01B9DB432BB3B9EF13FBE80HE1PR1001MB1339_--
