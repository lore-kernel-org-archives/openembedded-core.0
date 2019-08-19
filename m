Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
	[209.85.217.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8DC7F260
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 14:01:49 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id 62so1237022vsl.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 07:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z7tHWD1h+T6jSUKbmQ7oc7dbIsvRhwsiSZPEUBjZlmQ=;
	b=Dy1EUDj+1t/NzV1CgvmrMdlB6kWnUnk0jpQa6Zde+WiDafiUJnukR2rk/0df5bkwlc
	r6VvuZe+h2Ql1oa2a6Ugrnmgp3bPMzwfNjz08gcY6Kzk3BgHYE0YSENBiDYEHVeVGzEh
	yCXs15rt32ujgTClQ2LsR1BYTnmNX2VnDmdYzkNty7ws5XyneJO5zgWU1l8Q3q4XTJJP
	9ElgeU0XrDo+LL4eR78LzwUar1Nk++v5EX+3g+ww/XXsWz4BMJxbpHcSws5R5N0i19EA
	xYfWhW4xcXcmExzCHz1Q0xEyxS/vdt/E9XXmQLjrfehAESzl5gqt3XSt12B+XlieEgGB
	4uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z7tHWD1h+T6jSUKbmQ7oc7dbIsvRhwsiSZPEUBjZlmQ=;
	b=lg5SKMizjN+2wxGg/pgGPAV6EsEu2lbuluILumFkT53tx1XrD6+4BO/wSx7cDd2haR
	4pLC2nWismQmhd6viRjH6X5NqNUBud21czjxJx4eU6PKxA44h49i0buAey2z/Ws7QSgt
	IxBTE77K6CDU0EVPFKRqqQpILhEViQRo+Co8VNzdFzIv1KvNNA4FBDpcimhmH6wQ+fEI
	tm9toP1B39r40F+BV+VAcVyeTfld86v4wC9b4UDITLHgbMG82kxrYE7cOVnpUscONuxg
	Y04V0S2Tj9LYCksTHva/Mx9lU1e/3VNFfAAjQyW7k7GxpRNorMN/WyQvgm9hFezTpn88
	SZNA==
X-Gm-Message-State: APjAAAW1Tzc1KFy7QBU72AceFFouBSLKn/Wf+rFiS8yceBSPVvNSDk59
	CQhK2hXA41mARGF5fN2abvu9kOpjVsTf62AtXrw=
X-Google-Smtp-Source: APXvYqwX/rouEtXBFLJOCXdE21hmwfXUkdyD1ZPzOV2iHQ1YlGe6QFpw3yvtTcaT2mgQkUls3MkDmHhccSZY7xvWZQw=
X-Received: by 2002:a67:62c5:: with SMTP id w188mr13938005vsb.25.1566223310765;
	Mon, 19 Aug 2019 07:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <1566221602-123706-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1566221602-123706-1-git-send-email-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2019 16:01:39 +0200
Message-ID: <CANNYZj9y6uP-=iSDLj=wQ-LTuAgBTsHL7F84eiCSs8=aycjZMg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: decreasing default RLIMIT_NOFILE on qemu bsp
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
X-List-Received-Date: Mon, 19 Aug 2019 14:01:50 -0000
Content-Type: multipart/alternative; boundary="00000000000013c220059078c8ca"

--00000000000013c220059078c8ca
Content-Type: text/plain; charset="UTF-8"

Should the limit be simply raised? The 256M setup is crumbling on several
fronts (runtime tests, modernisation of X, various non-x86 qemu targets).
Adding per-image/target exceptions, custom non-upstreamable patches, or
sticking to deprecated configurations isn't the right thing to do, I think.

Alex

On Mon, 19 Aug 2019 at 15:34, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Since do_testimage for core-image-sato-sdk has memory limitation (256Mib)
> which caused rpc.statd failed with out of memory.
> [  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or
> sacrifice child
>
> The rpc.statd allocates memory according to RLIMIT_NOFILE,
> so decrease it to 4k to keep sync with sysvinit
>
> After applying the patch, the memory cost is the same with sysvinit
> rpcuser    340  0.0  1.0   3212  2588 ?        Ss   13:20   0:00
> /usr/sbin/rpc.statd -F
> root       473  0.0  0.2   3464   496 ?        Ss   13:23   0:00
> /usr/sbin/rpc.mountd
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...0001-decreasing-the-default-RLIMIT_NOFILE.patch | 35
> ++++++++++++++++++++++
>  meta/recipes-core/systemd/systemd_242.bb           |  4 +++
>  2 files changed, 39 insertions(+)
>  create mode 100644
> meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
> b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
> new file mode 100644
> index 0000000..fb8e2c9
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_NOFILE.patch
> @@ -0,0 +1,35 @@
> +From 55c7196163e481c508fa708b9b8f5e7bf2d2f007 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 19 Aug 2019 07:16:47 -0400
> +Subject: [PATCH] decreasing the default RLIMIT_NOFILE
> +
> +Since do_testimage for core-image-sato-sdk has memory limits (256Mib)
> +which caused rpc.statd failed with out of memory.
> +[  531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 or
> sacrifice child
> +
> +The rpc.statd allocates memory according to RLIMIT_NOFILE,
> +so decrease it to 4k which keep sync with sysvinit
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 18a7cc5..e30894b 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -79,7 +79,7 @@ conf.set10('HAVE_SYSV_COMPAT', sysvinit_path != '' and
> sysvrcnd_path != '',
> +
> + conf.set10('BUMP_PROC_SYS_FS_FILE_MAX',
> get_option('bump-proc-sys-fs-file-max'))
> + conf.set10('BUMP_PROC_SYS_FS_NR_OPEN',
> get_option('bump-proc-sys-fs-nr-open'))
> +-conf.set('HIGH_RLIMIT_NOFILE',          512*1024)
> ++conf.set('HIGH_RLIMIT_NOFILE',          4*1024)
> +
> + # join_paths ignores the preceding arguments if an absolute component is
> + # encountered, so this should canonicalize various paths when they are
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_242.bb
> b/meta/recipes-core/systemd/systemd_242.bb
> index 1953fef..ab15ad2 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -58,6 +58,10 @@ SRC_URI_MUSL =
> "file://0001-Use-getenv-when-secure-versions-are-not-available.pa
>                 file://0001-do-not-disable-buffer-in-writing-files.patch \
>                 "
>
> +SRC_URI_append_qemuall = " \
> +               file://0001-decreasing-the-default-RLIMIT_NOFILE.patch \
> +"
> +
>  PAM_PLUGINS = " \
>      pam-plugin-unix \
>      pam-plugin-loginuid \
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000013c220059078c8ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Should the limit be simply raised? The 256M setup is =
crumbling on several fronts (runtime tests, modernisation of X, various non=
-x86 qemu targets). Adding per-image/target exceptions, custom non-upstream=
able patches, or sticking to deprecated configurations isn&#39;t the right =
thing to do, I think.<br></div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 19=
 Aug 2019 at 15:34, Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.c=
om" target=3D"_blank">hongxu.jia@windriver.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Since do_testimage for core-i=
mage-sato-sdk has memory limitation (256Mib)<br>
which caused rpc.statd failed with out of memory.<br>
[=C2=A0 531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 o=
r sacrifice child<br>
<br>
The rpc.statd allocates memory according to RLIMIT_NOFILE,<br>
so decrease it to 4k to keep sync with sysvinit<br>
<br>
After applying the patch, the memory cost is the same with sysvinit<br>
rpcuser=C2=A0 =C2=A0 340=C2=A0 0.0=C2=A0 1.0=C2=A0 =C2=A03212=C2=A0 2588 ?=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ss=C2=A0 =C2=A013:20=C2=A0 =C2=A00:00 /usr/sbin=
/rpc.statd -F<br>
root=C2=A0 =C2=A0 =C2=A0 =C2=A0473=C2=A0 0.0=C2=A0 0.2=C2=A0 =C2=A03464=C2=
=A0 =C2=A0496 ?=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ss=C2=A0 =C2=A013:23=C2=A0 =C2=
=A00:00 /usr/sbin/rpc.mountd<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0...0001-decreasing-the-default-RLIMIT_NOFILE.patch | 35 +++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_242.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 +++<br>
=C2=A02 files changed, 39 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0001-decreasing-=
the-default-RLIMIT_NOFILE.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-=
RLIMIT_NOFILE.patch b/meta/recipes-core/systemd/systemd/0001-decreasing-the=
-default-RLIMIT_NOFILE.patch<br>
new file mode 100644<br>
index 0000000..fb8e2c9<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0001-decreasing-the-default-RLIMIT_=
NOFILE.patch<br>
@@ -0,0 +1,35 @@<br>
+From 55c7196163e481c508fa708b9b8f5e7bf2d2f007 Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+Date: Mon, 19 Aug 2019 07:16:47 -0400<br>
+Subject: [PATCH] decreasing the default RLIMIT_NOFILE<br>
+<br>
+Since do_testimage for core-image-sato-sdk has memory limits (256Mib)<br>
+which caused rpc.statd failed with out of memory.<br>
+[=C2=A0 531.306146] Out of memory: Kill process 193 (rpc.statd) score 200 =
or sacrifice child<br>
+<br>
+The rpc.statd allocates memory according to RLIMIT_NOFILE,<br>
+so decrease it to 4k which keep sync with sysvinit<br>
+<br>
+Upstream-Status: Inappropriate [oe specific]<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ meson.build | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index 18a7cc5..e30894b 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -79,7 +79,7 @@ conf.set10(&#39;HAVE_SYSV_COMPAT&#39;, sysvinit_path !=
=3D &#39;&#39; and sysvrcnd_path !=3D &#39;&#39;,<br>
+ <br>
+ conf.set10(&#39;BUMP_PROC_SYS_FS_FILE_MAX&#39;, get_option(&#39;bump-proc=
-sys-fs-file-max&#39;))<br>
+ conf.set10(&#39;BUMP_PROC_SYS_FS_NR_OPEN&#39;,=C2=A0 get_option(&#39;bump=
-proc-sys-fs-nr-open&#39;))<br>
+-conf.set(&#39;HIGH_RLIMIT_NOFILE&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
512*1024)<br>
++conf.set(&#39;HIGH_RLIMIT_NOFILE&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
4*1024)<br>
+ <br>
+ # join_paths ignores the preceding arguments if an absolute component is<=
br>
+ # encountered, so this should canonicalize various paths when they are<br=
>
+-- <br>
+2.8.1<br>
+<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_242.bb</a> b/meta/recipes-core/s=
ystemd/<a href=3D"http://systemd_242.bb" rel=3D"noreferrer" target=3D"_blan=
k">systemd_242.bb</a><br>
index 1953fef..ab15ad2 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_242.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_242.bb</a><br>
@@ -58,6 +58,10 @@ SRC_URI_MUSL =3D &quot;file://0001-Use-getenv-when-secur=
e-versions-are-not-<a href=3D"http://available.pa" target=3D"_blank">availa=
ble.pa</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-do-not-=
disable-buffer-in-writing-files.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
+SRC_URI_append_qemuall =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-decreas=
ing-the-default-RLIMIT_NOFILE.patch \<br>
+&quot;<br>
+<br>
=C2=A0PAM_PLUGINS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0pam-plugin-unix \<br>
=C2=A0 =C2=A0 =C2=A0pam-plugin-loginuid \<br>
-- <br>
2.8.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000013c220059078c8ca--
