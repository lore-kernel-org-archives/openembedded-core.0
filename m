Return-Path: <jefro.net@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 894D873FE4;
	Wed, 13 May 2015 17:34:40 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so57190006pab.2;
	Wed, 13 May 2015 10:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:reply-to:user-agent
	:mime-version:content-type;
	bh=raHAcQprRykV8EwtBVYd1v2LCMfo9dG57Bimua9RSbA=;
	b=AZLsN7Xv5ifvJ3Isjkn5qdP1stauU0ZDrCkltoD9tkZs+abKlnToB3U6h4MHexplN2
	/+AQVLPkXD8JVy4LfwW9dCbx0VfLTEKv0xUy1G9zlY6iqb56tLhR7DQPDESBk5EK8Pg0
	t8kYq9W8dCLmvsejvTkFplEEX2xrCvqdFNl1I0CtlX0D9ltUc7ySriocriKvPeHBtVTn
	ye2bnFPDzvW64D+c089pQ5Ys8NuSA9tCll6OCBWjFGGcUu8GnevZLKLjyEN3FSGKjYj0
	tdGQfxhKoQYo8+QBVJ4YsivJKXS96dGB1bLAw4zyV0AxQMlR5DaO/QXAsGi9U1x7reLn
	eRng==
X-Received: by 10.70.103.177 with SMTP id fx17mr16408pdb.11.1431538481853;
	Wed, 13 May 2015 10:34:41 -0700 (PDT)
Received: from [192.168.0.10] (50-0-152-82.dedicated.static.sonic.net.
	[50.0.152.82])
	by mx.google.com with ESMTPSA id p1sm19930056pdl.60.2015.05.13.10.34.39
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 May 2015 10:34:40 -0700 (PDT)
Sender: Jeff Osier-Mixon <jefro.net@gmail.com>
From: "Jeff Osier-Mixon" <jefro@jefro.net>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, tsc
	<tsc@lists.openembedded.org>
Date: Wed, 13 May 2015 17:34:36 +0000
Message-Id: <em3945207e-6e7c-4aac-b5f0-4704294a0c73@io>
User-Agent: eM_Client/6.0.21372.0
Mime-Version: 1.0
Subject: OEDAM Minutes: March 2015
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: Jeff Osier-Mixon <jefro@jefro.net>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 May 2015 17:34:41 -0000
Content-Type: multipart/alternative;
	boundary="------=_MBB830C9A7-E941-419E-ACA4-FE6577293BEA"

--------=_MBB830C9A7-E941-419E-ACA4-FE6577293BEA
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Minutes from the 2-day OE Developer's (American) Meeting in San Jose, CA=
=20
in March. All errors are mine. These are also posted on the OE wiki page=
=20
for OEDAM 2015.

OEDAM: OpenEmbedded Developer's (American) Meeting
March 27-28, 2015
_______________________________________________________________________
ATTENDANCE

in room:
mark hatle
michael halstead
bill mills
paul eggleton
denys dmitryenko
sean hudson
armin kuster
tim orling
philip balister
sona sarmadi
martin jansa
ken sharp
stephen arnold
changhyeok bae
herb kuta
benjamin esquivel
grant likely
jefro

phone:
richard purdie
belen barros pena
beth flanagan
bruce ashfield

(Apologies if I missed your name - jefro)
_______________________________________________________________________
AGENDA & SUMMARY

open issues & action items marked with =3D>

OEDAM 2014 summary
=3D>  Lava - kernel ci can use it, not required; YP QA team experimenting
=3D>  TSC role - board needs to run election, koen willing to be replaced
     why is embedded still hard - progress making it marginally easier
     layer quality - ongoing process
     lune - setup image replacement, spurred demo discussion
     next +1 - discussed
     local.conf from third parties -

Security
     testing security patches high priority, not all in one place
=3D>  sona proposed security mailing list for monitoring, patches, policy
     & agreed to investigate possible CVE database
     owner: sona & fray

