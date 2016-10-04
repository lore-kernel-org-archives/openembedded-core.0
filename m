Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0A0719B6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 00:27:03 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n66so11323538qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 17:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H8DysNV2SvtmLS3MaTWq7NdIMLjr/L/9hH99UjWEJ0I=;
	b=cnFoiFH/puzZ3oYx7BJd5SR59luhqRlecA63SPwnGs2zKDbRGrFyZxB8Fj7DU6bIY8
	EPybdbEIvQGljWBS42i3twxc2BNRdG9bi6z/5Gs6H/ZRcNnncjrJ764SX74WULyXfXCC
	xYqKXSLKq5RugLUjudTEnbRJ7XHGueagq9OBzx8uCVBbEgSdAnTqW8gKojpTtE0ewwFa
	Yuqg5vkPdPPXm8/k8RXB54J1ZVInjMuRyOQ/VV+z6+Aziq4xHD7416zoHnD0oNMH5ezU
	GjfmEzr2U54f8DrnzU1/E6NLiBguq2/ArPhNl70D+4hYc4xxd4oeovoJgcJ2LQBs/4pr
	CK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H8DysNV2SvtmLS3MaTWq7NdIMLjr/L/9hH99UjWEJ0I=;
	b=WNPGmxs+pJhjC1GCDaKbnWGK2DbxHrsS67rIScTtNNHL40n9xezYD69QPrMhUURq30
	kA0LRP6sHex5xJYlQGu+0tc6r+NqakNyEgRmTlVMvADlur1sGxhVhq3urNghSaTyD84t
	MKZIEjG76BT9MyTdbjGq0wD3XvBKjGZ+r+61BeDeNiyfruvZJcqDoJMtyTf9s4fpbtsb
	FkJKeRomzE7m9/zI+xKOfXRurwEabyzx6HLujDrB5NSR+HkYvAigGwHfqtKs0ANoUQOQ
	2Um/Cgd1/MHNqyQk4yRQe5vBpzusAydffRUkhdZI+d3r3I7Cypbb481UUbz3MEmBeln0
	g8pQ==
X-Gm-Message-State: AA6/9Rk7M1wkSJyjeptPTMn2J/GCenMcay7AvfBh1Qf+qY8jw2+vwM0vpWD2JnhL79RMhptu5kc6Mfw7MUcuvg==
X-Received: by 10.55.138.66 with SMTP id m63mr872559qkd.159.1475540824525;
	Mon, 03 Oct 2016 17:27:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Mon, 3 Oct 2016 17:27:03 -0700 (PDT)
In-Reply-To: <CAMKF1soOP+440ZhymX8wFHu-Et=77NhscQqm4M8T2i=wQhmGNg@mail.gmail.com>
References: <1475513685-18627-1-git-send-email-bruce.ashfield@windriver.com>
	<CAMKF1soRbsU8iV35jxKnRfrcvsobF20p_u14EfRZ5uee_9N+gg@mail.gmail.com>
	<CAMKF1src3Dj1p+E5p+6QEu213dkFSFMOtDKx3hoJFT+hKvHn9Q@mail.gmail.com>
	<CAMKF1soOP+440ZhymX8wFHu-Et=77NhscQqm4M8T2i=wQhmGNg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Oct 2016 20:27:03 -0400
Message-ID: <CADkTA4NT6ynC61Pd_qRhwL8phc3Wzx0kXw=bzaDUAa8Or485ng@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: if_tunnel: remove include of if/ip/in6.h
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
X-List-Received-Date: Tue, 04 Oct 2016 00:27:05 -0000
Content-Type: multipart/alternative; boundary=94eb2c060f22b2b103053dff1ede

--94eb2c060f22b2b103053dff1ede
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 3, 2016 at 3:55 PM, Khem Raj <raj.khem@gmail.com> wrote:

> What Repercussion does this have wrt APIs headers for future. Provided
> this is a local patch. I think removing header includes like this can cause
> issues.
>


It's something we could drop in the future, but these are mods that have
been done since -rc4, and could very well be undone if they start breaking
things like this.

The alternative is to try and fix the userspace applications, but I
currently don't see a fast way to do that (and I'm now officially on
vacation).

Cheers,

Bruce


