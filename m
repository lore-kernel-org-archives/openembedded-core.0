Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7F90871A72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 13:44:22 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id c47so75755940qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d6tJUvQGk6AANV5sWOTN75q81J4ukuE2rlFVKnctx08=;
	b=h7fxRRNilmX1eKVySRjVrr3XEp2Q6y0kcJHWp7099ahOelDKw3kitdtRLdafSVVa6o
	96748AjWafckkQJgzy9TrCIlp9hnZglp17pdr5vDLmrq8pc9d4l3zeHIQg0/O0wH3bu/
	7gxU3QTQPoj38rBc/9UK3PvX+rJPlC7Ee/DA5TZg4ouBgSSNA998gGZMj3s1R2XFfVJM
	CGd0s5pBnHJH4OD5dr+7dRNwKRMrbHeKekpZYaQJ6ez7BVRJCcRpGEqgt5nyQUC7C2DT
	A0YUWyfW09Ies1XhDcl/U/lrTIKQydoTyjQuuSdkg3kD1N+EYU6Fxu8uACt2cF4JzfKp
	rtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d6tJUvQGk6AANV5sWOTN75q81J4ukuE2rlFVKnctx08=;
	b=O7H9sR6mxn1+fmtPD58Yp7BVjz3Nsv9sNNuF7NBaFCOrdXlc3w6w4sgPn2T7A4BH0M
	TeOzkE2bGRf3Zz5JNV51hTQLh2fqQPrsHd4rRhyXjKDPsrRlkm2jjuDKCibHNYfsXN8m
	IIvkaMOvTcUeYCWARVw2u5VpJepm1IBPg5CX9NiPChL5oy+KzWmjO5PjH7DXwOUZqIc5
	FOhpSVcl9SS8oIiVcvhD0dlEMfx+g4HIRfS39EXA5RCfHmu0sBMAL+bE9r6j5R35Vk9i
	GghZBHtBVuxKOpG9HQxLyNC2zkdtfgfRrHIaKzlrxuAwDWcU1u8VPsOWqbZQkB5XBKCF
	CDuA==
X-Gm-Message-State: AKaTC00doPRei7RD5xQtjUS93PQIwv48fZvRbzcuNX83RMuPC07FUww+e3HZ7lDLkZZ5koWks9gcEwwJRH/WKBVO
X-Received: by 10.237.49.230 with SMTP id 93mr78953489qth.109.1481550263387;
	Mon, 12 Dec 2016 05:44:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 12 Dec 2016 05:44:02 -0800 (PST)
In-Reply-To: <1481548821-15878-1-git-send-email-andrej.valek@siemens.com>
References: <1481548821-15878-1-git-send-email-andrej.valek@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Dec 2016 13:44:02 +0000
Message-ID: <CAJTo0LaQJYV17g0oc3Os_uqa+a33tGXJwya4s-jDpotweBEBwA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libxml2: Necessary changes before fixing CVE-2016-5131 Fix comaparation with root node in xmlXPathCmpNodes and NULL pointer deref in XPointer
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
X-List-Received-Date: Mon, 12 Dec 2016 13:44:22 -0000
Content-Type: multipart/alternative; boundary=94eb2c1251e22a9c6c0543764de0

--94eb2c1251e22a9c6c0543764de0
Content-Type: text/plain; charset=UTF-8

I see part 1 and 2 but no part 3.

Also, have you asked upstream if they'll be making a point release with
these in?

Ross

On 12 December 2016 at 13:20, Andrej Valek <andrej.valek@siemens.com> wrote:

