Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.252.1594571779813238923
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2020 09:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=WyJ0Dwov;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.128.67, mailfrom: rahulk@mvista.com)
Received: by mail-wm1-f67.google.com with SMTP id a6so11926556wmm.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2020 09:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uV+m1GDbWgQu9ba4tR2U21yqOkU0WP+B0Kju3Jkl/Hk=;
        b=WyJ0DwovnM+oTtgMB/Znx417BkPeD0l4UeKuekxJ1GnDgOe+Gj9i8ofATgw7dh39Fq
         vFEuLQDsIsnZ13PPjDJOUfCsAMHK0snp1JzJJzpa8ub4c/AFS+5fNBHUN2RmEdr0Yzx8
         vW1g528OdMTaF8/KgyHb3pJHH0ZtSMxUx7T7Kmahb4s8qYd+GJj/8mywnQfCX/oHnbG/
         v8AN2SpF8WXiakdc5lHnvvhESty6PS7EtA+ZbaW+059rGQOquwC+RNoApRmtU8UODjXa
         CxCnSY3zRqbY5GIKm7pDXXqfFOuxNhj3lg5VMl26AGmLhMotuqQ6CDe/0WXd6OPo66eb
         DAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uV+m1GDbWgQu9ba4tR2U21yqOkU0WP+B0Kju3Jkl/Hk=;
        b=twzjLkwOWpjSrAbluvLFd1CfA8w2O3aO+W7pGXcSviapXNs5Frj6PwQAocILrm3tz1
         yCYR2bS2x05z0AZwHj0Q73B8hItjmHQZG3MBSdUDtuCxjPRQhomS4kAZEgTmngtgnDbO
         CsC5hPe2BR00l1oU7s9rnBSK50lSVQgELpfr4GZHl8YGt887qy1slC0FIblGyx4jevs+
         ncrIsD9tbPH66a5xwfzc4Dh/BsWB3MOqgjyS/t5QKVC8z/cX5ZBUDeRhB7mmM6cimz2B
         nNmJOXDorHJAsxqZq1Q/wuOc/C+tJZ4tdImXwfktuNSVEeg74yFEJdhmtaJ9NXzJbPFP
         kUpQ==
X-Gm-Message-State: AOAM531DIksrgdcybexI/iLEJnMBj6lFajzhLKAJkHwgMbmRfFm4HgWb
	rZkXrnDjn+psIrPIfTL8anSBA0xRVmRgt4PnMATdtQ==
X-Google-Smtp-Source: ABdhPJwn/szlSOkbg90rmTPMfzNrHDthTvJcrLWYOi6wfta32+A3Ti/RYCGTH5UE30h0RrpEy3U+ZNHpz1yzsfjUfJg=
X-Received: by 2002:a1c:9e4c:: with SMTP id h73mr16170075wme.177.1594571778257;
 Sun, 12 Jul 2020 09:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <1594516895-5308-1-git-send-email-rahulk@mvista.com> <4c77a3e7-e9f4-d122-1f84-8405cabc4d92@gmail.com>
In-Reply-To: <4c77a3e7-e9f4-d122-1f84-8405cabc4d92@gmail.com>
From: "Rahul Kumar" <rahulk@mvista.com>
Date: Sun, 12 Jul 2020 22:06:07 +0530
Message-ID: <CANv91vP543imu22_9Rqy3jVoULm=HM1KxEaHzdxjKsRESwPgbQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] busybox: Security Fix For CVE-2018-1000500
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000698d4005aa412cca"

--000000000000698d4005aa412cca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

As per my observation, master branch does not affect this CVE.

I could not get any reference where i find out exactly from which version
to which version, This CVE affect.

Since busybox upstarem released a patch for CVE-2018-1000500 with busybox
v1_32_0~25
and master branch is using busybox v1.32.0-r0 and I checked this patch cod=
e
is present in busybox  v1.32.0-r0 source code.
so master branch does not affect.

Feel free to point out if I am wrong at any place.

*Thanks & Regards,*
Rahul Kumar
Software Engineer,Linux Solutions Engineering
Group,Montavista Software LLC
Email Id: rahulk@mvista.com
<https://plus.google.com/+CodeTwoSoftware>


