Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TK5VY-0001Ar-Js
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 12:51:52 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so3512538ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2012 03:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=Lm3rvqeTjX3UEl7n0jdHGE84vk5WukXw9P+m7/bqQHE=;
	b=PeyMubD+3TPd3D6ze0G9P3tvArelTdYjSk+DFDXPHQxy/6qS6bseQkLcb7W9o3CQF4
	4Ndd1/Ij2phy842xWyWR0HqgwlbeUmHrAXF+DkdhSGxQQPHbA8t72tF+i1dIr/acP4Ow
	bzjEsIdfgqFc84Qezkq+041sLszcrOOFJMBzEmKr+dMZXzwbfMNnpt70V+JIEKc4wECU
	+uoAKSfS0sHQEFbtPZtQybyeFtZ6rLzddb7d0zviIiuwLC6LCm8hxGWldmiL5wFvrAet
	GoktwsUYPIZTTeVP5A+70tfB2Z7NMmntlfOmX7kGdwMmw0ArUi/suQW7OC9ZEWpV1+eE
	snLg==
Received: by 10.50.209.71 with SMTP id mk7mr719394igc.34.1349433529807; Fri,
	05 Oct 2012 03:38:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.52.8 with HTTP; Fri, 5 Oct 2012 03:38:29 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <20121002163947.GA15881@jama.jama.net>
References: <20120817170934.A810F1032B@opal>
	<20120927205231.GJ3454@jama.jama.net>
	<20121002163947.GA15881@jama.jama.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 5 Oct 2012 13:38:29 +0300
Message-ID: <CAK18fxFhHdFDOHwQ4s3Lk0HiZZF8yrh=ajA7-Q+wvtTc_ROL0Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmzxPN+PZaPtn15S8RHJ96vjZ86mDgB7U764/LZr8XkD1K+0RcVAo9mUJzamqQS4TvWJ5Yz
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Gherzan : busybox: Package hwclock.sh initscript separately
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 10:51:53 -0000
Content-Type: multipart/alternative; boundary=14dae93404f93131aa04cb4d7afc

--14dae93404f93131aa04cb4d7afc
Content-Type: text/plain; charset=ISO-8859-1

Strangely this worked for me... but indeed that was something i missed by
mistake. Thanks.

*ag*

On Tue, Oct 2, 2012 at 7:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Thu, Sep 27, 2012 at 10:52:31PM +0200, Martin Jansa wrote:
> > On Fri, Aug 17, 2012 at 05:09:34PM +0000, git@git.openembedded.orgwrote:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: b97e37e1444ef32e7837dcc79e3fad36c4284b65
> > > URL:
> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=b97e37e1444ef32e7837dcc79e3fad36c4284b65
> > >
> > > Author: Andrei Gherzan <andrei@gherzan.ro>
> > > Date:   Fri Aug 17 00:15:15 2012 +0300
> > >
> > > busybox: Package hwclock.sh initscript separately
> > >
> > > We package this separately to be able to pull this in only if this
> makes
> > > sense for the MACHINE.
> > >
> > > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > >
> > > ---
> > >
> > >  meta/recipes-core/busybox/busybox.inc |    5 +++--
> > >  1 files changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc
> > > index 78239a2..5a5b383 100644
> > > --- a/meta/recipes-core/busybox/busybox.inc
> > > +++ b/meta/recipes-core/busybox/busybox.inc
> > > @@ -14,15 +14,16 @@ SECTION = "base"
> > >  export EXTRA_CFLAGS = "${CFLAGS}"
> > >  export EXTRA_LDFLAGS = "${LDFLAGS}"
> > >
> > > -PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog
> ${PN}-mdev"
> > > +PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog
> ${PN}-mdev ${PN}-hwclock"
> > >
> > >  FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
> > >  FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog*
> ${sysconfdir}/syslog-startup.conf*"
> > >  FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf"
> > >  FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
> > >  FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
> > > +FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
> > >
> > > -INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd
> ${PN}-mdev"
> > > +INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd
> ${PN}-mdev ${PN}-hwclock""
> > >
> > >  INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
> > >  INITSCRIPT_NAME_${PN}-syslog = "syslog"
> >
> > Missing
> > INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
> > ?
> >
> > Did you test it?
> >
> > Here it fails like this:
> > Configuring busybox-hwclock.
> > usage: update-rc.d [-n] [-f] [-r <root>] <basename> remove
> >        update-rc.d [-n] [-r <root>] [-s] <basename> defaults [NN | sNN
> kNN]
> >        update-rc.d [-n] [-r <root>] [-s] <basename> start|stop NN runlvl
> [runlvl] [...] .
> >                 -n: not really
> >                 -f: force
> >                 -v: verbose
> >                 -r: alternate root path (default is /)
> >                 -s: invoke start methods if appropriate to current
> runlevel
> > Collected errors:
> >  * pkg_run_script: package "busybox-hwclock" postinst script returned
> status 1.
> >  * opkg_configure: busybox-hwclock.postinst returned 1.
> >
> > And indeed it's broken:
> > SHR root@qemux86-64 ~ $ cat /var/lib/opkg/info/busybox-hwclock.postinst
> > #!/bin/sh
> > if test "x$D" != "x"; then
> >         OPT="-r $D"
> > else
> >         OPT="-s"
> > fi
> > update-rc.d $OPT ${INITSCRIPT_NAME} defaults
> >
> > Cheers,
>
> Fixed now in master
> Module: openembedded-core.git
> Branch: master
> Commit: 43b4ffc11874803db37c43b521ce27c51c677c8b
> URL:
>
> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=43b4ffc11874803db37c43b521ce27c51c677c8b
>
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Tue Oct  2 17:24:08 2012 +0100
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--14dae93404f93131aa04cb4d7afc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Strangely=A0this=A0worked=A0for me... but indeed that was something i misse=
d by mistake. Thanks.<br clear=3D"all"><div style=3D"text-align:center"></d=
iv><div style=3D"text-align:center"><div align=3D"left" style=3D"font-famil=
y:&#39;Times New Roman&#39;;font-size:medium">

