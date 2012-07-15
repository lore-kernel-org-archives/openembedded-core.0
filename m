Received: from nm1-vm7.bullet.mail.sg3.yahoo.com ([106.10.148.78])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <bincy_k_philip@yahoo.co.in>) id 1SqOvn-0001LJ-I7
	for openembedded-core@lists.openembedded.org;
	Sun, 15 Jul 2012 15:32:16 +0200
Received: from [106.10.166.127] by nm1.bullet.mail.sg3.yahoo.com with NNFMP;
	15 Jul 2012 13:18:11 -0000
Received: from [106.10.151.155] by tm16.bullet.mail.sg3.yahoo.com with NNFMP;
	15 Jul 2012 13:18:11 -0000
Received: from [127.0.0.1] by omp1009.mail.sg3.yahoo.com with NNFMP;
	15 Jul 2012 13:18:11 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 148447.54762.bm@omp1009.mail.sg3.yahoo.com
Received: (qmail 17833 invoked by uid 60001); 15 Jul 2012 13:18:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.in; s=s1024;
	t=1342358291; bh=gq7yBfTbivacYTD7EY2q94J7trpk1nFYzYhD5W0vSZY=;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=tuQeaY+DF7mrmHP2eYhWsZ9hlJ6QqWuiUbi+PA3arq6nW71eiXAns95FEbk3wH/+xt4YWLSOeieQNBPT3eZmAoXqCx1EKuDZO3/0AkZntUv7/hUgpm2dEbmZhK0502yPRo2K3TO6X9TMplikykZ3atQsWR7dTnj1aE635bMqxX8=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.co.in;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=N9lrdKsbia3p39g9v64va6P68D/G3EDHZwxusck8tJD9J9XuuLp99j+vi2XYvIzf1Fg+gOWKlNZGPbaPyd1T5LYlw7NMC30PhkUlP4wqbFztXlwktUhKwolqzUGTTTEyD/jMDwiJeBX7v0vLeDW4qrb8xTH3YEQqyfF9DRApJco=;
X-YMail-OSG: lnVe83QVM1kW8E389A0tF4361UO1kmCmtzu1aXNv039rPLp
	G0N_7zqhhKtrO0gsd9hS0mRi4IGsKxfUkcB96hxw3R6B9NYInctjiKGqbrd3
	Zte4fLFxPrwLE56DbPaBiFduOEOIes6vP_T_RcTifoDl4yKWvDJqGOGEacs4
	ObsJw130QiQ3RfnfjbHJJebkb3omlKlRpG80BhyedFWIkhN7XVU2mQRG_j8Z
	Q94.plGYqgHQ_bUxzfpLTf9PW1htvZZD3suejzQMyBbCxv_igAWUph1vzqU8
	RTw3bH9d.GzqAQR7uJBdyfr3xVUtGkeAt1EW1DEARux_P53rXCcGgINzghgx
	qsCFaa1rcbssUNWklmPWIBEp2OVz2fetbNqkVJVcKzz0R7FtWm6YSUVoXvAm
	flpLUqdTaY_islLuzUjIQj5AXxF5BnpWbRKSVCdZvUGn8.PVanHb6W.x2L5i
	JhFR_IuZhQyWnX2HlD4IWCgINLmwRv9Hpq25WL1iAQf8x6oVb59EcnRpHcJD
	ZAxMwdmh12ukQJrXetUpyiUUL0vl7IqCqyklU5RbRNTQ3_5bdQJMurzLP.nW
	JZ3asbjKMJ4xSBhQ4NJKse0ri9AryZytYcgInHBfKSXM9sk9VNnlozR1a7lN
	cQv0x8bLvkH6GzBG7pngNX8u40LUqYJSkE27O6hlOPonSoT91PJYZpoZS7Lq
	HbUwTPsrJVyCGgANExk.S2VzVxScn1OjiuaIMqcLHKvvwS79sxE05RVqEyW6
	XhKDhhZVjG.fK777AsW5WgNek4kOpvGNFM5.gqjwbPIhDqbhTaH11Ng--
Received: from [122.178.244.131] by web192605.mail.sg3.yahoo.com via HTTP;
	Sun, 15 Jul 2012 21:18:10 SGT
