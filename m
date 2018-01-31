Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 39230787E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:15:01 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id l17so15992908ioc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=lG4d+c78AdN3u5JBlWrnOswhYQZXlobPSLS1csdpgfI=;
	b=I5fsN5OmCR8j5KueNv12zhLlItLFUS4Lw8dZCTk9x+nmZAOOk9NsMnMmNK0Fzy3XsH
	pIN/hZxQQtS0akb8dCWo+ez4RjB4m8IGOaaeDpFNeI71PiXKK5qeuAGXxuH6w2TGf/bE
	NNqCGaSNqnjInnBRwH9xUOgEMzIg6qqjdVNeYvJFpZ6XZ7ECLcjt2eyNOu8muJpcShTs
	6QZ5wy7Smn1i1Paxq8ddNxjLlyoVQsTyH9slbLeR1NwSx/pi2LIAw43Uzuk7Z8ZJROOz
	iDG4PKSNInHCtHZUa5BePQengofOiVMfsp3IYaAJn6XMB+mYwEogu1ck5pmlvCWlBSxq
	Mi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=lG4d+c78AdN3u5JBlWrnOswhYQZXlobPSLS1csdpgfI=;
	b=Mp9C3uvX2NECCDLy9eoGGC+kB2+QOuNdXD/XtNgrMqurtNdZ68+B6cE4FYiTpYZYFl
	vCsiyLlR3WGlfaa9dcMRMBi6TvV7Vx5qsyUXcRFWPtAGPSJwcy7buWTW9OU+HQnwOfYC
	HHMnmU8YUK/F1Dt3Aqn3zewq6b94qyK+RFPwXZpLoi0ZFQtGwL/iQ6GXGkmENwasy+hZ
	c8weEpS2VV2sIxQPvAoy9HhGJz1/t8JGeNxbdOfYS0J8amKmzocC8PEzwsrpoo5s7p0p
	neSSFEV6F9dO3aGQtOsGWOQqPhwzWz5WSehbmHg8cuDrUwbpiUlf0yF3wWYoi7fvm645
	FYfQ==
X-Gm-Message-State: AKwxytfvRvoHOFNqOU3ejo6A2HLf5P0SJ/KwAJEbHm3ft3Rjkbf3bHIn
	F6QGjUD5I1b2t+1E38muurQ=
X-Google-Smtp-Source: AH8x224raZPUs76U9i2rfmpR4BVmjPr7b/f796IJv5KTfoVo13gM+RPzfW5GVBjoSd1D4kpL2vN3YA==
X-Received: by 10.107.104.8 with SMTP id d8mr34380911ioc.119.1517418903112;
	Wed, 31 Jan 2018 09:15:03 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	o73sm3627524ito.4.2018.01.31.09.15.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Jan 2018 09:15:02 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1517418902.31752.88.camel@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 31 Jan 2018 11:15:02 -0600
In-Reply-To: <CA+chaQcD1Xt04c4A=1J3eNS-vd_1Bw04A0aV=oQ211ONo1ZAuQ@mail.gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
	<CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
	<CALbNGRSkvxi3AWkzZcsipSspQnEjsdZ4VKwbFGRN0o9tY4G2-A@mail.gmail.com>
	<CA+chaQdBgGX-K3fb15L6LR6f=iFZUkvb250xK5+4pjPyrYbf4w@mail.gmail.com>
	<CA+chaQc+r5U7_W=rhKRzxaG16Lk6SYBBD=UBvdqNvbZ2N74Bjw@mail.gmail.com>
	<1517418291.31752.85.camel@gmail.com>
	<CA+chaQcD1Xt04c4A=1J3eNS-vd_1Bw04A0aV=oQ211ONo1ZAuQ@mail.gmail.com>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Cc: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>,
	Joe Slater <jslater@windriver.com>,
	Stefan Agner <stefan.agner@toradex.com>,
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
X-List-Received-Date: Wed, 31 Jan 2018 17:15:02 -0000
Content-Type: multipart/alternative; boundary="=-8GBq7TMbZr/Lw/tjoC9C"

--=-8GBq7TMbZr/Lw/tjoC9C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-31 at 18:07 +0100, Martin Jansa wrote:
> What about the recipes which don't have ${S}/waf at all (and might
> inherit waf from possibly wrong reasons), like all those waf-samba
> recipes mentioned before?

