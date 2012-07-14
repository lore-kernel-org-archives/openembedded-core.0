Received: from nm17-vm7.bullet.mail.sg3.yahoo.com ([106.10.149.86])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <bincy_k_philip@yahoo.co.in>) id 1Sq7cr-0004MY-JQ
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 21:03:34 +0200
Received: from [106.10.166.62] by nm17.bullet.mail.sg3.yahoo.com with NNFMP;
	14 Jul 2012 18:49:10 -0000
Received: from [106.10.151.250] by tm19.bullet.mail.sg3.yahoo.com with NNFMP;
	14 Jul 2012 18:49:10 -0000
Received: from [127.0.0.1] by omp1021.mail.sg3.yahoo.com with NNFMP;
	14 Jul 2012 18:49:10 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 328491.58084.bm@omp1021.mail.sg3.yahoo.com
Received: (qmail 30264 invoked by uid 60001); 14 Jul 2012 18:49:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.in; s=s1024;
	t=1342291750; bh=YmC1sw2QrnoJsgg7XiwhJ56qfL5sK5iMdWVFvsee3Ow=;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=xA6l+0k4gv4EOCFpAfcspqe0IF0JnBKnbC9iejfWrEa9CxAApZkD153S62qZraYts1Q1hGtCQ1s/2OdLOfPN/xg4HLjaBq0VNDDNl9FkVwaWbgSqgzy/zbnjCIpHe+dygz839EVF3g4CaxIOTlU/HYwjB9/xDgjgHwYaGBqqWTY=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.co.in;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=H0TfSjIaA4DEhNp5uMaCl39yZslceHNQRHI0mUxOaNYxCnqShJPhbj502LdDX7rkaQDs/YIbWUBeAwPPmp6gRT453ZxkLif74bvv16pJdIrygUvAKvdw8oZpxj3iwx7T2lxYhqSXqtuA6lVPnnCLmE+LxcmyIteF3QBzHIIJ9CQ=;
X-YMail-OSG: hXwR2jQVM1nD48ktIW_4hMtbIQ1qcQkclx3Q0LDYpM1NTOQ
	ukbjGT17n4LolntzXhh_zRNtcQ2MR5MhsZOYCW6tkRmPNye6gasz1hoTHYci
	sY9gU8q.2EEEviS9MECBiD23sta26CaEtwu_yBEPhQzVks6LRiNZzuJaMF3K
	TIRslaxIx22E5oMEO.S7oO0M8KBxi8YSRiKmoQcFIIYgF_BaJamzN3hKtmyS
	6sCTwIrBfzfQEXdME_GR5a4SG849htZ6pecvlCL9qpgG1j0O_m3..Op.y7eO
	E73ykP7lSobxNtUnM_1hmRvIaqImNaQLXQ5m.bkHuv0up7zS9fYkcUf6vvwA
	SjKjDy.jUB7H5HPNScsMTI8MXby9mQC5KCvsr.5fyXVhEVP_VJqsh9RV5Sy.
	br5pAPJAecEekeXI4l0v_UMBJaE6RQ7LoGXjDXMxUttcyQOZ45YtwqgV7yqP
	Li.jFwLFrLxKjoFR2x79_ZV81pV1b9hl25zOQXHCVv_L52LOlJahvstgxT5s
	rsrSrnOh4._h5JYz_REyCdzLklo7ZHbB7V8b8Dz_kgu.HOQSjN5YVj8LDkBP
	FplUx6J04xGvMNdSE8fzyIcLwt7V8zY9YEgnaa8X1gHE_AcZwQ70Ajzt1GGR
	hT1fLAzGrK62Jot8wzoIcxmWqRxN7KRNLKxSVI5y2KeCJvFDpbueLzSl8Vn2
	cP6D2iTMcmw2LBnag3wp3qA7NNoFuhuZckmhbcV05YrPPPOTqwUGR9eaEyXl
	VdvZRrtFRX5gzYtG5whGareCnok.j.eONT8dOUTjpIR91mp1mT1fH
Received: from [122.178.244.65] by web192604.mail.sg3.yahoo.com via HTTP;
	Sun, 15 Jul 2012 02:49:09 SGT
