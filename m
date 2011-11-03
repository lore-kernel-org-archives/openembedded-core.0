Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RM084-0000vo-LC
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 17:27:00 +0100
Received: by ggnj1 with SMTP id j1so1416135ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 09:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=04hKh0iqb81GAqtI9RPTzFtzNmGMAvlv9ssyvJQTpMc=;
	b=ms6vEdpB5BYn+YXQ1NXI/BUPDL/InEPIunz+lqqgx2oFc+Mtd2gjqjekR1je+UaxAg
	w0kLRSpyAybEJJSYme/rGdNQXoWe3FJ5Ks86/KWXvOcKGxy4EbqYR6TTPTAzNdwZAnoA
	kfuu7BcJ0Zys/i+MrVCbyELnLDkH0kWsL1cG8=
MIME-Version: 1.0
Received: by 10.150.69.4 with SMTP id r4mr10325804yba.53.1320337248719; Thu,
	03 Nov 2011 09:20:48 -0700 (PDT)
Received: by 10.150.216.19 with HTTP; Thu, 3 Nov 2011 09:20:48 -0700 (PDT)
In-Reply-To: <4EB196D0.5010005@windriver.com>
References: <1319780499.10032.46.camel@localhost.localdomain>
	<CAGiJk9eo4FvhLZ6o9qdb75YyuZ5om19GYRLR6gDFEN_r0VWeuw@mail.gmail.com>
	<1319785517.10032.48.camel@localhost.localdomain>
	<CAAQYJAtJsSRSN5jLzK65iKUJPorc8h+RjqcnQBw2pyK34+ejjQ@mail.gmail.com>
	<4EAABF76.7080703@windriver.com>
	<1320021891.10032.56.camel@localhost.localdomain>
	<CAAQYJAt2ghQNxzw9EnpfChW0QrwepQLbSFcYD4AP+E32n4Wc5g@mail.gmail.com>
	<4EB196D0.5010005@windriver.com>
Date: Thu, 3 Nov 2011 17:20:48 +0100
Message-ID: <CAAQYJAtNdcD75omqL+8WeeG5NG4oFmYvwJUv-t+QsXpsZjUdNA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to set time zone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 03 Nov 2011 16:27:01 -0000
Content-Type: multipart/alternative; boundary=000e0cd3429ab1954204b0d6f83e

--000e0cd3429ab1954204b0d6f83e
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 2, 2011 at 8:15 PM, Mark Hatle <mark.hatle@windriver.com> wrote:

> On 11/2/11 12:32 PM, Andrea Adami wrote:
> > On Mon, Oct 31, 2011 at 1:44 AM, Ni Qingliang <
> niqingliang@insigma.com.cn
> > <mailto:niqingliang@insigma.com.cn>> wrote:
> >
> >     I'd like the 'system level configuration' solution.
> >
> >     the /etc/localtime/ link can be done when packaging rootfs (using the
> >     system level configuration).
> >
> >     On Fri, 2011-10-28 at 22:43 +0800, Mark Hatle wrote:
> >     > Setting the default TZ for the image is something that should be
> done in a
> >     post
> >     > install script for the tzdata package or something similar.
> >     >
> >     > Since the /etc/localtime is usually a copy/hardlink or symlink to
> the timezone
> >     > data we don't want to package it up.  Instead we want to perform
> the actions
> >     > that a program running on the target system itself would use to
> change the
> >     timezone.
> >     >
> >     > So I think the easiest approach is to add a system level
> configuration
> >     variable
> >     > (set the default).
> >     >
> >     > Then use this variable to populate the configuration file that
> specifies the
> >     > system timezone... and then use the post install process to check
> the contents
> >     > of a text file.
> >     >
> >     > Alternatively do this via an initscript -- but for folks w/
> read-only
> >     > filesystems I'm not sure that will work.
> >     >
> >     > --Mark
> >
> > <cut>
> >
> > Maybe I misunderstand "system level configuration" but in the meta-oe
> recipe we have
> >
> > DEFAULT_TIMEZONE ?= "Europe/London"
> >
> > Maybe UTC would be better?
>
> To me no timezone (which is UTC) is preferable as the system designer can
> then
> set the timezone, externally to the package(s).
>
> > Note how the variable is weak thus can be overridden in local.conf.
> >
> > Secondly, why do it as post-install or at image do_rootfs stage when we
> have set
> > the variable and are therefore able to provide sane defaults in
> do_install?
>
> If it's done within a do_install, then the file (/etc/timezone) itself gets
> placed into the package.  If it's in the package, then if/when someone
> upgrades
> the package from a feed the timezone gets reset to the previous value.
>  That's a
> bug IMHO.
>

