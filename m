Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CAD64784A2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 18:30:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Feb 2018 10:30:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,469,1511856000"; 
	d="scan'208,217";a="199100987"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by orsmga005.jf.intel.com with ESMTP; 06 Feb 2018 10:30:04 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.11]) by
	ORSMSX101.amr.corp.intel.com ([169.254.8.72]) with mapi id
	14.03.0319.002; Tue, 6 Feb 2018 10:30:04 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Christopher Larson <kergoth@gmail.com>
Thread-Topic: [OE-core] [PATCH] glibc: improve reproducibility with multilib
Thread-Index: AQHTnq7kZV7MwKKBs0u6Ps0o6mCM06OXKPyAgACJ9t4=
Date: Tue, 6 Feb 2018 18:30:03 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B64053979C@ORSMSX112.amr.corp.intel.com>
References: <1517855199-67449-1-git-send-email-juro.bystricky@intel.com>,
	<CABcZANndhca9KF9V-kRCTNWUniv+J3jW+GKii_LE0jJn3GcMGA@mail.gmail.com>
In-Reply-To: <CABcZANndhca9KF9V-kRCTNWUniv+J3jW+GKii_LE0jJn3GcMGA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.46]
MIME-Version: 1.0
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: improve reproducibility with multilib
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
X-List-Received-Date: Tue, 06 Feb 2018 18:30:03 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_6E51916E4A1F32428260031F4C7CD2B64053979CORSMSX112amrcor_"

--_000_6E51916E4A1F32428260031F4C7CD2B64053979CORSMSX112amrcor_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


> This =93| xargs=94 at the end seems redundant. xargs what? xargs is used =
to run a command on each word of > the input..

It forces the words into one line:

$ echo "zebra fox elephant elephant lion wolf fox " | xargs -n1 | sort -u |=
 xargs
elephant fox lion wolf zebra

$echo "zebra fox elephant elephant lion wolf fox " | xargs -n1 | sort -u
elephant
fox
lion
wolf
zebra



--_000_6E51916E4A1F32428260031F4C7CD2B64053979CORSMSX112amrcor_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" id=3D"owaParaStyle">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;"><br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra">
<div class=3D"gmail_quote">&gt; This =93| xargs=94 at the end seems redunda=
nt. xargs what? xargs is used to run a command on each word of &gt; the inp=
ut..
</div>
<br>
It forces the words into one line:<br>
<br>
$ echo &quot;zebra fox elephant elephant lion wolf fox &quot; | xargs -n1 |=
 sort -u | xargs<br>
elephant fox lion wolf zebra<br>
<br>
$echo &quot;zebra fox elephant elephant lion wolf fox &quot; | xargs -n1 | =
sort -u <br>
elephant<br>
fox<br>
lion<br>
wolf<br>
zebra<br>
<br>
<br>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_6E51916E4A1F32428260031F4C7CD2B64053979CORSMSX112amrcor_--