X-Mailer: YahooMailWebService/0.8.120.356233
References: <1342182619.93150.YahooMailNeo@web192606.mail.sg3.yahoo.com>
	<CAEsOVNdaBGNy2rDbqfA8ym+S7uMd3DA9FRAGunX0-MLRpuzcqg@mail.gmail.com>
	<1342200594.69949.YahooMailNeo@web192606.mail.sg3.yahoo.com>
	<CAEsOVNf1JGCiztMALddGMpV2qkhe_0LemrLA0yKvqyV9Nv07BQ@mail.gmail.com>
	<1342283369.62528.YahooMailNeo@web192604.mail.sg3.yahoo.com>
	<CAEsOVNftXUBgAh=FCa0a5qihWkzrAO+_vMbkOrcjQz60vqHoMQ@mail.gmail.com>
Message-ID: <1342291749.27854.YahooMailNeo@web192604.mail.sg3.yahoo.com>
Date: Sun, 15 Jul 2012 02:49:09 +0800 (SGT)
From: Bincy K Philip <bincy_k_philip@yahoo.co.in>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAEsOVNftXUBgAh=FCa0a5qihWkzrAO+_vMbkOrcjQz60vqHoMQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Error in rpm bitbake
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Bincy K Philip <bincy_k_philip@yahoo.co.in>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Jul 2012 19:03:34 -0000
Content-Type: multipart/alternative;
	boundary="1007199867-1922161600-1342291749=:27854"

--1007199867-1922161600-1342291749=:27854
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=0A=0ACould you please explain a little more on this.=0AThank you=0A=0A____=
____________________________=0AFrom: McClintock Matthew-B29882 <B29882@free=
scale.com>=0ATo: Bincy K Philip <bincy_k_philip@yahoo.co.in> =0ACc: McClint=
ock Matthew-B29882 <B29882@freescale.com> =0ASent: Saturday, 14 July 2012 1=
0:58 PM=0ASubject: Re: [OE-core] Error in rpm bitbake=0A=0AYou need to send=
 all your replies to the list. And it's from an older=0Alibc version. That =
