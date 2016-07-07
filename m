Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2A5A06013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 13:14:18 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id a5so400087vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=El950bSj+cbVyponaw+29Lkq3a0jwJZZBhcVK87gZt4=;
	b=luwONL/W7DjCnmmqtkW8h/c0ez3lVkBzJnT94YI2z/rQTF486xM/kVsiF1e8yCKyw3
	+lT2r1fzWdnKzh6VbTjG07hKyLXEqTGbTXWWU5ij7v/eg36HxowLSC/TyFDYy8giB0Hx
	wfyBitKU9WtUZjnuV+EIJATeHPWMh+FjwLII9lzKDLAFYAl0m4Ysa0FSMRY7Rv9gck+0
	cyDZdZFfF8LZatFlFuIK7fFb9N9G8+0N+AJ7zo1rJZNdeou4xwuinWMhWkR2lvdcMwrD
	Wl1PLFhbZXaJaVm3mGBjvhEGgwjRh1aY7JCYKByW7TZW80f8iQxGlK4P1Ox9YOagBZ01
	o7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=El950bSj+cbVyponaw+29Lkq3a0jwJZZBhcVK87gZt4=;
	b=ah9Eufe1KecezMJW09rIX8lLtOlIaLkPeOt+r4aF/cf7zZRTiEYT7rfNy+uCnDYbYt
	WJmf6ErykadCdUNl9mqcmHENsGLeYiuklCsPXOnau0rslpo+xMPkOij4+srtJop+zTdy
	20Ea9qTG5nS6PHnF7IYKZDlCMXZ/Ij0kY8zcDDYIz9AHjR+Z5lZpGAGfKQMNBSpqJt6v
	n+oTAqzu+cjmE4ulzxPlHmYYVJMYhOkyoy8mpSgyybeeCXL8ohzQ7hL2nHn12hevF1nC
	KwvJpLye1DxLLOu6QWp/bxW2dCfsEXNVnLAIxoTYTxxqqPHbfuguLB6EztbjlnLqz19d
	g8FA==
X-Gm-Message-State: ALyK8tL/CucHXaxMe3f1QL/5IithhJsQBSAudZBFc3+50KKVzpnjVVxiyUv8GQiSFWb3tseVhV2n4VLok/X0xA==
MIME-Version: 1.0
X-Received: by 10.31.12.12 with SMTP id 12mr76809vkm.56.1467897259230; Thu, 07
	Jul 2016 06:14:19 -0700 (PDT)
Received: by 10.103.35.80 with HTTP; Thu, 7 Jul 2016 06:14:19 -0700 (PDT)
Received: by 10.103.35.80 with HTTP; Thu, 7 Jul 2016 06:14:19 -0700 (PDT)
In-Reply-To: <fda7b83b51d93891bfe9c602f9c69cdee7a084d3.1467855356.git.liezhi.yang@windriver.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
	<fda7b83b51d93891bfe9c602f9c69cdee7a084d3.1467855356.git.liezhi.yang@windriver.com>
Date: Thu, 7 Jul 2016 07:14:19 -0600
Message-ID: <CACS+7ZTMT_k1KqhxiwG82EtP-bK0iQ2Saw-vFwTN-=tSoeiYEA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] git: 2.8.4 -> 2.9.0
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
X-List-Received-Date: Thu, 07 Jul 2016 13:14:19 -0000
Content-Type: multipart/alternative; boundary=001a1143800cb417fc05370b760f

--001a1143800cb417fc05370b760f
Content-Type: text/plain; charset=UTF-8

On 6 Jul 2016 7:37 p.m., "Robert Yang" <liezhi.yang@windriver.com> wrote:
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/git/git_2.8.4.bb | 11 -----------
>  meta/recipes-devtools/git/git_2.9.0.bb | 11 +++++++++++
>  2 files changed, 11 insertions(+), 11 deletions(-)
>  delete mode 100644 meta/recipes-devtools/git/git_2.8.4.bb
>  create mode 100644 meta/recipes-devtools/git/git_2.9.0.bb
>
> diff --git a/meta/recipes-devtools/git/git_2.8.4.bb
b/meta/recipes-devtools/git/git_2.8.4.bb
> deleted file mode 100644
> index 7f3a89b..0000000
> --- a/meta/recipes-devtools/git/git_2.8.4.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require git.inc
> -
> -EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> -
 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> -                 "
> -EXTRA_OEMAKE += "NO_GETTEXT=1"
> -
> -SRC_URI[tarball.md5sum] = "51e5a6b8b7f834b27d91d2268ae10a9c"
> -SRC_URI[tarball.sha256sum] =
"626e319f8a24fc0866167ea5f6bf3e2f38f69d6cb2e59e150f13709ca3ebf301"
> -SRC_URI[manpages.md5sum] = "c4d17feb686ff9be3d6f8762a89cdafe"
> -SRC_URI[manpages.sha256sum] =
"953a8eadaf4ae96dbad2c3ec12384c677416843917ef83d94b98367ffd55afc0"
> diff --git a/meta/recipes-devtools/git/git_2.9.0.bb
b/meta/recipes-devtools/git/git_2.9.0.bb
> new file mode 100644
> index 0000000..5a04715
> --- /dev/null
> +++ b/meta/recipes-devtools/git/git_2.9.0.bb
> @@ -0,0 +1,11 @@
> +require git.inc
> +
> +EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> +
 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> +                 "
