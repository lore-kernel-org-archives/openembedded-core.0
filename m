Return-Path: <sujith.h@gmail.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id E59E865F81
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 15:30:09 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id s7so6994830qap.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 08:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=R2uP6aLWS7gylAlvz6jxau4cHe/9AJvDGVb1SY4rFRM=;
	b=GBTGubaMemy52b7UBqNPPsx9mm2xrWFCoejLS6OFAGB548HOO2ghYdyJACFx40zwk8
	OENCZRbCekILlHjgJ3b9yJjJGRnU1S0gvdILhVaz1zyyvSW/KHm27bo5PYe2ioDGwIMs
	cqbQSIaZjE7psEsx0NfCxmHZsPf4RenZfmQbAJWNXKg5kPg/q05BlfEjfD0QYTfWkLPk
	+HFdWtYno34AGfQE4kBksCyurZFXMsJhHQIikSxHIwDVW2Z9+ND9thjIS0tr1I1K0kbV
	gLPo231BZjBDJvkiprBS4P16ZandOrySQVtVYNy2xOFpyz85Ztzc0c3ykwci1lnTykrd
	Snvw==
X-Received: by 10.140.103.74 with SMTP id x68mr35354236qge.34.1407166209079;
	Mon, 04 Aug 2014 08:30:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Mon, 4 Aug 2014 08:29:48 -0700 (PDT)
In-Reply-To: <4994345.PFS2CvPxzl@peggleto-mobl5.ger.corp.intel.com>
References: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
	<1418636.H30RBdXEMU@peggleto-mobl5.ger.corp.intel.com>
	<CADyYWLnK2m93BsT+XvPTg-eAFeKTqYUhSLTNkSHEtF8=EemaNw@mail.gmail.com>
	<4994345.PFS2CvPxzl@peggleto-mobl5.ger.corp.intel.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 4 Aug 2014 20:59:48 +0530
Message-ID: <CADyYWL=NPOL1v7NU=z_F0N-9Nc3uiSBFLJVc4=Ly0K0kYQxuzw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 15:30:16 -0000
Content-Type: multipart/alternative; boundary=001a1134eda808408f04ffcf6a9b

--001a1134eda808408f04ffcf6a9b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2014 at 8:19 PM, Paul Eggleton <paul.eggleton@linux.intel.co=
m
> wrote:

> On Monday 04 August 2014 20:03:09 sujith h wrote:
> > Hi Paul,
> >
> >
> > On Mon, Aug 4, 2014 at 7:48 PM, Paul Eggleton <
> paul.eggleton@linux.intel.com
> > > wrote:
> > >
> > > Hi Sujith,
> > >
> > > On Monday 04 August 2014 19:27:08 Sujith H wrote:
> > > > From: Sujith H <Sujith_Haridasan@mentor.com>
> > > >
> > > > If hostname is not added to /etc/hosts file then rpcinfo
> > > > command fails when hostname is passed as argument. This was
> > > > observed when rpcinfo command was tested on freescale target.
> > > > Below was the output observed without this change.
> > > >
> > > > root@mx6q:~# rpcinfo -s mx6q
> > > > rpcinfo: can't contact rpcbind: RPC: (unknown error code)
> > > >
> > > > Below is the output after this change:
> > > > root@mx6q:~# rpcinfo -s mx6q
> > > >
> > > >    program version(s) netid(s)                         service
> owner
> > > >
> > > >     100000  2,3,4     local,udp,tcp,udp6,tcp6          portmapper
> > >
> > >  superuser
> > >
> > > > root@mx6q:~#
> > > >
> > > > Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> > > > ---
> > > >
> > > >  meta/classes/image.bbclass | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclas=
s
> > > > index 82605f2..7a5a5c1 100644
> > > > --- a/meta/classes/image.bbclass
> > > > +++ b/meta/classes/image.bbclass
> > > > @@ -341,6 +341,14 @@ ssh_disable_dns_lookup () {
> > > >
> > > >       fi
> > > >
> > > >  }
> > > >
> > > > +ROOTFS_POSTPROCESS_COMMAND +=3D "add_machine_name_loop_back;"
> > > > +
> > > > +add_machine_name_loop_back() {
> > > > +    if [ -n ${MACHINE} ]; then
> > > > +         echo 127.0.1.1 "       "${MACHINE} >>
> > > > ${IMAGE_ROOTFS}${sysconfdir}/hosts +    fi
> > > > +}
> > > > +
> > >
> > > I think in the earlier discussion the conclusion was that we do not
> want
> > > this
> > > enabled by default, which the above will do.
> > >
> > > The question I have is, if this isn't a good idea, is there a better
> > > solution?
> >
> > I totally agree with the discussion. Is it a good idea to implement lik=
e
> > check made for zap_empty_root_password?
> > For zap_empty_root_password there is a conditional check if debug-tweak=
s
> > are enabled then zap_empty_root_password is
> > called. So can I use debug-tweaks to handle add_machine_name_loop_back =
in
> > the patch?
>
> No, that would not be right - debug-tweaks is for a specific purpose whic=
h
> is
> unrelated to this.
>

Ok. How about adding :

ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_contains("TOOLCHAIN_TARGET_TASK",
"packagegroup-core-boot", "add_machine_name_loop_back; ", "",d)}'