>
> On Oct 3, 2016 9:55 AM, "Bruce Ashfield" <bruce.ashfield@windriver.com>
> wrote:
>
> commit 1fe8e0f074c [include/uapi/linux/if_tunnel.h: include linux/if.h,
> linux/ip.h and linux/in6.h]
> breaks the builds of net-tools.
>
> We remove the new includes until such a time that userspace can adapt to
> the
> new kernel headers.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  ...1-if_tunnel-remove-include-of-if-ip-in6.h.patch | 33
> ++++++++++++++++++++++
>  .../linux-libc-headers/linux-libc-headers_4.8.bb   |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux-libc
> -headers/linux-libc-headers/0001-if_tunnel-remove-include-
> of-if-ip-in6.h.patch
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/
> 0001-if_tunnel-remove-include-of-if-ip-in6.h.patch
> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/
> 0001-if_tunnel-remove-include-of-if-ip-in6.h.patch
> new file mode 100644
> index 000000000000..f2011880dccb
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/
> 0001-if_tunnel-remove-include-of-if-ip-in6.h.patch
> @@ -0,0 +1,33 @@
> +From 017ae5929312685c4c044765445bfd4d2a4abb5c Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
> +Date: Mon, 3 Oct 2016 12:27:57 -0400
> +Subject: [PATCH] if_tunnel: remove include of if/ip/in6.h
> +
> +commit 1fe8e0f074c [include/uapi/linux/if_tunnel.h: include linux/if.h,
> linux/ip.h and linux/in6.h]
> +breaks the builds of net-tools.
> +
> +We remove the new includes until such a time that userspace can adapt to
> the
> +new kernel headers.
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +---
> + include/uapi/linux/if_tunnel.h | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/include/uapi/linux/if_tunnel.h
> b/include/uapi/linux/if_tunnel.h
> +index 777b6cd..1046f55 100644
> +--- a/include/uapi/linux/if_tunnel.h
> ++++ b/include/uapi/linux/if_tunnel.h
> +@@ -2,9 +2,6 @@
> + #define _UAPI_IF_TUNNEL_H_
> +
> + #include <linux/types.h>
> +-#include <linux/if.h>
> +-#include <linux/ip.h>
> +-#include <linux/in6.h>
> + #include <asm/byteorder.h>
> +
> +
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_
> 4.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
> index 778f0b6e6443..ee2d8293450e 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
> @@ -10,6 +10,7 @@ SRC_URI_append_libc-musl = "\
>
>  SRC_URI_append = "\
>      file://0001-ppp-fix-in-if.h-includes.patch \
> +    file://0001-if_tunnel-remove-include-of-if-ip-in6.h.patch \
>      "
>
>  SRC_URI[md5sum] = "c1af0afbd3df35c1ccdc7a5118cd2d07"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c060f22b2b103053dff1ede
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 3, 2016 at 3:55 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><p dir=3D"ltr">What Reperc=
ussion does this have wrt APIs headers for future. Provided this is a local=
 patch. I think removing header includes like this can cause issues.</p></b=
