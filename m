Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id CA32F70057;
	Sun, 18 Mar 2018 14:06:28 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id o8so16051565wra.1;
	Sun, 18 Mar 2018 07:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=42zXvFYiLa05avJ1MDM6auSgunTzoUAO6EpBWDTgMTU=;
	b=ent8O1r+U5kl8WrKXi+zttCcZCzxKi3ftOPn4Kjri0weOLsqxZfsGYEyTO60v+LHiW
	OULST6Van7mtY1E/HwO4a5Kurfxs4dYd1/Xk8FqFR5RffN9OxP1NCUlemVpqlshEJEBX
	0VmtP2A0WsBbO2cOyAPn7RhXQ0mQvuWkTUP+Pi2VLHfCoC8sku6OsYf4wPmTveIKZIeU
	+xdWsL3PXy19qgko3L2RLXtw5fs4A5x+LxvFgj00TC3cZtf/a6sbjHPe2bAEVEb/Xqwc
	RXFq3TY//M8iZ4htmtznMKVmQwU86s6rvmsrNUWZMAwm+jW6R9Zqt2IElMzTzYaxsp/j
	x3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=42zXvFYiLa05avJ1MDM6auSgunTzoUAO6EpBWDTgMTU=;
	b=srW6SlNFgrDgGcZlCNyuXMvqOiBPYuANqpT4JG7S650YZNkMahOpkdCJc+0WYbkQhE
	7v9a8+TG0G+Rrg+f41DxUr5FqHKCH4JGwpXurmekpsJTlWilFH7YHQQdLtYQ5my+9ZEC
	Sbu5dGS8ijpXbTOhpV6/YDbre/sJKyGbSY16+U7JJA82neP3+UEWegJ3xmd11tH5rH7d
	JSpUx3Prr4qry+SNFGsVHI+chAx/Vx2711y/tNU1wMtJG8rIQnUi7uBrFpY3WkpLGf3F
	bLJNB5pGHtkYUaMk+P8RDhXTUI3wXIeaffH6yzW7c/yKtlNcJdXvp3RN6uEiPAWptwfA
	uo5Q==
X-Gm-Message-State: AElRT7EWpl6bvFvyGOlw1vgycjpj5c+Vv92wQHO5ZaSiucW1Eobbw5Mj
	FTtf5cvEbYQRk4VQedppxDxk4LNg4aSpR9Yt8Z0=
X-Google-Smtp-Source: AG47ELuPf34YODX+rHDvoJKRqhV7jGSKAgO2qYlV+Mpsl3pNp6NWWWndKszpzXFALqdJYUhWw4Ceb3QGAaMxwvqFkFg=
X-Received: by 10.223.134.2 with SMTP id 2mr5142857wrv.230.1521381989534; Sun,
	18 Mar 2018 07:06:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Sun, 18 Mar 2018 07:06:28 -0700 (PDT)
In-Reply-To: <20180312220642.1D65C232B12@git.openembedded.org>
References: <152089240195.19773.3751229902290225520@git.openembedded.org>
	<20180312220642.1D65C232B12@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 18 Mar 2018 15:06:28 +0100
Message-ID: <CA+chaQdN_qjQx_YSuD6RX5p=8OPNfv7OGdzrTqLfWMjnjfOxxQ@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/03: reproducible_build_simple.bbclass: simple environment for reproducible binaries
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
X-List-Received-Date: Sun, 18 Mar 2018 14:06:29 -0000
Content-Type: multipart/alternative; boundary="001a114984740dd18c0567b05965"

--001a114984740dd18c0567b05965
Content-Type: text/plain; charset="UTF-8"

Hi,

There seems to be small issue when people set BUILD_REPRODUCIBLE_BINARIES =
"1" without exporting SOURCE_DATE_EPOCH like this .bbclass does

In kernel.bbclass change from:
http://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?id=012a70da7ae0617740cd0cf807d01c3cd912c823

you're comparing SOURCE_DATE_EPOCH with 0 which doesn't seem to be set
anywhere, so by default it's empty which leads to kernel build failure like
this:

DEBUG: Executing shell function do_compile
date: invalid date '@'
WARNING: exit code 1 from a shell command.

