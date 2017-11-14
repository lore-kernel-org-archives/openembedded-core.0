Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 402 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Nov 2017 15:46:58 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.193])
	by mail.openembedded.org (Postfix) with ESMTP id AF229784FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 15:46:58 +0000 (UTC)
Received: from [216.82.241.196] by server-1.bemta-8.messagelabs.com id
	A8/DA-01711-26E0B0A5; Tue, 14 Nov 2017 15:40:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRWlGSWpSXmKPExsXi5LtOQDeRjzv
	K4NxmdYu9nxYxWtz5+Y7dgclj56y77B7nNq5gDGCKYs3MS8qvSGDNOHTgFWvBK+mKM/PWsDUw
	bpfsYuTiEBJYzSix/n8jC4SzhlHi78J/UM4SRommLx2sXYycHGwChhITPn1iA7FFBKIkbu56x
	g5iMwPFX31eBlYjLKAl8frhWqgafYkNb6awQNh6EucfbgWrYRFQlfjaMoMZxOYV8JW4c/cXWA
	2jgKzEl8bVzBAzxSVuPZnPBGJLCAhILNlznhnCFpV4+fgfK4StILGw4xxQnAOoPk/icb8ZxEh
	BiZMzn4CNFBJQkdhw4zfTBEbhWUimzkLomIWkA6JER2LB7k9sELa2xLKFr5lh7DMHHjMhiy9g
	ZF/FqFGcWlSWWqRrYqiXVJSZnlGSm5iZo2toYKGXm1pcnJiempOYVKyXnJ+7iREYW/UMDIw7G
	F8viz7EKMnBpCTKq/KZPUqILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG8oL3eUkGBRanpqRVpmDj
	DKYdISHDxKIryCIGne4oLE3OLMdIjUKUZLjg037/5h4tgHJp/NfN3ALMSSl5+XKiXOywTSIAD
	SkFGaBzcOloguMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmZQeZwpOZVwK39RXQQUxAB0mB
	/MJbXJKIkJJqYNRtUF2QoJ+X/NpA9tVF4YOL/Zc1JPNoPTPk+x0QxJHF8HGKlLXUFVGNXBVOO
	1vnanY/7zf/jv2pdDoZabDruRPTNul4Zb+Thfd68u83npFP+PnycP3fhJMzOUSkU1QjZs5Tak
	29VH1r79+er/f3uJh17Gg9/jPfadm/rrz3LPMTSgWZWd7cUWIpzkg01GIuKk4EAPAppzs/AwA
	A
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-5.tower-46.messagelabs.com!1510674017!80969057!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7575 invoked from network); 14 Nov 2017 15:40:17 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-5.tower-46.messagelabs.com with SMTP;
	14 Nov 2017 15:40:17 -0000
Received: from MTK-SMS-XCH04.digi.com (10.10.8.198) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 14 Nov 2017 09:40:14 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MTK-SMS-XCH04.digi.com
	(10.10.8.198) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 14 Nov 2017 09:40:14 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0361.001;
	Tue, 14 Nov 2017 16:40:12 +0100
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [Morty backports] tcf-agent fixes
Thread-Index: AdNdXsbNMtjZiS34TK+cUbsRCPYfxg==
Date: Tue, 14 Nov 2017 15:40:12 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB016B7958@dor-sms-xch01.digi.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.195]
MIME-Version: 1.0
Subject: [Morty backports] tcf-agent fixes
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
X-List-Received-Date: Tue, 14 Nov 2017 15:46:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DA8287CC96892A4EB4FCF4FB3FBDA1AB016B7958dorsmsxch01digi_"

--_000_DA8287CC96892A4EB4FCF4FB3FBDA1AB016B7958dorsmsxch01digi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

There are a couple of commits in master fixing the tcf-agent bootscript and=
 systemd service files so the daemon is properly kill on reboot/shutdown.

This is failing also in past stable releases.

At least for Morty the cherry-picks apply just fine.

So could you do the cherry-picks for Morty?

git cherry-pick b33356d168c0fec9b2df387b51240fa6566ca145
git cherry-pick b467a22729bea886d7bde976c9606ac8e4589cde

--
Thanks.

Javier Viguera


--_000_DA8287CC96892A4EB4FCF4FB3FBDA1AB016B7958dorsmsxch01digi_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:70.85pt 85.05pt 70.85pt 85.05pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There are a couple of commits in master fixing the t=
cf-agent bootscript and systemd service files so the daemon is properly kil=
l on reboot/shutdown.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is failing also in past stable releases.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">At least for Morty the cherry-picks apply just fine.=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">So could you do the cherry-picks for Morty?<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">git cherry-pick b33356d168c0fec9b2df387b51240fa6566c=
a145<o:p></o:p></p>
<p class=3D"MsoNormal">git cherry-pick b467a22729bea886d7bde976c9606ac8e458=
9cde<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">--<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Javier Viguera<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DA8287CC96892A4EB4FCF4FB3FBDA1AB016B7958dorsmsxch01digi_--
