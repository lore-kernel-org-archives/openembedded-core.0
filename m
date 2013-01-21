Received: from mail-la0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Tx6O7-0001nl-36
	for Openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 02:41:27 +0100
Received: by mail-la0-f42.google.com with SMTP id fe20so5610550lab.1
	for <Openembedded-core@lists.openembedded.org>;
	Sun, 20 Jan 2013 17:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=ugnpuq9QlY29/IyeyRl6d4/M/OIPXaCjIx1HINIdp0w=;
	b=esLBnHRiGOLhztSwaP9mbzuqPN5aTFe91M8tazNr0tdfci15nVGagFPxQMsRs/t9Jo
	msf+Bhdbos8SKHF2LMgFEGTjYqrOHB0p28iq3yDX9JhZa9dj+gcaZudR1gwE7LDT5G09
	jhCPs3JUTNppGd2nKhX/ylP6VQvle5WImEZcUVHfYZPAjD4AV3lgBjhBHk0hl5eGSzTp
	XlY6q+h6DjVk3r0pJ1gualz345zvRry0StmdrwltC5gGTn8EoDHjmWuV+++Rdm/0s852
	s0xHSBeSegJDzWGDSUxXyq2pIqlsPJLz5aeJjRBoaSusBVhxDUU/EflWrxSIluG4x+xb
	jBNg==
MIME-Version: 1.0
X-Received: by 10.112.9.10 with SMTP id v10mr5020646lba.128.1358731558937;
	Sun, 20 Jan 2013 17:25:58 -0800 (PST)
Received: by 10.112.40.169 with HTTP; Sun, 20 Jan 2013 17:25:58 -0800 (PST)
In-Reply-To: <1358689484.14265.40.camel@ted>
References: <cover.1358365495.git.nitin.a.kamble@intel.com>
	<9ab00cdffdd81cbdcd68ac03aafd925372f25ad7.1358365495.git.nitin.a.kamble@intel.com>
	<50F983F9.4020708@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C3F0BCF8A@ORSMSX106.amr.corp.intel.com>
	<50F98857.809@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C3F0BCFC9@ORSMSX106.amr.corp.intel.com>
	<1358689484.14265.40.camel@ted>
Date: Sun, 20 Jan 2013 20:25:58 -0500
Message-ID: <CADkTA4PBsb3aQ2U2hXxjoNJkYJcSN=x8UMpKE739vAZv8WZArQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto_3.4: use ${KSRC_linux_yocto_3_4_repo} based SRC_URI
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
X-List-Received-Date: Mon, 21 Jan 2013 01:41:27 -0000
Content-Type: multipart/alternative; boundary=e0cb4efa6e6cea63bc04d3c257ed