X-Mailer: YahooMailWebService/0.8.120.356233
References: <1342182619.93150.YahooMailNeo@web192606.mail.sg3.yahoo.com>
	<CAEsOVNdaBGNy2rDbqfA8ym+S7uMd3DA9FRAGunX0-MLRpuzcqg@mail.gmail.com>
	<1342200594.69949.YahooMailNeo@web192606.mail.sg3.yahoo.com>
	<CAEsOVNf1JGCiztMALddGMpV2qkhe_0LemrLA0yKvqyV9Nv07BQ@mail.gmail.com>
	<1342283369.62528.YahooMailNeo@web192604.mail.sg3.yahoo.com>
	<CAEsOVNftXUBgAh=FCa0a5qihWkzrAO+_vMbkOrcjQz60vqHoMQ@mail.gmail.com>
	<1342291749.27854.YahooMailNeo@web192604.mail.sg3.yahoo.com>
	<CAEsOVNeLasnMNMHp3fbFhjpMe1sULHDS5OydYeECXgUeXYE-Jw@mail.gmail.com>
Message-ID: <1342358290.15023.YahooMailNeo@web192605.mail.sg3.yahoo.com>
Date: Sun, 15 Jul 2012 21:18:10 +0800 (SGT)
From: Bincy K Philip <bincy_k_philip@yahoo.co.in>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	McClintock Matthew- B29882 <B29882@freescale.com>
In-Reply-To: <CAEsOVNeLasnMNMHp3fbFhjpMe1sULHDS5OydYeECXgUeXYE-Jw@mail.gmail.com>
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
X-List-Received-Date: Sun, 15 Jul 2012 13:32:16 -0000
X-Groupsio-MsgNum: 25357
Content-Type: multipart/mixed;
	boundary="1060170558-1940066892-1342358290=:15023"

--1060170558-1940066892-1342358290=:15023
Content-Type: multipart/alternative; boundary="1060170558-1791230591-1342358290=:15023"

--1060170558-1791230591-1342358290=:15023
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

=0A=0AHi,=A0 after applying the patch, I got the=A0error message as follows=
.=0A=A0=0A=A0patching file meta/recipes-devtools/rpm/rpm/dbconvert.patch=0A=
> patching file meta/recipes-devtools/rpm/rpm_5.4.9.bb=0A> Hunk #1 FAILED a=
t 43.=0A> Hunk #2 FAILED at 75.=0A=A0=0AMy rpm_5.4.9.rej is attached.=0A=A0=
=0APlease look into this=0A=0A=A0=0ARegards=0ABincy=0A=0A__________________=
______________=0AFrom: McClintock Matthew-B29882 <B29882@freescale.com>=0AT=
o: Bincy K Philip <bincy_k_philip@yahoo.co.in>; Patches and discussions abo=
ut the oe-core layer <openembedded-core@lists.openembedded.org> =0ASent: Su=
nday, 15 July 2012 2:23 AM=0ASubject: Re: [OE-core] Error in rpm bitbake=0A=
=0AOn Sat, Jul 14, 2012 at 1:49 PM, Bincy K Philip=0A<bincy_k_philip@yahoo.=
co.in> wrote:=0A>=0A> Could you please explain a little more on this.=0A> T=
hank you=0A=0AMy patch is not applying to your tree - can you show the conf=
licts?=0AShow us the output of git diff after running the patch command.=0A=
=0A-M=0A=0A=0A> From: McClintock Matthew-B29882 <B29882@freescale.com>=0A> =
To: Bincy K Philip <bincy_k_philip@yahoo.co.in>=0A> Cc: McClintock Matthew-=
B29882 <B29882@freescale.com>=0A> Sent: Saturday, 14 July 2012 10:58 PM=0A>=
=0A> Subject: Re: [OE-core] Error in rpm bitbake=0A>=0A> You need to send a=
ll your replies to the list. And it's from an older=0A> libc version. That =
patch should apply with a little bit of work.=0A>=0A> -M=0A>=0A> On Sat, Ju=
l 14, 2012 at 11:29 AM, Bincy K Philip=0A> <bincy_k_philip@yahoo.co.in> wro=
te:=0A>> Hi Mathew,=0A>>=0A>> Is this problem specific to OS or kernel vers=
ion..?=0A>> |T|hanks for the help.=0A>>=0A>> Regards=0A>> Bincy=0A>>=0A>> F=
rom: McClintock Matthew-B29882 <B29882@freescale.com>=0A>> To: Bincy K Phil=
ip <bincy_k_philip@yahoo.co.in>=0A>> Cc: McClintock Matthew-B29882 <B29882@=
freescale.com>=0A>> Sent: Saturday, 14 July 2012 12:12 AM=0A>> Subject: Re:=
 [OE-core] Error in rpm bitbake=0A>>=0A>> On Fri, Jul 13, 2012 at 12:29 PM,=
 Bincy K Philip=0A>> <bincy_k_philip@yahoo.co.in> wrote:=0A>>> Hi Mathew,=
