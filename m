Return-Path: <helio.castro@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id AF99F7320F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 16:24:19 +0000 (UTC)
Received: from ulm-dc01.bmw-carit.intra ([172.20.0.50]:59400
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Helio.Castro@bmw-carit.de>)
	id 1aePrM-0004TE-1h; Fri, 11 Mar 2016 17:24:17 +0100
Received: from ULM-DC01.bmw-carit.intra ([fe80::d6c:bfcc:5f:52a5]) by
	ULM-DC01.bmw-carit.intra ([fe80::d6c:bfcc:5f:52a5%13]) with mapi id
	14.03.0123.003; Fri, 11 Mar 2016 17:24:16 +0100
X-CTCH-RefID: str=0001.0A0B0204.56E2F131.0348, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Helio Chissini De Castro <Helio.Castro@bmw-carit.de>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] gcc: Fix the license on GNU OpenMP
Thread-Index: AQHRe6HQFhaaYbwdx0S851F6NE1r8J9UUEUAgAAFSYCAAAFDAIAAAoWAgAATGHg=
Date: Fri, 11 Mar 2016 16:24:15 +0000
Message-ID: <95245B46D926B348AEB132E99037C59B36A9FE73@ULM-DC01.bmw-carit.intra>
References: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
	<CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
	<1FC09834-DC8A-477D-9C9F-B6D469A7E90E@gmail.com>
	<CAJTo0LaoVn5ixhYy-2cHf-FGSthY3Fa9Z9ryg6j0hLp2KSLLtg@mail.gmail.com>,
	<7AB4B008-780B-4619-A914-7A00D132FCF0@gmail.com>
In-Reply-To: <7AB4B008-780B-4619-A914-7A00D132FCF0@gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.20.205]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 11 Mar 2016 16:24:22 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_95245B46D926B348AEB132E99037C59B36A9FE73ULMDC01bmwcarit_"

--_000_95245B46D926B348AEB132E99037C59B36A9FE73ULMDC01bmwcarit_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

If i change recipe scope, need to be on each gcc_${PV}.inc.
But they include gcc-common.inc on top, which states LICENSE =3D "GPL"

So, gcc_${PV}.inc is already overriding the original license. If you think =
is ok, i can do that on gcc_${PV}.inc

[]'s

--
BMW Car IT GmbH
Helio Chissini de Castro
Systems Integrator Engineer
Lise-Meitner-Str.14
89081 Ulm
Mobil: +49 176 25435150
Mail: helio.castro@bmw-carit.de
Web: http://www.bmw-carit.de
________________________________
From: Khem Raj [raj.khem@gmail.com]
Sent: Friday, March 11, 2016 5:11 PM
To: Burton, Ross
Cc: Helio Chissini De Castro; OE-core
Subject: Re: [OE-core] [PATCH] gcc: Fix the license on GNU OpenMP


On Mar 11, 2016, at 11:02 PM, Burton, Ross <ross.burton@intel.com<mailto:ro=
ss.burton@intel.com>> wrote:


2016-03-11 15:58 GMT+00:00 Khem Raj <raj.khem@gmail.com<mailto:raj.khem@gma=
il.com>>:
-----BEGIN PGP MESSAGE-----
Comment: GPGTools - https://gpgtools.org<https://gpgtools.org/>

hQQOA1XJCHN89ZWPEA//byr/rrxGxNNYYivYsGFBs4h6XrUzdqBCsw2FuyseGKJ1
XkZUtuH7f39QYY63OoqFhFdVmy3Hil3wscxe38L6/DA8hQV9Csn4cOxEfp9UF5jj
+3QJg/xqk7cgXTLuoUen9JZQHZgnG6+IfBg6jJARCKTmcs8aCT8WU2DYWycGCGg5

Can you send it non-encrypted? :)

patch is ok. It was an oversight that its fixing.


Ross


