Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9E5C433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 15:29:25 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.11112.1633361365085729071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 08:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y8+1Ge06;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id c29so4421590pfp.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 08:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/3uY6buPmJSZQITnbsSRONuwrKVTAjTyzAp2ALb44tA=;
        b=Y8+1Ge06BiyR4rvQHJCvjplTkstcz9vpYiIMWhyl5lrJBDXJj3Lx9b/NicHGC8STmT
         oS7rRukZwDXFYJbZHYmz/cHplxhjyMxngJxUyJlpLsZDgjZc2U7ra1wAmL0N+4sz+Bko
         uL26aTpf7NkfxBQ15+jO081mUaEZaLaWUxlqFw1TwRSW9K0R7d1MNuppLKUv0vxktZC2
         h2gI3S20NHR6fouJt8A/bJQoS+Zw4zMinhNFH3tey3zo4f+HTtgLRagdSQlG8RwMzMrQ
         sOcoP+oX8JPXT82QG/Kk1OpRAZyE7FwEjxajtTYyzsb6m/4JSp1c19JBNVQNbKUJln5H
         SO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/3uY6buPmJSZQITnbsSRONuwrKVTAjTyzAp2ALb44tA=;
        b=IPB3a5FPNvJ1SuqBUtoBOece1Nsf3mntkX7a69e7kqjMsmyV6LfPrCetUOAJhowLxK
         049HOJChcWq2oAjTsMIdwLQ4fHzmgH+utDrv1utaAliQ3GMiBcpZXZILjMXkDaltXMm6
         lIBpz23gAw5XuBsl7RMZzQl1n8DFPp5CH13R/9qqRIlk2ecb9M1D0sGcQHKulW4XW+p8
         AtIj9MRK9FJowEej/YUWEiJTK+fICVNpk5lSfObVfwfkC1GllfipcqAVmMKiCoGhAVC+
         UZgv14l6P/TwocYs3tbEo1xsMvLjDlkUz0e1hYDRaLASgNs9d1jWlve8T58/4oAGBVDp
         10QQ==
X-Gm-Message-State: AOAM532Couuz7V3NhYPY7lJKcy+zCDm+7zl5uPD22kpM4oUtAcXUXNfr
	wd4spHkMS2qWUVHSFRTrXdjPMZeeqjVlSvRLhzo=
X-Google-Smtp-Source: 
 ABdhPJwNkqiEXd1fQCZF1cw3iXK9u7qOo7q+Fb3HImOcSojpOk5xJZpBrRhjXw0w8nmgNHPJCd3EUDTF//3ZtagH7gM=
X-Received: by 2002:a62:15c3:0:b0:44c:667c:2731 with SMTP id
 186-20020a6215c3000000b0044c667c2731mr4130228pfv.17.1633361364322; Mon, 04
 Oct 2021 08:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211004132853.30543-1-kweihmann@outlook.com>
 <AM9PR09MB46421376B722A7A7A315BC8CA8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <2d32793c8dbc47a0afced79d07377812@axis.com>
 <AM9PR09MB4642623841A0B2B3EDDE44D2A8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642623841A0B2B3EDDE44D2A8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 4 Oct 2021 17:29:13 +0200
Message-ID: 
 <CA+chaQdjdwmsiSnyVsegyfEG192mVrBdyX0ayrQ7L==f24ypRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] glibc: fix append in DEPENDS
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e90f3905cd8893ff"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 15:29:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156612

--000000000000e90f3905cd8893ff
Content-Type: text/plain; charset="UTF-8"

