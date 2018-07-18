Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id F002478986;
	Wed, 18 Jul 2018 13:20:38 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id s14-v6so2881490wmc.1;
	Wed, 18 Jul 2018 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6eCaoydNdJZstgm5yyv7K/XSPrVmENL6cVrzxZxz7Uc=;
	b=Aetna10RLZXRQmjr3WeYli4L7wnDz1b8EBRmAdbBnv8zEArCINOJXOquYwLud39k5R
	XW5lpVGQmvWsHlS/ySspAtHiuEyo/I6k93u923Ss00Q9U3wc+sVQzdXE+YY7pQjY7vRM
	2IZOGWlsKFbTf3afxmXa2CPvHEJG1T51JjYsyHdlNl6+2sIQyrN9H2ULcfqXfOuXoQJM
	g0fhN2c1ZeLhLXd0Ffyek94hUrklVWgn0DwMI2Jh+dlA/NNTvDawC+GC2IcPMN47f+zZ
	XVXUvGPFQ+UnBzFAcEGjZNTSg1wACUqVI+/Ui93A5gts9qbNNdIoMQu47UCmRP24iqHu
	ktsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6eCaoydNdJZstgm5yyv7K/XSPrVmENL6cVrzxZxz7Uc=;
	b=X8DnJSNfi+KMBB62n4r86tP0uXBsV6caRtfpAicqyGqBLKUdVUo9fsMaT6qGu6JbiO
	xJ2xs6vWca1vwInKK4bsDmpko7B4tnPcqv6EU9GxiCcbqTq891Dr8FI3FjAk/OGRrrAZ
	G1ZypVWBeojPIYg49uWu8fTZHzBBPwXcdykNJ2l1DvA7ArC6Wz1PCdAjr2Qrb6dMgK3i
	V6unCOQ/zQ18dgA8FXADf3oRf4RvUdx6Tm1ipj2yrRNffWcwoySOKYsutdyTThqVUj7N
	Kedcbe4JAqFyOnND0jNbPhzWROqmYRL0GWs7Qr2o1OjU8OqtQn3SapKv43X0reyaucDO
	lH8A==
X-Gm-Message-State: AOUpUlFXC4pydgK7Pw8wjx7xhoDIOVpOnY/PCnYp+pKFzp8hnv1WWR5R
	88bX2yolUGdedsIbvnhahStnhhMatIWDR7NB5bzjGQ==
X-Google-Smtp-Source: AAOMgpe6BTIipTlMKJ3K7uiwgTjtqCmyp8CVNLcqJsE9P23sykRAkNu424QrgAOlowQ5gO9SraLC5oTRR23coiEuASM=
X-Received: by 2002:a1c:8c08:: with SMTP id o8-v6mr1544044wmd.60.1531920039503;
	Wed, 18 Jul 2018 06:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <153191861669.10298.15614848702695214584@git.openembedded.org>
In-Reply-To: <153191861669.10298.15614848702695214584@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Jul 2018 15:20:28 +0200
Message-ID: <CA+chaQf89Q8+mTKaHnnMdcrem98oHke=zXWRjZjYJc-y+Ut4Dw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] branch master-next updated: package: Rework PACKAGELOCK based upon sstate for do_packagedata
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
X-List-Received-Date: Wed, 18 Jul 2018 13:20:39 -0000
Content-Type: multipart/alternative; boundary="000000000000c77e10057145edf7"

--000000000000c77e10057145edf7
Content-Type: text/plain; charset="UTF-8"

I haven't seen this one on oe-core ML, so I'll ask here.

