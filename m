Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5235A7E7A1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 03:25:12 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id p144so12806485qke.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 20:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i+vw01hhk296DFWk/SzD0oDY0ZQs9xrv59WULN3PKWI=;
	b=qGL5vQ5F9/imqlP634ConVou2XMhXPAeRx3VILUJwpPyG72yM7qfvXIXscdBqnpUXM
	XLWXLzlQGmsLOq/TK4vJBY5OOvEGMHuh44SkMVfHvFdOFDkqNpXWM2HeXfpvVskwIF1q
	B8DuTQA24DC22REClWe6u4ovi+j9mQkjjeNxER6UuraP31S/4Nv2uIfPF0n2Nthnetd9
	94PsCh9VwSd+17+hT1Qu+czoHSL6vqplJNlp1eus7/CiH64NBJ8GxZKngKj5rbSANyLi
	TPj/yINEPediKnnCwbSO7joJDLA4QordIGfYxRMUgYRq1hmJlpQV9D2evjDxNzaA71Qs
	cesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i+vw01hhk296DFWk/SzD0oDY0ZQs9xrv59WULN3PKWI=;
	b=AiLY3OQ6pJol66CqiMy9Mjm+Q7hEbmoXQpkdvytt6ygflTMSoFhVDvKG6QWRo8iF1J
	xUSDHEQxfWS9pPR6ax2ORBUvVHpZM/bRmpIe/AtmsCD9z/ddiYk0Tb8kblpUl8I28if2
	dKUfr7fgSD1Pw0BxdsJDy54rosnszZXFORnk7lWrxUu9VHzOewPxGcVAxFj1xVv2INW6
	M4G6SLJHSFlFhszOFlXKuQAVgDuIudJ6a137P68zuF35uEzdlThMAnxRDBsw3XannlTk
	n7M1JBr04NEkD8sqSVLmcEnI88AA1U9P5sFwzTCsWtYCJu8OlFWydsDCEiuDN85WEDt/
	uKjw==
X-Gm-Message-State: APjAAAXmX6f/Z7Bb33lclMFjy144byZZ6g6zTqYWQfuGB5w07RVijl5l
	C8S9oEzGR3Bgp9X/ZqXi4DoueM51bDLIO4u61Os=
X-Google-Smtp-Source: APXvYqyu1vaOSBjlCNRwNo8WyMVlm2kP6kPTLL6wIE0oQG6JRrf+1tH5LuDsU8fZc2xJ3LR9iJIk/MqALUC4w7cg2fg=
X-Received: by 2002:a37:c81:: with SMTP id 123mr21372355qkm.474.1562037912440; 
	Mon, 01 Jul 2019 20:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190627135440.15815-1-JPEWhacker@gmail.com>
	<CAMKF1srnRNisnxfnhypBQuwO9F5q72LSDzuBZqdStBoXaR1kDQ@mail.gmail.com>
	<e6cf5479e8da4d7e95463096a50b820e@xbox06.axis.com>
In-Reply-To: <e6cf5479e8da4d7e95463096a50b820e@xbox06.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Jul 2019 23:25:00 -0400
Message-ID: <CAMKF1srRNUPoEj-7ogAxsWi3Pg1LZbjnze_aL2LpX7re2EtsiA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix locale DEPENDS
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
X-List-Received-Date: Tue, 02 Jul 2019 03:25:12 -0000
Content-Type: multipart/alternative; boundary="000000000000e5941b058caa4a23"

--000000000000e5941b058caa4a23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I think so.

