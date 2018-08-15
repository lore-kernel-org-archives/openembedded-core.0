Return-Path: <bhas_purk@hotmail.com>
X-Greylist: delayed 61265 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Aug 2018 09:40:15 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-oln040092005011.outbound.protection.outlook.com [40.92.5.11])
	by mail.openembedded.org (Postfix) with ESMTP id 969AC7928A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 09:40:15 +0000 (UTC)
Received: from CY1NAM02HT163.eop-nam02.prod.protection.outlook.com
	(2a01:111:e400:7e45::243) by
	SN1NAM02HT161.eop-nam02.prod.protection.outlook.com
	(2a01:111:e400:7e44::140) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.1059.14;
	Wed, 15 Aug 2018 14:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=h4CGeXwUeFWVsYm8Y+m0oOKCw5qZ13zEYDN443S1tf0=;
	b=Ivh7mElLE4gllsKm69FRZBYgK47GlSDcf0NKXt1OUcbEgAoZXG/cxa++1+6u9hsOiXezgWOMMwbBehGMbpJ+fnIc6bCWVzi4ESE6d1TLbbmktVYdDRGA+N1VIaRKqiJenKPnhQtaEX8eg0gkEpJIwc3g7YNtpiqDyzDq5RQZm8XfglsteawKCrcmJlS8nsBhQiE3WAbacMHXvTuN6cl5jhkydF1gvIBp+A5sJ8CVRuPow8nf5f19uMQD2rYS655KwXV18d2ifb56NM7Ho/lOeTMbShPESNV7Nept5BgY8prkCcAD9oJm97oLtLa9Duxxx0o8sPoXlGnyuWoAbHL9Yw==
Received: from CY1NAM02FT031.eop-nam02.prod.protection.outlook.com
	(10.152.74.51) by CY1NAM02HT163.eop-nam02.prod.protection.outlook.com
	(10.152.74.243) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.20.1059.14;
	Wed, 15 Aug 2018 07:46:11 +0000
Received: from CP2P152MB1380.LAMP152.PROD.OUTLOOK.COM (10.152.74.55) by
	CY1NAM02FT031.mail.protection.outlook.com (10.152.75.180) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.20.1059.14 via Frontend Transport; Wed, 15 Aug 2018 07:46:10 +0000
Received: from CP2P152MB1380.LAMP152.PROD.OUTLOOK.COM
	([fe80::4405:7b33:946c:8372]) by CP2P152MB1380.LAMP152.PROD.OUTLOOK.COM
	([fe80::4405:7b33:946c:8372%9]) with mapi id 15.20.1038.025;
	Wed, 15 Aug 2018 07:46:11 +0000
From: bhas_purk <bhas_purk@hotmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] adding python modules
Thread-Index: AQHUM1cVFKEX3+ADrkOmz1lbqtCVY6S+6C0AgACoa4CAAN0sCA==
Date: Wed, 15 Aug 2018 07:46:10 +0000
Message-ID: <CP2P152MB1380BD88F87EB40143C2F993943F0@CP2P152MB1380.LAMP152.PROD.OUTLOOK.COM>
References: <SC1P152MB138947050EB80F8E776671CB94390@SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM>
	<CANNYZj9kfU8RQiVFE9eL79KLqJ280gf3SOKsmTAYyOFd3NgwvA@mail.gmail.com>,
	<73e7f309-7910-a680-0476-0e28bf84e43d@xilinx.com>
In-Reply-To: <73e7f309-7910-a680-0476-0e28bf84e43d@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:FF0EDA80ECE96C02E13302FC30C914D7402F7FC90D2C5ED71E48DC530616B764;
	UpperCasedChecksum:9B4DCA35329026CB3D026BE66661E465E05388948EFA254E4B65E5091DDC9CD6;
	SizeAsReceived:7285; Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [dzUVAEa6Sj9FBOL97/+mCRFuM7GNgcz+]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1NAM02HT163;
	6:x38wRdeViualBChk2CvbcEKKh3SJL8Z+xa1V1gddrpyRPdnnS1ODbeAjAOR8zSb4YlWlB9+5GsSktr1MJDkMVggCWdTCoz2mxtS0fxDV3RrxRg5Des94jB3JAVUyG7iypy0F+OLCI3jrR3d1ZcpVKdDvf1Xq5vib/g1yFTqQGakseaJsR4/W2jYQCJcM2K8rJa2UVDGLAHpy6R711gzEIiaCTPDI8jPKJuUSGvKzGXzxfETz7yCvfPcT91eOhcBd5kV5i3fGcs3iqQnKzNvOMHAOTrYEwOhrdcoFA7T7U/d3kJ3Psn8KUQ+7x9ZD63sscr/ysKnz9AzQJhy4qiUbAK6+jRWfoyxPgTlUBsPpPV8RYBMQguhbHPUkp22x+ZP4zDjCSWxjNzfoej7l2AYGj/37AMQ3g4KkXsQ+7E67W4CA+75YpLWswfE1d8K6AkfjFyJhWxeIoKIiHkkg7coIvQ==;
	5:LO8C4d/HKlfeJuaIOkvcU3saoaJWb0juVOnAVHkMIOyjZ0e/vPiu37xVS9E9MgECV8t03k1vvx+clpG84DiJMvaT88LqpWHorWJy7ZQpS93ofdK7PsQKlCXctPtkiTEL8yEo3AGeewLbzy1pzhEzyka2QHJcWeOl5RBYOfhL0sc=;
	7:DZIIVPy72sBrxFEmSYsB/kaaGQ0HVIqWEA3ERTSmGG1c48SqlSrgmefZ40lcVGcbggZOw47sV1dJUtlV92ycd0vArkHue0xKL3qRc1ucuiPhUx0d8oUL1khZejNkjC2KV61yHiYJMdDplqbO1hn0TJ496eIl5pJ8P/X47oLmJdQF5qQ9yWzxDCuU5+9xtJDkig6mkA9T6kFeZQJyuctykcUX/xwFFQHSfB6/wtUvk9b0G/vWC6mzmixyZfb6ZyIa
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031324274)(2017031323274)(2017031322404)(1603101475)(1601125500)(1701031045);
	SRVR:CY1NAM02HT163; 