=0A>>>=0A>>> Thank you very much for the reply.=0A>>>=0A>>> I have tried ou=
t following steps.=0A>>>=0A>>> 1.Copied the patch contents into one file ca=
lled dbconvert.patch=0A>>> 2.Copied the dbconvert.patch in tmp/layers/opene=
mbeddedcore=0A>>> 3.Gave the command patch -p1< dbconvert.patch=0A>>> 4.I g=
ot following error mesage=0A>>>=0A>>>=0A>>> patching file meta/recipes-devt=
ools/rpm/rpm/dbconvert.patch=0A>>> patching file meta/recipes-devtools/rpm/=
rpm_5.4.9.bb=0A>>> Hunk #1 FAILED at 43.=0A>>> Hunk #2 FAILED at 75.=0A>>> =
I am not able to sortout this issue.Can you please suggest on this.=0A>>>=
=0A>>> Also in my bitbake I am getting this error.=0A>>>=0A>>> Summary: 1 t=
ask failed:=0A>>>=0A>>>=0A>>> virtual:native:/local/jenkins/build_project/m=
vldir_ggg/tmp/layers/openembedded-core-030712/openembedded-core-030712//met=
a/recipes-devtools/rpm/rpm_5.4.9.bb,=0A>>> do_patch=0A>>=0A>> My patch did =
not apply cleanly to the version of poky you are using -=0A>> this needs to=
 be fixed.=0A>>=0A>> -M=0A>>=0A>>>=0A>>> Could you please guide me.=0A>>> T=
hank you=0A>>> From: McClintock Matthew-B29882 <B29882@freescale.com>=0A>>>=
 To: Bincy K Philip <bincy_k_philip@yahoo.co.in>; Patches and discussions=
=0A>>> about the oe-core layer <openembedded-core@lists.openembedded.org>=
=0A>>> Sent: Friday, 13 July 2012 7:58 PM=0A>>> Subject: Re: [OE-core] Erro=
r in rpm bitbake=0A>>>=0A>>> On Fri, Jul 13, 2012 at 7:30 AM, Bincy K Phili=
p=0A>>> <bincy_k_philip@yahoo.co.in> wrote:=0A>>>> Dear all,=0A>>>>=0A>>>> =
I have started to work with open embedded only 3 months back.=0A>>>>=0A>>>>=
 I got attached error log while trying for " bitbake rpm". This rpm=0A>>>> =
failure=0A>>>> causes my bitbake core-image-minimal to fail.=0A>>>>=0A>>>>=
=0A>>>> I have gone through some Google posts and understood dbconver.c cau=
ses=0A>>>> this=0A>>>> error & need to exclude this file from compiling.I a=
m not aware of how=0A>>>> to=0A>>>> do=0A>>>> that.Can anyone answer this?=
=0A>>>>=0A>>>> Also I have seen that there is one dbconvert.patch work in p=
rogress. But=0A>>>> couldn't find out this file in open embedded git reposi=
tory.=0A>>>>=0A>>>> Please help me to sort out this issue.This is really bl=
ocking me.=0A>>>>=0A>>>> Thanks in advance...=0A>>>=0A>>> Bincy,=0A>>>=0A>>=
> I submitted a patch for this a few days ago. Waiting for it to be=0A>>> a=
pplied or for feedback:=0A>>>=0A>>>=0A>>>=0A>>> http://git.yoctoproject.org=
/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmattsm/master&id=3D9cd3f21ab41c039d=
dcc6bbff521f9d7b284813ae=0A>>>=0A>>> -M=0A>>>=0A>>>>=0A>>>>=0A>>>> ________=
_______________________________________=0A>>>> Openembedded-core mailing li=
st=0A>>>> Openembedded-core@lists.openembedded.org=0A>>>> http://lists.linu=
xtogo.org/cgi-bin/mailman/listinfo/openembedded-core=0A>>>>=0A>>>=0A>>>=0A>=
>=0A>>=0A>=0A>=0A>=0A> _______________________________________________=0A> =
Openembedded-core mailing list=0A> Openembedded-core@lists.openembedded.org=
=0A> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=
=0A>

