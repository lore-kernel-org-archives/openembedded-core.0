Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Sr4Cj-00038R-1U
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 11:36:30 +0200
Received: by ggnp4 with SMTP id p4so133651ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 02:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=luiuJSc1F2xr3j2U5WDkcJsMCbyUBSRfsXm++fzjZns=;
	b=nx3W6U8sVDQ3y/94CpKwQaitHxEsaTNYNVxDarHQnp/bZCO84mli35VcOlrtPqC2NY
	AhMo+qThN2j5orQLCKJd9rDzWJF9IpNvVxqZ6pn8nzRv9DZTx4sAryeChKV8Ja8X/p44
	vjJrt8Waeh/zyj5nySjZzgfeeAARUwV03LPzlQBA21ZiiGc1X0xy0dIRPaQP7Haog3Y1
	mszTksk/TA++eFvNq2ACa4SMy7sYYHNwYbNnp25Z0wBQsdZPlgkwNQRS/dqirAHvKc+6
	jbDjsDoP9N5VNUgS0wK3tDDfr3KnzpOQTX5KA9kCb9RKaxejE9l2DOu262PJnZsSOUwj
	rprQ==
Received: by 10.43.59.71 with SMTP id wn7mr924859icb.0.1342517109191; Tue, 17
	Jul 2012 02:25:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Tue, 17 Jul 2012 02:24:41 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
References: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 17 Jul 2012 12:24:41 +0300
Message-ID: <CAK18fxG7KJvUfL+LN8r42+Px2=adL9Su9ry+0gup0m1RC_u2rw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQly1L6IV2LUSubyM8f6j25BHaBOX45JDK/ebbJfmFXrrpFHFxMsK1qG9No4Ouf38NETsRh5
Subject: Re: [PATCH 1/3] iproute2: upgrade to 3.4.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 09:36:30 -0000
Content-Type: multipart/alternative; boundary=bcaec51ddaa765f37104c5031fe1