On Sun, Jul 12, 2020 at 8:33 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 7/11/20 6:21 PM, Rahul Kumar wrote:
>
> CVE: CVE-2018-1000500
>
> Signed-off-by: Rahul Kumar <rahulk@mvista.com> <rahulk@mvista.com>
>
>
> Does this affect master?
>
> -armin
>
> ---
>  .../busybox/busybox/busybox-CVE-2018-1000500.patch | 98 +++++++++++++++=
+++++++
>  meta/recipes-core/busybox/busybox_1.31.1.bb        |  1 +
>  2 files changed, 99 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2018-1=
000500.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.=
patch b/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
> new file mode 100644
> index 0000000..cde3923
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
> @@ -0,0 +1,98 @@
> +From 71e7e2fb35c806d20f9739d832cd9ae3a86fdee2 Mon Sep 17 00:00:00 2001
> +From: Dimitri John Ledkov <xnox@ubuntu.com> <xnox@ubuntu.com>
> +Date: Tue, 19 May 2020 18:20:39 +0100
> +Subject: [PATCH] wget: implement TLS verification with
> + ENABLE_FEATURE_WGET_OPENSSL
> +
> +When ENABLE_FEATURE_WGET_OPENSSL is enabled, correctly implement TLS
> +verification by default. And only ignore verification errors, if
> +--no-check-certificate was passed.
> +
> +Also note, that previously OPENSSL implementation did not implement
> +TLS verification, nor printed any warning messages that verification
> +was not performed.
> +
> +Bug-Ubuntu: https://bugs.launchpad.net/bugs/1879533
> +
> +CVE-2018-1000500
> +
> +Upstream Status: Backport https://git.busybox.net/busybox/commit/?id=3D=
45fa3f18adf57ef9d743038743d9c90573aeeb91
> +CVE: CVE-2018-1000500
> +
> +Signed-off-by: Dimitri John Ledkov <xnox@ubuntu.com> <xnox@ubuntu.com>
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com> <vda.linux@goo=
glemail.com>
> +Signed-off-by: Rahul Kumar <rahulk@mvista.com> <rahulk@mvista.com>
> +---
> + networking/wget.c | 20 +++++++++++++++++---
> + 1 file changed, 17 insertions(+), 3 deletions(-)
> +
> +diff --git a/networking/wget.c b/networking/wget.c
> +index 9153264..a7e6deb 100644
> +--- a/networking/wget.c
> ++++ b/networking/wget.c
> +@@ -91,6 +91,9 @@
> + //config:	patches, but do want to waste bandwidth expaining how wrong
> + //config:	it is, you will be ignored.
> + //config:
> ++//config:	FEATURE_WGET_OPENSSL does implement TLS verification
> ++//config:	using the certificates available to OpenSSL.
> ++//config:
> + //config:config FEATURE_WGET_OPENSSL
> + //config:	bool "Try to connect to HTTPS using openssl"
> + //config:	default y
> +@@ -115,6 +118,9 @@
> + //config:	If openssl can't be executed, internal TLS code will be used
> + //config:	(if you enabled it); if openssl can be executed but fails la=
ter,
> + //config:	wget can't detect this, and download will fail.
> ++//config:
> ++//config:	By default TLS verification is performed, unless
> ++//config:	--no-check-certificate option is passed.
> +
> + //applet:IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
> +
> +@@ -124,8 +130,11 @@
> + //usage:	IF_FEATURE_WGET_LONG_OPTIONS(
> + //usage:       "[-c|--continue] [--spider] [-q|--quiet] [-O|--output-d=
ocument FILE]\n"
> + //usage:       "	[-o|--output-file FILE] [--header 'header: value'] [-=
Y|--proxy on/off]\n"
> ++//usage:	IF_FEATURE_WGET_OPENSSL(
> ++//usage:       "	[--no-check-certificate]\n"
> ++//usage:	)
> + /* Since we ignore these opts, we don't show them in --help */
> +-/* //usage:    "	[--no-check-certificate] [--no-cache] [--passive-ftp]=
 [-t TRIES]" */
