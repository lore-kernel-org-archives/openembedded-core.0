Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 325856FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 14:07:17 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id q11so8123109qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g+TM54lxJlKUKdp1brl4f+UgGgcMnWoxhT/zuMCIuOA=;
	b=I+eZDWf2jK2QhHUUVb1VlISqnrG5y+c2MxUWNI/KWonTjc+wl8hhlRXjukPWtzyIOw
	a5S3ZhUMXoUXS1LzFKrn4IAeHE634y0WL1vV10Vf50ZcZnegdN0b88E8W5R9pYqLj1Do
	ccHTBA+DcS0ryo+t7RqTA5ye14e+P4svTdhuSNKFK0wjgxMUaxlzwfnbkAbLuXw8gsxy
	8KUueB5l2FePmqm7Tn4Esrwc1HZsZdVgxRN8xiyvtlmOaPOB7aF50oRFcavr49em/hea
	EIjDJtB1cVVPcbNCTLOww+P1h7x2vLvfDzrePnhy91T/D/Cf7enY8YE5wmEPXiBryfUU
	9cHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g+TM54lxJlKUKdp1brl4f+UgGgcMnWoxhT/zuMCIuOA=;
	b=a8k8/ULmJM2nX2mA11dsTUpMql94hWzkNELbqLKEs2wKvX6BCL8Q2Tf7qwhX1yHUXX
	M5ngzO7grYZFRchGZbBjGUqsX46LweTdpu/rmGXF7QSG4j3+Rm1jvVzCQpj+QhY+sKeF
	ncUSe3QX2BvaDltjwmbTOyqwGA4wkjVHAJd9UXTcUr9pYXz7OOXqCkqKmHN1anbH/cZB
	TUiXVM2jnrWcxU5c9lxubsnyc4Oi0nNnX15sXAnYjIgn3bQZABGI6yMUSHzmeTjcYRR3
	LwQTaqUBlW0ysQXEX7FE0DON5+XNWNj2iRDiczc8J9A+H5D1IEcFtCqfMZ7X9hrFjtw7
	aqow==
X-Gm-Message-State: AEkoouuqZ6o0kHiwChlEUyh5rEiikO/nBGGWAjQBzLN/qZ2qoOZBNLRZ/OoHOHp1696edcZS5eYEJDMUabpa0w==
X-Received: by 10.200.45.8 with SMTP id n8mr89094346qta.57.1470060438373; Mon,
	01 Aug 2016 07:07:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 1 Aug 2016 07:07:17 -0700 (PDT)
In-Reply-To: <20160801123253.9292-1-twoerner@gmail.com>
References: <20160801123253.9292-1-twoerner@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 1 Aug 2016 10:07:17 -0400
Message-ID: <CADkTA4Pa0pjQ8HQwAFq6jZUW5TXjfYd=pkdaOoDgU5S7x2hhsQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Mon, 01 Aug 2016 14:07:18 -0000
Content-Type: multipart/alternative; boundary=001a1149dab23a4e740539031eaf

--001a1149dab23a4e740539031eaf
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 1, 2016 at 8:32 AM, Trevor Woerner <twoerner@gmail.com> wrote:

> If the initramfs image is type lzo, then a native lzop is needed.
>


Not a large dependency, but it does bring to mind the question if this
could be conditional on the type of image being built ? via  distro
feature, some other mechanism ?

Bruce


>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index fa76a14..db42744 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base kernel-module-split
>
>  PROVIDES += "virtual/kernel"
> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc
> kmod-native depmodwrapper-cross bc-native"
> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc
> kmod-native depmodwrapper-cross bc-native lzop-native"
>
>  S = "${STAGING_KERNEL_DIR}"
>  B = "${WORKDIR}/build"
> --
> 2.9.2
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

--001a1149dab23a4e740539031eaf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 1, 2016 at 8:32 AM, Trevor Woerner <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">If the initramfs imag=
e is type lzo, then a native lzop is needed.<br></blockquote><div><br></div=
><div><br></div><div>Not a large dependency, but it does bring to mind the =
question if this could be conditional on the type of image being built ? vi=
a =C2=A0distro feature, some other mechanism ?</div><div><br></div><div>Bru=
ce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com">two=
erner@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index fa76a14..db42744 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -1,7 +1,7 @@<br>
=C2=A0inherit linux-kernel-base kernel-module-split<br>
<br>
=C2=A0PROVIDES +=3D &quot;virtual/kernel&quot;<br>
-DEPENDS +=3D &quot;virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFI=
X}gcc kmod-native depmodwrapper-cross bc-native&quot;<br>
+DEPENDS +=3D &quot;virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFI=
X}gcc kmod-native depmodwrapper-cross bc-native lzop-native&quot;<br>
<br>
=C2=A0S =3D &quot;${STAGING_KERNEL_DIR}&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.9.2<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a1149dab23a4e740539031eaf--
