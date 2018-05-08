Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB5074E5F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 09:08:31 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id f21-v6so37504267iob.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xLWhq6wXJHB7c/wpvjdCixPtzZMneSB25Ud1Y6/IpRE=;
	b=r2FTbLnzuK6iJwO8vtVBtFobukqhxAcsagVW5OPYA1e0CUyMI2+hrIsRyi22LZgHwa
	kJi4JhLZdS1g2CZ592SWIRKETG/9qj2gHpzgo65tseek7XQiH2t8lHV1ByMefdE0ykQ5
	bESITucyh+SrmlQu3gFt4bL6D1srHF2AQ7fHVdti7dLypUF9qZzGnjg69vaiRO7XXB89
	RsSFmmeboCMf/GvJBb3AWbsNF9Q0nk04k1lR5VmTrEsJicUei3ifhF4iKmADwxT+lgmb
	7SHjfVcyBQ40vq4qQhgEOakaGOV4gkwVj1LFIcBUn8kfmEr1UrCREBI5GwtXTk/B+7Lg
	rQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xLWhq6wXJHB7c/wpvjdCixPtzZMneSB25Ud1Y6/IpRE=;
	b=C7PYq3bzx2Tiw4C+HSdpxNYJzkBICP3Bc1dO5kaFSoCfk0TWRWVHqvz+9TibsU5ixt
	uPHLbjQUg0FzlzP4tmRLwW/I6Qrw7k+2VkDmE+8S7BVa2CVCwDjvqQfNtR+ODBfzUPtX
	65YtdSwyrGIr9w0mQtq+dSx3gKjSPIZtQ7fm2gJ9eOwqMzEdzFo/YmGsKLCbePRk7u5e
	wy1Yi3MeUjnfmMzzCSH/l6Kq4FQy3ebDdbR30N7RsIzCE8agt1SySD8iFttdCFj5yKwQ
	MaCnhzct0I3MR9TpraBCcx13bHfDY+c7NXGhZpK7pdJTtN92MkaNGxHyXF01lop0+8x0
	q4rA==
X-Gm-Message-State: ALQs6tCxDu+qw2SjxHcvZDqI5m9PhUb16p7ZJ5fR8SdUfclaHRS8G3fk
	jRkU3T5fFBaDBqr2WsvY8aQiUdFEJkrl4lgh/tofTvNa
X-Google-Smtp-Source: AB8JxZqUu9yU0DXvDUZLCwN84s6QXvpUDCDy4sj123EQL/ZnrbUmu6tvyWAj7aiUua9gRf5+1LzDBocYS/ifyC83LB0=
X-Received: by 2002:a6b:248e:: with SMTP id
	k136-v6mr41141791iok.270.1525770512185; 
	Tue, 08 May 2018 02:08:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Tue, 8 May 2018 02:08:11 -0700 (PDT)
In-Reply-To: <20180508090524.79759-1-zhixiong.chi@windriver.com>
References: <20180508090524.79759-1-zhixiong.chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 May 2018 10:08:11 +0100
Message-ID: <CAJTo0La_gxEOVPO1NRG0a8Wow8cPdEBv=HzBD+Fzt0pS3GSHjg@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gettext: make gettext independant of host java components
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
X-List-Received-Date: Tue, 08 May 2018 09:08:31 -0000
Content-Type: multipart/alternative; boundary="0000000000006348bf056bae21ee"

--0000000000006348bf056bae21ee
Content-Type: text/plain; charset="UTF-8"

Is it possible to seed the result of gt_JAVACOMP instead of hacking the
configure script?

Ross

On 8 May 2018 at 10:05, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:

