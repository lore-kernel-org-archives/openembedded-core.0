Return-Path: <Rob.Walton@arm.com>
X-Greylist: delayed 43067 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 04 May 2019 19:50:22 UTC
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60044.outbound.protection.outlook.com [40.107.6.44])
	by mail.openembedded.org (Postfix) with ESMTP id B2D697D66F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=K0tVUY01bGLbt4p9DWrAM5tJYezz1xQQHI26TYiKt6M=;
	b=C5OH0pRWw5xAz7QBt5QfQrLoUyMfOkMN1WW0DMpHSwQOIrMa/bmri/VeGI4OZ3kTblUYeF6ON1X9V/VCQDUSECjxfhuD3Lavr3FLog6B7jG1xMVVBaAC97jJlVC0lf9sNGlt9G9WO4jWIevpwsOHqlce9P07oCH2ywcklTNnmgc=
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com (20.177.199.158) by
	AM6PR08MB3654.eurprd08.prod.outlook.com (20.177.115.78) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1856.11; Fri, 3 May 2019 11:14:16 +0000
Received: from AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::9df9:a533:7eaa:188f]) by
	AM6PR08MB3685.eurprd08.prod.outlook.com
	([fe80::9df9:a533:7eaa:188f%5]) with mapi id 15.20.1856.012;
	Fri, 3 May 2019 11:14:16 +0000
