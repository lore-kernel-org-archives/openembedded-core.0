Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UPBot-0002Ms-P9
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 15:09:16 +0200
Received: by mail-wg0-f46.google.com with SMTP id l18so5583115wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 05:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=JV8oztK91fzoMsxtrYwtpVF/iO2kZqN9ue7Tj9JSSuw=;
	b=Ap47qoJ3E/e3MxTYeVqfWL5XiFDmI3ZcKhzS8o4XsLmmgh3p0gVbPLhkpqAu7FFfz6
	eZBLDUvTz8hsgIP27ZzAHRS4q1kbXMA8b7tMNWDC5NfQ8iNJLInSCNYbrEI3/gozF2pZ
	2VuT1+491fBE5liphalL08XIcBxF5ABi+1cxGRFtdj6B0QNtXqJh/7s84vidBObbVF9+
	jIM50+CAJBb1iHVb8V3mosOJ9CgZP9Iuxw2bpk1F20V13IAkuWbEhTdCiiw2e721ntkl
	uKmxGpQ+NxBKAFW2aypdPAHc5VIglVYDq3sBQ/vTSM81+6yJZ//C2aMYQelex2efNw7r
	N2LA==
X-Received: by 10.180.39.207 with SMTP id r15mr12803970wik.16.1365425513421;
	Mon, 08 Apr 2013 05:51:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.40.6 with HTTP; Mon, 8 Apr 2013 05:51:33 -0700 (PDT)
In-Reply-To: <1365423401.12407.33.camel@ted>
References: <1365422283-27630-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1365423401.12407.33.camel@ted>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Mon, 8 Apr 2013 15:51:33 +0300
Message-ID: <CAMZjud0GcZN__rh-MOfwpK6UUdq2yP+noLxtsL0kRWuQWXgdfA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQkt5NvrDSgivUKEOuA/goeodpyJ1NYqqj/QHgW54Nxan1IacNMZeof5WM2AjoXS1l8S5Euu
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Use kill instead of killproc to stop agent
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
X-List-Received-Date: Mon, 08 Apr 2013 13:09:37 -0000
Content-Type: multipart/alternative; boundary=001a11c23f30b1ee0204d9d8e68f

--001a11c23f30b1ee0204d9d8e68f
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 8, 2013 at 3:16 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2013-04-08 at 14:58 +0300, Bogdan Marinescu wrote:
> > From: Ioana Grigoropol <ioanax.grigoropol@intel.com>
>
> Why?
>

Because she is the author of the patch, I've just added a "signed-off-by"
line.

