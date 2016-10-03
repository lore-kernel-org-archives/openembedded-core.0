Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB45F719B2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 19:55:13 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id m26so1439529uaa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 12:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gyGDUPGISfa0ma8yJ4kXIqpj7J8eGCC9t375rKVwEqw=;
	b=mwAwLXTfj+qZqQGNh3NPCkmR8BCaczK9+BTuhhPQauLKX2XVZud+y6+gRkvKW4388r
	UeoL3INkp620fwzsbO5spREFK+gso83KKVUqsLy175FpuyCMvMKxLESSld5MtIugNNNq
	lEytNGuzRrOQHdNNfZzG3Hhc9I/DoDfOJQw5xYMW0ysCduSV56iyKkH25G+ra67Gm2mT
	rbs3bbe/x71oLOX9g/zen6ndgvwKKJ24kPHlKrIBoHwk+JewguAh6pyXe5T4NKht4l8p
	6L1ebL2m1nyeJcavrrG6vfJ5Dj78IpsO0NlnAlfwYhYelTCBodm6mguLU1qFlACsIN0w
	pl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gyGDUPGISfa0ma8yJ4kXIqpj7J8eGCC9t375rKVwEqw=;
	b=ZQHnJKW7hm4yQEo2cWSd/KyRk0rxdkApx6DlzXUHYjSGlnBrxK7g7jWTgB2j0zgrKO
	KsEkaK3PLOMgWB0CHK9zw4MPTNco+lKniraSS9Iw7VS+RazzVipuobt0GQkJWZ5Qxow3
	VBUxtNOqwojqF4WT2vYw6rVCLkQDMmC65CzlxZAa07dE9M2Fj7mz8YPBGCtveLxFJZPQ
	E617bQDLr9urmWwa+fG2k5nWqOzgWTphlD2mcWEcecTLo3hgLnwBZicLpz8aaPMTbbp9
	19dHPjpE5EtTwHnmuIWgY6l9AIjjAoMIMLA3YAC4fiN90DyCzFLI3DKrhmOPiEV1umbt
	YUGQ==
X-Gm-Message-State: AA6/9RkkHpRJiexl/zSAAoK78caxqnoHNNolgA6nkIZ9q7zTnfTOka+hxgcJxBFjkDrXYg1CurCMhitBMc2HNg==
X-Received: by 10.176.67.199 with SMTP id l65mr5719922ual.107.1475524515313;
	Mon, 03 Oct 2016 12:55:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Mon, 3 Oct 2016 12:55:14 -0700 (PDT)
Received: by 10.176.86.206 with HTTP; Mon, 3 Oct 2016 12:55:14 -0700 (PDT)
In-Reply-To: <CAMKF1src3Dj1p+E5p+6QEu213dkFSFMOtDKx3hoJFT+hKvHn9Q@mail.gmail.com>
References: <1475513685-18627-1-git-send-email-bruce.ashfield@windriver.com>
	<CAMKF1soRbsU8iV35jxKnRfrcvsobF20p_u14EfRZ5uee_9N+gg@mail.gmail.com>
	<CAMKF1src3Dj1p+E5p+6QEu213dkFSFMOtDKx3hoJFT+hKvHn9Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Oct 2016 12:55:14 -0700
Message-ID: <CAMKF1soOP+440ZhymX8wFHu-Et=77NhscQqm4M8T2i=wQhmGNg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 03 Oct 2016 19:55:15 -0000
Content-Type: multipart/alternative; boundary=001a114d826a97be40053dfb52ab

--001a114d826a97be40053dfb52ab
Content-Type: text/plain; charset=UTF-8

What Repercussion does this have wrt APIs headers for future. Provided this
is a local patch. I think removing header includes like this can cause
issues.

On Oct 3, 2016 9:55 AM, "Bruce Ashfield" <bruce.ashfield@windriver.com>
wrote:

commit 1fe8e0f074c [include/uapi/linux/if_tunnel.h: include linux/if.h,
linux/ip.h and linux/in6.h]
breaks the builds of net-tools.

We remove the new includes until such a time that userspace can adapt to the
new kernel headers.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...1-if_tunnel-remove-include-of-if-ip-in6.h.patch | 33
++++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_4.8.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-
headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch
b/meta/recipes-kernel/linux-libc-headers/linux-libc-
headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch
new file mode 100644
index 000000000000..f2011880dccb
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-
headers/0001-if_tunnel-remove-include-of-if-ip-in6.h.patch
@@ -0,0 +1,33 @@
+From 017ae5929312685c4c044765445bfd4d2a4abb5c Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@windriver.com>
+Date: Mon, 3 Oct 2016 12:27:57 -0400
+Subject: [PATCH] if_tunnel: remove include of if/ip/in6.h
+
+commit 1fe8e0f074c [include/uapi/linux/if_tunnel.h: include linux/if.h,
linux/ip.h and linux/in6.h]
+breaks the builds of net-tools.
+
+We remove the new includes until such a time that userspace can adapt to
the
+new kernel headers.
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
+---
+ include/uapi/linux/if_tunnel.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/include/uapi/linux/if_tunnel.h b/include/uapi/linux/if_
tunnel.h
+index 777b6cd..1046f55 100644
+--- a/include/uapi/linux/if_tunnel.h
++++ b/include/uapi/linux/if_tunnel.h
+@@ -2,9 +2,6 @@
+ #define _UAPI_IF_TUNNEL_H_
+
+ #include <linux/types.h>
+-#include <linux/if.h>
+-#include <linux/ip.h>
+-#include <linux/in6.h>
+ #include <asm/byteorder.h>
+
+
+--
+2.7.4
+
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
headers_4.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-
headers_4.8.bb
index 778f0b6e6443..ee2d8293450e 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.8.bb
@@ -10,6 +10,7 @@ SRC_URI_append_libc-musl = "\

 SRC_URI_append = "\
     file://0001-ppp-fix-in-if.h-includes.patch \
+    file://0001-if_tunnel-remove-include-of-if-ip-in6.h.patch \
     "

 SRC_URI[md5sum] = "c1af0afbd3df35c1ccdc7a5118cd2d07"
