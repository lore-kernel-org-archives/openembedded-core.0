Return-Path: <rahulchauhankitps@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 052B560F06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 07:27:01 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id c23so6251008lfi.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 23:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qwcCiPiO5Mo7BkcfDE0TO9WAu5tzXbDTJ4slF31tYkg=;
	b=OFryBD5SuCKMQcL07jyS0kPSX4XM+ne30hxlpuHFqzYzsoaqDvFg/TKOgFhdoEuIZq
	u8swt8mgIsM5pRRG5Gk6QO1UTVR8yYX/MOjAgOjkCUnBbGjNZvB9TLydxZtg6dke2LfW
	rrvbes8TAW/zLO9gI+KI4xkt5LYuVsw+xSBdS9agd34KgFEWRacYHHhr74coLGQ8EqoJ
	0BGgQAlQswqQ4thrxhH6LQy+znGAYyTQ1ndz4TQGJWUKJpRYEyg3VH9Wkz+UpiE0CCQQ
	b0VMdbxctb3g7epQkFznT7TutNU1A/rIAxru9UufVVRmznp3JsHJfEsCZvRnGsi/mp4C
	ey7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qwcCiPiO5Mo7BkcfDE0TO9WAu5tzXbDTJ4slF31tYkg=;
	b=uXm+9+YagTJPcyW+Hud1eSPAh6n66VJT9AATVGlCIcOAQD/duipqNxIpbSp5YvXMS7
	RIgmAiOQgRV9ZFpPQWQHJUTgrd4M24V/SLipE1guMh4i32WyWkjx/g9ViJf9/lQ6dUym
	oMUzNw0JwK7wI7Y5PZAi7I4PrPxJo96E7yePB+eDmXX11yWPR4X7f43viF79MDcyRFN2
	nyutvKNufoQiMwwa0gShR6DUa9CBW9VGkC9ZN4IG9pz8wX80NgtnvUGj2FFVm4KP5rEv
	E7c8dJBxXh3eZK7peIvAaTvH7CWtKMFv0aqbgFPywjTFW6Cd1SzvPbZj28SUr+USl0sD
	f3oQ==
X-Gm-Message-State: APjAAAV8ExpK5leWHWC368ZLt1Criqa5GVye5frTdMtsqSRZMfHYyPsm
	E6yRwhX1daswaBfjsN/tl/YgcJGgCdrZJkaclHM=
X-Google-Smtp-Source: APXvYqysWFYP2ETDsNnALwAszkmvhDuxH7cNohsEsPEvNXFzU7En5bKCVb9IOBDDcnVypSsfy/pzSvuZGiIrobelhMs=
X-Received: by 2002:ac2:5612:: with SMTP id v18mr2689160lfd.172.1581406021529; 
	Mon, 10 Feb 2020 23:27:01 -0800 (PST)
MIME-Version: 1.0
References: <1581360561-30532-1-git-send-email-rahulk@mvista.com>
	<603e05c3-b568-a228-7821-5a48593b4c30@gmail.com>
In-Reply-To: <603e05c3-b568-a228-7821-5a48593b4c30@gmail.com>
From: rahul chauhan <rahulchauhankitps@gmail.com>
Date: Tue, 11 Feb 2020 12:56:50 +0530
Message-ID: <CAGk+Jeg8EXqXcPspyvEoUYBPP2=4b+iXkeB9++KN2VH=UCPkSA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH] libxml2: Fix CVE-2019-19956
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
X-List-Received-Date: Tue, 11 Feb 2020 07:27:02 -0000
Content-Type: multipart/alternative; boundary="00000000000028b747059e47c844"

--00000000000028b747059e47c844
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

Both patches are same. Since after submit the patch . I could not see my
patch at https://patchwork.openembedded.org/project/oe-core/patches/
so I was suspect that my patch submitted properly or not.

so I submitted this patch again.

I have one quick question.
After patch submission If I am not able to see my patch at
https://patchwork.openembedded.org/project/oe-core/patches/ , is there any
other way to check the patch submission status.

Thanks & Regards
Rahul Chauhan

