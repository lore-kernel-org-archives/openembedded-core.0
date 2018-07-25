Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4596B6076F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 00:35:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6P0ZdN3029091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 17:35:39 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.252]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0399.000;
	Tue, 24 Jul 2018 17:35:38 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: aclocal question
Thread-Index: AdQjrtfO4uwrWD9DRYG8sSQLeNF2PQ==
Date: Wed, 25 Jul 2018 00:35:37 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F350E9CD@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.51]
MIME-Version: 1.0
Subject: aclocal question
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
X-List-Received-Date: Wed, 25 Jul 2018 00:35:39 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_007BD92917A2324FA403BCF9A464CF84F350E9CDALAMBDcorpadwrs_"

--_000_007BD92917A2324FA403BCF9A464CF84F350E9CDALAMBDcorpadwrs_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

aclocal can generate rather large command lines (194000 characters) when ca=
lling autom4te to trace macros.  I think that this breaks at a little beyon=
d the argument length I've mentioned.  I'm not familiar with this code but =
I think the bulk of the items could be piped into autom4te rather than the =
way it is done now.  This might not solve the problem but I wondered if any=
one has looked at this issue.

Specifically, we have seen failures when building libvirt for a project wit=
h a long pathname.

Joe


--_000_007BD92917A2324FA403BCF9A464CF84F350E9CDALAMBDcorpadwrs_
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
10pt;">aclocal can generate rather large command lines (194000 characters) =
when calling autom4te to trace macros. &nbsp;I think that this breaks at a =
little beyond the argument length I've
 mentioned. &nbsp;I'm not familiar with this code but I think the bulk of t=
he items could be piped into autom4te rather than the way it is done now. &=
nbsp;This might not solve the problem but I wondered if anyone has looked a=
t this issue.
<div><br>
</div>
<div>Specifically, we have seen failures when building libvirt for a projec=
t with a long pathname.<br>
<div><br>
</div>
<div>Joe</div>
<div><br>
</div>
</div>
</div>
</body>
</html>

--_000_007BD92917A2324FA403BCF9A464CF84F350E9CDALAMBDcorpadwrs_--
