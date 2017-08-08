Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id E5B5760767;
	Tue,  8 Aug 2017 08:39:08 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id l82so17049115ywc.2;
	Tue, 08 Aug 2017 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QQOlWDd+Zuo4MtYXDPqwdL8KD33NIkIIQbFsRkGxfRU=;
	b=jBIiu49thpI26ciuQA8xq48nVgsfCjl3LvSU45TWPtaW5x8irmr7VTI1STF3ZTD/Z+
	sFHv5CectX/WbGactupgqwWyxnKTdt1mZ7lOAENS5C4BoxqW0r5eQxd0rZgm4QmTwh1x
	H9hmk8sH4NGKu/ahzsVtj11MyEIkPFQ3eX6fbZHn7lLdvYIwVVCXaW7pygFhigDiUiol
	ieaGbqwmAU63RIVsxZ89XNxsVVeUhCmDYX0ITEcTtvNDDj7hYDPM2Ji+wD1UsPgvSQGX
	V5cNrqMwhfYgQ8oinbnl11iRlowMrmMYFXeGjh3OH6OhTky/vppcDnrufrOGXHACzZjV
	ATjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QQOlWDd+Zuo4MtYXDPqwdL8KD33NIkIIQbFsRkGxfRU=;
	b=GLgJMSonrGtieiNRwlyJ6txculhuUz1z4sVd1CIbsIb2GQxL7u/30lPHatJu1lryxF
	xR0hHK2v0gESVdZNGHi0adnapyzYCbK3hpG+5X2T4QHJVIvaD3vKIhQMwWBJh9jXmNA3
	Y5/30uJvWEzd2jx5pNSbtGwEEerzEc4GvfdY1xRP9Qgy9II/onAAy1REVHt9eh/sukS7
	WTDr/r+45FATzazSIGK1gdFnmaBEO9jU3PszjRxVOFiCEhmYOwvVzTZ5JKFYkVZsFThe
	FiqfPjtKSSNXlSJTnZTCBfDLaSJ2safl0vjOUvztuuxhixnUNVj0tgprr4t9fkjXByh7
	egYA==
X-Gm-Message-State: AHYfb5iHqLK8Uyvhn0BP1OcBBjwZkij1ebaVff2RBkRPt5scAF3fbg1T
	aPKHw12TQ4NLxhY8dntaKiAfimkOhA==
X-Received: by 10.129.108.139 with SMTP id h133mr2723046ywc.106.1502181549609; 
	Tue, 08 Aug 2017 01:39:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.172.231 with HTTP; Tue, 8 Aug 2017 01:39:08 -0700 (PDT)
In-Reply-To: <20170731141434.5BF71234F5E@git.openembedded.org>
References: <150151047393.6216.6118904073469543386@git.openembedded.org>
	<20170731141434.5BF71234F5E@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 8 Aug 2017 10:39:08 +0200
Message-ID: <CA+chaQc_Cc8gyBGeOpXuOQXBZoX+XRE4cC+c_N+tCNcD20=3vw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 04/09: image/rm_work: Promote do_image_complete to be more sstate like
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
X-List-Received-Date: Tue, 08 Aug 2017 08:39:09 -0000
Content-Type: multipart/alternative; boundary="001a114da5e2a72f6c055639e580"

--001a114da5e2a72f6c055639e580
Content-Type: text/plain; charset="UTF-8"

With this change I'm seeing all images failing with:

| DEBUG: Executing shell function do_rm_work
| mv:
?1.0-r0.4.0.do_image_complete.fb2421734f998a50c93250deb80d3024.MACHINE? and
?1.0-r0.4.0.do_image_complete.fb2421734f998a50c93250deb80d3024.MACHINE
? are the same file
| WARNING: exit code 1 from a shell command.

