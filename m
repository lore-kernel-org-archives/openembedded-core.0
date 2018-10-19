Return-Path: <Hugues.Kamba@arm.com>
X-Greylist: delayed 172170 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Oct 2018 14:43:22 UTC
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40086.outbound.protection.outlook.com [40.107.4.86])
	by mail.openembedded.org (Postfix) with ESMTP id 116AF79CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qydTrKGlAcv2aqfNDITKOLXFMaxaHVIbKh+6W9Tk/38=;
	b=VC+SDxH10gkztAbwm+fqbR+da1Q4MZE+kuOZ06rGXtMYewCIJxKIdI4zjxJqsbEFey0J0HiADC5gIIze9B/V9fqxkz2LTjcqfqnHpnLR0SwxnmcHC9NTObnJJIJ86iEm0qXAMHBBAmeKPY+CCuUqDPEBssgVvctHnTLrSVJ2jDo=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB3424.eurprd08.prod.outlook.com (20.177.59.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1228.26; Fri, 19 Oct 2018 10:08:52 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78]) by
	VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78%5]) with mapi id 15.20.1228.027;
	Fri, 19 Oct 2018 10:08:52 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] Missing venv module in Python 3
Thread-Index: AQHUZfpUmN96RPBjFkCZKlJz3pSGm6Uko5lwgAAAGGqAAGUugIAAFsCsgAAEZoCAAC3vgIABAcPa
Date: Fri, 19 Oct 2018 10:08:52 +0000
Message-ID: <VI1PR08MB363145501E7F33C87BECFECE98F90@VI1PR08MB3631.eurprd08.prod.outlook.com>
References: <VI1PR08MB3631013765027F3C7E24415098FF0@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<VI1PR08MB3631FF25AFA7A73D6814C71998F80@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<DB5PR08MB08880A125ED651AD16C50FE993F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<CAJTo0Laa3KT0EBf1EprPyPfZS+TYL+PoXdTpY3=iXiVraiZv1w@mail.gmail.com>
	<DB5PR08MB08887D04D53A66B55244688493F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<CAJTo0Lb5ZFfQVoO2oS4fV6Ts1ph3fs4sVg8Ee3-+X8x5Ff0Y1Q@mail.gmail.com>,
	<CAHMutrZpoHBvwcgnW=Tg7w3c7FCQDws_fCHrH-mA=3w7jprqkA@mail.gmail.com>