Infrastructure
     github repos - obsolete repos going away June 30
         make it obvious github is a mirror
     OE-classic - keeping for historical reasons only
=3D>      read-only & rename to oe-classic? oe-obsolete?
=3D>      ok to disable push requests from github.com?
     owner: crofton

Layer maintenance
     build status reporting is better, incl. blacklisting bad recipes
     layer index is very positive, does not (yet?) report layer quality
     possible toaster integration in the future

Improving demos
     noted SDR demo in YP booth at ELC running on different SoCs
     html5/luna replacement for sato desired
     what is good for developers vs. what makes a good demo - discussion
=3D>  bmills suggested a monthly technical meeting to work on these issues
=3D>  jefro to schedule meeting about demos: test images, sato, etc
     identify problem, role of sato, suitable alternatives & usage cases

Patch review process
     RP outlined patch review process
     some aberrations in process illustrated - need tool improvement
     some resources could be put into improving patchwork
         to automate some processes that are currently manual
     paul suggests adding functionality tests
=3D>  general conclusion to focus on package managers, feeds, tools

=3D>  sources from bitbake world builds moving to new location
     crofton/michael will update DNS, should be invisible

Tests
     autobuilder provides many testing featuers, automated qemu, ptests
     OE self test doesn't run on autobuilder (takes too long)
=3D>  need more resources from community
     test mentoring helpful

Development cycle
     paul asks whether the current dev cycle works
     4-cycle system w/milestones (in YP) works well
     testing could be improved as per previous discussion
     some people still hold things back until last minute, RC process
     using smart for RPM:
=3D>  smart needs a new maintainer
     brief discussion about YP technical call - terse agenda & minutes
=3D>  jefro to work with sjolley to add RP's readout to minutes
     discussion about collecting sources for an OE source mirror

# packages
     armin asks, should there be a limit on packages in OE
     fray & RP suggest OE has a self-imposed feature limit, by testing
=3D>  discuss within TSC

documentation
     more technical documentation resources needed
=3D>  crofton to mention to Advisory Board

OE eV
     SPI working well
     changing eV structure, sean streamlining, possibly moving to US
     next GA & possible OEDEM after ELCE in October/Dublin

Community Development / Team Building
     Intro / crash course events
=3D>      jefro to investigate materials, resources for promotion
     Coordinated bug day sprints
         note: general feeling that janitors list is misnamed
=3D>      jefro - remind stephen to add triage info to bug list
=3D>      crofton/paul - set up bug day US a.m., UK/EU afternoon
         separate event for Asia
=3D>      jefro - investigate webinar format
     website/wiki
         wiki cleanup needed, Jack's front page work?
=3D>      jefro - organize as board/TSC administrative issue
     TSC meetings
         communication has been very important, now missing
=3D>      organize issues & meetings every 2 months
     community metrics
=3D>      jefro - work with board
     Other group/meetup activities
         openhatch, internship programs like opw
=3D>      all - contribute to Stack Overflow support/discussions


next OEDAM concurrent with ELC in San Diego, March 2016
_______________________________________________________________________
DETAIL

Full text minutes available at:
http://pastebin.com/jpAFDUCy
or
https://docs.google.com/document/d/16cueQXzrpvzhL7lzLiQxf5NZ4STYDffK0M3OLul=
0Fys/edit?usp=3Dsharing

Full audio recording available on request (allow time for uploading)

--------=_MBB830C9A7-E941-419E-ACA4-FE6577293BEA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<STYLE id=3DeMClientCss>blockquote.cite { margin-left: 5px; margin-right:=
 0px; padding-left: 10px; padding-right:0px; border-left: 1px solid #cccccc=
 }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; paddin=
