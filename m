Return-Path: <B40290@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe005.messaging.microsoft.com [216.32.181.185])
	by mail.openembedded.org (Postfix) with ESMTP id 82BAA60FEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 08:11:59 +0000 (UTC)
Received: from mail169-ch1-R.bigfish.com (10.43.68.237) by
	CH1EHSOBE001.bigfish.com (10.43.70.51) with Microsoft SMTP Server id
	14.1.225.22; Thu, 25 Jul 2013 08:11:59 +0000
Received: from mail169-ch1 (localhost [127.0.0.1])	by
	mail169-ch1-R.bigfish.com (Postfix) with ESMTP id 1DCA51601B7;
	Thu, 25 Jul 2013 08:11:59 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -10
X-BigFish: VS-10(zzbb2dI62a3I98dI9371I936eIc85fh1432I1a09J4015I1447I14ffIzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1d7338h1de098h17326ah18c673h1c8fb4h1de097h1de096h1954cbh18de19h8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah1288h12a5h12bdh137ah1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1bceh1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail169-ch1 (localhost.localdomain [127.0.0.1]) by mail169-ch1
	(MessageSwitch) id 1374739916636614_13572;
	Thu, 25 Jul 2013 08:11:56 +0000 (UTC)
Received: from CH1EHSMHS027.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.226])	by mail169-ch1.bigfish.com (Postfix) with ESMTP id
	868112A004A;	Thu, 25 Jul 2013 08:11:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS027.bigfish.com
	(10.43.70.27) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 25 Jul 2013 08:11:56 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.249]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.03.0136.001; Thu, 25 Jul 2013 08:11:55 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>, "Stanacar, StefanX"
	<stefanx.stanacar@intel.com>
Thread-Topic: [OE-core] How to solve the make 3.82 issue at sanity check time?
Thread-Index: AQHOiEAegkyBxDdPXkaqEOEVPiO53Jlzc6OAgAAQ2ACAAAIzAIAADTaAgAAF0wCAAWo/AIAABr0Q
Date: Thu, 25 Jul 2013 08:11:55 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E104268A0@039-SN2MPN1-021.039d.mgd.msft.net>
References: <CAOHjBZuDPPjk9dySzOTtGjXzy5yisjdumag=22qV5U-aW2hj4A@mail.gmail.com>
	<1374652108.28370.6.camel@firebird.rb.intel.com>
	<CAOHjBZvycJUgtJc0sZdkENH51YHvSGj5P50uMALU95T3+W_RPA@mail.gmail.com>
	<CANyK_8eXoSMdsQFGwzPmnxZrgN_bmFejxoLdLAXqmis=rQ7Cmw@mail.gmail.com>
	<CAOHjBZtoXxaHXFammidVFGwGQz6pCJBKhZe5233Us+bDQPQ9QQ@mail.gmail.com>
	<1374660286.28370.15.camel@firebird.rb.intel.com>
	<CAOHjBZuwd2ZOMQ85jButDc7y+KNvCrmxrR84MShN4Euwku=rVw@mail.gmail.com>
In-Reply-To: <CAOHjBZuwd2ZOMQ85jButDc7y+KNvCrmxrR84MShN4Euwku=rVw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.206]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to solve the make 3.82 issue at sanity check time?
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
X-List-Received-Date: Thu, 25 Jul 2013 08:11:59 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B21730BB6DA1D24B83348D9301EA417E104268A0039SN2MPN102103_"

--_000_B21730BB6DA1D24B83348D9301EA417E104268A0039SN2MPN102103_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all
The issue also happens in opensuse-12.1.
Thanks,
chunrong

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Giuseppe Condorelli
Sent: Thursday, July 25, 2013 3:40 PM
To: Stanacar, StefanX
Cc: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] How to solve the make 3.82 issue at sanity check tim=
e?

Well,
further information for Stefan and Paul.

1) installing the make-3.82-14.fc18.x86_64  the problem disappeared. Previu=
osly I downloaded and installed the -9 release and it was not enough...
2) trying with the script Paul suggested all was built right. I only catche=
d a warning at the end of the build due to a wrong path that obviously does=
n't exist in my machine.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
warning: templates not found /srv/home/pokybuild/yocto-autobuilder-new/yoct=
o-slave/buildtools/build/build/tmp/sysroots/x86_64-linux/usr/share/git-core=
/templates
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Thanks all for the support,

