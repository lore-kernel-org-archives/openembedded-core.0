Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.11201.1605632724801685838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 09:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DOxW8iIO;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id e139so11646219lfd.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 09:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PDspUalJ7OPuVaFj//zrGAvbXU84l/p5VOFuRxBOkAk=;
        b=DOxW8iIOJVJ6+xTLqfPW0KwbdcCr8YzJobbtVhpJcS2BaRcMDdpJMVvZ4jO754IGlm
         BstTFHCOqjT36zTONpO7uIbDFSu9ikAKQyLrUMmllaDVvQyhsMHLDRVT0C2J8axg9efB
         QF8BXB90tWGAhmpQhFcGBX9Xa5ZJrc7MjggHhLtqeLQVbC1gLPfH3PJX8a+iwBEP37na
         Lw92E0YMx1k3waFMtHU999fuuF+IzSGI2NViF3NoXf4xs6oN4Cem9wBU2yErXgjCeFBz
         3bg1HVzAAmzbjH+ZoFPooI6ywsnLls73lhnuk9JzZV8pNMOJLQp9aluiLJK5QnqamxkN
         faDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PDspUalJ7OPuVaFj//zrGAvbXU84l/p5VOFuRxBOkAk=;
        b=Tzxs3QXQfvrQKqg277QpVjbz32BuRnjvcJbzmraT2Q+Y3MSdQbh5prgXxKouI1hbsF
         8ZHmP7oTVwL0p3v492+DPlzydMcnxi4Ru+OLdCViFhlJXpTM9eycxckBbGpH8JP+qXZj
         L7cyhxKCjDVAjjLBphPNpX9dVIMPhMaj48fwYLNgiWw10dCAAOLPKMwS0jJTbduJIBWJ
         UaYsJpLGw+sfrDKlzMiFl9mGfBk+KW/7w5Dak8NjR/Ez8DZZ92hWuR16zsXMSOMzCsis
         GqwcVh6oDvz2nXVdfGVE71tCfNMYXH+cw5AZr2CKHnGEm2uekit40A0SVfPk9cnBBCVP
         +1OQ==
X-Gm-Message-State: AOAM533apspR5uyKbCiuuIA1/OMYdjzlXOM6Dl+DDXZ+R8gIcvHjMmU8
	XFIo/IUbCQuKzVT1TM+/afLigVDgYeOoTbR8Q3U=
X-Google-Smtp-Source: ABdhPJw/IDIn7gLnwl2UPZd+mNvwoM4XQL+5IoVmV0Xcmw2PkyPjcn9vRRXMU9KpT/Kcrpd3pBMocXqYSGKlEpYOzUE=
X-Received: by 2002:a19:4c56:: with SMTP id z83mr2013852lfa.456.1605632722710;
 Tue, 17 Nov 2020 09:05:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605626675.git.anuj.mittal@intel.com> <b10b5527ec2455f597e56327d3d320c2711e39ef.1605626675.git.anuj.mittal@intel.com>
In-Reply-To: <b10b5527ec2455f597e56327d3d320c2711e39ef.1605626675.git.anuj.mittal@intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 17 Nov 2020 12:05:08 -0500
Message-ID: <CADkTA4Onr5AdyLwdVmde=z7RAzyEFEVdB+Dwj03U_ab_f+p3zQ@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH 17/19] kernel: provide module.lds for out of tree builds in v5.10+
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000013b8fd05b4508006"

--00000000000013b8fd05b4508006
Content-Type: text/plain; charset="UTF-8"

The wrong version of this patch merged to oe-core, so you don't want this
one as-is.

You also need the follow up that I posted today, and that hopefully will be
in oe-core soon.

Bruce

