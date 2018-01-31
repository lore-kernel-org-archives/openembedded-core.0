Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6C721602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:04:51 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id p139so431025itb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=pY5E3+fYTlRy7ZCUw6N8tHmvXkJUg01+nkTDLjluWlM=;
	b=ED4e1UYgbZixTX6rVz6aCAjcLaAvGU+ntF1c0TepJ1LZuwTNF4JkK5jKzM1iwJhHfX
	WLxBO9J+B6jU0XWJSeUOm+vkN3Q7XGk9r5FGkvkeXx8P3xunNYMa78yPaGMFpr8hn2nR
	cXtGAcXogQPMOuIvMB36yI4au1Qp2iTnVW+FMYGaWd8sKhXsT4GoURaAvG/vWYc76PW6
	iERtBrDqD7cvBP6nN1GVe6OTIpGX38gMPDQrjqAZLC2Q74QotrNSSlDda9XBtB3IEbrp
	SnnmHRG7KmPxVKMiAb4C1nk0I4MjZ3k8QD32avy4PWnN2F5KP0aLDrttjT4D1WdcF1eu
	3P0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=pY5E3+fYTlRy7ZCUw6N8tHmvXkJUg01+nkTDLjluWlM=;
	b=YSVUT5+IfqAMGUV7UsVPAlpJE/O8nA9vekdTs2imUyNxLtGy+XHGTNdozZMgbrsHro
	oet/WwXpI6P0tPbG4Fq/3k3B0q73dog4k2rvSTauZc/UilAqL3t7CEcBmXf5tcs1359r
	Yph1SlLivDCsonD/i0QmR6lkNAGLoA3EFUR1AZsqG9v1/SfR1lZDNDe9shJmmLtPHwjq
	aXFy0K2Ypkcu7FKICFR0A5oUbMB91CRyibqDtfyM/5bwuN9zXISRxOfPHxMnXDTp4lOO
	AyCpS5eNZITmmU9C8wNlRZPdoslpcOIVvHxnvAGme9sEZm1B/xwz65Stur3m3QFjneeb
	O0KQ==
X-Gm-Message-State: AKwxytctu6JPtO8jasSZvWz1+18J2CA1RAdAWXmcRSqW7Sg5LRA3OjhI
	PvA8ctVpHYoOhdI9rnbiiBw=
X-Google-Smtp-Source: AH8x224QrO0+47xYoOZFxW+nwQ3YJe9wD4lwSX9v9oYvbiHwYdFOJn8xOinFS0qLmGx2/ei5047xCA==
X-Received: by 10.36.110.204 with SMTP id w195mr2663930itc.0.1517418293248;
	Wed, 31 Jan 2018 09:04:53 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	c140sm3829448itc.1.2018.01.31.09.04.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Jan 2018 09:04:52 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1517418291.31752.85.camel@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Andreas =?ISO-8859-1?Q?M=FCller?=
	<schnitzeltony@gmail.com>, Stefan Agner <stefan.agner@toradex.com>
Date: Wed, 31 Jan 2018 11:04:51 -0600
In-Reply-To: <CA+chaQc+r5U7_W=rhKRzxaG16Lk6SYBBD=UBvdqNvbZ2N74Bjw@mail.gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
	<CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
	<CALbNGRSkvxi3AWkzZcsipSspQnEjsdZ4VKwbFGRN0o9tY4G2-A@mail.gmail.com>
	<CA+chaQdBgGX-K3fb15L6LR6f=iFZUkvb250xK5+4pjPyrYbf4w@mail.gmail.com>
	<CA+chaQc+r5U7_W=rhKRzxaG16Lk6SYBBD=UBvdqNvbZ2N74Bjw@mail.gmail.com>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Cc: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	Joe Slater <jslater@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: check that waf exists before trying to execute it
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
X-List-Received-Date: Wed, 31 Jan 2018 17:04:52 -0000
Content-Type: multipart/alternative; boundary="=-hFJgq5sZ5kPCHrljDd2A"

