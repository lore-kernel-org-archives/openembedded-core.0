Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.1724.1602518085341360550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 08:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NZpNUftM;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id p5so3265852vkm.4
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 08:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xVDfcowm7KLpfvgJW5x4RntKlMbBKeVoAk8LCnNT6r0=;
        b=NZpNUftMiltKpf52NtiLp5JLL0lq2odHeCI6jAv092dgfgJOK8nijH6/7scF3Rh+KW
         dnkOGSIxvYvBebyrEvw5nXViSUh+MH+Txn2DMb4OfJAz5/SrYGoh91GtzHlfJmHXZFKB
         gmY+lo3a9aJ2t32G032iEUV/h4piSyClfucd3n/uO3Il3w4VHz1RpVgR92D46F8+z6cE
         XrEAtbXccn+jkhLz4UJW1mkKKlqb1a54Toj9OkUp8g/qmnpfnjfDYQsKR88AGfQkiiW4
         FNipK7+f/Gvnsz0GbeO/rxWqyv2OeyA0icnXQ3peyY5ijQn4l/ax8X5ukrbJX1LhCsGV
         NqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xVDfcowm7KLpfvgJW5x4RntKlMbBKeVoAk8LCnNT6r0=;
        b=YDrWiopxN36I0Hb7JQDaJ/k/8cqnDAVtCuuFPIBz6PpL1zUnFF87fZYxX6TXHQ0Sst
         RUCQflKcN2uRovrAUVs624bah98eBmPbqH75HTiz46WwWUG7pue6Y7elrZCDK2buv0xP
         F1rIadSQTx9L0u2SncBQGSX2GqZEbzmvO0wyGsfgyR+uKK3Xu4vBLwUsA4mIaGbAAtvt
         CRC3p3Les4JsCb7/wna7CJCQyiF05tlegZAf7tj3UvOXzI6b/71FOKebX4IpwnzhTfwo
         eVvvQ+bfVJQzR1AhcNd9Y8a1/7qhEl9JgLl7ea1YM8O/kks49Ql7S5WU+ixlsBMp/pvY
         IOGw==
X-Gm-Message-State: AOAM531vVeFwOHe7JfzixmRNC6S61+z5QlH4mve+Us8mD9Kxc0VWZOTt
	ZnwfGzz9rdNxbtWhVuOeCzzMI+e/4K3MJKc5dNI=
X-Google-Smtp-Source: ABdhPJwcAZUoGb4QCD5XDmzu07ka95sETkvZeRy8as8g+k7zlAZCAUPG5fgXFPqJdmlBdlQ5qVyA7f/YXpi1IXutRC0=
X-Received: by 2002:a1f:a1cb:: with SMTP id k194mr13513105vke.10.1602518084461;
 Mon, 12 Oct 2020 08:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com> <20201012123620.2095778-5-quaresma.jose@gmail.com>
In-Reply-To: <20201012123620.2095778-5-quaresma.jose@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 12 Oct 2020 17:54:33 +0200
Message-ID: <CANNYZj-gsTcYJjpwxeT7TwAj8QQptQUBSd6N5QmaoNR82JQRUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/13] gstreamer1.0-plugins-bad: disable vulkan
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002ba9df05b17b51f6"

--0000000000002ba9df05b17b51f6
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 Oct 2020 at 14:36, Jose Quaresma <quaresma.jose@gmail.com> wrote:

> -PACKAGECONFIG[vulkan]          =
> "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader"
> +# FIXME: vulkan build fail
> +# to build vulkan, a new package is needed.
> +# add shaderc package as a separate pacth
> +# https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues/1349
> +#| Program glslc found: NO
> +#| gst-libs/gst/vulkan/meson.build:273:0: ERROR: Program(s) ['glslc'] not
> found or not executable
> +#PACKAGECONFIG[vulkan]          =
> "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc"
>

I think this needs to be addressed, as it's a regression in what previously
worked. If a newer version of vulkan is required, I have done some work
towards that here:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates-later&id=d6715a06317b1799f5380cc8169acfbd0696d498

but had to put it on hold because gstreamer 1.16 is not compatible with it
:) Can you cherry-pick that and see if it helps? (there's an even newer
vulkan available since, so maybe you need to do additional upgrading)

Alex

--0000000000002ba9df05b17b51f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 12 Oct 2020 at 14:36, Jose Quares=
ma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresm=
a.jose@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">-PACKAGECONFIG[vulkan]=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,v=
ulkan-loader&quot;<br>
+# FIXME: vulkan build fail<br>
+# to build vulkan, a new package is needed.<br>
+# add shaderc package as a separate pacth<br>
+# <a href=3D"https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/is=
sues/1349" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.=
org/gstreamer/gst-plugins-bad/-/issues/1349</a><br>
+#| Program glslc found: NO<br>
+#| gst-libs/gst/vulkan/meson.build:273:0: ERROR: Program(s) [&#39;glslc&#3=
9;] not found or not executable<br>
+#PACKAGECONFIG[vulkan]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;-Dvulka=
n=3Denabled,-Dvulkan=3Ddisabled,vulkan-loader shaderc&quot;<br></blockquote=
><div><br></div><div>I think this needs to be addressed, as it&#39;s a regr=
ession in what previously worked. If a newer version of vulkan is required,=
 I have done some work towards that here:</div><div><a href=3D"http://git.y=
octoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/package-ver=
sion-updates-later&amp;id=3Dd6715a06317b1799f5380cc8169acfbd0696d498">http:=
//git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dakanavin/pack=
age-version-updates-later&amp;id=3Dd6715a06317b1799f5380cc8169acfbd0696d498=
</a></div><div><br></div><div>but had to put it on hold because gstreamer 1=
.16 is not compatible with it :) Can you cherry-pick that and see if it hel=
ps? (there&#39;s an even newer vulkan available since, so maybe you need to=
 do additional upgrading)</div><div><br></div><div>Alex<br></div></div></di=
v>

--0000000000002ba9df05b17b51f6--