--1060170558-1791230591-1342358290=:15023
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:12pt"><div style=3D"RIGHT: =
auto"><SPAN style=3D"RIGHT: auto"><BR class=3Dyui-cursor></SPAN></div>
<div style=3D"RIGHT: auto">Hi,&nbsp; after applying the patch, I got the&nb=
sp;<VAR id=3Dyui-ie-cursor></VAR>error message as follows.</div>
<div style=3D"RIGHT: auto">&nbsp;</div>
<div style=3D"RIGHT: auto">&nbsp;patching file meta/recipes-devtools/rpm/rp=
m/dbconvert.patch<BR>&gt; patching file meta/recipes-devtools/rpm/rpm_5.4.9=
.bb<BR>&gt; Hunk #1 FAILED at 43.<BR>&gt; Hunk #2 FAILED at 75.</div>
<div style=3D"RIGHT: auto">&nbsp;</div>
<div style=3D"RIGHT: auto">My rpm_5.4.9.rej is attached.</div>
<div style=3D"RIGHT: auto">&nbsp;</div>
<div style=3D"RIGHT: auto">Please look into this<BR style=3D"RIGHT: auto"><=
/div>
<div style=3D"RIGHT: auto">&nbsp;</div>
<div style=3D"RIGHT: auto">Regards</div>
<div style=3D"RIGHT: auto">Bincy</div>
<DIV style=3D"FONT-FAMILY: times new roman, new york, times, serif; FONT-SI=
ZE: 12pt">
<DIV style=3D"FONT-FAMILY: times new roman, new york, times, serif; FONT-SI=
ZE: 12pt">
<DIV dir=3Dltr><FONT size=3D2 face=3DArial>
<DIV style=3D"BORDER-BOTTOM: #ccc 1px solid; BORDER-LEFT: #ccc 1px solid; P=
ADDING-BOTTOM: 0px; LINE-HEIGHT: 0; MARGIN: 5px 0px; PADDING-LEFT: 0px; PAD=
DING-RIGHT: 0px; HEIGHT: 0px; FONT-SIZE: 0px; BORDER-TOP: #ccc 1px solid; B=
ORDER-RIGHT: #ccc 1px solid; PADDING-TOP: 0px" class=3Dhr contentEditable=
=3Dfalse readonly=3D"true"></DIV><B><SPAN style=3D"FONT-WEIGHT: bold">From:=
</SPAN></B> McClintock Matthew-B29882 &lt;B29882@freescale.com&gt;<BR><B><S=
PAN style=3D"FONT-WEIGHT: bold">To:</SPAN></B> Bincy K Philip &lt;bincy_k_p=
hilip@yahoo.co.in&gt;; Patches and discussions about the oe-core layer &lt;=
openembedded-core@lists.openembedded.org&gt; <BR><B><SPAN style=3D"FONT-WEI=
GHT: bold">Sent:</SPAN></B> Sunday, 15 July 2012 2:23 AM<BR><B><SPAN style=
=3D"FONT-WEIGHT: bold">Subject:</SPAN></B> Re: [OE-core] Error in rpm bitba=
ke<BR></FONT></DIV><BR>On Sat, Jul 14, 2012 at 1:49 PM, Bincy K Philip<BR>&=
lt;<A href=3D"mailto:bincy_k_philip@yahoo.co.in"
 ymailto=3D"mailto:bincy_k_philip@yahoo.co.in">bincy_k_philip@yahoo.co.in</=
A>&gt; wrote:<BR>&gt;<BR>&gt; Could you please explain a little more on thi=
s.<BR>&gt; Thank you<BR><BR>My patch is not applying to your tree - can you=
 show the conflicts?<BR>Show us the output of git diff after running the pa=