From: Rob Walton <Rob.Walton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: automated license reporting
Thread-Index: AQHVAaD0ixCY1bC87EWXVYzMXy16hw==
Date: Fri, 3 May 2019 11:14:16 +0000
Message-ID: <AM6PR08MB3685C976E13C7FEE91C8529C95350@AM6PR08MB3685.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rob.Walton@arm.com; 
x-originating-ip: [217.140.106.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95022af8-0ca1-46c9-6b42-08d6cfb87b23
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:AM6PR08MB3654; 
x-ms-traffictypediagnostic: AM6PR08MB3654:
x-microsoft-antispam-prvs: <AM6PR08MB3654063430CCA6772FC01C3E95350@AM6PR08MB3654.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(136003)(366004)(396003)(376002)(40434004)(199004)(189003)(19627405001)(26005)(68736007)(316002)(91956017)(66556008)(3846002)(25786009)(186003)(66476007)(33656002)(76116006)(73956011)(66946007)(476003)(6606003)(74316002)(66066001)(486006)(3480700005)(6436002)(53936002)(71190400001)(71200400001)(2351001)(6116002)(508600001)(2906002)(86362001)(54896002)(102836004)(52536014)(99286004)(7116003)(14454004)(55016002)(9686003)(5640700003)(5660300002)(7696005)(6506007)(14444005)(64756008)(66446008)(81166006)(81156014)(7736002)(5024004)(6916009)(2501003)(8936002)(72206003)(256004)(8676002)(133083001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3654;
	H:AM6PR08MB3685.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TNGeysyx8yOHHN4Pl7MYIimkV+erGW9VPftThggtW9W9AUGD1Uz+jTABXD+X8aHuDNB5kpBROQw8kBEcvsOrjkbnX1v0EtOqA58scdJbgBy2Y0bymtbUfvj6kkAKPJ+hIe2HKOUEYqgOpN+cRRL38v6oebOo/Ty4TG9ghltsrenowbLa0Lsf8tikMsVUO3MrwxDCFZk5eN9gjdJKtm/PzVPqw+pgS7qudREUkG4z0cKgNWD1/XKGEU39nBgy87HXUzCD/dn87pTF7mPg6ySmeuBPifae3T1L/eeisrXZBXWIteqkDXr2N1nvDsHdesxjP0v+NnWY4YPLubIZmZdo6x72Yq2ggjlK34IuMLKZvKRowrlVqivcyOMoTXN5gPfRa88gzpndqX2OJB2oyhsqPokznnPhzRo7uXRhwX91cxs=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95022af8-0ca1-46c9-6b42-08d6cfb87b23
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 11:14:16.4433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3654
Subject: automated license reporting
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
X-List-Received-Date: Sat, 04 May 2019 19:50:23 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM6PR08MB3685C976E13C7FEE91C8529C95350AM6PR08MB3685eurp_"

--_000_AM6PR08MB3685C976E13C7FEE91C8529C95350AM6PR08MB3685eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


We're working with OpenEmbedded/yocto in a project; we're trying to create =
an HTML license report for our users, leveraging the license.manifest files=
 output from license_image.bbclass.


However some relatively crucial information relevant to the report isn't pr=
ovided in the manifests. The extra information I'm interested in is the con=
tents of the HOMEPAGE and SUMMARY variables for each package/blob recorded =
by the manifest.


I'm proposing to submit a patch to add the following to `write_license_file=
s`:


-                license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LICEN=
SE"])
-
+                license_file.write("LICENSE: %s\n" % pkg_dic[pkg]["LICENSE=
"])
+                license_file.write("SUMMARY: %s\n" % pkg_dic[pkg].get("SUM=
MARY", ""))
+                license_file.write("HOMEPAGE: %s\n\n" % pkg_dic[pkg].get("=
HOMEPAGE", ""))

At the moment it isn't a problem for us if this extra information is missin=
g for /some/ packages, as long as it is included at least once per recipe (=
which is the case).


The above patch would rely on another patch to add extra output in package.=
bbclass::emit_pkg_data


+        write_if_exists(sf, pkg, 'HOMEPAGE')

We also have a bbclass to convert the license.manifest(s) to JSON format fo=
r easier machine readability, so we can automate this process in our build =
system. This bbclass is also potentially upstreamable.


My questions are: Would members of the community object to these patches? A=
re there any other suggestions for grabbing this extra info without submitt=
ing the patches? Would anyone else in the community find this useful?


Thanks,


Rob

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_AM6PR08MB3685C976E13C7FEE91C8529C95350AM6PR08MB3685eurp_
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
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi,</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">We're working with OpenEmbedded/y=
octo in a project; we're trying to create an HTML license report for our us=
ers, leveraging the license.manifest files output from license_image.bbclas=
s.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">However some relatively crucial i=
nformation relevant to the report isn't provided in the manifests. The extr=
a information I'm interested in is the contents of the HOMEPAGE and SUMMARY=
 variables for each package/blob recorded
 by the manifest. <br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">I'm proposing to submit a patch t=
o add the following to `write_license_files`:</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div>-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; license_file.write(&quot;LICENSE: %s\n\n&quot; % pkg_=
dic[pkg][&quot;LICENSE&quot;])<br>
-<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; license_file.write(&quot;LICENSE: %s\n&quot; % pkg_dic=
[pkg][&quot;LICENSE&quot;])<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; license_file.write(&quot;SUMMARY: %s\n&quot; % pkg_dic=
[pkg].get(&quot;SUMMARY&quot;, &quot;&quot;))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; license_file.write(&quot;HOMEPAGE: %s\n\n&quot; % pkg_=
dic[pkg].get(&quot;HOMEPAGE&quot;, &quot;&quot;))<br>
<br>
</div>
At the moment it isn't a problem for us if this extra information is missin=
g for /some/ packages, as long as it is included at least once per recipe (=
which is the case).<br>
<p></p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">The above patch would rely on ano=
ther patch to add extra output in package.bbclass::emit_pkg_data</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div>&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; write_if_exists(sf, pk=
g, 'HOMEPAGE')<br>
</div>
<div><br>
</div>
<div>We also have a bbclass to convert the license.manifest(s) to JSON form=
at for easier machine readability, so we can automate this process in our b=
uild system. This bbclass is also potentially upstreamable.</div>
<div><br>
</div>
<p></p>
<p style=3D"margin-top:0;margin-bottom:0">My questions are: Would members o=
f the community object to these patches? Are there any other suggestions fo=
r grabbing this extra info without submitting the patches? Would anyone els=
e in the community find this useful?</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Thanks,</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Rob<br>
</p>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_AM6PR08MB3685C976E13C7FEE91C8529C95350AM6PR08MB3685eurp_--