X-MS-TrafficTypeDiagnostic: CY1NAM02HT163:|CY1NAM02HT163:|SN1NAM02HT161:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(4566010)(82015058);
	SRVR:CY1NAM02HT163; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT163; 
x-forefront-prvs: 07658B8EA3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(7070007)(199004)(189003)(11346002)(33656002)(110136005)(486006)(5250100002)(8676002)(104016004)(106356001)(19627405001)(26005)(81156014)(102836004)(2900100001)(105004)(2501003)(53546011)(6506007)(73972006)(5660300001)(6346003)(25786009)(476003)(87572001)(446003)(606006)(97736004)(45080400002)(6246003)(256004)(236005)(105586002)(7696005)(82202002)(54896002)(74316002)(86362001)(99286004)(6306002)(6436002)(76176011)(20460500001)(14454004)(8936002)(229853002)(83332001)(9686003)(55016002)(966005)(68736007)(56003)(15852004);
	DIR:OUT; SFP:1901; SCL:1; SRVR:CY1NAM02HT163;
	H:CP2P152MB1380.LAMP152.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hotmail.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bhas_purk@hotmail.com; 
x-microsoft-antispam-message-info: E78cMp3L/TxkPMlwYNeBHYTX8ftk3b7AW517h5cnYi7oT/fI0ry7VVEpbq54yFsqQITlLXbogngknCeQDkQJ/K4uoQY1qSvNWju1j8eFU+ph3RvNjTjOB7eQMle2ZZPqpSWms3O3Mn2fxyAt4hyYtuIRRW85uoxPPAoSJBWN1L4DeCzXJpvF2Bl2HuH3LEYyeoTjNqPZkNFJ2ZtDv5wSP7ImTMO+OTGVXo7uN135Vo4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 7181d4b0-87d6-4f4e-ba33-0d3746212cec
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c9f4fb-c19c-4c20-a53d-08d602832b54
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 7181d4b0-87d6-4f4e-ba33-0d3746212cec
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2018 07:46:10.9822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT163
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02HT161;
	23:/+HVKZnwxiwaRx4D8Zqk+RMtGa4gkEK/Hw3q/nBIi2gJm6CPooArUI1s3ssPRnXn0VNmrm4yEtmMSsuYmNiVS2mela/MqvOkItleUFteOTCtM4v9CdyvYjRlFpNfzW7VXul7ThfF9DKuRe2iD52tnQ==
X-OriginatorOrg: hotmail.com
Subject: Re: adding python modules
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
X-List-Received-Date: Thu, 16 Aug 2018 09:40:15 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CP2P152MB1380BD88F87EB40143C2F993943F0CP2P152MB1380LAMP_"

--_000_CP2P152MB1380BD88F87EB40143C2F993943F0CP2P152MB1380LAMP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for your inputs.
Indeed I am not using master, but 'pyro'.
I added python3-modules, but still did not get the modules that I wanted. F=
or example, I see atexit.py in the rootfs in /usr/lib/python2.7. But I dont=
 see that under python3.5, I need that.


For pexpect and jsonrpclib, I was able to create/copy recipes and now I do =
see those modules in rootfs.

So the questions remains, how do I get atexit.py, math.py etc.


Thank you
Bhaskar
________________________________
From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> on behalf of Alejandro Enedino Hernandez Sam=
aniego <alejandro.enedino.hernandez-samaniego@xilinx.com>
Sent: Tuesday, August 14, 2018 2:21 PM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] adding python modules

Hey Bhaskar, Alex