tch command.<BR><BR>-M<BR><BR><BR>&gt; From: McClintock Matthew-B29882 &lt;=
<A href=3D"mailto:B29882@freescale.com" ymailto=3D"mailto:B29882@freescale.=
com">B29882@freescale.com</A>&gt;<BR>&gt; To: Bincy K Philip &lt;<A href=3D=
"mailto:bincy_k_philip@yahoo.co.in" ymailto=3D"mailto:bincy_k_philip@yahoo.=
co.in">bincy_k_philip@yahoo.co.in</A>&gt;<BR>&gt; Cc: McClintock Matthew-B2=
9882 &lt;<A href=3D"mailto:B29882@freescale.com" ymailto=3D"mailto:B29882@f=
reescale.com">B29882@freescale.com</A>&gt;<BR>&gt; Sent: Saturday, 14 July =
2012 10:58 PM<BR>&gt;<BR>&gt; Subject: Re: [OE-core] Error in rpm bitbake<B=
R>&gt;<BR>&gt; You need to send all your replies to the list. And it's from=
 an
 older<BR>&gt; libc version. That patch should apply with a little bit of w=
ork.<BR>&gt;<BR>&gt; -M<BR>&gt;<BR>&gt; On Sat, Jul 14, 2012 at 11:29 AM, B=
incy K Philip<BR>&gt; &lt;<A href=3D"mailto:bincy_k_philip@yahoo.co.in" yma=
ilto=3D"mailto:bincy_k_philip@yahoo.co.in">bincy_k_philip@yahoo.co.in</A>&g=
t; wrote:<BR>&gt;&gt; Hi Mathew,<BR>&gt;&gt;<BR>&gt;&gt; Is this problem sp=
ecific to OS or kernel version..?<BR>&gt;&gt; |T|hanks for the help.<BR>&gt=
;&gt;<BR>&gt;&gt; Regards<BR>&gt;&gt; Bincy<BR>&gt;&gt;<BR>&gt;&gt; From: M=
cClintock Matthew-B29882 &lt;<A href=3D"mailto:B29882@freescale.com" ymailt=
o=3D"mailto:B29882@freescale.com">B29882@freescale.com</A>&gt;<BR>&gt;&gt; =
To: Bincy K Philip &lt;<A href=3D"mailto:bincy_k_philip@yahoo.co.in" ymailt=
o=3D"mailto:bincy_k_philip@yahoo.co.in">bincy_k_philip@yahoo.co.in</A>&gt;<=
BR>&gt;&gt; Cc: McClintock Matthew-B29882 &lt;<A href=3D"mailto:B29882@free=
scale.com"
 ymailto=3D"mailto:B29882@freescale.com">B29882@freescale.com</A>&gt;<BR>&g=
t;&gt; Sent: Saturday, 14 July 2012 12:12 AM<BR>&gt;&gt; Subject: Re: [OE-c=
ore] Error in rpm bitbake<BR>&gt;&gt;<BR>&gt;&gt; On Fri, Jul 13, 2012 at 1=
2:29 PM, Bincy K Philip<BR>&gt;&gt; &lt;<A href=3D"mailto:bincy_k_philip@ya=
hoo.co.in" ymailto=3D"mailto:bincy_k_philip@yahoo.co.in">bincy_k_philip@yah=
oo.co.in</A>&gt; wrote:<BR>&gt;&gt;&gt; Hi Mathew,<BR>&gt;&gt;&gt;<BR>&gt;&=
gt;&gt; Thank you very much for the reply.<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt; =
I have tried out following steps.<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt; 1.Copied =
the patch contents into one file called dbconvert.patch<BR>&gt;&gt;&gt; 2.C=
opied the dbconvert.patch in tmp/layers/openembeddedcore<BR>&gt;&gt;&gt; 3.=
Gave the command patch -p1&lt; dbconvert.patch<BR>&gt;&gt;&gt; 4.I got foll=
owing error mesage<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt; patching=
 file meta/recipes-devtools/rpm/rpm/dbconvert.patch<BR>&gt;&gt;&gt;
 patching file meta/recipes-devtools/rpm/rpm_5.4.9.bb<BR>&gt;&gt;&gt; Hunk =
#1 FAILED at 43.<BR>&gt;&gt;&gt; Hunk #2 FAILED at 75.<BR>&gt;&gt;&gt; I am=
 not able to sortout this issue.Can you please suggest on this.<BR>&gt;&gt;=