--bcaec51ddaa765f37104c5031fe1
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 17, 2012 at 11:28 AM, Cristian Iorga
<cristian.iorga@intel.com>wrote:

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../iproute2/iproute2-3.2.0/configure-cross.patch  |   76
> -------------------
>  .../iproute2/iproute2-3.4.0/configure-cross.patch  |   77
> ++++++++++++++++++++
>  meta/recipes-connectivity/iproute2/iproute2.inc    |   10 +--
>  .../iproute2/iproute2_3.2.0.bb                     |   11 ---
>  .../iproute2/iproute2_3.4.0.bb                     |    9 +++
>  5 files changed, 91 insertions(+), 92 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
>  create mode 100644
> meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.patch
>  delete mode 100644 meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
>  create mode 100644 meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb
>
> diff --git
> a/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
> b/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
> deleted file mode 100644
> index bed7b84..0000000
> ---
> a/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Thu, 3 Nov 2011 10:46:16 +0100
> -Subject: [PATCH] make configure cross compile safe
> -
> -According to Kevin Tian:
> -Upstream-Status: Pending
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> -Signed-off-by: Shane Wang <shane.wang@intel.com>
> -
> -diff -r e4e1b14b9c4a configure
> ---- a/configure        Sun Jan 22 15:26:47 2012 +0800
> -+++ b/configure        Sun Jan 22 15:29:38 2012 +0800
> -@@ -2,6 +2,7 @@
> - # This is not an autconf generated configure
> - #
> - INCLUDE=${1:-"$PWD/include"}
> -+SYSROOT=$1
> -
> - check_atm()
> - {
> -@@ -13,7 +14,7 @@
> -       return 0;
> - }
> - EOF
> --gcc -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1
> -+$CC -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1
> - if [ $? -eq 0 ]
> - then
> -     echo "TC_CONFIG_ATM:=y" >>Config
> -@@ -47,7 +48,7 @@
> -
> - EOF
> -
> --if gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL
> $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
> -+if $CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL
> $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
> - then
> -       echo "TC_CONFIG_XT:=y" >>Config
> -       echo "using xtables"
> -@@ -84,7 +85,7 @@
> - }
> -
> - EOF
> --gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl
> >/dev/null 2>&1
> -+$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl
> >/dev/null 2>&1
> -
> - if [ $? -eq 0 ]
> - then
> -@@ -124,7 +125,7 @@
> - }
> -
> - EOF
> --gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl
> >/dev/null 2>&1
> -+$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl
> >/dev/null 2>&1
> -
> - if [ $? -eq 0 ]
> - then
> -@@ -145,7 +146,7 @@
> - check_ipt_lib_dir()
> - {
> -       IPT_LIB_DIR=""
> --      for dir in /lib /usr/lib /usr/local/lib
> -+      for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
> -       do
> -               for file in $dir/{xtables,iptables}/lib*t_*so ; do
> -                       if [ -f $file ]; then
> -@@ -168,7 +169,7 @@
> -       return 0;
> - }
> - EOF
> --gcc -I$INCLUDE -o /tmp/setnstest /tmp/setnstest.c >/dev/null 2>&1
> -+$CC -I$INCLUDE -o /tmp/setnstest /tmp/setnstest.c >/dev/null 2>&1
> - if [ $? -eq 0 ]
> - then
> -       echo "IP_CONFIG_SETNS:=y" >>Config
> diff --git
> a/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.patch
> b/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.patch
> new file mode 100644
> index 0000000..42f591a
> --- /dev/null
> +++
> b/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.patch
> @@ -0,0 +1,77 @@
> +From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Thu, 3 Nov 2011 10:46:16 +0100
> +Subject: [PATCH] make configure cross compile safe
> +
> +According to Kevin Tian:
> +Upstream-Status: Pending
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +Signed-off-by: Shane Wang <shane.wang@intel.com>
> +
> +Index: iproute2-3.4.0/configure
> +===================================================================
> +--- iproute2-3.4.0.orig/configure
> ++++ iproute2-3.4.0/configure
> +@@ -2,6 +2,7 @@
> + # This is not an autconf generated configure
> + #
> + INCLUDE=${1:-"$PWD/include"}
> ++SYSROOT=$1
> +
> + # Make a temp directory in build tree.
> + TMPDIR=$(mktemp -d config.XXXXXX)
> +@@ -17,7 +18,7 @@ int main(int argc, char **argv) {
> +       return 0;
> + }
> + EOF
> +-gcc -I$INCLUDE -o $TMPDIR/atmtest $TMPDIR/atmtest.c -latm >/dev/null 2>&1
> ++$CC -I$INCLUDE -o $TMPDIR/atmtest $TMPDIR/atmtest.c -latm >/dev/null 2>&1
> + if [ $? -eq 0 ]
> + then
> +     echo "TC_CONFIG_ATM:=y" >>Config
> +@@ -51,7 +52,7 @@ int main(int argc, char **argv)
> +
> + EOF
> +
> +-if gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL
> $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
> ++if $CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL
> $(pkg-config xtables --cflags --libs) -ldl >/dev/null 2>&1
> + then
> +       echo "TC_CONFIG_XT:=y" >>Config
> +       echo "using xtables"
> +@@ -88,7 +89,7 @@ int main(int argc, char **argv) {
> + }
> +
> + EOF
> +-gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl
> >/dev/null 2>&1
> ++$CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl
> >/dev/null 2>&1
> +
> + if [ $? -eq 0 ]
> + then
> +@@ -128,7 +129,7 @@ int main(int argc, char **argv) {
> + }
> +
> + EOF
> +-gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl
> >/dev/null 2>&1
> ++$CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl
> >/dev/null 2>&1
> +
> + if [ $? -eq 0 ]
> + then
> +@@ -149,7 +150,7 @@ check_ipt()
> + check_ipt_lib_dir()
> + {
> +       IPT_LIB_DIR=""
> +-      for dir in /lib /usr/lib /usr/local/lib
> ++      for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/lib
> +       do
> +               for file in $dir/{xtables,iptables}/lib*t_*so ; do
> +                       if [ -f $file ]; then
> +@@ -172,7 +173,7 @@ int main(int argc, char **argv)
> +       return 0;
> + }
> + EOF
> +-gcc -I$INCLUDE -o $TMPDIR/setnstest $TMPDIR/setnstest.c >/dev/null 2>&1
> ++$CC -I$INCLUDE -o $TMPDIR/setnstest $TMPDIR/setnstest.c >/dev/null 2>&1
> + if [ $? -eq 0 ]
> + then
> +       echo "IP_CONFIG_SETNS:=y" >>Config
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
> b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 86847ef..7caf7d0 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -26,12 +26,12 @@ do_install () {
>  # There are only .so files in iproute2
>  INSANE_SKIP_${PN} = "dev-so"
>
> -FILES_${PN} += "${base_libdir}/tc"
> -FILES_${PN}-dbg += "${base_libdir}/tc/.debug"
> +FILES_${PN} += "${libdir}/tc"
> +FILES_${PN}-dbg += "${libdir}/tc/.debug"
>
> -ALTERNATIVE_NAME = "ip"
> -ALTERNATIVE_PATH = "${base_sbindir}/ip.iproute2"
> -ALTERNATIVE_LINK = "${base_bindir}/ip"
> +ALTERNATIVE_${PN} = "ip"
> +ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
> +ALTERNATIVE_LINK_NAME[ip] = "${base_bindir}/ip"
>  ALTERNATIVE_PRIORITY = "100"
>
>
You could state this change in the description.


>  PARALLEL_MAKE = ""
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bbb/meta/recipes-connectivity/iproute2/
> iproute2_3.2.0.bb
> deleted file mode 100644
> index 5af12af..0000000
> --- a/meta/recipes-connectivity/iproute2/iproute2_3.2.0.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require iproute2.inc
> -
> -PR = "r1"
> -
> -#v3.2.0 tag is "447c118f138171b260ad045ad6e1b17f9ef462e2"
> -#but it was not fully tested and had build error, and the next commit
> fixed it.
> -SRCREV = "13603f6a9e46f08576f6284a0ef1ce1fbf94ffe0"
> -SRC_URI = "git://
> git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git \
> -           file://configure-cross.patch"
> -S = "${WORKDIR}/git"
> -
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.4.0.bbb/meta/recipes-connectivity/iproute2/
> iproute2_3.4.0.bb
> new file mode 100644
> index 0000000..cf1d521
> --- /dev/null
> +++ b/meta/recipes-connectivity/iproute2/iproute2_3.4.0.bb
> @@ -0,0 +1,9 @@
> +require iproute2.inc
> +
> +PR = "r0"
>
>
Not needed anymore. (The same mention for wpa-s. and pulseaudio.)


> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz
> \
> +           file://configure-cross.patch"
> +
> +SRC_URI[md5sum] = "879d3fac4e90809598b2864ec4a0cbf8"
> +SRC_URI[sha256sum] =
> "38e846e412b2fa235a447b50c20ad1e9770d1b3ed4d3ab18ca0b18c6e8b79ba4"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec51ddaa765f37104c5031fe1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jul 17, 2012 at 11:28 AM, Cristian Iorga=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:cristian.iorga@intel.com" target=
=3D"_blank">cristian.iorga@intel.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">


Signed-off-by: Cristian Iorga &lt;<a href=3D"mailto:cristian.iorga@intel.co=
m" target=3D"_blank">cristian.iorga@intel.com</a>&gt;<br>
---<br>
=A0.../iproute2/iproute2-3.2.0/configure-cross.patch =A0| =A0 76 ----------=
---------<br>
=A0.../iproute2/iproute2-3.4.0/configure-cross.patch =A0| =A0 77 ++++++++++=
++++++++++<br>
=A0meta/recipes-connectivity/iproute2/iproute2.inc =A0 =A0| =A0 10 +--<br>
=A0.../iproute2/<a href=3D"http://iproute2_3.2.0.bb" target=3D"_blank">ipro=
ute2_3.2.0.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 11 ---<br>
=A0.../iproute2/<a href=3D"http://iproute2_3.4.0.bb" target=3D"_blank">ipro=
ute2_3.4.0.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A09 +++<br=
>
=A05 files changed, 91 insertions(+), 92 deletions(-)<br>
=A0delete mode 100644 meta/recipes-connectivity/iproute2/iproute2-3.2.0/con=
figure-cross.patch<br>
=A0create mode 100644 meta/recipes-connectivity/iproute2/iproute2-3.4.0/con=
figure-cross.patch<br>
=A0delete mode 100644 meta/recipes-connectivity/iproute2/<a href=3D"http://=
iproute2_3.2.0.bb" target=3D"_blank">iproute2_3.2.0.bb</a><br>
=A0create mode 100644 meta/recipes-connectivity/iproute2/<a href=3D"http://=
iproute2_3.4.0.bb" target=3D"_blank">iproute2_3.4.0.bb</a><br>
<br>
diff --git a/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cr=
oss.patch b/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cro=
ss.patch<br>
deleted file mode 100644<br>
index bed7b84..0000000<br>
--- a/meta/recipes-connectivity/iproute2/iproute2-3.2.0/configure-cross.pat=
ch<br>
+++ /dev/null<br>
@@ -1,76 +0,0 @@<br>
-From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001<br>
-From: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=
=3D"_blank">koen@dominion.thruhere.net</a>&gt;<br>
-Date: Thu, 3 Nov 2011 10:46:16 +0100<br>
-Subject: [PATCH] make configure cross compile safe<br>
-<br>
-According to Kevin Tian:<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net"=
 target=3D"_blank">koen@dominion.thruhere.net</a>&gt;<br>
-Signed-off-by: Shane Wang &lt;<a href=3D"mailto:shane.wang@intel.com" targ=
et=3D"_blank">shane.wang@intel.com</a>&gt;<br>
-<br>
-diff -r e4e1b14b9c4a configure<br>
---- a/configure =A0 =A0 =A0 =A0Sun Jan 22 15:26:47 2012 +0800<br>
-+++ b/configure =A0 =A0 =A0 =A0Sun Jan 22 15:29:38 2012 +0800<br>
-@@ -2,6 +2,7 @@<br>
- # This is not an autconf generated configure<br>
- #<br>
- INCLUDE=3D${1:-&quot;$PWD/include&quot;}<br>
-+SYSROOT=3D$1<br>
-<br>
- check_atm()<br>
- {<br>
-@@ -13,7 +14,7 @@<br>
- =A0 =A0 =A0 return 0;<br>
- }<br>
- EOF<br>
--gcc -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm &gt;/dev/null 2&gt;&a=
mp;1<br>
-+$CC -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm &gt;/dev/null 2&gt;&a=
mp;1<br>
- if [ $? -eq 0 ]<br>
- then<br>
- =A0 =A0 echo &quot;TC_CONFIG_ATM:=3Dy&quot; &gt;&gt;Config<br>
-@@ -47,7 +48,7 @@<br>
-<br>
- EOF<br>
-<br>
--if gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL $(pkg-config=
 xtables --cflags --libs) -ldl &gt;/dev/null 2&gt;&amp;1<br>
-+if $CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL $(pkg-config=
 xtables --cflags --libs) -ldl &gt;/dev/null 2&gt;&amp;1<br>
- then<br>
- =A0 =A0 =A0 echo &quot;TC_CONFIG_XT:=3Dy&quot; &gt;&gt;Config<br>
- =A0 =A0 =A0 echo &quot;using xtables&quot;<br>
-@@ -84,7 +85,7 @@<br>
- }<br>
-<br>
- EOF<br>
--gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl &gt;/dev/n=
ull 2&gt;&amp;1<br>
-+$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl &gt;/dev/n=
ull 2&gt;&amp;1<br>
-<br>
- if [ $? -eq 0 ]<br>
- then<br>
-@@ -124,7 +125,7 @@<br>
- }<br>
-<br>
- EOF<br>
--gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl &gt;/dev/n=
ull 2&gt;&amp;1<br>
-+$CC -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl &gt;/dev/n=
ull 2&gt;&amp;1<br>
-<br>
- if [ $? -eq 0 ]<br>
- then<br>
-@@ -145,7 +146,7 @@<br>
- check_ipt_lib_dir()<br>
- {<br>
- =A0 =A0 =A0 IPT_LIB_DIR=3D&quot;&quot;<br>
-- =A0 =A0 =A0for dir in /lib /usr/lib /usr/local/lib<br>
-+ =A0 =A0 =A0for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/l=
ib<br>
- =A0 =A0 =A0 do<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 for file in $dir/{xtables,iptables}/lib*t_*so=
 ; do<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -f $file ]; then<br>
