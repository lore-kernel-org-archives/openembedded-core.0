Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6A278044
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 21:14:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 14:14:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,360,1491289200"; 
	d="scan'208,217";a="1132314250"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga001.jf.intel.com with ESMTP; 18 May 2017 14:14:42 -0700
Received: from orsmsx114.amr.corp.intel.com (10.22.240.10) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Thu, 18 May 2017 14:14:41 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.213]) by
	ORSMSX114.amr.corp.intel.com ([169.254.8.78]) with mapi id
	14.03.0319.002; Thu, 18 May 2017 14:14:41 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [PATCH] kernel.bbclass: improve reproducibility
Thread-Index: AQHS0Bp5QyH/rNeLEk2la53nVMXnkaH7C12A//+Lrwk=
Date: Thu, 18 May 2017 21:14:40 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B61195C6DE@ORSMSX112.amr.corp.intel.com>
References: <1495141509-4582-1-git-send-email-juro.bystricky@intel.com>,
	<CAJTo0LbY5NPD8PY8dFiCvg8h47DCWYBgM6yEWLVDk3Vg-C-MUw@mail.gmail.com>
In-Reply-To: <CAJTo0LbY5NPD8PY8dFiCvg8h47DCWYBgM6yEWLVDk3Vg-C-MUw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.46]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: improve reproducibility
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
X-List-Received-Date: Thu, 18 May 2017 21:14:42 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B61195C6DEORSMSX112amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B61195C6DEORSMSX112amrcor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Quite possibly. However, the biggest abuser of __FILE__ seems to be kernel =
and kernel_modules.

________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Thursday, May 18, 2017 2:10 PM
To: Bystricky, Juro
Cc: OE-core; Purdie, Richard; Joshua G Lock; Juro Bystricky
Subject: Re: [PATCH] kernel.bbclass: improve reproducibility


On 18 May 2017 at 22:05, Juro Bystricky <juro.bystricky@intel.com<mailto:ju=
ro.bystricky@intel.com>> wrote:
Kernel and kernel modules contain hard coded paths referencing the host
build system. This is usually because the source code contains __FILE__
at some place. This prevents binary reproducibility. However, some compiler=
s
allow remapping of the __FILE__ value. If we detect the compiler is capable
of doing this, we replace the source path $(S) part of __FILE__ by a string=
 "/kernel-source".
For example:

Is this not something we should do globally?

Ross

--_000_6E51916E4A1F32428260031F4C7CD2B61195C6DEORSMSX112amrcor_
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
10pt;">Quite possibly. However, the biggest abuser of __FILE__ seems to be =
kernel and kernel_modules.<br>
<br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div id=3D"divRpF80446" style=3D"direction: ltr;"><font size=3D"2" color=3D=
"#000000" face=3D"Tahoma"><b>From:</b> Burton, Ross [ross.burton@intel.com]=
<br>
<b>Sent:</b> Thursday, May 18, 2017 2:10 PM<br>
<b>To:</b> Bystricky, Juro<br>
<b>Cc:</b> OE-core; Purdie, Richard; Joshua G Lock; Juro Bystricky<br>
<b>Subject:</b> Re: [PATCH] kernel.bbclass: improve reproducibility<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 18 May 2017 at 22:05, Juro Bystricky <span di=
r=3D"ltr">
&lt;<a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.byst=
ricky@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div id=3D":1v4" class=3D"a3s aXjCH m15c1d618d19a5dbb">Kernel and kernel mo=
dules contain hard coded paths referencing the host<br>
build system. This is usually because the source code contains __FILE__<br>
at some place. This prevents binary reproducibility. However, some compiler=
s<br>
allow remapping of the __FILE__ value. If we detect the compiler is capable=
<br>
of doing this, we replace the source path $(S) part of __FILE__ by a string=
 &quot;/kernel-source&quot;.<br>
For example:<br>
</div>
</blockquote>
</div>
<br>
Is this not something we should do globally?</div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">Ross</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_6E51916E4A1F32428260031F4C7CD2B61195C6DEORSMSX112amrcor_--