because empty SOURCE_DATE_EPOCH is used in "ts=`LC_ALL=C date -d
@$SOURCE_DATE_EPOCH`". Testing SOURCE_DATE_EPOCH for empty or "0" allows to
use REPRODUCIBLE_TIMESTAMP_ROOTFS as a default value again.

These build failures seem to be triggered in all my builds since
kernel.bbclass was fixed to respect BUILD_REPRODUCIBLE_BINARIES in:
http://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?id=27f87bbc8395a2481ef808465a62d213a6b678ac

One way to fit it would be to inherit reproducible_build_simple.bbclass,
but this requirement to set exported SOURCE_DATE_EPOCH doesn't seem to be
documented anywhere and looking at kernel.bbclass changes it probably
wasn't even intended like that.

Thanks

On Mon, Mar 12, 2018 at 11:06 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit 5c2685c5ee2f8210a36b9a8591491b6af0482084
> Author: Juro Bystricky <juro.bystricky@intel.com>
> AuthorDate: Sat Mar 10 10:57:49 2018 -0800
>
>     reproducible_build_simple.bbclass: simple environment for
> reproducible binaries
>
>     Export environmental variables needed for binary reproducibility with
> consistent values.
>
>     This class can be used either directly via:
>     INHERIT += "reproducible_build_simple"
>
>     or can be inherited by a more complex/complete bbclass, for example a
> bblass which
>     will crack SOURCE_DATE_EPOCH for each recipe.
>
>     Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/reproducible_build_simple.bbclass | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/meta/classes/reproducible_build_simple.bbclass
> b/meta/classes/reproducible_build_simple.bbclass
> new file mode 100644
> index 0000000..dd11cd9
> --- /dev/null
> +++ b/meta/classes/reproducible_build_simple.bbclass
> @@ -0,0 +1,11 @@
> +# Setup default environment for reproducible builds.
> +
> +BUILD_REPRODUCIBLE_BINARIES = "1"
> +
> +export PYTHONHASHSEED = "0"
> +export PERL_HASH_SEED = "0"
> +export TZ = 'UTC'
> +export SOURCE_DATE_EPOCH ??= "1520598896"
> +
> +REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
> +
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

--001a114984740dd18c0567b05965
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div>There seems to be small issue=
 when people set=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline">BUILD_REPRODUCIBLE_BINARIE=
S =3D &quot;1&quot; without exporting=C2=A0<span style=3D"color:rgb(34,34,3=
4);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">SOURC=
E_DATE_EPOCH like this .bbclass does</span></span><div><span style=3D"font-=
size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">In kern=
el.bbclass change from:<br></span><span style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-align:start;text-indent:0px;text-transform:none;white-space:normal;wo=
rd-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline"></span><div><a=
 href=3D"http://git.openembedded.org/openembedded-core/commit/meta/classes/=
kernel.bbclass?id=3D012a70da7ae0617740cd0cf807d01c3cd912c823">http://git.op=
enembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?id=3D01=
2a70da7ae0617740cd0cf807d01c3cd912c823</a><br></div></div><div><br></div><d=
iv>you&#39;re comparing=C2=A0<span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">SOURCE_DATE_EPOCH w=
ith 0 which doesn&#39;t seem to be set anywhere, so by default it&#39;s emp=
ty which leads to kernel build failure like this:</span></div><div><span st=
yle=3D"text-align:start;text-indent:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline"><div><span style=3D"font-size:12.8px"><br></span></div><div><spa=
n style=3D"font-size:12.8px">DEBUG: Executing shell function do_compile</sp=
an></div><div><span style=3D"font-size:12.8px">date: invalid date &#39;@&#3=
9;</span></div><div><span style=3D"font-size:12.8px">WARNING: exit code 1 f=
rom a shell command.</span></div><div style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-transform:none;white-space:normal;word-spacing:0px"><br></div><div styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-transform:none;white-space:normal;word=
-spacing:0px">because empty SOURCE_DATE_EPOCH is used in &quot;ts=3D`LC_ALL=
=3DC date -d @$SOURCE_DATE_EPOCH`&quot;. Testing SOURCE_DATE_EPOCH for empt=
y or &quot;0&quot; allows to use=C2=A0REPRODUCIBLE_TIMESTAMP_ROOTFS as a de=
fault value again.</div><div style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-trans=
form:none;white-space:normal;word-spacing:0px"><br></div><div style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:no=
rmal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400=
;letter-spacing:normal;text-transform:none;white-space:normal;word-spacing:=
0px">These build failures seem to be triggered in all my builds since kerne=
l.bbclass was fixed to respect BUILD_REPRODUCIBLE_BINARIES in:</div><div><s=
pan style=3D"font-size:12.8px"><a href=3D"http://git.openembedded.org/opene=
mbedded-core/commit/meta/classes/kernel.bbclass?id=3D27f87bbc8395a2481ef808=
465a62d213a6b678ac">http://git.openembedded.org/openembedded-core/commit/me=
ta/classes/kernel.bbclass?id=3D27f87bbc8395a2481ef808465a62d213a6b678ac</a>=
</span><br></div><div><span style=3D"font-size:12.8px"><br></span></div><di=
v><span style=3D"font-size:12.8px">One way to fit it would be to inherit=C2=
=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;background-color=
:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initi=
al;float:none;display:inline">reproducible_</span><wbr style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">build_simple.bbclass, but this requirement to set exported SOURCE_DATE_EP=
OCH doesn&#39;t seem to be documented anywhere and looking at kernel.bbclas=
s changes it probably wasn&#39;t even intended like that.</span></span></di=
v><div><span style=3D"font-size:12.8px"><span style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-align:start;text-indent:0px;text-transform:none;white-space:nor=
mal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-styl=
e:initial;text-decoration-color:initial;float:none;display:inline"><br></sp=
an></span></div><div><span style=3D"font-size:12.8px"><span style=3D"color:=
rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">Thanks</span></span></div></span></div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Mon, Mar 12, 2018 at 11:06 PM,  <span =
dir=3D"ltr">&lt;<a href=3D"mailto:git@git.openembedded.org" target=3D"_blan=
k">git@git.openembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">This is an automated email from the git hooks/post-receive script.=
<br>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 5c2685c5ee2f8210a36b9a8591491b<wbr>6af0482084<br>
Author: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com">juro=
.bystricky@intel.com</a>&gt;<br>
AuthorDate: Sat Mar 10 10:57:49 2018 -0800<br>
<br>
=C2=A0 =C2=A0 reproducible_build_simple.<wbr>bbclass: simple environment fo=
r reproducible binaries<br>
<br>
=C2=A0 =C2=A0 Export environmental variables needed for binary reproducibil=
ity with consistent values.<br>
<br>
=C2=A0 =C2=A0 This class can be used either directly via:<br>
=C2=A0 =C2=A0 INHERIT +=3D &quot;reproducible_build_simple&quot;<br>
<br>
=C2=A0 =C2=A0 or can be inherited by a more complex/complete bbclass, for e=
xample a bblass which<br>
=C2=A0 =C2=A0 will crack SOURCE_DATE_EPOCH for each recipe.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.byst=
ricky@intel.com">juro.bystricky@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/reproducible_<wbr>build_simple.bbclass | 11 +++++++++++<=
br>
=C2=A01 file changed, 11 insertions(+)<br>
<br>
diff --git a/meta/classes/reproducible_<wbr>build_simple.bbclass b/meta/cla=
sses/reproducible_<wbr>build_simple.bbclass<br>
new file mode 100644<br>
index 0000000..dd11cd9<br>
--- /dev/null<br>
+++ b/meta/classes/reproducible_<wbr>build_simple.bbclass<br>
@@ -0,0 +1,11 @@<br>
+# Setup default environment for reproducible builds.<br>
+<br>
+BUILD_REPRODUCIBLE_BINARIES =3D &quot;1&quot;<br>
+<br>
+export PYTHONHASHSEED =3D &quot;0&quot;<br>
+export PERL_HASH_SEED =3D &quot;0&quot;<br>
+export TZ =3D &#39;UTC&#39;<br>
+export SOURCE_DATE_EPOCH ??=3D &quot;1520598896&quot;<br>
+<br>
+REPRODUCIBLE_TIMESTAMP_ROOTFS ??=3D &quot;1520598896&quot;<br>
+<br>
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

--001a114984740dd18c0567b05965--