-@@ -168,7 +169,7 @@<br>
- =A0 =A0 =A0 return 0;<br>
- }<br>
- EOF<br>
--gcc -I$INCLUDE -o /tmp/setnstest /tmp/setnstest.c &gt;/dev/null 2&gt;&amp=
;1<br>
-+$CC -I$INCLUDE -o /tmp/setnstest /tmp/setnstest.c &gt;/dev/null 2&gt;&amp=
;1<br>
- if [ $? -eq 0 ]<br>
- then<br>
- =A0 =A0 =A0 echo &quot;IP_CONFIG_SETNS:=3Dy&quot; &gt;&gt;Config<br>
diff --git a/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cr=
oss.patch b/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cro=
ss.patch<br>
new file mode 100644<br>
index 0000000..42f591a<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/iproute2/iproute2-3.4.0/configure-cross.pat=
ch<br>
@@ -0,0 +1,77 @@<br>
+From 85b0589b4843c03e8e6fd9416d71ea449a73c5c0 Mon Sep 17 00:00:00 2001<br>
+From: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=
=3D"_blank">koen@dominion.thruhere.net</a>&gt;<br>
+Date: Thu, 3 Nov 2011 10:46:16 +0100<br>
+Subject: [PATCH] make configure cross compile safe<br>
+<br>
+According to Kevin Tian:<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net"=
 target=3D"_blank">koen@dominion.thruhere.net</a>&gt;<br>
