Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 01F696011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 15:03:34 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i7so18475953qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=ljOEUSuu5QWht4KoG2evMonQPYOxbkQQmfETglueRl0=;
	b=kB5XwOfcodkhknL7GO/yPIn3UUfaLU0P2jgP9hqPPMpeb9vrHSJ3pBUFqJG6qAkI6k
	eGxClG8tkxy8qiXEDklmUhqdrMtIYxhcqTOuYgLvIZvw+1hji6xY3ARriKLeG1P3ctJI
	vartfaHjFtvQeRAWOeIv3ocPfAxJ/jEjgNilDN8eXFgrJggpDaWJTzZfYTtrHugUvNRd
	DOxYON3gOkxLRDVd5LHnwfbKnUnSwsMTrGvqIo8ph5WtEZmbxL42Utpypxi/4C11MZJY
	wDhK/rIvvCqLdtgLwuHJZipt0rhIIWog5vgaMstbkAcc180pjMeTfL6kyl0Ors4zwKlC
	K9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=ljOEUSuu5QWht4KoG2evMonQPYOxbkQQmfETglueRl0=;
	b=UPwQPtP+8LqQ/xYXQCIXxceurcOv5asrWxmff80F5KsTO0yIw8hCKC/I8pqINb3QE7
	8jIniXRjRbF/j1pcWTD69gsK9JUZpnYoJjmpFUoVPqXWblcCzjSbDAlc4nu4qFLs9zvy
	RVsA/2mT2m5QlFJtHjq6iNqNyrbO9but5crZ0jd9wiz7BQzgRfkNpPR7JpYjirPVtwfm
	T4u5TzuzlTnyj5hN6d12VRiqnM0Up/4qMsqk7/iNo8LRydVvwm+Nf20D4UdDqCDtuUza
	su7K93DHnM1Uns3fCe98x/dBUCS6myn9H6mJu9T/84RMBuoXTqA13w4Y40j5+7H2pOT2
	uW6A==
X-Gm-Message-State: AOPr4FVU9oGAv44NQtHBR3ATqI7NIIhtKXkMZ8WFlBDlZxi+J2z/uFRYkCzSJMLU3LIRagSFDDNNhNGsbv3D5g==
MIME-Version: 1.0
X-Received: by 10.200.52.171 with SMTP id w40mr12580709qtb.31.1464015814530;
	Mon, 23 May 2016 08:03:34 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Mon, 23 May 2016 08:03:34 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Mon, 23 May 2016 08:03:34 -0700 (PDT)
In-Reply-To: <1463995943.9570.17.camel@linuxfoundation.org>
References: <1463995943.9570.17.camel@linuxfoundation.org>
Date: Mon, 23 May 2016 18:03:34 +0300
Message-ID: <CAMKF1srod99_GKOb8AN9n6VCzvW+=yB-ECYfUzY5HgvTPixmgA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd: Fix infinite build loop
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
X-List-Received-Date: Mon, 23 May 2016 15:03:35 -0000
Content-Type: multipart/alternative; boundary=001a114533349248f9053383bed0

--001a114533349248f9053383bed0
Content-Type: text/plain; charset=UTF-8

Thanks Richard
On May 23, 2016 2:33 AM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:

>
> http://git.openembedded.org/openembedded-core-contrib/commit/?id=642c6cf0b6a0371de476513162bd0cefa9c438b3
> introduces a problem if the USERADD_PARAM variable has trailing
> whitespace as the code infinitely loops causing build hangs.
>
> Add a similar sed expression to $remaining to avoid this.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index 67dae88..28dd341 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -55,14 +55,14 @@ if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`"
> != "x"; then
>         # Invoke multiple instances of groupadd for parameter lists
>         # separated by ';'
>         opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | sed -e 's#[
> \t]*$##'`
> -       remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
> +       remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2- | sed -e 's#[
> \t]*$##'`
>         while test "x$opts" != "x"; do
>                 perform_groupadd "$SYSROOT" "$OPT $opts"
>                 if test "x$opts" = "x$remaining"; then
>                         break
>                 fi
>                 opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[
> \t]*$##'`
> -               remaining=`echo "$remaining" | cut -d ';' -f 2-`
> +               remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e
> 's#[ \t]*$##'`
>         done
>  fi
>
> @@ -71,14 +71,14 @@ if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`"
> != "x"; then
>         # Invoke multiple instances of useradd for parameter lists
>         # separated by ';'
>         opts=`echo "$USERADD_PARAM" | cut -d ';' -f 1 | sed -e 's#[
> \t]*$##'`
> -       remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2-`
> +       remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2- | sed -e 's#[
> \t]*$##'`
>         while test "x$opts" != "x"; do
>                 perform_useradd "$SYSROOT" "$OPT $opts"
>                 if test "x$opts" = "x$remaining"; then
>                         break
>                 fi
>                 opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[
> \t]*$##'`
> -               remaining=`echo "$remaining" | cut -d ';' -f 2-`
> +               remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e
> 's#[ \t]*$##'`
>         done
>  fi
>
> @@ -87,14 +87,14 @@ if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`"
> != "x"; then
>         # Invoke multiple instances of groupmems for parameter lists
>         # separated by ';'
>         opts=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1 | sed -e 's#[
> \t]*$##'`
> -       remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2-`
> +       remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2- | sed -e
> 's#[ \t]*$##'`
>         while test "x$opts" != "x"; do
>                 perform_groupmems "$SYSROOT" "$OPT $opts"
>                 if test "x$opts" = "x$remaining"; then
>                         break
>                 fi
>                 opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[
> \t]*$##'`
> -               remaining=`echo "$remaining" | cut -d ';' -f 2-`
> +               remaining=`echo "$remaining" | cut -d ';' -f 2- | sed -e
> 's#[ \t]*$##'`
>         done
>  fi
>  }
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114533349248f9053383bed0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Thanks Richard </p>
<div class=3D"gmail_quote">On May 23, 2016 2:33 AM, &quot;Richard Purdie&qu=
ot; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br type=3D"attribution"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><a href=3D"http://git.openembedded.org/openembedded-core-c=
ontrib/commit/?id=3D642c6cf0b6a0371de476513162bd0cefa9c438b3" rel=3D"norefe=
rrer" target=3D"_blank">http://git.openembedded.org/openembedded-core-contr=
ib/commit/?id=3D642c6cf0b6a0371de476513162bd0cefa9c438b3</a><br>
introduces a problem if the USERADD_PARAM variable has trailing<br>
whitespace as the code infinitely loops causing build hangs.<br>
<br>
Add a similar sed expression to $remaining to avoid this.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br>
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass<br=
>
index 67dae88..28dd341 100644<br>
--- a/meta/classes/useradd.bbclass<br>
+++ b/meta/classes/useradd.bbclass<br>
@@ -55,14 +55,14 @@ if test &quot;x`echo $GROUPADD_PARAM | tr -d &#39;[:spa=
ce:]&#39;`&quot; !=3D &quot;x&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Invoke multiple instances of groupadd for par=
ameter lists<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # separated by &#39;;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=3D`echo &quot;$GROUPADD_PARAM&quot; | cut =
-d &#39;;&#39; -f 1 | sed -e &#39;s#[ \t]*$##&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &quot;$GROUPADD_PARAM&quot; |=
 cut -d &#39;;&#39; -f 2-`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &quot;$GROUPADD_PARAM&quot; |=
 cut -d &#39;;&#39; -f 2- | sed -e &#39;s#[ \t]*$##&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while test &quot;x$opts&quot; !=3D &quot;x&quot=
;; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perform_groupadd &q=
uot;$SYSROOT&quot; &quot;$OPT $opts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$opt=
s&quot; =3D &quot;x$remaining&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=3D`echo &quot;=
$remaining&quot; | cut -d &#39;;&#39; -f 1 | sed -e &#39;s#[ \t]*$##&#39;`<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &=
quot;$remaining&quot; | cut -d &#39;;&#39; -f 2-`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &=
quot;$remaining&quot; | cut -d &#39;;&#39; -f 2- | sed -e &#39;s#[ \t]*$##&=
#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0fi<br>
<br>
@@ -71,14 +71,14 @@ if test &quot;x`echo $USERADD_PARAM | tr -d &#39;[:spac=
e:]&#39;`&quot; !=3D &quot;x&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Invoke multiple instances of useradd for para=
meter lists<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # separated by &#39;;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=3D`echo &quot;$USERADD_PARAM&quot; | cut -=
d &#39;;&#39; -f 1 | sed -e &#39;s#[ \t]*$##&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &quot;$USERADD_PARAM&quot; | =
cut -d &#39;;&#39; -f 2-`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &quot;$USERADD_PARAM&quot; | =
cut -d &#39;;&#39; -f 2- | sed -e &#39;s#[ \t]*$##&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while test &quot;x$opts&quot; !=3D &quot;x&quot=
;; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perform_useradd &qu=
ot;$SYSROOT&quot; &quot;$OPT $opts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$opt=
s&quot; =3D &quot;x$remaining&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=3D`echo &quot;=
$remaining&quot; | cut -d &#39;;&#39; -f 1 | sed -e &#39;s#[ \t]*$##&#39;`<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &=
quot;$remaining&quot; | cut -d &#39;;&#39; -f 2-`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &=
quot;$remaining&quot; | cut -d &#39;;&#39; -f 2- | sed -e &#39;s#[ \t]*$##&=
#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0fi<br>
<br>
@@ -87,14 +87,14 @@ if test &quot;x`echo $GROUPMEMS_PARAM | tr -d &#39;[:sp=
ace:]&#39;`&quot; !=3D &quot;x&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Invoke multiple instances of groupmems for pa=
rameter lists<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # separated by &#39;;&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=3D`echo &quot;$GROUPMEMS_PARAM&quot; | cut=
 -d &#39;;&#39; -f 1 | sed -e &#39;s#[ \t]*$##&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &quot;$GROUPMEMS_PARAM&quot; =
| cut -d &#39;;&#39; -f 2-`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &quot;$GROUPMEMS_PARAM&quot; =
| cut -d &#39;;&#39; -f 2- | sed -e &#39;s#[ \t]*$##&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while test &quot;x$opts&quot; !=3D &quot;x&quot=
;; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 perform_groupmems &=
quot;$SYSROOT&quot; &quot;$OPT $opts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$opt=
s&quot; =3D &quot;x$remaining&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opts=3D`echo &quot;=
$remaining&quot; | cut -d &#39;;&#39; -f 1 | sed -e &#39;s#[ \t]*$##&#39;`<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &=
quot;$remaining&quot; | cut -d &#39;;&#39; -f 2-`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remaining=3D`echo &=
quot;$remaining&quot; | cut -d &#39;;&#39; -f 2- | sed -e &#39;s#[ \t]*$##&=
#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0fi<br>
=C2=A0}<br>
<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a114533349248f9053383bed0--
