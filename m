Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 19D3E719C3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:20:57 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id 11so7289784qkl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 09:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dMDgFiY5nSXkVLd5aGZCq7mEWk8nsq00oDVo7RI0zc4=;
	b=jPXexEOpLerLIEHdb5EahCz2o5hJzj7BlUC0FMwlTTuDPk6kZ1/7zQBR+zTX7HjZQ9
	N9IzitomFLa19GDbyUagyE6yAi9WlNbM5bimuycAqtcEc5axOwS/ohtvmSufKHYe9zdZ
	hpdEQ5W+S0cWWk1wOqZhh90oxXOteR/XlWGaMkvNv6VKB0B+WVC0wkG4ryiJO8LpyUjf
	JvL0DGSisxFIbQUfxlk7IlPaxj6++r8H3x4BDsXVhTc60Hko6lXyLL8hGUhLTuwjPVbZ
	29hTWSCpFIS55i6lRRYNQboRLqR3ER4wwjfkIQw0cLZ44rOIQOQrfN8A7CXXzbnwqipS
	NOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dMDgFiY5nSXkVLd5aGZCq7mEWk8nsq00oDVo7RI0zc4=;
	b=KgQNE8xt8wMoyBqOGNlSBZHKlkJ+rEcDWeGjNw2Uc1zg9olIw+T6cqk33R22s6Qpg7
	RcbomvL7YzOgkLeYO4GBIXWe5EeToa5PkNrqgwXYaiXvRMedf1VIw3dRdXT/R+nv8aTM
	10TJliv89L+h8CxTq0ktJ/nGVrDhuEn//TxLtLwkz0eypU8pz363yvLwmXT8s7xhSxcz
	xTe1aX88wMbyAKQe8v3NDLzWL0lLR38fZQ5BIW68GMTaaZigJn3SKzH76eg25Zs6PW+7
	CPGS3/jB3ui2kS4hRl3XrC2ntmlPqdkuu0X10w4dbqHvkMxFdAzDWumqSAdDO/E3920Z
	EImQ==
X-Gm-Message-State: AIkVDXI2L0GMq4q9A97kiMBkk3Z7yLhzTuoxCmAFjpRaF89JNT7z/Pmqbt32DpXE0gRCZEsyHLHwOv4o4pjV8A==
X-Received: by 10.55.114.2 with SMTP id n2mr65258981qkc.318.1483982457900;
	Mon, 09 Jan 2017 09:20:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Mon, 9 Jan 2017 09:20:57 -0800 (PST)
In-Reply-To: <1483955680-18110-1-git-send-email-ola.redell@retotech.se>
References: <1483955680-18110-1-git-send-email-ola.redell@retotech.se>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Jan 2017 12:20:57 -0500
Message-ID: <CADkTA4PFOUmv3W8stkhDmewwDfBE+efZEVym903937jz6eAo7g@mail.gmail.com>
To: ola.redell@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel-module-split: Append KERNEL_VERSION string to kernel module name
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
X-List-Received-Date: Mon, 09 Jan 2017 17:20:58 -0000
Content-Type: multipart/alternative; boundary=94eb2c05be6841995e0545ac9774

--94eb2c05be6841995e0545ac9774
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 9, 2017 at 4:54 AM, <ola.redell@gmail.com> wrote:

> From: Ola Redell <ola.redell@retotech.se>
>
> The KERNEL_VERSION string is added to kernel module package names in order
> to
> make the kernel modules for different kernel versions distinct packages
> instead
> of different versions of the same package. With this change, when a new
> kernel
> is installed together with its kernel modules (e.g. by upgrade of the
> packages
> kernel and kernel-modules) using some package manager such as apt-get or
> rpm,
> the kernel modules for the older kernel will not be removed. This enables a
> fall back to the older kernel if the new one fails.
>


The functionality you describe is a good thing, but I have a few questions
to make
sure I understand the change, and confirm that existing functionality isn't
broken ..
and that the internals of the package management do the right thing (I'm
not an
expert on those internals .. so bear with me).

