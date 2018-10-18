Return-Path: <Jonathan.Haigh@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0087.outbound.protection.outlook.com [104.47.2.87])
	by mail.openembedded.org (Postfix) with ESMTP id C3465799F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 19:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=s62vi8c0pq8uTdPHcI/NagkIN5NYJybpIRsj3E3Z0GA=;
	b=fGqUhefqcoyYPzVSmwiXj0KYv9PwiTw4n0wZ/PL3KCv/td4454KuLt/+FmB+IYjjV7X/jbUJ/ymbdPQHLLnasJ2JS6uFIVzJr2MRrTfmDUSExFKsRmknU8FG0Gia8n9BrAxipQ9EhTle65yDUeEDq0s//TxzOqSFwdvsVAQMnq0=
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com (10.164.43.30) by
	DB5PR08MB1142.eurprd08.prod.outlook.com (10.166.174.135) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1228.24; Thu, 18 Oct 2018 15:19:20 +0000
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::e866:a2e1:4c3f:95fa]) by
	DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::e866:a2e1:4c3f:95fa%3]) with mapi id 15.20.1250.020;
	Thu, 18 Oct 2018 15:19:20 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: "Burton, Ross" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Missing venv module in Python 3
Thread-Index: AQHUZfpUmN96RPBjFkCZKlJz3pSGm6Uko5lwgAAAGGqAAGUugIAAFsCs
Date: Thu, 18 Oct 2018 15:19:20 +0000
Message-ID: <DB5PR08MB08887D04D53A66B55244688493F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
References: <VI1PR08MB3631013765027F3C7E24415098FF0@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<VI1PR08MB3631FF25AFA7A73D6814C71998F80@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<DB5PR08MB08880A125ED651AD16C50FE993F80@DB5PR08MB0888.eurprd08.prod.outlook.com>,
	<CAJTo0Laa3KT0EBf1EprPyPfZS+TYL+PoXdTpY3=iXiVraiZv1w@mail.gmail.com>