patch should apply with a little bit of work.=0A=0A-M=0A=0AOn Sat, Jul 14, =
2012 at 11:29 AM, Bincy K Philip=0A<bincy_k_philip@yahoo.co.in> wrote:=0A> =
Hi Mathew,=0A>=0A> Is this problem specific to OS or kernel version..?=0A> =
|T|hanks for the help.=0A>=0A> Regards=0A> Bincy=0A>=0A> From: McClintock M=
atthew-B29882 <B29882@freescale.com>=0A> To: Bincy K Philip <bincy_k_philip=
@yahoo.co.in>=0A> Cc: McClintock Matthew-B29882 <B29882@freescale.com>=0A> =
Sent: Saturday, 14 July 2012 12:12 AM=0A> Subject: Re: [OE-core] Error in r=
pm bitbake=0A>=0A> On Fri, Jul 13, 2012 at 12:29 PM, Bincy K Philip=0A> <bi=
ncy_k_philip@yahoo.co.in> wrote:=0A>> Hi Mathew,=0A>>=0A>> Thank you very m=
uch for the reply.=0A>>=0A>> I have tried out following steps.=0A>>=0A>> 1.=
Copied the patch contents into one file called dbconvert.patch=0A>> 2.Copie=
d the dbconvert.patch in tmp/layers/openembeddedcore=0A>> 3.Gave the comman=
d patch -p1< dbconvert.patch=0A>> 4.I got following error mesage=0A>>=0A>>=
=0A>> patching file meta/recipes-devtools/rpm/rpm/dbconvert.patch=0A>> patc=
hing file meta/recipes-devtools/rpm/rpm_5.4.9.bb=0A>> Hunk #1 FAILED at 43.=
=0A>> Hunk #2 FAILED at 75.=0A>> I am not able to sortout this issue.Can yo=
u please suggest on this.=0A>>=0A>> Also in my bitbake I am getting this er=
ror.=0A>>=0A>> Summary: 1 task failed:=0A>>=0A>> virtual:native:/local/jenk=
ins/build_project/mvldir_ggg/tmp/layers/openembedded-core-030712/openembedd=
ed-core-030712//meta/recipes-devtools/rpm/rpm_5.4.9.bb,=0A>> do_patch=0A>=
=0A> My patch did not apply cleanly to the version of poky you are using -=
=0A> this needs to be fixed.=0A>=0A> -M=0A>=0A>>=0A>> Could you please guid=
e me.=0A>> Thank you=0A>> From: McClintock Matthew-B29882 <B29882@freescale=
.com>=0A>> To: Bincy K Philip <bincy_k_philip@yahoo.co.in>; Patches and dis=
cussions=0A>> about the oe-core layer <openembedded-core@lists.openembedded=
.org>=0A>> Sent: Friday, 13 July 2012 7:58 PM=0A>> Subject: Re: [OE-core] E=
rror in rpm bitbake=0A>>=0A>> On Fri, Jul 13, 2012 at 7:30 AM, Bincy K Phil=
ip=0A>> <bincy_k_philip@yahoo.co.in> wrote:=0A>>> Dear all,=0A>>>=0A>>> I h=
ave started to work with open embedded only 3 months back.=0A>>>=0A>>> I go=
t attached error log while trying for " bitbake rpm". This rpm=0A>>> failur=
e=0A>>> causes my bitbake core-image-minimal to fail.=0A>>>=0A>>>=0A>>> I h=
ave gone through some Google posts and understood dbconver.c causes=0A>>> t=
his=0A>>> error & need to exclude this file from compiling.I am not aware o=
f how to=0A>>> do=0A>>> that.Can anyone answer this?=0A>>>=0A>>> Also I hav=
e seen that there is one dbconvert.patch work in progress. But=0A>>> couldn=
't find out this file in open embedded git repository.=0A>>>=0A>>> Please h=
elp me to sort out this issue.This is really blocking me.=0A>>>=0A>>> Thank=
s in advance...=0A>>=0A>> Bincy,=0A>>=0A>> I submitted a patch for this a f=
ew days ago. Waiting for it to be=0A>> applied or for feedback:=0A>>=0A>>=
=0A>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dma=
ttsm/master&id=3D9cd3f21ab41c039ddcc6bbff521f9d7b284813ae=0A>>=0A>> -M=0A>>=
=0A>>>=0A>>>=0A>>> _______________________________________________=0A>>> Op=
enembedded-core mailing list=0A>>> Openembedded-core@lists.openembedded.org=
=0A>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor=
e=0A>>>=0A>>=0A>>=0A>=0A>

--1007199867-1922161600-1342291749=:27854
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:12pt"><div style=3D"RIGHT: =
auto"><SPAN style=3D"RIGHT: auto"><BR class=3Dyui-cursor></SPAN></div>
<div style=3D"RIGHT: auto">Could you please explain a little more on this.<=
BR style=3D"RIGHT: auto">Thank you<VAR id=3Dyui-ie-cursor></VAR></div>
<DIV style=3D"FONT-FAMILY: times new roman, new york, times, serif; FONT-SI=
ZE: 12pt">
<DIV style=3D"FONT-FAMILY: times new roman, new york, times, serif; FONT-SI=
ZE: 12pt">
<DIV style=3D"RIGHT: auto" dir=3Dltr><FONT size=3D2 face=3DArial>
<DIV style=3D"BORDER-BOTTOM: #ccc 1px solid; BORDER-LEFT: #ccc 1px solid; P=
ADDING-BOTTOM: 0px; LINE-HEIGHT: 0; MARGIN: 5px 0px; PADDING-LEFT: 0px; PAD=
DING-RIGHT: 0px; HEIGHT: 0px; FONT-SIZE: 0px; BORDER-TOP: #ccc 1px solid; B=
ORDER-RIGHT: #ccc 1px solid; PADDING-TOP: 0px" class=3Dhr contentEditable=
=3Dfalse readonly=3D"true"></DIV><B><SPAN style=3D"FONT-WEIGHT: bold">From:=
</SPAN></B> McClintock Matthew-B29882 &lt;B29882@freescale.com&gt;<BR><B><S=
PAN style=3D"FONT-WEIGHT: bold">To:</SPAN></B> Bincy K Philip &lt;bincy_k_p=
hilip@yahoo.co.in&gt; <BR><B><SPAN style=3D"FONT-WEIGHT: bold">Cc:</SPAN></=
B> McClintock Matthew-B29882 &lt;B29882@freescale.com&gt; <BR><B><SPAN styl=
e=3D"FONT-WEIGHT: bold">Sent:</SPAN></B> Saturday, 14 July 2012 10:58 PM<BR=
><B><SPAN style=3D"FONT-WEIGHT: bold">Subject:</SPAN></B> Re: [OE-core] Err=
or in rpm bitbake<BR></FONT></DIV><BR>You need to send all your replies to =
the list. And it's from an older<BR>libc version. That patch should apply w=
ith a little
 bit of work.<BR><BR>-M<BR><BR>On Sat, Jul 14, 2012 at 11:29 AM, Bincy K Ph=