--_000_95245B46D926B348AEB132E99037C59B36A9FE73ULMDC01bmwcarit_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1" class=3D"" style=3D"word-wrap:break-word">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">If i change recipe scope, need to be on each gcc_${PV}.inc.<br>
But they include gcc-common.inc on top, which states LICENSE =3D &quot;GPL&=
quot;<br>
<br>
So, gcc_${PV}.inc is already overriding the original license. If you think =
is ok, i can do that on gcc_${PV}.inc<br>
<br>
[]'s<br>
<div><br>
<div style=3D"font-family:Tahoma; font-size:13px"><font size=3D"2"><span st=
yle=3D"font-size:10pt">--
<br>
BMW Car IT GmbH<br>
Helio Chissini de Castro<br>
Systems Integrator Engineer<br>
Lise-Meitner-Str.14<br>
89081 Ulm<br>
Mobil: &#43;49 176 25435150<br>
Mail: helio.castro@bmw-carit.de<br>
Web: <a href=3D"http://www.bmw-carit.de" target=3D"_blank">http://www.bmw-c=
arit.de</a></span></font></div>
</div>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div style=3D"direction: ltr;" id=3D"divRpF342559"><font face=3D"Tahoma" co=
lor=3D"#000000" size=3D"2"><b>From:</b> Khem Raj [raj.khem@gmail.com]<br>
<b>Sent:</b> Friday, March 11, 2016 5:11 PM<br>
<b>To:</b> Burton, Ross<br>
<b>Cc:</b> Helio Chissini De Castro; OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH] gcc: Fix the license on GNU OpenMP<br=
>
</font><br>
</div>
<div></div>
<div><br class=3D"">
<div>
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On Mar 11, 2016, at 11:02 PM, Burton, Ross &lt;<a href=3D"m=
ailto:ross.burton@intel.com" class=3D"" target=3D"_blank">ross.burton@intel=
.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D"">
<div dir=3D"ltr" class=3D"">
<div class=3D"gmail_extra"><br class=3D"">
<div class=3D"gmail_quote">2016-03-11 15:58 GMT&#43;00:00 Khem Raj <span di=
r=3D"ltr" class=3D"">
&lt;<a href=3D"mailto:raj.khem@gmail.com" class=3D"" target=3D"_blank">raj.=
khem@gmail.com</a>&gt;</span>:<br class=3D"">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div id=3D":ao7" class=3D"a3s" style=3D"overflow:hidden">-----BEGIN PGP MES=
SAGE-----<br class=3D"">
Comment: GPGTools - <a href=3D"https://gpgtools.org/" rel=3D"noreferrer" cl=
ass=3D"" target=3D"_blank">
https://gpgtools.org</a><br class=3D"">
<br class=3D"">
hQQOA1XJCHN89ZWPEA//byr/rrxGxNNYYivYsGFBs4h6XrUzdqBCsw2FuyseGKJ1<br class=
=3D"">
XkZUtuH7f39QYY63OoqFhFdVmy3Hil3wscxe38L6/DA8hQV9Csn4cOxEfp9UF5jj<br class=
=3D"">
&#43;3QJg/xqk7cgXTLuoUen9JZQHZgnG6&#43;IfBg6jJARCKTmcs8aCT8WU2DYWycGCGg5<br=
 class=3D"">
</div>
</blockquote>
</div>
<br class=3D"">
Can you send it non-encrypted? :)</div>
</div>
</div>
</blockquote>
<div><br class=3D"">
</div>
<div>patch is ok. It was an oversight that its fixing.</div>
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">
<div dir=3D"ltr" class=3D"">
<div class=3D"gmail_extra"><br class=3D"">
</div>
<div class=3D"gmail_extra">Ross</div>
</div>
</div>
</blockquote>
</div>
<br class=3D"">
</div>
</div>
</div>
</body>
</html>

--_000_95245B46D926B348AEB132E99037C59B36A9FE73ULMDC01bmwcarit_--