--
2.5.0

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a114d826a97be40053dfb52ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">What Repercussion does this have wrt APIs headers for future=
. Provided this is a local patch. I think removing header includes like thi=
s can cause issues. </p>
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Oct 3, 2016 9:=
55 AM, &quot;Bruce Ashfield&quot; &lt;<a href=3D"mailto:bruce.ashfield@wind=
river.com">bruce.ashfield@windriver.com</a>&gt; wrote:<br type=3D"attributi=
on"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">commit 1fe8e0f074c [include/uapi/linux/if_tunn=
el.<wbr>h: include linux/if.h, linux/ip.h and linux/in6.h]<br>
breaks the builds of net-tools.<br>
<br>
We remove the new includes until such a time that userspace can adapt to th=
e<br>
new kernel headers.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com">bruce.ashfield@windriver.com</a>&gt;<br>
---<br>
=C2=A0...1-if_tunnel-remove-include-<wbr>of-if-ip-in6.h.patch | 33 ++++++++=
++++++++++++++<br>
=C2=A0.../linux-libc-headers/<a href=3D"http://linux-libc-headers_4.8.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-<wbr>libc-headers_4.8.bb</a>=C2=
=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 34 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux-<wbr>libc-headers/linux-=
libc-<wbr>headers/0001-if_tunnel-remove-<wbr>include-of-if-ip-in6.h.patch<b=
r>
<br>
diff --git a/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>he=
aders/0001-if_tunnel-remove-<wbr>include-of-if-ip-in6.h.patch b/meta/recipe=
s-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>headers/0001-if_tunnel-rem=
ove-<wbr>include-of-if-ip-in6.h.patch<br>
new file mode 100644<br>
index 000000000000..f2011880dccb<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>headers/0=
001-if_tunnel-remove-<wbr>include-of-if-ip-in6.h.patch<br>
@@ -0,0 +1,33 @@<br>
+From 017ae5929312685c4c044765445bfd<wbr>4d2a4abb5c Mon Sep 17 00:00:00 200=
1<br>
+From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com">b=
ruce.ashfield@windriver.com</a>&gt;<br>
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
er.com">bruce.ashfield@windriver.com</a>&gt;<br>
+---<br>
+ include/uapi/linux/if_tunnel.h | 3 ---<br>
+ 1 file changed, 3 deletions(-)<br>
+<br>
+diff --git a/include/uapi/linux/if_<wbr>tunnel.h b/include/uapi/linux/if_<=
wbr>tunnel.h<br>
+index 777b6cd..1046f55 100644<br>
+--- a/include/uapi/linux/if_<wbr>tunnel.h<br>
++++ b/include/uapi/linux/if_<wbr>tunnel.h<br>
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
diff --git a/meta/recipes-kernel/linux-<wbr>libc-headers/<a href=3D"http://=
linux-libc-headers_4.8.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-=
<wbr>headers_4.8.bb</a> b/meta/recipes-kernel/linux-<wbr>libc-headers/<a hr=
ef=3D"http://linux-libc-headers_4.8.bb" rel=3D"noreferrer" target=3D"_blank=
">linux-libc-<wbr>headers_4.8.bb</a><br>
index 778f0b6e6443..ee2d8293450e 100644<br>
--- a/meta/recipes-kernel/linux-<wbr>libc-headers/<a href=3D"http://linux-l=
ibc-headers_4.8.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-<wbr>he=
aders_4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux-<wbr>libc-headers/<a href=3D"http://linux-l=
ibc-headers_4.8.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-<wbr>he=
aders_4.8.bb</a><br>
@@ -10,6 +10,7 @@ SRC_URI_append_libc-musl =3D &quot;\<br>
<br>
=C2=A0SRC_URI_append =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0001-ppp-fix-in-if.h-<wbr>includes.patch \<br>
+=C2=A0 =C2=A0 file://0001-if_tunnel-remove-<wbr>include-of-if-ip-in6.h.pat=
ch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>c1af0afbd3df35c1ccdc7a5118cd2d<wbr>07&=
quot;<br>
<font color=3D"#888888">--<br>
2.5.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></blockquote></div><br></div>

--001a114d826a97be40053dfb52ab--