--=-hFJgq5sZ5kPCHrljDd2A
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Sorry, I wasn't sure if I should make my patch in-reply-to this
thread....
I think I fixed this correctly in http://lists.openembedded.org/piperma
il/openembedded-core/2018-January/147041.html
Thanks,Joshua Watt
On Wed, 2018-01-31 at 00:39 +0100, Martin Jansa wrote:
> +Stefan
> 
> On Wed, Jan 31, 2018 at 12:38 AM, Martin Jansa <martin.jansa@gmail.co
> m> wrote:
> > Thanks Andreas,
> > jack is the only one which inherits waf directly not through waf-
> > samba.
> > 
> > More surprisingly it also has ${S}/waf it seems:
> > https://github.com/jackaudio/jack2/blob/c1647819eed6d11f94b21981d9c
> > 869629299f357/waf
> > 
> > So the WARNING: shown for jack probably had different reason than
> > the rest of them and that is:
> > 
> > jack/1.9.12-r0 $ jack/1.9.12-r0/git/waf --version
> > Error: run waf-light from a folder containing waflib
> > 
> > 
> > it doesn't like running waf from outside ${S} and waf_preconfigure
> > is executed from ${TOPDIR} before do_configure switches to ${S}
> > 
> > I don't know how common this situation is, if all waf scripts are
> > like that, this one (after "cd ../jack/1.9.12-r0/git") says:
> > waf 1.8.17 (cd7579a727d1b390bf9cbf111c1b20e811370bc0)
> > 
> > so I'll leave that to original author to figure it out, I don't use
> > waf anywhere, so I cannot properly test the use case he was trying
> > to fix.
> > 
> > Regards,
> > 
> > 
> > 
> > 
> > On Tue, Jan 30, 2018 at 11:41 PM, Andreas Müller <schnitzeltony@gma
> > il.com> wrote:
> > > On Tuesday, January 30, 2018, Martin Jansa <martin.jansa@gmail.co
> > > m> wrote:
> > > > +Andreas who added waf inherit in jack in:commit
> > > > 0f8f1973e229a0799098bc2334416fec8c608b50
> > > > Author: Andreas Müller <schnitzeltony@googlemail.com>
> > > > Date:   Sat Oct 8 12:03:32 2016 +0200
> > > > 
> > > >     jack: swap to jack2
> > > As far as I can see is jack2 configured with waf. Don't remember
> > > why I chose waf-samba. Because I am on business trip I cannot
> > > take care before next week.
> > > 
> > > Andreas
> > > > +Bian who added waf samba in:
> > > > commit 962e346df99696a10657a2ea7b2166dfaf290289
> > > > Author: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > Date:   Tue Jun 16 14:18:25 2015 +0900
> > > > 
> > > >     waf-samba: add new class
> > > >     
> > > >     waf-samba is a build system used by samba related software
> > > > 
> > > > +Joe and Joe and who maintains samba and related recipes +
> > > > meta-networking
> > > > 
> > > > 
> > > > On Tue, Jan 30, 2018 at 1:03 PM, Burton, Ross <ross.burton@inte
> > > > l.com> wrote:
> > > > > Why would they do that?  Shouldn't it be a fatal bug if waf
> > > > > isn't found?
> > > > > On 30 January 2018 at 08:30, Martin Jansa <martin.jansa@gmail
> > > > > .com> wrote:
> > > > > > * there are some recipes like jack and other which inherit
> > > > > > waf-samba
> > > > > > 
> > > > > > which inherits waf, but they don't use waf for configure,
> > > > > > strange isn't
> > > > > > 
> > > > > > it?
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > * fixes:
> > > > > > 
> > > > > > WARNING: libldb-1.1.29-r0 do_configure: Unable to execute
> > > > > > waf --version, exit code 127. Assuming waf version without
> > > > > > bindir/libdir support.
> > > > > > 
> > > > > > WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf
> > > > > > --version, exit code 127. Assuming waf version without
> > > > > > bindir/libdir support.
> > > > > > 
> > > > > > WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute
> > > > > > waf --version, exit code 127. Assuming waf version without
> > > > > > bindir/libdir
> > > > > > 
> > > > > > support.
> > > > > > 
> > > > > > WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure:
> > > > > > Unable to execute waf --version, exit code 1. Assuming waf
> > > > > > version without bindir/libdir support.
> > > > > > 
> > > > > > WARNING: libtevent-0.9.31-r0 do_configure: Unable to
> > > > > > execute waf --version, exit code 127. Assuming waf version
> > > > > > without bindir/libdir support.
> > > > > > 
> > > > > > WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute
> > > > > > waf --version, exit code 127. Assuming waf version without
> > > > > > bindir/libdir support.
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > > 
> > > > > > ---
> > > > > > 
> > > > > >  meta/classes/waf.bbclass | 3 +++
> > > > > > 
> > > > > >  1 file changed, 3 insertions(+)
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > diff --git a/meta/classes/waf.bbclass
> > > > > > b/meta/classes/waf.bbclass
> > > > > > 
> > > > > > index c3e744e5de..eec4d9496d 100644
> > > > > > 
> > > > > > --- a/meta/classes/waf.bbclass
> > > > > > 
> > > > > > +++ b/meta/classes/waf.bbclass
> > > > > > 
> > > > > > @@ -29,6 +29,9 @@ python waf_preconfigure() {
> > > > > > 
> > > > > >      from distutils.version import StrictVersion
> > > > > > 
> > > > > >      srcsubdir = d.getVar('S')
> > > > > > 
> > > > > >      wafbin = os.path.join(srcsubdir, 'waf')
> > > > > > 
> > > > > > +    if not os.path.isfile(wafbin):
> > > > > > 
> > > > > > +        bb.note("%s doesn't exist, cannot check whether it
> > > > > > supports --bindir/--libdir" % wafbin)
> > > > > > 
> > > > > > +        return
> > > > > > 
> > > > > >      status, result = oe.utils.getstatusoutput(wafbin + "
> > > > > > --version")
> > > > > > 
> > > > > >      if status != 0:
> > > > > > 
> > > > > >          bb.warn("Unable to execute waf --version, exit
> > > > > > code %d. Assuming waf version without bindir/libdir
> > > > > > support." % status)
> > > > > > 
> > > > > > 
> > > > > > --
> > > > > > 
> > > > > > 2.15.1
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > --
> > > > > > 
> > > > > > _______________________________________________
> > > > > > 
> > > > > > Openembedded-core mailing list
> > > > > > 
> > > > > > Openembedded-core@lists.openembedded.org
> > > > > > 
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded
> > > > > > -core
> > > > > > 
> > > > 
> > > > 

--=-hFJgq5sZ5kPCHrljDd2A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>Sorry, I wasn't sure if I should make my patc=
h in-reply-to this thread....</div><div><br></div><div>I think I fixed this=
 correctly in <a href=3D"http://lists.openembedded.org/pipermail/openembedd=
ed-core/2018-January/147041.html">http://lists.openembedded.org/pipermail/o=
penembedded-core/2018-January/147041.html</a></div><div><br></div><div>Than=
ks,</div><div>Joshua Watt</div><div><br></div><div>On Wed, 2018-01-31 at 00=
:39 +0100, Martin Jansa wrote:</div><blockquote type=3D"cite" style=3D"marg=
in:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"=
ltr">+Stefan<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Wed, Jan 31, 2018 at 12:38 AM, Martin Jansa <span dir=3D"ltr">&lt;<=
a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gma=
il.com</a>&gt;</span> wrote:<br><blockquote type=3D"cite" style=3D"margin:0=
 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"=
>Thanks Andreas,<div><br></div><div>jack is the only one which inherits waf=
 directly not through waf-samba.</div><div><br></div><div>More surprisingly=
 it also has ${S}/waf it seems:</div><div><a href=3D"https://github.com/jac=
kaudio/jack2/blob/c1647819eed6d11f94b21981d9c869629299f357/waf" target=3D"_=
blank">https://github.com/jackaudio/<wbr>jack2/blob/<wbr>c1647819eed6d11f94=
b21981d9c869<wbr>629299f357/waf</a><br></div><div><br></div><div>So the WAR=
NING: shown for jack probably had different reason than the rest of them an=
d that is:</div><div><br></div><div><div><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:small;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline">jack/1.9=
.12-r0 $&nbsp;</span>jack/1.9.12-r0/git/waf --version</div><div>Error: run =
waf-light from a folder containing waflib<br></div></div><div><br></div><di=
v>it doesn't like running waf from outside ${S} and&nbsp;waf_preconfigure i=
s executed from ${TOPDIR} before do_configure switches to ${S}</div><div><b=
r></div><div>I don't know how common this situation is, if all waf scripts =
are like that, this one (after "cd ../jack/1.9.12-r0/git") says:</div><div>=
waf 1.8.17 (<wbr>cd7579a727d1b390bf9cbf111c1b20<wbr>e811370bc0)<br></div><d=
iv><br></div><div>so I'll leave that to original author to figure it out, I=
 don't use waf anywhere, so I cannot properly test the use case he was tryi=
ng to fix.</div><div><br></div><div>Regards,</div><div><br></div><div><br><=
/div></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Tue, Jan 30, 2018 at 11:41 PM, Andreas=
 M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@gmail.co=
m" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;</span> wrote:<br><bloc=
kquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf so=
lid;padding-left:1ex"><span><br><br>On Tuesday, January 30, 2018, Martin Ja=
nsa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.=
jansa@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite" style=3D"margin=
:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"lt=
r">+Andreas who added waf inherit in jack in:<div><div>commit 0f8f1973e229a=
0799098bc2334416f<wbr>ec8c608b50</div><div>Author: Andreas M=C3=BCller &lt;=
<a href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzel=
tony@googlemail.com</a>&gt;</div><div>Date:&nbsp; &nbsp;Sat Oct 8 12:03:32 =
2016 +0200</div><div><br></div><div>&nbsp; &nbsp; jack: swap to jack2</div>=
</div></div></blockquote></span><div>As far as I can see is jack2 configure=
d with waf. Don't remember why I chose waf-samba. Because I am on business =
trip I cannot take care before next week.</div><span class=3D"m_48462837833=
82334223HOEnZb"><font color=3D"#888888"><div><br></div><div>Andreas</div></=
font></span><div class=3D"m_4846283783382334223HOEnZb"><div class=3D"m_4846=
283783382334223h5"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bo=
rder-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div><br></d=
iv><div>+Bian who added waf samba in:</div><div><div>commit 962e346df99696a=
10657a2ea7b2166<wbr>dfaf290289</div><div>Author: Bian Naimeng &lt;<a href=
=3D"mailto:biannm@cn.fujitsu.com" target=3D"_blank">biannm@cn.fujitsu.com</=
a>&gt;</div><div>Date:&nbsp; &nbsp;Tue Jun 16 14:18:25 2015 +0900</div><div=
><br></div><div>&nbsp; &nbsp; waf-samba: add new class</div><div>&nbsp; &nb=
sp;&nbsp;</div><div>&nbsp; &nbsp; waf-samba is a build system used by samba=
 related software</div></div><div><br></div><div>+Joe and Joe and who maint=
ains samba and related recipes + meta-networking</div><div><br></div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jan 30, 2=
018 at 1:03 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.b=
urton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wro=
te:<br><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2p=
x #729fcf solid;padding-left:1ex"><div dir=3D"ltr">Why would they do that?&=
nbsp; Shouldn't it be a fatal bug if waf isn't found?</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote"><div><div>On 30 January 2018 at 0=
8:30, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gma=
il.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><=
/div></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-lef=
t:2px #729fcf solid;padding-left:1ex"><div><div>* there are some recipes li=
ke jack and other which inherit waf-samba<br>
which inherits waf, but they don't use waf for configure, strange isn't<br>
it?<br>
<br>
* fixes:<br>
WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version, ex=
it code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version, exit=
 code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf --version, =
exit code 127. Assuming waf version without bindir/libdir<br>
support.<br>
WARNING: jack-1.9.10+gitAUTOINC+2d1d323<wbr>505-r0 do_configure: Unable to =
execute waf --version, exit code 1. Assuming waf version without bindir/lib=
dir support.<br>
WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf --version,=
 exit code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version, ex=
it code 127. Assuming waf version without bindir/libdir support.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
&nbsp;meta/classes/waf.bbclass | 3 +++<br>
&nbsp;1 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index c3e744e5de..eec4d9496d 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -29,6 +29,9 @@ python waf_preconfigure() {<br>
&nbsp; &nbsp; &nbsp;from distutils.version import StrictVersion<br>
&nbsp; &nbsp; &nbsp;srcsubdir =3D d.getVar('S')<br>
&nbsp; &nbsp; &nbsp;wafbin =3D os.path.join(srcsubdir, 'waf')<br>
+&nbsp; &nbsp; if not os.path.isfile(wafbin):<br>
+&nbsp; &nbsp; &nbsp; &nbsp; bb.note("%s doesn't exist, cannot check whethe=
r it supports --bindir/--libdir" % wafbin)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; return<br>
&nbsp; &nbsp; &nbsp;status, result =3D oe.utils.getstatusoutput(wafbi<wbr>n=
 + " --version")<br>
&nbsp; &nbsp; &nbsp;if status !=3D 0:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.warn("Unable to execute waf --version,=
 exit code %d. Assuming waf version without bindir/libdir support." % statu=
s)<br>
</div></div><span><font color=3D"#888888"><span><font color=3D"#888888">--<=
br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><br></div>
</blockquote></div><br></div>
<br></blockquote>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>
</blockquote></body></html>

--=-hFJgq5sZ5kPCHrljDd2A--