> xpath:
>  - Check for errors after evaluating first operand.
>  - Add sanity check for empty stack.
>  - Include comparation in changes from xmlXPathCmpNodesExt to
> xmlXPathCmpNodes
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../libxml2/libxml2-fix_node_comparison.patch      | 67
> ++++++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.4.bb          |  1 +
>  2 files changed, 68 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_node_
> comparison.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
> b/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
> new file mode 100644
> index 0000000..11718bb
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
> @@ -0,0 +1,67 @@
> +libxml2-2.9.4: Fix comparison with root node in xmlXPathCmpNodes and NULL
> pointer deref in XPointer
> +
> +xpath:
> + - Check for errors after evaluating first operand.
> + - Add sanity check for empty stack.
> + - Include comparation in changes from xmlXPathCmpNodesExt to
> xmlXPathCmpNodes
> +
> +Upstream-Status: Backported
> + - [https://git.gnome.org/browse/libxml2/commit/?id=
> c1d1f7121194036608bf555f08d3062a36fd344b]
> + - [https://git.gnome.org/browse/libxml2/commit/?id=
> a005199330b86dada19d162cae15ef9bdcb6baa8]
> +CVE: necessary changes for fixing CVE-2016-5131
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> +
> +diff --git a/result/XPath/xptr/viderror b/result/XPath/xptr/viderror
> +new file mode 100644
> +index 0000000..d589882
> +--- /dev/null
> ++++ b/result/XPath/xptr/viderror
> +@@ -0,0 +1,4 @@
> ++
> ++========================
> ++Expression: xpointer(non-existing-fn()/range-to(id('chapter2')))
> ++Object is empty (NULL)
> +diff --git a/test/XPath/xptr/viderror b/test/XPath/xptr/viderror
> +new file mode 100644
> +index 0000000..da8c53b
> +--- /dev/null
> ++++ b/test/XPath/xptr/viderror
> +@@ -0,0 +1 @@
> ++xpointer(non-existing-fn()/range-to(id('chapter2')))
> +diff --git a/xpath.c b/xpath.c
> +index 113bce6..d992841 100644
> +--- a/xpath.c
> ++++ b/xpath.c
> +@@ -3342,13 +3342,13 @@ xmlXPathCmpNodes(xmlNodePtr node1, xmlNodePtr
> node2) {
> +      * compute depth to root
> +      */
> +     for (depth2 = 0, cur = node2;cur->parent != NULL;cur = cur->parent) {
> +-      if (cur == node1)
> ++      if (cur->parent == node1)
> +           return(1);
> +       depth2++;
> +     }
> +     root = cur;
> +     for (depth1 = 0, cur = node1;cur->parent != NULL;cur = cur->parent) {
> +-      if (cur == node2)
> ++      if (cur->parent == node2)
> +           return(-1);
> +       depth1++;
> +     }
> +@@ -14005,9 +14005,14 @@ xmlXPathCompOpEval(xmlXPathParserContextPtr
> ctxt, xmlXPathStepOpPtr op)
> +                 xmlNodeSetPtr oldset;
> +                 int i, j;
> +
> +-                if (op->ch1 != -1)
> ++                if (op->ch1 != -1) {
> +                     total +=
> +                         xmlXPathCompOpEval(ctxt, &comp->steps[op->ch1]);
> ++                    CHECK_ERROR0;
> ++                }
> ++                if (ctxt->value == NULL) {
> ++                    XP_ERROR0(XPATH_INVALID_OPERAND);
> ++                }
> +                 if (op->ch2 == -1)
> +                     return (total);
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb
> b/meta/recipes-core/libxml/libxml2_2.9.4.bb
> index 1fed90b..66a8940 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
> @@ -19,6 +19,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/
> libxml2-${PV}.tar.gz;name=libtar \
>             file://run-ptest \
>             file://python-sitepackages-dir.patch \
>             file://libxml-m4-use-pkgconfig.patch \
> +           file://libxml2-fix_node_comparison.patch \
>             file://libxml2-CVE-2016-5131.patch \
>            "
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1251e22a9c6c0543764de0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I see part 1 and 2 but no part 3.<div><br></div><div>Also,=
 have you asked upstream if they&#39;ll be making a point release with thes=
e in?</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On 12 December 2016 at 13:20, Andrej Valek <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_=
blank">andrej.valek@siemens.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">xpath:<br>
=C2=A0- Check for errors after evaluating first operand.<br>
=C2=A0- Add sanity check for empty stack.<br>
=C2=A0- Include comparation in changes from xmlXPathCmpNodesExt to xmlXPath=
CmpNodes<br>
<br>
Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com"=
>andrej.valek@siemens.com</a>&gt;<br>
Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">p=
ascal.bach@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../libxml2/libxml2-fix_node_<wbr>comparison.patch=C2=A0 =C2=A0 =C2=
=A0 | 67 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">libxm<wbr>l2_2.9.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 68 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_=
node_<wbr>comparison.patch<br>
<br>
diff --git a/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_node_<wbr>co=
mparison.patch b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_node_<wb=
r>comparison.patch<br>
new file mode 100644<br>
index 0000000..11718bb<br>
--- /dev/null<br>
+++ b/meta/recipes-core/libxml/<wbr>libxml2/libxml2-fix_node_<wbr>compariso=
n.patch<br>
@@ -0,0 +1,67 @@<br>
+libxml2-2.9.4: Fix comparison with root node in xmlXPathCmpNodes and NULL =
pointer deref in XPointer<br>
+<br>
+xpath:<br>
+ - Check for errors after evaluating first operand.<br>
+ - Add sanity check for empty stack.<br>
+ - Include comparation in changes from xmlXPathCmpNodesExt to xmlXPathCmpN=
odes<br>
+<br>
+Upstream-Status: Backported<br>
+ - [<a href=3D"https://git.gnome.org/browse/libxml2/commit/?id=3Dc1d1f7121=
194036608bf555f08d3062a36fd344b" rel=3D"noreferrer" target=3D"_blank">https=
://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<wbr>c1d1f7121194036608bf=
555f08d306<wbr>2a36fd344b</a>]<br>
+ - [<a href=3D"https://git.gnome.org/browse/libxml2/commit/?id=3Da00519933=
0b86dada19d162cae15ef9bdcb6baa8" rel=3D"noreferrer" target=3D"_blank">https=
://git.gnome.org/browse/<wbr>libxml2/commit/?id=3D<wbr>a005199330b86dada19d=
162cae15ef<wbr>9bdcb6baa8</a>]<br>
+CVE: necessary changes for fixing CVE-2016-5131<br>
+Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
">andrej.valek@siemens.com</a>&gt;<br>
+Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">=
pascal.bach@siemens.com</a>&gt;<br>
+<br>
+diff --git a/result/XPath/xptr/viderror b/result/XPath/xptr/viderror<br>
+new file mode 100644<br>
+index 0000000..d589882<br>
+--- /dev/null<br>
++++ b/result/XPath/xptr/viderror<br>
+@@ -0,0 +1,4 @@<br>
++<br>
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<=
br>
++Expression: xpointer(non-existing-fn()/<wbr>range-to(id(&#39;chapter2&#39=
;)))<br>
++Object is empty (NULL)<br>
+diff --git a/test/XPath/xptr/viderror b/test/XPath/xptr/viderror<br>
+new file mode 100644<br>
+index 0000000..da8c53b<br>
+--- /dev/null<br>
++++ b/test/XPath/xptr/viderror<br>
+@@ -0,0 +1 @@<br>
++xpointer(non-existing-fn()/<wbr>range-to(id(&#39;chapter2&#39;)))<br>
+diff --git a/xpath.c b/xpath.c<br>
+index 113bce6..d992841 100644<br>
+--- a/xpath.c<br>
++++ b/xpath.c<br>
+@@ -3342,13 +3342,13 @@ xmlXPathCmpNodes(xmlNodePtr node1, xmlNodePtr node=
2) {<br>
+=C2=A0 =C2=A0 =C2=A0 * compute depth to root<br>
+=C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0for (depth2 =3D 0, cur =3D node2;cur-&gt;parent !=3D N=
ULL;cur =3D cur-&gt;parent) {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (cur =3D=3D node1)<br>
++=C2=A0 =C2=A0 =C2=A0 if (cur-&gt;parent =3D=3D node1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depth2++;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0root =3D cur;<br>
+=C2=A0 =C2=A0 =C2=A0for (depth1 =3D 0, cur =3D node1;cur-&gt;parent !=3D N=
ULL;cur =3D cur-&gt;parent) {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (cur =3D=3D node2)<br>
++=C2=A0 =C2=A0 =C2=A0 if (cur-&gt;parent =3D=3D node2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return(-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depth1++;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -14005,9 +14005,14 @@ xmlXPathCompOpEval(<wbr>xmlXPathParserContextPtr =
ctxt, xmlXPathStepOpPtr op)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xmlNodeSetPt=
r oldset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int i, j;<br=
>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (op-&gt;ch1 !=
=3D -1)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (op-&gt;ch1 !=
=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0total +=3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0xmlXPathCompOpEval(ctxt, &amp;comp-&gt;steps[op-&gt;ch1]);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CHE=
CK_ERROR0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ctxt-&gt;valu=
e =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XP_=
ERROR0(XPATH_INVALID_<wbr>OPERAND);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (op-&gt;c=
h2 =3D=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return (total);<br>
+<br>
diff --git a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb" r=
el=3D"noreferrer" target=3D"_blank">lib<wbr>xml2_2.9.4.bb</a> b/meta/recipe=
s-core/libxml/<a href=3D"http://libxml2_2.9.4.bb" rel=3D"noreferrer" target=
=3D"_blank">lib<wbr>xml2_2.9.4.bb</a><br>
index 1fed90b..66a8940 100644<br>
--- a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>xml2_2.9.4.bb</a><br>
+++ b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>xml2_2.9.4.bb</a><br>
@@ -19,6 +19,7 @@ SRC_URI =3D &quot;<a href=3D"ftp://xmlsoft.org/libxml2/li=
bxml2-${PV}.tar.gz;name=3Dlibtar" rel=3D"noreferrer" target=3D"_blank">ftp:=
//xmlsoft.org/libxml2/<wbr>libxml2-${PV}.tar.gz;name=3D<wbr>libtar</a> \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://python-sitepackages-<wbr>d=
ir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libxml-m4-use-<wbr>pkgconf=
ig.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libxml2-fix_node_<wbr>comp=
arison.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libxml2-CVE-2016-5131.<wbr=
>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c1251e22a9c6c0543764de0--