> The checksums of gettext were changing based on whether or not java
> and javac were installed. This patch makes gettext recipes independant
> of Java components.
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  ...ke-gettext-independant-of-java-components.patch | 88
> ++++++++++++++++++++++
>  meta/recipes-core/gettext/gettext_0.19.8.1.bb      |  1 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 meta/recipes-core/gettext/
> gettext-0.19.8.1/make-gettext-independant-of-java-components.patch
>
> diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/make-gettext-
> independant-of-java-components.patch b/meta/recipes-core/gettext/
> gettext-0.19.8.1/make-gettext-independant-of-java-components.patch
> new file mode 100644
> index 0000000000..d3a4c5a056
> --- /dev/null
> +++ b/meta/recipes-core/gettext/gettext-0.19.8.1/make-gettext-
> independant-of-java-components.patch
> @@ -0,0 +1,88 @@
> +From: "Deere & Company" <john@johndeere.com>
> +Subject: [PATCH] configure to gettext to default with no java and javac.
> +Author: patilashish3@JohnDeere.com, yeatesrichardr@JohnDeere.com
> +
> +The checksums of gettext were changing based on whether or not java and
> javac were installed.
> +This patch makes gettext recipes independant of Java components.
> +
> +Upstream-Status: inappropriate [oe-core specific]
> +
> +Signed-off-by: Luis Ramirez <Luis.Ramirez@windriver.com>
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +
> +Index: gettext-0.19.8.1/gettext-runtime/configure.ac
> +===================================================================
> +--- gettext-0.19.8.1.orig/gettext-runtime/configure.ac 2014-12-09
> 16:43:44.000000000 +0800
> ++++ gettext-0.19.8.1/gettext-runtime/configure.ac      2018-03-07
> 14:51:57.318227813 +0800
> +@@ -35,7 +35,25 @@
> +
> + gt_JAVA_CHOICE
> +
> +-gt_JAVACOMP([1.3], [1.1])
> ++dnl replaced gt_JAVACOMP([1.3], [1.1]) with results when no javac is
> installed
> ++CONF_JAVAC=
> ++HAVE_JAVAC_ENVVAR=
> ++CLASSPATH=
> ++CLASSPATH_SEPARATOR=:
> ++HAVE_GCJ_C=
> ++HAVE_JAVAC=
> ++HAVE_JIKES=
> ++HAVE_JAVACOMP=
> ++
> ++AC_SUBST([CONF_JAVAC])
> ++AC_SUBST([HAVE_JAVAC_ENVVAR])
> ++AC_SUBST([CLASSPATH])
> ++AC_SUBST([CLASSPATH_SEPARATOR])
> ++AC_SUBST([HAVE_JAVAC])
> ++AC_SUBST([HAVE_GCJ_C])
> ++AC_SUBST([HAVE_JIKES])
> ++AC_SUBST([HAVE_JAVACOMP])
> ++
> + AC_CHECK_PROG([JAR], [jar], [jar])
> + if test -n "$HAVE_JAVACOMP" && test -n "$JAR" && test "$JAVA_CHOICE" !=
> no; then
> +   BUILDJAVA=yes
> +Index: gettext-0.19.8.1/gettext-tools/configure.ac
> +===================================================================
> +--- gettext-0.19.8.1.orig/gettext-tools/configure.ac   2014-12-09
> 16:43:45.000000000 +0800
> ++++ gettext-0.19.8.1/gettext-tools/configure.ac        2018-03-07
> 14:54:57.654229070 +0800
> +@@ -43,8 +43,38 @@
> + fi
> + AC_SUBST([BUILDJAVAEXE])
> +
> +-gt_JAVAEXEC
> +-gt_JAVACOMP([1.3])
> ++dnl replaced gt_JAVAEXEC with results when no java is installed
> ++CONF_JAVA=
> ++HAVE_JAVA_ENVVAR=
> ++HAVE_GIJ=
> ++HAVE_JAVA=
> ++HAVE_JRE=
> ++HAVE_JVIEW=
> ++AC_SUBST([CONF_JAVA])
> ++AC_SUBST([HAVE_JAVA_ENVVAR])
> ++AC_SUBST([HAVE_GIJ])
> ++AC_SUBST([HAVE_JAVA])
> ++AC_SUBST([HAVE_JRE])
> ++AC_SUBST([HAVE_JVIEW])
> ++
> ++dnl replaced gt_JAVACOMP([1.3]) with results when no javac is installed
> ++CONF_JAVAC=
> ++HAVE_JAVAC_ENVVAR=
> ++CLASSPATH=
> ++CLASSPATH_SEPARATOR=:
> ++HAVE_GCJ_C=
> ++HAVE_JAVAC=
> ++HAVE_JIKES=
> ++HAVE_JAVACOMP=
> ++AC_SUBST([CONF_JAVAC])
> ++AC_SUBST([HAVE_JAVAC_ENVVAR])
> ++AC_SUBST([CLASSPATH])
> ++AC_SUBST([CLASSPATH_SEPARATOR])
> ++AC_SUBST([HAVE_JAVAC])
> ++AC_SUBST([HAVE_GCJ_C])
> ++AC_SUBST([HAVE_JIKES])
> ++AC_SUBST([HAVE_JAVACOMP])
> ++
> + AC_CHECK_PROG([JAR], [jar], [jar])
> + if test -n "$HAVE_JAVACOMP" && test -n "$JAR" && test "$JAVA_CHOICE" !=
> no; then
> +   BUILDJAVA=yes
> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> index 68f5cc329a..9ba74120cd 100644
> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
> @@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>            file://add-with-bisonlocaledir.patch \
>            file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
>            file://use-pkgconfig.patch \
> +          file://make-gettext-independant-of-java-components.patch \
>  "
>
>  SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000006348bf056bae21ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is it possible to seed the result of=C2=A0<span style=3D"f=
ont-size:12.800000190734863px">gt_JAVACOMP instead of hacking the configure=
 script?</span><div><span style=3D"font-size:12.800000190734863px"><br></sp=
