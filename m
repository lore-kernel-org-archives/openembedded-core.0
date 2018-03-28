Return-Path: <srifenbark@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id ED8A9784E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 17:53:43 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id e8-v6so2891046oii.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5xyHTnBUIuWTabluyAhk79Ch/GTxm0icEeuFudaMWlE=;
	b=Z4H80eXxnEI30beiNJ5WUVyVgWylJzEIG4Wbtu1LYiV5bxhzbYgW8MuXWh7NHJtkwQ
	JdL57Z92Jo4D4UyD0BtzuZ5Zrpy1dcDPWRAq8049Ad39bcR7B7mt6qv+DdQkYB18D9Ak
	P1aXnr37nPmlnvlNHhCgY3AEe+MVwp6fORI8VjY9V7BVq4buLADFz41QZVEmRa+ClDx5
	Z8P4D/Mz4mIq8il8IMFqMgqAbYuC8K8iJxyASooxkeg6p9CCh2cbHZxGDH0AIo2yGHAC
	WT4+WzvuIGirJ62mQ9MzqOFO1gcHb5Db/jeHbYzI7FL8Swf9pX8MM0S/1VFTmyVJXKDe
	y7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5xyHTnBUIuWTabluyAhk79Ch/GTxm0icEeuFudaMWlE=;
	b=mSJyU1ZIUC0qL5jDlTCD0XOyPt73crD5giqlmhj/qzwfZhlcf2rkuCgrPbHjVdFGTO
	UF4AwTAzPeOse+vK2LxezNpQfJuqmnKlJYdVShmrrpGQt/kLFbFui1H4oHfLNLZ71Nrk
	HOqrucVPIX4uyIWjcmkT9wU0EXQ0zv/+YMNaW4bw3+ekg+eq1/mDQjsqQcjWcuIsqCJp
	KY7PHpbziWm9GaIojV7EizIcdqfo33rYFIhh8ugwidLWn5e9vcz+cUFxJ9gx4kZjDbik
	yBsnDhwgA1xpbhQNDWBhGRWSkX6DDiphaRnPSFbgPHuCmsq1ZS5gJSa6G+XeMzD1vgrL
	M18A==
X-Gm-Message-State: ALQs6tDIj7MipOXPWb7Fvlf5QdugIqgtGcH2zU0OlLxbABm8Tkxn4sLi
	v79jIuhSF6v2+ezS852RX9oqacu3J0tGCLP6ziA=
X-Google-Smtp-Source: AIpwx48h2xIKmFiKr4zl/XGs31T/9kBu8ePqVhQdigoSjFG1n1IsYw/Sinm911NxwHRjKuhvlHw1ZpHb6Wgk4uOhe3U=
X-Received: by 10.202.40.4 with SMTP id 4mr2700647oix.74.1522259624829; Wed,
	28 Mar 2018 10:53:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:256a:0:0:0:0:0 with HTTP; Wed, 28 Mar 2018 10:53:44
	-0700 (PDT)
In-Reply-To: <20180321203301.18296-1-JPEWhacker@gmail.com>
References: <20180321203301.18296-1-JPEWhacker@gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 28 Mar 2018 10:53:44 -0700
Message-ID: <CAFNP8Os5b_hLYi__R9h7YLqRDt0wEUcW=Ni5AzWocnQwV_yiuw@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ref-manual: Update SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Wed, 28 Mar 2018 17:53:44 -0000
Content-Type: multipart/alternative; boundary="f4f5e808db6431a59305687cb07d"

--f4f5e808db6431a59305687cb07d
Content-Type: text/plain; charset="UTF-8"

Joshua,

Thanks for the addition.  I have implemented the change.  You can see the
change at
https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.
I will back-fill into the 'rocko' development branch of the manuals.

Scott

On Wed, Mar 21, 2018 at 1:33 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> Describes the new wildcard syntax
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  documentation/ref-manual/ref-variables.xml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/documentation/ref-manual/ref-variables.xml
> b/documentation/ref-manual/ref-variables.xml
> index 09eb9b9dfc7..58a58b0605e 100644
> --- a/documentation/ref-manual/ref-variables.xml
> +++ b/documentation/ref-manual/ref-variables.xml
> @@ -12648,6 +12648,23 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR
> = "${INC_PR}.3"
>                      <filename>mplayer2</filename>.
>                  </para>
>
> +                <para>
> +                    The special token <filename>"*"</filename> may be
> used on
> +                    the left hand side of the dependency, which will
> match all
> +                    recipes except the one on the right hand side.
> +                    For example:
> +                    <literallayout class='monospaced'>
> +    SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "*->quilt-native"
> +                    </literallayout>
> +                </para>
> +
> +                <para>
> +                    In this example, all recipes except
> +                    <filename>quilt-native</filename> will ignore task
> +                    signatures from the <filename>quilt-native</filename>
> recipe
> +                    when determining their task signatures.
> +                </para>
> +
>                  <para>
>                      Use of this variable is one mechanism to remove
> dependencies
>                      that affect task signatures and thus force rebuilds
> when a
> --
> 2.14.3
>
>

--f4f5e808db6431a59305687cb07d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Joshua, <br><br></div>Thanks for the addition.=
=C2=A0 I have implemented the change.=C2=A0 You can see the change at <a hr=
ef=3D"https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-=
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS">https://www.yoctoproject.org/docs/2.5/ref-=
manual/ref-manual.html#var-SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS</a>.=C2=A0 I wil=
l back-fill into the &#39;rocko&#39; development branch of the manuals.<br>=
<br></div>Scott<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Wed, Mar 21, 2018 at 1:33 PM, Joshua Watt <span dir=3D"ltr">&lt;=
<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Describes the n=
ew wildcard syntax<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEW=
hacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/ref-<wbr>variables.xml | 17 ++++++++++++++++=
+<br>
=C2=A01 file changed, 17 insertions(+)<br>
<br>
diff --git a/documentation/ref-manual/<wbr>ref-variables.xml b/documentatio=
n/ref-manual/<wbr>ref-variables.xml<br>
index 09eb9b9dfc7..58a58b0605e 100644<br>
--- a/documentation/ref-manual/<wbr>ref-variables.xml<br>
+++ b/documentation/ref-manual/<wbr>ref-variables.xml<br>
@@ -12648,6 +12648,23 @@ recipes-graphics/xorg-font/<wbr>font-alias_1.0.3.b=
b:PR =3D &quot;${INC_PR}.3&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&lt;filename&gt;mplayer2&lt;/filename&gt;.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;=
<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;para&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The =
special token &lt;filename&gt;&quot;*&quot;&lt;/filename&gt; may be used on=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the =
left hand side of the dependency, which will match all<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reci=
pes except the one on the right hand side.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 For =
example:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=
literallayout class=3D&#39;monospaced&#39;&gt;<br>
+=C2=A0 =C2=A0 SIGGEN_EXCLUDE_SAFE_RECIPE_<wbr>DEPS +=3D &quot;*-&gt;quilt-=
native&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=
/literallayout&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;para&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 In t=
his example, all recipes except<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=
filename&gt;quilt-native&lt;/<wbr>filename&gt; will ignore task<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sign=
atures from the &lt;filename&gt;quilt-native&lt;/<wbr>filename&gt; recipe<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when=
 determining their task signatures.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/para&gt;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Use of this variable is one mechanism to remove dependencies<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0that affect task signatures and thus force rebuilds when a<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.3<br>
<br>
</font></span></blockquote></div><br></div>

--f4f5e808db6431a59305687cb07d--