In-Reply-To: <CAJTo0Laa3KT0EBf1EprPyPfZS+TYL+PoXdTpY3=iXiVraiZv1w@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.106.51]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR08MB1142;
	6:V9ivB1ywDZTKNSyUZTIIhxh/OiEI4yKRdkJLfJgd55cCnldnh7ukKgBLtpIhBrhTV4v4jSuWLtGhsJ9PgTVY1420ms7M0SW/U8d7wJBsxzyWdz2B7qxwmZw4PqrIsyJDFOAPc7B6awTBNL+p6WMeiSzM8CvEsCLMAK+f5VN3T7EL86toiScm0EBpop9QxwRNN8OOzU6+Y7oZvfY2GTQNvhMaCWpsbaPv0mIRztTNiMn3Zmij+rW4VLqAPIQls3syk5ls50tjdMH8XyW+9NNOxwtyDfys/yuieytUBJEUt+od2epUnNse9xHI4fzr/7DCfPItNGCTEk0j33aA+1ZUAYreVZhZhLyRYn7qPLSF0VoA/Xk6nzjJG7E9UaFfGtLsfrD0Eo+I+M+0Bm8KLY5+ElYCIGTvb33V/NS7c/YBCaXNE0eYoYtepFNAMw3aHH+0zu89dPddPq0gzwaGETtQPg==;
	5:oa8yFa1cPFMwgolG1fk9iqM1aMpvmmU5xoti7gEoBszbOoyn6M5EQWM16AMFGe0CbsXRLghwxLWwLXQqUL1ItS7jenXtxEtekURmFQqLBFYsNiX/t3eU48PjYhEAPN3OGscscmtA/nJKQa8rwnkYeMI6223aKdmxpXypc4tLcMU=;
	7:n3k1h3zcGAkfC4l1UJFaE1sBl1mTJ2toTdUqYamZJzKb3AQF3zvXWeeXPcavpRF8tF4+stj9GcXG/ENpwW3ie2k6rpyRz8wtAmKzHJdC9PWDskD80X0skVe1kSngQ9cNb8rufG+J5cVP05Uuz5LMuaTr7MNeRmS40+DKct56XIKH0Mvlaf3qIw8VEWel6c5yfm79Y0eS0hCSYG7zgowjqhFmxVSCgmbfu5w5S6nZ6cj3/QJnUGmEFOCHwLiIVf6j
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 2d49dcef-59c2-49e4-c385-08d6350d13cd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR08MB1142; 
x-ms-traffictypediagnostic: DB5PR08MB1142:
x-microsoft-antispam-prvs: <DB5PR08MB11424A424DB6D95CE99360B593F80@DB5PR08MB1142.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(163750095850)(166708455590820)(228905959029699)(180628864354917)(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(4982022)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DB5PR08MB1142; BCL:0; PCL:0; RULEID:; SRVR:DB5PR08MB1142; 
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(376002)(136003)(396003)(366004)(199004)(189003)(40434004)(7696005)(68736007)(236005)(81166006)(55016002)(54906003)(53936002)(53546011)(8676002)(86362001)(81156014)(19627405001)(345774005)(9686003)(6306002)(6436002)(105586002)(25786009)(446003)(7736002)(99286004)(4326008)(21615005)(26005)(74316002)(6606003)(5660300001)(186003)(6506007)(54896002)(5024004)(8936002)(110136005)(14444005)(11346002)(486006)(476003)(256004)(102836004)(966005)(14454004)(6246003)(72206003)(316002)(606006)(93886005)(2900100001)(33656002)(71200400001)(6116002)(478600001)(76176011)(3846002)(66066001)(5250100002)(2906002)(106356001)(229853002)(71190400001)(39060400002)(97736004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR08MB1142;
	H:DB5PR08MB0888.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: o3HgzRPo6boOlGcRHPN6uPl2bN+2xO2U0SOHHiuFQam5LyryZug7kqNSFcHDcRGeRGlu1DxK+CG6oxeL3w85uLRpPaEVjYd2jkDxmgQ7xWcNKiohRFKAUjYjftg3Ad9ZxnN4K4DjsVmyfnSfoLQL3erFAiESVgRDCPWV05/7bVNRZFa2GsCaRUnuavs3P94PbGWGJ9jtbF8EvragfnmDF6rrIgWgkB7VU9az4PKOlWZx0cCYb9oFCD8U/H9VmdorMj8d5WJP4Vq+rfrzHlJt65bdxEAlAyRWg4H28UoBq0bCoi2fMb3trobPWEBCcHSPy6fHrCdzJG/MfY7KrhbIstJx6HoUeFUkMC9bQSU4Ink=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d49dcef-59c2-49e4-c385-08d6350d13cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 15:19:20.1061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB1142
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>,
	Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>,
	Hugues Kamba <Hugues.Kamba@arm.com>
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
X-List-Received-Date: Thu, 18 Oct 2018 19:52:34 -0000
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DB5PR08MB08887D04D53A66B55244688493F80DB5PR08MB0888eurp_"

--_000_DB5PR08MB08887D04D53A66B55244688493F80DB5PR08MB0888eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Ross,
Thank you for you prompt reply.

Apologies if I was not clear enough in my previous message.

python3-pyvenv is indeed a package that gets built with python3. However, p=
yvenv is just a short script that imports the venv module. Including the py=
thon3-pyvenv package does not solve the issue as the creation of a virtual =
environment using "python3 -m venv my_env" or "pyvenv my_env" results in a =
error about the missing venv module.

See the entire content of pyvenv:
---------------------------------------------------
#! /usr/bin/python3.5
if __name__ =3D=3D '__main__':
    import sys
    rc =3D 1
    try:
        import venv
        venv.main()
        rc =3D 0
    except Exception as e:
        print('Error: %s' % e, file=3Dsys.stderr)
    sys.exit(rc)
----------------------------------------------------

The venv package (https://docs.python.org/3/library/venv.html) itself is mi=
ssing although its source is available within Python 3.5 (https://www.pytho=
n.org/ftp/python/3.5.6/Python-3.5.6.tgz). As mentioned earlier, it seems th=
e issue is because there is no entry in the manifest from which the various=
 Python 3 modules are created (https://github.com/openembedded/openembedded=
-core/blob/master/meta/recipes-devtools/python/python3/python3-manifest.jso=
n).

The manifest is generated from https://github.com/openembedded/openembedded=
-core/blob/master/meta/recipes-devtools/python/python3/create_manifest3.py,=
 and it does not seem obvious to me how to go about correctly adding a new =
module to the manifest, using create_manifest3.py or otherwise.

Can you, or others on the mailing list, provide some guidance on how to go =
about adding the venv module to the manifest?

Regards,

Hugues/Jonathan


________________________________
From: Burton, Ross <ross.burton@intel.com>
Sent: 18 October 2018 14:56
To: Jonathan Haigh
Cc: OE-core; Jeremy Johnson; Alejandro Enedino Hernandez Samaniego; Hugues =
Kamba
Subject: Re: [OE-core] Missing venv module in Python 3

venv is packaged in python3-pyvenv.  Patches welcome to get that
installed out of the box.

Ross
On Thu, 18 Oct 2018 at 14:35, Jonathan Haigh <Jonathan.Haigh@arm.com> wrote=
:
>
> Hello,
>
> I have noticed that the venv module is not available with Python 3 in Yoc=
to.
> This is possibly because there is no entry for it in openembedded-core/me=
ta/recipes-devtools/python/python3/python3-manifest.json
>
> Could  you please provide guidance or a fix to make the module available?
>
> Thank you
>
> Jonathan Haigh on behalf of Hugues Kamba
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_DB5PR08MB08887D04D53A66B55244688493F80DB5PR08MB0888eurp_
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
<p style=3D"margin-top:0;margin-bottom:0"></p>
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, &quot;EmojiFont&quot;, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D=
"ltr">
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">Hi =
Ross,</span></font></span></font></div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">Tha=
nk you for you prompt reply.</span></font></span></font>
</div>
<div>
<div style=3D"margin:0 0 0 36pt;"><font size=3D"2" face=3D"Calibri,sans-ser=
if"><span style=3D"font-size:11pt;"><font size=3D"3" color=3D"black"><span =
style=3D"font-size:12pt;">&nbsp;</span></font></span></font></div>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">Apo=
logies if I was not clear enough in my previous message.</span></font></spa=
n></font>
</div>
<div>
<div style=3D"margin:0 0 0 36pt;"><font size=3D"2" face=3D"Calibri,sans-ser=
if"><span style=3D"font-size:11pt;"><font size=3D"3" color=3D"black"><span =
style=3D"font-size:12pt;">&nbsp;</span></font></span></font></div>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">pyt=
hon3-pyvenv is indeed a package that gets built with python3. However, pyve=
nv is just a short script that imports the venv
 module. Including the python3-pyvenv package does not solve the issue as t=
he creation of a virtual environment using &quot;python3 -m venv my_env&quo=
t; or &quot;pyvenv my_env&quot; results in a error about the missing venv m=
odule.</span></font></span></font>
</div>
<div>
<div style=3D"margin:0 0 0 36pt;"><font size=3D"2" face=3D"Calibri,sans-ser=
if"><span style=3D"font-size:11pt;"><font size=3D"3" color=3D"black"><span =
style=3D"font-size:12pt;">&nbsp;</span></font></span></font></div>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">See=
 the entire content of pyvenv:</span></font></span></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
---------------------------------------------------</i></span></font></span=
></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
#! /usr/bin/python3.5&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</i></span></font></span>=
</font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
if __name__ =3D=3D '__main__':&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;&nbsp;</i></span></font></span></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
&nbsp; &nbsp; import sys&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;</i></span></font></span></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
&nbsp; &nbsp; rc =3D 1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;&nbsp;</i></span></font></span></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
&nbsp; &nbsp; try:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;&nbsp;</i></span></font></span></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
&nbsp; &nbsp; &nbsp; &nbsp; import venv&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></sp=
an></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
&nbsp; &nbsp; &nbsp; &nbsp; venv.main()&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</i></span></font></sp=
an></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
&nbsp; &nbsp; &nbsp; &nbsp; rc =3D 0&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;</i></span></font></span></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
&nbsp; &nbsp; except Exception as e:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp=
;</i></span></font></span></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
&nbsp; &nbsp; &nbsp; &nbsp; print('Error: %s' % e, file=3Dsys.stderr)&nbsp;=
&nbsp;</i></span></font></span></font>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"2" color=3D"black"><span style=3D"font-size:10pt;"><i>=
&nbsp; &nbsp; sys.exit(rc)&nbsp;
</i></span></font><font size=3D"3" color=3D"black"><span style=3D"font-size=
:12pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></font></span></fo=
nt>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">---=
-------------------------------------------------</span></font></span></fon=
t>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;"><br=
>
</span></font></span></font></div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;"><fo=
nt size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:11pt;"><=
font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">
<div>Th<font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-siz=
e:11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">e=
 venv package&nbsp;(</span></font><a href=3D"https://docs.python.org/3/libr=
ary/venv.html" target=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D"N=
otApplicable"><font size=3D"3"><span style=3D"font-size:12pt;">https://docs=
.python.org/3/library/venv.html</span></font></a><font size=3D"3" color=3D"=
black"><span style=3D"font-size:12pt;">)&nbsp;itself
 is missing although its source is available within Python&nbsp;3.5 (</span=
></font><a href=3D"https://www.python.org/ftp/python/3.5.6/Python-3.5.6.tgz=
" target=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable"=
><font size=3D"3"><span style=3D"font-size:12pt;">https://www.python.org/ft=
p/python/3.5.6/Python-3.5.6.tgz</span></font></a><font size=3D"3" color=3D"=
black"><span style=3D"font-size:12pt;">).
 As mentioned earlier, it seems the issue is because there is no entry in t=
he manifest&nbsp;from which the various Python&nbsp;3 modules are created (=
</span></font><a href=3D"https://github.com/openembedded/openembedded-core/=
blob/master/meta/recipes-devtools/python/python3/python3-manifest.json" tar=
get=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable"><fon=
t size=3D"3"><span style=3D"font-size:12pt;">https://github.com/openembedde=
d/openembedded-core/blob/master/meta/recipes-devtools/python/python3/python=
3-manifest.json</span></font></a><font size=3D"3" color=3D"black"><span sty=
le=3D"font-size:12pt;">).</span></font></span></font></div>
<br>
</span></font></span></font></span></font></span></font></div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;"><fo=
nt size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:11pt;"><=
font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">The
 manifest&nbsp;is generated from</span></font><a href=3D"https://github.com=
/openembedded/openembedded-core/blob/master/meta/recipes-devtools/python/py=
thon3/create_manifest3.py" target=3D"_blank" rel=3D"noopener noreferrer" da=
ta-auth=3D"NotApplicable"><font size=3D"3"><span style=3D"font-size:12pt;">
 https://github.com/openembedded/openembedded-core/blob/master/meta/recipes=
-devtools/python/python3/create_manifest3.py</span></font></a></span></font=
>, and it does not seem obvious to me how to go about correctly adding a ne=
w module to the manifest, using
 create_manifest3.py or otherwise.</span></font></span></font></div>
<font size=3D"3"><font face=3D"Calibri,sans-serif"><br>
</font></font></div>
<font size=3D"3"><font face=3D"Calibri,sans-serif">Can you</font></font><fo=
nt size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:11pt;"><=
font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">, or others=
 on the mailing list, provide some guidance on how
 to go about adding the venv module to the manifest?<br>
</span></font></span></font>
<div>
<div style=3D"margin:0 0 0 36pt;"><font size=3D"2" face=3D"Calibri,sans-ser=
if"><span style=3D"font-size:11pt;"><font size=3D"3" color=3D"black"><span =
style=3D"font-size:12pt;">&nbsp;</span></font></span></font></div>
</div>
<div><font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:=
11pt;"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">Reg=
ards,</span></font></span></font>
</div>
<div>
<div style=3D"margin:0 0 0 36pt;"><font size=3D"2" face=3D"Calibri,sans-ser=
if"><span style=3D"font-size:11pt;"><font size=3D"3" color=3D"black"><span =
style=3D"font-size:12pt;">&nbsp;</span></font></span></font></div>
</div>
<font size=3D"2" face=3D"Calibri,sans-serif"><span style=3D"font-size:11pt;=
"><font size=3D"3" color=3D"black"><span style=3D"font-size:12pt;">Hugues/J=
onathan</span></font></span></font><br>
<p></p>
<br>
<br>
<div style=3D"color: rgb(0, 0, 0);">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Burton, Ross &lt;ro=
ss.burton@intel.com&gt;<br>
<b>Sent:</b> 18 October 2018 14:56<br>
<b>To:</b> Jonathan Haigh<br>
<b>Cc:</b> OE-core; Jeremy Johnson; Alejandro Enedino Hernandez Samaniego; =
Hugues Kamba<br>
<b>Subject:</b> Re: [OE-core] Missing venv module in Python 3</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">venv is packaged in python3-pyvenv.&nbsp; Patches =
welcome to get that<br>
installed out of the box.<br>
<br>
Ross<br>
On Thu, 18 Oct 2018 at 14:35, Jonathan Haigh &lt;Jonathan.Haigh@arm.com&gt;=
 wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; I have noticed that the venv module is not available with Python 3 in =
Yocto.<br>
&gt; This is possibly because there is no entry for it in openembedded-core=
/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt;<br>
&gt; Could&nbsp; you please provide guidance or a fix to make the module av=
ailable?<br>
&gt;<br>
&gt; Thank you<br>
&gt;<br>
&gt; Jonathan Haigh on behalf of Hugues Kamba<br>
&gt; IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any
 purpose, or store or copy the information in any medium. Thank you.<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; Openembedded-core@lists.openembedded.org<br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</div>
</span></font></div>
</div>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_DB5PR08MB08887D04D53A66B55244688493F80DB5PR08MB0888eurp_--