an></div><div><span style=3D"font-size:12.800000190734863px">Ross</span></d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 8 May=
 2018 at 10:05, Zhixiong Chi <span dir=3D"ltr">&lt;<a href=3D"mailto:zhixio=
ng.chi@windriver.com" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">The checksums of gettext we=
re changing based on whether or not java<br>
and javac were installed. This patch makes gettext recipes independant<br>
of Java components.<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0...ke-gettext-independant-of-<wbr>java-components.patch | 88 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gett<wbr>ext_0.19.8.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 89 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/gettext/<wbr>gettext-0.19.8.1/ma=
ke-gettext-<wbr>independant-of-java-<wbr>components.patch<br>
<br>
diff --git a/meta/recipes-core/gettext/<wbr>gettext-0.19.8.1/make-gettext-<=
wbr>independant-of-java-<wbr>components.patch b/meta/recipes-core/gettext/<=
wbr>gettext-0.19.8.1/make-gettext-<wbr>independant-of-java-<wbr>components.=
patch<br>
new file mode 100644<br>
index 0000000000..d3a4c5a056<br>
--- /dev/null<br>
+++ b/meta/recipes-core/gettext/<wbr>gettext-0.19.8.1/make-gettext-<wbr>ind=
ependant-of-java-<wbr>components.patch<br>
@@ -0,0 +1,88 @@<br>
+From: &quot;Deere &amp; Company&quot; &lt;<a href=3D"mailto:john@johndeere=
.com">john@johndeere.com</a>&gt;<br>
+Subject: [PATCH] configure to gettext to default with no java and javac. <=
br>
+Author: patilashish3@JohnDeere.com, yeatesrichardr@JohnDeere.com<br>
+<br>
+The checksums of gettext were changing based on whether or not java and ja=
vac were installed.<br>
+This patch makes gettext recipes independant of Java components.<br>
+<br>
+Upstream-Status: inappropriate [oe-core specific]<br>
+<br>
+Signed-off-by: Luis Ramirez &lt;<a href=3D"mailto:Luis.Ramirez@windriver.c=
om">Luis.Ramirez@windriver.com</a>&gt;<br>
+Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.c=
om">zhixiong.chi@windriver.com</a>&gt;<br>
+<br>
+Index: gettext-0.19.8.1/gettext-<wbr>runtime/<a href=3D"http://configure.a=
c" rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gettext-0.19.8.1.orig/gettext-<wbr>runtime/<a href=3D"http://configure=
.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> 2014-12-09 16:43=
:44.000000000 +0800<br>
++++ gettext-0.19.8.1/gettext-<wbr>runtime/<a href=3D"http://configure.ac" =
rel=3D"noreferrer" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 2=
018-03-07 14:51:57.318227813 +0800<br>
+@@ -35,7 +35,25 @@<br>
+ <br>
+ gt_JAVA_CHOICE<br>
+ <br>
+-gt_JAVACOMP([1.3], [1.1])<br>
++dnl replaced gt_JAVACOMP([1.3], [1.1]) with results when no javac is inst=
alled<br>
++CONF_JAVAC=3D<br>
++HAVE_JAVAC_ENVVAR=3D<br>
++CLASSPATH=3D<br>
++CLASSPATH_SEPARATOR=3D:<br>
++HAVE_GCJ_C=3D<br>
++HAVE_JAVAC=3D<br>
++HAVE_JIKES=3D<br>
++HAVE_JAVACOMP=3D<br>
++<br>
++AC_SUBST([CONF_JAVAC])<br>
++AC_SUBST([HAVE_JAVAC_ENVVAR]<wbr>)<br>
++AC_SUBST([CLASSPATH])<br>
++AC_SUBST([CLASSPATH_<wbr>SEPARATOR])<br>
++AC_SUBST([HAVE_JAVAC])<br>
++AC_SUBST([HAVE_GCJ_C])<br>
++AC_SUBST([HAVE_JIKES])<br>
++AC_SUBST([HAVE_JAVACOMP])<br>
++<br>
+ AC_CHECK_PROG([JAR], [jar], [jar])<br>
+ if test -n &quot;$HAVE_JAVACOMP&quot; &amp;&amp; test -n &quot;$JAR&quot;=
 &amp;&amp; test &quot;$JAVA_CHOICE&quot; !=3D no; then<br>