ilip<BR>&lt;<A href=3D"mailto:bincy_k_philip@yahoo.co.in" ymailto=3D"mailto=
:bincy_k_philip@yahoo.co.in">bincy_k_philip@yahoo.co.in</A>&gt; wrote:<BR>&=
gt; Hi Mathew,<BR>&gt;<BR>&gt; Is this problem specific to OS or kernel ver=
sion..?<BR>&gt; |T|hanks for the help.<BR>&gt;<BR>&gt; Regards<BR>&gt; Binc=
y<BR>&gt;<BR>&gt; From: McClintock Matthew-B29882 &lt;<A href=3D"mailto:B29=
882@freescale.com" ymailto=3D"mailto:B29882@freescale.com">B29882@freescale=
.com</A>&gt;<BR>&gt; To: Bincy K Philip &lt;<A href=3D"mailto:bincy_k_phili=
p@yahoo.co.in" ymailto=3D"mailto:bincy_k_philip@yahoo.co.in">bincy_k_philip=
@yahoo.co.in</A>&gt;<BR>&gt; Cc: McClintock Matthew-B29882 &lt;<A href=3D"m=
ailto:B29882@freescale.com" ymailto=3D"mailto:B29882@freescale.com">B29882@=
freescale.com</A>&gt;<BR>&gt; Sent: Saturday, 14 July 2012 12:12 AM<BR>&gt;=
 Subject: Re: [OE-core] Error in rpm bitbake<BR>&gt;<BR>&gt; On Fri, Jul 13=
, 2012 at
 12:29 PM, Bincy K Philip<BR>&gt; &lt;<A href=3D"mailto:bincy_k_philip@yaho=
o.co.in" ymailto=3D"mailto:bincy_k_philip@yahoo.co.in">bincy_k_philip@yahoo=
.co.in</A>&gt; wrote:<BR>&gt;&gt; Hi Mathew,<BR>&gt;&gt;<BR>&gt;&gt; Thank =
you very much for the reply.<BR>&gt;&gt;<BR>&gt;&gt; I have tried out follo=
wing steps.<BR>&gt;&gt;<BR>&gt;&gt; 1.Copied the patch contents into one fi=
le called dbconvert.patch<BR>&gt;&gt; 2.Copied the dbconvert.patch in tmp/l=
ayers/openembeddedcore<BR>&gt;&gt; 3.Gave the command patch -p1&lt; dbconve=
rt.patch<BR>&gt;&gt; 4.I got following error mesage<BR>&gt;&gt;<BR>&gt;&gt;=
<BR>&gt;&gt; patching file meta/recipes-devtools/rpm/rpm/dbconvert.patch<BR=
>&gt;&gt; patching file meta/recipes-devtools/rpm/rpm_5.4.9.bb<BR>&gt;&gt; =
Hunk #1 FAILED at 43.<BR>&gt;&gt; Hunk #2 FAILED at 75.<BR>&gt;&gt; I am no=
t able to sortout this issue.Can you please suggest on this.<BR>&gt;&gt;<BR=
>&gt;&gt; Also in my bitbake I am getting this
 error.<BR>&gt;&gt;<BR>&gt;&gt; Summary: 1 task failed:<BR>&gt;&gt;<BR>&gt;=
