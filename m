Received: from mail-lb0-f173.google.com ([209.85.217.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TtJ4J-0007gE-Pf
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 15:25:21 +0100
Received: by mail-lb0-f173.google.com with SMTP id c1so504185lbg.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lY1voeFng1RzeS4qdzL/y6TbPvxKG6KSifXp2mGgVXI=;
	b=t0D5XJob91UogykQNC0ef4xyIg6QcoDMSwTJS6wg/uc9NQGstqtEbgjIgkqpRYGrs7
	XkGxF60p9yGOKuKCyLXfCtEwOALoo89mVSXFRa4wKyIB6hwUouVgngG3m1noxb9hBsQq
	HdKAPbk9ITv7plLFRM7AcE5RWxlJJRoZ7BtIClxadT8uoIbT2fGepCCBJHiahYmJdHlF
	4Dtj9alLbpuDiTLjeYRH1Rh3Z0MFUyLpMURCEeN2LSoUv5RbakB0AzE9PhiTBV5ijLwe
	YmOxE/WlUwoK+RPoRcDirBEYbFJIRHA8LxF4AOCvROdwA0CNLKqLt0gauxG5GK5/xK1R
	TvEA==
MIME-Version: 1.0
Received: by 10.112.46.199 with SMTP id x7mr29303805lbm.109.1357827006270;
	Thu, 10 Jan 2013 06:10:06 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Thu, 10 Jan 2013 06:10:06 -0800 (PST)
In-Reply-To: <50EEC93F.9060802@intel.com>
References: <50EC3002.8050209@intel.com>
	<CADkTA4NFq_EoFY8H800ewKQMWEOMjfroqT0t3okRKJz5jEYZzw@mail.gmail.com>
	<50EEC93F.9060802@intel.com>
Date: Thu, 10 Jan 2013 09:10:06 -0500
Message-ID: <CADkTA4OJMeDCXFdFZVD20tuN04=UCSvpnb_89B706scUN-0Ytw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: update-modules, do we need it anymore?
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
X-List-Received-Date: Thu, 10 Jan 2013 14:25:28 -0000
Content-Type: multipart/alternative; boundary=bcaec5540568600e8604d2efbcec

--bcaec5540568600e8604d2efbcec
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 10, 2013 at 8:59 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

>
>
> On 01/10/2013 03:45 PM, Bruce Ashfield wrote:
> >
> >
> >
> > On Tue, Jan 8, 2013 at 9:41 AM, Laurentiu Palcu
> > <laurentiu.palcu@intel.com <mailto:laurentiu.palcu@intel.com>> wrote:
> >
> >     Hi all,
> >
> >     While working on making all postinstalls run on host, I saw that we
> >     still use update-modules script. However, neither the kmod modprobe
> nor
> >     the busybox one read /etc/modules.conf file anymore which is created
> by
> >     update-modules script. Both scan /etc/modprobe.d/*.conf files.
> >
> >     So, does anybody know why do we still have it around? Most modern
> >     distributions declared update-modules as obsolete and
> /etc/modules.conf
> >     doesn't exist anymore. Am I missing something?
> >
> >
> > I've been using the autoload functionality (not heavily, but from time
> > to time)
> > that is currently tied to update-modules. I did a quick scan of the
> > alternatives
> > in oe-core, and didn't immediately see that the same thing is possible
> via
> > kmod. Is that the case, or am I missing something as well ?
> This autoload functionality seems to be provided by
> /etc/init.d/modutils.sh which is explicitly called from update-modules
> script. However, modutils.sh resides in modutils-initscripts.bb recipe.
> So, I personally see not use for update-modules anymore...
>

I don't have any use for the rest of update-modules, so I don't disagree on
that point. I'd just like to see a form of autoload support be continued if
anything happens to update-modules. But since update-modules isn't
mandatory, I suppose nothing drastic will happen to it regardless, but
having
a modern equivalent would be nice :)

Bruce


>
> Thanks,
> Laurentiu
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >
> >     Thanks,
> >     Laurentiu
> >
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec5540568600e8604d2efbcec
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Jan 10, 2013 at 8:59 AM, Laurentiu Palcu <span dir=3D"ltr">=
&lt;<a href=3D"mailto:laurentiu.palcu@intel.com" target=3D"_blank">laurenti=
u.palcu@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im"><br>
<br>
On 01/10/2013 03:45 PM, Bruce Ashfield wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jan 8, 2013 at 9:41 AM, Laurentiu Palcu<br>
</div><div class=3D"im">&gt; &lt;<a href=3D"mailto:laurentiu.palcu@intel.co=
m">laurentiu.palcu@intel.com</a> &lt;mailto:<a href=3D"mailto:laurentiu.pal=
cu@intel.com">laurentiu.palcu@intel.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt; =A0 =A0 Hi all,<br>
&gt;<br>
&gt; =A0 =A0 While working on making all postinstalls run on host, I saw th=
at we<br>
&gt; =A0 =A0 still use update-modules script. However, neither the kmod mod=
probe nor<br>
&gt; =A0 =A0 the busybox one read /etc/modules.conf file anymore which is c=
reated by<br>
&gt; =A0 =A0 update-modules script. Both scan /etc/modprobe.d/*.conf files.=
<br>
&gt;<br>
&gt; =A0 =A0 So, does anybody know why do we still have it around? Most mod=
ern<br>
&gt; =A0 =A0 distributions declared update-modules as obsolete and /etc/mod=
ules.conf<br>
&gt; =A0 =A0 doesn&#39;t exist anymore. Am I missing something?<br>
&gt;<br>
&gt;<br>
&gt; I&#39;ve been using the autoload functionality (not heavily, but from =
time<br>
&gt; to time)<br>
&gt; that is currently tied to update-modules. I did a quick scan of the<br=
>
&gt; alternatives<br>
&gt; in oe-core, and didn&#39;t immediately see that the same thing is poss=
ible via<br>
&gt; kmod. Is that the case, or am I missing something as well ?<br>
</div>This autoload functionality seems to be provided by<br>
/etc/init.d/modutils.sh which is explicitly called from update-modules<br>
script. However, modutils.sh resides in <a href=3D"http://modutils-initscri=
pts.bb" target=3D"_blank">modutils-initscripts.bb</a> recipe.<br>
So, I personally see not use for update-modules anymore...<br></blockquote>=
<div><br></div><div style>I don&#39;t have any use for the rest of update-m=
odules, so I don&#39;t disagree on</div><div style>that point. I&#39;d just=
 like to see a form of autoload support be continued if</div>
<div style>anything happens to update-modules. But since update-modules isn=
&#39;t</div><div style>mandatory, I suppose nothing drastic will happen to =
it regardless, but having</div><div style>a modern equivalent would be nice=
 :)</div>
<div style><br></div><div style>Bruce</div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Thanks,<br>
Laurentiu<br>
<div class=3D"im">&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; =A0 =A0 Thanks,<br>
&gt; =A0 =A0 Laurentiu<br>
&gt;<br>
&gt; =A0 =A0 _______________________________________________<br>
&gt; =A0 =A0 Openembedded-core mailing list<br>
&gt; =A0 =A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Op=
enembedded-core@lists.openembedded.org</a><br>
</div>&gt; =A0 =A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.ope=
nembedded.org">Openembedded-core@lists.openembedded.org</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt; =A0 =A0 <a href=3D"http://list=
s.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core" target=3D"_blan=
k">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a=
><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt; thee at its end&quot;<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--bcaec5540568600e8604d2efbcec--
