Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1D80673EFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 02:18:57 +0000 (UTC)
Received: by iget9 with SMTP id t9so84805553ige.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 19:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mrv/c8Klm/mbtk0Evt9F/vhToj5mIE9sKgIre0HWRYM=;
	b=DhSJqU4Lq3GEImCkRBWLYDlh2X++iNl9yzjr7DVvBUiLQo9VMleL3cfr4Kj4GH/QqU
	Gc/+9up6DEvFwr6uiVlpp3KxVpMQzInFkwst/9Db68ysEj2Y06P8NmI6CsIAj+DT5iMM
	i10/9akl/gzFCLlDdOZZFgo8x8iiRl0eyRvLdZPNQklZfhVcNsTik8hKEkodto9fbgPC
	r+fFRDjmL4A+4mPvjvry9UfOwYu/c/5TiHKuR9ZwSGTFqrp/ZDbq6NuHBvxH7a3kErZF
	lHhEIrBy966LVRlxvm/9wlC08ArV4VIXPn1XCpF7euAFtKIKpGSuQSMB284HppmKuDT2
	rFLw==
MIME-Version: 1.0
X-Received: by 10.43.173.70 with SMTP id ob6mr538556icc.45.1431397138635; Mon,
	11 May 2015 19:18:58 -0700 (PDT)
Received: by 10.50.112.34 with HTTP; Mon, 11 May 2015 19:18:58 -0700 (PDT)
Received: by 10.50.112.34 with HTTP; Mon, 11 May 2015 19:18:58 -0700 (PDT)
In-Reply-To: <37d60010ba7e3f90761dc8d7a83c66eda3382481.1431396786.git.liezhi.yang@windriver.com>
References: <cover.1431396786.git.liezhi.yang@windriver.com>
	<37d60010ba7e3f90761dc8d7a83c66eda3382481.1431396786.git.liezhi.yang@windriver.com>
Date: Mon, 11 May 2015 19:18:58 -0700
Message-ID: <CAMKF1sp5zzO2Se9099oHQw8Sa1M=aVYxi3=pGPOX0AsLj_hfpQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] lttng-tools: separate B and S
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
X-List-Received-Date: Tue, 12 May 2015 02:18:58 -0000
Content-Type: multipart/alternative; boundary=001a11c3b5a8fb22e70515d91d94

--001a11c3b5a8fb22e70515d91d94
Content-Type: text/plain; charset=UTF-8

On May 11, 2015 7:14 PM, "Robert Yang" <liezhi.yang@windriver.com> wrote:
>
> It works well with autotools now.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> index 8cc4220..d1c6293 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> @@ -31,7 +31,9 @@ SRC_URI = "git://
git.lttng.org/lttng-tools.git;branch=stable-2.6 \
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools-brokensep ptest pkgconfig useradd
> +inherit autotools ptest pkgconfig useradd
> +
> +PR = "r1"

Why bump pr
>
>  USERADD_PACKAGES = "${PN}"
>  GROUPADD_PARAM_${PN} = "tracing"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a11c3b5a8fb22e70515d91d94
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 11, 2015 7:14 PM, &quot;Robert Yang&quot; &lt;<a href=3D"mailto:liez=
hi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; It works well with autotools now.<br>
&gt;<br>
&gt; Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver=
.com">liezhi.yang@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-kernel/lttng/<a href=3D"http://lttng-tools_2.6.0.bb=
">lttng-tools_2.6.0.bb</a> |=C2=A0 =C2=A0 4 +++-<br>
&gt; =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-tools_2=
.6.0.bb">lttng-tools_2.6.0.bb</a> b/meta/recipes-kernel/lttng/<a href=3D"ht=
tp://lttng-tools_2.6.0.bb">lttng-tools_2.6.0.bb</a><br>
&gt; index 8cc4220..d1c6293 100644<br>
&gt; --- a/meta/recipes-kernel/lttng/<a href=3D"http://lttng-tools_2.6.0.bb=
">lttng-tools_2.6.0.bb</a><br>
&gt; +++ b/meta/recipes-kernel/lttng/<a href=3D"http://lttng-tools_2.6.0.bb=
">lttng-tools_2.6.0.bb</a><br>
&gt; @@ -31,7 +31,9 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.lttng.=
org/lttng-tools.git;branch=3Dstable-2.6">git.lttng.org/lttng-tools.git;bran=
ch=3Dstable-2.6</a> \<br>
&gt;<br>
&gt; =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -inherit autotools-brokensep ptest pkgconfig useradd<br>
&gt; +inherit autotools ptest pkgconfig useradd<br>
&gt; +<br>
&gt; +PR =3D &quot;r1&quot;</p>
<p dir=3D"ltr">Why bump pr<br>
&gt;<br>
&gt; =C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
&gt; =C2=A0GROUPADD_PARAM_${PN} =3D &quot;tracing&quot;<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a11c3b5a8fb22e70515d91d94--