&gt;<BR>&gt;&gt;&gt; Also in my bitbake I am getting this error.<BR>&gt;&gt=
;&gt;<BR>&gt;&gt;&gt; Summary: 1 task failed:<BR>&gt;&gt;&gt;<BR>&gt;&gt;&g=
t;<BR>&gt;&gt;&gt; virtual:native:/local/jenkins/build_project/mvldir_ggg/t=
mp/layers/openembedded-core-030712/openembedded-core-030712//meta/recipes-d=
evtools/rpm/rpm_5.4.9.bb,<BR>&gt;&gt;&gt; do_patch<BR>&gt;&gt;<BR>&gt;&gt; =
My patch did not apply cleanly to the version of poky you are using -<BR>&g=
t;&gt; this needs to be fixed.<BR>&gt;&gt;<BR>&gt;&gt; -M<BR>&gt;&gt;<BR>&g=
t;&gt;&gt;<BR>&gt;&gt;&gt; Could you please guide me.<BR>&gt;&gt;&gt; Thank=
 you<BR>&gt;&gt;&gt; From: McClintock Matthew-B29882 &lt;<A href=3D"mailto:=
B29882@freescale.com"
 ymailto=3D"mailto:B29882@freescale.com">B29882@freescale.com</A>&gt;<BR>&g=
t;&gt;&gt; To: Bincy K Philip &lt;<A href=3D"mailto:bincy_k_philip@yahoo.co=
.in" ymailto=3D"mailto:bincy_k_philip@yahoo.co.in">bincy_k_philip@yahoo.co.=
in</A>&gt;; Patches and discussions<BR>&gt;&gt;&gt; about the oe-core layer=
 &lt;<A href=3D"mailto:openembedded-core@lists.openembedded.org" ymailto=3D=
"mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.o=
penembedded.org</A>&gt;<BR>&gt;&gt;&gt; Sent: Friday, 13 July 2012 7:58 PM<=
BR>&gt;&gt;&gt; Subject: Re: [OE-core] Error in rpm bitbake<BR>&gt;&gt;&gt;=
<BR>&gt;&gt;&gt; On Fri, Jul 13, 2012 at 7:30 AM, Bincy K Philip<BR>&gt;&gt=
;&gt; &lt;<A href=3D"mailto:bincy_k_philip@yahoo.co.in" ymailto=3D"mailto:b=
incy_k_philip@yahoo.co.in">bincy_k_philip@yahoo.co.in</A>&gt; wrote:<BR>&gt=
;&gt;&gt;&gt; Dear all,<BR>&gt;&gt;&gt;&gt;<BR>&gt;&gt;&gt;&gt; I have star=
ted to work with open embedded only 3 months
 back.<BR>&gt;&gt;&gt;&gt;<BR>&gt;&gt;&gt;&gt; I got attached error log whi=
le trying for " bitbake rpm". This rpm<BR>&gt;&gt;&gt;&gt; failure<BR>&gt;&=
gt;&gt;&gt; causes my bitbake core-image-minimal to fail.<BR>&gt;&gt;&gt;&g=
t;<BR>&gt;&gt;&gt;&gt;<BR>&gt;&gt;&gt;&gt; I have gone through some Google =
posts and understood dbconver.c causes<BR>&gt;&gt;&gt;&gt; this<BR>&gt;&gt;=
&gt;&gt; error &amp; need to exclude this file from compiling.I am not awar=
e of how<BR>&gt;&gt;&gt;&gt; to<BR>&gt;&gt;&gt;&gt; do<BR>&gt;&gt;&gt;&gt; =
that.Can anyone answer this?<BR>&gt;&gt;&gt;&gt;<BR>&gt;&gt;&gt;&gt; Also I=
 have seen that there is one dbconvert.patch work in progress. But<BR>&gt;&=
gt;&gt;&gt; couldn't find out this file in open embedded git repository.<BR=
>&gt;&gt;&gt;&gt;<BR>&gt;&gt;&gt;&gt; Please help me to sort out this issue=
.This is really blocking me.<BR>&gt;&gt;&gt;&gt;<BR>&gt;&gt;&gt;&gt; Thanks=
 in advance...<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt;
 Bincy,<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt; I submitted a patch for this a few =