With this change, do you know if RDEPENDS="kernel-module-foo" still works ?
or
does it now have to be RDEPENDS="kernel-module-foo-<version>" ?

On a similar thought, "smart install kernel-module-foo" would also work ?
or does it
now require a version ?

Bruce


>
> Signed-off-by: Ola Redell <ola.redell@retotech.se>
> ---
>  meta/classes/kernel-module-split.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass
> b/meta/classes/kernel-module-split.bbclass
> index efe1b42..13cff51 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -122,7 +122,7 @@ python split_kernel_module_packages () {
>      module_regex = '^(.*)\.k?o$'
>
>      module_pattern_prefix = d.getVar('KERNEL_MODULE_PACKAGE_PREFIX')
> -    module_pattern = module_pattern_prefix + 'kernel-module-%s'
> +    module_pattern = module_pattern_prefix + 'kernel-module-%s-' +
> d.getVar("KERNEL_VERSION", True)
>
>      postinst = d.getVar('pkg_postinst_modules')
>      postrm = d.getVar('pkg_postrm_modules')
> --
> 1.9.1
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

--94eb2c05be6841995e0545ac9774
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jan 9, 2017 at 4:54 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:ola.redell@gmail.com" target=3D"_blank">ola.redell@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">From: Ola Redell &lt;<a href=3D=
"mailto:ola.redell@retotech.se">ola.redell@retotech.se</a>&gt;<br>
<br>
The KERNEL_VERSION string is added to kernel module package names in order =
to<br>
make the kernel modules for different kernel versions distinct packages ins=
tead<br>
of different versions of the same package. With this change, when a new ker=
nel<br>
is installed together with its kernel modules (e.g. by upgrade of the packa=
ges<br>
kernel and kernel-modules) using some package manager such as apt-get or rp=
m,<br>
the kernel modules for the older kernel will not be removed. This enables a=
<br>
fall back to the older kernel if the new one fails.<br></blockquote><div><b=
r><br></div><div>The functionality you describe is a good thing, but I have=
 a few questions to make<br></div><div>sure I understand the change, and co=
nfirm that existing functionality isn&#39;t broken .. <br></div><div>and th=
at the internals of the package management do the right thing (I&#39;m not =
an<br></div><div>expert on those internals .. so bear with me).<br><br></di=
v><div>With this change, do you know if RDEPENDS=3D&quot;kernel-module-foo&=
quot; still works ? or<br></div><div>does it now have to be RDEPENDS=3D&quo=
t;kernel-module-foo-&lt;version&gt;&quot; ?<br><br></div><div>On a similar =
thought, &quot;smart install kernel-module-foo&quot; would also work ? or d=
oes it<br></div><div>now require a version ?<br><br></div><div>Bruce<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Ola Redell &lt;<a href=3D"mailto:ola.redell@retotech.se">ola=
.redell@retotech.se</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-module-<wbr>split.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/kernel-module-<wbr>split.bbclass b/meta/classes/k=
ernel-module-<wbr>split.bbclass<br>
index efe1b42..13cff51 100644<br>
--- a/meta/classes/kernel-module-<wbr>split.bbclass<br>
+++ b/meta/classes/kernel-module-<wbr>split.bbclass<br>
@@ -122,7 +122,7 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0module_regex =3D &#39;^(.*)\.k?o$&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0module_pattern_prefix =3D d.getVar(&#39;KERNEL_MODULE_<=
wbr>PACKAGE_PREFIX&#39;)<br>
-=C2=A0 =C2=A0 module_pattern =3D module_pattern_prefix + &#39;kernel-modul=
e-%s&#39;<br>
+=C2=A0 =C2=A0 module_pattern =3D module_pattern_prefix + &#39;kernel-modul=
e-%s-&#39; + d.getVar(&quot;KERNEL_VERSION&quot;, True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0postinst =3D d.getVar(&#39;pkg_postinst_<wbr>modules&#3=
9;)<br>
=C2=A0 =C2=A0 =C2=A0postrm =3D d.getVar(&#39;pkg_postrm_modules&#39;)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--94eb2c05be6841995e0545ac9774--
