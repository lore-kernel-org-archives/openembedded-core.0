Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 812C274554
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 20:34:17 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id d1-v6so54529295wrj.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 13:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8BQPPd0RDu64OxUj3nzbz8r9OaXazT2u808C4gmrW5k=;
	b=n+qM+dOMuhxYITzUaGNEpJM4lfZyEnXXUqLFBS1NoAcUkhqnjyZtVKuXz/Ol9JajOz
	fdAdYHl6o1W5zgf8vBBBmz/R0nKxs2fwRvSTsEO1qoWRPeGNos5M1ckW4m3uo6BgplJT
	OiYyNxTAr8ZM98q/vGz22odV8Gw+K7c26gRGPrq074DsiAwqTSJfdzG17HOkAyAYHIim
	L2fCwWAoPhSkFu2lDH77vN0zkTXklgIcfrkBkJwRZwRgVcpuFJ1fDLD82sqsZpOBRzeC
	oAFmRXpZl0RtXNZzS2rEuddQ52FYiuYae6gjBb2IolLI9yyc7jjGGO4nSn8kOeMrrAET
	qM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8BQPPd0RDu64OxUj3nzbz8r9OaXazT2u808C4gmrW5k=;
	b=U6VU/Ug+lnrbFTmfH8ZHSdRAmRdkCOC0Iou+pPNRwPdyZqv4qB5OIWjF8kkSugEkxP
	GCeqMsqYpFdliJv3zkPrd/YVLyCCGFFKvyJBV4zT5X6od4hpUECc+5mwZRKMhzYVofOU
	lBjEIWnaFfDFqC6L+8messV94elu39XyRxSzqJLjRNjDdg4XI0WWx+d39bwFcCbvKQL0
	gfzO+LXkiWLEeQJDxTMuZP1RNDWxsK984Y0s1FVHftJnujtr4qcziXsp5OdYJIprqU+O
	r0oShbAcwnq3sgLKJQ9UiFuNUMAs3Yz+6Sa8LGTJQcdr+YOcI2GJdzR4UhvWJiQo3Bn+
	s+TQ==
X-Gm-Message-State: ALQs6tBgpCxxNCxy4C6+lcml9Rq7jE4zCJvIQMHIpGg+r7MKZEYYI+vH
	/eefWgoSxWztsjiR3xpIZHyG5Lfe9knGvDBx6VIftA==
X-Google-Smtp-Source: AIpwx49OkF2f0MIeSariqxQYvwIv900RCAZyjwUJebNPFlyVyEGmvj9LymNDPc6J9qrRYxVUJ+SGqCXCcI4Jvj3tTyc=
X-Received: by 2002:adf:ea8a:: with SMTP id
	s10-v6mr17627115wrm.223.1524687036321; 
	Wed, 25 Apr 2018 13:10:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Wed, 25 Apr 2018 13:10:35 -0700 (PDT)
In-Reply-To: <1524555471-8816-1-git-send-email-hongxu.jia@windriver.com>
References: <1524555471-8816-1-git-send-email-hongxu.jia@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 Apr 2018 22:10:35 +0200
Message-ID: <CA+chaQcMOcc_uvyibBzwXqdRXw1F5ybuK_UipOGxcO=nA4oWPA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemu: fix CVE-2017-16845
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
X-List-Received-Date: Wed, 25 Apr 2018 20:34:18 -0000
Content-Type: multipart/alternative; boundary="0000000000003195c8056ab1ddbc"

--0000000000003195c8056ab1ddbc
Content-Type: text/plain; charset="UTF-8"

FWIW: in
http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu I
have WIP qemu upgrade to 2.12.0 which includes this fix as well.

On Tue, Apr 24, 2018 at 9:37 AM, Hongxu Jia <hongxu.jia@windriver.com>
wrote:

