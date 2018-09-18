Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8C38B745BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 23:21:33 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id t5-v6so3447770qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 16:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2BflPFlnscXpTnPK/AxOGta3UOKYt5DsuCLrXgS9uDU=;
	b=c/zHCiVs02J+bp9NXDVMzeObUPfr3CIDQW+Qw3NVgt9uo2PMCOFsoey40GosY1jOmK
	G57zq9JXWYnwf/13Btwdd/Wrg4Ub6zaN5GIHvxxAgDQEFtIqUUWNxDcr1rTnnQ/R7Q7x
	qIU8i3ItV6o0RO+PIqMx/whrC+uMJuNSWq2/Nf6yMReKkRZSLq4SJCBoeCBjjxYirHG5
	+ZGrYLzKksn9qqwxwKZBrXT52tyQqJ65k7Kb7H6dGnNbX82X//ZlNMqvGh++zJ1z+brb
	S96+nV/m349CHEfR9vHMpT4uFwMAdZp0u//OiaSITwh0f7rsof/jLmgumSWoH1rK6nmF
	ca3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2BflPFlnscXpTnPK/AxOGta3UOKYt5DsuCLrXgS9uDU=;
	b=GkgY2ZBkOtKJXVpCkffFcn/P4KzRS6owUw4p8/aqQ4CmK92lZCI0SZrX6e0sc85/FS
	ZcE4mRDZp6HKOOiYOXqaAxQsaz1yc4WfU+99Jf3Y+vpYXgrkOTuqN9nj96edsfc0Dz3v
	T4q+uQsM1Qp2QM6IOGlcF/hCIU7op/Tbx54r51E2epnPLqBA3uu0LPahBYmwyNfCNsy2
	i8jQyk9hqcKqtVNAaUyaHMB7RaR2jLxeC5dc4kzWLCLsxtiPmIZjnKEnPoQKWImtWTWB
	7dmlER9B8cLbf/tEcixpbsJaNYu/chj3SOSHZjVCDdgYIuXLXh6FLC5EisVPJUPJoLqe
	qcvQ==
X-Gm-Message-State: APzg51ACu7dSq0Ic88Q2/Y0v/1Qh7hTNCnZLum8ebP0Q4lktCpFRHVWK
	w3EGNtDuZBxdO0MLI2c7Q2CabO9fBPQs/YD15Io=
X-Google-Smtp-Source: ANB0VdYx4z4W5jDbu2P3/6nvqQcbIkIHHNcFTEVQe0GRUivsZIWePymne63fANWNxJz/4GYuaFxJvEg7z1QSPG9RR+Y=
X-Received: by 2002:ac8:4304:: with SMTP id
	z4-v6mr21952620qtm.295.1537312894177; 
	Tue, 18 Sep 2018 16:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180917212943.27237-1-abrodkin@synopsys.com>
	<20180917212943.27237-11-abrodkin@synopsys.com>
In-Reply-To: <20180917212943.27237-11-abrodkin@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 16:21:23 -0700
Message-ID: <CAMKF1srgBL_wd6hYu8bCpeeiZHb63fYh4BcSxg6wwELfZY0M0Q@mail.gmail.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/10] gcc: Fix specs generation for ARC
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
X-List-Received-Date: Tue, 18 Sep 2018 23:21:33 -0000
Content-Type: multipart/alternative; boundary="000000000000f7550a05762d8c68"

--000000000000f7550a05762d8c68
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 17, 2018 at 2:30 PM Alexey Brodkin <Alexey.Brodkin@synopsys.com>
wrote:

> GCC's built-in spec for LD is missing a space after
> "--eh-frame-hdr" thus with the next option merged together they
> are not understood by LD and so LD fails.
>
> Back-port from upstream GCC, see:
>
> https://github.com/gcc-mirror/gcc/commit/892142379c6b99fe8c3ebdfe0b79e2a435228c1d
>

Can you add this to
Upstream-Status tag in patch file itself

>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  meta/recipes-devtools/gcc/gcc-8.2.inc              |  1 +
>  .../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch        | 40
> ++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc
> b/meta/recipes-devtools/gcc/gcc-8.2.inc
> index 889187e..866a775 100644
> --- a/meta/recipes-devtools/gcc/gcc-8.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
> @@ -69,6 +69,7 @@ SRC_URI = "\
>
> file://0038-fix-segmentation-fault-in-precompiled-header-generat.patch \
>             file://0039-Fix-for-testsuite-failure.patch \
>             file://0040-Re-introduce-spe-commandline-options.patch \
> +           file://0041-ARC-fix-spec-gen.patch \
>             ${BACKPORTS} \
>  "
>  BACKPORTS = "\
> diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
> b/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
> new file mode 100644
> index 0000000..d746d79
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
> @@ -0,0 +1,40 @@
> +From 892142379c6b99fe8c3ebdfe0b79e2a435228c1d Mon Sep 17 00:00:00 2001
> +From: claziss <claziss@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Mon, 17 Sep 2018 08:52:10 +0000
> +Subject: [PATCH] [ARC] Update LINK_EH_SPEC linker spec.
> +
> +With no trailing space in LINK_EH_SPEC linker spec gets generated as:
> +------------------------>8---------------------
> +%{!r:--build-id} --eh-frame-hdr%{h*} ...
> +------------------------>8---------------------
> +
> +or even worse if hash style is added:
> +------------------------>8---------------------
> +%{!r:--build-id} --eh-frame-hdr--hash-style=sysv %{h*} ...
> +------------------------>8---------------------
> +
> +Now if that spec is really used by LD then it fails inevitably
> +saying that it doesn't know option "--eh-frame-hdr--hash-style=sysv".
> +
> +2018-09-17  Alexey Brodkin  <abrodkin@synopsys.com>
> +
> +       * config/arc/linux.h (LINK_EH_SPEC): Add missing space.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@264361
> 138bc75d-0d04-0410-961f-82ee72b054a4
> +---
> + gcc/config/arc/linux.h | 2 +-
> + 1 files changed, 1 insertions(+), 1 deletion(-)
> +
> +diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
> +index 96d548eae341..62ebe4de0fc7 100644
> +--- a/gcc/config/arc/linux.h
> ++++ b/gcc/config/arc/linux.h
> +@@ -98,7 +98,7 @@ along with GCC; see the file COPYING3.  If not see
> +    Signalize that because we have fde-glibc, we don't need all C shared
> libs
> +    linked against -lgcc_s.  */
> + #undef LINK_EH_SPEC
> +-#define LINK_EH_SPEC "--eh-frame-hdr"
> ++#define LINK_EH_SPEC "--eh-frame-hdr "
> + #endif
> +
> + #undef SUBTARGET_CPP_SPEC
> --
> 1.8.3.1
>
>