> Still this is very prone to errors, so I personally rather have a
space too much than to few (esp. as the else clause doesn't add a space).

The missing space in else clause is often intentional in cases like this,
so that the append has no impact on value when not enabled
with GTKDOC_ENABLED. Why should it add useless space when not enabled? Just
for the possibility of someone adding something to else clause without
leading space there?

On Mon, Oct 4, 2021 at 5:14 PM Konrad Weihmann <kweihmann@outlook.com>
wrote:

>
>
> On 04.10.21 17:08, Peter Kjellerstedt wrote:
> >> -----Original Message-----
> >> From: openembedded-core@lists.openembedded.org <openembedded-
> >> core@lists.openembedded.org> On Behalf Of Konrad Weihmann
> >> Sent: den 4 oktober 2021 15:29
> >> To: openembedded-core@lists.openembedded.org
> >> Cc: Konrad Weihmann <kweihmann@outlook.com>
> >> Subject: [OE-core] [PATCH 2/3] glibc: fix append in DEPENDS
> >>
> >> fix the append with a leading blank, otherwise this messes up
> >> DEPENDS when globally inherited classes add dependecies of their own
> >>
> >> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> >> ---
> >>   meta/recipes-core/glib-2.0/glib.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-core/glib-2.0/glib.inc
> b/meta/recipes-core/glib-
> >> 2.0/glib.inc
> >> index a34776b083..3436645f15 100644
> >> --- a/meta/recipes-core/glib-2.0/glib.inc
> >> +++ b/meta/recipes-core/glib-2.0/glib.inc
> >> @@ -30,7 +30,7 @@ LEAD_SONAME = "libglib-2.0.*"
> >>
> >>   inherit meson gettext gtk-doc pkgconfig ptest-gnome
> upstream-version-is-
> >> even bash-completion gio-module-cache manpages
> >>
> >> -DEPENDS:append:class-target = "${@' gtk-doc' if
> d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
> >> +DEPENDS:append:class-target = " ${@' gtk-doc' if
> d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
> >
> > This change is not needed as there already is a space inside
> > the if statement (in ' gtk-doc').
>
> Still this is very prone to errors, so I personally rather have a space
> too much than to few (esp. as the else clause doesn't add a space).
>
> IHMO it should be for readability purpose rather " ${@'gtk-doc' if
> d.getVar('GTKDOC_ENABLED') == 'True' else ''}" than like it is now - but
> that's just cosmetics and I'm sure one could discuss about that a lot
>
> >
> >>
> >>   GTKDOC_MESON_OPTION = "gtk_doc"
> >>
> >> --
> >> 2.25.1
> >
> > //Peter
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156611):
> https://lists.openembedded.org/g/openembedded-core/message/156611
> Mute This Topic: https://lists.openembedded.org/mt/86066304/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e90f3905cd8893ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Still this is very prone to errors, so I personally r=
ather have a space=C2=A0too much than to few (esp. as the else clause doesn=
&#39;t add a space).<div><br></div><div>The missing space in else clause is=
 often intentional in cases like this, so that the append has no impact on =
value when not enabled with=C2=A0GTKDOC_ENABLED. Why should it add useless =
space when not enabled? Just for the possibility of someone adding somethin=
g to else clause without leading space there?</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 4, 2021 at 5=
:14 PM Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihma=
nn@outlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><br>
<br>
On 04.10.21 17:08, Peter Kjellerstedt wrote:<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" =
target=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembe=
dded-<br>
&gt;&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">c=
ore@lists.openembedded.org</a>&gt; On Behalf Of Konrad Weihmann<br>
&gt;&gt; Sent: den 4 oktober 2021 15:29<br>
&gt;&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" ta=
rget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; Cc: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com" t=
arget=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
&gt;&gt; Subject: [OE-core] [PATCH 2/3] glibc: fix append in DEPENDS<br>
&gt;&gt;<br>
&gt;&gt; fix the append with a leading blank, otherwise this messes up<br>
&gt;&gt; DEPENDS when globally inherited classes add dependecies of their o=
wn<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@out=
look.com" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-core/glib-2.0/glib.inc | 2 +-<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-co=
re/glib-<br>
&gt;&gt; 2.0/glib.inc<br>
&gt;&gt; index a34776b083..3436645f15 100644<br>
&gt;&gt; --- a/meta/recipes-core/glib-2.0/glib.inc<br>
&gt;&gt; +++ b/meta/recipes-core/glib-2.0/glib.inc<br>
&gt;&gt; @@ -30,7 +30,7 @@ LEAD_SONAME =3D &quot;libglib-2.0.*&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0inherit meson gettext gtk-doc pkgconfig ptest-gnome up=
stream-version-is-<br>
&gt;&gt; even bash-completion gio-module-cache manpages<br>
&gt;&gt;<br>
&gt;&gt; -DEPENDS:append:class-target =3D &quot;${@&#39; gtk-doc&#39; if d.=
getVar(&#39;GTKDOC_ENABLED&#39;) =3D=3D &#39;True&#39; else &#39;&#39;}&quo=
t;<br>
&gt;&gt; +DEPENDS:append:class-target =3D &quot; ${@&#39; gtk-doc&#39; if d=
.getVar(&#39;GTKDOC_ENABLED&#39;) =3D=3D &#39;True&#39; else &#39;&#39;}&qu=
ot;<br>
&gt; <br>
&gt; This change is not needed as there already is a space inside<br>
&gt; the if statement (in &#39; gtk-doc&#39;).<br>
<br>
Still this is very prone to errors, so I personally rather have a space <br=
>
too much than to few (esp. as the else clause doesn&#39;t add a space).<br>
<br>
IHMO it should be for readability purpose rather &quot; ${@&#39;gtk-doc&#39=
; if <br>
d.getVar(&#39;GTKDOC_ENABLED&#39;) =3D=3D &#39;True&#39; else &#39;&#39;}&q=
uot; than like it is now - but <br>
that&#39;s just cosmetics and I&#39;m sure one could discuss about that a l=
ot<br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt; <br>
&gt; //Peter<br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156611): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156611" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156611</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86066304/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86066304/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000e90f3905cd8893ff--