Ya, sorry I should have clarified: This should fix it for recipes that
only include waf.bbclass (e.g. jack and my local waf recipes that were
also getting the same error). I still think that perhaps waf-
samba.bbclass probably shouldn't be inheriting from waf.bbclass if the
intent is that those projects doesn't actually have ${S}/waf.... but to
be fair I haven't looked closely at the recipes that inherit waf-
samba.bbclass.
> On Wed, Jan 31, 2018 at 6:04 PM, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > Sorry, I wasn't sure if I should make my patch in-reply-to this
> > thread....
> > 
> > I think I fixed this correctly in http://lists.openembedded.org/pip
> > ermail/openembedded-core/2018-January/147041.html
> > 
> > Thanks,
> > Joshua Watt
> > 
> > On Wed, 2018-01-31 at 00:39 +0100, Martin Jansa wrote:
> > > +Stefan
> > > 
> > > On Wed, Jan 31, 2018 at 12:38 AM, Martin Jansa <martin.jansa@gmai
> > > l.com> wrote:
> > > > Thanks Andreas,
> > > > jack is the only one which inherits waf directly not through
> > > > waf-samba.
> > > > 
> > > > More surprisingly it also has ${S}/waf it seems:
> > > > https://github.com/jackaudio/jack2/blob/c1647819eed6d11f94b2198
> > > > 1d9c869629299f357/waf
> > > > 
> > > > So the WARNING: shown for jack probably had different reason
> > > > than the rest of them and that is:
> > > > 
> > > > jack/1.9.12-r0 $ jack/1.9.12-r0/git/waf --version
> > > > Error: run waf-light from a folder containing waflib
> > > > 
> > > > 
> > > > it doesn't like running waf from outside ${S}
> > > > and waf_preconfigure is executed from ${TOPDIR} before
> > > > do_configure switches to ${S}
> > > > 
> > > > I don't know how common this situation is, if all waf scripts
> > > > are like that, this one (after "cd ../jack/1.9.12-r0/git")
> > > > says:
> > > > waf 1.8.17 (cd7579a727d1b390bf9cbf111c1b20e811370bc0)
> > > > 
> > > > so I'll leave that to original author to figure it out, I don't
> > > > use waf anywhere, so I cannot properly test the use case he was
> > > > trying to fix.
> > > > 
> > > > Regards,
> > > > 
> > > > 
> > > > 
> > > > 
> > > > On Tue, Jan 30, 2018 at 11:41 PM, Andreas Müller <schnitzeltony
> > > > @gmail.com> wrote:
> > > > > On Tuesday, January 30, 2018, Martin Jansa <martin.jansa@gmai
> > > > > l.com> wrote:
> > > > > > +Andreas who added waf inherit in jack in:commit
> > > > > > 0f8f1973e229a0799098bc2334416fec8c608b50
> > > > > > Author: Andreas Müller <schnitzeltony@googlemail.com>
> > > > > > Date:   Sat Oct 8 12:03:32 2016 +0200
> > > > > > 
> > > > > >     jack: swap to jack2
> > > > > As far as I can see is jack2 configured with waf. Don't
> > > > > remember why I chose waf-samba. Because I am on business trip
> > > > > I cannot take care before next week.
> > > > > 
> > > > > Andreas
> > > > > > +Bian who added waf samba in:
> > > > > > commit 962e346df99696a10657a2ea7b2166dfaf290289
> > > > > > Author: Bian Naimeng <biannm@cn.fujitsu.com>
> > > > > > Date:   Tue Jun 16 14:18:25 2015 +0900
> > > > > > 
> > > > > >     waf-samba: add new class
> > > > > >     
> > > > > >     waf-samba is a build system used by samba related
> > > > > > software
> > > > > > 
> > > > > > +Joe and Joe and who maintains samba and related recipes +
> > > > > > meta-networking
> > > > > > 
> > > > > > 
> > > > > > On Tue, Jan 30, 2018 at 1:03 PM, Burton, Ross <ross.burton@
> > > > > > intel.com> wrote:
> > > > > > > Why would they do that?  Shouldn't it be a fatal bug if
> > > > > > > waf isn't found?
> > > > > > > On 30 January 2018 at 08:30, Martin Jansa <martin.jansa@g
> > > > > > > mail.com> wrote:
> > > > > > > > * there are some recipes like jack and other which
> > > > > > > > inherit waf-samba
> > > > > > > > 
> > > > > > > > which inherits waf, but they don't use waf for
> > > > > > > > configure, strange isn't
> > > > > > > > 
> > > > > > > > it?
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > * fixes:
> > > > > > > > 
> > > > > > > > WARNING: libldb-1.1.29-r0 do_configure: Unable to
> > > > > > > > execute waf --version, exit code 127. Assuming waf
> > > > > > > > version without bindir/libdir support.
> > > > > > > > 
> > > > > > > > WARNING: samba-4.6.7-r0 do_configure: Unable to execute
> > > > > > > > waf --version, exit code 127. Assuming waf version
> > > > > > > > without bindir/libdir support.
> > > > > > > > 
> > > > > > > > WARNING: libtalloc-2.1.9-r0 do_configure: Unable to
> > > > > > > > execute waf --version, exit code 127. Assuming waf
> > > > > > > > version without bindir/libdir
> > > > > > > > 
> > > > > > > > support.
> > > > > > > > 
> > > > > > > > WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0
> > > > > > > > do_configure: Unable to execute waf --version, exit
> > > > > > > > code 1. Assuming waf version without bindir/libdir
> > > > > > > > support.
> > > > > > > > 
> > > > > > > > WARNING: libtevent-0.9.31-r0 do_configure: Unable to
> > > > > > > > execute waf --version, exit code 127. Assuming waf
> > > > > > > > version without bindir/libdir support.
> > > > > > > > 
> > > > > > > > WARNING: libtdb-1.3.14-r0 do_configure: Unable to
> > > > > > > > execute waf --version, exit code 127. Assuming waf
> > > > > > > > version without bindir/libdir support.
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > > > > 
> > > > > > > > ---
> > > > > > > > 
> > > > > > > >  meta/classes/waf.bbclass | 3 +++
> > > > > > > > 
> > > > > > > >  1 file changed, 3 insertions(+)
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > diff --git a/meta/classes/waf.bbclass
> > > > > > > > b/meta/classes/waf.bbclass
> > > > > > > > 
> > > > > > > > index c3e744e5de..eec4d9496d 100644
> > > > > > > > 
> > > > > > > > --- a/meta/classes/waf.bbclass
> > > > > > > > 
> > > > > > > > +++ b/meta/classes/waf.bbclass
> > > > > > > > 
> > > > > > > > @@ -29,6 +29,9 @@ python waf_preconfigure() {
> > > > > > > > 
> > > > > > > >      from distutils.version import StrictVersion
> > > > > > > > 
> > > > > > > >      srcsubdir = d.getVar('S')
> > > > > > > > 
> > > > > > > >      wafbin = os.path.join(srcsubdir, 'waf')
> > > > > > > > 
> > > > > > > > +    if not os.path.isfile(wafbin):
> > > > > > > > 
> > > > > > > > +        bb.note("%s doesn't exist, cannot check
> > > > > > > > whether it supports --bindir/--libdir" % wafbin)
> > > > > > > > 
> > > > > > > > +        return
> > > > > > > > 
> > > > > > > >      status, result = oe.utils.getstatusoutput(wafbin +
> > > > > > > > " --version")
> > > > > > > > 
> > > > > > > >      if status != 0:
> > > > > > > > 
> > > > > > > >          bb.warn("Unable to execute waf --version, exit
> > > > > > > > code %d. Assuming waf version without bindir/libdir
> > > > > > > > support." % status)
> > > > > > > > 
> > > > > > > > 
> > > > > > > > --
> > > > > > > > 
> > > > > > > > 2.15.1
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > --
> > > > > > > > 
> > > > > > > > _______________________________________________
> > > > > > > > 
> > > > > > > > Openembedded-core mailing list
> > > > > > > > 
> > > > > > > > Openembedded-core@lists.openembedded.org
> > > > > > > > 
> > > > > > > > http://lists.openembedded.org/mailman/listinfo/openembe
> > > > > > > > dded-core
> > > > > > > > 
> > > > > > 
> > > > > > 

--=-8GBq7TMbZr/Lw/tjoC9C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Wed, 2018-01-31 at 18:07 +0100, Martin Jan=
sa wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr">What about the r=
ecipes which don't have ${S}/waf at all (and might inherit waf from possibl=
y wrong reasons), like all those waf-samba recipes mentioned before?</div><=
/blockquote><div><br></div><div>Ya, sorry I should have clarified: This sho=
uld fix it for recipes that only include waf.bbclass (e.g. jack and my loca=
l waf recipes that were also getting the same error). I still think that pe=
rhaps waf-samba.bbclass probably shouldn't be inheriting from waf.bbclass i=
f the intent is that those projects doesn't actually have ${S}/waf.... but =
to be fair I haven't looked closely at the recipes that inherit waf-samba.b=
bclass.</div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0=
 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Wed, Jan 31, 2018 at 6:04 PM, Josh=
ua Watt <span dir=3D"ltr">&lt;<a href=3D"mailto:jpewhacker@gmail.com" targe=
t=3D"_blank">jpewhacker@gmail.com</a>&gt;</span> wrote:<br><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div><div>Sorry, I wasn't sure if I should make my patch in-repl=
y-to this thread....</div><div><br></div><div>I think I fixed this correctl=
y in <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2=
018-January/147041.html" target=3D"_blank">http://lists.openembedded.org/<w=
br>pipermail/openembedded-core/<wbr>2018-January/147041.html</a></div><div>=
<br></div><div>Thanks,</div><div>Joshua Watt</div><div><div class=3D"h5"><d=
iv><br></div><div>On Wed, 2018-01-31 at 00:39 +0100, Martin Jansa wrote:</d=
iv><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #7=
29fcf solid;padding-left:1ex"><div dir=3D"ltr">+Stefan<br></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Jan 31, 2018 at 12:=
38 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gm=
ail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br>=
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid;padding-left:1ex"><div dir=3D"ltr">Thanks Andreas,<div><br></div><=
div>jack is the only one which inherits waf directly not through waf-samba.=
</div><div><br></div><div>More surprisingly it also has ${S}/waf it seems:<=
/div><div><a href=3D"https://github.com/jackaudio/jack2/blob/c1647819eed6d1=
1f94b21981d9c869629299f357/waf" target=3D"_blank">https://github.com/jackau=
dio/j<wbr>ack2/blob/c1647819eed6d11f94b2<wbr>1981d9c869629299f357/waf</a><b=
r></div><div><br></div><div>So the WARNING: shown for jack probably had dif=
ferent reason than the rest of them and that is:</div><div><br></div><div><=
div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">jack/1.9.12-r0 $&nbsp;</span>jack/1.9.12-r0/g=
it/waf --version</div><div>Error: run waf-light from a folder containing wa=
flib<br></div></div><div><br></div><div>it doesn't like running waf from ou=
tside ${S} and&nbsp;waf_preconfigure is executed from ${TOPDIR} before do_c=
onfigure switches to ${S}</div><div><br></div><div>I don't know how common =
this situation is, if all waf scripts are like that, this one (after "cd ..=
/jack/1.9.12-r0/git") says:</div><div>waf 1.8.17 (cd7579a727d1b390bf9cbf111=
c1b2<wbr>0e811370bc0)<br></div><div><br></div><div>so I'll leave that to or=
iginal author to figure it out, I don't use waf anywhere, so I cannot prope=
rly test the use case he was trying to fix.</div><div><br></div><div>Regard=
s,</div><div><br></div><div><br></div></div><div class=3D"m_-68816811344994=
72655HOEnZb"><div class=3D"m_-6881681134499472655h5"><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Tue, Jan 30, 2018 at 11:41 PM, Andre=
as M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@gmail.=
com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf =
solid;padding-left:1ex"><span><br><br>On Tuesday, January 30, 2018, Martin =
Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">marti=
n.jansa@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite" style=3D"marg=
in:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"=
ltr">+Andreas who added waf inherit in jack in:<div><div>commit 0f8f1973e22=
9a0799098bc2334416f<wbr>ec8c608b50</div><div>Author: Andreas M=C3=BCller &l=
t;<a href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitz=
eltony@googlemail.com</a>&gt;</div><div>Date:&nbsp; &nbsp;Sat Oct 8 12:03:3=
2 2016 +0200</div><div><br></div><div>&nbsp; &nbsp; jack: swap to jack2</di=
v></div></div></blockquote></span><div>As far as I can see is jack2 configu=
red with waf. Don't remember why I chose waf-samba. Because I am on busines=
s trip I cannot take care before next week.</div><span class=3D"m_-68816811=
34499472655m_4846283783382334223HOEnZb"><font color=3D"#888888"><div><br></=
div><div>Andreas</div></font></span><div class=3D"m_-6881681134499472655m_4=
846283783382334223HOEnZb"><div class=3D"m_-6881681134499472655m_48462837833=
82334223h5"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-le=
ft:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div><div=
>+Bian who added waf samba in:</div><div><div>commit 962e346df99696a10657a2=
ea7b2166<wbr>dfaf290289</div><div>Author: Bian Naimeng &lt;<a href=3D"mailt=
o:biannm@cn.fujitsu.com" target=3D"_blank">biannm@cn.fujitsu.com</a>&gt;</d=
iv><div>Date:&nbsp; &nbsp;Tue Jun 16 14:18:25 2015 +0900</div><div><br></di=
v><div>&nbsp; &nbsp; waf-samba: add new class</div><div>&nbsp; &nbsp;&nbsp;=
</div><div>&nbsp; &nbsp; waf-samba is a build system used by samba related =
software</div></div><div><br></div><div>+Joe and Joe and who maintains samb=
a and related recipes + meta-networking</div><div><br></div></div><div clas=
s=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jan 30, 2018 at 1:=
03 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@int=
el.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><b=
lockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf=
 solid;padding-left:1ex"><div dir=3D"ltr">Why would they do that?&nbsp; Sho=
uldn't it be a fatal bug if waf isn't found?</div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote"><div><div>On 30 January 2018 at 08:30, Mar=
tin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br></div></di=
v><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #72=
9fcf solid;padding-left:1ex"><div><div>* there are some recipes like jack a=
nd other which inherit waf-samba<br>
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
</blockquote></div></div></div></blockquote></div><br></div>
</blockquote></body></html>

--=-8GBq7TMbZr/Lw/tjoC9C--
