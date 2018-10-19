Return-Path: <Hugues.Kamba@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0055.outbound.protection.outlook.com [104.47.2.55])
	by mail.openembedded.org (Postfix) with ESMTP id 81FCE79CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 13:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nbT6A6y25c8NZY8W62sC3v+ns/+aiw5OIUzRTw1lhWY=;
	b=GV1sA32d3PG4fR5fyOsnj9aCcV7C2sbCHzwwwIGVgBGyAuBXvzR/MtMnn0wUQ9J1sVcCPLzZYs+wbTToQxuQUkujqf0sBw9NM49cNzEbJvuty0MT0mf/Nb8gRdcDU5AKMed5B/nCtmbsqXHpzqHDI6VtwcNHhK1QO/9NVJJ4fKw=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB1022.eurprd08.prod.outlook.com (10.166.144.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1250.20; Fri, 19 Oct 2018 13:13:08 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78]) by
	VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78%5]) with mapi id 15.20.1228.027;
	Fri, 19 Oct 2018 13:13:08 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Thread-Topic: [OE-core] Missing venv module in Python 3
Thread-Index: AQHUZfpUmN96RPBjFkCZKlJz3pSGm6Uko5lwgAAAGGqAAGUugIAAFsCsgAAEZoCAAC3vgIABAcPagAAxQQCAAAhALA==
Date: Fri, 19 Oct 2018 13:13:08 +0000
Message-ID: <VI1PR08MB363176676DDD88BB681BF67498F90@VI1PR08MB3631.eurprd08.prod.outlook.com>
References: <VI1PR08MB3631013765027F3C7E24415098FF0@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<VI1PR08MB3631FF25AFA7A73D6814C71998F80@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<DB5PR08MB08880A125ED651AD16C50FE993F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<CAJTo0Laa3KT0EBf1EprPyPfZS+TYL+PoXdTpY3=iXiVraiZv1w@mail.gmail.com>
	<DB5PR08MB08887D04D53A66B55244688493F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<CAJTo0Lb5ZFfQVoO2oS4fV6Ts1ph3fs4sVg8Ee3-+X8x5Ff0Y1Q@mail.gmail.com>
	<CAHMutrZpoHBvwcgnW=Tg7w3c7FCQDws_fCHrH-mA=3w7jprqkA@mail.gmail.com>
	<VI1PR08MB363145501E7F33C87BECFECE98F90@VI1PR08MB3631.eurprd08.prod.outlook.com>,
	<CAHMutrZtXxhsSdNPkwb5pea1a2RBS1FQhkYMao7P0rPfyPraTA@mail.gmail.com>