> During Qemu guest migration, a destination process invokes ps2
> post_load function. In that, if 'rptr' and 'count' values were
> invalid, it could lead to OOB access or infinite loop issue.
> Add check to avoid it.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...ck-PS2Queue-pointers-in-post_load-routine.patch | 63
> ++++++++++++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.11.1.bb          |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/
> qemu/check-PS2Queue-pointers-in-post_load-routine.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch
> b/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-
> in-post_load-routine.patch
> new file mode 100644
> index 0000000..f8d7f66
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-
> in-post_load-routine.patch
> @@ -0,0 +1,63 @@
> +From ee9a17d0e12143971a9676227cce953c0dbe52fb Mon Sep 17 00:00:00 2001
> +From: Prasad J Pandit <pjp@fedoraproject.org>
> +Date: Thu, 16 Nov 2017 13:21:55 +0530
> +Subject: [PATCH] ps2: check PS2Queue pointers in post_load routine
> +
> +During Qemu guest migration, a destination process invokes ps2
> +post_load function. In that, if 'rptr' and 'count' values were
> +invalid, it could lead to OOB access or infinite loop issue.
> +Add check to avoid it.
> +
> +Reported-by: Cyrille Chatras <cyrille.chatras@orange.com>
> +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> +Message-id: 20171116075155.22378-1-ppandit@redhat.com
> +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> +
> +CVE: CVE-2017-16845
> +Upstream-Status: Backport
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + hw/input/ps2.c | 21 +++++++++------------
> + 1 file changed, 9 insertions(+), 12 deletions(-)
> +
> +diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> +index f388a23..de171a2 100644
> +--- a/hw/input/ps2.c
> ++++ b/hw/input/ps2.c
> +@@ -1225,24 +1225,21 @@ static void ps2_common_reset(PS2State *s)
> + static void ps2_common_post_load(PS2State *s)
> + {
> +     PS2Queue *q = &s->queue;
> +-    int size;
> +-    int i;
> +-    int tmp_data[PS2_QUEUE_SIZE];
> ++    uint8_t i, size;
> ++    uint8_t tmp_data[PS2_QUEUE_SIZE];
> +
> +     /* set the useful data buffer queue size, < PS2_QUEUE_SIZE */
> +-    size = q->count > PS2_QUEUE_SIZE ? 0 : q->count;
> ++    size = (q->count < 0 || q->count > PS2_QUEUE_SIZE) ? 0 : q->count;
> +
> +     /* move the queue elements to the start of data array */
> +-    if (size > 0) {
> +-        for (i = 0; i < size; i++) {
> +-            /* move the queue elements to the temporary buffer */
> +-            tmp_data[i] = q->data[q->rptr];
> +-            if (++q->rptr == 256) {
> +-                q->rptr = 0;
> +-            }
> ++    for (i = 0; i < size; i++) {
> ++        if (q->rptr < 0 || q->rptr >= sizeof(q->data)) {
> ++            q->rptr = 0;
> +         }
> +-        memcpy(q->data, tmp_data, size);
> ++        tmp_data[i] = q->data[q->rptr++];
> +     }
> ++    memcpy(q->data, tmp_data, size);
> ++
> +     /* reset rptr/wptr/count */
> +     q->rptr = 0;
> +     q->wptr = size;
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> index f4b7d69..ab82c5f 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> @@ -22,6 +22,7 @@ SRC_URI = "http://wiki.qemu-project.org/
> download/${BP}.tar.bz2 \
>             file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
> \
>             file://memfd.patch \
>             file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
> \
> +           file://check-PS2Queue-pointers-in-post_load-routine.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003195c8056ab1ddbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: in=C2=A0<a href=3D"http://git.openembedded.org/opene=
mbedded-core-contrib/log/?h=3Djansa/qemu">http://git.openembedded.org/opene=
mbedded-core-contrib/log/?h=3Djansa/qemu</a> I have WIP qemu upgrade to 2.1=
2.0 which includes this fix as well.</div><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Tue, Apr 24, 2018 at 9:37 AM, Hongxu Jia <span =
dir=3D"ltr">&lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D"_blan=
k">hongxu.jia@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">During Qemu guest migration, a destination process invokes ps2<br>
post_load function. In that, if &#39;rptr&#39; and &#39;count&#39; values w=
ere<br>
invalid, it could lead to OOB access or infinite loop issue.<br>
Add check to avoid it.<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0...ck-PS2Queue-pointers-in-<wbr>post_load-routine.patch | 63 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.11.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">qem<wbr>u_2.11.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 64 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/check-PS2Queu=
e-pointers-<wbr>in-post_load-routine.patch<br>
<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/check-PS2Queue-pointers-<=
wbr>in-post_load-routine.patch b/meta/recipes-devtools/qemu/<wbr>qemu/check=
-PS2Queue-pointers-<wbr>in-post_load-routine.patch<br>
new file mode 100644<br>
index 0000000..f8d7f66<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/<wbr>qemu/check-PS2Queue-pointers-<wbr>in-=
post_load-routine.patch<br>
@@ -0,0 +1,63 @@<br>
+From ee9a17d0e12143971a9676227cce95<wbr>3c0dbe52fb Mon Sep 17 00:00:00 200=
1<br>
+From: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.org">pjp@fed=
oraproject.org</a>&gt;<br>
+Date: Thu, 16 Nov 2017 13:21:55 +0530<br>
+Subject: [PATCH] ps2: check PS2Queue pointers in post_load routine<br>
+<br>
+During Qemu guest migration, a destination process invokes ps2<br>
+post_load function. In that, if &#39;rptr&#39; and &#39;count&#39; values =
were<br>
+invalid, it could lead to OOB access or infinite loop issue.<br>
+Add check to avoid it.<br>
+<br>
+Reported-by: Cyrille Chatras &lt;<a href=3D"mailto:cyrille.chatras@orange.=
com">cyrille.chatras@orange.com</a>&gt;<br>
+Signed-off-by: Prasad J Pandit &lt;<a href=3D"mailto:pjp@fedoraproject.org=
">pjp@fedoraproject.org</a>&gt;<br>
+Message-id: <a href=3D"mailto:20171116075155.22378-1-ppandit@redhat.com">2=
0171116075155.22378-1-<wbr>ppandit@redhat.com</a><br>
+Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">krax=
el@redhat.com</a>&gt;<br>
+<br>
+CVE: CVE-2017-16845<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ hw/input/ps2.c | 21 +++++++++------------<br>
+ 1 file changed, 9 insertions(+), 12 deletions(-)<br>
+<br>
+diff --git a/hw/input/ps2.c b/hw/input/ps2.c<br>
+index f388a23..de171a2 100644<br>
+--- a/hw/input/ps2.c<br>
++++ b/hw/input/ps2.c<br>
+@@ -1225,24 +1225,21 @@ static void ps2_common_reset(PS2State *s)<br>
+ static void ps2_common_post_load(PS2State *s)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0PS2Queue *q =3D &amp;s-&gt;queue;<br>
+-=C2=A0 =C2=A0 int size;<br>
+-=C2=A0 =C2=A0 int i;<br>
+-=C2=A0 =C2=A0 int tmp_data[PS2_QUEUE_SIZE];<br>
++=C2=A0 =C2=A0 uint8_t i, size;<br>
++=C2=A0 =C2=A0 uint8_t tmp_data[PS2_QUEUE_SIZE];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/* set the useful data buffer queue size, &lt; PS2_QUE=
UE_SIZE */<br>
+-=C2=A0 =C2=A0 size =3D q-&gt;count &gt; PS2_QUEUE_SIZE ? 0 : q-&gt;count;=
<br>
++=C2=A0 =C2=A0 size =3D (q-&gt;count &lt; 0 || q-&gt;count &gt; PS2_QUEUE_=
SIZE) ? 0 : q-&gt;count;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/* move the queue elements to the start of data array =
*/<br>
+-=C2=A0 =C2=A0 if (size &gt; 0) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; size; i++) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* move the queue elements to t=
he temporary buffer */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_data[i] =3D q-&gt;data[q-&g=
t;rptr];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (++q-&gt;rptr =3D=3D 256) {<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q-&gt;rptr =3D 0;=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 for (i =3D 0; i &lt; size; i++) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (q-&gt;rptr &lt; 0 || q-&gt;rptr &gt;=3D s=
izeof(q-&gt;data)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q-&gt;rptr =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(q-&gt;data, tmp_data, size);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_data[i] =3D q-&gt;data[q-&gt;rptr++];<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 memcpy(q-&gt;data, tmp_data, size);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0/* reset rptr/wptr/count */<br>
+=C2=A0 =C2=A0 =C2=A0q-&gt;rptr =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0q-&gt;wptr =3D size;<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.11.1.bb" r=
el=3D"noreferrer" target=3D"_blank">q<wbr>emu_2.11.1.bb</a> b/meta/recipes-=
devtools/qemu/<a href=3D"http://qemu_2.11.1.bb" rel=3D"noreferrer" target=
=3D"_blank">q<wbr>emu_2.11.1.bb</a><br>
index f4b7d69..ab82c5f 100644<br>
--- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.11.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">q<wbr>emu_2.11.1.bb</a><br>
+++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.11.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">q<wbr>emu_2.11.1.bb</a><br>
@@ -22,6 +22,7 @@ SRC_URI =3D &quot;<a href=3D"http://wiki.qemu-project.org=
/download/${BP}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://wiki.q=
emu-project.org/<wbr>download/${BP}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linux-user-Fix-<wbr>webkit=
gtk-hangs-on-32-bit-x86-<wbr>target.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://memfd.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-arm-translate-a64-<wb=
r>treat-DISAS_UPDATE-as-variant-<wbr>of-D.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://check-PS2Queue-<wbr>pointe=
rs-in-post_load-routine.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+\..*)\.tar&quot=
;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">=C2=A0<br>
-- <br>
2.7.4<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--0000000000003195c8056ab1ddbc--