Cheers.
Giuseppe
2013/7/24 Stanacar, StefanX <stefanx.stanacar@intel.com<mailto:stefanx.stan=
acar@intel.com>>


On Wed, 2013-07-24 at 11:43 +0200, Giuseppe Condorelli wrote:
> Hi Paul,
>
> I saw it early this morning (reading the previous thread)
> but I've not put it in the right attention I think.
> Now I've installed the sdk using that script and a run is still
> ongoing.
> I'll let you know.
> I ask the same to you: are you sure the FC17 and ahead have solved the
> make issue?
>
I'm running F19 and didn't ran into any problems.

I also have an F18 machine that works which has
make-3.82-14.fc18.x86_64 (this was the update that fixed the problem,
pushed two weeks ago).

And according to
https://admin.fedoraproject.org/updates/FEDORA-2013-11295/make-3.82-14.fc17=
?_csrf_token=3D9e2949b0095b56c00b217d0b00e77e28df2bb7ba
and
https://admin.fedoraproject.org/updates/make?_csrf_token=3D9e2949b0095b56c0=
0b217d0b00e77e28df2bb7ba

the same patch was pushed for F17 make on the same day as F18, so that
should work too.

Cheers,
Stefan


> Many thanks,
> Cheers.
> Giuseppe
>
> 2013/7/24 Paul Barker <paul@paulbarker.me.uk<mailto:paul@paulbarker.me.uk=
>>
>         On 24 July 2013 09:47, Giuseppe Condorelli
>         <giuseppe.condorelli@gmail.com<mailto:giuseppe.condorelli@gmail.c=
om>> wrote:
>         > Many thanks for the quick reply Stefan,
>         >
>         > For completion, I'm working on FC16.
>         > Indeed (before sending the mail) I tried downloading the
>         make rpm for FC17
>         > (rpmfind.net<http://rpmfind.net>) and to use it
>         > (accordingly unpackaged under my personal directory,
>         updating the PATH) with
>         > the same failure.
>         > Can this sound strange for you?
>         > As you know, which are the make versions Fedora has released
>         for the
>         > FC17/18?
>         >
>         > I think at the moment the build of the buildtools-tarball
>         will be the way
>         > I'll follow, temporary disabling the sanity check.
>         >
>         > Cheers,
>         > Giuseppe
>         >
>
>
>         As stated in a previous thread, there's a snapshot of the
>         buildtools
>         at
>         http://autobuilder.yoctoproject.org/pub/nightly/CURRENT/buildtool=
s/
>         which might work for you. It should install a known good set
>         of tools
>         including make. This could be a good test for it.
>
>         --
>         Paul Barker
>
>         Email: paul@paulbarker.me.uk<mailto:paul@paulbarker.me.uk>
>         http://www.paulbarker.me.uk
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.o=
penembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--_000_B21730BB6DA1D24B83348D9301EA417E104268A0039SN2MPN102103_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hello all<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">The issue also happens in=
 opensuse-12.1.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Thanks,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">chunrong<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> openembe=
dded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@=
lists.openembedded.org]
<b>On Behalf Of </b>Giuseppe Condorelli<br>
<b>Sent:</b> Thursday, July 25, 2013 3:40 PM<br>
<b>To:</b> Stanacar, StefanX<br>
<b>Cc:</b> Patches and discussions about the oe-core layer<br>
<b>Subject:</b> Re: [OE-core] How to solve the make 3.82 issue at sanity ch=
eck time?<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Well,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">further information for Stefan and Paul.<o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">1) installing the make-3.82-14.fc18.x86_64&nbsp; the=
 problem disappeared. Previuosly I downloaded and installed the -9 release =
