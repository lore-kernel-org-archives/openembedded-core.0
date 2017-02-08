Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7F571AD8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 04:21:47 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h53so21748730qth.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 20:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bJHGwvQhxz+QhyNSoSZAeSsePCL4mkCN4ci89lIDPkE=;
	b=TXUEbMS4GLesC43o56jTaj/Pz3X1bjVfqFrDw9BkmZVWDrC4yyHyzqOaopNojeyCod
	s1EscQhdL8k2od7t3ATRNs4BbmNQSsf7PY3TpERwoNyxbl1Z5raYqkaNZBuEkefSUXlI
	mgmLafcmaVE6VXo65frFqd2ruEI7sNO0XyAzKjAEOR5noajrqLSmSepHKKlkacKc6OSz
	hazk4r0BTm+rLYX16iYoUjs42GC8OtXXaekqZTWgPePt5osOhxKXJWVvvquNCUG09aA6
	RlH6oaRKA0fhT8FSJ/l3IeyuOkkF+SqvyP0fcPw6ZTXGc9f/PTK6FGaCxvQ7UaXET2oR
	PpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bJHGwvQhxz+QhyNSoSZAeSsePCL4mkCN4ci89lIDPkE=;
	b=XCEyn186cBWtIY39/dhcTV4WJ/kfA0ghiQuRPIDwqv8/rSEEabiYgUvQ5toEouvn48
	gBdfebAp3JSSXTVNNAVcXxA+9rPmlyk5d4bbbu/S5M0He6V3Zv3yBnB0nwbLBQinmKe4
	gQUEVuxQjqZ0nSpItPVNNe275ElaNj7s4iEj2YWr0xJ7HddL+T4SJ45yhWmXCelYLiFa
	6bPiuewlsJB6iEOILQwAd1DF/q8fQMTbJMWsrTMsYZUnRUoyjUyeT5KICYd7JrvF/Q0Z
	LKQYE52RzEgXP7Fe7bnr3B52C5i9mHT+1xw+PYiYiQZ45qNwnPhZ/ulZJ8+pA9MWlepx
	k89Q==
X-Gm-Message-State: AMke39mvq95I5Z032tSB9QnXcz/AbdGzxniSf3VhR0IXElwZRKAByNrOIiVEEcF/OGHJMUUmFpdOnwNj+r9mRg==
X-Received: by 10.200.49.45 with SMTP id g42mr20001055qtb.9.1486527708195;
	Tue, 07 Feb 2017 20:21:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Tue, 7 Feb 2017 20:21:47 -0800 (PST)
In-Reply-To: <1486527626-14821-1-git-send-email-bruce.ashfield@windriver.com>
References: <1486527626-14821-1-git-send-email-bruce.ashfield@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Feb 2017 23:21:47 -0500
Message-ID: <CADkTA4N_u+kA_NS2fqMHFaNu_C0v6GMPY7PDfyu4miCXzG4NDA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kern-tools: re-enable scc merge command
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
X-List-Received-Date: Wed, 08 Feb 2017 04:21:48 -0000
Content-Type: multipart/alternative; boundary=001a11374922fef2570547fd3324

--001a11374922fef2570547fd3324
Content-Type: text/plain; charset=UTF-8

This should have had [morty] in the subject. Sorry about that.

The explanation of the change is in the patch itself in the temporary area.

Cheers,

Bruce