+=C2=A0 =C2=A0BUILDJAVA=3Dyes<br>
+Index: gettext-0.19.8.1/gettext-<wbr>tools/<a href=3D"http://configure.ac"=
 rel=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gettext-0.19.8.1.orig/gettext-<wbr>tools/<a href=3D"http://configure.a=
c" rel=3D"noreferrer" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A02014-1=
2-09 16:43:45.000000000 +0800<br>
++++ gettext-0.19.8.1/gettext-<wbr>tools/<a href=3D"http://configure.ac" re=
l=3D"noreferrer" target=3D"_blank">configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 2018-03-07 14:54:57.654229070 +0800<br>
+@@ -43,8 +43,38 @@<br>
+ fi<br>
+ AC_SUBST([BUILDJAVAEXE])<br>
+ <br>
+-gt_JAVAEXEC<br>
+-gt_JAVACOMP([1.3])<br>
++dnl replaced gt_JAVAEXEC with results when no java is installed<br>
++CONF_JAVA=3D<br>
++HAVE_JAVA_ENVVAR=3D<br>
++HAVE_GIJ=3D<br>
++HAVE_JAVA=3D<br>
++HAVE_JRE=3D<br>
++HAVE_JVIEW=3D<br>
++AC_SUBST([CONF_JAVA])<br>
++AC_SUBST([HAVE_JAVA_ENVVAR])<br>
++AC_SUBST([HAVE_GIJ])<br>
++AC_SUBST([HAVE_JAVA])<br>
++AC_SUBST([HAVE_JRE])<br>
++AC_SUBST([HAVE_JVIEW])<br>
++<br>
++dnl replaced gt_JAVACOMP([1.3]) with results when no javac is installed<b=
r>
++CONF_JAVAC=3D<br>
++HAVE_JAVAC_ENVVAR=3D<br>
++CLASSPATH=3D<br>
++CLASSPATH_SEPARATOR=3D:<br>
++HAVE_GCJ_C=3D<br>
++HAVE_JAVAC=3D<br>
++HAVE_JIKES=3D<br>
++HAVE_JAVACOMP=3D<br>
++AC_SUBST([CONF_JAVAC])<br>
++AC_SUBST([HAVE_JAVAC_ENVVAR]<wbr>)<br>
++AC_SUBST([CLASSPATH])<br>
++AC_SUBST([CLASSPATH_<wbr>SEPARATOR])<br>
++AC_SUBST([HAVE_JAVAC])<br>
++AC_SUBST([HAVE_GCJ_C])<br>
++AC_SUBST([HAVE_JIKES])<br>
++AC_SUBST([HAVE_JAVACOMP])<br>
++<br>
+ AC_CHECK_PROG([JAR], [jar], [jar])<br>
+ if test -n &quot;$HAVE_JAVACOMP&quot; &amp;&amp; test -n &quot;$JAR&quot;=
 &amp;&amp; test &quot;$JAVA_CHOICE&quot; !=3D no; then<br>
+=C2=A0 =C2=A0BUILDJAVA=3Dyes<br>
diff --git a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.b=
b" rel=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a> b/meta=
/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=3D"norefer=
rer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
index 68f5cc329a..9ba74120cd 100644<br>
--- a/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
+++ b/meta/recipes-core/gettext/<a href=3D"http://gettext_0.19.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ge<wbr>ttext_0.19.8.1.bb</a><br>
@@ -18,6 +18,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gettext/<wbr>gettext-${PV=
}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add-with-<wbr>bisonlocaledi=
r.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cr-statement.c-timsort.<wbr=
>h-fix-formatting-issues.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-pkgconfig.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://make-gettext-<wbr>independant-of=
-java-<wbr>components.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>97e034cf8ce5ba73a28ff6c3c06380<wbr>92&=
quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.11.0<br>
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

--0000000000006348bf056bae21ee--
