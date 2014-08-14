Return-Path: <gary.robertson@linaro.org>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id DCC9D62252
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 21:37:59 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so306158wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=cSW49L5PidjDU/CTfjeJajaVGUIE86K4sFpNWUvj/NU=;
	b=P/sygXF3Xazo9fPzjCnjwko9iPYT+ED8zQfk+blrcEYjF+VXdfT6BSbobQZ5RvbPxt
	GyWIuVJ8mEkHv+jMTUGWZ/2R6ZfjmmoI69E5zfTLKH7FC2CQhtwW5x7CjboYRBGrMdY2
	KHmwD24O+cJNadJan579qUrUN3CcEdSMAMUyy59mZNlCopFO38dQg2mfg0fEH1nTUred
	CYxRWohmXYCFLDlrHkDizJ4wmQ+zQHxTYhYN14+p4J9vuSmbJiEJn5MUjxelpmosrmUN
	PAPyR02CiDUrLCPV7Rvfy+WQrkrYMZlZ72bn7bHxdNnSpRtsocCAwlw1RZn45yvZNa4p
	Imxw==
X-Gm-Message-State: ALoCoQmdr2jmDFDcp9JSvPM09zXuaI89JdrY1LttXqd3Q9it9Vla3C3Skwyh0/iTZDg+c/1QqkW7
MIME-Version: 1.0
X-Received: by 10.194.90.4 with SMTP id bs4mr16114549wjb.71.1408052280141;
	Thu, 14 Aug 2014 14:38:00 -0700 (PDT)
Received: by 10.216.120.72 with HTTP; Thu, 14 Aug 2014 14:38:00 -0700 (PDT)
In-Reply-To: <1406326845-17506-2-git-send-email-gary.robertson@linaro.org>
References: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
	<1406326845-17506-2-git-send-email-gary.robertson@linaro.org>
Date: Thu, 14 Aug 2014 16:38:00 -0500
Message-ID: <CAF7YWnxkyzHoPVU14KDkfjmQc-trQ3kN1ypUmNKxL_p7GK26UQ@mail.gmail.com>
From: Gary Robertson <gary.robertson@linaro.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Mike Holmes <mike.holmes@linaro.org>
Subject: Re: [PATCH 1/3] LTP: Realtime tests - Allow-mutex-initialization-without-PI-configured
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
X-List-Received-Date: Thu, 14 Aug 2014 21:38:00 -0000
Content-Type: multipart/alternative; boundary=047d7bfcfc18fbc42405009db7ab

--047d7bfcfc18fbc42405009db7ab
Content-Type: text/plain; charset=UTF-8

In retrospect this patch is not appropriate at the OE project level and
should be handled in a local layer.  Consequently I wish to withdraw it
from further consideration here.  Thank you all for your responses.


On Fri, Jul 25, 2014 at 5:20 PM, Gary S. Robertson <
gary.robertson@linaro.org> wrote:

> From: "Gary S. Robertson" <gary.robertson@linaro.org>
>
> In the OE build environment the features on the build host
> may not match those of the runtime host -so- the conditional
> compilation clauses were deleted which required the presence
> of priority inheriting mutexes in order to compile initialization
> of a mutex with priority inheritance.  This allows this code to
> execute and fail if the runtime host lacks priority inheritance,
> while eliminating any dependence on PI mutexes in the build host.
>
> Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> ---
>  ...utex-initialization-without-PI-configured.patch |   66
> ++++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
>  2 files changed, 67 insertions(+)
>  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-without-PI-configured.patch
>
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-without-PI-configured.patch
> b/meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-without-PI-configured.patch
> new file mode 100644
> index 0000000..2de6e22
> --- /dev/null
> +++
> b/meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-without-PI-configured.patch
> @@ -0,0 +1,66 @@
> +From 62dfb25fa3b6e71650bc3fff9a4a0eaec0f5ac8e Mon Sep 17 00:00:00 2001
> +From: "Gary S. Robertson" <gary.robertson@linaro.org>
> +Date: Fri, 25 Jul 2014 09:25:13 -0500
> +Subject: [PATCH] Allow mutex initialization without PI configured
> +
> +LTP is primarily intended to be built and run on the same machine,
> +and uses autotools / autoconf to determine the features of the host
> +machine's environment prior to compilation.  However in the OE
> +environment, LTP may get built into a generic filesystem image
> +which will be used with a variety of different kernels later...
> +so for the OE environment it is better not to disable features
> +based on the compile-time environment.  This patch removes
> +compile-time dependencies on priority-inheriting mutexes and
> +allows the code to attempt initialization of PI mutexes even
> +if the runtime environment lacks that feature... in which case
> +the associated test should fail.
> +
> +Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
> +---
> + testcases/realtime/lib/librttest.c            |    2 --
> + testcases/realtime/stress/pi-tests/testpi-3.c |    2 --
> + 2 files changed, 4 deletions(-)
> +
> +diff --git a/testcases/realtime/lib/librttest.c
> b/testcases/realtime/lib/librttest.c
> +index 0dd6019..9f37d08 100644
> +--- a/testcases/realtime/lib/librttest.c
> ++++ b/testcases/realtime/lib/librttest.c
> +@@ -586,7 +586,6 @@ void *busy_work_us(int us)
> +
> + void init_pi_mutex(pthread_mutex_t * m)
> + {
> +-#if HAVE_DECL_PTHREAD_PRIO_INHERIT
> +       pthread_mutexattr_t attr;
> +       int ret;
> +       int protocol;
> +@@ -609,7 +608,6 @@ void init_pi_mutex(pthread_mutex_t * m)
> +       if ((ret = pthread_mutex_init(m, &attr)) != 0) {
> +               printf("Failed to init mutex: %d (%s)\n", ret,
> strerror(ret));
> +       }
> +-#endif
> +
> +       /* FIXME: does any of this need to be destroyed ? */
> + }
> +diff --git a/testcases/realtime/stress/pi-tests/testpi-3.c
> b/testcases/realtime/stress/pi-tests/testpi-3.c
> +index 30f38f6..807c9cc 100644
> +--- a/testcases/realtime/stress/pi-tests/testpi-3.c
> ++++ b/testcases/realtime/stress/pi-tests/testpi-3.c
> +@@ -365,7 +365,6 @@ int main(int argc, char *argv[])
> +
> +       printf("Start %s\n", argv[0]);
> +
> +-#if HAVE_DECL_PTHREAD_PRIO_INHERIT
> +       if (!nopi) {
> +               pthread_mutexattr_t mutexattr;
> +               int protocol;
> +@@ -386,7 +385,6 @@ int main(int argc, char *argv[])
> +                       printf("Failed to init mutex: %d\n", retc);
> +               }
> +       }
> +-#endif
> +
> +       startThread(&arg1);
> +       startThread(&arg2);
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb
> b/meta/recipes-extended/ltp/ltp_20140422.bb
> index 30761fd..2ac2187 100644
> --- a/meta/recipes-extended/ltp/ltp_20140422.bb
> +++ b/meta/recipes-extended/ltp/ltp_20140422.bb
> @@ -26,6 +26,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>      file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
> \
>      file://ltp-Do-not-link-against-libfl.patch \
>      file://automake-foreign.patch \
> +    file://0001-Allow-mutex-initialization-without-PI-configured.patch \
>  "
>
>  S = "${WORKDIR}/git"
> --
> 1.7.9.5
>
>

--047d7bfcfc18fbc42405009db7ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In retrospect this patch is not appropriate at the OE proj=
ect level and should be handled in a local layer.=C2=A0 Consequently I wish=
 to withdraw it from further consideration here.=C2=A0 Thank you all for yo=
ur responses.<br>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fri,=
 Jul 25, 2014 at 5:20 PM, Gary S. Robertson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:gary.robertson@linaro.org" target=3D"_blank">gary.robertson@lina=
ro.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: &quot;Gary S. Robertson&quot; &lt;<a h=
ref=3D"mailto:gary.robertson@linaro.org">gary.robertson@linaro.org</a>&gt;<=
br>