+Signed-off-by: Shane Wang &lt;<a href=3D"mailto:shane.wang@intel.com" targ=
et=3D"_blank">shane.wang@intel.com</a>&gt;<br>
+<br>
+Index: iproute2-3.4.0/configure<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- iproute2-3.4.0.orig/configure<br>
++++ iproute2-3.4.0/configure<br>
+@@ -2,6 +2,7 @@<br>
+ # This is not an autconf generated configure<br>
+ #<br>
+ INCLUDE=3D${1:-&quot;$PWD/include&quot;}<br>
++SYSROOT=3D$1<br>
+<br>
+ # Make a temp directory in build tree.<br>
+ TMPDIR=3D$(mktemp -d config.XXXXXX)<br>
+@@ -17,7 +18,7 @@ int main(int argc, char **argv) {<br>
+ =A0 =A0 =A0 return 0;<br>
+ }<br>
+ EOF<br>
+-gcc -I$INCLUDE -o $TMPDIR/atmtest $TMPDIR/atmtest.c -latm &gt;/dev/null 2=
&gt;&amp;1<br>
++$CC -I$INCLUDE -o $TMPDIR/atmtest $TMPDIR/atmtest.c -latm &gt;/dev/null 2=
&gt;&amp;1<br>
+ if [ $? -eq 0 ]<br>
+ then<br>
+ =A0 =A0 echo &quot;TC_CONFIG_ATM:=3Dy&quot; &gt;&gt;Config<br>
+@@ -51,7 +52,7 @@ int main(int argc, char **argv)<br>
+<br>
+ EOF<br>
+<br>
+-if gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL $(pkg-=
config xtables --cflags --libs) -ldl &gt;/dev/null 2&gt;&amp;1<br>
++if $CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL $(pkg-=
config xtables --cflags --libs) -ldl &gt;/dev/null 2&gt;&amp;1<br>
+ then<br>
+ =A0 =A0 =A0 echo &quot;TC_CONFIG_XT:=3Dy&quot; &gt;&gt;Config<br>
+ =A0 =A0 =A0 echo &quot;using xtables&quot;<br>
+@@ -88,7 +89,7 @@ int main(int argc, char **argv) {<br>
+ }<br>
+<br>
+ EOF<br>
+-gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl &gt;=
/dev/null 2&gt;&amp;1<br>
++$CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl &gt;=
/dev/null 2&gt;&amp;1<br>
+<br>
+ if [ $? -eq 0 ]<br>
+ then<br>
+@@ -128,7 +129,7 @@ int main(int argc, char **argv) {<br>
+ }<br>
+<br>
+ EOF<br>
+-gcc -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl &gt;=
/dev/null 2&gt;&amp;1<br>
++$CC -I$INCLUDE $IPTC -o $TMPDIR/ipttest $TMPDIR/ipttest.c $IPTL -ldl &gt;=
/dev/null 2&gt;&amp;1<br>
+<br>
+ if [ $? -eq 0 ]<br>
+ then<br>
+@@ -149,7 +150,7 @@ check_ipt()<br>
+ check_ipt_lib_dir()<br>
+ {<br>
+ =A0 =A0 =A0 IPT_LIB_DIR=3D&quot;&quot;<br>
+- =A0 =A0 =A0for dir in /lib /usr/lib /usr/local/lib<br>
++ =A0 =A0 =A0for dir in $SYSROOT/lib $SYSROOT/usr/lib $SYSROOT/usr/local/l=
ib<br>
+ =A0 =A0 =A0 do<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for file in $dir/{xtables,iptables}/lib*t_*so=
 ; do<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -f $file ]; then<br>
