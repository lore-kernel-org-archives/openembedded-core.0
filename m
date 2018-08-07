Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 304B578A8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 00:24:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w770OwAf013917
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2018 17:24:58 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.117]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0399.000;
	Mon, 6 Aug 2018 17:24:57 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: when is native.bbclass applied
Thread-Index: AdQt5RGZ/B8SRVL+TK+5W6otLsimWQ==
Date: Tue, 7 Aug 2018 00:24:57 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F3610608@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.214]
MIME-Version: 1.0
Subject: when is native.bbclass applied
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
X-List-Received-Date: Tue, 07 Aug 2018 00:24:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_007BD92917A2324FA403BCF9A464CF84F3610608ALAMBDcorpadwrs_"

--_000_007BD92917A2324FA403BCF9A464CF84F3610608ALAMBDcorpadwrs_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This class clobbers a number of things that might be manipulated in a recip=
e.  If, say, I want to add something to CXXFLAGS, what/where do I put it?  =
It looks like "_append" works, but "+=3D" might not.

Joe


--_000_007BD92917A2324FA403BCF9A464CF84F3610608ALAMBDcorpadwrs_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle"></style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">This class clobbers a number of things that might be manipulated in =
a recipe. &nbsp;If, say, I want to add something to CXXFLAGS, what/where do=
 I put it? &nbsp;It looks like &quot;_append&quot; works,
 but &quot;&#43;=3D&quot; might not.
<div><br>
</div>
<div>Joe</div>
<div><br>
</div>
</div>
</body>
</html>

--_000_007BD92917A2324FA403BCF9A464CF84F3610608ALAMBDcorpadwrs_--
