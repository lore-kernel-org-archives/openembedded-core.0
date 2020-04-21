Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web12.2921.1587485919147072096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 09:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kt2t0gFg;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id t189so8799440vst.7
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2020 09:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GqKK2JYYMX8dDyAGiwkK6lq1hfmOKBluuB8en3RR7Ko=;
        b=kt2t0gFgg7ujzulXA5BxNQ0f6M9bS4QzYVjJZgAZyOp/l5T7ilzhjTbfHQ0UWGhXDv
         2I3YVkBcXMmy8QnxrkuvkhbH3ylVFB+MZ8nPipXkID3hgDCAyEmolBssTxCUjJeGiCt0
         Q93OpssKNTYFCfQU4gHptWp11P7zCIUFST8lcyBgm0Hq4DABZQFvVvfmVK/0v6ixD142
         GVnhNC0eYerKkHYHRxFgnGQLUchu2Rut0+IDKFCQ8OdK8rumZcGXO9k81CvqwmiKQP/f
         ELDyoWa069Y8SXaAFtI3dSdjFRKkk/noPya1i6CPQiIP72kvUiiGNiMf0OprBgDbmz8g
         phNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GqKK2JYYMX8dDyAGiwkK6lq1hfmOKBluuB8en3RR7Ko=;
        b=sw0j78hCC/+Wrc3mY5Uoh0UWPNj2G+c0j/DrXyCDzQhFRmi3bVKTjAGxye2fjXl8L8
         ZV2ixomWCmNsGnkLzlHxLbo2pvMJqg+ADg7kUKirj4UKc9cGLD7jszdbakBAWGTMRkao
         rN96LUauC8rAI/1ukrcP2wO6ju2c+KEruEZiDvnhocdQW4VZQz/PC8I62I/zleCrKJCi
         +7V26MXZNXMMcqvGOw57ge6SQgzXOsjWiSF1lqp14qX4b6FOUMRz61MwoQLEU7KvTAI3
         uR9y+02jwcVOnPkNs7UJ9ZOi+7wjl4MhglBdeaWdptiCdQpqtAFBRvI6fDb5GRDUYn9J
         idMw==
X-Gm-Message-State: AGi0PuaqRSU3VpPn0C8mOQllWIRGrI33+A7LUQvb/nf5ls8W46fJ/5Er
	FaXXJ4x7zS/aeS68GTBhJ17Os/rOQD1sLsndJw1Fww==
X-Google-Smtp-Source: APiQypJ06vQXUjV3R0se3RtXSKZ8kGprysKVBoeqnJZyvHgfFPhITNKMpDLBTWupqoKxbqV7F2eMRb76wRtAQ9jhGSc=
X-Received: by 2002:a67:6889:: with SMTP id d131mr12266318vsc.25.1587485918299;
 Tue, 21 Apr 2020 09:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200420200016.49947-1-geissonator@gmail.com> <20200420200016.49947-2-geissonator@gmail.com>
In-Reply-To: <20200420200016.49947-2-geissonator@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 21 Apr 2020 18:18:27 +0200
Message-ID: <CANNYZj_PYZSmYSdYUytQOYHJw+P=1M26nfzy7crQ0-X3MRvfRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] boost: revert 1.72.0 regression
To: Andrew Geissler <geissonator@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003f143a05a3cf5edb"

--0000000000003f143a05a3cf5edb
Content-Type: text/plain; charset="UTF-8"

The patch needs an Upstream-Status. Is it a backport (then the link to repo
needs to be provided)?

Alex

On Tue, 21 Apr 2020 at 18:12, Andrew Geissler <geissonator@gmail.com> wrote:

