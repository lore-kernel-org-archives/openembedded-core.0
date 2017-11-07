Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 172927838B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 14:46:45 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 72so2685511itl.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 06:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sxJKMtF+jZ1l05Te5lHtI0JAq273VJqnP8zFkmtAOsQ=;
	b=mYUkQ660Ys5bplkOM4o4JifZfjGoyPY8FpZPgRZjUvEdpmAkG2tiXWQpm6hZ79belf
	N5qhL/lNcZR8UZA3J7D0xIQfkoHuT2hCyjLveC5m1iVfqGTqm+wpOHkZ6SuB4wA3odWF
	TXNpNY/XhMKTalT9hHpOtaZJAbu7Zkz4q6sLYtXSt+iW0RWtCGRAXEZQoy0nsVkcruHA
	r/o3cVlTGZQtHWn+Jj2d+ARjyWBOzoy6DTkSVTd2kxFtLZV9Vl6Z7gz1rpyg6T9wXUDr
	bqTj5k7SUYVn+4Oa5n+KQ/7JQJhp1DWmeWcIP4QIExaDjE7AXEFccKxUyhQd0pKxVMqR
	4Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sxJKMtF+jZ1l05Te5lHtI0JAq273VJqnP8zFkmtAOsQ=;
	b=IjbU25iLcdnLsy8R/g6VWhwFcc7G7EvoYtdlso6l0EXIb55rKPEsCxg9eAIw7J4pE6
	Zhan2K+gAD51XeKkNnEjQMKFP5oYoCm18hF2JNpgmNklmUAqpq6KKbZtoAC4zRIgueiM
	gDfuQVhEJqxa6Y5E4F4DcfA/exHj0iQw06Cq5vD2pBtRBq7e91PS4KbqthqlgAHf/4lL
	vKhBrLXx+HT6mZGinqfuG5sGUdE8K9yN6KszAX/ksLWUqYNrwLo3bLDWCV3ngXZyNjEw
	byotbpedfwFMDKL8/lykJeAISvrvl8VW1HsSV15UVATaECJt7c1HKfZNll4sIQygDBeu
	LjGQ==
X-Gm-Message-State: AJaThX4OcwBtJp2tdOwkPvfZGRvWz6mfNRRm2trIDDD9LOhfYIy9V6nj
	0ReEGgP8TBE9CC87u9vGii18/oair14631PznIkIdA==
X-Google-Smtp-Source: ABhQp+QLjUjUCwxJGzCJ1gG/aCixU4UZzHPQtoL6tF8sAZtO0uPnfeIA6wFc0jnnYAZtJ0/vFBmtIerP4e9H23yOi6I=
X-Received: by 10.36.87.207 with SMTP id u198mr2349825ita.108.1510066007049;
	Tue, 07 Nov 2017 06:46:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Tue, 7 Nov 2017 06:46:26 -0800 (PST)
In-Reply-To: <1509965245351.25038@mentor.com>
References: <20171025160348.29256-1-awais_belal@mentor.com>
	<1509965245351.25038@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Nov 2017 14:46:26 +0000
Message-ID: <CAJTo0LYezZO1kmTZ3K1Ad-jF6ujDjndJfZ8kWuAhEaRcNFh82A@mail.gmail.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: fix build issue with libxml2 support
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
X-List-Received-Date: Tue, 07 Nov 2017 14:46:46 -0000
Content-Type: multipart/alternative; boundary="001a1143a75cf02788055d65a3e1"

--001a1143a75cf02788055d65a3e1
Content-Type: text/plain; charset="UTF-8"

No Upstream-Status in the patch, can you add that please.

Ross

On 6 November 2017 at 10:47, Belal, Awais <Awais_Belal@mentor.com> wrote:

> ping!
>
> BR,
> Awais
>
> ________________________________________
> From: Belal, Awais
> Sent: Wednesday, October 25, 2017 9:03 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Belal, Awais
> Subject: [PATCH] dhcp: fix build issue with libxml2 support
>
> A missing case breaks the build when libxml2 is
> required and found appropriately. The third argument
> to the function AC_SEARCH_LIB is action-if-found which
> was mistakenly been used for the case where the library
> is not found and hence breaks the configure phase
> where it shoud actually pass.
> We now pass on silently when action-if-found is
> executed.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  ...correct-the-intention-for-xml2-lib-search.patch | 35
> ++++++++++++++++++++++
>  meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb       |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-
> the-intention-for-xml2-lib-search.patch
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-
> the-intention-for-xml2-lib-search.patch b/meta/recipes-connectivity/
> dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
> new file mode 100644
> index 0000000000..6ded764d0e
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-
> the-intention-for-xml2-lib-search.patch
> @@ -0,0 +1,35 @@
> +From 501543b3ef715488a142e3d301ff2733aa33eec7 Mon Sep 17 00:00:00 2001
> +From: Awais Belal <awais_belal@mentor.com>
> +Date: Wed, 25 Oct 2017 21:00:05 +0500
> +Subject: [PATCH] dhcp: correct the intention for xml2 lib search
> +
> +A missing case breaks the build when libxml2 is
> +required and found appropriately. The third argument
> +to the function AC_SEARCH_LIB is action-if-found which
> +was mistakenly been used for the case where the library
> +is not found and hence breaks the configure phase
> +where it shoud actually pass.
> +We now pass on silently when action-if-found is
> +executed.
> +
> +Signed-off-by: Awais Belal <awais_belal@mentor.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index bfe988a..f0459e6 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -608,7 +608,7 @@ AC_ARG_WITH(libxml2,
> +       with_libxml2="$withval", with_libxml2="no")
> +
> + if test x$with_libxml2 != xno; then
> +-      AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
> ++      AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],,
> +               [if test x$with_libxml2 != xauto; then
> +                       AC_MSG_FAILURE([*** Cannot find
> xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
> +               fi])
> +--
> +2.11.1
> +
> diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
> b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
> index 4634a01b04..6615ae2555 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
> +++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
> @@ -11,6 +11,7 @@ SRC_URI += "file://0001-define-macro-_
> PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
>              file://0009-remove-dhclient-script-bash-dependency.patch \
>              file://0010-build-shared-libs.patch \
>              file://0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
> \
> +            file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
> \
>             "
>
>  SRC_URI[md5sum] = "afa6e9b3eb7539ea048421a82c668adc"
> --
> 2.11.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143a75cf02788055d65a3e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No Upstream-Status in the patch, can you add that please.<=
div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On 6 November 2017 at 10:47, Belal, Awais <span dir=3D"lt=
r">&lt;<a href=3D"mailto:Awais_Belal@mentor.com" target=3D"_blank">Awais_Be=
lal@mentor.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">ping=
!<br>
<br>
BR,<br>
Awais<br>
<br>
______________________________<wbr>__________<br>
From: Belal, Awais<br>
Sent: Wednesday, October 25, 2017 9:03 PM<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedde=
d-core@lists.<wbr>openembedded.org</a><br>
Cc: Belal, Awais<br>
Subject: [PATCH] dhcp: fix build issue with libxml2 support<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
A missing case breaks the build when libxml2 is<br>
required and found appropriately. The third argument<br>
to the function AC_SEARCH_LIB is action-if-found which<br>
was mistakenly been used for the case where the library<br>
is not found and hence breaks the configure phase<br>
where it shoud actually pass.<br>
We now pass on silently when action-if-found is<br>
executed.<br>
<br>
Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com">aw=
ais_belal@mentor.com</a>&gt;<br>
---<br>
=C2=A0...correct-the-intention-for-<wbr>xml2-lib-search.patch | 35 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-connectivity/<wbr>dhcp/<a href=3D"http://dhcp_4.3.6.bb" =
rel=3D"noreferrer" target=3D"_blank">dhcp_4.3.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/<wbr>dhcp/dhcp/0012-dhcp=
-correct-<wbr>the-intention-for-xml2-lib-<wbr>search.patch<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>dhcp/dhcp/0012-dhcp-correct-<wb=
r>the-intention-for-xml2-lib-<wbr>search.patch b/meta/recipes-connectivity/=
<wbr>dhcp/dhcp/0012-dhcp-correct-<wbr>the-intention-for-xml2-lib-<wbr>searc=
h.patch<br>
new file mode 100644<br>
index 0000000000..6ded764d0e<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/<wbr>dhcp/dhcp/0012-dhcp-correct-<wbr>the-i=
ntention-for-xml2-lib-<wbr>search.patch<br>
@@ -0,0 +1,35 @@<br>
+From 501543b3ef715488a142e3d301ff27<wbr>33aa33eec7 Mon Sep 17 00:00:00 200=
1<br>
+From: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com">awais_bela=
l@mentor.com</a>&gt;<br>
+Date: Wed, 25 Oct 2017 21:00:05 +0500<br>
+Subject: [PATCH] dhcp: correct the intention for xml2 lib search<br>
+<br>
+A missing case breaks the build when libxml2 is<br>
+required and found appropriately. The third argument<br>
+to the function AC_SEARCH_LIB is action-if-found which<br>
+was mistakenly been used for the case where the library<br>
+is not found and hence breaks the configure phase<br>
+where it shoud actually pass.<br>
+We now pass on silently when action-if-found is<br>
+executed.<br>
+<br>
+Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com">a=
wais_belal@mentor.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
+index bfe988a..f0459e6 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
+@@ -608,7 +608,7 @@ AC_ARG_WITH(libxml2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0with_libxml2=3D&quot;$withval&quot;, with_libxm=
l2=3D&quot;no&quot;)<br>
+<br>
+ if test x$with_libxml2 !=3D xno; then<br>
+-=C2=A0 =C2=A0 =C2=A0 AC_SEARCH_LIBS(<wbr>xmlTextWriterStartElement, [xml2=
],<br>
++=C2=A0 =C2=A0 =C2=A0 AC_SEARCH_LIBS(<wbr>xmlTextWriterStartElement, [xml2=
],,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[if test x$with_lib=
xml2 !=3D xauto; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -l=
xml2 and libxml2 was requested])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi])<br>
+--<br>
+2.11.1<br>
+<br>
diff --git a/meta/recipes-connectivity/<wbr>dhcp/<a href=3D"http://dhcp_4.3=
.6.bb" rel=3D"noreferrer" target=3D"_blank">dhcp_4.3.6.bb</a> b/meta/recipe=
s-connectivity/<wbr>dhcp/<a href=3D"http://dhcp_4.3.6.bb" rel=3D"noreferrer=
" target=3D"_blank">dhcp_4.3.6.bb</a><br>
index 4634a01b04..6615ae2555 100644<br>
--- a/meta/recipes-connectivity/<wbr>dhcp/<a href=3D"http://dhcp_4.3.6.bb" =
rel=3D"noreferrer" target=3D"_blank">dhcp_4.3.6.bb</a><br>
+++ b/meta/recipes-connectivity/<wbr>dhcp/<a href=3D"http://dhcp_4.3.6.bb" =
rel=3D"noreferrer" target=3D"_blank">dhcp_4.3.6.bb</a><br>
@@ -11,6 +11,7 @@ SRC_URI +=3D &quot;file://0001-define-macro-_<wbr>PATH_DH=
CPD_CONF-and-_PATH_<wbr>DHCLIENT_CON.pat<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-remove-dhclient=
-<wbr>script-bash-dependency.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-build-shared-li=
bs.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-Moved-the-call-=
to-<wbr>isc_app_ctxstart-to-not-get-<wbr>signal.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0012-dhcp-correct-the-<wb=
r>intention-for-xml2-lib-search.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>afa6e9b3eb7539ea048421a82c668a<wbr>dc&=
quot;<br>
--<br>
2.11.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1143a75cf02788055d65a3e1--