On Mon, Jul 1, 2019 at 7:13 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Are you thinking of gettext-minimal-native? It is used by gettext.bbclass
> if USE_NLS is =E2=80=9Cno=E2=80=9D.
>
>
>
> //Peter
>
>
>
> *From:* openembedded-core-bounces@lists.openembedded.org <
> openembedded-core-bounces@lists.openembedded.org> *On Behalf Of *Khem Raj
> *Sent:* den 28 juni 2019 18:37
> *To:* Joshua Watt <jpewhacker@gmail.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core] [PATCH] glibc: Fix locale DEPENDS
>
>
>
>
>
>
>
> On Thu, Jun 27, 2019 at 9:54 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> gettext is required to generate the glibc locales in do_compile. If not
> present, glibc will skip the generation which isn't reproducible.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb
> b/meta/recipes-core/glibc/glibc_2.29.bb
> index 073d1533e37..c400ee10b0f 100644
> --- a/meta/recipes-core/glibc/glibc_2.29.bb
> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES;md5=3Dcfc0ed77a9f62=
fa62eded042ebe31d72
> \
>
>  file://posix/rxspencer/COPYRIGHT;md5=3Ddc5485bb394a13b2332ec1c785f5d83a =
\
>        file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c"
>
> -DEPENDS +=3D "gperf-native bison-native make-native"
> +DEPENDS +=3D "gperf-native bison-native make-native gettext-native"
>
>
>
> I think we have had this dependency proposed in past and one think that
> worries me is that it will cause serialization a bit more and can affect
> bulls times wasn=E2=80=99t there a minimal gettext at some point and I wo=
nder if
> that could satisfy needs here
>
>
>
>  PV =3D "2.29"
>
> --
> 2.21.0
>
>

--000000000000e5941b058caa4a23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Yes, I think so.</div><div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Jul 1, 2019 at 7:13 PM Peter Kjellerstedt=
 &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"SV" link=3D"blue" vlink=3D"purple">
<div class=3D"m_8923590567056631462WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634">Are you=
 thinking of gettext-minimal-native? It is used by gettext.bbclass if USE_N=
LS is =E2=80=9Cno=E2=80=9D.</span></p></div></div><div lang=3D"SV" link=3D"=
blue" vlink=3D"purple"><div class=3D"m_8923590567056631462WordSection1"><p =
class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u>=
=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634">//Peter=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634"><u></u>=
=C2=A0<u></u></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #e1e1e1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.=
org" target=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a>=
 &lt;<a href=3D"mailto:openembedded-core-bounces@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core-bounces@lists.openembedded.org</a>&gt;
<b>On Behalf Of </b>Khem Raj<br>
<b>Sent:</b> den 28 juni 2019 18:37<br>
<b>To:</b> Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com" target=
=3D"_blank">jpewhacker@gmail.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH] glibc: Fix locale DEPENDS<u></u><u></=
u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Thu, Jun 27, 2019 at 9:54 AM Joshua Watt &lt;<a h=
ref=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpewhacker@gmail.com<=
/a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal">gettext is required to generate the glibc locales in=
 do_compile. If not<br>
present, glibc will skip the generation which isn&#39;t reproducible.<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" target=3D"_b=
lank">glibc_2.29.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" targe=
t=3D"_blank">glibc_2.29.bb</a> b/meta/recipes-core/glibc/<a href=3D"http://=
glibc_2.29.bb" target=3D"_blank">glibc_2.29.bb</a><br>
index 073d1533e37..c400ee10b0f 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" target=3D"_b=
lank">glibc_2.29.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" target=3D"_b=
lank">glibc_2.29.bb</a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;<a>file://LICENSES;md5=3Dcfc0ed7=
7a9f62fa62eded042ebe31d72
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://posix/rxspencer/COPYRIGHT;md5=3Ddc5485bb3=
94a13b2332ec1c785f5d83a \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.LIB;md5=3D4fbd65380cdd25595107900=
8b364516c</a>&quot;<br>
<br>
-DEPENDS +=3D &quot;gperf-native bison-native make-native&quot;<br>
+DEPENDS +=3D &quot;gperf-native bison-native make-native gettext-native&qu=
ot;<u></u><u></u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I think we have had this dependency proposed in past=
 and one think that worries me is that it will cause serialization a bit mo=
re and can affect bulls times wasn=E2=80=99t there a minimal gettext at som=
e point and I wonder if that could satisfy
 needs here=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
<br>
=C2=A0PV =3D &quot;2.29&quot;<br>
<br>
-- <br>
2.21.0<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000e5941b058caa4a23--