--e0cb4efa6e6cea63bc04d3c257ed
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jan 20, 2013 at 8:44 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2013-01-18 at 17:43 +0000, Kamble, Nitin A wrote:
> >
> > > -----Original Message-----
> > > From: Saul Wold [mailto:sgw@linux.intel.com]
> > > Sent: Friday, January 18, 2013 9:37 AM
> > > To: Kamble, Nitin A
> > > Cc: Openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] [PATCH 1/1] linux-yocto_3.4: use
> > > ${KSRC_linux_yocto_3_4_repo} based SRC_URI
> > >
> > > On 01/18/2013 09:23 AM, Kamble, Nitin A wrote:
> > > >
> > > >
> > > >> -----Original Message-----
> > > >> From: Saul Wold [mailto:sgw@linux.intel.com]
> > > >> Sent: Friday, January 18, 2013 9:19 AM
> > > >> To: Kamble, Nitin A
> > > >> Cc: Openembedded-core@lists.openembedded.org
> > > >> Subject: Re: [OE-core] [PATCH 1/1] linux-yocto_3.4: use
> > > >> ${KSRC_linux_yocto_3_4_repo} based SRC_URI
> > > >>
> > > >> On 01/16/2013 11:46 AM, nitin.a.kamble@intel.com wrote:
> > > >>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > >>>
> > > >>> This makes replacing kernel git repository easy.
> > > >>> For example you can add the following line in your local.conf to
> use
> > > >>> your own local kernel repository:
> > > >>>
> > > >>> KSRC_linux_yocto_3_4_repo = "/home/nitin/linux-yocto-
> > > >> 3.4.git/;protocol=file"
> > > >>>
> > > >>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > >>> ---
> > > >>>    meta/recipes-kernel/linux/linux-yocto_3.4.bb |    3 ++-
> > > >>>    1 files changed, 2 insertions(+), 1 deletions(-)
> > > >>>
> > > >>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > > >>> b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > > >>> index 70ed967..92129b6 100644
> > > >>> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > > >>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > > >>> @@ -11,7 +11,8 @@ SRCREV_machine_qemux86-64 ?=
> > > >> "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
> > > >>>    SRCREV_machine ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
> > > >>>    SRCREV_meta ?= "7e0cd2990798aae80565baa17d3b6c771874f284"
> > > >>>
> > > >>> -SRC_URI = "git://git.yoctoproject.org/linux-yocto-
> > > >>
> > > 3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=ma
> > > >> chine,meta"
> > > >>> +KSRC_linux_yocto_3_4_repo ?= "git.yoctoproject.org/linux-yocto-
> > > >> 3.4.git;protocol=git"
> > > >>> +SRC_URI =
> > > >>
> > > "git://${KSRC_linux_yocto_3_4_repo};nocheckout=1;branch=${KBRANCH},${
> > > >> KMETA};name=machine,meta"
> > > >>>
> > > >>
> > > >> Nitin,
> > > >>
> > > >> Can't the same be accomplished by setting SRC_URI-yocto-linux in
> your
> > > >> local.conf file:
> > > >>
> > > >>> SRC_URI_linux-yocto =
> > > >>> "/home/nitin/linux-yocto-3.4.git/;protocol=file
> > > >> ;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
> > > >>
> > > >> Yes, it might require a little cut paste of the nocheck... part.
> > > >>
> > > >> Sau!
> > > >>
> > > >
> > > >
> > > > Saul,
> > > >     This way same settings can be used for any BSP. And shouldn't we
> make
> > > life of YP developer easy?
> > > >
> > > This just seems like an extra variable that then needs to be documented
> > > when the SRC_URI already exists for this purpose.
> >
> > And this new variable is going to make kernel developer's life easy to
> just replace the kernel repository
> > while keeping all the kernel repo branch names same.
> >
> > As a kernel/BSP developer it definitely makes my life easier.
>
> I'm not taking things like this which solve a given specialist use case
> but would need to result in every recipe changing where someone wanted
> to do this. To be blunt, your choice of variable name also sucks.
>
> Embrace the power of the scripting we have, there are much more
> interesting ways to solve this problem generically. For example, I wrote
> this piece of code in a few minutes (admittedly untested):
>
>
Agreed! I'm not even sure how I missed that this was to the *oe-core*
linux-yocto
recipes (Nitin: you need to cc' me, or let me stage and merge changes to
these
recipes as a general rule), but I wouldn't have let this in either.

I admit to having such things in local/hack layers, but they definitely are
not something
I'd ever have wanted to see in main recipes.

Cheers,

Bruce