Sure, I overlooked that!


> If it's done as a post-install script, then the timezone configuration can
> be
> evaluated and if one isn't set -- or there is no timezone file -- then we
> can
> set it to UTC or a similar default timezone.. (the value in the
> DEFAULT_TIMEZONE
> variable is reasonable in this approach.)
>
> maybe "Factory" then?
See post-install script example:
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-libs/timezone-data/timezone-data-2011k.ebuild


> > Other points before starting to write a patch:
> > -why is the recipe in oe-core doing   chown -R root:root ${D}   ?
>
> There was an issue with the way the timezone data was
> extracted/constructed that
> it was have all of the build system's uid/gid preserved in the copy to the
> final
> install directory -- so when packaging incorrect usernames and groups were
> fed
> into the process causing issues.
>
> A simple chown -R root:root ${D} ensured that all of the timezone data was
> owned
> by the root user (on the target).
>
> > -the logic around   # libc is removing zoneinfo files from package
> >   Is it only eglibc?
>

> Timezone info is updated more often then the system libc.  So the zoneinfo
> files
> are handled externally of the libc.  This allows for easier updates over
> time..
> (This is my guess, as I'm not familiar with exactly what this comment
> refers to.)
>
> Comments in meta-oe recipe would suggest that apparently only eglibc is
removing zoneinfo file.

       # Only eglibc is removing zoneinfo files from package
        if [ "${LIBC}"x = "eglibc"x ] ; then
          cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
          cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
        fi


Being that we need the files on first boot, I'm not against providing
'Factory' settings during image do_rootfs or even in base-files.
The settings of timezone and locale (and keyboard) are typically done by
user on first boot, at least in graphical environments.

Thanks for your comments!

Regards


Andrea

--000e0cd3429ab1954204b0d6f83e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Nov 2, 2011 at 8:15 PM, Mark Hatle <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">On 11/2/11 12:32 PM, Andrea Adami wrote:<br>
&gt; On Mon, Oct 31, 2011 at 1:44 AM, Ni Qingliang &lt;<a href=3D"mailto:ni=
qingliang@insigma.com.cn">niqingliang@insigma.com.cn</a><br>
</div><div><div></div><div class=3D"h5">&gt; &lt;mailto:<a href=3D"mailto:n=
iqingliang@insigma.com.cn">niqingliang@insigma.com.cn</a>&gt;&gt; wrote:<br=
>
&gt;<br>
&gt; =A0 =A0 I&#39;d like the &#39;system level configuration&#39; solution=
.<br>
&gt;<br>
&gt; =A0 =A0 the /etc/localtime/ link can be done when packaging rootfs (us=
ing the<br>
&gt; =A0 =A0 system level configuration).<br>
&gt;<br>
&gt; =A0 =A0 On Fri, 2011-10-28 at 22:43 +0800, Mark Hatle wrote:<br>
&gt; =A0 =A0 &gt; Setting the default TZ for the image is something that sh=
ould be done in a<br>
&gt; =A0 =A0 post<br>
&gt; =A0 =A0 &gt; install script for the tzdata package or something simila=
r.<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; Since the /etc/localtime is usually a copy/hardlink or sy=
mlink to the timezone<br>
&gt; =A0 =A0 &gt; data we don&#39;t want to package it up. =A0Instead we wa=
nt to perform the actions<br>
&gt; =A0 =A0 &gt; that a program running on the target system itself would =
use to change the<br>
&gt; =A0 =A0 timezone.<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; So I think the easiest approach is to add a system level =
configuration<br>
&gt; =A0 =A0 variable<br>
&gt; =A0 =A0 &gt; (set the default).<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; Then use this variable to populate the configuration file=
 that specifies the<br>
