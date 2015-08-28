Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 269F460043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:38:53 +0000 (UTC)
Received: by obbfr1 with SMTP id fr1so38722135obb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 00:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=edWn1r7CB4qGs50Au4Vu1LtP+MhyD+uFMQ0eORp+vLA=;
	b=QOCLixTVQuHOsBwosO//DqJg8GyhLnKbBpHNS4VazVDMCJ6BXwKNm+OjjFHGFKtkGS
	iR2p+6CrA9F9ANaW9hiH5QZez2J2Fj2SSGT5Hw22x8c6aGKtDriCPpe53THrm7d23yEw
	c5YGGsGUnIr0SeWizMa6oMeoD6pbO2kc0w5lQOrP0jW88+3/i58Z2KFLI7c2wNJuJ+j1
	hrJAl6D4Xmh+P8XRnAW7IRkZHlK0/9y2ARo54PrFRM2uloRNfhMq9/ExDMdDJLCE2lFz
	IJKecyvNRl87LicbaFmLEhjVg5Lk6ZXHjjaCKMXfpFw3zlxU1PCm9RUsLuBEK7p9mkYj
	g38A==
X-Gm-Message-State: ALoCoQn+DPfkZ832wuyNmJjPoZLlXfLRrPp5OsnzQ1DdbEvHF9Rw8eRmH90bNfLabo/IZycDvY74
X-Received: by 10.182.87.36 with SMTP id u4mr4899783obz.50.1440747533313; Fri,
	28 Aug 2015 00:38:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Fri, 28 Aug 2015 00:38:23 -0700 (PDT)
In-Reply-To: <88b9e990cf8f26a6e5dc1fe1d8fa60ab9f5b3443.1440700983.git.chris_larson@mentor.com>
References: <cover.1440700983.git.chris_larson@mentor.com>
	<88b9e990cf8f26a6e5dc1fe1d8fa60ab9f5b3443.1440700983.git.chris_larson@mentor.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 28 Aug 2015 10:38:23 +0300
Message-ID: <CAHiDW_Hv6xqkfah1y74Y+6APhFz57LRihxk2UKK6wrBb22HSgg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] iw: support and enable separate build dir
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
X-List-Received-Date: Fri, 28 Aug 2015 07:38:54 -0000
Content-Type: multipart/alternative; boundary=089e013d0ddcef42c4051e5a2c7d

--089e013d0ddcef42c4051e5a2c7d
Content-Type: text/plain; charset=UTF-8

On 27 August 2015 at 21:48, Christopher Larson <kergoth@gmail.com> wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  .../iw/iw/separate-objdir.patch                    | 55
> ++++++++++++++++++++++
>  meta/recipes-connectivity/iw/iw_4.1.bb             |  4 ++
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta/recipes-connectivity/iw/iw/separate-objdir.patch
>
> diff --git a/meta/recipes-connectivity/iw/iw/separate-objdir.patch
> b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
> new file mode 100644
> index 0000000..e29e461
> --- /dev/null
> +++ b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
> @@ -0,0 +1,55 @@
> +From 9e27fc2e1b3dc8c36ef6a502edffc3a3d84d9dd9 Mon Sep 17 00:00:00 2001
> +From: Christopher Larson <chris_larson@mentor.com>
> +Date: Wed, 26 Aug 2015 17:23:48 -0700
> +Subject: [PATCH] Support separation of SRCDIR and OBJDIR
> +
> +Typical use of VPATH to locate the sources.
> +
> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +
>

Upstream-Status ?

 - Jussi