and it was not enough...<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">2) trying with the script Paul suggested all was bui=
lt right. I only catched a warning at the end of the build due to a wrong p=
ath that obviously doesn't exist in my machine.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">warning: templates not found /srv/home/pokybuild/yoc=
to-autobuilder-new/yocto-slave/buildtools/build/build/tmp/sysroots/x86_64-l=
inux/usr/share/git-core/templates<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<o:p></o:=
p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks all for the support,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Cheers.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Giuseppe<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">2013/7/24 Stanacar, StefanX &lt;<a href=3D"mailto:st=
efanx.stanacar@intel.com" target=3D"_blank">stefanx.stanacar@intel.com</a>&=
gt;<o:p></o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
<br>
On Wed, 2013-07-24 at 11:43 &#43;0200, Giuseppe Condorelli wrote:<br>
&gt; Hi Paul,<br>
&gt;<br>
&gt; I saw it early this morning (reading the previous thread)<br>
&gt; but I've not put it in the right attention I think.<br>
&gt; Now I've installed the sdk using that script and a run is still<br>
&gt; ongoing.<br>
&gt; I'll let you know.<br>
&gt; I ask the same to you: are you sure the FC17 and ahead have solved the=
<br>
&gt; make issue?<br>
&gt;<o:p></o:p></p>
</div>
<p class=3D"MsoNormal">I'm running F19 and didn't ran into any problems.<br=
>
<br>
I also have an F18 machine that works which has<br>
make-3.82-14.fc18.x86_64 (this was the update that fixed the problem,<br>
pushed two weeks ago).<br>
<br>
And according to<br>
<a href=3D"https://admin.fedoraproject.org/updates/FEDORA-2013-11295/make-3=
.82-14.fc17?_csrf_token=3D9e2949b0095b56c00b217d0b00e77e28df2bb7ba" target=
=3D"_blank">https://admin.fedoraproject.org/updates/FEDORA-2013-11295/make-=
3.82-14.fc17?_csrf_token=3D9e2949b0095b56c00b217d0b00e77e28df2bb7ba</a><br>
and<br>
<a href=3D"https://admin.fedoraproject.org/updates/make?_csrf_token=3D9e294=
9b0095b56c00b217d0b00e77e28df2bb7ba" target=3D"_blank">https://admin.fedora=
project.org/updates/make?_csrf_token=3D9e2949b0095b56c00b217d0b00e77e28df2b=
b7ba</a><br>
<br>
the same patch was pushed for F17 make on the same day as F18, so that<br>
should work too.<br>
<br>
Cheers,<br>
Stefan<o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><br>
<br>
&gt; Many thanks,<br>
&gt; Cheers.<br>
&gt; Giuseppe<br>
&gt;<br>
&gt; 2013/7/24 Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">pau=
l@paulbarker.me.uk</a>&gt;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; On 24 July 2013 09:47, Giuseppe Condorelli=
<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &lt;<a href=3D"mailto:giuseppe.condorelli@=
gmail.com">giuseppe.condorelli@gmail.com</a>&gt; wrote:<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; Many thanks for the quick reply Stefa=
n,<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; For completion, I'm working on FC16.<=
br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; Indeed (before sending the mail) I tr=
ied downloading the<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; make rpm for FC17<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; (<a href=3D"http://rpmfind.net" targe=
t=3D"_blank">rpmfind.net</a>) and to use it<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; (accordingly unpackaged under my pers=
onal directory,<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; updating the PATH) with<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; the same failure.<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; Can this sound strange for you?<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; As you know, which are the make versi=
ons Fedora has released<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; for the<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; FC17/18?<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; I think at the moment the build of th=
e buildtools-tarball<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; will be the way<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; I'll follow, temporary disabling the =
sanity check.<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; Cheers,<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt; Giuseppe<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &gt;<br>
&gt;<br>
&gt;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; As stated in a previous thread, there's a =
snapshot of the<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; buildtools<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; at<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; <a href=3D"http://autobuilder.yoctoproject=
.org/pub/nightly/CURRENT/buildtools/" target=3D"_blank">
http://autobuilder.yoctoproject.org/pub/nightly/CURRENT/buildtools/</a><br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; which might work for you. It should instal=
l a known good set<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; of tools<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; including make. This could be a good test =
for it.<br>
&gt;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; --<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; Paul Barker<br>
&gt;<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; Email: <a href=3D"mailto:paul@paulbarker.m=
e.uk">paul@paulbarker.me.uk</a><br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; <a href=3D"http://www.paulbarker.me.uk" ta=
rget=3D"_blank">http://www.paulbarker.me.uk</a><br>
&gt;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">&gt; ________________=
_______________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">
http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><o:p></=
o:p></p>
</div>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_B21730BB6DA1D24B83348D9301EA417E104268A0039SN2MPN102103_--
