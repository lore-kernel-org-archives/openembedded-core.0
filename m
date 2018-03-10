Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E528E780F3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 18:28:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2018 10:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,451,1515484800"; d="scan'208,217";a="26925731"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2018 10:28:21 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.175]) by
	ORSMSX104.amr.corp.intel.com ([169.254.4.210]) with mapi id
	14.03.0319.002; Sat, 10 Mar 2018 10:28:20 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [morty][PATCH v2] gcc6.4 upgrade
Thread-Index: AQHTuAFVGDs1nNZG2ECrkqALBGmGIqPJODQA//+AITWAAJRbgIAAF7cAgABlneM=
Date: Sat, 10 Mar 2018 18:28:19 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64C66B768@ORSMSX112.amr.corp.intel.com>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sqVAhoAK-Op+fg+kkA2HvH3h_acvEN=qckH3A5-tJEF8A@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B28D@ORSMSX112.amr.corp.intel.com>
	<CAJ86T=VUgB7mWM7mrSGpHPipWy5v6bir3Puz6Wz2C7QAD2cJ3g@mail.gmail.com>,
	<CAMKF1sq9wfRTcgo-vZLW2pVSVu2mbq9qtuAfK5WxFv5GRbrQKQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq9wfRTcgo-vZLW2pVSVu2mbq9qtuAfK5WxFv5GRbrQKQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.46]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] gcc6.4 upgrade
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
X-List-Received-Date: Sat, 10 Mar 2018 18:28:20 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B64C66B768ORSMSX112amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B64C66B768ORSMSX112amrcor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


________________________________

  - Today's morty-next is lacking one patch, which was added to oe-core
master as a backport (from gcc master) to gcc 6.3:

  http://git.openembedded.org/openembedded-core/commit/?id=3Dd2631f45a057c5=
3797b7ba657662f35f66a2b04e

I don't have any strong opinions on the patch, but presumably it fixed
some issue Khem was seeing, it still applies cleanly to gcc 6.4 and we
have it in rocko so on balance I'd say it should probably be in morty
too.

Yes this patch fixes an arm regression

I actually had to remove this patch,as it caused an ICE compiling valgrind =
for x86-64.  I will retest this patch with other distros to see if it is mo=
rty specific.


--_000_6E51916E4A1F32428260031F4C7CD2B64C66B768ORSMSX112amrcor_
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
10pt;"><br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<br>
<div>
<div>
<div class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
&nbsp; - Today's morty-next is lacking one patch, which was added to oe-cor=
e<br>
master as a backport (from gcc master) to gcc 6.3:<br>
<br>
&nbsp; <a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=
=3Dd2631f45a057c53797b7ba657662f35f66a2b04e" rel=3D"noreferrer" target=3D"_=
blank">
http://git.openembedded.org/openembedded-core/commit/?id=3Dd2631f45a057c537=
97b7ba657662f35f66a2b04e</a><br>
<br>
I don't have any strong opinions on the patch, but presumably it fixed<br>
some issue Khem was seeing, it still applies cleanly to gcc 6.4 and we<br>
have it in rocko so on balance I'd say it should probably be in morty<br>
too.<br>
</blockquote>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Yes this patch fixes an arm regression&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<br>
I actually had to remove this patch,as it caused an ICE compiling valgrind =
for x86-64.&nbsp; I will retest this patch with other distros to see if it =
is morty specific.<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_6E51916E4A1F32428260031F4C7CD2B64C66B768ORSMSX112amrcor_--
