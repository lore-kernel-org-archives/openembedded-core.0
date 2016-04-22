Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id F011062133
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 23:57:49 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id c189so482974vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 16:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=0AfzPS/a0RJ/ThltBpQe0+lCEslNTjKEGvRN+gwREGY=;
	b=zk5sksCXryZJ1BknsFF2dDX4NlSxJK5YbooZGT2ABh+2eWfhcVGbyaMWmwYkW1rFVX
	0Qn3lxoHwSK6Igo2Qv6KzQP62V8VZaf6Vb4Aywnmp7utx7hMTs3EFEeg93CBDDqUldCO
	vTXuKrswGy732j8NddHOfCbVwjxcAQBAew77e33sW7McokmTPDd1MM3xF+fKNHrJZeY4
	a71PhkqB/bFubtXS/mRvar82tNldSOCjnpfCk8DubjhUuK2uGqivifiMR4R+X3R+FbBW
	xmQeL0T0dYL8O/DP99UyTVbiHhkJg5rHsszBz+Yb+FoXvlyjpxDN/kI8bzb/U+wnvfNK
	kGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=0AfzPS/a0RJ/ThltBpQe0+lCEslNTjKEGvRN+gwREGY=;
	b=DF68dJ2i1scZAmqLIC8asqwEK4Q2jvgeC74Wfi05CmvLX8EU2wmzimRB/ZfZzNYqD/
	kp2ZRsV56uU/iplQNvsj0/UOdA0C28TD/vHnjtHD2tGr+WX+pmzikYLAdhFK2E1gfI5L
	9ROaFHoQ1AaOwvaPjSrDBEX+fjJ7tCucfGbZwLekqyaaDk/AfqNoCGg8+JbGbm5P7oOM
	xyuZjuruevFNjBBOrq6qHeisMYrDAeBPy7huimfULHYZJcLokNEHar/WoxSWV5JUFjBU
	qb+kXFqTgrPcPt1o6KoJLXdlpxe+yFrWiF2kM2iux6vyT8uktfPRjFjKH9ttrsg5KCrn
	iqmA==
X-Gm-Message-State: AOPr4FV1unqKfw+d7Tk61zkW5ZuuW3j2KnbzSQoH6DdZRCkfFueiqpaJU8IgetfknzMWQOpgiMW4MJw47zTf8g==
MIME-Version: 1.0
X-Received: by 10.159.37.181 with SMTP id 50mr9895120uaf.146.1461369470058;
	Fri, 22 Apr 2016 16:57:50 -0700 (PDT)
Received: by 10.103.50.75 with HTTP; Fri, 22 Apr 2016 16:57:49 -0700 (PDT)
Received: by 10.103.50.75 with HTTP; Fri, 22 Apr 2016 16:57:49 -0700 (PDT)
In-Reply-To: <d0ca3b62bef9534383af9cbaa6b6a4e1e8a15862.1461329608.git.jussi.kukkonen@intel.com>
References: <cover.1461329608.git.jussi.kukkonen@intel.com>
	<b0e90c378280d55e73abbb3464b08c77bde64867.1461329608.git.jussi.kukkonen@intel.com>
	<d0ca3b62bef9534383af9cbaa6b6a4e1e8a15862.1461329608.git.jussi.kukkonen@intel.com>
Date: Fri, 22 Apr 2016 17:57:49 -0600
Message-ID: <CACS+7ZRCcqiNudczj9PwnKztENvsF3T9r5ymWXKdmfhKTjXDhw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-sanitizers: Depend on target gcc
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
X-List-Received-Date: Fri, 22 Apr 2016 23:57:50 -0000
Content-Type: multipart/alternative; boundary=001a113979f626046505311b988b

--001a113979f626046505311b988b
Content-Type: text/plain; charset=UTF-8

On 22 Apr 2016 7:27 a.m., "Jussi Kukkonen" <jussi.kukkonen@intel.com> wrote:
>
> Without this the target gcc might not be in the sysroot
> leading to configure failure.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index 6091a0b..df4e297 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -50,7 +50,7 @@ do_install () {
>
>  INHIBIT_DEFAULT_DEPS = "1"
>  ALLOW_EMPTY_${PN} = "1"
> -DEPENDS = "gcc-runtime"
> +DEPENDS = "gcc-runtime virtual/${TARGET_PREFIX}gcc"
>
>  BBCLASSEXTEND = "nativesdk"
>
> --
> 2.1.4
>

I agree with Khem. Otherwise looks good to me.

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a113979f626046505311b988b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 22 Apr 2016 7:27 a.m., &quot;Jussi Kukkonen&quot; &lt;<a href=3D"mailto:=
jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Without this the target gcc might not be in the sysroot<br>
&gt; leading to configure failure.<br>
&gt;<br>
&gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@int=
el.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recip=
es-devtools/gcc/gcc-sanitizers.inc<br>
&gt; index 6091a0b..df4e297 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc<br>
&gt; @@ -50,7 +50,7 @@ do_install () {<br>
&gt;<br>
&gt; =C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt; =C2=A0ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
&gt; -DEPENDS =3D &quot;gcc-runtime&quot;<br>
&gt; +DEPENDS =3D &quot;gcc-runtime virtual/${TARGET_PREFIX}gcc&quot;<br>
&gt;<br>
&gt; =C2=A0BBCLASSEXTEND =3D &quot;nativesdk&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.1.4<br>
&gt;</p>
<p dir=3D"ltr">I agree with Khem. Otherwise looks good to me.</p>
<p dir=3D"ltr">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a113979f626046505311b988b--
