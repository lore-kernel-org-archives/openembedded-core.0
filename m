Return-Path: <gary.robertson@linaro.org>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id A97346084E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 21:35:48 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so79357wib.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=/i/ScCAt6hCFqWJ7CDVSJFo3S5irP8WSGEK4s+Zs0rM=;
	b=OylX1Tg7HW2ShglkG89aI/Yf0o4np+OvbKicxhimpakaHkiFJwcSv50+/bVw22si2d
	RuOJD5F99FcPvsytk3jWAe+65QL30ZEDaM+4wB+AOosKXoJ23v2wuVxoH74XpnukrWLc
	8cCR39Or1wCYbngwWafdMbMxhbeDOj+8zEgAdk1Ya+NxTt/5DV5wimWbxHn5yQMh5Je7
	HM5/nFQABUHEQpoz7+KxPaJxA6W3sJvqqjfbdLZnrIvfuzXpmYo2iiaY31bCTz/VAILK
	/X4++5DPsQcCNLltJcheDZXsUS5aLjAddio31eU7WeztYBXS+I9im0l3nnnyShpWRenP
	fWkQ==
X-Gm-Message-State: ALoCoQkpP4nIWHZsry+AFsnr51Apn3JQ4UyAHi9I8WBBgGMGkQzSxy+tDihP9vpqZl6WgAkPnkz+
MIME-Version: 1.0
X-Received: by 10.180.80.105 with SMTP id q9mr50082260wix.39.1408052149108;
	Thu, 14 Aug 2014 14:35:49 -0700 (PDT)
Received: by 10.216.120.72 with HTTP; Thu, 14 Aug 2014 14:35:49 -0700 (PDT)
In-Reply-To: <1406326845-17506-3-git-send-email-gary.robertson@linaro.org>
References: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
	<1406326845-17506-3-git-send-email-gary.robertson@linaro.org>
Date: Thu, 14 Aug 2014 16:35:49 -0500
Message-ID: <CAF7YWnwyb9LFBVcjco4TBG+ByDGOExwR7J1XP=iALqkZy8hiTA@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Mike Holmes <mike.holmes@linaro.org>
Subject: Re: [PATCH 2/3] LTP: pthread_cond_many - fix uninitialized return in parse_args
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
X-List-Received-Date: Thu, 14 Aug 2014 21:35:51 -0000
Content-Type: multipart/alternative; boundary=f46d04428e3e2c5fe905009db0da

--f46d04428e3e2c5fe905009db0da
Content-Type: text/plain; charset=UTF-8

I wish to drop this patch thread and re-submit the patches individually
rather than as a group - thanks.


On Fri, Jul 25, 2014 at 5:20 PM, Gary S. Robertson <
gary.robertson@linaro.org> wrote:

> From: "Gary S. Robertson" <gary.robertson@linaro.org>
>
> The parse_args() function in realtime test pthread_cond_many contains
> a switch statement im which some cases failed to initialize the
> function return variable prior to returning... added an init clause
> to the definition statement for the return variable.
>
> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  ...d_many-fix-uninitialized-return-in-option.patch |   31
> ++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-uninitialized-return-in-option.patch
>
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-uninitialized-return-in-option.patch
> b/meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-uninitialized-return-in-option.patch
> new file mode 100644
> index 0000000..90c9d8e
> --- /dev/null
> +++
> b/meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-uninitialized-return-in-option.patch
> @@ -0,0 +1,31 @@
> +From 409c00bf4484d40380947fd27329b64ebee29874 Mon Sep 17 00:00:00 2001
> +From: "Gary S. Robertson" <gary.robertson@linaro.org>
> +Date: Fri, 25 Jul 2014 09:41:51 -0500
> +Subject: [PATCH] pthread_cond_many: fix uninitialized return in option
> + handling
> +
> +Some of the cases in the switch statement in parse_args() did not
> +initialize the 'handled' variable which is returned by the function.
> +Added an initialization to the definition of the variable.
> +
> +Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> +---
> + .../realtime/perf/latency/pthread_cond_many.c      |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/testcases/realtime/perf/latency/pthread_cond_many.c
> b/testcases/realtime/perf/latency/pthread_cond_many.c
> +index f9325b5..1d39100 100644
> +--- a/testcases/realtime/perf/latency/pthread_cond_many.c
> ++++ b/testcases/realtime/perf/latency/pthread_cond_many.c
> +@@ -256,7 +256,7 @@ void usage(void)
> +
> + int parse_args(int c, char *v)
> + {
> +-      int handled;
> ++      int handled = 1;
> +       switch (c) {
> +       case 'h':
> +               usage();
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb
> b/meta/recipes-extended/ltp/ltp_20140422.bb
> index 2ac2187..f86a195 100644
> --- a/meta/recipes-extended/ltp/ltp_20140422.bb
> +++ b/meta/recipes-extended/ltp/ltp_20140422.bb
> @@ -27,6 +27,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>      file://ltp-Do-not-link-against-libfl.patch \
>      file://automake-foreign.patch \
>      file://0001-Allow-mutex-initialization-without-PI-configured.patch \
> +
>  file://0001-pthread_cond_many-fix-uninitialized-return-in-option.patch \
>  "
>
>  S = "${WORKDIR}/git"
> --
> 1.7.9.5
>
>

--f46d04428e3e2c5fe905009db0da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I wish to drop this patch thread and re-submit the patches=
 individually rather than as a group - thanks.<br></div><div class=3D"gmail=
_extra"><br><br><div class=3D"gmail_quote">On Fri, Jul 25, 2014 at 5:20 PM,=
 Gary S. Robertson <span dir=3D"ltr">&lt;<a href=3D"mailto:gary.robertson@l=
inaro.org" target=3D"_blank">gary.robertson@linaro.org</a>&gt;</span> wrote=
:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: &quot;Gary S. Robertson&quot; &lt;<a h=
ref=3D"mailto:gary.robertson@linaro.org">gary.robertson@linaro.org</a>&gt;<=
br>

<br>
The parse_args() function in realtime test pthread_cond_many contains<br>
a switch statement im which some cases failed to initialize the<br>
function return variable prior to returning... added an init clause<br>
to the definition statement for the return variable.<br>
<br>
Signed-off-by: Gary S. Robertson &lt;<a href=3D"mailto:gary.robertson@linar=
o.org">gary.robertson@linaro.org</a>&gt;<br>
---<br>
=C2=A0...d_many-fix-uninitialized-return-in-option.patch | =C2=A0 31 ++++++=
++++++++++++++<br>
=C2=A0meta/recipes-extended/ltp/<a href=3D"http://ltp_20140422.bb" target=
=3D"_blank">ltp_20140422.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A01 +<br>
=C2=A02 files changed, 32 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/0001-pthread_cond_ma=
ny-fix-uninitialized-return-in-option.patch<br>
<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-unini=
tialized-return-in-option.patch b/meta/recipes-extended/ltp/ltp/0001-pthrea=
d_cond_many-fix-uninitialized-return-in-option.patch<br>
new file mode 100644<br>
index 0000000..90c9d8e<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-pthread_cond_many-fix-uninitialize=
d-return-in-option.patch<br>
@@ -0,0 +1,31 @@<br>
+From 409c00bf4484d40380947fd27329b64ebee29874 Mon Sep 17 00:00:00 2001<br>
+From: &quot;Gary S. Robertson&quot; &lt;<a href=3D"mailto:gary.robertson@l=
inaro.org">gary.robertson@linaro.org</a>&gt;<br>
+Date: Fri, 25 Jul 2014 09:41:51 -0500<br>
+Subject: [PATCH] pthread_cond_many: fix uninitialized return in option<br>
+ handling<br>
+<br>
+Some of the cases in the switch statement in parse_args() did not<br>
+initialize the &#39;handled&#39; variable which is returned by the functio=
n.<br>
+Added an initialization to the definition of the variable.<br>
+<br>
+Signed-off-by: Gary S. Robertson &lt;<a href=3D"mailto:gary.robertson@lina=
ro.org">gary.robertson@linaro.org</a>&gt;<br>
+---<br>
+ .../realtime/perf/latency/pthread_cond_many.c =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/testcases/realtime/perf/latency/pthread_cond_many.c b/testcas=
es/realtime/perf/latency/pthread_cond_many.c<br>
+index f9325b5..1d39100 100644<br>
+--- a/testcases/realtime/perf/latency/pthread_cond_many.c<br>
++++ b/testcases/realtime/perf/latency/pthread_cond_many.c<br>
+@@ -256,7 +256,7 @@ void usage(void)<br>
+<br>
+ int parse_args(int c, char *v)<br>
+ {<br>
+- =C2=A0 =C2=A0 =C2=A0int handled;<br>
++ =C2=A0 =C2=A0 =C2=A0int handled =3D 1;<br>
+ =C2=A0 =C2=A0 =C2=A0 switch (c) {<br>
+ =C2=A0 =C2=A0 =C2=A0 case &#39;h&#39;:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usage();<br>
+--<br>
+1.7.9.5<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20140422.bb" t=
arget=3D"_blank">ltp_20140422.bb</a> b/meta/recipes-extended/ltp/<a href=3D=
"http://ltp_20140422.bb" target=3D"_blank">ltp_20140422.bb</a><br>
index 2ac2187..f86a195 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20140422.bb" target=
=3D"_blank">ltp_20140422.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20140422.bb" target=
=3D"_blank">ltp_20140422.bb</a><br>
@@ -27,6 +27,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/linu=
x-test-project/ltp.git" target=3D"_blank">github.com/linux-test-project/ltp=
.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://ltp-Do-not-link-against-libfl.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://automake-foreign.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Allow-mutex-initialization-without-PI-confi=
gured.patch \<br>
+ =C2=A0 =C2=A0file://0001-pthread_cond_many-fix-uninitialized-return-in-op=
tion.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br></div>

--f46d04428e3e2c5fe905009db0da--
