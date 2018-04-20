Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id D8501746B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 08:06:57 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id v15-v6so2416895wrm.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UyzH6c797lJx6tNLVs45l4WeUEpvpZlmaH/hn2Ditq4=;
	b=QlJeJhklILL+EfCHJ1pE4YzOMgGRli+6Y69miZqf2v8UiyrVZUPd8jWrv94l6kU0Vi
	6N+DX+4xFzDGjqgQfvTS5BozeQUvBVCDrxjM5VZtRRylfsnQKY1I6SuYGwFOuJRHw8Tq
	/Q1OdyVCu/3IYAv9gV59F+OgkiZfx6gSlwLqQ+Kff3iOBQ3lHJTmaN6g2yRqvXboA2gY
	EewJ4/1CLwCUJnN1s3sY+BXMwt0ypAd6au4sa0tWInlaHpP3nXWVbh7rmbp4QnCNHxZP
	RIb/E0SpbMNojWymqeLoQOCL4z9W7jy+b0pCzIYC66oIeFeMo/ZQ1kxCU960bz9Y8SUA
	RAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UyzH6c797lJx6tNLVs45l4WeUEpvpZlmaH/hn2Ditq4=;
	b=BnklCwyIuxvKLrBeeV336wSGVEJlSb7fuEqRkE3MmO6tnYNvFxqGvc6a7K+R1+p7UF
	m4h93l3OgRlVqjR1kKEHz87Qp+ZmCdPhTuy5iniGyF2rw2mBB1F9iSUUWB+cCJrgicuF
	37eSvwJDRo8Hv26kiFVOZhhtFR90B08ojg+uErP7jT/fCbymu6dqq1Vz6kbj+fslJSfD
	K11rBKbWwLbTDqR+nOc/TmZeWXt0rGrS8J4pXRRTnSgwu8evOy4UWzcu2RkGcvcIC75o
	+68jsJm1qIregWHQefDuC9MqzqLMpcKg2mkL2L8k7K+6Dy+cYdtkkQK0DzQ8AxyuuXKQ
	dtxQ==
X-Gm-Message-State: ALQs6tBsQ6E1EKPfyXMq6b6gNAgpre8ES5JD3GiB8hL/PfsGIQGJbZuc
	4oHouizPtKnzfUcAfvLL/NCrw7dpwW91cxq0I3M=
X-Google-Smtp-Source: AIpwx4/pqSSY3hz6VyvARQeEZHjki5wfovkdm4oGhLeiQM7b+kYZbAj/LPdt9IIBQR9qkUDd11zsZnZQFDb54SrOqeM=
X-Received: by 2002:adf:8bc7:: with SMTP id
	w7-v6mr7436560wra.230.1524211618064; 
	Fri, 20 Apr 2018 01:06:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Fri, 20 Apr 2018 01:06:57 -0700 (PDT)
In-Reply-To: <1524209132-1175-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1524209132-1175-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Apr 2018 10:06:57 +0200
Message-ID: <CA+chaQeuOyigbO18Q+gwB8n-rfYG36ZV1SCJVcPJq79JLV1SUA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package: Fix PACKAGELOCK handling
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
X-List-Received-Date: Fri, 20 Apr 2018 08:06:58 -0000
Content-Type: multipart/alternative; boundary="0000000000000eae21056a432c1f"

--0000000000000eae21056a432c1f
Content-Type: text/plain; charset="UTF-8"

Now with pseudo log files a bit smaller this package-output.lock seems to
be most common "issue" reported with do_qa_pseudo.

e.g.:
libao-1.2.0: This /work/i586-oe-linux-musl/libao/1.2.0-r0/pseudo/pseudo.log
indicates 16 errors [qa-pseudo]
see grep -e '^creat ignored for existing file' -e '^creat for.*replaces
existing'
/home/jenkins/oe/world/shr-core/tmpfs/work/i586-oe-linux-musl/libao/1.2.0-r0/pseudo/pseudo.log
or grep -v '^path mismatch'
/home/jenkins/oe/world/shr-core/tmpfs/work/i586-oe-linux-musl/libao/1.2.0-r0/pseudo/pseudo.log:
debug_logfile: fd 2
pid 4165 [parent 4160], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 4160.
db cleanup for server shutdown, 01:43:56.829
memory-to-file backup complete, 01:43:56.830.
db cleanup finished, 01:43:56.830
debug_logfile: fd 2
pid 11266 [parent 11265], doing new pid setup and server start
Setup complete, sending SIGUSR1 to pid 11265.
inode mismatch:
'/home/jenkins/oe/world/shr-core/tmpfs/sysroots/package-output.lock' ino
346594 in db, 347812 in request.
creat ignored for existing file
'/home/jenkins/oe/world/shr-core/tmpfs/sysroots/package-output.lock'.
inode mismatch:
'/home/jenkins/oe/world/shr-core/tmpfs/sysroots/package-output.lock' ino
346594 in db, 347812 in request.
inode mismatch:
'/home/jenkins/oe/world/shr-core/tmpfs/sysroots/package-output.lock' ino
346594 in db, 347812 in request.
inode mismatch:
'/home/jenkins/oe/world/shr-core/tmpfs/sysroots/package-output.lock' ino
346594 in db, 347812 in request.
inode mismatch:
'/home/jenkins/oe/world/shr-core/tmpfs/sysroots/package-output.lock' ino
346594 in db, 347812 in request.
inode mismatch:
'/home/jenkins/oe/world/shr-core/tmpfs/sysroots/package-output.lock' ino
346594 in db, 347812 in request.
 [qa-pseudo]

