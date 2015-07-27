Return-Path: <pespin.shar@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id E515C75874
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 08:27:23 +0000 (UTC)
Received: by lafd3 with SMTP id d3so33981796laf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 01:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nvt/E0XyNATl0xzCmDSs0+RXp85wLbiE90q6Ahq8nZ4=;
	b=mltXNEr9gKW6JgUdmZMWgAzA5vTpRtB/TZiYCS4bQb8z6URbVtixN2bvTzx8C8ybKH
	9CE35kGXsLjglUWmnCSsmIAXA713VjMgNftCqZGcUr6J7FgKy20PUajlb145cRbj7WgM
	uPkf9EhHUHHutMf6Ac0yjKqt6F/HgvfZ1CvS3S+++iFRdTbNqB9Z2dn3yseMZc572exl
	0afvuf3+G1ZuUh19i1GziKQqF9Tfj+ZOSAALyC0Ec5AIK3lKvQMGdz3VwBP6JpP29y8n
	IIO7GcX8mxYxWe20sAoaldgydNQ1KRI6NsEbFkzeY6yhVdi/DBDM/ybxk5NG/wgJ4OjR
	UEnA==
MIME-Version: 1.0
X-Received: by 10.152.19.67 with SMTP id c3mr25819220lae.4.1437985641860; Mon,
	27 Jul 2015 01:27:21 -0700 (PDT)
Received: by 10.25.3.10 with HTTP; Mon, 27 Jul 2015 01:27:21 -0700 (PDT)
In-Reply-To: <CAMKF1spNMSGJ-9+PtFHxGvTjG16GDUJf+8H6iE3aJirLVc7RBA@mail.gmail.com>
References: <1437746580-31696-1-git-send-email-pau.espin@aweurope.be>
	<1437746580-31696-2-git-send-email-pau.espin@aweurope.be>
	<CAMKF1spNMSGJ-9+PtFHxGvTjG16GDUJf+8H6iE3aJirLVc7RBA@mail.gmail.com>
Date: Mon, 27 Jul 2015 10:27:21 +0200
Message-ID: <CAEGpDubt8NaFcuHBhSoUyevjFCHZXa1M6F3vYPDKuDt6MvkytQ@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Pau Espin Pedrol <pau.espin@aweurope.be>
Subject: Re: [PATCH v3 2/3] systemd.bbclass: Use systemd_system_unitdir
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
X-List-Received-Date: Mon, 27 Jul 2015 08:27:24 -0000
Content-Type: multipart/alternative; boundary=089e0149420a601580051bd71f02

--089e0149420a601580051bd71f02
Content-Type: text/plain; charset=UTF-8

Hi Khem,

This series of patches have as an objective to improve systemd support in
OE, specifically improve support for user services.

If you want more information, you can follow the discussion from last patch
version I sent and also the yocto bug report:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7801
http://patches.openembedded.org/patch/97291/



Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

2015-07-25 3:26 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

> On Fri, Jul 24, 2015 at 7:02 AM, Pau Espin Pedrol <pau.espin@aweurope.be>
> wrote:
> > Signed-off-by: Pau Espin Pedrol <pau.espin@aweurope.be>
> > ---
> >  meta/classes/systemd.bbclass | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
> > index cfe1eb5..46e72c7 100644
> > --- a/meta/classes/systemd.bbclass
> > +++ b/meta/classes/systemd.bbclass
> > @@ -136,8 +136,7 @@ python systemd_populate_packages() {
> >      # Check service-files and call systemd_add_files_and_parse for each
> entry
> >      def systemd_check_services():
> >          searchpaths = [oe.path.join(d.getVar("sysconfdir", True),
> "systemd", "system"),]
> > -        searchpaths.append(oe.path.join(d.getVar("nonarch_base_libdir",
> True), "systemd", "system"))
> > -        searchpaths.append(oe.path.join(d.getVar("exec_prefix", True),
> d.getVar("nonarch_base_libdir", True), "systemd", "system"))
> > +        searchpaths.append(d.getVar("systemd_system_unitdir", True))
> >          systemd_packages = d.getVar('SYSTEMD_PACKAGES', True)
> >
> >          keys = 'Also'
> > @@ -185,10 +184,10 @@ python rm_sysvinit_initddir (){
> >      if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d)
> and \
> >          not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True,
> False, d) and \
> >          os.path.exists(sysv_initddir):
> > -        systemd_unitdir = oe.path.join(d.getVar("D", True),
> d.getVar('systemd_unitdir', True), "system")
> > +        systemd_system_unitdir = oe.path.join(d.getVar("D", True),
> d.getVar('systemd_system_unitdir', True))
> >
> > -        # If systemd_unitdir contains anything, delete sysv_initddir
> > -        if (os.path.exists(systemd_unitdir) and
> os.listdir(systemd_unitdir)):
> > +        # If systemd_system_unitdir contains anything, delete
> sysv_initddir
> > +        if (os.path.exists(systemd_system_unitdir) and
> os.listdir(systemd_system_unitdir)):
> >              shutil.rmtree(sysv_initddir)
> >  }
> >  do_install[postfuncs] += "rm_sysvinit_initddir "
>
> what does this patch solve ?
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0149420a601580051bd71f02
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi Khem,<br><br></div>This series of patches hav=
e as an objective to improve systemd support in OE, specifically improve su=
pport for user services.<br><br></div>If you want more information, you can=
 follow the discussion from last patch version I sent and also the yocto bu=