In-Reply-To: <CAHMutrZtXxhsSdNPkwb5pea1a2RBS1FQhkYMao7P0rPfyPraTA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB1022;
	6:vifchksLsF91jmD3t3KYFuuIJIjt1Zo6DyY45eZ5iSFUukSzOeVEbgeD35b9wotB2qXCKkw5vsn+koiqJeaCcLLkMk62nXfioI6X1I7Vb+QpdxCR/FLJpn28Yk+UILdsH7VjCZtygackSdxM6PDstVJkfSzDTDKgmozwXLVqK9NI33glv8aoNPrYBv3vw1WzX8fveMyU6MbA88r7AOsu0BZKg/R+gj24RpAeZrAma0I3rY0Ct8jNh3KXudARMVRdziPlLwVRIriP9HIHcqpghnqr3fCwueD6HsEsoLTFnMFXWp2mpzPQoD17XRc11VWUnBbIcINmkrlkUIKD7PDF3MVZ9EiMgPUAeZpeOsEVAryfRmRa3AA2BrXrx1d6W6dVIXAgQrx0wK6cvSM2LIrSxXJSZG4BhDFGgH/1iCKpipixxvN5S6GUKBbnWgMfg+pn2JmAZW+GYtJEhdA4ymq83A==;
	5:EzfBp8xihvk7F/oqQhL7xrRVx1OF/Ohsz0NuwKE9iaUHgf8qUlJ2rf7wwHbLik5IhDg6K05UrdsD3tl03jwRVgWHrOt+AAd3LU4cujXJTOIhx4aEQmaINwgth14ZNBFEbf69EnVMq8UpDP5teSyBePU4zpBjCu/PF5WCqgqidOc=;
	7:zsvMA7CeP/9kztQCLpP1squW3gJo8M8EOUJBjRyfdBWVgy4LAGK/qZJYRngQiflBB63Ycg4+Go2iEeB7j8iKYNtpRuNiiJct4jAOAZoVq40uoIgcdDNCME6tnEBKHUB+fYVi7T+jAAXqJL4+ZmZE1qUZKbi8RJhYSBJjMc7r9Bq4itYoJFJVfTkKZX/IioPdqBPldhgcn/tXUBf7vH9uIkSbOTlN9i7oz1Mz5cqEy+u725hvG9hABuK6sO1+RDHz
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: cc634202-819e-4ace-923d-08d635c49d50
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB1022; 
x-ms-traffictypediagnostic: VI1PR08MB1022:
x-microsoft-antispam-prvs: <VI1PR08MB10224B8E4856C3D2ACBB015298F90@VI1PR08MB1022.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158)(180628864354917)(228905959029699)(166708455590820)(10436049006162)(163750095850);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(3231355)(944501410)(52105095)(6055026)(149066)(150057)(6041310)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB1022; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB1022; 
x-forefront-prvs: 0830866D19
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(366004)(346002)(396003)(376002)(40764003)(189003)(199004)(40434004)(76114002)(71200400001)(71190400001)(25786009)(966005)(66066001)(21615005)(19627405001)(478600001)(72206003)(55016002)(345774005)(26005)(9686003)(6246003)(54896002)(54556002)(6306002)(236005)(14454004)(11346002)(486006)(39060400002)(53936002)(186003)(229853002)(446003)(97736004)(476003)(606006)(7696005)(733005)(6436002)(102836004)(33656002)(14444005)(256004)(5024004)(68736007)(76176011)(86362001)(99286004)(1411001)(3846002)(6116002)(2900100001)(4326008)(93886005)(5660300001)(6916009)(53546011)(6606003)(2906002)(105586002)(74316002)(54906003)(81166006)(8676002)(6506007)(7736002)(316002)(81156014)(8936002)(5250100002)(106356001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB1022;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: xyKY/FrruM9Tn8mekISYRL/qDDwNn/KXsrLWWgm4tp0ZWJRIkagT/m3WneXgSoWZoXGePSRvwarMc+a2MsTd789177BjpfqcVSYmqMrTRw9cQHPQX/baJMoOr0Vq12t8Jxxxl77n6nvgzLrhEMteEH3+UH84LFQKCuiu9rdJx4rWPlq3JG0T/vHc4t/5Wcg8j7RSJwDmSdY6q9yNOVfyhz5qs+jWztrCnM1naa3nZeRWs1dDejVL/SnUDLvhBd7P8qStpfT87M9aj2c58F65VLsr6iHcHFVufp7xnjM5bVl6Juq9u6WOz08397kH7cjmenhhCDDmkuthGlaRYZ/vvXTgwivMAOzdnZCxyRwKAus=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc634202-819e-4ace-923d-08d635c49d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2018 13:13:08.7528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB1022
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Missing venv module in Python 3
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
X-List-Received-Date: Fri, 19 Oct 2018 13:44:54 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB363176676DDD88BB681BF67498F90VI1PR08MB3631eurp_"

--_000_VI1PR08MB363176676DDD88BB681BF67498F90VI1PR08MB3631eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Alejandro,

Thank you for your help.

Unfortunately, the pyvenv package is not in the manifest, I cannot therefor=
e add the path where you are suggesting.

It is not immediately clear to me where the package is created, however, fi=
les are added to the pyvenv package (using FILES_${PN}-pyvenv +=3D ) in the=
 python3_3.5.6.bb recipe. This is why I added the ${libdir}/${PYTHON_MAJMIN=
}/venv file in a bbapend to the python3_3.5.6.bb recipe.

I am able to successfully run the create_manifest3.py script but the genera=
ted manifest content has not changed. I did not expect it to change because=
 pyvenv was not there in the first place.

On a different note; I managed to include the venv module by including the =
python3-misc package to the build. I can create a virtual environment using=
 python -m venv. The issue with that is that python3-misc includes other mo=
dules I do not need and thus needlessly increases size. Another issue is th=
at I have to include python3-runpy (to use the -m option when creating the =
virtual environment).

I also realised that python3-pip is a depencency to venv.

In conclusion, can you think of how dependencies (venv and pip) can be adde=
d to the python3-pyvenv package? This will allow reduction of the image siz=
e by removing python3-misc and python3-runpy.


Hugues
________________________________
From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Sent: 19 October 2018 13:37:14
To: Hugues Kamba
Cc: Burton, Ross; Jonathan Haigh; OE-core; Jeremy Johnson
Subject: Re: [OE-core] Missing venv module in Python 3

Hello Huges,

The path needs to be added to the manifest itself (the json file) under the=
 files section for the pyvenv package not in a bbappend.

And to run the create manifest task you would do:

$ bitbake python3 -c create_manifest

Once I get to my computer I will be able to provide more help.

Alejandro


On Fri, Oct 19, 2018, 10:08 AM Hugues Kamba <Hugues.Kamba@arm.com<mailto:Hu=
gues.Kamba@arm.com>> wrote:

Hi Alejandro,


Thank you for your suggestion.


The following has been added to a python3_%.bbapend:

# Add missing venv module dependency.
FILES_${PN}-pyvenv +=3D "${libdir}/${PYTHON_MAJMIN}/venv"


However, it is not quite obvious how to successfully run the create_manifes=
t3.py script.
Attempts were made to run it with "python3 create_manifest3.py python3.5" b=
ut it complains about an undefined variable (nativelibfolder).
I also tried to run it using "bitbake pyhton -c create_manifest3.py" as spe=
cified in the docstring but execution fails because of missing tasks (no do=
_..).


Could you or others on the mailing list, provide some guidance on how to go=
 about running (arguments, etc..) the create_manifest3.py script.


[cid:bbaed11e-d9b2-456f-bd15-200669ad237e]

Hugues Kamba | Senior Software Engineer
hugues.kamba@arm.com<mailto:sandi.shannon@arm.com>
CPC1, Capital Park, Cambridge Road, Fulbourn, CB21 5XE, UK
Tel: (+44)1223 400400
Visit the new ARM Connected Community<https://urldefense.proofpoint.com/v2/=
url?u=3Dhttp-3A__community.arm.com_welcome&d=3DDwMFAg&c=3DbKNseOHsszsRCtLFf=
d6XtA&r=3Dh1JGsEgvfYBPUFak8b6Fs-oV6irVsuuFc4RBESlsTFE&m=3DN8x4mnijl-wwLmtz3=
tbzVbe9R-QRW9bVZHfjOv3YY0o&s=3DFTtAextvaqUli74ujYjbDxp7jK9aaA6G7NOsVfryuyw&=
e=3D>



________________________________
From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com<mailto:aehs29=
@gmail.com>>
Sent: 18 October 2018 19:18
To: Burton, Ross
Cc: Jonathan Haigh; OE-core; Jeremy Johnson; Hugues Kamba
Subject: Re: [OE-core] Missing venv module in Python 3

Hello folks,

On Thu, Oct 18, 2018, 3:34 PM Burton, Ross <ross.burton@intel.com<mailto:ro=
ss.burton@intel.com>> wrote:
On Thu, 18 Oct 2018 at 16:19, Jonathan Haigh <Jonathan.Haigh@arm.com<mailto=
:Jonathan.Haigh@arm.com>> wrote:
> The venv package (https://docs.python.org/3/library/venv.html) itself is =
missing although its source is available within Python 3.5 (https://www.pyt=
hon.org/ftp/python/3.5.6/Python-3.5.6.tgz). As mentioned earlier, it seems =
the issue is because there is no entry in the manifest from which the vario=
us Python 3 modules are created (https://github.com/openembedded/openembedd=
ed-core/blob/master/meta/recipes-devtools/python/python3/python3-manifest.j=
son).
>
> The manifest is generated from https://github.com/openembedded/openembedd=
ed-core/blob/master/meta/recipes-devtools/python/python3/create_manifest3.p=
y, and it does not seem obvious to me how to go about correctly adding a ne=
w module to the manifest, using create_manifest3.py or otherwise.

The script itself should get the venv dependency automatically (my guess is=
 that this isn't getting detected by the script because the module itself i=
ts coming from a directory) but I'd have to debug what is exactly happening=
, although I don't have access to my computer at the moment.

An easy fix (for now) is to add the

/usr/lib/python3.5/venv/

Path to the manifest on the FILES for the pyenv module.

After that running the create_manifest task should get its dependencies cor=
rectly and update the manifest so it can be pushed to the repo.

Cheers,

Alejandro



Ah, right.

In that case:

$ oe-pkgdata-util find-path */*venv*py
python3-tests: /usr/lib/python3.5/test/test_venv.py
python3-misc: /usr/lib/python3.5/venv/__main__.py
python3-misc: /usr/lib/python3.5/venv/__init__.py

The files are in the python3-misc package, which is the fallback for
everything which isn't explicitly put into another package.  I'd say
the best fix for this would be to edit the manifest so the venv module
goes into the python3-pyvenv package too.

Ross
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_VI1PR08MB363176676DDD88BB681BF67498F90VI1PR08MB3631eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
Hello Alejandro,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
Thank you for your help.<br>
<br>
Unfortunately, the pyvenv package is not in the&nbsp;manifest, I cannot the=
refore add the path where you are suggesting.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
It is not immediately clear to me&nbsp;where the package is created, howeve=
r, files are added to the pyvenv package (using&nbsp;FILES_${PN}-pyvenv &#4=
3;=3D&nbsp;) in the&nbsp;python3_3.5.6.bb recipe.&nbsp;This is why I added =
the ${libdir}/${PYTHON_MAJMIN}/venv file&nbsp;in a bbapend to the
<span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px=
;">python3_3.5.6.bb</span> recipe.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
I am&nbsp;able to successfully&nbsp;run the create_manifest3.py script but =
the generated manifest content has not changed. I did not expect it to chan=
ge because pyvenv was not there in the first place.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
On a different note; I managed to include the venv module by including the&=
nbsp;python3-misc package to the build. I can create a virtual environment =
using python -m venv. The issue with that is that python3-misc includes oth=
er modules I do not need and thus needlessly
 increases size. Another issue is that I have to include python3-runpy (to =
use the -m option when creating the virtual environment).</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
I also realised that python3-pip is a depencency to venv.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
In conclusion, can you think of how&nbsp;dependencies (venv and pip)&nbsp;c=
an be added to the&nbsp;python3-pyvenv package? This will allow reduction o=
f the image size by removing python3-misc and python3-runpy.<br>
<br>
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 16px;=
 margin-top: 0px; margin-bottom: 0px;">
Hugues</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alejandro Enedino Her=
nandez Samaniego &lt;aehs29@gmail.com&gt;<br>
<b>Sent:</b> 19 October 2018 13:37:14<br>
<b>To:</b> Hugues Kamba<br>
<b>Cc:</b> Burton, Ross; Jonathan Haigh; OE-core; Jeremy Johnson<br>
<b>Subject:</b> Re: [OE-core] Missing venv module in Python 3</font>
<div>&nbsp;</div>
</div>
<meta content=3D"text/html; charset=3Dutf-8">
<div>
<div dir=3D"auto">
<div>Hello Huges,
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">The path needs to be added to the manifest itself (the js=
on file) under the files section for the pyvenv package not in a bbappend.<=
/div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">And to run the create manifest task you would do:</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">$ bitbake python3 -c create_manifest</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Once I get to my computer I will be able to provide more =
help.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Alejandro</div>
<br>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr">On Fri, Oct 19, 2018, 10:08 AM Hugues Kamba &lt;<a href=3D=
"mailto:Hugues.Kamba@arm.com">Hugues.Kamba@arm.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0 0 0 .8ex; border-left=
:1px #ccc solid; padding-left:1ex">
<div dir=3D"ltr">
<div id=3D"x_m_-4307242440526293090divtagdefaultwrapper" dir=3D"ltr" style=
=3D"font-size:12pt; color:rgb(0,0,0); font-family:Calibri,Helvetica,sans-se=
rif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,Noto=
ColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbo=
ls">
<p style=3D"margin-top:0; margin-bottom:0">Hi Alejandro,</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Thank you for your suggestion.</=
p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">The following has been added to =
a&nbsp;python3_%.bbapend:</p>
<p style=3D"margin-top:0; margin-bottom:0"></p>
<div><i><span style=3D"font-size:10pt"># Add missing venv module dependency=
.</span><br>
<span style=3D"font-size:10pt">FILES_${PN}-pyvenv &#43;=3D &quot;${libdir}/=
${PYTHON_MAJMIN}/venv&quot;</span></i></div>
<br>
<p></p>
<p style=3D"margin-top:0; margin-bottom:0">However, it is not quite obvious=
 how to successfully run the
<i><span style=3D"font-size:10pt">create_manifest3.py</span></i> script.<br=
>
Attempts were made to run it with &quot;<span style=3D"font-size:10pt">pyth=
on3 create_manifest3.py python3.5&quot;</span> but it complains about an un=
defined variable (<i><span style=3D"font-size:10pt">nativelibfolder</span><=
/i>).<br>
I also tried to run it using &quot;<i><span style=3D"font-size:10pt">bitbak=
e pyhton -c create_manifest3.py</span>&quot;</i> as specified in the docstr=
ing but execution fails because of&nbsp;missing tasks (no do_..).</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Could you or others on the maili=
ng list, provide some guidance on how to go about running (arguments, etc..=
) the
<i><span style=3D"font-size:10pt">create_manifest3.py</span></i> script.&nb=
sp;</p>
<div id=3D"x_m_-4307242440526293090Signature">
<div id=3D"x_m_-4307242440526293090divtagdefaultwrapper" dir=3D"ltr" style=
=3D"font-size:12pt; color:rgb(0,0,0); font-family:Calibri,Helvetica,sans-se=
rif,EmojiFont,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,Noto=
ColorEmoji,&quot;Segoe UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbo=
ls">
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<table align=3D"left" border=3D"0" cellspacing=3D"0" cellpadding=3D"0" styl=
e=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&quo=
t;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-size:=
15px; border-collapse:collapse; margin-right:6.75pt; margin-left:6.75pt">
<tbody>
<tr>
<td width=3D"147" style=3D"width:88.25pt; padding:0px 5.4pt; border-style:n=
one solid none none; border-right-width:1pt; border-right-color:windowtext"=
>
<div style=3D"margin:0px"><img class=3D"x_m_-4307242440526293090EmojiInsert=
" data-outlook-trace=3D"F:0|T:1" src=3D"cid:bbaed11e-d9b2-456f-bd15-200669a=
d237e"><br>
</div>
</td>
<td width=3D"419" style=3D"width:251.95pt; vertical-align:top; padding:0px =
5.4pt">
<div style=3D"margin:0px"><font face=3D"Calibri,sans-serif" size=3D"2"><spa=
n style=3D"font-size:11pt"><font size=3D"2" color=3D"black"><span lang=3D"i=
t" style=3D"font-size:10pt"><b>Hugues Kamba&nbsp;</b></span></font><font si=
ze=3D"2" color=3D"black"><span lang=3D"it" style=3D"font-size:10pt">|
 Senior Software Engineer</span></font></span></font></div>
<div style=3D"margin:0px"><font face=3D"Calibri,sans-serif" size=3D"2"><spa=
n style=3D"font-size:11pt"><a href=3D"mailto:sandi.shannon@arm.com" rel=3D"=
noopener noreferrer noreferrer" id=3D"x_m_-4307242440526293090LPNoLP" title=
=3D"mailto:sandi.shannon@arm.com
Ctrl&#43;Click or tap to follow the link" target=3D"_blank"><font color=3D"=
#0563C1"><span lang=3D"it">hugues.kamba</span></font><font size=3D"2" color=
=3D"#0563C1"><span lang=3D"it" style=3D"font-size:10pt">@arm.com</span></fo=
nt></a></span></font></div>
<div style=3D"margin:0px"><font face=3D"Calibri,sans-serif" size=3D"2"><spa=
n style=3D"font-size:11pt"><font size=3D"2" color=3D"black"><span style=3D"=
font-size:10pt"><span style=3D"color:rgb(68,84,106); font-family:Calibri,sa=
ns-serif; font-size:12px">CPC1, Capital Park, Cambridge&nbsp;Road,&nbsp;Ful=
bourn,&nbsp;CB21
 5XE, UK</span></span></font></span></font></div>
<span style=3D"color:rgb(33,33,33); font-family:Calibri,sans-serif; font-si=
ze:12px">Tel: (&#43;44)1223 400400</span>
<div style=3D"margin:0px"><font face=3D"Calibri,sans-serif" size=3D"2"><spa=
n style=3D"font-size:11pt"><a href=3D"https://urldefense.proofpoint.com/v2/=
url?u=3Dhttp-3A__community.arm.com_welcome&amp;d=3DDwMFAg&amp;c=3DbKNseOHss=
zsRCtLFfd6XtA&amp;r=3Dh1JGsEgvfYBPUFak8b6Fs-oV6irVsuuFc4RBESlsTFE&amp;m=3DN=
8x4mnijl-wwLmtz3tbzVbe9R-QRW9bVZHfjOv3YY0o&amp;s=3DFTtAextvaqUli74ujYjbDxp7=
jK9aaA6G7NOsVfryuyw&amp;e=3D" rel=3D"noopener noreferrer noreferrer" id=3D"=
x_m_-4307242440526293090LPNoLP" target=3D"_blank"><font size=3D"2"><span st=
yle=3D"font-size:10pt"><font color=3D"blue">Visit
 the new ARM Connected Community</font></span></font></a></span></font></di=
v>
</td>
</tr>
</tbody>
</table>
<p></p>
</div>
</div>
<br>
<br>
<div style=3D"color:rgb(0,0,0)">
<hr style=3D"display:inline-block; width:98%">
<div id=3D"x_m_-4307242440526293090divRplyFwdMsg" dir=3D"ltr"><font face=3D=
"Calibri, sans-serif" color=3D"#000000" style=3D"font-size:11pt"><b>From:</=
b> Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailto:aehs29@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">aehs29@gmail.com</a>&gt;<br>
<b>Sent:</b> 18 October 2018 19:18<br>
<b>To:</b> Burton, Ross<br>
<b>Cc:</b> Jonathan Haigh; OE-core; Jeremy Johnson; Hugues Kamba<br>
<b>Subject:</b> Re: [OE-core] Missing venv module in Python 3</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"auto">
<div>Hello folks,<br>
<br>
<div class=3D"x_m_-4307242440526293090x_gmail_quote">
<div dir=3D"ltr">On Thu, Oct 18, 2018, 3:34 PM Burton, Ross &lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank" rel=3D"noreferrer">ross.bur=
ton@intel.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_m_-4307242440526293090x_gmail_quote" style=3D"margin=
:0 0 0 .8ex; border-left:1px #ccc solid; padding-left:1ex">
On Thu, 18 Oct 2018 at 16:19, Jonathan Haigh &lt;<a href=3D"mailto:Jonathan=
.Haigh@arm.com" rel=3D"noreferrer noreferrer" target=3D"_blank">Jonathan.Ha=
igh@arm.com</a>&gt; wrote:<br>
&gt; The venv package (<a href=3D"https://docs.python.org/3/library/venv.ht=
ml" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://docs=
.python.org/3/library/venv.html</a>) itself is missing although its source =
is available within Python 3.5 (<a href=3D"https://www.python.org/ftp/pytho=
n/3.5.6/Python-3.5.6.tgz" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">https://www.python.org/ftp/python/3.5.6/Python-3.5.6.tgz</a>).
 As mentioned earlier, it seems the issue is because there is no entry in t=
he manifest from which the various Python 3 modules are created (<a href=3D=
"https://github.com/openembedded/openembedded-core/blob/master/meta/recipes=
-devtools/python/python3/python3-manifest.json" rel=3D"noreferrer noreferre=
r noreferrer" target=3D"_blank">https://github.com/openembedded/openembedde=
d-core/blob/master/meta/recipes-devtools/python/python3/python3-manifest.js=
on</a>).<br>
&gt;<br>
&gt; The manifest is generated from <a href=3D"https://github.com/openembed=
ded/openembedded-core/blob/master/meta/recipes-devtools/python/python3/crea=
te_manifest3.py" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank"=
>
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-=
devtools/python/python3/create_manifest3.py</a>, and it does not seem obvio=
us to me how to go about correctly adding a new module to the manifest, usi=
ng create_manifest3.py or otherwise.<br>
</blockquote>
</div>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">The script itself should get the venv dependency automati=
cally (my guess is that this isn't getting detected by the script because t=
he module itself its coming from a directory) but I'd have to debug what is=
 exactly happening, although I don't
 have access to my computer at the moment.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">An easy fix (for now) is to add the</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif">/usr/lib/python3.5=
/venv/</span><br>
</div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif"><br>
</span></div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif">Path to the manife=
st on the FILES for the pyenv module.</span></div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif"><br>
</span></div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif">After that running=
 the create_manifest task should get its dependencies correctly and update =
the manifest so it can be pushed to the repo.</span></div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif"><br>
</span></div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif">Cheers,</span></di=
v>
<div dir=3D"auto"><span style=3D"font-family:sans-serif"><br>
</span></div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif">Alejandro</span></=
div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif"><br>
</span></div>
<div dir=3D"auto"><span style=3D"font-family:sans-serif"><br>
</span></div>
<div dir=3D"auto">
<div class=3D"x_m_-4307242440526293090x_gmail_quote">
<blockquote class=3D"x_m_-4307242440526293090x_gmail_quote" style=3D"margin=
:0 0 0 .8ex; border-left:1px #ccc solid; padding-left:1ex">
<br>
Ah, right.<br>
<br>
In that case:<br>
<br>
$ oe-pkgdata-util find-path */*venv*py<br>
python3-tests: /usr/lib/python3.5/test/test_venv.py<br>
python3-misc: /usr/lib/python3.5/venv/__main__.py<br>
python3-misc: /usr/lib/python3.5/venv/__init__.py<br>
<br>
The files are in the python3-misc package, which is the fallback for<br>
everything which isn't explicitly put into another package.&nbsp; I'd say<b=
r>
the best fix for this would be to edit the manifest so the venv module<br>
goes into the python3-pyvenv package too.<br>
<br>
Ross<br>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you. </div>
</blockquote>
</div>
</div>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_VI1PR08MB363176676DDD88BB681BF67498F90VI1PR08MB3631eurp_--