+---
> + Makefile   | 7 +++++--
> + version.sh | 2 +-
> + 2 files changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 548591a..da8d33a 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,5 +1,8 @@
> + MAKEFLAGS += --no-print-directory
> +
> ++SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
> ++OBJDIR ?= $(PWD)
> ++VPATH = $(SRCDIR)
> + PREFIX ?= /usr
> + SBINDIR ?= $(PREFIX)/sbin
> + MANDIR ?= $(PREFIX)/share/man
> +@@ -95,11 +98,11 @@ VERSION_OBJS := $(filter-out version.o, $(OBJS))
> + version.c: version.sh $(patsubst %.o,%.c,$(VERSION_OBJS)) nl80211.h iw.h
> Makefile \
> +               $(wildcard .git/index .git/refs/tags)
> +       @$(NQ) ' GEN ' $@
> +-      $(Q)./version.sh $@
> ++      $(Q)cd $(SRCDIR) && ./version.sh $(OBJDIR)/$@
> +
> + %.o: %.c iw.h nl80211.h
> +       @$(NQ) ' CC  ' $@
> +-      $(Q)$(CC) $(CFLAGS) -c -o $@ $<
> ++      $(Q)$(CC) -I$(SRCDIR) $(CFLAGS) -c -o $@ $<
> +
> + ifeq ($(IW_ANDROID_BUILD),)
> + iw:   $(OBJS)
> +diff --git a/version.sh b/version.sh
> +index 5354383..fa954cf 100755
> +--- a/version.sh
> ++++ b/version.sh
> +@@ -5,5 +5,5 @@ OUT="$1"
> +
> + v="$VERSION"
> +
> +-echo '#include "iw.h"' > "$OUT"
> ++echo '#include <iw.h>' > "$OUT"
> + echo "const char iw_version[] = \"$v\";" >> "$OUT"
> +--
> +2.2.1
> +
> diff --git a/meta/recipes-connectivity/iw/iw_4.1.bb
> b/meta/recipes-connectivity/iw/iw_4.1.bb
> index 8e27862..fafb0e3 100644
> --- a/meta/recipes-connectivity/iw/iw_4.1.bb
> +++ b/meta/recipes-connectivity/iw/iw_4.1.bb
> @@ -11,6 +11,7 @@ DEPENDS = "libnl"
>
>  SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
>
> file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
> +           file://separate-objdir.patch \
>  "
>
>  SRC_URI[md5sum] = "68c282285c71c956069957e9ca10a6a7"
> @@ -19,10 +20,13 @@ SRC_URI[sha256sum] =
> "14bfc627b37f7f607e4ffa63a70ded15fa2ea85177f703cb17d7fe36f9
>  inherit pkgconfig
>
>  EXTRA_OEMAKE = "\
> +    -f '${S}/Makefile' \
> +    \
>      'PREFIX=${prefix}' \
>      'SBINDIR=${sbindir}' \
>      'MANDIR=${mandir}' \
>  "
> +B = "${WORKDIR}/build"
>
>  do_install() {
>      oe_runmake 'DESTDIR=${D}' install
> --
> 2.2.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e013d0ddcef42c4051e5a2c7d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
7 August 2015 at 21:48, Christopher Larson <span dir=3D"ltr">&lt;<a href=3D=
"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">From: Christopher Larson &lt;<a=
 href=3D"mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br=
>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br>
---<br>
=C2=A0.../iw/iw/separate-objdir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 55 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-connectivity/iw/<a href=3D"http://iw_4.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">iw_4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++<br>
=C2=A02 files changed, 59 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/iw/iw/separate-objdir.pa=
tch<br>
<br>
diff --git a/meta/recipes-connectivity/iw/iw/separate-objdir.patch b/meta/r=
ecipes-connectivity/iw/iw/separate-objdir.patch<br>
new file mode 100644<br>
index 0000000..e29e461<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/iw/iw/separate-objdir.patch<br>
@@ -0,0 +1,55 @@<br>
+From 9e27fc2e1b3dc8c36ef6a502edffc3a3d84d9dd9 Mon Sep 17 00:00:00 2001<br>
+From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com">ch=
ris_larson@mentor.com</a>&gt;<br>
+Date: Wed, 26 Aug 2015 17:23:48 -0700<br>
+Subject: [PATCH] Support separation of SRCDIR and OBJDIR<br>
+<br>
+Typical use of VPATH to locate the sources.<br>
+<br>
+Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mento=
r.com">chris_larson@mentor.com</a>&gt;<br>
+<br></blockquote><div><br></div><div>Upstream-Status ?</div><div>=C2=A0</d=
iv><div>=C2=A0- Jussi</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+---<br>
+ Makefile=C2=A0 =C2=A0| 7 +++++--<br>
+ version.sh | 2 +-<br>
+ 2 files changed, 6 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 548591a..da8d33a 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -1,5 +1,8 @@<br>
+ MAKEFLAGS +=3D --no-print-directory<br>
+<br>
++SRCDIR ?=3D $(dir $(lastword $(MAKEFILE_LIST)))<br>
++OBJDIR ?=3D $(PWD)<br>
++VPATH =3D $(SRCDIR)<br>
+ PREFIX ?=3D /usr<br>
+ SBINDIR ?=3D $(PREFIX)/sbin<br>
+ MANDIR ?=3D $(PREFIX)/share/man<br>
+@@ -95,11 +98,11 @@ VERSION_OBJS :=3D $(filter-out version.o, $(OBJS))<br>
+ version.c: version.sh $(patsubst %.o,%.c,$(VERSION_OBJS)) nl80211.h iw.h =
Makefile \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(wildcard .git/ind=
ex .git/refs/tags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(NQ) &#39; GEN &#39; $@<br>
+-=C2=A0 =C2=A0 =C2=A0 $(Q)./version.sh $@<br>
++=C2=A0 =C2=A0 =C2=A0 $(Q)cd $(SRCDIR) &amp;&amp; ./version.sh $(OBJDIR)/$=
@<br>
+<br>
+ %.o: %.c iw.h nl80211.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(NQ) &#39; CC=C2=A0 &#39; $@<br>
+-=C2=A0 =C2=A0 =C2=A0 $(Q)$(CC) $(CFLAGS) -c -o $@ $&lt;<br>
++=C2=A0 =C2=A0 =C2=A0 $(Q)$(CC) -I$(SRCDIR) $(CFLAGS) -c -o $@ $&lt;<br>
+<br>
+ ifeq ($(IW_ANDROID_BUILD),)<br>
+ iw:=C2=A0 =C2=A0$(OBJS)<br>
+diff --git a/version.sh b/version.sh<br>
+index 5354383..fa954cf 100755<br>
+--- a/version.sh<br>
++++ b/version.sh<br>
+@@ -5,5 +5,5 @@ OUT=3D&quot;$1&quot;<br>
+<br>
+ v=3D&quot;$VERSION&quot;<br>
+<br>
+-echo &#39;#include &quot;iw.h&quot;&#39; &gt; &quot;$OUT&quot;<br>
++echo &#39;#include &lt;iw.h&gt;&#39; &gt; &quot;$OUT&quot;<br>
+ echo &quot;const char iw_version[] =3D \&quot;$v\&quot;;&quot; &gt;&gt; &=
quot;$OUT&quot;<br>
+--<br>
+2.2.1<br>
+<br>
diff --git a/meta/recipes-connectivity/iw/<a href=3D"http://iw_4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">iw_4.1.bb</a> b/meta/recipes-connectivity=
/iw/<a href=3D"http://iw_4.1.bb" rel=3D"noreferrer" target=3D"_blank">iw_4.=
1.bb</a><br>
index 8e27862..fafb0e3 100644<br>
--- a/meta/recipes-connectivity/iw/<a href=3D"http://iw_4.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">iw_4.1.bb</a><br>
+++ b/meta/recipes-connectivity/iw/<a href=3D"http://iw_4.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">iw_4.1.bb</a><br>
@@ -11,6 +11,7 @@ DEPENDS =3D &quot;libnl&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://www.kernel.org/pub/software/netwo=
rk/iw/${BP}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.kernel.=
org/pub/software/network/iw/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-iw-version.sh-don-t-u=
se-git-describe-for-versioning.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://separate-objdir.patch \<br=
>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;68c282285c71c956069957e9ca10a6a7&quot;<br>
@@ -19,10 +20,13 @@ SRC_URI[sha256sum] =3D &quot;14bfc627b37f7f607e4ffa63a7=
0ded15fa2ea85177f703cb17d7fe36f9<br>
=C2=A0inherit pkgconfig<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot;\<br>
+=C2=A0 =C2=A0 -f &#39;${S}/Makefile&#39; \<br>
+=C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0&#39;PREFIX=3D${prefix}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0&#39;SBINDIR=3D${sbindir}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0&#39;MANDIR=3D${mandir}&#39; \<br>
=C2=A0&quot;<br>
+B =3D &quot;${WORKDIR}/build&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; install<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.2.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--089e013d0ddcef42c4051e5a2c7d--
