Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.88])
 by mx.groups.io with SMTP id smtpd.web12.603.1626455083549343858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 10:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=mc/MR40K;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.94.88, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGrMIA9YMNcpOQjG+gHjFDy9DxfI07txDsYYpiYUM82T6geq5baUeHUgmxxMqO8V2fiEwTS+QIibNEgJvngHYdwh9nKvrAdTMP/geD7LOaKaS1Ni/29H7R+PbQvWQwTiLvJuqW4gwE2ieYF/tRk0E4nFhm9iMiDh7vX1qSt2osrEyHdjfqa/txyKfoafQm5zxuH/SOmvQ7FGYVxoNmsu1iFDOOdutW8U34CCx4RDNHmhY/U6Z/ez7uoEvHCh2dCwU2ehCA550qPTag+CHKvgizTnqRl10RQd40XWEEbrOP9I32ZcAvf6J7Sx/lMVRvTP2bhClbZsnlZo4ov2kF4uAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zfOdXTZa6/nxica9Dpfj5DVZN/5gcr610rPr1XUlDQ=;
 b=U98geAH3ybGZLY1763fxvDpxWOTkwzYIWbfyAwOSJ2I7oCULlFjCxJmCvayPyqrctscHLdBl4JEjWoTcCJccJYT+z1HL0kDmehXLWV+ly6amId2A+r69CNEcaslv9YlOuJsgOIdCnJ+QqlyT+jiG49H1i+O0eXtVjzyxXrWBOVwUONVOi7mw0vjL+XtpI40hFxcif4Uhz4vzF4VJMyKuv3i8iItR+BqqdnLd56LMDdx7ItmIfr5XkyrroXCMaIOZBpawE9fsRR4X7JGBtJHVpMzUdDavfWuV0XGtHXe0fA1d5gc24qVa/scSFkMZPuj4xS0n2/DAvUpO573SK+Mz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zfOdXTZa6/nxica9Dpfj5DVZN/5gcr610rPr1XUlDQ=;
 b=mc/MR40K6r4NtSYfCPcrAVIhmoe9d7yw4MMUXyo9xl/spe+bqZE/7LYMeLZVs4eMawzULEUr1a0J1zlC666CLJcX8NpPrtoQDa4Ir+zXCSS+A/14ENDnAKNcXiALeJ6a4qhiElUHYj04DXm1fstb9ZbGB9VBaw0s7BVUf51LnFZcQiUkJk4xR018PqVUWEXXyamV3tO6S2Ny3yjFgAp6uV8YVWx3Mnc8JTVtqNYmk6+iL+kgmtFkBkgfAAKkzbUqpt8QWUnFPBd9KjyVzrvZ32gaB7PQRML7uWWXnhod5GZizRH3396W0cH+rzVahiRwtv0WKGURSEnTKZzlFxGjEQ==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 DM8PR12MB5493.namprd12.prod.outlook.com (2603:10b6:8:3d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23; Fri, 16 Jul 2021 17:04:41 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::f56e:ab9a:e664:b58]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::f56e:ab9a:e664:b58%6]) with mapi id 15.20.4331.028; Fri, 16 Jul 2021
 17:04:41 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Status of 'devtool modify virtual/kernel' when using a separate SRC_URI for kernel metadata?
Thread-Topic: Status of 'devtool modify virtual/kernel' when using a separate
 SRC_URI for kernel metadata?
Thread-Index: Add6Y6OEYqUvImJiTw6AwH3zVPL8BQ==
Date: Fri, 16 Jul 2021 17:04:41 +0000
Message-ID: 
 <DM8PR12MB543078AE011C6357A5665EC58B119@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 006f3243-2723-44f7-c0af-08d9487bcd93