On Tue, Feb 7, 2017 at 11:20 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> The ability to merge two branches directly from a .scc file was
> dropped during the streamlining of the tools.
>
> As was pointed out by David Vincent <freesilicon@gmail.com>, there is
> once again a valid use case for this functionality, so we restore the
> capability.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>
> Armin,
>
> This restores old functionality that was dropped due to kern-tools
> streamlining.
> It was reported as missing on morty, and this doesn't impact other
> functionality
> .. so it is worth restoring this, and of course, this also carries forward
> into
> master.
>
> Bruce
>
>  meta/classes/kernel-yocto.bbclass                       | 16
> +++++++++++++++-
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |  3 ++-
>  2 files changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index a60327a..eb35dce 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -148,7 +148,7 @@ do_kernel_metadata() {
>         # run1: pull all the configuration fragments, no matter where they
> come from
>         elements="`echo -n ${bsp_definition} ${sccs} ${patches}
> ${KERNEL_FEATURES}`"
>         if [ -n "${elements}" ]; then
> -               scc --force -o ${S}/${meta_dir}:cfg,meta ${includes}
> ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> +               scc --force -o ${S}/${meta_dir}:cfg,merge,meta
> ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
>                 if [ $? -ne 0 ]; then
>                         bbfatal_log "Could not generate configuration
> queue for ${KMACHINE}."
>                 fi
> @@ -165,6 +165,7 @@ do_kernel_metadata() {
>  }
>
>  do_patch() {
> +       set +e
>         cd ${S}
>
>         check_git_config
> @@ -177,6 +178,19 @@ do_patch() {
>                         bbfatal_log "Patch failures can be resolved in the
> linux source directory ${S})"
>                 fi
>         fi
> +
> +       if [ -f "${meta_dir}/merge.queue" ]; then
> +               # we need to merge all these branches
> +               for b in $(cat ${meta_dir}/merge.queue); do
> +                       git show-ref --verify --quiet refs/heads/${b}
> +                       if [ $? -eq 0 ]; then
> +                               bbnote "Merging branch ${b}"
> +                               git merge -q --no-ff -m "Merge branch
> ${b}" ${b}
> +                       else
> +                               bbfatal "branch ${b} does not exist,
> cannot merge"
> +                       fi
> +               done
> +       fi
>  }
>
>  do_kernel_checkout() {
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 8af0155..aa27ec8 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;
> beginline=5;endline=9;md5=a6c2fa8aef1b
>
>  DEPENDS = "git-native"
>
> -SRCREV = "85564e69555b713c2759d58ec5ade54424d051d8"
> +SRCREV = "c14440d4e7ae0160c260ed65c3e123be5dc97ae8"
> +
>  PR = "r12"
>  PV = "0.2+git${SRCPV}"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11374922fef2570547fd3324
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This should have had [morty] in the subject. Sorry about t=
hat.<div><br></div><div>The explanation of the change is in the patch itsel=
f in the temporary area.</div><div><br></div><div>Cheers,</div><div><br></d=
iv><div>Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Tue, Feb 7, 2017 at 11:20 PM, Bruce Ashfield <span dir=3D"ltr">&=
lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.=
ashfield@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">The ability to merge two branches directly from a .scc file was<br>
dropped during the streamlining of the tools.<br>
<br>
As was pointed out by David Vincent &lt;<a href=3D"mailto:freesilicon@gmail=
.com">freesilicon@gmail.com</a>&gt;, there is<br>
once again a valid use case for this functionality, so we restore the<br>
capability.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com">bruce.ashfield@windriver.com</a>&gt;<br>
---<br>
<br>
Armin,<br>
<br>
This restores old functionality that was dropped due to kern-tools streamli=
ning.<br>
It was reported as missing on morty, and this doesn&#39;t impact other func=
tionality<br>
.. so it is worth restoring this, and of course, this also carries forward =
into<br>
master.<br>
<br>
Bruce<br>
<br>
=C2=A0meta/classes/kernel-yocto.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 +++++++++++++++-<b=
r>
=C2=A0meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools-nati=
ve_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a=
> |=C2=A0 3 ++-<br>
=C2=A02 files changed, 17 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.<wbr>bbclass b/meta/classes/kernel-y=
octo.<wbr>bbclass<br>
index a60327a..eb35dce 100644<br>
--- a/meta/classes/kernel-yocto.<wbr>bbclass<br>
+++ b/meta/classes/kernel-yocto.<wbr>bbclass<br>
@@ -148,7 +148,7 @@ do_kernel_metadata() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # run1: pull all the configuration fragments, n=
o matter where they come from<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 elements=3D&quot;`echo -n ${bsp_definition} ${s=
ccs} ${patches} ${KERNEL_FEATURES}`&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${elements}&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scc --force -o ${S}=
/${meta_dir}:cfg,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KE=
RNEL_FEATURES}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scc --force -o ${S}=
/${meta_dir}:cfg,merge,<wbr>meta ${includes} ${bsp_definition} ${sccs} ${pa=
tches} ${KERNEL_FEATURES}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 ]; th=
en<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bbfatal_log &quot;Could not generate configuration queue for ${K=
MACHINE}.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
@@ -165,6 +165,7 @@ do_kernel_metadata() {<br>
=C2=A0}<br>
<br>
=C2=A0do_patch() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0set +e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${S}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 check_git_config<br>
@@ -177,6 +178,19 @@ do_patch() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bbfatal_log &quot;Patch failures can be resolved in the linux so=
urce directory ${S})&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f &quot;${meta_dir}/merge.queue&quot; ]; =
then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# we need to merge =
all these branches<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for b in $(cat ${me=
ta_dir}/merge.queue); do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0git show-ref --verify --quiet refs/heads/${b}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ $? -eq 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;Merging branch ${b}&quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git merge -q --no-ff -m &quot;Merge b=
ranch ${b}&quot; ${b}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;branch ${b} does not ex=
ist, cannot merge&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0do_kernel_checkout() {<br>
diff --git a/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-too=
ls-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_gi=
t.bb</a> b/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools=
-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.=
bb</a><br>
index 8af0155..aa27ec8 100644<br>
--- a/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools-nati=
ve_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a=
><br>
+++ b/meta/recipes-kernel/kern-<wbr>tools/<a href=3D"http://kern-tools-nati=
ve_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a=
><br>
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM =3D &quot;file://git/tools/kgit;<wbr>begin=
line=3D5;endline=3D9;md5=3D<wbr>a6c2fa8aef1b<br>
<br>
=C2=A0DEPENDS =3D &quot;git-native&quot;<br>
<br>
-SRCREV =3D &quot;<wbr>85564e69555b713c2759d58ec5ade5<wbr>4424d051d8&quot;<=
br>
+SRCREV =3D &quot;<wbr>c14440d4e7ae0160c260ed65c3e123<wbr>be5dc97ae8&quot;<=
br>
+<br>
=C2=A0PR =3D &quot;r12&quot;<br>
=C2=A0PV =3D &quot;0.2+git${SRCPV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a11374922fef2570547fd3324--