> +EXTRA_OEMAKE += "NO_GETTEXT=1"
> +
> +SRC_URI[tarball.md5sum] = "c982d63b69c1206c1b9d28de31520775"
> +SRC_URI[tarball.sha256sum] =
"bff7560f5602fcd8e37669e0f65ef08c6edc996e4f324e4ed6bb8a84765e30bd"
> +SRC_URI[manpages.md5sum] = "6945b85d17929691327dc12e7d1e0cbd"
> +SRC_URI[manpages.sha256sum] =
"35ba69a8560529aa837e395a6d6c8d42f4d29b40a3c1cc6e3dc69bb1faadb332"
> --
> 2.9.0
>
> --
>

I have no real objection to this.. in fact I've done it locally. But I do
think we should wait for 2.9.1. It should be released soon hopefully.

_______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1143800cb417fc05370b760f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 6 Jul 2016 7:37 p.m., &quot;Robert Yang&quot; &lt;<a href=3D"mailto:liez=
hi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver=
.com">liezhi.yang@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/git/<a href=3D"http://git_2.8.4.bb">git_2.=
8.4.bb</a> | 11 -----------<br>
&gt; =C2=A0meta/recipes-devtools/git/<a href=3D"http://git_2.9.0.bb">git_2.=
9.0.bb</a> | 11 +++++++++++<br>
&gt; =C2=A02 files changed, 11 insertions(+), 11 deletions(-)<br>
&gt; =C2=A0delete mode 100644 meta/recipes-devtools/git/<a href=3D"http://g=
it_2.8.4.bb">git_2.8.4.bb</a><br>
&gt; =C2=A0create mode 100644 meta/recipes-devtools/git/<a href=3D"http://g=
it_2.9.0.bb">git_2.9.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/git/<a href=3D"http://git_2.8.4.bb"=
>git_2.8.4.bb</a> b/meta/recipes-devtools/git/<a href=3D"http://git_2.8.4.b=
b">git_2.8.4.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 7f3a89b..0000000<br>
&gt; --- a/meta/recipes-devtools/git/<a href=3D"http://git_2.8.4.bb">git_2.=
8.4.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,11 +0,0 @@<br>
&gt; -require git.inc<br>
&gt; -<br>
&gt; -EXTRA_OECONF +=3D &quot;ac_cv_snprintf_returns_bogus=3Dno \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_f=
read_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<=
br>
&gt; -EXTRA_OEMAKE +=3D &quot;NO_GETTEXT=3D1&quot;<br>
&gt; -<br>
&gt; -SRC_URI[tarball.md5sum] =3D &quot;51e5a6b8b7f834b27d91d2268ae10a9c&qu=
ot;<br>
&gt; -SRC_URI[tarball.sha256sum] =3D &quot;626e319f8a24fc0866167ea5f6bf3e2f=
38f69d6cb2e59e150f13709ca3ebf301&quot;<br>
&gt; -SRC_URI[manpages.md5sum] =3D &quot;c4d17feb686ff9be3d6f8762a89cdafe&q=
uot;<br>
&gt; -SRC_URI[manpages.sha256sum] =3D &quot;953a8eadaf4ae96dbad2c3ec12384c6=
77416843917ef83d94b98367ffd55afc0&quot;<br>
&gt; diff --git a/meta/recipes-devtools/git/<a href=3D"http://git_2.9.0.bb"=
>git_2.9.0.bb</a> b/meta/recipes-devtools/git/<a href=3D"http://git_2.9.0.b=
b">git_2.9.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..5a04715<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/git/<a href=3D"http://git_2.9.0.bb">git_2.=
9.0.bb</a><br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +require git.inc<br>
&gt; +<br>
&gt; +EXTRA_OECONF +=3D &quot;ac_cv_snprintf_returns_bogus=3Dno \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_f=
read_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<=
br>
&gt; +EXTRA_OEMAKE +=3D &quot;NO_GETTEXT=3D1&quot;<br>
&gt; +<br>
&gt; +SRC_URI[tarball.md5sum] =3D &quot;c982d63b69c1206c1b9d28de31520775&qu=
ot;<br>
&gt; +SRC_URI[tarball.sha256sum] =3D &quot;bff7560f5602fcd8e37669e0f65ef08c=
6edc996e4f324e4ed6bb8a84765e30bd&quot;<br>
&gt; +SRC_URI[manpages.md5sum] =3D &quot;6945b85d17929691327dc12e7d1e0cbd&q=
uot;<br>
&gt; +SRC_URI[manpages.sha256sum] =3D &quot;35ba69a8560529aa837e395a6d6c8d4=
2f4d29b40a3c1cc6e3dc69bb1faadb332&quot;<br>
&gt; --<br>
&gt; 2.9.0<br>
&gt;<br>
&gt; --<br>
&gt;</p>
<p dir=3D"ltr">I have no real objection to this.. in fact I&#39;ve done it =
locally. But I do think we should wait for 2.9.1. It should be released soo=
n hopefully.</p>
<p dir=3D"ltr"> _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a1143800cb417fc05370b760f--