> ++/* //usage:    "	[--no-cache] [--passive-ftp] [-t TRIES]" */
> + /* //usage:    "	[-nv] [-nc] [-nH] [-np]" */
> + //usage:       "	[-P DIR] [-S|--server-response] [-U|--user-agent AGEN=
T]" IF_FEATURE_WGET_TIMEOUT(" [-T SEC]") " URL..."
> + //usage:	)
> +@@ -137,7 +146,9 @@
> + //usage:       "Retrieve files via HTTP or FTP\n"
> + //usage:	IF_FEATURE_WGET_LONG_OPTIONS(
> + //usage:     "\n	--spider	Only check URL existence: $? is 0 if exists"
> +-///////:     "\n	--no-check-certificate	Don't validate the server's ce=
rtificate"
> ++//usage:	IF_FEATURE_WGET_OPENSSL(
> ++//usage:     "\n	--no-check-certificate	Don't validate the server's ce=
rtificate"
> ++//usage:	)
> + //usage:	)
> + //usage:     "\n	-c	=09Continue retrieval of aborted transfer"
> + //usage:     "\n	-q	=09Quiet"
> +@@ -662,7 +673,7 @@ static int spawn_https_helper_openssl(const char *h=
ost, unsigned port)
> + =09pid =3D xvfork();
> + =09if (pid =3D=3D 0) {
> + =09	/* Child */
> +-	=09char *argv[8];
> ++	=09char *argv[9];
> +
> + =09	close(sp[0]);
> + =09	xmove_fd(sp[1], 0);
> +@@ -689,6 +700,9 @@ static int spawn_https_helper_openssl(const char *h=
ost, unsigned port)
> + =09	=09argv[5] =3D (char*)"-servername";
> + =09	=09argv[6] =3D (char*)servername;
> + =09	}
> ++	=09if (!(option_mask32 & WGET_OPT_NO_CHECK_CERT)) {
> ++	=09	argv[7] =3D (char*)"-verify_return_error";
> ++	=09}
> +
> + =09	BB_EXECVP(argv[0], argv);
> + =09	xmove_fd(3, 2);
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-=
core/busybox/busybox_1.31.1.bb
> index 2bb1d59..a6b4702 100644
> --- a/meta/recipes-core/busybox/busybox_1.31.1.bb
> +++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
> @@ -48,6 +48,7 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \
>             file://0001-Remove-syscall-wrappers-around-clock_gettime-clo=
ses-.patch \
>             file://0001-Remove-stime-function-calls.patch \
>             file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sy=
s-ne.patch \
> +           file://busybox-CVE-2018-1000500.patch \
>  " <https://busybox.net/downloads/busybox-$%7BPV%7D.tar.bz2;name=3Dtarba=
ll%5Cfile://0001-Remove-syscall-wrappers-around-clock_gettime-closes-.patch=
%5Cfile://0001-Remove-stime-function-calls.patch%5Cfile://0001-sysctl-ignor=
e-EIO-of-stable_secret-below-proc-sys-ne.patch%5C+file://busybox-CVE-2018-1=
000500.patch%5C>
>  SRC_URI_append_libc-musl =3D " file://musl.cfg "
>
>
>=20
>
>
>

--000000000000698d4005aa412cca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#0b5394">Hi Armin,<br><br>As per my observation, master br=
anch does not affect this CVE.<br><br>I could not get any reference where i=
 find out exactly from which version to which version, This CVE affect. <br=
><br>Since busybox upstarem released a patch for CVE-2018-1000500 with busy=
box v1_32_0~25<br>and master branch is using busybox v1.32.0-r0 and I check=
ed this patch code is present in busybox=C2=A0 v1.32.0-r0 source code.<br>s=
o master branch does not affect.<br><br></div><div class=3D"gmail_default" =
style=3D"font-family:verdana,sans-serif;color:#0b5394">Feel free to point o=
ut if I am wrong at any place.<br clear=3D"all"></div><div class=3D"gmail_d=
efault" style=3D"font-family:verdana,sans-serif;color:#0b5394"><br></div><d=
iv><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signa=
ture"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><span style=
=3D"color:rgb(111,168,220)">	=09
  =09
  
   <b><span style=3D"color:rgb(11,83,148)">Thanks &amp; Regards,</span></b=
></span></div><div><span style=3D"color:rgb(111,168,220)"><span style=3D"co=
lor:rgb(11,83,148)"></span></span><span style=3D"color:rgb(111,168,220)"><s=
pan style=3D"color:rgb(11,83,148)"></span></span></div><div><span style=3D"=
color:rgb(111,168,220)"><span style=3D"color:rgb(11,83,148)">Rahul Kumar</s=
pan></span></div><div><span style=3D"color:rgb(11,83,148)">Software Enginee=
r,Linux Solutions Engineering</span></div><div><span style=3D"color:rgb(11,=
83,148)"> Group,Montavista Software LLC</span></div><div><span style=3D"col=
or:rgb(11,83,148)">Email Id: <span style=3D"font-size:10pt"><a href=3D"mail=
to:rahulk@mvista.com" target=3D"_blank">rahulk@mvista.com</a></span></span>=
<span><a href=3D"https://plus.google.com/+CodeTwoSoftware" rel=3D"noopener"=
 target=3D"_blank"><span style=3D"font-family:Verdana,sans-serif;font-size:=
