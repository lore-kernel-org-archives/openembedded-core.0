Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id ABC166057B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 04:19:35 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id p130so15470994qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 21:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Mi70THfvlPndClIFjlg3PC8B1aDDzL9RKNAvoqXfG4I=;
	b=tpe82qfpcLaG04xt1vhwGpUwEZB4M6/V06+sComEZjZ3R522N3hQxlifyjj1UPwi8j
	/7TuNzOfhzaAiOOnu4/s3V09QB+eYRehTpuXAh5ZVK0y+mSu4rXG7Ng4ICQQG0C8TkkP
	VxDo4OnJax/djv96tRysOahWRlgqNbdB1bEKTsQaJNtCqA3pP66xgEjcZhp+rFnD6GsM
	qNfYLa2m9WRVomKTmQQlL66+mOEbQwYMUQyAvaQ9/nBSeJ0251f00CkyIbGqmfYeJ0Cs
	vVpGkgCpZTC//SCIWn5g+dpDv46VcYS2G62PDSiNKI4fppV7rgfpxik/U06rQo5YH7as
	9QVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Mi70THfvlPndClIFjlg3PC8B1aDDzL9RKNAvoqXfG4I=;
	b=Ia4+NAOri/CVimY7p6gDOMvZyO5Age98ELKASFMmPNDjGge1VTEyKsXfC6Kr5Pahjf
	chYTl8XTRi9MKDw11KQt7Ob1Gl8r5oj1A4e6rqcbC+vg6FpBqhJywi5KFTfAX0S3EdaC
	C9kRU9zQTpIfHNr6TxstoDz+fkQjjm1E6dt8mtkKD/6z9ZpjwkqdsAzITzfmSeFAhXpF
	U7rNYtyIR6oL+9MyQdh/7bN6vaCwDbknM3TJZ4dlUBDOl9ymB3e5MpbDberYJOcKB7mI
	XthZRZWyClfY5AXOPrVwZUXIjJVwia273Sf0Dka2yvNX99YVxTotfUyjP8KHNwb7t51U
	kUYA==
X-Gm-Message-State: AD7BkJKlemsIblCs0j2IT4cI0Jf3FOAeK5KIC+2q4dW9ENHycShkUJ7VXXgTbZRW9C8QG6Ijotn0MhUMkAJpOA==
MIME-Version: 1.0
X-Received: by 10.55.78.70 with SMTP id c67mr7904050qkb.37.1458793175879; Wed,
	23 Mar 2016 21:19:35 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Wed, 23 Mar 2016 21:19:35 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Wed, 23 Mar 2016 21:19:35 -0700 (PDT)
In-Reply-To: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
References: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
Date: Wed, 23 Mar 2016 21:19:35 -0700
Message-ID: <CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 04:19:36 -0000
Content-Type: multipart/alternative; boundary=001a114a9bbe0c962e052ec3c1eb

--001a114a9bbe0c962e052ec3c1eb
Content-Type: text/plain; charset=UTF-8

On Mar 23, 2016 8:19 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index f4f76bd..a7b8d63 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -65,6 +65,7 @@ EXTRA_OECONF_append_mips64eln32 = " --with-abi=64
--with-arch-64=mips64 --with-t
>  EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
>  EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
>  EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
> +EXTRA_OECONF_append_armv8a = " --with-arch=armv7-a"

Armv8 is different architecture and even gcc backends for armv8 arent
shared with armv7. This change doesn't look right to me. What are you
fixing with this change
>
>  EXTRA_OECONF_GCC_FLOAT ??= ""
>  CPPFLAGS = ""
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a114a9bbe0c962e052ec3c1eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Mar 23, 2016 8:19 PM, &quot;Andre McCurdy&quot; &lt;<a href=3D"mailto:ar=
mccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com=
">armccurdy@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +<br>
&gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta=
/recipes-devtools/gcc/gcc-configure-common.inc<br>
&gt; index f4f76bd..a7b8d63 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc<br>
&gt; @@ -65,6 +65,7 @@ EXTRA_OECONF_append_mips64eln32 =3D &quot; --with-ab=
i=3D64 --with-arch-64=3Dmips64 --with-t<br>
&gt; =C2=A0EXTRA_OECONF_append_armv6 =3D &quot; --with-arch=3Darmv6&quot;<b=
r>
&gt; =C2=A0EXTRA_OECONF_append_armv7a =3D &quot; --with-arch=3Darmv7-a&quot=
;<br>
&gt; =C2=A0EXTRA_OECONF_append_armv7ve =3D &quot; --with-arch=3Darmv7-a&quo=
t;<br>
&gt; +EXTRA_OECONF_append_armv8a =3D &quot; --with-arch=3Darmv7-a&quot;</p>
<p dir=3D"ltr">Armv8 is different architecture and even gcc backends for ar=
mv8 arent shared with armv7. This change doesn&#39;t look right to me. What=
 are you fixing with this change<br>
&gt;<br>
&gt; =C2=A0EXTRA_OECONF_GCC_FLOAT ??=3D &quot;&quot;<br>
&gt; =C2=A0CPPFLAGS =3D &quot;&quot;<br>
&gt; --<br>
&gt; 1.9.1<br>
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

--001a114a9bbe0c962e052ec3c1eb--
