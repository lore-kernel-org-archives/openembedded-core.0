Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id DFA2D60559
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 14:00:25 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z60so8617113qgd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Xr4Jktgti3DkDE+ePsA8YtyJ0ePtbmafmfPZvaehQrA=;
	b=djXFSFiOmZNr7sY7xcRj2JOMSpdQ0eB/4tvqxYaV/PwjRwPAqmhcdEeDKC4CWvk5vP
	tQaEwVIWztbC+GU3iqtoKi9wfbeQBubc5oF4MvBNKSPFrXOpmUphmb+YzNFsiFwFQK0L
	gxF2qkTS2bU9vafzdfiKu5bu0paC6eBMF83R8GVPSkouNtQLz50VLA45IuOXPhxWM3ky
	0pV4Gi6s2UhK2sDF8KLBGdM+25qG18m8yrKTepZxgCzFXE/XdZJ7dmTu++FkwgCrAiBd
	d4ocRMKgSgcsQBCwPorF3LpFc7qvwiOavFGn95XlUhfBRcTJuSf3H0NIHTHYcToDZIQ6
	7d9Q==
X-Received: by 10.140.81.134 with SMTP id f6mr34334004qgd.60.1407160826744;
	Mon, 04 Aug 2014 07:00:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Mon, 4 Aug 2014 07:00:06 -0700 (PDT)
In-Reply-To: <1407160489-30708-1-git-send-email-sujith.h@gmail.com>
References: <1407160489-30708-1-git-send-email-sujith.h@gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 4 Aug 2014 19:30:06 +0530
Message-ID: <CADyYWLnWvzOmMPoKDLMoJ57dv8dH9YJRd1w1t-FXV+LXafYMqw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: Re: [PATCH 1/2] netbase: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 14:00:35 -0000
Content-Type: multipart/alternative; boundary=001a11c12b5a389a8c04ffce292e

--001a11c12b5a389a8c04ffce292e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Kindly ignore the above patch. It was sent by mistake :( Sorry for trouble.


On Mon, Aug 4, 2014 at 7:24 PM, Sujith H <sujith.h@gmail.com> wrote:

> From: Sujith H <Sujith_Haridasan@mentor.com>
>
> If hostname is not added to /etc/hosts file then rpcinfo
> command fails when hostname is passed as argument. This was
> observed when rpcinfo command was tested on freescale target.
> Below was the output observed without this change.
>
> root@mx6q:~# rpcinfo -s mx6q
> rpcinfo: can't contact rpcbind: RPC: (unknown error code)
>
> Below is the output after this change:
> root@mx6q:~# rpcinfo -s mx6q
>    program version(s) netid(s)                         service     owner
>     100000  2,3,4     local,udp,tcp,udp6,tcp6          portmapper
>  superuser
> root@mx6q:~#
>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>  meta/recipes-core/netbase/netbase_5.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/netbase/netbase_5.2.bb
> b/meta/recipes-core/netbase/netbase_5.2.bb
> index ab7ae65..a6fb010 100644
> --- a/meta/recipes-core/netbase/netbase_5.2.bb
> +++ b/meta/recipes-core/netbase/netbase_5.2.bb
> @@ -18,6 +18,7 @@ do_install () {
>         install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
>         install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
>         install -m 0644 etc-services ${D}${sysconfdir}/services
> +       echo 127.0.1.1 "             "${MACHINE} >> ${D}${sysconfdir}/hos=
ts
>  }
>
>  CONFFILES_${PN} =3D "${sysconfdir}/hosts"
> --
> 1.8.4
>
>


--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a11c12b5a389a8c04ffce292e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Kindly ignore the above patch. It was sent by mistake :( S=
orry for trouble.<br></div><div class=3D"gmail_extra"><br><br><div class=3D=
"gmail_quote">On Mon, Aug 4, 2014 at 7:24 PM, Sujith H <span dir=3D"ltr">&l=
t;<a href=3D"mailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.co=
m</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">From: Sujith H &lt;<a href=
=3D"mailto:Sujith_Haridasan@mentor.com">Sujith_Haridasan@mentor.com</a>&gt;=
<br>
<br>
If hostname is not added to /etc/hosts file then rpcinfo<br>
command fails when hostname is passed as argument. This was<br>
observed when rpcinfo command was tested on freescale target.<br>
Below was the output observed without this change.<br>
<br>
root@mx6q:~# rpcinfo -s mx6q<br>
rpcinfo: can&#39;t contact rpcbind: RPC: (unknown error code)<br>
<br>
Below is the output after this change:<br>
root@mx6q:~# rpcinfo -s mx6q<br>
=C2=A0 =C2=A0program version(s) netid(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service =C2=A0 =C2=A0 own=
er<br>
=C2=A0 =C2=A0 100000 =C2=A02,3,4 =C2=A0 =C2=A0 local,udp,tcp,udp6,tcp6 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0portmapper =C2=A0superuser<br>
root@mx6q:~#<br>
<br>
</div>Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor=
.com">Sujith_Haridasan@mentor.com</a>&gt;<br>
<div class=3D"im HOEnZb">---<br>
=C2=A0meta/recipes-core/netbase/<a href=3D"http://netbase_5.2.bb" target=3D=
"_blank">netbase_5.2.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/netbase/<a href=3D"http://netbase_5.2.bb" ta=
rget=3D"_blank">netbase_5.2.bb</a> b/meta/recipes-core/netbase/<a href=3D"h=
ttp://netbase_5.2.bb" target=3D"_blank">netbase_5.2.bb</a><br>
index ab7ae65..a6fb010 100644<br>
--- a/meta/recipes-core/netbase/<a href=3D"http://netbase_5.2.bb" target=3D=
"_blank">netbase_5.2.bb</a><br>
+++ b/meta/recipes-core/netbase/<a href=3D"http://netbase_5.2.bb" target=3D=
"_blank">netbase_5.2.bb</a><br>
@@ -18,6 +18,7 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 etc-rpc ${D}${sysconfdir}/rpc<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 etc-protocols ${D}${sysconfdir}=
/protocols<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 etc-services ${D}${sysconfdir}/=
services<br>
</div><div class=3D"im HOEnZb">+ =C2=A0 =C2=A0 =C2=A0 echo 127.0.1.1 &quot;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${MACHINE} &gt;&gt; ${D}${=
sysconfdir}/hosts<br>
=C2=A0}<br>
<br>
</div><div class=3D"HOEnZb"><div class=3D"h5">=C2=A0CONFFILES_${PN} =3D &qu=
ot;${sysconfdir}/hosts&quot;<br>
--<br>
1.8.4<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br>=E0=B4=B8=
=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=
=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&g=
t;Contributor to KDE project<br><a href=3D"http://fci.wikia.com/wiki/Anti-D=
RM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign<=
/a><br>

&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujit=
hh.info</a><br>
</div>

--001a11c12b5a389a8c04ffce292e--