In-Reply-To: <CAHMutrZpoHBvwcgnW=Tg7w3c7FCQDws_fCHrH-mA=3w7jprqkA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-originating-ip: [217.140.106.53]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB3424;
	6:pIZLz+kx4qK7jAfNDt75n/hzHmhrUoa0jRYG6lcwCD5JcZA6QGAX7k1He0PYV85CS8Qgc0YnChpUfRs1c1joOuoqnmh8l7DB3zFLHKrzXhCPARNQY7SgQB07GePHvjEKVMPuUinfTiTvY3s6LUKH7Ntw/zTylW3rkyMHime+z4d+KYUzHr4o7WJnEZsci4p4EEM1yv7nfUcpfQtVfuINRCL25hk7kzE35RSn2g8D3JooHxaCP9jC1SHt0EjH9dUWpuT29YThWQ8OYgLSwi2rwetnlpV41YwHXJwrK0JjgbyeY7PSv3vIBQ4ifSzlWKk9dktalCXa8WN9mJ6gyO5unwX992Fg7eQ26TYh8ml6dBmAfSH/oP3Iid/IU3cIqIMki4UUpY6lrkWoEAVY9frM/JfeeicnkzZwc6P8Gd31av0hGZKueJqOrBZnWcFxUi4pxvi9eqW6KVf/7nh9k1N1QQ==;
	5:dyM+Q8WR0DJSXJ+V+QyqOMgdx9j9tS7ArprBq67iK670+LePHBrA2Vw08+OCH6WIQIo4MPfrIWBokvuVWU+Oi7HLXR620CmGluouKz6WReOH3A/lkXtnUwhpdcHS7lXZR4VVDykQhZnfi6N1rh+KUfogHFfBGWV8VHEdc6pZ+No=;
	7:51KwjJrncsFmU3rATyrrRRrS8C9dpOjMKes9xmWhZ2mqTuwOoKErUmFkrXBcVWHV5wU5U420SqZwExpAHwYmjZ6cBp0+bbMv8oC6odvyvDrz+voLmvJjrQaFF2sExhG3kdR06+UCEeos/KXsgSHiMJG5FPLU8vnsp362qMEI6xgfAIidW4LPL+7eOMREVKwNGrklLu43sVtqisQFETjvtus6tOw5/TRIRHFY57e9LoaYauscovivAD3rNfZQXF//
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: b5895b0c-4ff9-4a6b-c01c-08d635aadf18
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:VI1PR08MB3424; 
x-ms-traffictypediagnostic: VI1PR08MB3424:
x-microsoft-antispam-prvs: <VI1PR08MB3424750648273BBAFB4BE08198F90@VI1PR08MB3424.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(85827821059158)(228905959029699)(166708455590820)(10436049006162)(163750095850);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(102415395)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(4983020)(52105095)(3002001)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB3424; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB3424; 
x-forefront-prvs: 0830866D19
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(346002)(136003)(366004)(396003)(40434004)(189003)(199004)(71190400001)(4326008)(99286004)(486006)(81156014)(6246003)(316002)(476003)(8676002)(6606003)(72206003)(5024004)(606006)(256004)(14444005)(8936002)(966005)(71200400001)(11346002)(5660300001)(81166006)(14454004)(478600001)(93886005)(39060400002)(21615005)(86362001)(446003)(6506007)(99936001)(54906003)(5250100002)(66066001)(106356001)(55016002)(6436002)(110136005)(53546011)(105586002)(102836004)(345774005)(25786009)(733005)(186003)(33656002)(6306002)(6116002)(7696005)(2900100001)(68736007)(229853002)(3846002)(236005)(53936002)(97736004)(76176011)(2906002)(7736002)(54896002)(26005)(54556002)(19627405001)(9686003)(74316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3424;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: Wr9CxbkRRC4GgzRk8hKGEGJobwJxPNuNilsrJW76Z1TJywPPCCB5GkVC2fMkASl1ciGYRGCwjpyeD8tktjruFYO7oW8QhhC4U56CQ6z/OGYqlrJXuIzYBYc1UsOlzio49kEiSFg/GMzlrLNFKNgZR6GM9BLRed9j/wx6DgxQEpSyUQRsTjxnbJYt8x+bICgr7HFBIFbEUuogdRl4wt2b2L4+aJ1QpDNNwD+2/83xTFXahZn49tlVriSBs3cjE2ii2pIIo3bIQUfDOxx9LA+sPZl7cnSiv7bLsCn2ZCrp5DsxBoj2IYTqL0JRm6qdyICgmfpeL9/JRp5qssvz4YI9GekSeI2/iYQIFLDMuHVQHgE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5895b0c-4ff9-4a6b-c01c-08d635aadf18
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2018 10:08:52.1986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3424
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
X-List-Received-Date: Fri, 19 Oct 2018 14:43:23 -0000
X-Groupsio-MsgNum: 117476
Content-Language: en-GB
Content-Type: multipart/related;
	boundary="_004_VI1PR08MB363145501E7F33C87BECFECE98F90VI1PR08MB3631eurp_";
	type="multipart/alternative"

--_004_VI1PR08MB363145501E7F33C87BECFECE98F90VI1PR08MB3631eurp_
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB363145501E7F33C87BECFECE98F90VI1PR08MB3631eurp_"

--_000_VI1PR08MB363145501E7F33C87BECFECE98F90VI1PR08MB3631eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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
From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
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

--_000_VI1PR08MB363145501E7F33C87BECFECE98F90VI1PR08MB3631eurp_
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
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &quot;Apple Co=
lor Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI=
 Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi Alejandro,</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Thank you for your suggestion.</p=
>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">The following has been added to a=
&nbsp;python3_%.bbapend:</p>
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div><i><span style=3D"font-size: 10pt;"># Add missing venv module dependen=
cy.</span><br>
<span style=3D"font-size: 10pt;">FILES_${PN}-pyvenv &#43;=3D &quot;${libdir=
}/${PYTHON_MAJMIN}/venv&quot;</span></i></div>
<br>
<p></p>
<p style=3D"margin-top:0;margin-bottom:0">However, it is not quite obvious =
how to successfully run the
<i><span style=3D"font-size: 10pt;">create_manifest3.py</span></i> script.<=
br>
Attempts were made to run it with &quot;<span style=3D"font-size: 10pt;">py=
thon3 create_manifest3.py python3.5&quot;</span> but it complains about an =
undefined variable (<i><span style=3D"font-size: 10pt;">nativelibfolder</sp=
an></i>).<br>
I also tried to run it using &quot;<i><span style=3D"font-size: 10pt;">bitb=
ake pyhton -c create_manifest3.py</span>&quot;</i> as specified in the docs=
tring but execution fails because of&nbsp;missing tasks (no do_..).</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Could you or others on the mailin=
g list, provide some guidance on how to go about running (arguments, etc..)=
 the
