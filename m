Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id E41816E687
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 04:09:45 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id f74so50763509qge.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 21:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=9i7FLr0t6/WJDNRnzK0fy6zvioLPxZ7i6WIyMcNfXD0=;
	b=QV2NvzUKOvL3M7G1NH9hoDqLDDe4uwXt88aVgHqCG1NAlx15PmmzAUaqzQuicyj3N5
	OI5pqrJcY6GL81450rjBiR8oOO8g/R1s++3+2MlUlaZ4gfg2On4RdseJqoJ85jMxY7Bn
	fPyb0bWd+PXC7b4dW6jVZLkSDYr9FecpiQLpJxeIL0FRGGWyAxidJwlPrDhrX9dr5rpn
	jhQ8aFJuj20oLKv6jT6Yf0kIUhXG2B/DpNkg/saDnmk/HFGtVJz1kyDVa8xqD3jX2I+a
	5aBp/J95LS7L81IpbdJICfB858wXthkbbVHz/7RaGrLTslyTy8G1gYL6s1FKeZS//Zx/
	ONYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=9i7FLr0t6/WJDNRnzK0fy6zvioLPxZ7i6WIyMcNfXD0=;
	b=iJQzAPqS7E8SfZqxDO5zkUPsuGnZkV4OBQ+QKIaUjkJt0kam6U4cAdDHuiGhKaJ8WR
	nq0mo+6/n6enrX0cUJ7JPkSQILkUF5Cw4vpF/aS12Y+QB0cArii7uGNY9lVav9vO/Wn7
	Mn+/ZiYVgrVmCYCUJDClpEr1yfT2+i40sa0vUJt1Z8fTIBhWEI5Vc2FOHh/J3pTTZt5Q
	KtlkykiJ77+HYYJC0DN2WXL5/EzvhM0jV1j8Yt5COQ+/9iQoewhF6MdvBqz2vwyNQ5g5
	aCgBgxXBp1CZzFaQPKWBFUqwcx7KSrO8rYy8bywEw/7dbh7rJusd4Rqm2GC7yggmLMoS
	QBIQ==
X-Gm-Message-State: AOPr4FUjD1aFqw6sQsLsMyiInx90yJxXVh6fuzAaLduIEIelNtskxPptRQf9hZNpgI4CUN8H3QNDOhJvzY0tBg==
MIME-Version: 1.0
X-Received: by 10.140.196.74 with SMTP id r71mr18398894qha.41.1462507786008;
	Thu, 05 May 2016 21:09:46 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Thu, 5 May 2016 21:09:45 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Thu, 5 May 2016 21:09:45 -0700 (PDT)
In-Reply-To: <1462507108-17945-1-git-send-email-rwoodsmall@gmail.com>
References: <1462507108-17945-1-git-send-email-rwoodsmall@gmail.com>
Date: Thu, 5 May 2016 21:09:45 -0700
Message-ID: <CAMKF1spYLh9=YybuH_aJ9QLhJ1=Ub79VMVgFpBv3QXuD8r2-9Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: ryan woodsmall <rwoodsmall@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Make static lib builds (DISABLE_STATIC) configurable from local.conf
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
X-List-Received-Date: Fri, 06 May 2016 04:09:48 -0000
Content-Type: multipart/alternative; boundary=001a11431e1c110f95053224a1e5

--001a11431e1c110f95053224a1e5
Content-Type: text/plain; charset=UTF-8

On May 5, 2016 8:59 PM, "ryan woodsmall" <rwoodsmall@gmail.com> wrote:
>
> Static libraries are mostly usable in very small embedded systems.
> The addiiton of musl-libc support allows very small "single binary"
systems,
> and static linking allows no shared lib deps on these types of builds.
>
> Signed-off-by: ryan woodsmall <rwoodsmall@gmail.com>
> ---
>  meta/conf/distro/include/no-static-libs.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/distro/include/no-static-libs.inc
b/meta/conf/distro/include/no-static-libs.inc
> index 13a7918..83472d5 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -1,4 +1,4 @@
> -DISABLE_STATIC = " --disable-static"
> +DISABLE_STATIC ?= " --disable-static"
>

I think this defeats the essense of this inc file. Not including this file
in your distro as a policy is what you want

>  # qemu aborts on unrecognised option
>  DISABLE_STATIC_pn-qemu = ""
> @@ -32,4 +32,4 @@ DISABLE_STATIC_pn-libusb1-native = ""
>
>  EXTRA_OECONF_append = "${DISABLE_STATIC}"
>
> -EXTRA_OECMAKE_append_pn-libical = "-DSHARED_ONLY=True"
> +EXTRA_OECMAKE_append_pn-libical ?= "-DSHARED_ONLY=True"
> --
> 2.6.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a11431e1c110f95053224a1e5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 5, 2016 8:59 PM, &quot;ryan woodsmall&quot; &lt;<a href=3D"mailto:rw=
oodsmall@gmail.com">rwoodsmall@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Static libraries are mostly usable in very small embedded systems.<br>
&gt; The addiiton of musl-libc support allows very small &quot;single binar=
y&quot; systems,<br>
&gt; and static linking allows no shared lib deps on these types of builds.=
<br>
&gt;<br>
&gt; Signed-off-by: ryan woodsmall &lt;<a href=3D"mailto:rwoodsmall@gmail.c=
om">rwoodsmall@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/conf/distro/include/no-static-libs.inc | 4 ++--<br>
&gt; =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/d=
istro/include/no-static-libs.inc<br>
&gt; index 13a7918..83472d5 100644<br>
&gt; --- a/meta/conf/distro/include/no-static-libs.inc<br>
&gt; +++ b/meta/conf/distro/include/no-static-libs.inc<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -DISABLE_STATIC =3D &quot; --disable-static&quot;<br>
&gt; +DISABLE_STATIC ?=3D &quot; --disable-static&quot;<br>
&gt;</p>
<p dir=3D"ltr">I think this defeats the essense of this inc file. Not inclu=
ding this file in your distro as a policy is what you want</p>
<p dir=3D"ltr">&gt; =C2=A0# qemu aborts on unrecognised option<br>
&gt; =C2=A0DISABLE_STATIC_pn-qemu =3D &quot;&quot;<br>
&gt; @@ -32,4 +32,4 @@ DISABLE_STATIC_pn-libusb1-native =3D &quot;&quot;<br=
>
&gt;<br>
&gt; =C2=A0EXTRA_OECONF_append =3D &quot;${DISABLE_STATIC}&quot;<br>
&gt;<br>
&gt; -EXTRA_OECMAKE_append_pn-libical =3D &quot;-DSHARED_ONLY=3DTrue&quot;<=
br>
&gt; +EXTRA_OECMAKE_append_pn-libical ?=3D &quot;-DSHARED_ONLY=3DTrue&quot;=
<br>
&gt; --<br>
&gt; 2.6.4<br>
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

--001a11431e1c110f95053224a1e5--