<font face=3D"Arial" color=3D"#333333" size=3D"-1"><br><b>ag</b></font></di=
v></div><br>On Tue, Oct 2, 2012 at 7:39 PM, Martin Jansa <span dir=3D"ltr">=
&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jans=
a@gmail.com</a>&gt;</span> wrote:<br>

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOE=
nZb"><div class=3D"h5">On Thu, Sep 27, 2012 at 10:52:31PM +0200, Martin Jan=
sa wrote:<br>


&gt; On Fri, Aug 17, 2012 at 05:09:34PM +0000, <a href=3D"mailto:git@git.op=
enembedded.org">git@git.openembedded.org</a> wrote:<br>
&gt; &gt; Module: openembedded-core.git<br>
&gt; &gt; Branch: master<br>
&gt; &gt; Commit: b97e37e1444ef32e7837dcc79e3fad36c4284b65<br>
&gt; &gt; URL: =A0 =A0<a href=3D"http://git.openembedded.org/?p=3Dopenembed=
ded-core.git&amp;a=3Dcommit;h=3Db97e37e1444ef32e7837dcc79e3fad36c4284b65" t=
arget=3D"_blank">http://git.openembedded.org/?p=3Dopenembedded-core.git&amp=
;a=3Dcommit;h=3Db97e37e1444ef32e7837dcc79e3fad36c4284b65</a><br>