On 08/14/2018 01:18 AM, Alexander Kanavin wrote:
> Simple - add python3-modules to the packagegroup. Sadly this seems to
> be 'common knowledge' that is poorly documented.
>
> Alex
I'm pretty sure that the python3-modules package is included by default
when python is installed (on master)
if you wont be using master then yes, install python3-modules
>
> 2018-08-14 0:51 GMT+02:00 bhas_purk <bhas_purk@hotmail.com>:
>> Hello,
>> I am new to yocto, and we are using this for an Intel SOC.
>> I am creating a console-image, and wanted to get python3 in the rootfs.
>>
>> So I added python3 in the recipe file -
>> layers/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup=
-basic.bb
>> This gave me python3 in the rootfs and I can run ptyhon3. So that is gre=
at!
>>
>>
>> Now I would like to add some modules to python such that they are built =
in,
>> and I dont have to do a pip install for the modules.
>>
>> I see that there is a script file which generates the manifest for all
>> modules will be there.
>> openembedded-core/scripts/contrib/python/generate-manifest-3.5.py
>>
>>
>> I would like to edit this file to some python modules, and am wondering =
how.
>>
>> For example, one of the existing modules in the script is defined like t=
his-
>>    m.addPackage( "${PN}-argparse", "Python command line argument parser"=
,
>> "${PN}-core ${PN}-codecs ${PN}-textutils",
>>      "argparse.*" )
The generate-manifest-3.5 script is no longer used (again, on master),
there is a new one called create-manifest where you can add more granularit=
y
to the python build, but in this case I don't believe you need it.

Alejandro
>>
>>
>> So my question is, for the modules I would like to add, how do I know th=
e
>> dependencies etc? And more importantly, is this the right way to add mod=
ules
>> to python3 in the rootfs.
>>
>>
>> Thank you
>> Bhaskar
>>
>>
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--_000_CP2P152MB1380BD88F87EB40143C2F993943F0CP2P152MB1380LAMP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Thanks for your inputs.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Indeed I am not using master, but 'pyro'.&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I added python3-modules, but still did not get the modules that I wanted. F=
or example, I see atexit.py in the rootfs in /usr/lib/python2.7. But I dont=
 see that under&nbsp;python3.5, I need that.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
For pexpect and jsonrpclib, I was able to create/copy recipes and now I do =
see those modules in rootfs.&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
So the questions remains, how do I get atexit.py, math.py etc.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Thank you</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Bhaskar</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core-bou=
nces@lists.openembedded.org &lt;openembedded-core-bounces@lists.openembedde=
d.org&gt; on behalf of Alejandro Enedino Hernandez
 Samaniego &lt;alejandro.enedino.hernandez-samaniego@xilinx.com&gt;<br>
<b>Sent:</b> Tuesday, August 14, 2018 2:21 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core] adding python modules</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hey Bhaskar, Alex<br>
<br>
<br>
On 08/14/2018 01:18 AM, Alexander Kanavin wrote:<br>
&gt; Simple - add python3-modules to the packagegroup. Sadly this seems to<=
br>
&gt; be 'common knowledge' that is poorly documented.<br>
&gt;<br>
&gt; Alex<br>
I'm pretty sure that the python3-modules package is included by default <br=
>
when python is installed (on master)<br>
if you wont be using master then yes, install python3-modules<br>
&gt;<br>
&gt; 2018-08-14 0:51 GMT&#43;02:00 bhas_purk &lt;bhas_purk@hotmail.com&gt;:=
<br>
&gt;&gt; Hello,<br>
&gt;&gt; I am new to yocto, and we are using this for an Intel SOC.<br>
&gt;&gt; I am creating a console-image, and wanted to get python3 in the ro=
otfs.<br>
&gt;&gt;<br>
&gt;&gt; So I added python3 in the recipe file -<br>
&gt;&gt; layers/meta-openembedded/meta-oe/recipes-core/packagegroups/packag=
egroup-basic.bb<br>
&gt;&gt; This gave me python3 in the rootfs and I can run ptyhon3. So that =
is great!<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Now I would like to add some modules to python such that they are =
built in,<br>
&gt;&gt; and I dont have to do a pip install for the modules.<br>
&gt;&gt;<br>
&gt;&gt; I see that there is a script file which generates the manifest for=
 all<br>
&gt;&gt; modules will be there.<br>
&gt;&gt; openembedded-core/scripts/contrib/python/generate-manifest-3.5.py<=
br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I would like to edit this file to some python modules, and am wond=
ering how.<br>
&gt;&gt;<br>
&gt;&gt; For example, one of the existing modules in the script is defined =
like this-<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; m.addPackage( &quot;${PN}-argparse&quot;, &quot;=
Python command line argument parser&quot;,<br>
&gt;&gt; &quot;${PN}-core ${PN}-codecs ${PN}-textutils&quot;,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;argparse.*&quot; )<br>
The generate-manifest-3.5 script is no longer used (again, on master),<br>
there is a new one called create-manifest where you can add more granularit=
y<br>
to the python build, but in this case I don't believe you need it.<br>
<br>
Alejandro<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; So my question is, for the modules I would like to add, how do I k=
now the<br>
&gt;&gt; dependencies etc? And more importantly, is this the right way to a=
dd modules<br>
&gt;&gt; to python3 in the rootfs.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thank you<br>
&gt;&gt; Bhaskar<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; Openembedded-core@lists.openembedded.org<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core=
</a><br>
&gt;&gt;<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
Openembedded-core@lists.openembedded.org<br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_CP2P152MB1380BD88F87EB40143C2F993943F0CP2P152MB1380LAMP_--
