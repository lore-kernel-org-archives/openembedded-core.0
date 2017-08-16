Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 34AC678675
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 11:34:45 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 76so15893419ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 04:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OzTHqxc94vnttcJpjFC9pymaoSpWaTcYk3G2e/ytvcA=;
	b=dGDO4y3IB8oEbJUGa8E7/bLF6ZbVt2kPE0dx+cxjV0peDbOJ/XdWvG7s2juNf9B6EV
	VwDdEY2nHI6kejMMjPbSEueErA7TgO40KXcWpkkPyjlOk9rMOhmLsdMY/71S0SIL3psJ
	iZySH6sd0GVDbC9lVGqcAXwFO+cthhvO06cOIS+lb4mWtSqZRC4g2llN66i5jl4C3mqd
	tbqHQIMxUTA3MGbyy13BhidEuPkl96Wj9AdaTGVHFfuSzoYsVBSsJz8xEucvoy6597Rs
	2t+s4OBdUPmcBBmm0mEh7tqhqk3rBCI3s8gHVf6/D+AYGDjaJjWK60pUcOTkzpWIt5fQ
	3TDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OzTHqxc94vnttcJpjFC9pymaoSpWaTcYk3G2e/ytvcA=;
	b=CyvCE7xiUnxZt6zw2/oU/GLPrzniFQple0hG1JC0lIvfS2x1UTdew2Xpd3Q3DNqOS2
	hUMTrc4S0QODmOE4sLIWT9HT9nrS8+Zyu+VyN1KR3izfXMSNliYnYHtLQDKWlQ2dg9Js
	qrSiw2kkgQ4wFEexYBpcVocw/dgqMTsYZ1I14NjqsWbYOYRviHaiHISpk/59HXWtJtja
	b8abA5yC+FcFqn0ede7q4mbACp/Zvbkp9ThLeza2gWMEMkpqS/CstEljDIsnYk9SuZpc
	3lPISmjgLMEx2puOBpc2wZb9SbE7S72EtYsJmVaB2PQw9pfDJnT7N+UCPcZ1LtDmPORm
	ezbw==
X-Gm-Message-State: AHYfb5iKQXeCnHE0mu8FIAKOjIRWbwH/TUoWssiS3rEkMvLke0XzW5ZV
	THklQTu857RQHNVUN1gtNZ3NfThKOIWR
X-Received: by 10.36.243.14 with SMTP id t14mr1040116ith.109.1502883287147;
	Wed, 16 Aug 2017 04:34:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.19 with HTTP; Wed, 16 Aug 2017 04:34:16 -0700 (PDT)
In-Reply-To: <7751264307b6966841699d05c26c8d643fcff3ef.1502879234.git.Qi.Chen@windriver.com>
References: <cover.1502879234.git.Qi.Chen@windriver.com>
	<7751264307b6966841699d05c26c8d643fcff3ef.1502879234.git.Qi.Chen@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 16 Aug 2017 14:34:16 +0300
Message-ID: <CAHiDW_G9qymXQamiAvFpZmo+drd2TWkOv3eYPTEUxg6pLDNjqw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] shadow: fix CVE-2017-12424
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
X-List-Received-Date: Wed, 16 Aug 2017 11:34:46 -0000
Content-Type: multipart/alternative; boundary="f403045fb07c7840900556dd4821"

--f403045fb07c7840900556dd4821
Content-Type: text/plain; charset="UTF-8"

On 16 August 2017 at 13:28, Chen Qi <Qi.Chen@windriver.com> wrote:

> Backport a patch to fix CVE-2017-12424.
>
> In shadow before 4.5, the newusers tool could be made to manipulate
> internal data structures in ways unintended by the authors.
>
> Reference link: https://nvd.nist.gov/vuln/detail/CVE-2017-12424
>
> CVE: CVE-2017-12424
>

I don't object to the patch but I'm wondering if there is a reason we are
taking the shadow sources from debian instead of the upstream github*?
shadow 4.5 seems to have been out for months already but Debian hasn't
taken it yet...

*) https://github.com/shadow-maint/shadow

Jussi