<br>
In the OE build environment the features on the build host<br>
may not match those of the runtime host -so- the conditional<br>
compilation clauses were deleted which required the presence<br>
of priority inheriting mutexes in order to compile initialization<br>
of a mutex with priority inheritance. =C2=A0This allows this code to<br>
execute and fail if the runtime host lacks priority inheritance,<br>
while eliminating any dependence on PI mutexes in the build host.<br>
<br>
Signed-off-by: Gary S. Robertson &lt;<a href=3D"mailto:gary.robertson@linar=
o.org">gary.robertson@linaro.org</a>&gt;<br>
---<br>
=C2=A0...utex-initialization-without-PI-configured.patch | =C2=A0 66 ++++++=
++++++++++++++<br>
=C2=A0meta/recipes-extended/ltp/<a href=3D"http://ltp_20140422.bb" target=
=3D"_blank">ltp_20140422.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A01 +<br>
=C2=A02 files changed, 67 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/0001-Allow-mutex-ini=
tialization-without-PI-configured.patch<br>
<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-=
without-PI-configured.patch b/meta/recipes-extended/ltp/ltp/0001-Allow-mute=
x-initialization-without-PI-configured.patch<br>
new file mode 100644<br>
index 0000000..2de6e22<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-Allow-mutex-initialization-without=
-PI-configured.patch<br>
@@ -0,0 +1,66 @@<br>
+From 62dfb25fa3b6e71650bc3fff9a4a0eaec0f5ac8e Mon Sep 17 00:00:00 2001<br>
+From: &quot;Gary S. Robertson&quot; &lt;<a href=3D"mailto:gary.robertson@l=
inaro.org">gary.robertson@linaro.org</a>&gt;<br>
+Date: Fri, 25 Jul 2014 09:25:13 -0500<br>
+Subject: [PATCH] Allow mutex initialization without PI configured<br>
+<br>
+LTP is primarily intended to be built and run on the same machine,<br>
+and uses autotools / autoconf to determine the features of the host<br>
+machine&#39;s environment prior to compilation. =C2=A0However in the OE<br=
>
+environment, LTP may get built into a generic filesystem image<br>
+which will be used with a variety of different kernels later...<br>
+so for the OE environment it is better not to disable features<br>
+based on the compile-time environment. =C2=A0This patch removes<br>
+compile-time dependencies on priority-inheriting mutexes and<br>
+allows the code to attempt initialization of PI mutexes even<br>
+if the runtime environment lacks that feature... in which case<br>
+the associated test should fail.<br>
+<br>
+Signed-off-by: Gary S. Robertson &lt;<a href=3D"mailto:gary.robertson@lina=
ro.org">gary.robertson@linaro.org</a>&gt;<br>
+---<br>
+ testcases/realtime/lib/librttest.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A02 --<br>
+ testcases/realtime/stress/pi-tests/testpi-3.c | =C2=A0 =C2=A02 --<br>
+ 2 files changed, 4 deletions(-)<br>
+<br>
+diff --git a/testcases/realtime/lib/librttest.c b/testcases/realtime/lib/l=
ibrttest.c<br>
+index 0dd6019..9f37d08 100644<br>
+--- a/testcases/realtime/lib/librttest.c<br>
++++ b/testcases/realtime/lib/librttest.c<br>
+@@ -586,7 +586,6 @@ void *busy_work_us(int us)<br>
+<br>
+ void init_pi_mutex(pthread_mutex_t * m)<br>
+ {<br>
+-#if HAVE_DECL_PTHREAD_PRIO_INHERIT<br>
+ =C2=A0 =C2=A0 =C2=A0 pthread_mutexattr_t attr;<br>
+ =C2=A0 =C2=A0 =C2=A0 int ret;<br>
+ =C2=A0 =C2=A0 =C2=A0 int protocol;<br>
+@@ -609,7 +608,6 @@ void init_pi_mutex(pthread_mutex_t * m)<br>
+ =C2=A0 =C2=A0 =C2=A0 if ((ret =3D pthread_mutex_init(m, &amp;attr)) !=3D =
0) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Failed to i=
nit mutex: %d (%s)\n&quot;, ret, strerror(ret));<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+-#endif<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 /* FIXME: does any of this need to be destroyed ? */=
<br>
+ }<br>
+diff --git a/testcases/realtime/stress/pi-tests/testpi-3.c b/testcases/rea=
ltime/stress/pi-tests/testpi-3.c<br>
+index 30f38f6..807c9cc 100644<br>
+--- a/testcases/realtime/stress/pi-tests/testpi-3.c<br>
++++ b/testcases/realtime/stress/pi-tests/testpi-3.c<br>
+@@ -365,7 +365,6 @@ int main(int argc, char *argv[])<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 printf(&quot;Start %s\n&quot;, argv[0]);<br>
+<br>
+-#if HAVE_DECL_PTHREAD_PRIO_INHERIT<br>
+ =C2=A0 =C2=A0 =C2=A0 if (!nopi) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pthread_mutexattr_t mute=
xattr;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int protocol;<br>
+@@ -386,7 +385,6 @@ int main(int argc, char *argv[])<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 printf(&quot;Failed to init mutex: %d\n&quot;, retc);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 =C2=A0 }<br>
+-#endif<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 startThread(&amp;arg1);<br>
+ =C2=A0 =C2=A0 =C2=A0 startThread(&amp;arg2);<br>
+--<br>
+1.7.9.5<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20140422.bb" t=
arget=3D"_blank">ltp_20140422.bb</a> b/meta/recipes-extended/ltp/<a href=3D=
"http://ltp_20140422.bb" target=3D"_blank">ltp_20140422.bb</a><br>
index 30761fd..2ac2187 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20140422.bb" target=
=3D"_blank">ltp_20140422.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20140422.bb" target=
=3D"_blank">ltp_20140422.bb</a><br>
@@ -26,6 +26,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/linu=
x-test-project/ltp.git" target=3D"_blank">github.com/linux-test-project/ltp=
.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Rename-runtests_noltp.sh-script-so-have-uni=
que-name.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://ltp-Do-not-link-against-libfl.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://automake-foreign.patch \<br>
+ =C2=A0 =C2=A0file://0001-Allow-mutex-initialization-without-PI-configured=
.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
</font></span></blockquote></div><br></div>

--047d7bfcfc18fbc42405009db7ab--