>
> > [Yocto #3928]
>
> I could read this but I shouldn't have to...
>

I've sent the second version of the patch to address this issue.

Thanks,
Bogdan


>
> Cheers,
>
> Richard
>
> > Signed-off-by: Ioana Grigoropol <ioanax.grigoropol@intel.com>
> > Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> > ---
> >  .../tcf-agent/tcf-agent/fix_tcf-agent.init.patch   |    6 ++++--
> >  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git
> a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
> b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
> > index fefaf04..8ea5b43 100644
> > --- a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
> > +++ b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.patch
> > @@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [poky-specific script]
> >       install -c -t $(INSTALLROOT)$(INCLUDE)/tcf/services -m 644
> services/*.h
> >  --- /dev/null
> >  +++ b/tcf-agent.init
> > -@@ -0,0 +1,78 @@
> > +@@ -0,0 +1,80 @@
> >  +#!/bin/sh
> >  +### BEGIN INIT INFO
> >  +# Provides:          tcf-agent
> > @@ -50,14 +50,16 @@ Upstream-Status: Inappropriate [poky-specific script]
> >  +    stop)
> >  +        echo -n "Stopping $DAEMON_NAME: "
> >  +        count=0
> > ++        pid=$(/bin/pidof $DAEMON_PATH)
> >  +        while [ -n "`/bin/pidof $DAEMON_PATH`" -a $count -lt 10 ] ; do
> > -+            killproc $DAEMON_PATH >& /dev/null
> > ++            kill $pid > /dev/null 2>&1
> >  +            sleep 1
> >  +            RETVAL=$?
> >  +            if [ $RETVAL != 0 -o -n "`/bin/pidof $DAEMON_PATH`" ] ;
> then
> >  +                sleep 3
> >  +            fi
> >  +            count=`expr $count + 1`
> > ++            pid=$(/bin/pidof $DAEMON_PATH)
> >  +        done
> >  +        rm -f /var/lock/subsys/$DAEMON_NAME
> >  +        if [ -n "`/bin/pidof $DAEMON_PATH`" ] ; then
> > diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bbb/meta/recipes-devtools/tcf-agent/
> tcf-agent_git.bb
> > index 4d43c62..ced2b41 100644
> > --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> > +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
> >
> >  SRCREV = "4ef94ecb927a8912c3d79ce137182247786cff8f"
> >  PV = "0.4.0+git${SRCPV}"
> > -PR = "r0"
> > +PR = "r1"
> >
> >  SRC_URI = "git://
> git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent.git;protocol=git \
> >             file://fix_ranlib.patch \
>
>
>

--001a11c23f30b1ee0204d9d8e68f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Apr 8, 2013 at 3:16 PM, Richard Purdie <span dir=3D"ltr">&l=
t;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">r=
ichard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Mon, 2013-04-08 at 14:58 +0300, Bogdan Ma=
rinescu wrote:<br>
&gt; From: Ioana Grigoropol &lt;<a href=3D"mailto:ioanax.grigoropol@intel.c=
om">ioanax.grigoropol@intel.com</a>&gt;<br>
<br>
Why?<br></blockquote><div><br></div><div style>Because she is the author of=
 the patch, I&#39;ve just added a &quot;signed-off-by&quot; line.=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">


<br>
&gt; [Yocto #3928]<br>
<br>
I could read this but I shouldn&#39;t have to...<br></blockquote><div><br><=
/div><div style>I&#39;ve sent the second version of the patch to address th=
is issue.</div><div style><br></div><div style>Thanks,</div><div style>

Bogdan</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Signed-off-by: Ioana Grigoropol &lt;<a href=3D"mailto:ioanax.grigoropo=
l@intel.com">ioanax.grigoropol@intel.com</a>&gt;<br>
&gt; Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marines=
cu@intel.com">bogdan.a.marinescu@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =A0.../tcf-agent/tcf-agent/fix_tcf-agent.init.patch =A0 | =A0 =A06 +++=
+--<br>
&gt; =A0meta/recipes-devtools/tcf-agent/<a href=3D"http://tcf-agent_git.bb"=
 target=3D"_blank">tcf-agent_git.bb</a> =A0 | =A0 =A02 +-<br>
&gt; =A02 files changed, 5 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.i=
nit.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.pa=
tch<br>
&gt; index fefaf04..8ea5b43 100644<br>
&gt; --- a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.pat=
ch<br>
&gt; +++ b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_tcf-agent.init.pat=
ch<br>
&gt; @@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [poky-specific script=
]<br>
&gt; =A0 =A0 =A0 install -c -t $(INSTALLROOT)$(INCLUDE)/tcf/services -m 644=
 services/*.h<br>
&gt; =A0--- /dev/null<br>
&gt; =A0+++ b/tcf-agent.init<br>
&gt; -@@ -0,0 +1,78 @@<br>
&gt; +@@ -0,0 +1,80 @@<br>
&gt; =A0+#!/bin/sh<br>
&gt; =A0+### BEGIN INIT INFO<br>
&gt; =A0+# Provides: =A0 =A0 =A0 =A0 =A0tcf-agent<br>
&gt; @@ -50,14 +50,16 @@ Upstream-Status: Inappropriate [poky-specific scri=
pt]<br>
&gt; =A0+ =A0 =A0stop)<br>
&gt; =A0+ =A0 =A0 =A0 =A0echo -n &quot;Stopping $DAEMON_NAME: &quot;<br>
&gt; =A0+ =A0 =A0 =A0 =A0count=3D0<br>
&gt; ++ =A0 =A0 =A0 =A0pid=3D$(/bin/pidof $DAEMON_PATH)<br>
&gt; =A0+ =A0 =A0 =A0 =A0while [ -n &quot;`/bin/pidof $DAEMON_PATH`&quot; -=
a $count -lt 10 ] ; do<br>
&gt; -+ =A0 =A0 =A0 =A0 =A0 =A0killproc $DAEMON_PATH &gt;&amp; /dev/null<br=
>
&gt; ++ =A0 =A0 =A0 =A0 =A0 =A0kill $pid &gt; /dev/null 2&gt;&amp;1<br>
&gt; =A0+ =A0 =A0 =A0 =A0 =A0 =A0sleep 1<br>
&gt; =A0+ =A0 =A0 =A0 =A0 =A0 =A0RETVAL=3D$?<br>
&gt; =A0+ =A0 =A0 =A0 =A0 =A0 =A0if [ $RETVAL !=3D 0 -o -n &quot;`/bin/pido=
f $DAEMON_PATH`&quot; ] ; then<br>
&gt; =A0+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sleep 3<br>
&gt; =A0+ =A0 =A0 =A0 =A0 =A0 =A0fi<br>
&gt; =A0+ =A0 =A0 =A0 =A0 =A0 =A0count=3D`expr $count + 1`<br>
&gt; ++ =A0 =A0 =A0 =A0 =A0 =A0pid=3D$(/bin/pidof $DAEMON_PATH)<br>
&gt; =A0+ =A0 =A0 =A0 =A0done<br>
&gt; =A0+ =A0 =A0 =A0 =A0rm -f /var/lock/subsys/$DAEMON_NAME<br>
&gt; =A0+ =A0 =A0 =A0 =A0if [ -n &quot;`/bin/pidof $DAEMON_PATH`&quot; ] ; =
then<br>
&gt; diff --git a/meta/recipes-devtools/tcf-agent/<a href=3D"http://tcf-age=
nt_git.bb" target=3D"_blank">tcf-agent_git.bb</a> b/meta/recipes-devtools/t=
cf-agent/<a href=3D"http://tcf-agent_git.bb" target=3D"_blank">tcf-agent_gi=
t.bb</a><br>


&gt; index 4d43c62..ced2b41 100644<br>
&gt; --- a/meta/recipes-devtools/tcf-agent/<a href=3D"http://tcf-agent_git.=
bb" target=3D"_blank">tcf-agent_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/tcf-agent/<a href=3D"http://tcf-agent_git.=
bb" target=3D"_blank">tcf-agent_git.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://edl-v10.html;md5=3D5=
22a390a83dc186513f0500543ad3679&quot;<br>
&gt;<br>
&gt; =A0SRCREV =3D &quot;4ef94ecb927a8912c3d79ce137182247786cff8f&quot;<br>
&gt; =A0PV =3D &quot;0.4.0+git${SRCPV}&quot;<br>
&gt; -PR =3D &quot;r0&quot;<br>
&gt; +PR =3D &quot;r1&quot;<br>
&gt;<br>
&gt; =A0SRC_URI =3D &quot;git://<a href=3D"http://git.eclipse.org/gitroot/t=
cf/org.eclipse.tcf.agent.git;protocol=3Dgit" target=3D"_blank">git.eclipse.=
org/gitroot/tcf/org.eclipse.tcf.agent.git;protocol=3Dgit</a> \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 file://fix_ranlib.patch \<br>
<br>
<br>
</div></div></blockquote></div><br></div></div>

--001a11c23f30b1ee0204d9d8e68f--