> https://www.boost.org/users/history/version_1_72_0.html documents a
> "Known Issue" and has a revert patch for an issue that causes code to
> fail to compile that includes the coroutine function. Without this
> patch, code which includes the asymmetric_coroutine.hpp will fail to
> compile.
>
> Signed-off-by: Andrew Geissler <geissonator@gmail.com>
> ---
>  meta/recipes-support/boost/boost_1.72.0.bb    |  1 +
>  ...001-revert-cease-dependence-on-range.patch | 49 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644
> meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
>
> diff --git a/meta/recipes-support/boost/boost_1.72.0.bb
> b/meta/recipes-support/boost/boost_1.72.0.bb
> index 5e9e0d87d7..0b7badbc76 100644
> --- a/meta/recipes-support/boost/boost_1.72.0.bb
> +++ b/meta/recipes-support/boost/boost_1.72.0.bb
> @@ -7,4 +7,5 @@ SRC_URI += "file://arm-intrinsics.patch \
>             file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
>
> file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
>             file://0001-dont-setup-compiler-flags-m32-m64.patch \
> +           file://0001-revert-cease-dependence-on-range.patch \
>             "
> diff --git
> a/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
> b/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
> new file mode 100644
> index 0000000000..a6002074ab
> --- /dev/null
> +++
> b/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-range.patch
> @@ -0,0 +1,49 @@
> +From 436e1dbe6fcd31523d261d18ad011392f1d6fbbc Mon Sep 17 00:00:00 2001
> +From: Oliver Kowalke <oliver.kowalke@gmail.com>
> +Date: Sun, 1 Dec 2019 20:40:28 +0100
> +Subject: [PATCH] Revert "Cease dependence on Range"
> +
> +This reverts commit 0c556bb59241e682bbcd3f572815149c5a9b17db.
> +
> +see #44 (One test fails to compile after boostorg/coroutine submodule
> updated)
> +---
> + boost/coroutine/asymmetric_coroutine.hpp | 12 +++---------
> + 1 file changed, 3 insertions(+), 9 deletions(-)
> +
> +diff --git a/boost/coroutine/asymmetric_coroutine.hpp
> b/boost/coroutine/asymmetric_coroutine.hpp
> +index ea96981..640896f 100644
> +--- a/boost/coroutine/asymmetric_coroutine.hpp
> ++++ b/boost/coroutine/asymmetric_coroutine.hpp
> +@@ -14,6 +14,7 @@
> + #include <boost/assert.hpp>
> + #include <boost/config.hpp>
> + #include <boost/move/move.hpp>
> ++#include <boost/range.hpp>
> + #include <boost/throw_exception.hpp>
> + #include <boost/utility/explicit_operator_bool.hpp>
> +
> +@@ -2354,19 +2355,12 @@ end( push_coroutine< R > & c)
> +
> + }
> +
> +-// forward declaration of Boost.Range traits to break dependency on it
> +-template<typename C, typename Enabler>
> +-struct range_mutable_iterator;
> +-
> +-template<typename C, typename Enabler>
> +-struct range_const_iterator;
> +-
> + template< typename Arg >
> +-struct range_mutable_iterator< coroutines::push_coroutine< Arg >, void >
> ++struct range_mutable_iterator< coroutines::push_coroutine< Arg > >
> + { typedef typename coroutines::push_coroutine< Arg >::iterator type; };
> +
> + template< typename R >
> +-struct range_mutable_iterator< coroutines::pull_coroutine< R >, void >
> ++struct range_mutable_iterator< coroutines::pull_coroutine< R > >
> + { typedef typename coroutines::pull_coroutine< R >::iterator type; };
> +
> + }
> +--
> +2.24.1
> +
> --
> 2.21.0 (Apple Git-122)
>
> 
>