+@@ -172,7 +173,7 @@ int main(int argc, char **argv)<br>
+ =A0 =A0 =A0 return 0;<br>
+ }<br>
+ EOF<br>
+-gcc -I$INCLUDE -o $TMPDIR/setnstest $TMPDIR/setnstest.c &gt;/dev/null 2&g=
t;&amp;1<br>
++$CC -I$INCLUDE -o $TMPDIR/setnstest $TMPDIR/setnstest.c &gt;/dev/null 2&g=
t;&amp;1<br>
+ if [ $? -eq 0 ]<br>
+ then<br>
+ =A0 =A0 =A0 echo &quot;IP_CONFIG_SETNS:=3Dy&quot; &gt;&gt;Config<br>
diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes=
-connectivity/iproute2/iproute2.inc<br>
index 86847ef..7caf7d0 100644<br>
--- a/meta/recipes-connectivity/iproute2/iproute2.inc<br>
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc<br>
@@ -26,12 +26,12 @@ do_install () {<br>
=A0# There are only .so files in iproute2<br>
=A0INSANE_SKIP_${PN} =3D &quot;dev-so&quot;<br>
<br>
-FILES_${PN} +=3D &quot;${base_libdir}/tc&quot;<br>
-FILES_${PN}-dbg +=3D &quot;${base_libdir}/tc/.debug&quot;<br>
+FILES_${PN} +=3D &quot;${libdir}/tc&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${libdir}/tc/.debug&quot;<br>
<br>
-ALTERNATIVE_NAME =3D &quot;ip&quot;<br>
-ALTERNATIVE_PATH =3D &quot;${base_sbindir}/ip.iproute2&quot;<br>
-ALTERNATIVE_LINK =3D &quot;${base_bindir}/ip&quot;<br>
+ALTERNATIVE_${PN} =3D &quot;ip&quot;<br>
+ALTERNATIVE_TARGET[ip] =3D &quot;${base_sbindir}/ip.${BPN}&quot;<br>
+ALTERNATIVE_LINK_NAME[ip] =3D &quot;${base_bindir}/ip&quot;<br>
=A0ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
<br></blockquote><div><br></div><div>You could state this change in the des=
cription.</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=A0PARALLEL_MAKE =3D &quot;&quot;<br>
diff --git a/meta/recipes-connectivity/iproute2/<a href=3D"http://iproute2_=
3.2.0.bb" target=3D"_blank">iproute2_3.2.0.bb</a> b/meta/recipes-connectivi=
ty/iproute2/<a href=3D"http://iproute2_3.2.0.bb" target=3D"_blank">iproute2=
_3.2.0.bb</a><br>



deleted file mode 100644<br>
index 5af12af..0000000<br>
--- a/meta/recipes-connectivity/iproute2/<a href=3D"http://iproute2_3.2.0.b=
b" target=3D"_blank">iproute2_3.2.0.bb</a><br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-require iproute2.inc<br>
-<br>
-PR =3D &quot;r1&quot;<br>
-<br>
-#v3.2.0 tag is &quot;447c118f138171b260ad045ad6e1b17f9ef462e2&quot;<br>
-#but it was not fully tested and had build error, and the next commit fixe=
d it.<br>
-SRCREV =3D &quot;13603f6a9e46f08576f6284a0ef1ce1fbf94ffe0&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/linux/ker=
nel/git/shemminger/iproute2.git" target=3D"_blank">git.kernel.org/pub/scm/l=
inux/kernel/git/shemminger/iproute2.git</a> \<br>
- =A0 =A0 =A0 =A0 =A0 file://configure-cross.patch&quot;<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
diff --git a/meta/recipes-connectivity/iproute2/<a href=3D"http://iproute2_=
3.4.0.bb" target=3D"_blank">iproute2_3.4.0.bb</a> b/meta/recipes-connectivi=
ty/iproute2/<a href=3D"http://iproute2_3.4.0.bb" target=3D"_blank">iproute2=
_3.4.0.bb</a><br>



new file mode 100644<br>
index 0000000..cf1d521<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/iproute2/<a href=3D"http://iproute2_3.4.0.b=
b" target=3D"_blank">iproute2_3.4.0.bb</a><br>
@@ -0,0 +1,9 @@<br>
+require iproute2.inc<br>
+<br>
+PR =3D &quot;r0&quot;<br><br></blockquote><div><br></div><div>Not needed a=
nymore. (The same mention for wpa-s. and pulseaudio.)</div><div>=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">


+SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.=
tar.xz \<br>
+ =A0 =A0 =A0 =A0 =A0 file://configure-cross.patch&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;879d3fac4e90809598b2864ec4a0cbf8&quot;<br>
+SRC_URI[sha256sum] =3D &quot;38e846e412b2fa235a447b50c20ad1e9770d1b3ed4d3a=
b18ca0b18c6e8b79ba4&quot;<br>
<span><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br>

--bcaec51ddaa765f37104c5031fe1--