Will this fix the PACKAGELOCK appearing pseudo.log quite often (as
discussed in https://patchwork.openembedded.org/patch/144312/) or do you
have any idea how to fix that one?



On Wed, Jul 18, 2018 at 2:56 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> The following commit(s) were added to refs/heads/master-next by this push:
>      new 966b8bf  package: Rework PACKAGELOCK based upon sstate for
> do_packagedata
> 966b8bf is described below
>
> commit 966b8bf2916f75c6dea642786b0e73c7adfc0b30
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> AuthorDate: Wed Jul 18 13:54:05 2018 +0100
>
>     package: Rework PACKAGELOCK based upon sstate for do_packagedata
>
>     I think this lock dates from before we had sstate for do_packagedata.
>
>     Since WORKDIR is recipe specific and we write into WORKDIR, we no
> longer need
>     any write locks in the do_packagedata code itself, its handled by the
> sstate
>     task lock for the final copy in at the end. The final write lock can
> be simply
>     removed.
>
>     The only time we need read locking is when actually reading data from
> the
>     shared directory. We can therefore reduce the window the lock is held
>     significantly as well, hence improving the speed of packagedata tasks
> running
>     in parallel.
>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package.bbclass | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 07bc378..6f7015d 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1411,9 +1411,6 @@ fi
>      pkgdest = d.getVar('PKGDEST')
>      pkgdatadir = d.getVar('PKGDESTWORK')
>
> -    # Take shared lock since we're only reading, not writing
> -    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
> -
>      data_file = pkgdatadir + d.expand("/${PN}" )
>      f = open(data_file, 'w')
>      f.write("PACKAGES: %s\n" % packages)
> @@ -1518,7 +1515,6 @@ fi
>      if bb.data.inherits_class('allarch', d) and not
> bb.data.inherits_class('packagegroup', d):
>          write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
>
> -    bb.utils.unlockfile(lf)
>  }
>  emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime
> ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
>
> @@ -1629,9 +1625,6 @@ python package_do_shlibs() {
>
>      shlibswork_dir = d.getVar('SHLIBSWORKDIR')
>
> -    # Take shared lock since we're only reading, not writing
> -    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
> -
>      def linux_so(file, needed, sonames, renames, pkgver):
>          needs_ldconfig = False
>          ldir = os.path.dirname(file).replace(pkgdest + "/" + pkg, '')
> @@ -1744,7 +1737,11 @@ python package_do_shlibs() {
>      use_ldconfig = bb.utils.contains('DISTRO_FEATURES', 'ldconfig', True,
> False, d)
>
>      needed = {}
> +
> +    # Take shared lock since we're only reading, not writing
> +    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
>      shlib_provider = oe.package.read_shlib_providers(d)
> +    bb.utils.unlockfile(lf)
>
>      for pkg in shlib_pkgs:
>          private_libs = d.getVar('PRIVATE_LIBS_' + pkg) or
> d.getVar('PRIVATE_LIBS') or ""
> @@ -1800,8 +1797,6 @@ python package_do_shlibs() {
>              d.setVar('pkg_postinst_%s' % pkg, postinst)
>          bb.debug(1, 'LIBNAMES: pkg %s sonames %s' % (pkg, sonames))
>
> -    bb.utils.unlockfile(lf)
> -
>      assumed_libs = d.getVar('ASSUME_SHLIBS')
>      if assumed_libs:
>          libdir = d.getVar("libdir")
> @@ -1914,9 +1909,6 @@ python package_do_pkgconfig () {
>                              if hdr == 'Requires':
>                                  pkgconfig_needed[pkg] += exp.replace(',',
> ' ').split()
>
> -    # Take shared lock since we're only reading, not writing
> -    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
> -
>      for pkg in packages.split():
>          pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
>          if pkgconfig_provided[pkg] != []:
> @@ -1925,6 +1917,9 @@ python package_do_pkgconfig () {
>                  f.write('%s\n' % p)
>              f.close()
>
> +    # Take shared lock since we're only reading, not writing
> +    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
> +
>      # Go from least to most specific since the last one found wins
>      for dir in reversed(shlibs_dirs):
>          if not os.path.exists(dir):
> @@ -1940,6 +1935,8 @@ python package_do_pkgconfig () {
>                  for l in lines:
>                      pkgconfig_provided[pkg].append(l.rstrip())
>
> +    bb.utils.unlockfile(lf)
> +
>      for pkg in packages.split():
>          deps = []
>          for n in pkgconfig_needed[pkg]:
> @@ -1957,8 +1954,6 @@ python package_do_pkgconfig () {
>              for dep in deps:
>                  fd.write(dep + '\n')
>              fd.close()
> -
> -    bb.utils.unlockfile(lf)
>  }
>
>  def read_libdep_files(d):
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--000000000000c77e10057145edf7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I haven&#39;t seen this one on oe-core ML, so I&#39;ll ask=
 here.<div><br></div><div>Will this fix the=C2=A0<span style=3D"font-size:s=
mall;background-color:rgb(255,255,255);text-decoration-style:initial;text-d=
ecoration-color:initial;float:none;display:inline">PACKAGELOCK appearing ps=
eudo.log quite often (as discussed in=C2=A0<a href=3D"https://patchwork.ope=
nembedded.org/patch/144312/">https://patchwork.openembedded.org/patch/14431=
2/</a>) or do you have any idea how to fix that one?</span></div><div><span=
 style=3D"font-size:small;background-color:rgb(255,255,255);text-decoration=
-style:initial;text-decoration-color:initial;float:none;display:inline"><br=
></span></div><div><span style=3D"font-size:small;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline"><br></span></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Wed, Jul 18, 2018 at 2:56 PM &lt;<a href=3D"mailto:git@=
git.openembedded.org">git@git.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">This is an automated email from the git hooks/po=
st-receive script.<br>
<br>
rpurdie pushed a commit to branch master-next<br>
in repository openembedded-core.<br>
<br>
The following commit(s) were added to refs/heads/master-next by this push:<=
br>
=C2=A0 =C2=A0 =C2=A0new 966b8bf=C2=A0 package: Rework PACKAGELOCK based upo=
n sstate for do_packagedata<br>
966b8bf is described below<br>
<br>
commit 966b8bf2916f75c6dea642786b0e73c7adfc0b30<br>
Author: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
AuthorDate: Wed Jul 18 13:54:05 2018 +0100<br>
<br>
=C2=A0 =C2=A0 package: Rework PACKAGELOCK based upon sstate for do_packaged=
ata<br>
<br>
=C2=A0 =C2=A0 I think this lock dates from before we had sstate for do_pack=
agedata.<br>
<br>
=C2=A0 =C2=A0 Since WORKDIR is recipe specific and we write into WORKDIR, w=
e no longer need<br>
=C2=A0 =C2=A0 any write locks in the do_packagedata code itself, its handle=
d by the sstate<br>
=C2=A0 =C2=A0 task lock for the final copy in at the end. The final write l=
ock can be simply<br>
=C2=A0 =C2=A0 removed.<br>
<br>
=C2=A0 =C2=A0 The only time we need read locking is when actually reading d=
ata from the<br>
=C2=A0 =C2=A0 shared directory. We can therefore reduce the window the lock=
 is held<br>
=C2=A0 =C2=A0 significantly as well, hence improving the speed of packageda=
ta tasks running<br>
=C2=A0 =C2=A0 in parallel.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation=
.org</a>&gt;<br>
---<br>
=C2=A0meta/classes/package.bbclass | 23 +++++++++--------------<br>
=C2=A01 file changed, 9 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass<br=
>
index 07bc378..6f7015d 100644<br>
--- a/meta/classes/package.bbclass<br>
+++ b/meta/classes/package.bbclass<br>
@@ -1411,9 +1411,6 @@ fi<br>
=C2=A0 =C2=A0 =C2=A0pkgdest =3D d.getVar(&#39;PKGDEST&#39;)<br>
=C2=A0 =C2=A0 =C2=A0pkgdatadir =3D d.getVar(&#39;PKGDESTWORK&#39;)<br>
<br>
-=C2=A0 =C2=A0 # Take shared lock since we&#39;re only reading, not writing=
<br>
-=C2=A0 =C2=A0 lf =3D bb.utils.lockfile(d.expand(&quot;${PACKAGELOCK}&quot;=
), True)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0data_file =3D pkgdatadir + d.expand(&quot;/${PN}&quot; =
)<br>
=C2=A0 =C2=A0 =C2=A0f =3D open(data_file, &#39;w&#39;)<br>
=C2=A0 =C2=A0 =C2=A0f.write(&quot;PACKAGES: %s\n&quot; % packages)<br>
@@ -1518,7 +1515,6 @@ fi<br>
=C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#39;allarch&#39;, d) and not=
 bb.data.inherits_class(&#39;packagegroup&#39;, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_extra_runtime_pkgs(global_variants,=
 packages, pkgdatadir)<br>
<br>
-=C2=A0 =C2=A0 bb.utils.unlockfile(lf)<br>
=C2=A0}<br>
=C2=A0emit_pkgdata[dirs] =3D &quot;${PKGDESTWORK}/runtime ${PKGDESTWORK}/ru=
ntime-reverse ${PKGDESTWORK}/runtime-rprovides&quot;<br>
<br>
@@ -1629,9 +1625,6 @@ python package_do_shlibs() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0shlibswork_dir =3D d.getVar(&#39;SHLIBSWORKDIR&#39;)<br=
>
<br>
-=C2=A0 =C2=A0 # Take shared lock since we&#39;re only reading, not writing=
<br>
-=C2=A0 =C2=A0 lf =3D bb.utils.lockfile(d.expand(&quot;${PACKAGELOCK}&quot;=
), True)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0def linux_so(file, needed, sonames, renames, pkgver):<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0needs_ldconfig =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ldir =3D os.path.dirname(file).replace(pk=
gdest + &quot;/&quot; + pkg, &#39;&#39;)<br>
@@ -1744,7 +1737,11 @@ python package_do_shlibs() {<br>
=C2=A0 =C2=A0 =C2=A0use_ldconfig =3D bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;, &#39;ldconfig&#39;, True, False, d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0needed =3D {}<br>
+<br>
+=C2=A0 =C2=A0 # Take shared lock since we&#39;re only reading, not writing=
<br>
+=C2=A0 =C2=A0 lf =3D bb.utils.lockfile(d.expand(&quot;${PACKAGELOCK}&quot;=
), True)<br>
=C2=A0 =C2=A0 =C2=A0shlib_provider =3D oe.package.read_shlib_providers(d)<b=
r>
+=C2=A0 =C2=A0 bb.utils.unlockfile(lf)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for pkg in shlib_pkgs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0private_libs =3D d.getVar(&#39;PRIVATE_LI=
BS_&#39; + pkg) or d.getVar(&#39;PRIVATE_LIBS&#39;) or &quot;&quot;<br>
@@ -1800,8 +1797,6 @@ python package_do_shlibs() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;pkg_postinst_=
%s&#39; % pkg, postinst)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(1, &#39;LIBNAMES: pkg %s sonames=
 %s&#39; % (pkg, sonames))<br>
<br>
-=C2=A0 =C2=A0 bb.utils.unlockfile(lf)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0assumed_libs =3D d.getVar(&#39;ASSUME_SHLIBS&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if assumed_libs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libdir =3D d.getVar(&quot;libdir&quot;)<b=
r>
@@ -1914,9 +1909,6 @@ python package_do_pkgconfig () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if hdr =3D=3D &#39;Requires&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgconfig_needed[pkg] +=3D exp=
.replace(&#39;,&#39;, &#39; &#39;).split()<br>
<br>
-=C2=A0 =C2=A0 # Take shared lock since we&#39;re only reading, not writing=
<br>
-=C2=A0 =C2=A0 lf =3D bb.utils.lockfile(d.expand(&quot;${PACKAGELOCK}&quot;=
), True)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0for pkg in packages.split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgs_file =3D os.path.join(shlibswork_dir=
, pkg + &quot;.pclist&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkgconfig_provided[pkg] !=3D []:<br>
@@ -1925,6 +1917,9 @@ python package_do_pkgconfig () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
%s\n&#39; % p)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.close()<br>
<br>
+=C2=A0 =C2=A0 # Take shared lock since we&#39;re only reading, not writing=
<br>
+=C2=A0 =C2=A0 lf =3D bb.utils.lockfile(d.expand(&quot;${PACKAGELOCK}&quot;=
), True)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# Go from least to most specific since the last one fou=
nd wins<br>
=C2=A0 =C2=A0 =C2=A0for dir in reversed(shlibs_dirs):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(dir):<br>
@@ -1940,6 +1935,8 @@ python package_do_pkgconfig () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in line=
s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0pkgconfig_provided[pkg].append(l.rstrip())<br>
<br>
+=C2=A0 =C2=A0 bb.utils.unlockfile(lf)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0for pkg in packages.split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0deps =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for n in pkgconfig_needed[pkg]:<br>
@@ -1957,8 +1954,6 @@ python package_do_pkgconfig () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in deps:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd.write(dep =
+ &#39;\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd.close()<br>
-<br>
-=C2=A0 =C2=A0 bb.utils.unlockfile(lf)<br>
=C2=A0}<br>
<br>
=C2=A0def read_libdep_files(d):<br>
<br>
-- <br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
-- <br>
_______________________________________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mai=
lman/listinfo/openembedded-commits</a><br>
</blockquote></div>

--000000000000c77e10057145edf7--