lockquote><div><br></div><div><br></div><div>It&#39;s something we could dr=
op in the future, but these are mods that have been done since -rc4, and co=
uld very well be undone if they start breaking things like this.</div><div>=
<br></div><div>The alternative is to try and fix the userspace applications=
, but I currently don&#39;t see a fast way to do that (and I&#39;m now offi=
cially on vacation).</div><div><br></div><div>Cheers,</div><div><br></div><=
div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p dir=3D"lt=
r"> </p><div class=3D"HOEnZb"><div class=3D"h5">
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Oct 3, 2016 9:=
55 AM, &quot;Bruce Ashfield&quot; &lt;<a href=3D"mailto:bruce.ashfield@wind=
river.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt; wrote:<br=
 type=3D"attribution"><blockquote class=3D"m_-7060553277164903007quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">commit=
 1fe8e0f074c [include/uapi/linux/if_tunnel.<wbr>h: include linux/if.h, linu=
x/ip.h and linux/in6.h]<br>
breaks the builds of net-tools.<br>
<br>
We remove the new includes until such a time that userspace can adapt to th=
e<br>
new kernel headers.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
---<br>
=C2=A0...1-if_tunnel-remove-<wbr>include-of-if-ip-in6.h.patch | 33 ++++++++=
++++++++++++++<br>
=C2=A0.../linux-libc-headers/<a href=3D"http://linux-libc-headers_4.8.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-<wbr>libc-headers_4.8.bb</a>=C2=
=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 34 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux-libc<wbr>-headers/linux-=
libc-headers/<wbr>0001-if_tunnel-remove-include-<wbr>of-if-ip-in6.h.patch<b=
r>
<br>
diff --git a/meta/recipes-kernel/linux-li<wbr>bc-headers/linux-libc-headers=
/<wbr>0001-if_tunnel-remove-include-<wbr>of-if-ip-in6.h.patch b/meta/recipe=
s-kernel/linux-li<wbr>bc-headers/linux-libc-headers/<wbr>0001-if_tunnel-rem=
ove-include-<wbr>of-if-ip-in6.h.patch<br>
new file mode 100644<br>
index 000000000000..f2011880dccb<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux-li<wbr>bc-headers/linux-libc-headers/<wbr>0=
001-if_tunnel-remove-include-<wbr>of-if-ip-in6.h.patch<br>
@@ -0,0 +1,33 @@<br>
+From 017ae5929312685c4c044765445bfd<wbr>4d2a4abb5c Mon Sep 17 00:00:00 200=
1<br>
+From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com" t=
arget=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
+Date: Mon, 3 Oct 2016 12:27:57 -0400<br>
+Subject: [PATCH] if_tunnel: remove include of if/ip/in6.h<br>
+<br>
+commit 1fe8e0f074c [include/uapi/linux/if_tunnel.<wbr>h: include linux/if.=
h, linux/ip.h and linux/in6.h]<br>
+breaks the builds of net-tools.<br>
+<br>
+We remove the new includes until such a time that userspace can adapt to t=
he<br>
+new kernel headers.<br>
+<br>
+Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriv=
er.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
+---<br>
+ include/uapi/linux/if_tunnel.h | 3 ---<br>
+ 1 file changed, 3 deletions(-)<br>
+<br>
+diff --git a/include/uapi/linux/if_tunnel<wbr>.h b/include/uapi/linux/if_t=
unnel<wbr>.h<br>
+index 777b6cd..1046f55 100644<br>
+--- a/include/uapi/linux/if_tunnel<wbr>.h<br>
++++ b/include/uapi/linux/if_tunnel<wbr>.h<br>
+@@ -2,9 +2,6 @@<br>
+ #define _UAPI_IF_TUNNEL_H_<br>
+<br>
+ #include &lt;linux/types.h&gt;<br>
+-#include &lt;linux/if.h&gt;<br>
+-#include &lt;linux/ip.h&gt;<br>
+-#include &lt;linux/in6.h&gt;<br>
+ #include &lt;asm/byteorder.h&gt;<br>
+<br>
+<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-kernel/linux-li<wbr>bc-headers/<a href=3D"http://=
linux-libc-headers_4.8.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-=
headers_<wbr>4.8.bb</a> b/meta/recipes-kernel/linux-li<wbr>bc-headers/<a hr=
ef=3D"http://linux-libc-headers_4.8.bb" rel=3D"noreferrer" target=3D"_blank=
">linux-libc-headers_<wbr>4.8.bb</a><br>
index 778f0b6e6443..ee2d8293450e 100644<br>
--- a/meta/recipes-kernel/linux-li<wbr>bc-headers/<a href=3D"http://linux-l=
ibc-headers_4.8.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers=
_<wbr>4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux-li<wbr>bc-headers/<a href=3D"http://linux-l=
ibc-headers_4.8.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers=
_<wbr>4.8.bb</a><br>
@@ -10,6 +10,7 @@ SRC_URI_append_libc-musl =3D &quot;\<br>
<br>
=C2=A0SRC_URI_append =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0001-ppp-fix-in-if.h-i<wbr>ncludes.patch \<br>
+=C2=A0 =C2=A0 file://0001-if_tunnel-remove-i<wbr>nclude-of-if-ip-in6.h.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;c1af0afbd3df35c1ccdc7a5118cd2<wbr>d07&quot;=
<br>
<font color=3D"#888888">--<br>
2.5.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></blockquote></div><br></div>
</div></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div>

--94eb2c060f22b2b103053dff1ede--
