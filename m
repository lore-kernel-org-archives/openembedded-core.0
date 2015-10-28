Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id E9E4C755F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 09:41:46 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so191535581wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=pvoCSx9kB76CTQkrfP/ynLN0OTnYN5WTM+9+ua7SWLw=;
	b=M4vjzFo7yTJdMvTXmiIm0e1wwQqD1RDAda0hJAV8QMjoI6SyPUnQWeZQB6UcDAqZXx
	UVb+FUOVzoOLA/1+4cW+t/uATJ+nFGgcD6qbBFcHTZUJ4rmYl5l+UB3GPaNSqeaip8LI
	yc5ARViRn9im22Q1VfQEgTHkul4J0XvYD8hWVkPyba1k/a9R8/5+ca0nlcE3CihYdLg5
	xFjxma+TZkyutM7AFIGaPjwcbr99W5p5tIyaFkDm+A9YjKhy2u4YJlSfR5EhRtyfCv77
	bWoN/xi1VBGyNbdYWtmFiAPmyyza1LNWnLtWgS82K6e0uEnf3tKirdGFRAMB+nCoqoo+
	ZaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pvoCSx9kB76CTQkrfP/ynLN0OTnYN5WTM+9+ua7SWLw=;
	b=hFbPKFk+HK228fA1YyrlXBShk6FN5AmG1QUm1Z5DTBwcwiLMpVD9EtwZmQ7gKCZ8a8
	g4YF8/SVucMpJmk28sotUKwUWngi8g76el1S6QbFNKS/3+dXiVUIFxwyvndJsih57MfZ
	pelA3pndg2TBwbaJ/YKk/FofTm9W1iirju77Ocqs+sZYxYtVPFLFr/ZNAxRuE+4Id21n
	Pd2/Zu/3KEobL+827lzModQS9RLt0SlEHdRtbc3XYSov0/zlshhJMTzjMPTv7SHBHrq3
	RVbeWIdWtNzmrKZAGbuGwZ7qz0tLkQzNgrhitFS9q7euSbRi7X/RJv/cqzjhATERZi4+
	Kupg==
X-Gm-Message-State: ALoCoQl1qw/z8aW+CohSR6xuH1s3Xn9xCfSrpPVhHND/Fe4i0ux/x+rpKD9en86826GnV2RzNiNe
X-Received: by 10.180.8.74 with SMTP id p10mr1845795wia.16.1446025306144; Wed,
	28 Oct 2015 02:41:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.186.69 with HTTP; Wed, 28 Oct 2015 02:41:16 -0700 (PDT)
In-Reply-To: <484dd4883f19d258e29e343f1b0735d2940d7424.1446009435.git.kai.kang@windriver.com>
References: <cover.1446009435.git.kai.kang@windriver.com>
	<484dd4883f19d258e29e343f1b0735d2940d7424.1446009435.git.kai.kang@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 28 Oct 2015 11:41:16 +0200
Message-ID: <CAHiDW_EvNU3w7gKaz1N_=ZZU+wfGkf696i78TZf3-PZbGaRTrg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix unsafe memory access
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
X-List-Received-Date: Wed, 28 Oct 2015 09:41:48 -0000
Content-Type: multipart/alternative; boundary=f46d044283beb59ce405232700fd

--f46d044283beb59ce405232700fd
Content-Type: text/plain; charset=UTF-8

On 28 October 2015 at 07:22, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Backport patch from:
>
> https://bugzilla.gnome.org/show_bug.cgi?id=746048
>
> to fix valgrind errors and unsafe memory access.
>
> Fix the indentation by the way.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../libxml2/libxml2-fix-unsafe-memory-access.patch | 97
> ++++++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.2.bb          |  3 +-
>  2 files changed, 99 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
>
> diff --git
> a/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
> new file mode 100644
> index 0000000..b583032
> --- /dev/null
> +++
> b/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
> @@ -0,0 +1,97 @@
> +Upstream-Status: Backport
>

This may be a nitpick but I don't think DV has taken this patch in the six
months it's been available so it's not a backport.

 - Jussi