g-top: 0px; }
.plain pre, .plain tt { font-family: monospace; font-size: 100%; font-weigh=
t: normal; font-style: normal; }
a img { border: 0px; }body {font-family: Tahoma;font-size: 12pt;}
.plain pre, .plain tt {font-family: Tahoma;font-size: 12pt;}
</STYLE>

<STYLE>#x5c16ffa088124803a2bdbfb31e676e86 BLOCKQUOTE.cite
{PADDING-LEFT: 10px; MARGIN-LEFT: 5px; BORDER-LEFT: #cccccc 1px solid; PADD=
ING-RIGHT: 0px; MARGIN-RIGHT: 0px}
#x5c16ffa088124803a2bdbfb31e676e86 BLOCKQUOTE.cite2
{PADDING-TOP: 0px; PADDING-LEFT: 10px; MARGIN-LEFT: 5px; BORDER-LEFT: #cccc=
cc 1px solid; MARGIN-TOP: 3px; PADDING-RIGHT: 0px; MARGIN-RIGHT: 0px}
#x5c16ffa088124803a2bdbfb31e676e86 .plain PRE, #x5c16ffa088124803a2bdbfb31e=
676e86 .plain TT
{FONT-SIZE: 100%; FONT-FAMILY: monospace; FONT-WEIGHT: normal; FONT-STYLE:=
 normal}
#x5c16ffa088124803a2bdbfb31e676e86 A IMG
{BORDER-TOP: 0px; BORDER-RIGHT: 0px; BORDER-BOTTOM: 0px; BORDER-LEFT: 0px}
#x5c16ffa088124803a2bdbfb31e676e86 .plain PRE, #x5c16ffa088124803a2bdbfb31e=
676e86 .plain TT, #x5c16ffa088124803a2bdbfb31e676e86
{FONT-SIZE: 12pt; FONT-FAMILY: Tahoma}
</STYLE>
</HEAD>
<BODY scroll=3Dauto class>
<DIV>Minutes from the 2-day OE Developer's (American) Meeting in San Jose,=
 CA in March. All errors are mine. These are also posted on the OE wiki =
page for OEDAM 2015.</DIV>
<DIV id=3Dx5c16ffa088124803a2bdbfb31e676e86>
<DIV><FONT size=3D2 face=3D"Courier New"></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3D"Courier New">OEDAM: OpenEmbedded Developer's=
 (American) Meeting<BR>March 27-28, 2015<BR>_______________________________=
________________________________________<BR>ATTENDANCE <BR>&nbsp;<BR>in =
room:<BR>mark hatle<BR>michael halstead<BR>bill mills<BR>paul eggleton<BR>d=
enys dmitryenko<BR>sean hudson<BR>armin kuster<BR>tim orling<BR>philip bali=
ster<BR>sona sarmadi<BR>martin jansa<BR>ken sharp<BR>stephen arnold<BR>chan=
ghyeok bae<BR>herb kuta<BR>benjamin esquivel<BR>grant likely<BR>jefro<BR>&n=
bsp;<BR>phone:<BR>richard purdie<BR>belen barros pena<BR>beth flanagan<BR>b=
ruce ashfield<BR>&nbsp;<BR>(Apologies if I missed your name - jefro)<BR>___=
____________________________________________________________________<BR>AGE=
NDA &amp; SUMMARY<BR>&nbsp;<BR>open issues &amp; action items marked with=
 =3D&gt;<BR>&nbsp;<BR>OEDAM 2014 summary<BR>=3D&gt;&nbsp; Lava - kernel =
ci can use it, not required; YP QA team experimenting<BR>=3D&gt;&nbsp; TSC=
 role - board needs to run election, koen willing to be replaced<BR>&nbsp;&=
nbsp;&nbsp; why is embedded still hard - progress making it marginally easi=
er<BR>&nbsp;&nbsp;&nbsp; layer quality - ongoing process<BR>&nbsp;&nbsp;&nb=
sp; lune - setup image replacement, spurred demo discussion<BR>&nbsp;&nbsp;=
&nbsp; next +1 - discussed<BR>&nbsp;&nbsp;&nbsp; local.conf from third part=
ies -<BR>&nbsp;<BR>Security<BR>&nbsp;&nbsp;&nbsp; testing security patches=
 high priority, not all in one place<BR>=3D&gt;&nbsp; sona proposed securit=