10pt;color:rgb(42,42,42)"><br></span></a></span></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div><br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 12=
, 2020 at 8:33 AM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">ak=
uster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
  
    
  
  <div>
    <br>
    <br>
    <div>On 7/11/20 6:21 PM, Rahul Kumar wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>CVE: CVE-2018-1000500

Signed-off-by: Rahul Kumar <a href=3D"mailto:rahulk@mvista.com" target=3D"=
_blank">&lt;rahulk@mvista.com&gt;</a></pre>
    </blockquote>
    <br>
    Does this affect master?<br>
    <br>
    -armin<br>
    <blockquote type=3D"cite">
      <pre>---
 .../busybox/busybox/busybox-CVE-2018-1000500.patch | 98 +++++++++++++++++=
+++++
 meta/recipes-core/busybox/<a href=3D"http://busybox_1.31.1.bb" target=3D"=
_blank">busybox_1.31.1.bb</a>        |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2018-100=
0500.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.pa=
tch b/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
new file mode 100644
index 0000000..cde3923
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-CVE-2018-1000500.patch
@@ -0,0 +1,98 @@
+From 71e7e2fb35c806d20f9739d832cd9ae3a86fdee2 Mon Sep 17 00:00:00 2001
+From: Dimitri John Ledkov <a href=3D"mailto:xnox@ubuntu.com" target=3D"_b=
lank">&lt;xnox@ubuntu.com&gt;</a>
+Date: Tue, 19 May 2020 18:20:39 +0100
+Subject: [PATCH] wget: implement TLS verification with
+ ENABLE_FEATURE_WGET_OPENSSL
+
+When ENABLE_FEATURE_WGET_OPENSSL is enabled, correctly implement TLS
+verification by default. And only ignore verification errors, if
+--no-check-certificate was passed.
+
+Also note, that previously OPENSSL implementation did not implement
+TLS verification, nor printed any warning messages that verification
+was not performed.
+
+Bug-Ubuntu: <a href=3D"https://bugs.launchpad.net/bugs/1879533" target=3D=
"_blank">https://bugs.launchpad.net/bugs/1879533</a>
+
+CVE-2018-1000500
+
+Upstream Status: Backport <a href=3D"https://git.busybox.net/busybox/comm=
it/?id=3D45fa3f18adf57ef9d743038743d9c90573aeeb91" target=3D"_blank">https:=
//git.busybox.net/busybox/commit/?id=3D45fa3f18adf57ef9d743038743d9c90573ae=
eb91</a>
+CVE: CVE-2018-1000500
+
+Signed-off-by: Dimitri John Ledkov <a href=3D"mailto:xnox@ubuntu.com" tar=
get=3D"_blank">&lt;xnox@ubuntu.com&gt;</a>
+Signed-off-by: Denys Vlasenko <a href=3D"mailto:vda.linux@googlemail.com"=
 target=3D"_blank">&lt;vda.linux@googlemail.com&gt;</a>