>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../shadow/files/0001-shadow-CVE-2017-12424        | 46
> ++++++++++++++++++++++
>  meta/recipes-extended/shadow/shadow.inc            |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-extended/shadow/
> files/0001-shadow-CVE-2017-12424
>
> diff --git a/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
> b/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
> new file mode 100644
> index 0000000..4d3e1e0
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
> @@ -0,0 +1,46 @@
> +From 954e3d2e7113e9ac06632aee3c69b8d818cc8952 Mon Sep 17 00:00:00 2001
> +From: Tomas Mraz <tmraz@fedoraproject.org>
> +Date: Fri, 31 Mar 2017 16:25:06 +0200
> +Subject: [PATCH] Fix buffer overflow if NULL line is present in db.
> +
> +If ptr->line == NULL for an entry, the first cycle will exit,
> +but the second one will happily write past entries buffer.
> +We actually do not want to exit the first cycle prematurely
> +on ptr->line == NULL.
> +Signed-off-by: Tomas Mraz <tmraz@fedoraproject.org>
> +
> +CVE: CVE-2017-12424
> +Upstream-Status: Backport
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + lib/commonio.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/commonio.c b/lib/commonio.c
> +index b10da06..31edbaa 100644
> +--- a/lib/commonio.c
> ++++ b/lib/commonio.c
> +@@ -751,16 +751,16 @@ commonio_sort (struct commonio_db *db, int (*cmp)
> (const void *, const void *))
> +       for (ptr = db->head;
> +               (NULL != ptr)
> + #if KEEP_NIS_AT_END
> +-           && (NULL != ptr->line)
> +-           && (   ('+' != ptr->line[0])
> +-               && ('-' != ptr->line[0]))
> ++           && ((NULL == ptr->line)
> ++               || (('+' != ptr->line[0])
> ++                   && ('-' != ptr->line[0])))
> + #endif
> +            ;
> +            ptr = ptr->next) {
> +               n++;
> +       }
> + #if KEEP_NIS_AT_END
> +-      if ((NULL != ptr) && (NULL != ptr->line)) {
> ++      if (NULL != ptr) {
> +               nis = ptr;
> +       }
> + #endif
> +--
> +2.1.0
> +
> diff --git a/meta/recipes-extended/shadow/shadow.inc
> b/meta/recipes-extended/shadow/shadow.inc
> index 5e6b0bd..cc18964 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -16,6 +16,7 @@ SRC_URI = "http://pkg-shadow.alioth.
> debian.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-Do-not-read-login.defs-before-doing-chroot.patch \
>             file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch
> \
>             file://0001-useradd-copy-extended-attributes-of-home.patch \
> +           file://0001-shadow-CVE-2017-12424 \
>             ${@bb.utils.contains('PACKAGECONFIG', 'pam',
> '${PAM_SRC_URI}', '', d)} \
>             "
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045fb07c7840900556dd4821
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
6 August 2017 at 13:28, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.=
Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Backport a patc=
h to fix CVE-2017-12424.<br>
<br>
In shadow before 4.5, the newusers tool could be made to manipulate<br>
internal data structures in ways unintended by the authors.<br>
<br>
Reference link: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2017-12424"=
 rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/<wbr>detail=
/CVE-2017-12424</a><br>
<br>
CVE: CVE-2017-12424<br></blockquote><div><br></div><div>I don&#39;t object =
to the patch but I&#39;m wondering if there is a reason we are taking the s=
hadow sources from debian instead of the upstream github*? shadow 4.5 seems=
 to have been out for months already but Debian hasn&#39;t taken it yet...=
=C2=A0</div><div><br></div><div>*)=C2=A0<a href=3D"https://github.com/shado=
w-maint/shadow">https://github.com/shadow-maint/shadow</a></div><div><br></=
div><div>Jussi</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br>
---<br>
<span class=3D"gmail-">=C2=A0.../shadow/files/0001-shadow-<wbr>CVE-2017-124=
24=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 46 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-extended/shadow/<wbr>shadow.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 47 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/shadow/<wbr>files/0001-shado=
w-CVE-2017-<wbr>12424<br>
<br>
</span>diff --git a/meta/recipes-extended/<wbr>shadow/files/0001-shadow-CVE=
-<wbr>2017-12424 b/meta/recipes-extended/<wbr>shadow/files/0001-shadow-CVE-=
<wbr>2017-12424<br>
new file mode 100644<br>
index 0000000..4d3e1e0<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/<wbr>shadow/files/0001-shadow-CVE-<wbr>2017-124=
24<br>
@@ -0,0 +1,46 @@<br>
+From 954e3d2e7113e9ac06632aee3c69b8<wbr>d818cc8952 Mon Sep 17 00:00:00 200=
1<br>
+From: Tomas Mraz &lt;<a href=3D"mailto:tmraz@fedoraproject.org">tmraz@fedo=
raproject.org</a>&gt;<br>
+Date: Fri, 31 Mar 2017 16:25:06 +0200<br>
+Subject: [PATCH] Fix buffer overflow if NULL line is present in db.<br>
+<br>
+If ptr-&gt;line =3D=3D NULL for an entry, the first cycle will exit,<br>
+but the second one will happily write past entries buffer.<br>
+We actually do not want to exit the first cycle prematurely<br>
+on ptr-&gt;line =3D=3D NULL.<br>
+Signed-off-by: Tomas Mraz &lt;<a href=3D"mailto:tmraz@fedoraproject.org">t=
mraz@fedoraproject.org</a>&gt;<br>
+<br>
+CVE: CVE-2017-12424<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Che=
n@windriver.com</a>&gt;<br>
+---<br>
+ lib/commonio.c | 8 ++++----<br>
+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/lib/commonio.c b/lib/commonio.c<br>
+index b10da06..31edbaa 100644<br>
+--- a/lib/commonio.c<br>
++++ b/lib/commonio.c<br>
+@@ -751,16 +751,16 @@ commonio_sort (struct commonio_db *db, int (*cmp) (c=
onst void *, const void *))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (ptr =3D db-&gt;head;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(NULL !=3D ptr)<br>
+ #if KEEP_NIS_AT_END<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (NULL !=3D ptr-&gt;li=
ne)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (=C2=A0 =C2=A0(&#39;+=
&#39; !=3D ptr-&gt;line[0])<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (&#39;-=
&#39; !=3D ptr-&gt;line[0]))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; ((NULL =3D=3D ptr-&gt=
;line)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| ((&#39;+&#39; !=
=3D ptr-&gt;line[0])<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp=
;&amp; (&#39;-&#39; !=3D ptr-&gt;line[0])))<br>
+ #endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D ptr-&gt;next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ #if KEEP_NIS_AT_END<br>
+-=C2=A0 =C2=A0 =C2=A0 if ((NULL !=3D ptr) &amp;&amp; (NULL !=3D ptr-&gt;li=
ne)) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (NULL !=3D ptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nis =3D ptr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ #endif<br>
+--<br>
+2.1.0<br>
+<br>
diff --git a/meta/recipes-extended/<wbr>shadow/shadow.inc b/meta/recipes-ex=
tended/<wbr>shadow/shadow.inc<br>
index 5e6b0bd..cc18964 100644<br>
--- a/meta/recipes-extended/<wbr>shadow/shadow.inc<br>
+++ b/meta/recipes-extended/<wbr>shadow/shadow.inc<br>
@@ -16,6 +16,7 @@ SRC_URI =3D &quot;<a href=3D"http://pkg-shadow.alioth.deb=
ian.org/releases/${BPN}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">=
http://pkg-shadow.alioth.<wbr>debian.org/releases/${BPN}-${<wbr>PV}.tar.xz<=
/a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-read-login.<wb=
r>defs-before-doing-chroot.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://check_size_of_uid_t_<wbr>a=
nd_gid_t_using_AC_CHECK_<wbr>SIZEOF.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-useradd-copy-<wbr>ext=
ended-attributes-of-home.<wbr>patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-shadow-CVE-2017-<wbr>=
12424 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;<wbr>PA=
CKAGECONFIG&#39;, &#39;pam&#39;, &#39;${PAM_SRC_URI}&#39;, &#39;&#39;, d)} =
\<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
--<br>
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
</div></div></blockquote></div><br></div></div>

--f403045fb07c7840900556dd4821--