I'll check what's special on my config (what's matched in $j) that this
issue wasn't triggered on autobuilder, but any hints would be welcome as
well.

On Mon, Jul 31, 2017 at 4:14 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit 2ff9d40dc88d43567472218cf3d3faf414398c71
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> AuthorDate: Sun Jul 30 16:06:57 2017 +0100
>
>     image/rm_work: Promote do_image_complete to be more sstate like
>
>     We relied on the missing do_image_complete_setscene task to ensure the
> dummy
>     sstate tarball that was created would never be used. This lead to its
> own
>     issues and a better fix for SSTATE_SKIP_CREATION has now been merged.
>
>     We can therefore make do_image_complete look like a more standard
> sstate
>     task which means image generation doesn't keep rerunning when using
> rm_work.
>
>     We do need to turn do_image_complete's stamp into an sstate version to
>     handle this (it otherwise matches the do_image_* glob).
>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/image.bbclass   | 4 ++++
>  meta/classes/rm_work.bbclass | 5 +++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 0885fdb..696aacd 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -289,6 +289,10 @@ do_image_complete[sstate-inputdirs] =
> "${IMGDEPLOYDIR}"
>  do_image_complete[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
>  do_image_complete[stamp-extra-info] = "${MACHINE}"
>  addtask do_image_complete after do_image before do_build
> +python do_image_complete_setscene () {
> +    sstate_setscene(d)
> +}
> +addtask do_image_complete_setscene
>
>  # Add image-level QA/sanity checks to IMAGE_QA_COMMANDS
>  #
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 2a4e808..71c21a0 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -61,6 +61,11 @@ do_rm_work () {
>                  i=dummy
>                  break
>                  ;;
> +            *do_image_complete*)
> +                mv $i `echo $i | sed -e "s#${j}#${j}_setscene#"`
> +                i=dummy
> +                break
> +                ;;
>              *do_rootfs*|*do_image*|*do_bootimg*|*do_bootdirectdisk*|*
> do_vmimg*|*do_write_qemuboot_conf*)
>                  i=dummy
>                  break
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

--001a114da5e2a72f6c055639e580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>With this change I&#39;m seeing all images failing wi=
th:</div><div><br></div><div>| DEBUG: Executing shell function do_rm_work</=
div><div>| mv: ?1.0-r0.4.0.do_image_complete.fb2421734f998a50c93250deb80d30=
24.MACHINE? and ?1.0-r0.4.0.do_image_complete.fb2421734f998a50c93250deb80d3=
024.MACHINE</div><div>? are the same file =C2=A0</div><div>| WARNING: exit =
code 1 from a shell command.</div><div><br></div><div>I&#39;ll check what&#=
39;s special on my config (what&#39;s matched in $j) that this issue wasn&#=
39;t triggered on autobuilder, but any hints would be welcome as well.</div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Ju=
l 31, 2017 at 4:14 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:git@git.ope=
nembedded.org" target=3D"_blank">git@git.openembedded.org</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">This is an automated email from the =
git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 2ff9d40dc88d43567472218cf3d3fa<wbr>f414398c71<br>
Author: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
AuthorDate: Sun Jul 30 16:06:57 2017 +0100<br>
<br>
=C2=A0 =C2=A0 image/rm_work: Promote do_image_complete to be more sstate li=
ke<br>
<br>
=C2=A0 =C2=A0 We relied on the missing do_image_complete_setscene task to e=
nsure the dummy<br>
=C2=A0 =C2=A0 sstate tarball that was created would never be used. This lea=
d to its own<br>
=C2=A0 =C2=A0 issues and a better fix for SSTATE_SKIP_CREATION has now been=
 merged.<br>
<br>
=C2=A0 =C2=A0 We can therefore make do_image_complete look like a more stan=
dard sstate<br>
=C2=A0 =C2=A0 task which means image generation doesn&#39;t keep rerunning =
when using rm_work.<br>
<br>
=C2=A0 =C2=A0 We do need to turn do_image_complete&#39;s stamp into an ssta=
te version to<br>
=C2=A0 =C2=A0 handle this (it otherwise matches the do_image_* glob).<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/image.bbclass=C2=A0 =C2=A0| 4 ++++<br>
=C2=A0meta/classes/rm_work.bbclass | 5 +++++<br>
=C2=A02 files changed, 9 insertions(+)<br>
<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 0885fdb..696aacd 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -289,6 +289,10 @@ do_image_complete[sstate-<wbr>inputdirs] =3D &quot;${I=
MGDEPLOYDIR}&quot;<br>
=C2=A0do_image_complete[sstate-<wbr>outputdirs] =3D &quot;${DEPLOY_DIR_IMAG=
E}&quot;<br>
=C2=A0do_image_complete[stamp-extra-<wbr>info] =3D &quot;${MACHINE}&quot;<b=
r>
=C2=A0addtask do_image_complete after do_image before do_build<br>
+python do_image_complete_setscene () {<br>
+=C2=A0 =C2=A0 sstate_setscene(d)<br>
+}<br>
+addtask do_image_complete_setscene<br>
<br>
=C2=A0# Add image-level QA/sanity checks to IMAGE_QA_COMMANDS<br>
=C2=A0#<br>
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass<br=
>
index 2a4e808..71c21a0 100644<br>
--- a/meta/classes/rm_work.bbclass<br>
+++ b/meta/classes/rm_work.bbclass<br>
@@ -61,6 +61,11 @@ do_rm_work () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=3Ddummy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *do_image_complete*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv $i `echo $i | s=
ed -e &quot;s#${j}#${j}_setscene#&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=3Ddummy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*do_rootfs*|*do_image*|*do_=
<wbr>bootimg*|*do_bootdirectdisk*|*<wbr>do_vmimg*|*do_write_qemuboot_<wbr>c=
onf*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=3Ddummy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>

--001a114da5e2a72f6c055639e580--