+Signed-off-by: Rahul Kumar <a href=3D"mailto:rahulk@mvista.com" target=3D=
"_blank">&lt;rahulk@mvista.com&gt;</a>
+---
+ networking/wget.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/networking/wget.c b/networking/wget.c
+index 9153264..a7e6deb 100644
+--- a/networking/wget.c
++++ b/networking/wget.c
+@@ -91,6 +91,9 @@
+ //config:	patches, but do want to waste bandwidth expaining how wrong
+ //config:	it is, you will be ignored.
+ //config:
++//config:	FEATURE_WGET_OPENSSL does implement TLS verification
++//config:	using the certificates available to OpenSSL.
++//config:
+ //config:config FEATURE_WGET_OPENSSL
+ //config:	bool &quot;Try to connect to HTTPS using openssl&quot;
+ //config:	default y
+@@ -115,6 +118,9 @@
+ //config:	If openssl can&#39;t be executed, internal TLS code will be us=
ed
+ //config:	(if you enabled it); if openssl can be executed but fails late=
r,
+ //config:	wget can&#39;t detect this, and download will fail.
++//config:
++//config:	By default TLS verification is performed, unless
++//config:	--no-check-certificate option is passed.
+=20
+ //applet:IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
+=20
+@@ -124,8 +130,11 @@
+ //usage:	IF_FEATURE_WGET_LONG_OPTIONS(
+ //usage:       &quot;[-c|--continue] [--spider] [-q|--quiet] [-O|--outpu=
t-document FILE]\n&quot;
+ //usage:       &quot;	[-o|--output-file FILE] [--header &#39;header: val=
ue&#39;] [-Y|--proxy on/off]\n&quot;
++//usage:	IF_FEATURE_WGET_OPENSSL(
++//usage:       &quot;	[--no-check-certificate]\n&quot;
++//usage:	)
+ /* Since we ignore these opts, we don&#39;t show them in --help */
+-/* //usage:    &quot;	[--no-check-certificate] [--no-cache] [--passive-f=
tp] [-t TRIES]&quot; */
++/* //usage:    &quot;	[--no-cache] [--passive-ftp] [-t TRIES]&quot; */
+ /* //usage:    &quot;	[-nv] [-nc] [-nH] [-np]&quot; */
+ //usage:       &quot;	[-P DIR] [-S|--server-response] [-U|--user-agent A=
GENT]&quot; IF_FEATURE_WGET_TIMEOUT(&quot; [-T SEC]&quot;) &quot; URL...&qu=
ot;
+ //usage:	)
+@@ -137,7 +146,9 @@
+ //usage:       &quot;Retrieve files via HTTP or FTP\n&quot;
+ //usage:	IF_FEATURE_WGET_LONG_OPTIONS(
+ //usage:     &quot;\n	--spider	Only check URL existence: $? is 0 if exis=
ts&quot;
+-///////:     &quot;\n	--no-check-certificate	Don&#39;t validate the serv=
er&#39;s certificate&quot;
++//usage:	IF_FEATURE_WGET_OPENSSL(
++//usage:     &quot;\n	--no-check-certificate	Don&#39;t validate the serv=
er&#39;s certificate&quot;
++//usage:	)
+ //usage:	)
+ //usage:     &quot;\n	-c	=09Continue retrieval of aborted transfer&quot;
+ //usage:     &quot;\n	-q	=09Quiet&quot;
+@@ -662,7 +673,7 @@ static int spawn_https_helper_openssl(const char *hos=
t, unsigned port)
+ =09pid =3D xvfork();
+ =09if (pid =3D=3D 0) {
+ =09	/* Child */
+-	=09char *argv[8];
++	=09char *argv[9];
+=20
+ =09	close(sp[0]);
+ =09	xmove_fd(sp[1], 0);
+@@ -689,6 +700,9 @@ static int spawn_https_helper_openssl(const char *hos=
t, unsigned port)
+ =09	=09argv[5] =3D (char*)&quot;-servername&quot;;
+ =09	=09argv[6] =3D (char*)servername;
+ =09	}
++	=09if (!(option_mask32 &amp; WGET_OPT_NO_CHECK_CERT)) {
++	=09	argv[7] =3D (char*)&quot;-verify_return_error&quot;;
++	=09}
+=20
+ =09	BB_EXECVP(argv[0], argv);
+ =09	xmove_fd(3, 2);
+--=20
+2.7.4
+
diff --git a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.31.1.bb=
" target=3D"_blank">busybox_1.31.1.bb</a> b/meta/recipes-core/busybox/<a hr=
ef=3D"http://busybox_1.31.1.bb" target=3D"_blank">busybox_1.31.1.bb</a>
index 2bb1d59..a6b4702 100644
--- a/meta/recipes-core/busybox/<a href=3D"http://busybox_1.31.1.bb" targe=
t=3D"_blank">busybox_1.31.1.bb</a>
+++ b/meta/recipes-core/busybox/<a href=3D"http://busybox_1.31.1.bb" targe=
t=3D"_blank">busybox_1.31.1.bb</a>
@@ -48,6 +48,7 @@ SRC_URI =3D <a href=3D"https://busybox.net/downloads/bus=
ybox-$%7BPV%7D.tar.bz2;name=3Dtarball%5Cfile://0001-Remove-syscall-wrappers=
-around-clock_gettime-closes-.patch%5Cfile://0001-Remove-stime-function-cal=
ls.patch%5Cfile://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne=
.patch%5C+file://busybox-CVE-2018-1000500.patch%5C" target=3D"_blank">&quot=
;https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
            file://0001-Remove-syscall-wrappers-around-clock_gettime-close=
s-.patch \
            file://0001-Remove-stime-function-calls.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-=
ne.patch \
+           file://busybox-CVE-2018-1000500.patch \
 &quot;</a>
 SRC_URI_append_libc-musl =3D <a>&quot; file://musl.cfg &quot;</a>
=20
</pre>
      <br>
      <fieldset></fieldset>
      <pre>
</pre>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--000000000000698d4005aa412cca--