--0000000000003f143a05a3cf5edb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The patch needs an Upstream-Status. Is it a backport =
(then the link to repo needs to be provided)? <br></div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 21 Apr 2020 at 18:12, Andrew Geissler &lt;<a href=
=3D"mailto:geissonator@gmail.com">geissonator@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><a href=3D"https://=
www.boost.org/users/history/version_1_72_0.html" rel=3D"noreferrer" target=
=3D"_blank">https://www.boost.org/users/history/version_1_72_0.html</a> do=
cuments a<br>
&quot;Known Issue&quot; and has a revert patch for an issue that causes co=
de to<br>
fail to compile that includes the coroutine function. Without this<br>
patch, code which includes the asymmetric_coroutine.hpp will fail to<br>
compile.<br>
<br>
Signed-off-by: Andrew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com=
" target=3D"_blank">geissonator@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D=
"noreferrer" target=3D"_blank">boost_1.72.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +=
<br>
=C2=A0...001-revert-cease-dependence-on-range.patch | 49 +++++++++++++++++=
++<br>
=C2=A02 files changed, 50 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/boost/files/0001-revert-ceas=
e-dependence-on-range.patch<br>
<br>
diff --git a/meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">boost_1.72.0.bb</a> b/meta/recipes-su=
pport/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D"noreferrer" target=3D=
"_blank">boost_1.72.0.bb</a><br>
index 5e9e0d87d7..0b7badbc76 100644<br>
--- a/meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D=
"noreferrer" target=3D"_blank">boost_1.72.0.bb</a><br>
+++ b/meta/recipes-support/boost/<a href=3D"http://boost_1.72.0.bb" rel=3D=
"noreferrer" target=3D"_blank">boost_1.72.0.bb</a><br>
@@ -7,4 +7,5 @@ SRC_URI +=3D &quot;file://arm-intrinsics.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Apply-boost-1.62.0-n=
o-forced-flags.patch.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Don-t-set-up-arch-in=
struction-set-flags-we-do-that-o.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-dont-setup-compiler-=
flags-m32-m64.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-revert-cease-depende=
nce-on-range.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
diff --git a/meta/recipes-support/boost/files/0001-revert-cease-dependence=
-on-range.patch b/meta/recipes-support/boost/files/0001-revert-cease-depend=
ence-on-range.patch<br>
new file mode 100644<br>
index 0000000000..a6002074ab<br>
--- /dev/null<br>
+++ b/meta/recipes-support/boost/files/0001-revert-cease-dependence-on-ran=
ge.patch<br>
@@ -0,0 +1,49 @@<br>
+From 436e1dbe6fcd31523d261d18ad011392f1d6fbbc Mon Sep 17 00:00:00 2001<br=
>
+From: Oliver Kowalke &lt;<a href=3D"mailto:oliver.kowalke@gmail.com" targ=
et=3D"_blank">oliver.kowalke@gmail.com</a>&gt;<br>
+Date: Sun, 1 Dec 2019 20:40:28 +0100<br>
+Subject: [PATCH] Revert &quot;Cease dependence on Range&quot;<br>
+<br>
+This reverts commit 0c556bb59241e682bbcd3f572815149c5a9b17db.<br>
+<br>
+see #44 (One test fails to compile after boostorg/coroutine submodule upd=
ated)<br>
+---<br>
+ boost/coroutine/asymmetric_coroutine.hpp | 12 +++---------<br>
+ 1 file changed, 3 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/boost/coroutine/asymmetric_coroutine.hpp b/boost/coroutine/a=
symmetric_coroutine.hpp<br>
+index ea96981..640896f 100644<br>
+--- a/boost/coroutine/asymmetric_coroutine.hpp<br>
++++ b/boost/coroutine/asymmetric_coroutine.hpp<br>
+@@ -14,6 +14,7 @@<br>
+ #include &lt;boost/assert.hpp&gt;<br>
+ #include &lt;boost/config.hpp&gt;<br>
+ #include &lt;boost/move/move.hpp&gt;<br>
++#include &lt;boost/range.hpp&gt;<br>
+ #include &lt;boost/throw_exception.hpp&gt;<br>
+ #include &lt;boost/utility/explicit_operator_bool.hpp&gt;<br>
+ <br>
+@@ -2354,19 +2355,12 @@ end( push_coroutine&lt; R &gt; &amp; c)<br>
+ <br>
+ }<br>
+ <br>
+-// forward declaration of Boost.Range traits to break dependency on it<b=
r>
+-template&lt;typename C, typename Enabler&gt;<br>
+-struct range_mutable_iterator;<br>
+-<br>
+-template&lt;typename C, typename Enabler&gt;<br>
+-struct range_const_iterator;<br>
+-<br>
+ template&lt; typename Arg &gt;<br>
+-struct range_mutable_iterator&lt; coroutines::push_coroutine&lt; Arg &gt=
;, void &gt;<br>
++struct range_mutable_iterator&lt; coroutines::push_coroutine&lt; Arg &gt=
; &gt;<br>
+ { typedef typename coroutines::push_coroutine&lt; Arg &gt;::iterator typ=
e; };<br>
+ <br>
+ template&lt; typename R &gt;<br>
+-struct range_mutable_iterator&lt; coroutines::pull_coroutine&lt; R &gt;,=
 void &gt;<br>
++struct range_mutable_iterator&lt; coroutines::pull_coroutine&lt; R &gt; =
&gt;<br>
+ { typedef typename coroutines::pull_coroutine&lt; R &gt;::iterator type;=
 };<br>
+ <br>
+ }<br>
+-- <br>
+2.24.1<br>
+<br>
-- <br>
2.21.0 (Apple Git-122)<br>
<br>
<br>
</blockquote></div>

--0000000000003f143a05a3cf5edb--