Again here the problem is that when packagegroup-core-boot will be added,
this change will be forced to rootfs :(

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

Thanks,
Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a1134eda808408f04ffcf6a9b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Aug 4, 2014 at 8:19 PM, Paul Eggleton <span dir=3D"ltr">&lt=
;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eg=
gleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D""><div clas=
s=3D"h5">On Monday 04 August 2014 20:03:09 sujith h wrote:<br>
&gt; Hi Paul,<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Aug 4, 2014 at 7:48 PM, Paul Eggleton &lt;<a href=3D"mailto:pa=
ul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a><br>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Sujith,<br>
&gt; &gt;<br>
&gt; &gt; On Monday 04 August 2014 19:27:08 Sujith H wrote:<br>
&gt; &gt; &gt; From: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor=
.com">Sujith_Haridasan@mentor.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; If hostname is not added to /etc/hosts file then rpcinfo<br>
&gt; &gt; &gt; command fails when hostname is passed as argument. This was<=
br>
&gt; &gt; &gt; observed when rpcinfo command was tested on freescale target=
.<br>
&gt; &gt; &gt; Below was the output observed without this change.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; root@mx6q:~# rpcinfo -s mx6q<br>
&gt; &gt; &gt; rpcinfo: can&#39;t contact rpcbind: RPC: (unknown error code=
)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Below is the output after this change:<br>
&gt; &gt; &gt; root@mx6q:~# rpcinfo -s mx6q<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0program version(s) netid(s) =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service =
=C2=A0 =C2=A0 owner<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 100000 =C2=A02,3,4 =C2=A0 =C2=A0 local,udp,tcp=
,udp6,tcp6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0portmapper<br>
&gt; &gt;<br>
&gt; &gt; =C2=A0superuser<br>
&gt; &gt;<br>
&gt; &gt; &gt; root@mx6q:~#<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridas=
an@mentor.com">Sujith_Haridasan@mentor.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0meta/classes/image.bbclass | 8 ++++++++<br>
&gt; &gt; &gt; =C2=A01 file changed, 8 insertions(+)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/classes/image.bbclass b/meta/classes/image=
.bbclass<br>
&gt; &gt; &gt; index 82605f2..7a5a5c1 100644<br>
&gt; &gt; &gt; --- a/meta/classes/image.bbclass<br>
&gt; &gt; &gt; +++ b/meta/classes/image.bbclass<br>
&gt; &gt; &gt; @@ -341,6 +341,14 @@ ssh_disable_dns_lookup () {<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0}<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +ROOTFS_POSTPROCESS_COMMAND +=3D &quot;add_machine_name_loop=
_back;&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +add_machine_name_loop_back() {<br>
&gt; &gt; &gt; + =C2=A0 =C2=A0if [ -n ${MACHINE} ]; then<br>
&gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo 127.0.1.1 &quot; =C2=A0 =
=C2=A0 =C2=A0 &quot;${MACHINE} &gt;&gt;<br>
&gt; &gt; &gt; ${IMAGE_ROOTFS}${sysconfdir}/hosts + =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt; +}<br>
&gt; &gt; &gt; +<br>
&gt; &gt;<br>
&gt; &gt; I think in the earlier discussion the conclusion was that we do n=
ot want<br>
&gt; &gt; this<br>
&gt; &gt; enabled by default, which the above will do.<br>
&gt; &gt;<br>
&gt; &gt; The question I have is, if this isn&#39;t a good idea, is there a=
 better<br>
&gt; &gt; solution?<br>
&gt;<br>
&gt; I totally agree with the discussion. Is it a good idea to implement li=
ke<br>
&gt; check made for zap_empty_root_password?<br>
&gt; For zap_empty_root_password there is a conditional check if debug-twea=
ks<br>
&gt; are enabled then zap_empty_root_password is<br>
&gt; called. So can I use debug-tweaks to handle add_machine_name_loop_back=
 in<br>
&gt; the patch?<br>
<br>
</div></div>No, that would not be right - debug-tweaks is for a specific pu=
rpose which is<br>
unrelated to this.<br></blockquote><div><br></div><div>Ok. How about adding=
 :<br><br>ROOTFS_POSTPROCESS_COMMAND +=3D &#39;${@base_contains(&quot;TOOLC=
HAIN_TARGET_TASK&quot;, &quot;packagegroup-core-boot&quot;, &quot;add_machi=
ne_name_loop_back; &quot;, &quot;&quot;,d)}&#39;<br>

<br></div><div>Again here the problem is that when packagegroup-core-boot w=
ill be added, this change will be forced to rootfs :( <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">


<div class=3D""><div class=3D"h5"><br>
Cheers,<br>
Paul<br>
<br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div></div></blockquote></div><br></div><div class=3D"gmail_extra">Thanks,=
<br></div><div class=3D"gmail_extra">Sujith H<br clear=3D"all"></div><div c=
lass=3D"gmail_extra"><br>-- <br>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=
=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=
=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE project<br>

<a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">h=
ttp://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"h=
ttp://sujithh.info" target=3D"_blank">http://sujithh.info</a><br>
</div></div>

--001a1134eda808408f04ffcf6a9b--