+
> +Backport from
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=746048
> +
> +to fix unsafe memory access.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> +diff --git a/HTMLparser.c b/HTMLparser.c
> +index d329d3b..6f81424 100644
> +--- a/HTMLparser.c
> ++++ b/HTMLparser.c
> +@@ -3245,13 +3245,20 @@ htmlParseComment(htmlParserCtxtPtr ctxt) {
> +       ctxt->instate = state;
> +       return;
> +     }
> ++    if ((ctxt->input->end - ctxt->input->cur) < 3) {
> ++        ctxt->instate = XML_PARSER_EOF;
> ++        htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
> ++                     "Comment not terminated\n", NULL, NULL);
> ++        xmlFree(buf);
> ++        return;
> ++    }
> +     q = CUR_CHAR(ql);
> +     NEXTL(ql);
> +     r = CUR_CHAR(rl);
> +     NEXTL(rl);
> +     cur = CUR_CHAR(l);
> +     len = 0;
> +-    while (IS_CHAR(cur) &&
> ++    while (((ctxt->input->end - ctxt->input->cur) > 0) && IS_CHAR(cur) &&
> +            ((cur != '>') ||
> +           (r != '-') || (q != '-'))) {
> +       if (len + 5 >= size) {
> +@@ -3281,7 +3288,7 @@ htmlParseComment(htmlParserCtxtPtr ctxt) {
> +       }
> +     }
> +     buf[len] = 0;
> +-    if (!IS_CHAR(cur)) {
> ++    if (!(ctxt->input->end - ctxt->input->cur) || !IS_CHAR(cur)) {
> +       htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
> +                    "Comment not terminated \n<!--%.50s\n", buf, NULL);
> +       xmlFree(buf);
> +@@ -4465,6 +4472,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
> +     depth = ctxt->nameNr;
> +     while (1) {
> +       long cons = ctxt->nbChars;
> ++    long rem = ctxt->input->end - ctxt->input->cur;
> +
> +         GROW;
> +
> +@@ -4540,7 +4548,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
> +           /*
> +            * Sometimes DOCTYPE arrives in the middle of the document
> +            */
> +-          if ((CUR == '<') && (NXT(1) == '!') &&
> ++          if ((rem >= 9) && (CUR == '<') && (NXT(1) == '!') &&
> +               (UPP(2) == 'D') && (UPP(3) == 'O') &&
> +               (UPP(4) == 'C') && (UPP(5) == 'T') &&
> +               (UPP(6) == 'Y') && (UPP(7) == 'P') &&
> +@@ -4554,7 +4562,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
> +           /*
> +            * First case :  a comment
> +            */
> +-          if ((CUR == '<') && (NXT(1) == '!') &&
> ++          if ((rem >= 4) && (CUR == '<') && (NXT(1) == '!') &&
> +               (NXT(2) == '-') && (NXT(3) == '-')) {
> +               htmlParseComment(ctxt);
> +           }
> +@@ -4562,14 +4570,14 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
> +           /*
> +            * Second case : a Processing Instruction.
> +            */
> +-          else if ((CUR == '<') && (NXT(1) == '?')) {
> ++          else if ((rem >= 2) && (CUR == '<') && (NXT(1) == '?')) {
> +               htmlParsePI(ctxt);
> +           }
> +
> +           /*
> +            * Third case :  a sub-element.
> +            */
> +-          else if (CUR == '<') {
> ++          else if ((rem >= 1) && (CUR == '<')) {
> +               htmlParseElementInternal(ctxt);
> +               if (currentNode != NULL) xmlFree(currentNode);
> +
> +@@ -4581,7 +4589,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
> +            * Fourth case : a reference. If if has not been resolved,
> +            *    parsing returns it's Name, create the node
> +            */
> +-          else if (CUR == '&') {
> ++          else if ((rem >= 1) && (CUR == '&')) {
> +               htmlParseReference(ctxt);
> +           }
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.2.bb
> b/meta/recipes-core/libxml/libxml2_2.9.2.bb
> index 79a395c..4cafc87 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.2.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.2.bb
> @@ -2,7 +2,8 @@ require libxml2.inc
>
>  SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar
> \
>              file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch \
> -
>  file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch \
> +
> file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch \
> +            file://libxml2-fix-unsafe-memory-access.patch \
>            "
>
>  SRC_URI[libtar.md5sum] = "9e6a9aca9d155737868b3dc5fd82f788"
> --
> 2.6.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d044283beb59ce405232700fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 28 October 2015 at 07:22,  <span dir=3D"ltr">&lt;<a href=3D"mailto:k=
ai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">From: Kai Kang &lt;<a href=3D"=
mailto:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt;<br>
<br>
Backport patch from:<br>
<br>
<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D746048" rel=3D"nore=
ferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?id=3D7460=
48</a><br>
<br>
to fix valgrind errors and unsafe memory access.<br>
<br>
Fix the indentation by the way.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.k=
ang@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../libxml2/libxml2-fix-unsafe-memory-access.patch | 97 +++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxml2_2.9.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 3 +-<br>
=C2=A02 files changed, 99 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix-unsaf=
e-memory-access.patch<br>
<br>
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-acc=
ess.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-acce=
ss.patch<br>
new file mode 100644<br>
index 0000000..b583032<br>
--- /dev/null<br>
+++ b/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.pat=
ch<br>
@@ -0,0 +1,97 @@<br>
+Upstream-Status: Backport<br>
</blockquote><div><br></div><div>This may be a nitpick but I don&#39;t thin=
k DV has taken this patch in the six months it&#39;s been available so it&#=
39;s not a backport.</div><div><br></div><div>=C2=A0- Jussi=C2=A0</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">+<br>
+Backport from<br>
+<br>
+<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D746048" rel=3D"nor=
eferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bug.cgi?id=3D746=
048</a><br>
+<br>
+to fix unsafe memory access.<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.=
kang@windriver.com</a>&gt;<br>
+---<br>
+diff --git a/HTMLparser.c b/HTMLparser.c<br>
+index d329d3b..6f81424 100644<br>
+--- a/HTMLparser.c<br>
++++ b/HTMLparser.c<br>
+@@ -3245,13 +3245,20 @@ htmlParseComment(htmlParserCtxtPtr ctxt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ctxt-&gt;instate =3D state;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 if ((ctxt-&gt;input-&gt;end - ctxt-&gt;input-&gt;cur) &lt; =
3) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt-&gt;instate =3D XML_PARSER_EOF;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISH=
ED,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;Comment not terminated\n&quot;, NULL, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 xmlFree(buf);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0q =3D CUR_CHAR(ql);<br>
+=C2=A0 =C2=A0 =C2=A0NEXTL(ql);<br>
+=C2=A0 =C2=A0 =C2=A0r =3D CUR_CHAR(rl);<br>
+=C2=A0 =C2=A0 =C2=A0NEXTL(rl);<br>
+=C2=A0 =C2=A0 =C2=A0cur =3D CUR_CHAR(l);<br>
+=C2=A0 =C2=A0 =C2=A0len =3D 0;<br>
+-=C2=A0 =C2=A0 while (IS_CHAR(cur) &amp;&amp;<br>
++=C2=A0 =C2=A0 while (((ctxt-&gt;input-&gt;end - ctxt-&gt;input-&gt;cur) &=
gt; 0) &amp;&amp; IS_CHAR(cur) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((cur !=3D &#39;&gt;&#39;) ||<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r !=3D &#39;-&#39;) || (q !=3D &=
#39;-&#39;))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (len + 5 &gt;=3D size) {<br>
+@@ -3281,7 +3288,7 @@ htmlParseComment(htmlParserCtxtPtr ctxt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0buf[len] =3D 0;<br>
+-=C2=A0 =C2=A0 if (!IS_CHAR(cur)) {<br>
++=C2=A0 =C2=A0 if (!(ctxt-&gt;input-&gt;end - ctxt-&gt;input-&gt;cur) || !=
IS_CHAR(cur)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;Comment not terminated \n&lt;!--%.50s\n&quot;, buf, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0xmlFree(buf);<br>
+@@ -4465,6 +4472,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0depth =3D ctxt-&gt;nameNr;<br>
+=C2=A0 =C2=A0 =C2=A0while (1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long cons =3D ctxt-&gt;nbChars;<br>
++=C2=A0 =C2=A0 long rem =3D ctxt-&gt;input-&gt;end - ctxt-&gt;input-&gt;cu=
r;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GROW;<br>
+<br>
+@@ -4540,7 +4548,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Sometimes DOCTYPE arrives in t=
he middle of the document<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((CUR =3D=3D &#39;&lt;&#39;) &amp;&=
amp; (NXT(1) =3D=3D &#39;!&#39;) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((rem &gt;=3D 9) &amp;&amp; (CUR =
=3D=3D &#39;&lt;&#39;) &amp;&amp; (NXT(1) =3D=3D &#39;!&#39;) &amp;&amp;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(UPP(2) =3D=3D &#39=
;D&#39;) &amp;&amp; (UPP(3) =3D=3D &#39;O&#39;) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(UPP(4) =3D=3D &#39=
;C&#39;) &amp;&amp; (UPP(5) =3D=3D &#39;T&#39;) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(UPP(6) =3D=3D &#39=
;Y&#39;) &amp;&amp; (UPP(7) =3D=3D &#39;P&#39;) &amp;&amp;<br>
+@@ -4554,7 +4562,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * First case :=C2=A0 a comment<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((CUR =3D=3D &#39;&lt;&#39;) &amp;&=
amp; (NXT(1) =3D=3D &#39;!&#39;) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((rem &gt;=3D 4) &amp;&amp; (CUR =
=3D=3D &#39;&lt;&#39;) &amp;&amp; (NXT(1) =3D=3D &#39;!&#39;) &amp;&amp;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(NXT(2) =3D=3D &#39=
;-&#39;) &amp;&amp; (NXT(3) =3D=3D &#39;-&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0htmlParseComment(ct=
xt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -4562,14 +4570,14 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Second case : a Processing Ins=
truction.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if ((CUR =3D=3D &#39;&lt;&#39;) &=
amp;&amp; (NXT(1) =3D=3D &#39;?&#39;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if ((rem &gt;=3D 2) &amp;&amp; (C=
UR =3D=3D &#39;&lt;&#39;) &amp;&amp; (NXT(1) =3D=3D &#39;?&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0htmlParsePI(ctxt);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Third case :=C2=A0 a sub-eleme=
nt.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (CUR =3D=3D &#39;&lt;&#39;) {<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if ((rem &gt;=3D 1) &amp;&amp; (C=
UR =3D=3D &#39;&lt;&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0htmlParseElementInt=
ernal(ctxt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (currentNode !=
=3D NULL) xmlFree(currentNode);<br>
+<br>
+@@ -4581,7 +4589,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Fourth case : a reference. If =
if has not been resolved,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 parsing returns i=
t&#39;s Name, create the node<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (CUR =3D=3D &#39;&amp;&#39;) {=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if ((rem &gt;=3D 1) &amp;&amp; (C=
UR =3D=3D &#39;&amp;&#39;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0htmlParseReference(=
ctxt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
diff --git a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libxml2_2.9.2.bb</a> b/meta/recipes-cor=
e/libxml/<a href=3D"http://libxml2_2.9.2.bb" rel=3D"noreferrer" target=3D"_=
blank">libxml2_2.9.2.bb</a><br>
index 79a395c..4cafc87 100644<br>
--- a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxml2_2.9.2.bb</a><br>
+++ b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxml2_2.9.2.bb</a><br>
@@ -2,7 +2,8 @@ require libxml2.inc<br>
<br>
=C2=A0SRC_URI +=3D &quot;<a href=3D"http://www.w3.org/XML/Test/xmlts2008082=
7.tar.gz;name=3Dtesttar" rel=3D"noreferrer" target=3D"_blank">http://www.w3=
.org/XML/Test/xmlts20080827.tar.gz;name=3Dtesttar</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://72a46a519ce7326d9a00=
f0b6a7f2a8e958cd1675.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-threads-Define-pthrea=
d-definitions-for-glibc-complia.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-threads-Define-pthre=
ad-definitions-for-glibc-complia.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libxml2-fix-unsafe-memory=
-access.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[libtar.md5sum] =3D &quot;9e6a9aca9d155737868b3dc5fd82f788&quo=
t;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.6.1<br>
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

--f46d044283beb59ce405232700fd--