g report:<br><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=
=3D7801">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7801</a><br><a=
 href=3D"http://patches.openembedded.org/patch/97291/">http://patches.opene=
mbedded.org/patch/97291/</a><br><br><br></div><div class=3D"gmail_extra"><b=
r clear=3D"all"><div><div class=3D"gmail_signature">Pau Espin Pedrol<br>mai=
l/jabber: <a href=3D"mailto:pespin.shar@gmail.com" target=3D"_blank">pespin=
.shar@gmail.com</a><br><a href=3D"http://blog.espeweb.net" target=3D"_blank=
">http://blog.espeweb.net</a><br></div></div>
<br><div class=3D"gmail_quote">2015-07-25 3:26 GMT+02:00 Khem Raj <span dir=
=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"HOEnZb"><div class=3D"h5">On Fri, Jul 24, 2015 at 7:02 AM, Pau Espin Pe=
drol &lt;<a href=3D"mailto:pau.espin@aweurope.be">pau.espin@aweurope.be</a>=
&gt; wrote:<br>
&gt; Signed-off-by: Pau Espin Pedrol &lt;<a href=3D"mailto:pau.espin@aweuro=
pe.be">pau.espin@aweurope.be</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/systemd.bbclass | 9 ++++-----<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbcla=
ss<br>
&gt; index cfe1eb5..46e72c7 100644<br>
&gt; --- a/meta/classes/systemd.bbclass<br>
&gt; +++ b/meta/classes/systemd.bbclass<br>
&gt; @@ -136,8 +136,7 @@ python systemd_populate_packages() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Check service-files and call systemd_add_files_a=
nd_parse for each entry<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def systemd_check_services():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths =3D [oe.path.join(d.getV=
ar(&quot;sysconfdir&quot;, True), &quot;systemd&quot;, &quot;system&quot;),=
]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths.append(oe.path.join(d.getVar(=
&quot;nonarch_base_libdir&quot;, True), &quot;systemd&quot;, &quot;system&q=
uot;))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths.append(oe.path.join(d.getVar(=
&quot;exec_prefix&quot;, True), d.getVar(&quot;nonarch_base_libdir&quot;, T=
rue), &quot;systemd&quot;, &quot;system&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 searchpaths.append(d.getVar(&quot;systemd=
_system_unitdir&quot;, True))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd_packages =3D d.getVar(&#39;S=
YSTEMD_PACKAGES&#39;, True)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 keys =3D &#39;Also&#39;<br>
&gt; @@ -185,10 +184,10 @@ python rm_sysvinit_initddir (){<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;systemd&#39;, True, False, d) and \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 not bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;, &#39;sysvinit&#39;, True, False, d) and \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.path.exists(sysv_initddir):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd_unitdir =3D oe.path.join(d.getVar=
(&quot;D&quot;, True), d.getVar(&#39;systemd_unitdir&#39;, True), &quot;sys=
tem&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd_system_unitdir =3D oe.path.join(d=
.getVar(&quot;D&quot;, True), d.getVar(&#39;systemd_system_unitdir&#39;, Tr=
ue))<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If systemd_unitdir contains anything, d=
elete sysv_initddir<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (os.path.exists(systemd_unitdir) and o=
s.listdir(systemd_unitdir)):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If systemd_system_unitdir contains anyt=
hing, delete sysv_initddir<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (os.path.exists(systemd_system_unitdir=
) and os.listdir(systemd_system_unitdir)):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(sysv_ini=
tddir)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 do_install[postfuncs] +=3D &quot;rm_sysvinit_initddir &quot;<br>
<br>
</div></div>what does this patch solve ?<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--089e0149420a601580051bd71f02--