&gt; =A0 =A0 &gt; system timezone... and then use the post install process =
to check the contents<br>
&gt; =A0 =A0 &gt; of a text file.<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; Alternatively do this via an initscript -- but for folks =
w/ read-only<br>
&gt; =A0 =A0 &gt; filesystems I&#39;m not sure that will work.<br>
&gt; =A0 =A0 &gt;<br>
&gt; =A0 =A0 &gt; --Mark<br>
&gt;<br>
&gt; &lt;cut&gt;<br>
&gt;<br>
&gt; Maybe I misunderstand &quot;system level configuration&quot; but in th=
e meta-oe recipe we have<br>
&gt;<br>
&gt; DEFAULT_TIMEZONE ?=3D &quot;Europe/London&quot;<br>
&gt;<br>
&gt; Maybe UTC would be better?<br>
<br>
</div></div>To me no timezone (which is UTC) is preferable as the system de=
signer can then<br>
set the timezone, externally to the package(s).<br>
<div class=3D"im"><br>
&gt; Note how the variable is weak thus can be overridden in local.conf.<br=
>
&gt;<br>
&gt; Secondly, why do it as post-install or at image do_rootfs stage when w=
e have set<br>
&gt; the variable and are therefore able to provide sane defaults in do_ins=
tall?<br>
<br>
</div>If it&#39;s done within a do_install, then the file (/etc/timezone) i=
tself gets<br>
placed into the package. =A0If it&#39;s in the package, then if/when someon=
e upgrades<br>
the package from a feed the timezone gets reset to the previous value. =A0T=
hat&#39;s a<br>
bug IMHO.<br></blockquote><div><br>Sure, I overlooked that!<br><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-=
left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
If it&#39;s done as a post-install script, then the timezone configuration =
can be<br>
evaluated and if one isn&#39;t set -- or there is no timezone file -- then =
we can<br>
set it to UTC or a similar default timezone.. (the value in the DEFAULT_TIM=
EZONE<br>
variable is reasonable in this approach.)<br>
<div class=3D"im"><br></div></blockquote><div>maybe &quot;Factory&quot; the=
n?<br>See post-install script example:=A0 <br><a href=3D"http://sources.gen=
too.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-libs/timezone-data/timezone-data-=
2011k.ebuild">http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-l=
ibs/timezone-data/timezone-data-2011k.ebuild</a><br>

=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt=
 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><div=
 class=3D"im">
&gt; Other points before starting to write a patch:<br>
&gt; -why is the recipe in oe-core doing =A0 chown -R root:root ${D} =A0 ?<=
br>
<br>
</div>There was an issue with the way the timezone data was extracted/const=
ructed that<br>
it was have all of the build system&#39;s uid/gid preserved in the copy to =
the final<br>
install directory -- so when packaging incorrect usernames and groups were =
fed<br>
into the process causing issues.<br>
<br>
A simple chown -R root:root ${D} ensured that all of the timezone data was =
owned<br>
by the root user (on the target).<br>
<div class=3D"im"><br>
&gt; -the logic around =A0 # libc is removing zoneinfo files from package<b=
r>
&gt; =A0 Is it only eglibc?<br></div></blockquote><div></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px so=
lid rgb(204, 204, 204); padding-left: 1ex;"><div class=3D"im">
<br>
</div>Timezone info is updated more often then the system libc. =A0So the z=
oneinfo files<br>
are handled externally of the libc. =A0This allows for easier updates over =
time..<br>
(This is my guess, as I&#39;m not familiar with exactly what this comment r=
efers to.)<br>
<div><div></div><div class=3D"h5"><br></div></div></blockquote><div>Comment=
s in meta-oe recipe would suggest that apparently only eglibc is removing z=
oneinfo file.<br><br>=A0=A0=A0=A0=A0=A0 # Only eglibc is removing zoneinfo =
files from package<br>
=A0=A0=A0=A0=A0=A0=A0 if [ &quot;${LIBC}&quot;x =3D &quot;eglibc&quot;x ] ;=
 then<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0 cp -pP &quot;${S}/zone.tab&quot; ${D}$=
{datadir}/zoneinfo<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0 cp -pP &quot;${S}/iso3166=
.tab&quot; ${D}${datadir}/zoneinfo<br>=A0=A0=A0=A0=A0=A0=A0 fi<code><br>
</code></div></div><br><br>Being that we need the files on first boot, I&#3=
9;m not against providing &#39;Factory&#39; settings during image do_rootfs=
 or even in base-files.<br>The settings of timezone and locale (and keyboar=
d) are typically done by user on first boot, at least in graphical environm=
ents.<br>
<br>Thanks for your comments!<br><br>Regards<br><br><br>Andrea<br>

--000e0cd3429ab1954204b0d6f83e--