<i><span style=3D"font-size: 10pt;">create_manifest3.py</span></i> script.&=
nbsp;</p>
<div id=3D"Signature">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
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
<div style=3D"margin:0px"><img class=3D"EmojiInsert" style=3D"" data-outloo=
k-trace=3D"F:1|T:1" src=3D"cid:bbaed11e-d9b2-456f-bd15-200669ad237e"><br>
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
n style=3D"font-size:11pt"><a href=3D"mailto:sandi.shannon@arm.com" target=
=3D"_blank" rel=3D"noopener noreferrer" id=3D"LPNoLP" title=3D"mailto:sandi=
.shannon@arm.com
Ctrl&#43;Click or tap to follow the link"><font color=3D"#0563C1"><span lan=
g=3D"it">hugues.kamba</span></font><font size=3D"2" color=3D"#0563C1"><span=
 lang=3D"it" style=3D"font-size:10pt">@arm.com</span></font></a></span></fo=
nt></div>
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
jK9aaA6G7NOsVfryuyw&amp;e=3D" target=3D"_blank" rel=3D"noopener noreferrer"=
 id=3D"LPNoLP"><font size=3D"2"><span style=3D"font-size:10pt"><font color=
=3D"blue">Visit
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
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alejandro Enedino Her=
nandez Samaniego &lt;aehs29@gmail.com&gt;<br>
<b>Sent:</b> 18 October 2018 19:18<br>
<b>To:</b> Burton, Ross<br>
<b>Cc:</b> Jonathan Haigh; OE-core; Jeremy Johnson; Hugues Kamba<br>
<b>Subject:</b> Re: [OE-core] Missing venv module in Python 3</font>
<div>&nbsp;</div>
</div>
<meta content=3D"text/html; charset=3Dutf-8">
<div>
<div dir=3D"auto">
<div>Hello folks,<br>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr">On Thu, Oct 18, 2018, 3:34 PM Burton, Ross &lt;<a href=3D"=
mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0 0 0 .8ex; border-left=
:1px #ccc solid; padding-left:1ex">
On Thu, 18 Oct 2018 at 16:19, Jonathan Haigh &lt;<a href=3D"mailto:Jonathan=
.Haigh@arm.com" target=3D"_blank" rel=3D"noreferrer">Jonathan.Haigh@arm.com=
</a>&gt; wrote:<br>
&gt; The venv package (<a href=3D"https://docs.python.org/3/library/venv.ht=
ml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://docs.python.org=
/3/library/venv.html</a>) itself is missing although its source is availabl=
e within Python 3.5 (<a href=3D"https://www.python.org/ftp/python/3.5.6/Pyt=
hon-3.5.6.tgz" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.=
python.org/ftp/python/3.5.6/Python-3.5.6.tgz</a>).
 As mentioned earlier, it seems the issue is because there is no entry in t=
he manifest from which the various Python 3 modules are created (<a href=3D=
"https://github.com/openembedded/openembedded-core/blob/master/meta/recipes=
-devtools/python/python3/python3-manifest.json" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://github.com/openembedded/openembedded-core/blob=
/master/meta/recipes-devtools/python/python3/python3-manifest.json</a>).<br=
>
&gt;<br>
&gt; The manifest is generated from <a href=3D"https://github.com/openembed=
ded/openembedded-core/blob/master/meta/recipes-devtools/python/python3/crea=
te_manifest3.py" rel=3D"noreferrer noreferrer" target=3D"_blank">
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
<div class=3D"x_gmail_quote">
<blockquote class=3D"x_gmail_quote" style=3D"margin:0 0 0 .8ex; border-left=
:1px #ccc solid; padding-left:1ex">
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
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_VI1PR08MB363145501E7F33C87BECFECE98F90VI1PR08MB3631eurp_--

--_004_VI1PR08MB363145501E7F33C87BECFECE98F90VI1PR08MB3631eurp_
Content-Type: image/png; name="Outlook-3v34lh5k.png"
Content-Description: Outlook-3v34lh5k.png
Content-Disposition: inline; filename="Outlook-3v34lh5k.png"; size=2551;
	creation-date="Fri, 19 Oct 2018 10:08:51 GMT";
	modification-date="Fri, 19 Oct 2018 10:08:51 GMT"
Content-ID: <bbaed11e-d9b2-456f-bd15-200669ad237e>
Content-Transfer-Encoding: base64

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

--_004_VI1PR08MB363145501E7F33C87BECFECE98F90VI1PR08MB3631eurp_--