&gt; &gt;<br>
&gt; &gt; Author: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro">a=
ndrei@gherzan.ro</a>&gt;<br>
&gt; &gt; Date: =A0 Fri Aug 17 00:15:15 2012 +0300<br>
&gt; &gt;<br>
&gt; &gt; busybox: Package hwclock.sh initscript separately<br>
&gt; &gt;<br>
&gt; &gt; We package this separately to be able to pull this in only if thi=
s makes<br>
&gt; &gt; sense for the MACHINE.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherza=
n.ro">andrei@gherzan.ro</a>&gt;<br>
&gt; &gt; Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.co=
m">sgw@linux.intel.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; =A0meta/recipes-core/busybox/busybox.inc | =A0 =A05 +++--<br>
&gt; &gt; =A01 files changed, 3 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes=
-core/busybox/busybox.inc<br>
&gt; &gt; index 78239a2..5a5b383 100644<br>
&gt; &gt; --- a/meta/recipes-core/busybox/busybox.inc<br>
&gt; &gt; +++ b/meta/recipes-core/busybox/busybox.inc<br>
&gt; &gt; @@ -14,15 +14,16 @@ SECTION =3D &quot;base&quot;<br>
&gt; &gt; =A0export EXTRA_CFLAGS =3D &quot;${CFLAGS}&quot;<br>
&gt; &gt; =A0export EXTRA_LDFLAGS =3D &quot;${LDFLAGS}&quot;<br>
&gt; &gt;<br>
&gt; &gt; -PACKAGES =3D+ &quot;${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-=
syslog ${PN}-mdev&quot;<br>
&gt; &gt; +PACKAGES =3D+ &quot;${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-=
syslog ${PN}-mdev ${PN}-hwclock&quot;<br>
&gt; &gt;<br>
&gt; &gt; =A0FILES_${PN}-httpd =3D &quot;${sysconfdir}/init.d/busybox-httpd=
 /srv/www&quot;<br>
&gt; &gt; =A0FILES_${PN}-syslog =3D &quot;${sysconfdir}/init.d/syslog* ${sy=
sconfdir}/syslog-startup.conf*&quot;<br>
&gt; &gt; =A0FILES_${PN}-mdev =3D &quot;${sysconfdir}/init.d/mdev ${sysconf=
dir}/mdev.conf&quot;<br>
&gt; &gt; =A0FILES_${PN}-udhcpd =3D &quot;${sysconfdir}/init.d/busybox-udhc=
pd&quot;<br>
&gt; &gt; =A0FILES_${PN}-udhcpc =3D &quot;${sysconfdir}/udhcpc.d ${datadir}=
/udhcpc&quot;<br>
&gt; &gt; +FILES_${PN}-hwclock =3D &quot;${sysconfdir}/init.d/hwclock.sh&qu=
ot;<br>
&gt; &gt;<br>
&gt; &gt; -INITSCRIPT_PACKAGES =3D &quot;${PN}-httpd ${PN}-syslog ${PN}-udh=
cpd ${PN}-mdev&quot;<br>
&gt; &gt; +INITSCRIPT_PACKAGES =3D &quot;${PN}-httpd ${PN}-syslog ${PN}-udh=
cpd ${PN}-mdev ${PN}-hwclock&quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt; =A0INITSCRIPT_NAME_${PN}-httpd =3D &quot;busybox-httpd&quot;<br>
&gt; &gt; =A0INITSCRIPT_NAME_${PN}-syslog =3D &quot;syslog&quot;<br>
&gt;<br>
&gt; Missing<br>
&gt; INITSCRIPT_NAME_${PN}-hwclock =3D &quot;hwclock.sh&quot;<br>
&gt; ?<br>
&gt;<br>
&gt; Did you test it?<br>
&gt;<br>
&gt; Here it fails like this:<br>
&gt; Configuring busybox-hwclock.<br>
&gt; usage: update-rc.d [-n] [-f] [-r &lt;root&gt;] &lt;basename&gt; remove=
<br>
&gt; =A0 =A0 =A0 =A0update-rc.d [-n] [-r &lt;root&gt;] [-s] &lt;basename&gt=
; defaults [NN | sNN kNN]<br>
&gt; =A0 =A0 =A0 =A0update-rc.d [-n] [-r &lt;root&gt;] [-s] &lt;basename&gt=
; start|stop NN runlvl [runlvl] [...] .<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -n: not really<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -f: force<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -v: verbose<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -r: alternate root path (default is /)=
<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -s: invoke start methods if appropriat=
e to current runlevel<br>
&gt; Collected errors:<br>
&gt; =A0* pkg_run_script: package &quot;busybox-hwclock&quot; postinst scri=
pt returned status 1.<br>
&gt; =A0* opkg_configure: busybox-hwclock.postinst returned 1.<br>
&gt;<br>
&gt; And indeed it&#39;s broken:<br>
&gt; SHR root@qemux86-64 ~ $ cat /var/lib/opkg/info/busybox-hwclock.postins=
t<br>
&gt; #!/bin/sh<br>
&gt; if test &quot;x$D&quot; !=3D &quot;x&quot;; then<br>
&gt; =A0 =A0 =A0 =A0 OPT=3D&quot;-r $D&quot;<br>
&gt; else<br>
&gt; =A0 =A0 =A0 =A0 OPT=3D&quot;-s&quot;<br>
&gt; fi<br>
&gt; update-rc.d $OPT ${INITSCRIPT_NAME} defaults<br>
&gt;<br>
&gt; Cheers,<br>
<br>
</div></div>Fixed now in master<br>
Module: openembedded-core.git<br>
Branch: master<br>
Commit: 43b4ffc11874803db37c43b521ce27c51c677c8b<br>
URL:<br>
<a href=3D"http://git.openembedded.org/?p=3Dopenembedded-core.git&amp;a=3Dc=
ommit;h=3D43b4ffc11874803db37c43b521ce27c51c677c8b" target=3D"_blank">http:=
//git.openembedded.org/?p=3Dopenembedded-core.git&amp;a=3Dcommit;h=3D43b4ff=
c11874803db37c43b521ce27c51c677c8b</a><br>


<br>
Author: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
Date: =A0 Tue Oct =A02 17:24:08 2012 +0100<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</div></div></blockquote></div><br>

--14dae93404f93131aa04cb4d7afc--