>
> urlremapper.bbclass:
>
> python () {
>     mod = False
>     newsrcuri = []
>     srcuri = (d.getVar("SRC_URI", True) or "").split()
>     maps = d.getVarFlags("URLREMAP")
>     for uri in srcuri:
>         for u in maps:
>         if uri.startswith(u):
>             uri.replace(u, maps[u])
>             mod = True
>         newsrcuri.append(uri)
>     if mod:
>         d.setVar("SRC_URI", " ".join(newsrcuri))
> }
>
>
> URLREMAP[git://git.yoctoproject.org/linux-yocto-3.4.git] =
> "git:///home/nitin/linux-yocto-3.4.git/;protocol=file"
>
> which should do what you want but in a generic way which doesn't require
> us to hack each recipe. You can do it completely locally if you create a
> classes directory alongside your conf directory and place the .bbclass
> there, then add INHERIT += "urlremapper" in local.conf.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e0cb4efa6e6cea63bc04d3c257ed
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sun, Jan 20, 2013 at 8:44 AM, Richard Purdie <span dir=3D"ltr">&=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">=
richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On F=
ri, 2013-01-18 at 17:43 +0000, Kamble, Nitin A wrote:<br>
&gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Saul Wold [mailto:<a href=3D"mailto:sgw@linux.intel.com">sg=
w@linux.intel.com</a>]<br>
&gt; &gt; Sent: Friday, January 18, 2013 9:37 AM<br>
&gt; &gt; To: Kamble, Nitin A<br>
&gt; &gt; Cc: <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.openembedded.org</a><br>
&gt; &gt; Subject: Re: [OE-core] [PATCH 1/1] linux-yocto_3.4: use<br>
&gt; &gt; ${KSRC_linux_yocto_3_4_repo} based SRC_URI<br>
&gt; &gt;<br>
&gt; &gt; On 01/18/2013 09:23 AM, Kamble, Nitin A wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; -----Original Message-----<br>
&gt; &gt; &gt;&gt; From: Saul Wold [mailto:<a href=3D"mailto:sgw@linux.inte=
l.com">sgw@linux.intel.com</a>]<br>
&gt; &gt; &gt;&gt; Sent: Friday, January 18, 2013 9:19 AM<br>
&gt; &gt; &gt;&gt; To: Kamble, Nitin A<br>
&gt; &gt; &gt;&gt; Cc: <a href=3D"mailto:Openembedded-core@lists.openembedd=
ed.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; &gt;&gt; Subject: Re: [OE-core] [PATCH 1/1] linux-yocto_3.4: use<=
br>
&gt; &gt; &gt;&gt; ${KSRC_linux_yocto_3_4_repo} based SRC_URI<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; On 01/16/2013 11:46 AM, <a href=3D"mailto:nitin.a.kamble=
@intel.com">nitin.a.kamble@intel.com</a> wrote:<br>
&gt; &gt; &gt;&gt;&gt; From: Nitin A Kamble &lt;<a href=3D"mailto:nitin.a.k=
amble@intel.com">nitin.a.kamble@intel.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; This makes replacing kernel git repository easy.<br>
&gt; &gt; &gt;&gt;&gt; For example you can add the following line in your l=
ocal.conf to use<br>
&gt; &gt; &gt;&gt;&gt; your own local kernel repository:<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; KSRC_linux_yocto_3_4_repo =3D &quot;/home/nitin/linu=
x-yocto-<br>
&gt; &gt; &gt;&gt; 3.4.git/;protocol=3Dfile&quot;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; Signed-off-by: Nitin A Kamble &lt;<a href=3D"mailto:=
nitin.a.kamble@intel.com">nitin.a.kamble@intel.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt; ---<br>
&gt; &gt; &gt;&gt;&gt; =A0 =A0meta/recipes-kernel/linux/<a href=3D"http://l=
inux-yocto_3.4.bb" target=3D"_blank">linux-yocto_3.4.bb</a> | =A0 =A03 ++-<=
br>
&gt; &gt; &gt;&gt;&gt; =A0 =A01 files changed, 2 insertions(+), 1 deletions=
(-)<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"ht=
tp://linux-yocto_3.4.bb" target=3D"_blank">linux-yocto_3.4.bb</a><br>
&gt; &gt; &gt;&gt;&gt; b/meta/recipes-kernel/linux/<a href=3D"http://linux-=
yocto_3.4.bb" target=3D"_blank">linux-yocto_3.4.bb</a><br>
&gt; &gt; &gt;&gt;&gt; index 70ed967..92129b6 100644<br>
&gt; &gt; &gt;&gt;&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://li=
nux-yocto_3.4.bb" target=3D"_blank">linux-yocto_3.4.bb</a><br>
&gt; &gt; &gt;&gt;&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://li=
nux-yocto_3.4.bb" target=3D"_blank">linux-yocto_3.4.bb</a><br>
&gt; &gt; &gt;&gt;&gt; @@ -11,7 +11,8 @@ SRCREV_machine_qemux86-64 ?=3D<br>
&gt; &gt; &gt;&gt; &quot;5432e2acb6053f9f7563cf63abd101ed2fdc1b6f&quot;<br>
&gt; &gt; &gt;&gt;&gt; =A0 =A0SRCREV_machine ?=3D &quot;5432e2acb6053f9f756=
3cf63abd101ed2fdc1b6f&quot;<br>
&gt; &gt; &gt;&gt;&gt; =A0 =A0SRCREV_meta ?=3D &quot;7e0cd2990798aae80565ba=
a17d3b6c771874f284&quot;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; -SRC_URI =3D &quot;git://<a href=3D"http://git.yocto=
project.org/linux-yocto-" target=3D"_blank">git.yoctoproject.org/linux-yoct=
o-</a><br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; 3.4.git;protocol=3Dgit;nocheckout=3D1;branch=3D${KBRANCH},${KMETA=
};name=3Dma<br>
&gt; &gt; &gt;&gt; chine,meta&quot;<br>
&gt; &gt; &gt;&gt;&gt; +KSRC_linux_yocto_3_4_repo ?=3D &quot;<a href=3D"htt=
p://git.yoctoproject.org/linux-yocto-" target=3D"_blank">git.yoctoproject.o=
rg/linux-yocto-</a><br>
&gt; &gt; &gt;&gt; 3.4.git;protocol=3Dgit&quot;<br>
&gt; &gt; &gt;&gt;&gt; +SRC_URI =3D<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &quot;git://${KSRC_linux_yocto_3_4_repo};nocheckout=3D1;branch=3D=
${KBRANCH},${<br>
&gt; &gt; &gt;&gt; KMETA};name=3Dmachine,meta&quot;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Nitin,<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Can&#39;t the same be accomplished by setting SRC_URI-yo=
cto-linux in your<br>
&gt; &gt; &gt;&gt; local.conf file:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; SRC_URI_linux-yocto =3D<br>
&gt; &gt; &gt;&gt;&gt; &quot;/home/nitin/linux-yocto-3.4.git/;protocol=3Dfi=
le<br>
&gt; &gt; &gt;&gt; ;nocheckout=3D1;branch=3D${KBRANCH},${KMETA};name=3Dmach=
ine,meta&quot;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Yes, it might require a little cut paste of the nocheck.=
.. part.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Sau!<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Saul,<br>
&gt; &gt; &gt; =A0 =A0 This way same settings can be used for any BSP. And =
shouldn&#39;t we make<br>
&gt; &gt; life of YP developer easy?<br>
&gt; &gt; &gt;<br>
&gt; &gt; This just seems like an extra variable that then needs to be docu=
mented<br>
&gt; &gt; when the SRC_URI already exists for this purpose.<br>
&gt;<br>
&gt; And this new variable is going to make kernel developer&#39;s life eas=
y to just replace the kernel repository<br>
&gt; while keeping all the kernel repo branch names same.<br>
&gt;<br>
&gt; As a kernel/BSP developer it definitely makes my life easier.<br>
<br>
</div></div>I&#39;m not taking things like this which solve a given special=
ist use case<br>
but would need to result in every recipe changing where someone wanted<br>
to do this. To be blunt, your choice of variable name also sucks.<br>
<br>
Embrace the power of the scripting we have, there are much more<br>
interesting ways to solve this problem generically. For example, I wrote<br=
>
this piece of code in a few minutes (admittedly untested):<br>
<br></blockquote><div><br></div><div style>Agreed! I&#39;m not even sure ho=
w I missed that this was to the *oe-core* linux-yocto</div><div style>recip=
es (Nitin: you need to cc&#39; me, or let me stage and merge changes to the=
se</div>
<div style>recipes as a general rule), but I wouldn&#39;t have let this in =
either.=A0</div><div style><br></div><div style>I admit to having such thin=
gs in local/hack layers, but they definitely are not something</div><div st=
yle>
I&#39;d ever have wanted to see in main recipes.</div><div style><br></div>=
<div style>Cheers,</div><div style><br></div><div style>Bruce</div><div>=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">

<br>
urlremapper.bbclass:<br>
<br>
python () {<br>
=A0 =A0 mod =3D False<br>
=A0 =A0 newsrcuri =3D []<br>
=A0 =A0 srcuri =3D (d.getVar(&quot;SRC_URI&quot;, True) or &quot;&quot;).sp=
lit()<br>
=A0 =A0 maps =3D d.getVarFlags(&quot;URLREMAP&quot;)<br>
=A0 =A0 for uri in srcuri:<br>
=A0 =A0 =A0 =A0 for u in maps:<br>
=A0 =A0 =A0 =A0 if uri.startswith(u):<br>
=A0 =A0 =A0 =A0 =A0 =A0 uri.replace(u, maps[u])<br>
=A0 =A0 =A0 =A0 =A0 =A0 mod =3D True<br>
=A0 =A0 =A0 =A0 newsrcuri.append(uri)<br>
=A0 =A0 if mod:<br>
=A0 =A0 =A0 =A0 d.setVar(&quot;SRC_URI&quot;, &quot; &quot;.join(newsrcuri)=
)<br>
}<br>
<br>
<br>
URLREMAP[git://<a href=3D"http://git.yoctoproject.org/linux-yocto-3.4.git" =
target=3D"_blank">git.yoctoproject.org/linux-yocto-3.4.git</a>] =3D &quot;g=
it:///home/nitin/linux-yocto-3.4.git/;protocol=3Dfile&quot;<br>
<br>
which should do what you want but in a generic way which doesn&#39;t requir=
e<br>
us to hack each recipe. You can do it completely locally if you create a<br=
>
classes directory alongside your conf directory and place the .bbclass<br>
there, then add INHERIT +=3D &quot;urlremapper&quot; in local.conf.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;
</div></div>

--e0cb4efa6e6cea63bc04d3c257ed--