days ago. Waiting for it to be<BR>&gt;&gt;&gt; applied or for feedback:<BR>=
&gt;&gt;&gt;<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt; <A href=3D"htt=
p://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmattsm/mast=
er&amp;id=3D9cd3f21ab41c039ddcc6bbff521f9d7b284813ae" target=3D_blank>http:=
//git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dmattsm/master=
&amp;id=3D9cd3f21ab41c039ddcc6bbff521f9d7b284813ae</A><BR>&gt;&gt;&gt;<BR>&=
gt;&gt;&gt; -M<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt;&gt;<BR>&gt;&gt;&gt;&gt;<BR>&=
gt;&gt;&gt;&gt; _______________________________________________<BR>&gt;&gt;=
&gt;&gt; Openembedded-core mailing list<BR>&gt;&gt;&gt;&gt; <A href=3D"mail=
to:Openembedded-core@lists.openembedded.org" ymailto=3D"mailto:Openembedded=
-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</A><=
BR>&gt;&gt;&gt;&gt; <A
 href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-c=
ore" target=3D_blank>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/op=
enembedded-core</A><BR>&gt;&gt;&gt;&gt;<BR>&gt;&gt;&gt;<BR>&gt;&gt;&gt;<BR>=
&gt;&gt;<BR>&gt;&gt;<BR>&gt;<BR>&gt;<BR>&gt;<BR>&gt; ______________________=
_________________________<BR>&gt; Openembedded-core mailing list<BR>&gt; <A=
 href=3D"mailto:Openembedded-core@lists.openembedded.org" ymailto=3D"mailto=
:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembe=
dded.org</A><BR>&gt; <A href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/=
listinfo/openembedded-core" target=3D_blank>http://lists.linuxtogo.org/cgi-=
bin/mailman/listinfo/openembedded-core</A><BR>&gt;<BR><BR><BR></DIV></DIV><=
/div></body></html>

--1060170558-1791230591-1342358290=:15023--

--1060170558-1940066892-1342358290=:15023
Content-Type: text/plain; name="rpm_5.4.9.bb.rej.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="rpm_5.4.9.bb.rej.txt"

KioqKioqKioqKioqKioqDQoqKiogNDMsNDkgKioqKg0KICBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HLkxJQjttZDU9MmQ1MDI1ZDRhYTM0OTViZWZlZjhmMTcyMDZhNWIwYTEiDQoN
CiAgREVQRU5EUyA9ICJsaWJwY3JlIGF0dHIgYWNsIHBvcHQgb3NzcC11dWlkIGZpbGUiDQotIFBS
ID0gInI0NSINCg0KICAjIHJwbTJjcGlvIGlzIGEgc2hlbGwgc2NyaXB0LCB3aGljaCBpcyBwYXJ0
IG9mIHRoZSBycG0gc3JjLnJwbS4gIEl0IGlzIG5lZWRlZA0KICAjIGluIG9yZGVyIHRvIGV4dHJh
Y3QgdGhlIGRpc3RyaWJ1dGlvbiBTUlBNIGludG8gYSBmb3JtYXQgd2UgY2FuIGV4dHJhY3QuLi4N
Ci0tLSA0Myw0OSAtLS0tDQogIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkcuTElC
O21kNT0yZDUwMjVkNGFhMzQ5NWJlZmVmOGYxNzIwNmE1YjBhMSINCg0KICBERVBFTkRTID0gImxp
YnBjcmUgYXR0ciBhY2wgcG9wdCBvc3NwLXV1aWQgZmlsZSINCisgUFIgPSAicjQ2Ig0KDQogICMg
cnBtMmNwaW8gaXMgYSBzaGVsbCBzY3JpcHQsIHdoaWNoIGlzIHBhcnQgb2YgdGhlIHJwbSBzcmMu
cnBtLiAgSXQgaXMgbmVlZGVkDQogICMgaW4gb3JkZXIgdG8gZXh0cmFjdCB0aGUgZGlzdHJpYnV0
aW9uIFNSUE0gaW50byBhIGZvcm1hdCB3ZSBjYW4gZXh0cmFjdC4uLg0KKioqKioqKioqKioqKioq
DQoqKiogNzUsODAgKioqKg0KICAgICAgICAgICBmaWxlOi8vdWNsaWJjLXN1cHBvcnQucGF0Y2gg
XA0KICAgICAgICAgICBmaWxlOi8vcnBtYXRjaC5wYXRjaCBcDQogICAgICAgICAgIGZpbGU6Ly9m
c3RhY2stcHJvdGVjdG9yLWNvbmZpZ3VyZS1jaGVjay5wYXRjaCBcDQogICAgICAgICAgIg0K

--1060170558-1940066892-1342358290=:15023--
