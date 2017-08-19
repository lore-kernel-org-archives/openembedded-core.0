Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 93A90783E6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 16:08:04 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2017 09:08:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,398,1498546800"; 
	d="scan'208,217";a="139516784"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by orsmga005.jf.intel.com with ESMTP; 19 Aug 2017 09:08:05 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.170]) by
	ORSMSX110.amr.corp.intel.com ([169.254.10.72]) with mapi id
	14.03.0319.002; Sat, 19 Aug 2017 09:08:04 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [PATCH v3 01/11] reproducible_build.bbclass: initial support
	for binary reproducibility
Thread-Index: AQHTETfN2LmLAAnsskymrwpZTBSo3aKL3FYAgAALHHY=
Date: Sat, 19 Aug 2017 16:08:04 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6119E8D5E@ORSMSX112.amr.corp.intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<1502300913-40295-2-git-send-email-juro.bystricky@intel.com>,
	<CA+chaQeOi5H91XcavV+=SoGzRr_+91nCypEpE5APm4UkDfEn3w@mail.gmail.com>
In-Reply-To: <CA+chaQeOi5H91XcavV+=SoGzRr_+91nCypEpE5APm4UkDfEn3w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 01/11] reproducible_build.bbclass: initial support for binary reproducibility
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
X-List-Received-Date: Sat, 19 Aug 2017 16:08:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B6119E8D5EORSMSX112amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B6119E8D5EORSMSX112amrcor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yes, this should not be a problem, it is actually a good idea. I am current=
ly running a test buid witth
the file created in ${WORKDIR}.
I will send a patch to ML soon.
________________________________
From: Martin Jansa [martin.jansa@gmail.com]
Sent: Saturday, August 19, 2017 1:25 AM
To: Bystricky, Juro
Cc: Patches and discussions about the oe-core layer; Richard Purdie; Joshua=
 G Lock; Burton, Ross; Juro Bystricky
Subject: Re: [PATCH v3 01/11] reproducible_build.bbclass: initial support f=
or binary reproducibility

Would it make sense to create src_date_epoch.txt outside ${S} directory?

In some recipes (which weren't picky what they install from ${S} to ${D}) I=
've noticed that src_date_epoch.txt is now included in their package (I've =
noticed, because 2 different packages were trying to install this file on t=
he same path in rootfs).

Can we use temp or ${WORKDIR} for this file? ${S} might be also be complete=
ly archived with archiver.bbclass, not sure if you want src_date_epoch.txt =
part of that or not.

Regards,



--_000_6E51916E4A1F32428260031F4C7CD2B6119E8D5EORSMSX112amrcor_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Yes, this should not be a problem, it is actually a good idea. I am =
currently running a test buid witth<br>
the file created in ${WORKDIR}.<br>
I will send a patch to ML soon.<br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div id=3D"divRpF54660" style=3D"direction: ltr;"><font size=3D"2" face=3D"=
Tahoma" color=3D"#000000"><b>From:</b> Martin Jansa [martin.jansa@gmail.com=
]<br>
<b>Sent:</b> Saturday, August 19, 2017 1:25 AM<br>
<b>To:</b> Bystricky, Juro<br>
<b>Cc:</b> Patches and discussions about the oe-core layer; Richard Purdie;=
 Joshua G Lock; Burton, Ross; Juro Bystricky<br>
<b>Subject:</b> Re: [PATCH v3 01/11] reproducible_build.bbclass: initial su=
pport for binary reproducibility<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">Would it make sense to create&nbsp;<span style=3D"font-siz=
e:12.8px">src_date_</span><wbr style=3D"font-size:12.8px"><span class=3D"gm=
ail-il" style=3D"font-size:12.8px; background-color:rgb(255,255,255)">epoch=
</span><span style=3D"font-size:12.8px">.txt outside
 ${S} directory?<br>
</span>
<div><span style=3D"font-size:12.8px"><br>
</span></div>
<div><span style=3D"font-size:12.8px">In some recipes (which weren't picky =
what they install from ${S} to ${D}) I've noticed that&nbsp;</span><span st=
yle=3D"font-size:12.8px">src_date_</span><wbr style=3D"font-size:12.8px"><s=
pan class=3D"gmail-il" style=3D"background-color:rgb(255,255,255); font-siz=
e:12.8px">epoch</span><span style=3D"font-size:12.8px">.txt
 is now included in their package (I've noticed, because 2 different packag=
es were trying to install this file on the same path in rootfs).</span></di=
v>
<div><span style=3D"font-size:12.8px"><br>
</span></div>
<div><span style=3D"font-size:12.8px">Can we use temp or ${WORKDIR} for thi=
s file?&nbsp;</span><span style=3D"font-size:12.8px">${S} might be also be =
completely archived with archiver.bbclass, not sure if you want src_date_ep=
och.txt part of that or not.</span></div>
<div><span style=3D"font-size:12.8px"><br>
</span></div>
<div><span style=3D"font-size:12.8px">Regards,</span></div>
</div>
<div class=3D"gmail_extra"><br>
<br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_6E51916E4A1F32428260031F4C7CD2B6119E8D5EORSMSX112amrcor_--
