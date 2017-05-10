Return-Path: <prvs=330334169f=michael.davis@essvote.com>
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 83BFE71ADA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 22:33:28 +0000 (UTC)
X-AuditID: 0a000213-dcfff7000000261c-5f-591395366eac
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	64.9F.09756.63593195; Wed, 10 May 2017 17:33:29 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Wed, 10 May 2017 17:33:26 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "Davis, Michael" <michael.davis@essvote.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-CORE][morty]NPM and BB_NO_NETWORK
Thread-Index: AdLJxj1Obgqj+er6SPqlR+8N61A7sQAFwu6w
Date: Wed, 10 May 2017 22:33:26 +0000
Message-ID: <655290B7709079438B7932553958E60D16D2CAD4@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: A6GD BoKk CHV/ C8Xg E5Rt GUpU GYPt HuIs H7nP ICEn IXLh
	IlvN IyzP Kq7P LleV MbE1; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBjAG8AcgBlAEAAbABpAHMAdABzAC4AbwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALgBvAHIAZwA=;
	Sosha1_v1; 7; {E969F1EC-B239-4319-B69B-E6739FD21257};
	bQBpAGMAaABhAGUAbAAuAGQAYQB2AGkAcwBAAGUAcwBzAHYAbwB0AGUALgBjAG8AbQA=;
	Wed, 10 May 2017 22:33:23 GMT;
	UgBFADoAIABbAE8ARQAtAEMATwBSAEUAXQBbAG0AbwByAHQAeQBdAE4AUABNACAAYQBuAGQAIABCAEIAXwBOAE8AXwBOAEUAVABXAE8AUgBLAA==
x-cr-puzzleid: {E969F1EC-B239-4319-B69B-E6739FD21257}
x-originating-ip: [10.1.20.77]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWyRiBPQ9dyqnCkwc81zBZ3fr5jd2D0OLdx
	BWMAYxS3TVJiSVlwZnqevl0Cd8ahl70sBQ99KxqnT2RvYJzk0sXIySEhYCKx/M5R1i5GLg4h
	gROMEl1vr0M5sxglTv84zwJSxSZgJHHu+iZGkISIQDejxPXmX0xdjBwcwkCJXe+ZQUwRAWOJ
	M/viQcpFgKI33i5mArFZBFQlFv9pArN5BYIkvu7bxAxiMwqISXw/tQYsziwgLnHryXwmiIME
	JJbsOc8MYYtKvHz8D+weCYEHzBKHjl1hAdklIWAq8bwlB6JGTuJdUxsrxJx8iRNnN7FB7BKU
	ODnzCcsERuFZSFbMQlI2C0nZAkbmVYyCuYmZOYZ6qcXFZfklqXrJ+bmbGIFBzMXAJLyDcc4U
	20OMAhyMSjy8F/iEI4VYE8uKK3MPMUpzsCiJ8z5byRwpJJCeWJKanZpakFoUX1Sak1p8iJGJ
	g/MQowQHl5RIcWpeSmpRYmlJRjwoVuKLgdEi1cDYl7T50pmjn1tmCZcX96+2sI3OzA9I4Hte
	bT+Bx31b+IfotYlxTh6PImu7J7OJGN7oONl7h8HXYWbg+h+2qg+4c+JWX3r2I1FaYpnw/6IJ
	3JlxZ2xm7DN8cb2ky+UsV+OdAMsVdw7NkOESfLtqwemYbXXnAo0cPO98Kl+8wst8Ke+ElYsy
	pvYrsRRnJBpqMRcVJwIAa+ULDF4CAAA=
Subject: Re: [morty]NPM and BB_NO_NETWORK
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
X-List-Received-Date: Wed, 10 May 2017 22:33:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60D16D2CAD4ESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60D16D2CAD4ESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I created a fix for this, but I don't know enough about the architecture / =
language to say if it is a good fix or an ugly hack.
Any help or suggestion would be great thanks.


diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__in=
it__.py
index cd7362c..c5ab459 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -393,7 +393,8 @@ def decodeurl(url):
                     raise MalformedUrl(url, "The URL: '%s' is invalid: par=
ameter %s does not specify a value (missing '=3D')" % (url, s))
                 s1, s2 =3D s.split('=3D')
                 p[s1] =3D s2
-
+                if type =3D=3D 'npm' and s1 =3D=3D 'name':
+                    path =3D '/' + s2
     return type, host, urllib.parse.unquote(path), user, pswd, p

---
Mike


From: Davis, Michael
Sent: Wednesday, May 10, 2017 2:47 PM
To: 'openembedded-core@lists.openembedded.org'
Subject: [OE-CORE][morty]NPM and BB_NO_NETWORK

I am having an issue with npm sources and BB_GENERATE_MIRROR_TARBALLS.
The tarballs generate fine, but then when you try to use them with prefetch=
 only or no network the system won't find them.
It then tries to download them.   Tried it both on morty and master with th=
e same issue.

This is my first real python experience, but I think I got it tracked down =
to uri_replace.

Example debug line of a working git replace vs a non working npm one.

DEBUG: For url ['git', 'git.yoctoproject.org', '/psplash', '', '', OrderedD=
ict()] comparing ['git', '.*', '/.*', '', '', OrderedDict()] to ['file', ''=
, '/build/downloads/', '', '', OrderedDict()]
DEBUG: For url git://git.yoctoproject.org/psplash returning file:///build/d=
ownloads/git2_git.yoctoproject.org.psplash.tar.gz<file:///\\build\downloads=
\git2_git.yoctoproject.org.psplash.tar.gz>

DEBUG: For url ['npm', 'registry.npmjs.org', '', '', '', OrderedDict([('nam=
e', 'nopt'), ('version', '3.0.6'), ('subdir', 'node_modules/nopt')])] compa=
ring ['npm', '.*', '/.*', '', '', OrderedDict()] to ['file', '', '/build/do=
wnloads/', '', '', OrderedDict()]

Don't know if maybe the OrderedDict vs the path is causing the issue or not=
.


--_000_655290B7709079438B7932553958E60D16D2CAD4ESSEX01essvotec_
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
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I created a fix for th=
is, but I don&#8217;t know enough about the architecture / language to say =
if it is a good fix or an ugly hack.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Any help or suggestion=
 would be great thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">diff --git a/bitbake/l=
ib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">index cd7362c..c5ab459=
 100644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">--- a/bitbake/lib/bb/f=
etch2/__init__.py<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&#43;&#43; b/bitb=
ake/lib/bb/fetch2/__init__.py<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">@@ -393,7 &#43;393,8 @=
@ def decodeurl(url):<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; raise MalformedUrl(url, &quot;The URL: '%s' is inva=
lid: parameter %s does not specify a value (missing '=3D')&quot; % (url, s)=
)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
s1, s2 =3D s.split('=3D')<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
p[s1] =3D s2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">-<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f type =3D=3D 'npm' and s1 =3D=3D 'name':<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&#43;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; path =3D '/' &#43; s2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p; return type, host, urllib.parse.unquote(path), user, pswd, p<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">---<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Mike<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Davis, M=
ichael
<br>
<b>Sent:</b> Wednesday, May 10, 2017 2:47 PM<br>
<b>To:</b> 'openembedded-core@lists.openembedded.org'<br>
<b>Subject:</b> [OE-CORE][morty]NPM and BB_NO_NETWORK<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am having an issue with npm sources and BB_GENERAT=
E_MIRROR_TARBALLS.<o:p></o:p></p>
<p class=3D"MsoNormal">The tarballs generate fine, but then when you try to=
 use them with prefetch only or no network the system won&#8217;t find them=
.<o:p></o:p></p>
<p class=3D"MsoNormal">It then tries to download them.&nbsp;&nbsp; Tried it=
 both on morty and master with the same issue.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is my first real python experience, but I think=
 I got it tracked down to uri_replace.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Example debug line of a working git replace vs a non=
 working npm one.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">DEBUG: For url ['git', 'git.yoctoproject.org', '/psp=
lash', '', '', OrderedDict()] comparing ['git', '.*', '/.*', '', '', Ordere=
dDict()] to ['file', '', '/build/downloads/', '', '', OrderedDict()]<o:p></=
o:p></p>
<p class=3D"MsoNormal">DEBUG: For url git://git.yoctoproject.org/psplash re=
turning <a href=3D"file:///\\build\downloads\git2_git.yoctoproject.org.pspl=
ash.tar.gz">
file:///build/downloads/git2_git.yoctoproject.org.psplash.tar.gz</a><o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">DEBUG: For url ['npm', 'registry.npmjs.org', '', '',=
 '', OrderedDict([('name', 'nopt'), ('version', '3.0.6'), ('subdir', 'node_=
modules/nopt')])] comparing ['npm', '.*', '/.*', '', '', OrderedDict()] to =
['file', '', '/build/downloads/',
 '', '', OrderedDict()]<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Don&#8217;t know if maybe the OrderedDict vs the pat=
h is causing the issue or not.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60D16D2CAD4ESSEX01essvotec_--