On Tue, Nov 17, 2020 at 10:36 AM Anuj Mittal <anuj.mittal@intel.com> wrote:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> The upstream commit 596b0474d3d [kbuild: preprocess module linker
> script], adds a dependency on module.lds for external module
> building.
>
> Since module.lds is generated as part of 'modules_prepare', we
> must make it available with the other kernel artifacts in the
> kernel shared workdir, otherwise out of tree builds fail.
>
> This fixes errors like:
>
>     | make[4]: *** No rule to make target 'scripts/module.lds', needed by
>
> 'build/tmp/work/qemuarm64-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.
>         Stop.
>     | make[4]: *** Waiting for unfinished jobs....
>
> We also ensure that kernel-devsrc has a copy to support on
> target module builds that are often prepared with 'make scripts
> prepare'. Those targets won't regenerate it, so the build fails.
> If 'make modules_prepare' is used, the file will be regenerated
> and overwrite our copy (as expected).
>
> Signed-off-by: Pan, Kris <kris.pan@intel.com>
> Signed-off-by: Lili Li <lili.li@intel.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 0fc66a0b64953aae38d0124b57615fffaec8de52)
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/classes/kernel.bbclass                | 1 +
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 78def5bbc1..22c92381c0 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -486,6 +486,7 @@ do_shared_workdir () {
>         # Copy files required for module builds
>         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>         [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> +       [ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds
> $kerneldir/scripts/module.lds
>         cp .config $kerneldir/
>         mkdir -p $kerneldir/include/config
>         cp include/config/kernel.release
> $kerneldir/include/config/kernel.release
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index aa8e162f4f..8373c97a31 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -86,6 +86,12 @@ do_install() {
>         # be dealt with.
>         # cp -a scripts $kerneldir/build
>
> +       # although module.lds can be regenerated on target via 'make
> modules_prepare'
> +       # there are several places where 'makes scripts prepare' is done,
> and that won't
> +       # regenerate the file. So we copy it onto the target as a
> migration to using
> +       # modules_prepare
> +       cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null
> || :
> +
>          if [ -d arch/${ARCH}/scripts ]; then
>             cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
>         fi
> --
> 2.28.0
>
>
> 
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000013b8fd05b4508006
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">The=
 wrong version of this patch merged to oe-core, so you don&#39;t want this =
one as-is.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">You also need =
the follow up that I posted today, and that hopefully will be in oe-core so=
on.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, No=
v 17, 2020 at 10:36 AM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.=
com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.=
ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
<br>
The upstream commit 596b0474d3d [kbuild: preprocess module linker<br>
script], adds a dependency on module.lds for external module<br>
building.<br>
<br>
Since module.lds is generated as part of &#39;modules_prepare&#39;, we<br>
must make it available with the other kernel artifacts in the<br>
kernel shared workdir, otherwise out of tree builds fail.<br>
<br>
This fixes errors like:<br>
<br>
=C2=A0 =C2=A0 | make[4]: *** No rule to make target &#39;scripts/module.ld=
s&#39;, needed by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;build/tmp/work/qemuarm64-poky-linux/crypt=
odev-module/1.11-r0/git/cryptodev.ko&#39;.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Stop.<br>
=C2=A0 =C2=A0 | make[4]: *** Waiting for unfinished jobs....<br>
<br>
We also ensure that kernel-devsrc has a copy to support on<br>
target module builds that are often prepared with &#39;make scripts<br>
prepare&#39;. Those targets won&#39;t regenerate it, so the build fails.<b=
r>
If &#39;make modules_prepare&#39; is used, the file will be regenerated<br=
>
and overwrite our copy (as expected).<br>
<br>
Signed-off-by: Pan, Kris &lt;<a href=3D"mailto:kris.pan@intel.com" target=
=3D"_blank">kris.pan@intel.com</a>&gt;<br>
Signed-off-by: Lili Li &lt;<a href=3D"mailto:lili.li@intel.com" target=3D"=
_blank">lili.li@intel.com</a>&gt;<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
(cherry picked from commit 0fc66a0b64953aae38d0124b57615fffaec8de52)<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D=
"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 6 ++++++<br>
=C2=A02 files changed, 7 insertions(+)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 78def5bbc1..22c92381c0 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -486,6 +486,7 @@ do_shared_workdir () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy files required for module builds<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp System.map $kerneldir/System.map-${KERNEL_V=
ERSION}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -e Module.symvers ] &amp;&amp; cp Module.sym=
vers $kerneldir/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e scripts/module.lds ] &amp;&amp; install -=
Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp .config $kerneldir/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $kerneldir/include/config<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp include/config/kernel.release $kerneldir/in=
clude/config/kernel.release<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb"=
 rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-k=
ernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=
=3D"_blank">kernel-devsrc.bb</a><br>
index aa8e162f4f..8373c97a31 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D=
"noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D=
"noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -86,6 +86,12 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # be dealt with.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cp -a scripts $kerneldir/build<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# although module.lds can be regenerated on ta=
rget via &#39;make modules_prepare&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# there are several places where &#39;makes sc=
ripts prepare&#39; is done, and that won&#39;t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# regenerate the file. So we copy it onto the =
target as a migration to using<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# modules_prepare<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents scripts/module.lds $kerneldir/=
build/ 2&gt;/dev/null || :<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d arch/${ARCH}/scripts ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a arch/${ARCH}/scripts $kern=
eldir/build/arch/${ARCH}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div>

--00000000000013b8fd05b4508006--