y mailing list for monitoring, patches, policy<BR>&nbsp;&nbsp;&nbsp; &amp;=
 agreed to investigate possible CVE database<BR>&nbsp;&nbsp;&nbsp; owner:=
 sona &amp; fray<BR>&nbsp;<BR>Infrastructure<BR>&nbsp;&nbsp;&nbsp; github=
 repos - obsolete repos going away June 30<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; make it obvious github is a mirror<BR>&nbsp;&nbsp;&nbsp; OE-c=
lassic - keeping for historical reasons only<BR>=3D&gt;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; read-only &amp; rename to oe-classic? oe-obsolete?<BR>=3D&gt;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ok to disable push requests from github.com?<BR=
>&nbsp;&nbsp;&nbsp; owner: crofton<BR>&nbsp;<BR>Layer maintenance<BR>&nbsp;=
&nbsp;&nbsp; build status reporting is better, incl. blacklisting bad recip=
es<BR>&nbsp;&nbsp;&nbsp; layer index is very positive, does not (yet?) repo=
rt layer quality<BR>&nbsp;&nbsp;&nbsp; possible toaster integration in the=
 future<BR>&nbsp;<BR>Improving demos<BR>&nbsp;&nbsp;&nbsp; noted SDR demo=
 in YP booth at ELC running on different SoCs<BR>&nbsp;&nbsp;&nbsp; html5/l=
una replacement for sato desired<BR>&nbsp;&nbsp;&nbsp; what is good for =
developers vs. what makes a good demo - discussion<BR>=3D&gt;&nbsp; bmills=
 suggested a monthly technical meeting to work on these issues<BR>=3D&gt;&n=
bsp; jefro to schedule meeting about demos: test images, sato, etc<BR>&nbsp=
;&nbsp;&nbsp; identify problem, role of sato, suitable alternatives &amp;=
 usage cases<BR>&nbsp;&nbsp;&nbsp; <BR>Patch review process<BR>&nbsp;&nbsp;=
&nbsp; RP outlined patch review process<BR>&nbsp;&nbsp;&nbsp; some aberrati=
ons in process illustrated - need tool improvement&nbsp;&nbsp;&nbsp; <BR>&n=
bsp;&nbsp;&nbsp; some resources could be put into improving patchwork<BR>&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; to automate some processes that=
 are currently manual<BR>&nbsp;&nbsp;&nbsp; paul suggests adding functional=
ity tests<BR>=3D&gt;&nbsp; general conclusion to focus on package managers,=
 feeds, tools<BR>&nbsp;<BR>=3D&gt;&nbsp; sources from bitbake world builds=
 moving to new location<BR>&nbsp;&nbsp;&nbsp; crofton/michael will update=
 DNS, should be invisible<BR>&nbsp;<BR>Tests<BR>&nbsp;&nbsp;&nbsp; autobuil=
der provides many testing featuers, automated qemu, ptests<BR>&nbsp;&nbsp;&=
nbsp; OE self test doesn't run on autobuilder (takes too long)<BR>=3D&gt;&n=
bsp; need more resources from community<BR>&nbsp;&nbsp;&nbsp; test mentorin=
g helpful<BR>&nbsp;<BR>Development cycle<BR>&nbsp;&nbsp;&nbsp; paul asks=
 whether the current dev cycle works<BR>&nbsp;&nbsp;&nbsp; 4-cycle system=
 w/milestones (in YP) works well<BR>&nbsp;&nbsp;&nbsp; testing could be =