x-ms-traffictypediagnostic: DM8PR12MB5493:
x-microsoft-antispam-prvs: 
 <DM8PR12MB54936D6877F3045CFC7B25378B119@DM8PR12MB5493.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1OszRlnwbdY8BtNYdhQnJGi64nkOUflLwOA/O93EgDzmNRbA65mGblOnX7kRctH/0wVKo9KVd3WcxSGonY8YHyEIuq84A7cvOqmpld3VjRWHKHQDnM69EhAB/viBDq5/5C8DM8q0xnxCI/FGXzzjctRBKfoN6Ymyfqj25Cdi7949ZRsgCIhZ8Ep7crarcayT4i0ABCpz+3kJj9UrwdzQTDRy/XEuYmmEiC+PwFrZQkesWXGdGDZSfc0R7I+GGoQ0ylJunNcjwzJ70V2Rv4P3tEy5g7BG9boDM+/2HNOWvK5W6qcDW7+wcem+Xvdw6qvWcMjltCkG3NL1STzzJpd286XisnhTaVB79hlw+ZsCV6LAVenC3sA42f/yGJNU3JGVVYOVW15V6zcgfBH9t1yv+aEFO4CDlyeEy8plC1nSa5g/jVqM6786ObT0SuzpmsAaf0tnD0wu8nf6TruFHgFWVZci9aFJv6EK12kNySB4FIhTwq/wQxe02ibdo3L5Shy0h3VuY5zp+ctR/W8zclZX8iPGFeXDL/zeuOAoZ1OhPR6q77kucjetYFN5ds34Up0qYKCAS58I8350QFhXYgGRW2wW3caX9WJgBEMhee25T4VgZX3bhSP1slDM2oMC+H7AyDH4aJcL3XAqntAyNo+4IzAtcLcXo+af1mCBLy0t5vkHrYNKA16nbqLkTfj53tct5ZI7EVOAf2AbER9otPSqVWGMs+Pny7l/h5ASW6NDHK0apsmQ++Cx5XYX44sm95dy
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(29502001)(316002)(66946007)(66446008)(66476007)(86362001)(71200400001)(76116006)(64756008)(66556008)(9686003)(52536014)(5660300002)(26005)(6916009)(186003)(55016002)(4744005)(33656002)(2906002)(478600001)(8936002)(122000001)(8676002)(6506007)(7696005)(38100700002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?xwiZfHYQzPfUWS0H28w6fin0IJqeCNAFC7Gai6fTgo2O6WJVL5GxoYhfYysz?=
 =?us-ascii?Q?ZuswBGjbl/6aN7v/XlKqeo6JDaz/FcpmhlPeGci4q7nTZT31NlgSjnnh4cfw?=
 =?us-ascii?Q?ncRpLtl/Z+mHJzH1Jbvv1lR73abTLVd0QKnSWB4p7d+D2D1Lzs/kknYswnMN?=
 =?us-ascii?Q?8H9MJId/gpQfAoVA06PsB3rBz4gUbyj7J3lVG/lLmMoLHBojaeSdCesvb/rj?=
 =?us-ascii?Q?l64oIXVBhr4gaoo7mTiYFak2TeDuT41Ahsl9GPCokY1POxin08fL7Ciz/pS+?=
 =?us-ascii?Q?sfhe7pJyKe80BjMiJuCMyeadGyifasYqlIr1EiyDJIeB47QdbLmFsd4mf6+y?=
 =?us-ascii?Q?K9tGj/kRMJK13hOho42Uci8qmmObaqACaH1wqAAI0BUll6YriuU11Nw7kOUb?=
 =?us-ascii?Q?02+EPJU61pZ5tMIbfqLzMidyfPJ3s/Eg6Cf/XjUu2GRsMG2gDmmTD9nHMEUR?=
 =?us-ascii?Q?cMv3qh6qo5dEYSgvh+Jy9mw2vIMMfJAJQd0PFnL+DPSVV+2N8ucsoExoC1tH?=
 =?us-ascii?Q?a+1LxVD+GIhQh+4PWBXERpSBihJDRUE9Fo0W1ckZy52Ozq+hO9SCXqmCQdCi?=
 =?us-ascii?Q?MYrPNDTDwl/3E+35aII1Dj6jQ8EZCS3X4sXtyMumwVuMsFXtLznzPFtC6KC7?=
 =?us-ascii?Q?FAxAEkrs72abSvASWuhM/ru8DMz6jgs5Evki1lWTUJv8XhOqaIjfhQLQWNtS?=
 =?us-ascii?Q?gCjfRS8wro9zCZDynqjVhlIEjJExaRjXkKmPnoAhLauls8FZtdLdKmkUubRU?=
 =?us-ascii?Q?qy8+GWm/W+117x9Lm+egD0hQXHjmM2ykXAHu7X6xfXtbsAHrqlOYYsuN5/Ek?=
 =?us-ascii?Q?BmIOkFukdcw8SpTJwJzejepe3k8d6FMLBm6GPENg1w0JGRcctM2ElkzRPD8X?=
 =?us-ascii?Q?lMibxdXmQB8ulg2KL3UNqEfT4k7JFyAnmxjcMHw1vz++0YQ6xjYhUc4zEwU1?=
 =?us-ascii?Q?EORS9EfJ023UHbEfoavWa9qG7SRPo7pga/CpKwJk0ybMyKR/HNKA/Jy/MSjZ?=
 =?us-ascii?Q?8W33JZCppv2fiDUg/Y75+GnnTXJBdsdraljUFjT0hT5S9P4YDJUYgp0oMQX+?=
 =?us-ascii?Q?YtAjtAFoNe7e98PvqO9jN3J1uFI8NYKeYZiqCi5Ab1WQq7XvTDshzy6w3agk?=
 =?us-ascii?Q?Nmf/ChYodcuATND9XC3b4lbxUf0PVUYgH7WCkGqIkaSofbqf77qdmEDf0WtO?=
 =?us-ascii?Q?1p2Td/Xfw8DMKmWfgMmPtXPgs54XCDAA8VRZR1qeF19MhHp24JAS68wg5PKI?=
 =?us-ascii?Q?g91RZM9xRAEqII6sQf47ga+Vn+xiXtU03Z7/7x3SYTTFFhKEVHh8rSh3VGdQ?=
 =?us-ascii?Q?G3OAWycUSB/Jl/wZThy/chVU?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 006f3243-2723-44f7-c0af-08d9487bcd93
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 17:04:41.5561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zk0Bj17vVi2kYgiUAvldK7Z8SeKLMXShiojxIklxf0+5khk+1Ua03ojI8GY8uIhkVyllprWWE+fa+7k8uBwg7IplNQ15zY6dG2CvsnftYS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5493
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM8PR12MB543078AE011C6357A5665EC58B119DM8PR12MB5430namp_"

--_000_DM8PR12MB543078AE011C6357A5665EC58B119DM8PR12MB5430namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,

Can someone please clarify expected behavior of 'devtool modify virtual/ker=
nel' when the kernel recipe has an additional SRC_URI entry for the kernel-=
metadata repository? For example, the 2021.1 linux-xlnx recipe in the meta-=
xilinx-bsp layer (part of meta-xilkinx) uses the following:

KERNELURI ?=3D "git://github.com/Xilinx/linux-xlnx.git;protocol=3Dhttps;nam=
e=3Dmachine"
YOCTO_META ?=3D "git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta=
;name=3Dmeta;branch=3Dyocto-5.10;destsuffix=3Dyocto-kmeta"
SRC_URI =3D "${KERNELURI};${SRCBRANCHARG} ${YOCTO_META}"

I am using Hardknott. When I devtool modify this recipe, I get 'linux-xlnx'=
 unpacked as expected to workspace/sources. But I don't see yocto-kmeta unp=
acked anywhere (except under tmp during the build, of course). Is this the =
expected behavior?

Thanks,
Chris

--_000_DM8PR12MB543078AE011C6357A5665EC58B119DM8PR12MB5430namp_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can someone please clarify expected behavior of &#82=
16;devtool modify virtual/kernel&#8217; when the kernel recipe has an addit=
ional SRC_URI entry for the kernel-metadata repository? For example, the 20=
21.1 linux-xlnx recipe in the meta-xilinx-bsp
 layer (part of meta-xilkinx) uses the following:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">KERNELURI ?=3D &quot;git://github.com/Xilinx/linux-x=
lnx.git;protocol=3Dhttps;name=3Dmachine&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">YOCTO_META ?=3D &quot;git://git.yoctoproject.org/yoc=
to-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.10;destsuffix=3Dy=
octo-kmeta&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">SRC_URI =3D &quot;${KERNELURI};${SRCBRANCHARG} ${YOC=
TO_META}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am using Hardknott. When I devtool modify this rec=
ipe, I get &#8216;linux-xlnx&#8217; unpacked as expected to workspace/sourc=
es. But I don&#8217;t see yocto-kmeta unpacked anywhere (except under tmp d=
uring the build, of course). Is this the expected behavior?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM8PR12MB543078AE011C6357A5665EC58B119DM8PR12MB5430namp_--