shown in last world build:
http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86/760/console

I have no idea how to resolve this one as it needs to be global and shared
between many pseudo databases.

Any idea?

On Fri, Apr 20, 2018 at 9:25 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> PACKAGELOCK is there to protect readers of PKGDATA_DIR from writes and
> files
> changing whilst they're being read. With various changes to the codebase,
> the lock code has become confused as the files are now written by the
> sstate
> code in do_packagedata, not in do_package directly any longer.
>
> This change cleans up the code so read sites take the shared lock
> (anything in
> do_package), write sites take the full lock (do_packagedata sstate).
>
> The lock from do_package sstate is no longer needed since it doesn't write
> outside WORKDIR.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package.bbclass | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 0436d91..e03d450 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1615,7 +1615,7 @@ python package_do_shlibs() {
>      shlibswork_dir = d.getVar('SHLIBSWORKDIR')
>
>      # Take shared lock since we're only reading, not writing
> -    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
> +    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
>
>      def linux_so(file, needed, sonames, renames, pkgver):
>          needs_ldconfig = False
> @@ -1900,7 +1900,7 @@ python package_do_pkgconfig () {
>                                  pkgconfig_needed[pkg] += exp.replace(',',
> ' ').split()
>
>      # Take shared lock since we're only reading, not writing
> -    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"))
> +    lf = bb.utils.lockfile(d.expand("${PACKAGELOCK}"), True)
>
>      for pkg in packages.split():
>          pkgs_file = os.path.join(shlibswork_dir, pkg + ".pclist")
> @@ -2233,11 +2233,9 @@ do_package[dirs] = "${SHLIBSWORKDIR} ${PKGDESTWORK}
> ${D}"
>  do_package[vardeps] += "${PACKAGEBUILDPKGD} ${PACKAGESPLITFUNCS}
> ${PACKAGEFUNCS} ${@gen_packagevar(d)}"
>  addtask package after do_install
>
> -PACKAGELOCK = "${STAGING_DIR}/package-output.lock"
>  SSTATETASKS += "do_package"
>  do_package[cleandirs] = "${PKGDEST} ${PKGDESTWORK}"
>  do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST} ${PKGDESTWORK}"
> -do_package[sstate-lockfile-shared] = "${PACKAGELOCK}"
>  do_package_setscene[dirs] = "${STAGING_DIR}"
>
>  python do_package_setscene () {
> @@ -2252,9 +2250,12 @@ do_packagedata () {
>  addtask packagedata before do_build after do_package
>
>  SSTATETASKS += "do_packagedata"
> +# PACKAGELOCK protects readers of PKGDATA_DIR against writes
> +# whilst code is reading in do_package
> +PACKAGELOCK = "${STAGING_DIR}/package-output.lock"
>  do_packagedata[sstate-inputdirs] = "${PKGDESTWORK}"
>  do_packagedata[sstate-outputdirs] = "${PKGDATA_DIR}"
> -do_packagedata[sstate-lockfile-shared] = "${PACKAGELOCK}"
> +do_packagedata[sstate-lockfile] = "${PACKAGELOCK}"
>  do_packagedata[stamp-extra-info] = "${MACHINE_ARCH}"
>
>  python do_packagedata_setscene () {
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000000eae21056a432c1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Now with pseudo log files a bit smaller this=C2=A0<span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">package-</span><wbr style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">output.lock se=
ems to be most common &quot;issue&quot; reported with do_qa_pseudo.</span><=
div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-si=
ze:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps=
:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:=
0px;text-transform:none;white-space:normal;word-spacing:0px;background-colo=
r:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:init=
ial;float:none;display:inline"><br></span></div><div><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norma=
l;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;le=
tter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;wh=
ite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial;float:none;display:inl=
ine">e.g.:</span></div><div><span style=3D"text-align:start;text-indent:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline"><div style=3D"font-size:12.8=
px">libao-1.2.0: This /work/i586-oe-linux-musl/libao/1.2.0-r0/pseudo/pseudo=
.log indicates 16 errors [qa-pseudo]</div><div style=3D"font-size:12.8px">s=
ee grep -e &#39;^creat ignored for existing file&#39; -e &#39;^creat for.*r=
eplaces existing&#39; /home/jenkins/oe/world/shr-core/tmpfs/work/i586-oe-li=
nux-musl/libao/1.2.0-r0/pseudo/pseudo.log or grep -v &#39;^path mismatch&#3=
9; /home/jenkins/oe/world/shr-core/tmpfs/work/i586-oe-linux-musl/libao/1.2.=
0-r0/pseudo/pseudo.log: debug_logfile: fd 2</div><div style=3D"font-size:12=
.8px">pid 4165 [parent 4160], doing new pid setup and server start</div><di=
v style=3D"font-size:12.8px">Setup complete, sending SIGUSR1 to pid 4160.</=
div><div style=3D"font-size:12.8px">db cleanup for server shutdown, 01:43:5=
6.829</div><div style=3D"font-size:12.8px">memory-to-file backup complete, =
01:43:56.830.</div><div style=3D"font-size:12.8px">db cleanup finished, 01:=
43:56.830</div><div style=3D"font-size:12.8px">debug_logfile: fd 2</div><di=
v style=3D"font-size:12.8px">pid 11266 [parent 11265], doing new pid setup =
and server start</div><div style=3D"font-size:12.8px">Setup complete, sendi=
ng SIGUSR1 to pid 11265.</div><div style=3D"font-size:12.8px">inode mismatc=
h: &#39;/home/jenkins/oe/world/shr-core/tmpfs/sysroots/package-output.lock&=
#39; ino 346594 in db, 347812 in request.</div><div style=3D"font-size:12.8=
px">creat ignored for existing file &#39;/home/jenkins/oe/world/shr-core/tm=
pfs/sysroots/package-output.lock&#39;.</div><div style=3D"font-size:12.8px"=
>inode mismatch: &#39;/home/jenkins/oe/world/shr-core/tmpfs/sysroots/packag=
e-output.lock&#39; ino 346594 in db, 347812 in request.</div><div style=3D"=
font-size:12.8px">inode mismatch: &#39;/home/jenkins/oe/world/shr-core/tmpf=
s/sysroots/package-output.lock&#39; ino 346594 in db, 347812 in request.</d=
iv><div style=3D"font-size:12.8px">inode mismatch: &#39;/home/jenkins/oe/wo=
rld/shr-core/tmpfs/sysroots/package-output.lock&#39; ino 346594 in db, 3478=
12 in request.</div><div style=3D"font-size:12.8px">inode mismatch: &#39;/h=
ome/jenkins/oe/world/shr-core/tmpfs/sysroots/package-output.lock&#39; ino 3=
46594 in db, 347812 in request.</div><div style=3D"font-size:12.8px">inode =
mismatch: &#39;/home/jenkins/oe/world/shr-core/tmpfs/sysroots/package-outpu=
t.lock&#39; ino 346594 in db, 347812 in request.</div><div style=3D"font-si=
ze:12.8px">=C2=A0[qa-pseudo]</div><div style=3D"font-size:12.8px"><br></div=
><div style=3D"font-size:12.8px">shown in last world build:</div><div><span=
 style=3D"font-size:12.8px"><a href=3D"http://jenkins.nas-admin.org/view/OE=
/job/oe_world_qemux86/760/console">http://jenkins.nas-admin.org/view/OE/job=
/oe_world_qemux86/760/console</a></span><br></div><div><span style=3D"font-=
size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">I have =
no idea how to resolve this one as it needs to be global and shared between=
 many pseudo databases.</span></div><div><span style=3D"font-size:12.8px"><=
br></span></div><div><span style=3D"font-size:12.8px">Any idea?</span></div=
></span></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Fri, Apr 20, 2018 at 9:25 AM, Richard Purdie <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">PACKAGELOCK is there to protect readers of PKGDATA_DIR from writ=
es and files<br>
changing whilst they&#39;re being read. With various changes to the codebas=
e,<br>
the lock code has become confused as the files are now written by the sstat=
e<br>
code in do_packagedata, not in do_package directly any longer.<br>
<br>
This change cleans up the code so read sites take the shared lock (anything=
 in<br>
do_package), write sites take the full lock (do_packagedata sstate).<br>
<br>
The lock from do_package sstate is no longer needed since it doesn&#39;t wr=
ite<br>
outside WORKDIR.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0meta/classes/package.bbclass | 11 ++++++-----<br>
=C2=A01 file changed, 6 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass<br=
>
index 0436d91..e03d450 100644<br>
--- a/meta/classes/package.bbclass<br>
+++ b/meta/classes/package.bbclass<br>
@@ -1615,7 +1615,7 @@ python package_do_shlibs() {<br>
=C2=A0 =C2=A0 =C2=A0shlibswork_dir =3D d.getVar(&#39;SHLIBSWORKDIR&#39;)<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0# Take shared lock since we&#39;re only reading, not wr=
iting<br>
-=C2=A0 =C2=A0 lf =3D bb.utils.lockfile(d.expand(&quot;${<wbr>PACKAGELOCK}&=
quot;))<br>
+=C2=A0 =C2=A0 lf =3D bb.utils.lockfile(d.expand(&quot;${<wbr>PACKAGELOCK}&=
quot;), True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def linux_so(file, needed, sonames, renames, pkgver):<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0needs_ldconfig =3D False<br>
@@ -1900,7 +1900,7 @@ python package_do_pkgconfig () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgconfig_needed[pkg] +=3D exp=
.replace(&#39;,&#39;, &#39; &#39;).split()<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Take shared lock since we&#39;re only reading, not wr=
iting<br>
-=C2=A0 =C2=A0 lf =3D bb.utils.lockfile(d.expand(&quot;${<wbr>PACKAGELOCK}&=
quot;))<br>
+=C2=A0 =C2=A0 lf =3D bb.utils.lockfile(d.expand(&quot;${<wbr>PACKAGELOCK}&=
quot;), True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for pkg in packages.split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgs_file =3D os.path.join(shlibswork_dir=
, pkg + &quot;.pclist&quot;)<br>
@@ -2233,11 +2233,9 @@ do_package[dirs] =3D &quot;${SHLIBSWORKDIR} ${PKGDES=
TWORK} ${D}&quot;<br>
=C2=A0do_package[vardeps] +=3D &quot;${PACKAGEBUILDPKGD} ${PACKAGESPLITFUNC=
S} ${PACKAGEFUNCS} ${@gen_packagevar(d)}&quot;<br>
=C2=A0addtask package after do_install<br>
<br>
-PACKAGELOCK =3D &quot;${STAGING_DIR}/package-<wbr>output.lock&quot;<br>
=C2=A0SSTATETASKS +=3D &quot;do_package&quot;<br>
=C2=A0do_package[cleandirs] =3D &quot;${PKGDEST} ${PKGDESTWORK}&quot;<br>
=C2=A0do_package[sstate-plaindirs] =3D &quot;${PKGD} ${PKGDEST} ${PKGDESTWO=
RK}&quot;<br>
-do_package[sstate-lockfile-<wbr>shared] =3D &quot;${PACKAGELOCK}&quot;<br>
=C2=A0do_package_setscene[dirs] =3D &quot;${STAGING_DIR}&quot;<br>
<br>
=C2=A0python do_package_setscene () {<br>
@@ -2252,9 +2250,12 @@ do_packagedata () {<br>
=C2=A0addtask packagedata before do_build after do_package<br>
<br>
=C2=A0SSTATETASKS +=3D &quot;do_packagedata&quot;<br>
+# PACKAGELOCK protects readers of PKGDATA_DIR against writes<br>
+# whilst code is reading in do_package<br>
+PACKAGELOCK =3D &quot;${STAGING_DIR}/package-<wbr>output.lock&quot;<br>
=C2=A0do_packagedata[sstate-<wbr>inputdirs] =3D &quot;${PKGDESTWORK}&quot;<=
br>
=C2=A0do_packagedata[sstate-<wbr>outputdirs] =3D &quot;${PKGDATA_DIR}&quot;=
<br>
-do_packagedata[sstate-<wbr>lockfile-shared] =3D &quot;${PACKAGELOCK}&quot;=
<br>
+do_packagedata[sstate-<wbr>lockfile] =3D &quot;${PACKAGELOCK}&quot;<br>
=C2=A0do_packagedata[stamp-extra-<wbr>info] =3D &quot;${MACHINE_ARCH}&quot;=
<br>
<br>
=C2=A0python do_packagedata_setscene () {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.7.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--0000000000000eae21056a432c1f--