&gt; virtual:native:/local/jenkins/build_project/mvldir_ggg/tmp/layers/open=
embedded-core-030712/openembedded-core-030712//meta/recipes-devtools/rpm/rp=
m_5.4.9.bb,<BR>&gt;&gt; do_patch<BR>&gt;<BR>&gt; My patch did not apply cle=
anly to the version of poky you are using -<BR>&gt; this needs to be fixed.=
<BR>&gt;<BR>&gt; -M<BR>&gt;<BR>&gt;&gt;<BR>&gt;&gt; Could you please guide =
me.<BR>&gt;&gt; Thank you<BR>&gt;&gt; From: McClintock Matthew-B29882 &lt;<=
A href=3D"mailto:B29882@freescale.com" ymailto=3D"mailto:B29882@freescale.c=
om">B29882@freescale.com</A>&gt;<BR>&gt;&gt; To: Bincy K Philip &lt;<A href=
=3D"mailto:bincy_k_philip@yahoo.co.in" ymailto=3D"mailto:bincy_k_philip@yah=
oo.co.in">bincy_k_philip@yahoo.co.in</A>&gt;; Patches and discussions<BR>&g=
t;&gt; about the oe-core layer &lt;<A href=3D"mailto:openembedded-core@list=
s.openembedded.org"
 ymailto=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-c=
ore@lists.openembedded.org</A>&gt;<BR>&gt;&gt; Sent: Friday, 13 July 2012 7=
:58 PM<BR>&gt;&gt; Subject: Re: [OE-core] Error in rpm bitbake<BR>&gt;&gt;<=
BR>&gt;&gt; On Fri, Jul 13, 2012 at 7:30 AM, Bincy K Philip<BR>&gt;&gt; &lt=
;<A href=3D"mailto:bincy_k_philip@yahoo.co.in" ymailto=3D"mailto:bincy_k_ph=
ilip@yahoo.co.in">bincy_k_philip@yahoo.co.in</A>&gt; wrote:<BR>&gt;&gt;&gt;=
 Dear all,<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt; I have started to work with open=
 embedded only 3 months back.<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt; I got attache=
d error log while trying for " bitbake rpm". This rpm<BR>&gt;&gt;&gt; failu=
re<BR>&gt;&gt;&gt; causes my bitbake core-image-minimal to fail.<BR>&gt;&gt=
;&gt;<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt; I have gone through some Google posts=
 and understood dbconver.c causes<BR>&gt;&gt;&gt; this<BR>&gt;&gt;&gt; erro=
r &amp; need to exclude this file from compiling.I am not aware of how
 to<BR>&gt;&gt;&gt; do<BR>&gt;&gt;&gt; that.Can anyone answer this?<BR>&gt;=
&gt;&gt;<BR>&gt;&gt;&gt; Also I have seen that there is one dbconvert.patch=
 work in progress. But<BR>&gt;&gt;&gt; couldn't find out this file in open =
embedded git repository.<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt; Please help me to =
sort out this issue.This is really blocking me.<BR>&gt;&gt;&gt;<BR>&gt;&gt;=
&gt; Thanks in advance...<BR>&gt;&gt;<BR>&gt;&gt; Bincy,<BR>&gt;&gt;<BR>&gt=
;&gt; I submitted a patch for this a few days ago. Waiting for it to be<BR>=
&gt;&gt; applied or for feedback:<BR>&gt;&gt;<BR>&gt;&gt;<BR>&gt;&gt; <A hr=
ef=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dma=
ttsm/master&amp;id=3D9cd3f21ab41c039ddcc6bbff521f9d7b284813ae" target=3D_bl=
ank>http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmatt=
sm/master&amp;id=3D9cd3f21ab41c039ddcc6bbff521f9d7b284813ae</A><BR>&gt;&gt;=
<BR>&gt;&gt; -M<BR>&gt;&gt;<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt;
 _______________________________________________<BR>&gt;&gt;&gt; Openembedd=
ed-core mailing list<BR>&gt;&gt;&gt; <A href=3D"mailto:Openembedded-core@li=
sts.openembedded.org" ymailto=3D"mailto:Openembedded-core@lists.openembedde=
d.org">Openembedded-core@lists.openembedded.org</A><BR>&gt;&gt;&gt; <A href=
=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core" =
target=3D_blank>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core</A><BR>&gt;&gt;&gt;<BR>&gt;&gt;<BR>&gt;&gt;<BR>&gt;<BR>&gt;<BR><=
BR><BR></DIV></DIV></div></body></html>

--1007199867-1922161600-1342291749=:27854--
