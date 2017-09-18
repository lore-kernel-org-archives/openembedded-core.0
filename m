Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A7D637198A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 21:11:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8ILBQN0012743
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Sep 2017 14:11:26 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.180]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Mon, 18 Sep 2017 14:11:25 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"matt@madison.systems" <matt@madison.systems>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: go-runtime does not build for mips32r2 tune
Thread-Index: AdMwwowE+PTUWsdOR36n+wXkbgY95Q==
Date: Mon, 18 Sep 2017 21:11:24 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF41E3E8@ALA-MBC.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.158]
MIME-Version: 1.0
Subject: go-runtime does not build for mips32r2 tune
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
X-List-Received-Date: Mon, 18 Sep 2017 21:11:28 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_007BD92917A2324FA403BCF9A464CF84CF41E3E8ALAMBCcorpadwrs_"

--_000_007BD92917A2324FA403BCF9A464CF84CF41E3E8ALAMBCcorpadwrs_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This is the default tune for qemumips.  It appears that the problem does no=
t occur for an oe-core checkout just before the split creating go-runtime.

Before the split, go-helloworld will build, but after the split it will not=
 because it needs go-runtime.

Joe

--_000_007BD92917A2324FA403BCF9A464CF84CF41E3E8ALAMBCcorpadwrs_
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
10pt;">This is the default tune for qemumips. &nbsp;It appears that the pro=
blem does not occur for an oe-core checkout just before the split creating =
go-runtime.
<div><br>
</div>
<div>Before the split, go-helloworld will build, but after the split it wil=
l not because it needs go-runtime.</div>
<div><br>
</div>
<div>Joe</div>
</div>
</body>
</html>

--_000_007BD92917A2324FA403BCF9A464CF84CF41E3E8ALAMBCcorpadwrs_--