improved as per previous discussion<BR>&nbsp;&nbsp;&nbsp; some people still=
 hold things back until last minute, RC process<BR>&nbsp;&nbsp;&nbsp; using=
 smart for RPM: <BR>=3D&gt;&nbsp; smart needs a new maintainer<BR>&nbsp;&nb=
sp;&nbsp; brief discussion about YP technical call - terse agenda &amp; =
minutes<BR>=3D&gt;&nbsp; jefro to work with sjolley to add RP's readout =
to minutes<BR>&nbsp;&nbsp;&nbsp; discussion about collecting sources for=
 an OE source mirror<BR>&nbsp;<BR># packages<BR>&nbsp;&nbsp;&nbsp; armin=
 asks, should there be a limit on packages in OE<BR>&nbsp;&nbsp;&nbsp; fray=
 &amp; RP suggest OE has a self-imposed feature limit, by testing<BR>=3D=
&gt;&nbsp; discuss within TSC<BR>&nbsp;<BR>documentation<BR>&nbsp;&nbsp;&nb=
sp; more technical documentation resources needed<BR>=3D&gt;&nbsp; crofton=
 to mention to Advisory Board<BR>&nbsp;&nbsp;&nbsp; <BR>OE eV<BR>&nbsp;&nbs=
p;&nbsp; SPI working well<BR>&nbsp;&nbsp;&nbsp; changing eV structure, sean=
 streamlining, possibly moving to US<BR>&nbsp;&nbsp;&nbsp; next GA &amp;=
 possible OEDEM after ELCE in October/Dublin<BR>&nbsp;<BR>Community Develop=
ment / Team Building<BR>&nbsp;&nbsp;&nbsp; Intro / crash course events<BR>=
=3D&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jefro to investigate materials, resou=
rces for promotion<BR>&nbsp;&nbsp;&nbsp; Coordinated bug day sprints<BR>&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; note: general feeling that janitors=
 list is misnamed<BR>=3D&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jefro - remind=
 stephen to add triage info to bug list<BR>=3D&gt;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; crofton/paul - set up bug day US a.m., UK/EU afternoon<BR>&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; separate event for Asia<BR>=3D&gt;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; jefro - investigate webinar format<BR>&nbsp;&nbsp;&nb=
sp; website/wiki<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wiki cleanup=
 needed, Jack's front page work?<BR>=3D&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 jefro - organize as board/TSC administrative issue<BR>&nbsp;&nbsp;&nbsp;=
 TSC meetings<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; communication=
 has been very important, now missing<BR>=3D&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; organize issues &amp; meetings every 2 months<BR>&nbsp;&nbsp;&nbsp; =
community metrics<BR>=3D&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jefro - work =
with board<BR>&nbsp;&nbsp;&nbsp; Other group/meetup activities<BR>&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; openhatch, internship programs like opw<B=
R>=3D&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all - contribute to Stack Overflow=
 support/discussions<BR>&nbsp;</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3D"Courier New">next OEDAM concurrent with ELC =
in San Diego, March 2016<BR>_______________________________________________=
________________________<BR>DETAIL<BR>&nbsp;<BR>Full text minutes available=
 at:<BR><A href=3D"http://pastebin.com/jpAFDUCy">http://pastebin.com/jpAFDU=
Cy</A><BR>or<BR><A href=3D"https://docs.google.com/document/d/16cueQXzrpvzh=
L7lzLiQxf5NZ4STYDffK0M3OLul0Fys/edit?usp=3Dsharing">https://docs.google.com=
/document/d/16cueQXzrpvzhL7lzLiQxf5NZ4STYDffK0M3OLul0Fys/edit?usp=3Dsharing=
</A><BR>&nbsp;<BR>Full audio recording available on request (allow time =
for uploading)</FONT></DIV>
<DIV><FONT size=3D2 face=3D"Courier New"></FONT></DIV></DIV></BODY></HTML>=

--------=_MBB830C9A7-E941-419E-ACA4-FE6577293BEA--
