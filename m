Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0140B65CC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 16:25:34 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id k22so22608203iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qNXjW8GBbKxPo2uqrqGOTaDRFDOnDosIuFSKTsKwWA4=;
	b=jGhp78x01bzH2IgYKB+KG/6I6OfKrrfrhUabcyXg5uEatiG7GomgP7ZEq+giwp3V0B
	6AyQ4kyrUCzkcQsYprHDEkGPntw2xy6yK2q+ZCk+VjZ/K7rXIvMg+ElgQ0eyZSZv41S7
	2KbjYWflIMhVl5Ggez/hqizz6SUg0rkon4OpqFhJUMsjD8P1Fh3rZVngaaqg3I7keIna
	rIOI+Q0AT4RjeV1kluHnTiavV73dvvQQX5s17cpGa8Vc9Dly5nCTfth3NtfcrnEqCOCC
	K0Z4HjJVbh/EYMEcqvEA+QM377EdwRM1WajwKbQDu5HWbHJqJgBNCGfG4Jqn3PcBRyYt
	ojVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qNXjW8GBbKxPo2uqrqGOTaDRFDOnDosIuFSKTsKwWA4=;
	b=ENXU+Lw/70LuSBWLcHHjND1v8iiEwYbGo89KfDz/PV8zUYdPdUg4J3RE+Ag7upioZt
	esVUsjqjnwd0OUOJehlJbD/MTnehTVg+fcHC0MxxPDi2mocWwUmVpy2PwqBpI+d63Txj
	oYMpYNlrT7Lq00dN46zNvEpt2KMdpLOQpW39s7NT3tY5CQmp4RLFiySVmg/CRBRwgQvz
	ztBxB2DXKwORQK/ptJgugYNfIGl2jXdvgGZWA1U0p7yuIRNaSJGb2vAwryezci0FssRR
	6bajn6YqBNuO2uj3C+npZ/P6nHhZ5Lo4W7/kzJjsX/w9FyveAmJq5g/fPEtRrsULH89v
	Bd7w==
X-Gm-Message-State: AHYfb5jEAwMVqsXkj3Fug3SKQS6HYfH6cQ9iRo8htnAgaz/fIIlRbwxk
	LAFkPjEs8GrKGKcSkkVygQbUP5QchnRE
X-Received: by 10.36.224.197 with SMTP id c188mr5341806ith.18.1504023935856;
	Tue, 29 Aug 2017 09:25:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Tue, 29 Aug 2017 09:25:15 -0700 (PDT)
In-Reply-To: <1503317134-13872-1-git-send-email-sona.sarmadi@enea.com>
References: <1503317134-13872-1-git-send-email-sona.sarmadi@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Aug 2017 17:25:15 +0100
Message-ID: <CAJTo0LZ_wAEpmLz9WD3VrJMqG-F-gW3zoSU10+7p8mR4E7mGdw@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: Fix for CVE-2017-12865
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
X-List-Received-Date: Tue, 29 Aug 2017 16:25:35 -0000
Content-Type: multipart/alternative; boundary="94eb2c19e0f46e5a750557e6dc00"

--94eb2c19e0f46e5a750557e6dc00
Content-Type: text/plain; charset="UTF-8"

This is now in master, will you also submit backports for the stable
branches?

Ross

On 21 August 2017 at 13:05, Sona Sarmadi <sona.sarmadi@enea.com> wrote:

> dnsproxy: Fix crash on malformed DNS response
> If the response query string is malformed, we might access memory
> pass the end of "name" variable in parse_response().
>
> [YOCTO #11959]
>
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>  .../connman/connman/CVE-2017-12865.patch           | 87
> ++++++++++++++++++++++
>  meta/recipes-connectivity/connman/connman_1.34.bb  |  1 +
>  2 files changed, 88 insertions(+)
>  create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2017-
> 12865.patch
>
> diff --git a/meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch
> b/meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch
> new file mode 100644
> index 0000000..45f78f1
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/CVE-2017-12865.patch
> @@ -0,0 +1,87 @@
> +From 5c281d182ecdd0a424b64f7698f32467f8f67b71 Mon Sep 17 00:00:00 2001
> +From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> +Date: Wed, 9 Aug 2017 10:16:46 +0300
> +Subject: dnsproxy: Fix crash on malformed DNS response
> +
> +If the response query string is malformed, we might access memory
> +pass the end of "name" variable in parse_response().
> +
> +CVE: CVE-2017-12865
> +Upstream-Status: Backport [https://git.kernel.org/pub/
> scm/network/connman/connman.git/patch/?id=5c281d182ecdd0a424b64f7698f324
> 67f8f67b71]
> +
> +Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> +---
> + src/dnsproxy.c | 16 ++++++++++------
> + 1 file changed, 10 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/dnsproxy.c b/src/dnsproxy.c
> +index 38ac5bf..40b4f15 100644
> +--- a/src/dnsproxy.c
> ++++ b/src/dnsproxy.c
> +@@ -838,7 +838,7 @@ static struct cache_entry *cache_check(gpointer
> request, int *qtype, int proto)
> + static int get_name(int counter,
> +               unsigned char *pkt, unsigned char *start, unsigned char
> *max,
> +               unsigned char *output, int output_max, int *output_len,
> +-              unsigned char **end, char *name, int *name_len)
> ++              unsigned char **end, char *name, size_t max_name, int
> *name_len)
> + {
> +       unsigned char *p;
> +
> +@@ -859,7 +859,7 @@ static int get_name(int counter,
> +
> +                       return get_name(counter + 1, pkt, pkt + offset,
> max,
> +                                       output, output_max, output_len,
> end,
> +-                                      name, name_len);
> ++                                      name, max_name, name_len);
> +               } else {
> +                       unsigned label_len = *p;
> +
> +@@ -869,6 +869,9 @@ static int get_name(int counter,
> +                       if (*output_len > output_max)
> +                               return -ENOBUFS;
> +
> ++                      if ((*name_len + 1 + label_len + 1) > max_name)
> ++                              return -ENOBUFS;
> ++
> +                       /*
> +                        * We need the original name in order to check
> +                        * if this answer is the correct one.
> +@@ -900,14 +903,14 @@ static int parse_rr(unsigned char *buf, unsigned
> char *start,
> +                       unsigned char *response, unsigned int
> *response_size,
> +                       uint16_t *type, uint16_t *class, int *ttl, int
> *rdlen,
> +                       unsigned char **end,
> +-                      char *name)
> ++                      char *name, size_t max_name)
> + {
> +       struct domain_rr *rr;
> +       int err, offset;
> +       int name_len = 0, output_len = 0, max_rsp = *response_size;
> +
> +       err = get_name(0, buf, start, max, response, max_rsp,
> +-              &output_len, end, name, &name_len);
> ++                      &output_len, end, name, max_name, &name_len);
> +       if (err < 0)
> +               return err;
> +
> +@@ -1033,7 +1036,8 @@ static int parse_response(unsigned char *buf, int
> buflen,
> +               memset(rsp, 0, sizeof(rsp));
> +
> +               ret = parse_rr(buf, ptr, buf + buflen, rsp, &rsp_len,
> +-                      type, class, ttl, &rdlen, &next, name);
> ++                      type, class, ttl, &rdlen, &next, name,
> ++                      sizeof(name) - 1);
> +               if (ret != 0) {
> +                       err = ret;
> +                       goto out;
> +@@ -1099,7 +1103,7 @@ static int parse_response(unsigned char *buf, int
> buflen,
> +                        */
> +                       ret = get_name(0, buf, next - rdlen, buf + buflen,
> +                                       rsp, rsp_len, &output_len, &end,
> +-                                      name, &name_len);
> ++                                      name, sizeof(name) - 1, &name_len);
> +                       if (ret != 0) {
> +                               /* just ignore the error at this point */
> +                               ptr = next;
> +--
> +cgit v1.1
> +
> diff --git a/meta/recipes-connectivity/connman/connman_1.34.bb
> b/meta/recipes-connectivity/connman/connman_1.34.bb
> index 868f940..dc2c688 100644
> --- a/meta/recipes-connectivity/connman/connman_1.34.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.34.bb
> @@ -7,6 +7,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz
> \
>              file://connman \
>              file://no-version-scripts.patch \
>              file://includes.patch \
> +            file://CVE-2017-12865.patch \
>              "
>  SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch
> \
>                               "
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c19e0f46e5a750557e6dc00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is now in master, will you also submit backports for =
the stable branches?<div><br></div><div>Ross</div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On 21 August 2017 at 13:05, Sona Sar=
madi <span dir=3D"ltr">&lt;<a href=3D"mailto:sona.sarmadi@enea.com" target=
=3D"_blank">sona.sarmadi@enea.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">dnsproxy: Fix crash on malformed DNS response<br>
If the response query string is malformed, we might access memory<br>
pass the end of &quot;name&quot; variable in parse_response().<br>
<br>
[YOCTO #11959]<br>
<br>
Signed-off-by: Sona Sarmadi &lt;<a href=3D"mailto:sona.sarmadi@enea.com">so=
na.sarmadi@enea.com</a>&gt;<br>
---<br>
=C2=A0.../connman/connman/CVE-2017-<wbr>12865.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 87 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-connectivity/<wbr>connman/<a href=3D"http://connman_1.34=
.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.34.bb</a>=C2=A0 |=C2=A0=
 1 +<br>
=C2=A02 files changed, 88 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/<wbr>connman/connman/CVE=
-2017-<wbr>12865.patch<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>connman/connman/CVE-2017-<wbr>1=
2865.patch b/meta/recipes-connectivity/<wbr>connman/connman/CVE-2017-<wbr>1=
2865.patch<br>
new file mode 100644<br>
index 0000000..45f78f1<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/<wbr>connman/connman/CVE-2017-<wbr>12865.pa=
tch<br>
@@ -0,0 +1,87 @@<br>
+From 5c281d182ecdd0a424b64f7698f324<wbr>67f8f67b71 Mon Sep 17 00:00:00 200=
1<br>
+From: Jukka Rissanen &lt;<a href=3D"mailto:jukka.rissanen@linux.intel.com"=
>jukka.rissanen@linux.intel.<wbr>com</a>&gt;<br>
+Date: Wed, 9 Aug 2017 10:16:46 +0300<br>
+Subject: dnsproxy: Fix crash on malformed DNS response<br>
+<br>
+If the response query string is malformed, we might access memory<br>
+pass the end of &quot;name&quot; variable in parse_response().<br>
+<br>
+CVE: CVE-2017-12865<br>
+Upstream-Status: Backport [<a href=3D"https://git.kernel.org/pub/scm/netwo=
rk/connman/connman.git/patch/?id=3D5c281d182ecdd0a424b64f7698f32467f8f67b71=
" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/<wbr>scm/=
network/connman/connman.<wbr>git/patch/?id=3D<wbr>5c281d182ecdd0a424b64f769=
8f324<wbr>67f8f67b71</a>]<br>
+<br>
+Signed-off-by: Sona Sarmadi &lt;<a href=3D"mailto:sona.sarmadi@enea.com">s=
ona.sarmadi@enea.com</a>&gt;<br>
+---<br>
+ src/dnsproxy.c | 16 ++++++++++------<br>
+ 1 file changed, 10 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c<br>
+index 38ac5bf..40b4f15 100644<br>
+--- a/src/dnsproxy.c<br>
++++ b/src/dnsproxy.c<br>
+@@ -838,7 +838,7 @@ static struct cache_entry *cache_check(gpointer reques=
t, int *qtype, int proto)<br>
+ static int get_name(int counter,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *pkt,=
 unsigned char *start, unsigned char *max,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *outp=
ut, int output_max, int *output_len,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char **end, cha=
r *name, int *name_len)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char **end, cha=
r *name, size_t max_name, int *name_len)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *p;<br>
+<br>
+@@ -859,7 +859,7 @@ static int get_name(int counter,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return get_name(counter + 1, pkt, pkt + offset, max,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output, o=
utput_max, output_len, end,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, name_len)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, max_name,=
 name_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned label_len =3D *p;<br>
+<br>
+@@ -869,6 +869,9 @@ static int get_name(int counter,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (*output_len &gt; output_max)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOBUFS;<br>
+<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if ((*name_len + 1 + label_len + 1) &gt; max_name)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOBUFS;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * We need the original name in order to check<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * if this answer is the correct one.<br>
+@@ -900,14 +903,14 @@ static int parse_rr(unsigned char *buf, unsigned cha=
r *start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned char *response, unsigned int *response_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0uint16_t *type, uint16_t *class, int *ttl, int *rdlen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned char **end,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char *name)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 char *name, size_t max_name)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct domain_rr *rr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err, offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int name_len =3D 0, output_len =3D 0, max_rsp =
=3D *response_size;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D get_name(0, buf, start, max, response, =
max_rsp,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;output_len, end, na=
me, &amp;name_len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;output_len, end, name, max_name, &amp;name_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+<br>
+@@ -1033,7 +1036,8 @@ static int parse_response(unsigned char *buf, int bu=
flen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(rsp, 0, size=
of(rsp));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D parse_rr(bu=
f, ptr, buf + buflen, rsp, &amp;rsp_len,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 type, class, ttl, &amp;rdlen, &amp;next, name);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 type, class, ttl, &amp;rdlen, &amp;next, name,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof(name) - 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0err =3D ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto out;<br>
+@@ -1099,7 +1103,7 @@ static int parse_response(unsigned char *buf, int bu=
flen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D get_name(0, buf, next - rdlen, buf + buflen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rsp, rsp_=
len, &amp;output_len, &amp;end,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, &amp;name=
_len);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name, sizeof(na=
me) - 1, &amp;name_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ret !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* just ignore the error at this poin=
t */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D next;<br>
+--<br>
+cgit v1.1<br>
+<br>
diff --git a/meta/recipes-connectivity/<wbr>connman/<a href=3D"http://connm=
an_1.34.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.34.bb</a> b/meta=
/recipes-connectivity/<wbr>connman/<a href=3D"http://connman_1.34.bb" rel=
=3D"noreferrer" target=3D"_blank">connman_1.34.bb</a><br>
index 868f940..dc2c688 100644<br>
--- a/meta/recipes-connectivity/<wbr>connman/<a href=3D"http://connman_1.34=
.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.34.bb</a><br>
+++ b/meta/recipes-connectivity/<wbr>connman/<a href=3D"http://connman_1.34=
.bb" rel=3D"noreferrer" target=3D"_blank">connman_1.34.bb</a><br>
@@ -7,6 +7,7 @@ SRC_URI=C2=A0 =3D &quot;${KERNELORG_MIRROR}/linux/<wbr>netw=
ork/${BPN}/${BP}.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://connman \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-version-scripts.<=
wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://includes.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2017-12865.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://0002-resolve-musl-does-<wb=
r>not-implement-res_ninit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c19e0f46e5a750557e6dc00--