On Tue, Feb 11, 2020 at 8:37 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 2/10/20 10:49 AM, Rahul Chauhan wrote:
> > Signed-off-by: Rahul Chauhan <rahulk@mvista.com>
> > ---
> >  .../libxml/libxml2/fix-CVE-2019-19956.patch        | 38
> ++++++++++++++++++++++
> >  meta/recipes-core/libxml/libxml2_2.9.8.bb          |  1 +
> >  2 files changed, 39 insertions(+)
> >  create mode 100644
> meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
>
> What is the difference from the patch sent on the 6th? is this a version 2?
>
> - armin
> >
> > diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
> b/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
> > new file mode 100644
> > index 0000000..43c3589
> > --- /dev/null
> > +++ b/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
> > @@ -0,0 +1,38 @@
> > +From 3cd2b25ddb04740be2880cfd78d60038452228b1 Mon Sep 17 00:00:00 2001
> > +From: Zhipeng Xie <xiezhipeng1@huawei.com>
> > +Date: Wed, 7 Aug 2019 17:39:17 +0800
> > +Subject: [PATCH] Fix memory leak in xmlParseBalancedChunkMemoryRecover
> > +
> > +When doc is NULL, namespace created in xmlTreeEnsureXMLDecl
> > +is bind to newDoc->oldNs, in this case, set newDoc->oldNs to
> > +NULL and free newDoc will cause a memory leak.
> > +
> > +Found with libFuzzer.
> > +
> > +Closes #82.
> > +
> > +Upstream-Status: Backport [
> https://gitlab.gnome.org/GNOME/libxml2/commit/5a02583c7e683896d84878bd90641d8d9b0d0549
> ]
> > +CVE: CVE-2019-19956
> > +
> > +Signed-off-by: Rahul Chauhan <rahulk@mvista.com>
> > +---
> > + parser.c | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/parser.c b/parser.c
> > +index b7ecd65..491f5c9 100644
> > +--- a/parser.c
> > ++++ b/parser.c
> > +@@ -13899,7 +13899,8 @@ xmlParseBalancedChunkMemoryRecover(xmlDocPtr
> doc, xmlSAXHandlerPtr sax,
> > +     xmlFreeParserCtxt(ctxt);
> > +     newDoc->intSubset = NULL;
> > +     newDoc->extSubset = NULL;
> > +-    newDoc->oldNs = NULL;
> > ++    if(doc != NULL)
> > ++    newDoc->oldNs = NULL;
> > +     xmlFreeDoc(newDoc);
> > +
> > +     return(ret);
> > +--
> > +2.7.4
> > +
> > diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb
> b/meta/recipes-core/libxml/libxml2_2.9.8.bb
> > index 62643bc..67c2d4f 100644
> > --- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
> > +++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
> > @@ -23,6 +23,7 @@ SRC_URI = "
> http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
> >             file://fix-CVE-2017-8872.patch \
> >             file://fix-CVE-2018-14404.patch \
> >             file://0001-Fix-infinite-loop-in-LZMA-decompression.patch \
> > +           file://fix-CVE-2019-19956.patch \
> >             "
> >
> >  SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"
>
>

--00000000000028b747059e47c844
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Armin,<div><br>Both patches are same. Since after submi=
t the patch . I could not see my patch at <a href=3D"https://patchwork.open=
embedded.org/project/oe-core/patches/">https://patchwork.openembedded.org/p=
roject/oe-core/patches/</a><br>so I was suspect that my patch submitted pro=
perly or not.<br><br>so I submitted this patch again.<br><br>I have one qui=
ck question. <br>After patch submission If I am not able to see my patch at=
 <a href=3D"https://patchwork.openembedded.org/project/oe-core/patches/">ht=
tps://patchwork.openembedded.org/project/oe-core/patches/</a> , is there an=
y other way to check the patch submission status.<br></div><div><br></div><=
div>Thanks &amp; Regards</div><div>Rahul Chauhan</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 11, 2020=
 at 8:37 AM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster8=
08@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
<br>
On 2/10/20 10:49 AM, Rahul Chauhan wrote:<br>
&gt; Signed-off-by: Rahul Chauhan &lt;<a href=3D"mailto:rahulk@mvista.com" =
target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libxml/libxml2/fix-CVE-2019-19956.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 38 ++++++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libxml2_2.9.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 39 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2019=
-19956.patch<br>
<br>
What is the difference from the patch sent on the 6th? is this a version 2?=
<br>
<br>
- armin<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch=
 b/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..43c3589<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch<br>
&gt; @@ -0,0 +1,38 @@<br>
&gt; +From 3cd2b25ddb04740be2880cfd78d60038452228b1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Zhipeng Xie &lt;<a href=3D"mailto:xiezhipeng1@huawei.com" targe=
t=3D"_blank">xiezhipeng1@huawei.com</a>&gt;<br>
&gt; +Date: Wed, 7 Aug 2019 17:39:17 +0800<br>
&gt; +Subject: [PATCH] Fix memory leak in xmlParseBalancedChunkMemoryRecove=
r<br>
&gt; +<br>
&gt; +When doc is NULL, namespace created in xmlTreeEnsureXMLDecl<br>
&gt; +is bind to newDoc-&gt;oldNs, in this case, set newDoc-&gt;oldNs to<br=
>
&gt; +NULL and free newDoc will cause a memory leak.<br>
&gt; +<br>
&gt; +Found with libFuzzer.<br>
&gt; +<br>
&gt; +Closes #82.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/=
libxml2/commit/5a02583c7e683896d84878bd90641d8d9b0d0549" rel=3D"noreferrer"=
 target=3D"_blank">https://gitlab.gnome.org/GNOME/libxml2/commit/5a02583c7e=
683896d84878bd90641d8d9b0d0549</a>]<br>
&gt; +CVE: CVE-2019-19956<br>
&gt; +<br>
&gt; +Signed-off-by: Rahul Chauhan &lt;<a href=3D"mailto:rahulk@mvista.com"=
 target=3D"_blank">rahulk@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + parser.c | 3 ++-<br>
&gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/parser.c b/parser.c<br>
&gt; +index b7ecd65..491f5c9 100644<br>
&gt; +--- a/parser.c<br>
&gt; ++++ b/parser.c<br>
&gt; +@@ -13899,7 +13899,8 @@ xmlParseBalancedChunkMemoryRecover(xmlDocPtr =
doc, xmlSAXHandlerPtr sax,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xmlFreeParserCtxt(ctxt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0newDoc-&gt;intSubset =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0newDoc-&gt;extSubset =3D NULL;<br>
&gt; +-=C2=A0 =C2=A0 newDoc-&gt;oldNs =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 if(doc !=3D NULL)<br>
&gt; ++=C2=A0 =C2=A0 newDoc-&gt;oldNs =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xmlFreeDoc(newDoc);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0return(ret);<br>
&gt; +-- <br>
&gt; +2.7.4<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.8.=
bb" rel=3D"noreferrer" target=3D"_blank">libxml2_2.9.8.bb</a> b/meta/recipe=
s-core/libxml/<a href=3D"http://libxml2_2.9.8.bb" rel=3D"noreferrer" target=
=3D"_blank">libxml2_2.9.8.bb</a><br>
&gt; index 62643bc..67c2d4f 100644<br>
&gt; --- a/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libxml2_2.9.8.bb</a><br>
&gt; +++ b/meta/recipes-core/libxml/<a href=3D"http://libxml2_2.9.8.bb" rel=
=3D"noreferrer" target=3D"_blank">libxml2_2.9.8.bb</a><br>
&gt; @@ -23,6 +23,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.xmlsoft.org/=
sources/libxml2-$%7BPV%7D.tar.gz;name=3Dlibtar" rel=3D"noreferrer" target=
=3D"_blank">http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=3Dlibt=
ar</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-CVE-2017-887=
2.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-CVE-2018-144=
04.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-infinit=
e-loop-in-LZMA-decompression.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-CVE-2019-19956.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI[libtar.md5sum] =3D &quot;b786e353e2aa1b872d70d5d1ca0c740=
d&quot;<br>
<br>
</blockquote></div>

--00000000000028b747059e47c844--