--000000000000f7550a05762d8c68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon,=
 Sep 17, 2018 at 2:30 PM Alexey Brodkin &lt;<a href=3D"mailto:Alexey.Brodki=
n@synopsys.com">Alexey.Brodkin@synopsys.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">GCC&#39;s built-in spec for LD is missing a space a=
fter<br>
&quot;--eh-frame-hdr&quot; thus with the next option merged together they<b=
r>
are not understood by LD and so LD fails.<br>
<br>
Back-port from upstream GCC, see:<br>
<a href=3D"https://github.com/gcc-mirror/gcc/commit/892142379c6b99fe8c3ebdf=
e0b79e2a435228c1d" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
gcc-mirror/gcc/commit/892142379c6b99fe8c3ebdfe0b79e2a435228c1d</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Can you add this=
 to=C2=A0</div><div dir=3D"auto">Upstream-Status tag in patch file itself</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Alexey Brodkin &lt;<a href=3D"mailto:abrodkin@synopsys.com" =
target=3D"_blank">abrodkin@synopsys.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-8.2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 40 ++++++++++++++++++++++<br>
=C2=A02 files changed, 41 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spe=
c-gen.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/=
gcc/gcc-8.2.inc<br>
index 889187e..866a775 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc<br>
@@ -69,6 +69,7 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0038-fix-segmentation-faul=
t-in-precompiled-header-generat.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0039-Fix-for-testsuite-fai=
lure.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0040-Re-introduce-spe-comm=
andline-options.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0041-ARC-fix-spec-gen.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BACKPORTS} \<br>
=C2=A0&quot;<br>
=C2=A0BACKPORTS =3D &quot;\<br>
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch =
b/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch<br>
new file mode 100644<br>
index 0000000..d746d79<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch<br>
@@ -0,0 +1,40 @@<br>
+From 892142379c6b99fe8c3ebdfe0b79e2a435228c1d Mon Sep 17 00:00:00 2001<br>
+From: claziss &lt;claziss@138bc75d-0d04-0410-961f-82ee72b054a4&gt;<br>
+Date: Mon, 17 Sep 2018 08:52:10 +0000<br>
+Subject: [PATCH] [ARC] Update LINK_EH_SPEC linker spec.<br>
+<br>
+With no trailing space in LINK_EH_SPEC linker spec gets generated as:<br>
+------------------------&gt;8---------------------<br>
+%{!r:--build-id} --eh-frame-hdr%{h*} ...<br>
+------------------------&gt;8---------------------<br>
+<br>
+or even worse if hash style is added:<br>
+------------------------&gt;8---------------------<br>
+%{!r:--build-id} --eh-frame-hdr--hash-style=3Dsysv %{h*} ...<br>
+------------------------&gt;8---------------------<br>
+<br>
+Now if that spec is really used by LD then it fails inevitably<br>
+saying that it doesn&#39;t know option &quot;--eh-frame-hdr--hash-style=3D=
sysv&quot;.<br>
+<br>
+2018-09-17=C2=A0 Alexey Brodkin=C2=A0 &lt;<a href=3D"mailto:abrodkin@synop=
sys.com" target=3D"_blank">abrodkin@synopsys.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* config/arc/linux.h (LINK_EH_SPEC): Add missin=
g space.<br>
+<br>
+git-svn-id: svn+ssh://<a href=3D"http://gcc.gnu.org/svn/gcc/trunk@264361" =
rel=3D"noreferrer" target=3D"_blank">gcc.gnu.org/svn/gcc/trunk@264361</a> 1=
38bc75d-0d04-0410-961f-82ee72b054a4<br>
+---<br>
+ gcc/config/arc/linux.h | 2 +-<br>
+ 1 files changed, 1 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h<br>
+index 96d548eae341..62ebe4de0fc7 100644<br>
+--- a/gcc/config/arc/linux.h<br>
++++ b/gcc/config/arc/linux.h<br>
+@@ -98,7 +98,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
+=C2=A0 =C2=A0 Signalize that because we have fde-glibc, we don&#39;t need =
all C shared libs<br>
+=C2=A0 =C2=A0 linked against -lgcc_s.=C2=A0 */<br>
+ #undef LINK_EH_SPEC<br>
+-#define LINK_EH_SPEC &quot;--eh-frame-hdr&quot;<br>
++#define LINK_EH_SPEC &quot;--eh-frame-hdr &quot;<br>
+ #endif<br>
+ <br>
+ #undef SUBTARGET_CPP_SPEC<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div></div>

--000000000000f7550a05762d8c68--
