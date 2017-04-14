Return-Path: <prvs=1277e14ec7=michael.davis@essvote.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Apr 2017 17:04:35 UTC
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 98BEF71D60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 17:04:35 +0000 (UTC)
X-AuditID: 0a000213-badff70000000cd7-af-58f0fd9b7ee5
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	CB.FA.03287.B9DF0F85; Fri, 14 Apr 2017 11:49:34 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Fri, 14 Apr 2017 11:49:31 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Handling of users in multiple recipes.
Thread-Index: AdK1PxWWSCa1wwjvQtySgGBeAPCedw==
Date: Fri, 14 Apr 2017 16:49:30 +0000
Message-ID: <655290B7709079438B7932553958E60D16D199CA@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsWyRiBPQ3fe3w8RBrencVjc+fmO3YHR49zG
	FYwBjFHcNkmJJWXBmel5+nYJ3BmLv/9kK/gkVbHmyQymBsb54l2MnBwSAiYSnYvms3UxcnEI
	CZxglNh67RuUM4tR4tbiXawgVWwCRhLnrm9iBLFFBKIlls6Yyd7FyMEhLKAv8bnVDSJsInH7
	2AsWCFtP4sOaJ2wgJSwCqhJ3VtmDhHkFgiRWXXvCDGIzCohJfD+1hgnEZhYQl7j1ZD4TxD0C
	Ekv2nGeGsEUlXj7+xwphy0m8a2pjhajPl/j84TI7xExBiZMzn7BMYBSchWTULCRls5CULWBk
	XsUomJuYmWOol1pcXJZfkqqXnJ+7iREYklwMTMI7GOdMsT3EKMDBqMTDe+H4hwgh1sSy4src
	Q4zSHCxK4rxnOYIjhATSE0tSs1NTC1KL4otKc1KLDzEycXAeYpTg4JISKU7NS0ktSiwtyYgH
	BX58MTD0pRoYORJncEZttVZccLPjSIYNj8nXh69Ou/1+zVsQlPRIemJvXEBkxLSH7Pf4vt1Y
	Yh7jwLix4ZiCWEEy44aUo3N03ZPVjjwJftP1/MvFL6UOEe6PmN9ylN3Mn7nj+75WRb7TG44e
	LrV2Tb5k0eJnLa56o1rE6KXBiu4/b75kvX1sWOHkn3q/5MMvJZbijERDLeai4kQAhs5S1EUC
	AAA=
Subject: Handling of users in multiple recipes.
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
X-List-Received-Date: Fri, 14 Apr 2017 17:04:36 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60D16D199CAESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60D16D199CAESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a user that is added in a recipe using inherit useradd.
Previously in Morty I was able to include that recipe as a dependency to ot=
her recipes and chown files to that user during do_install.
In checking at master in prep for 2.3 I noticed those recipes no longer wor=
k stating the user is invalid.

Is there a new mechanism in place to handle this use case or am I going to =
have to find some sort of other work around?

Thanks,
Mike




--_000_655290B7709079438B7932553958E60D16D199CAESSEX01essvotec_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
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
	{mso-style-type:export-only;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"Section1">
<p class=3D"MsoNormal">I have a user that is added in a recipe using inheri=
t useradd.<o:p></o:p></p>
<p class=3D"MsoNormal">Previously in Morty I was able to include that recip=
e as a dependency to other recipes and chown files to that user during do_i=
nstall.<o:p></o:p></p>
<p class=3D"MsoNormal">In checking at master in prep for 2.3 I noticed thos=
e recipes no longer work stating the user is invalid.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there a new mechanism in place to handle this use=
 case or am I going to have to find some sort of other work around?<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Mike<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60D16D199CAESSEX01essvotec_--
