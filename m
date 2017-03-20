Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 84D1271DEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:43:04 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id v198so85859278ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OQYpj6rFexhYPBif89U5IQ54w3kXLBkOQ5TjBZ1nyN8=;
	b=kab74tJNY3ir8kW+q9+KbkwmMBXrK3/1v7bUpTbtJ8yOfmZNzyyyb2LWkbTDlrVSnq
	je7vZpHlGjFBPGUuDTRf6ZkPp3o8Anp+XkdlhbL57lwd7IbWeVzhihBUpfizrlzmrBxP
	fTaAgSTW6jWYFgTMp+VeSCdBlgGTZmX3ipAqxGB70x7I1ztnYAJmI6RAqCZya79foKtC
	GzS0FPHNFzlhSpURBOS6tYfVvESg5OO/PROFVGuHoFFW71B36KLRCzI7NqCDNnamWZgG
	NtDfemKafT5lgL7qNGtPUKxnhGGMFKct0ScDTv9Vvl5ANBTQiWuwXB1yBRBCI9F+t6vI
	FvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OQYpj6rFexhYPBif89U5IQ54w3kXLBkOQ5TjBZ1nyN8=;
	b=lVUL5gjcE4hIQfzIcTosd1pUDH8+eALKSxEPqhfx+Qrn2CEZB34zqgiz3fJ9pcwGev
	sY+tmmmk3zhIjoXU3C416+qQKtD6QXjqY2Hl5XfcBmGzUltTVxTaZufNAJnGzeh3UcK+
	VwKRVDOtxLmfvz6iIRaXZLC8at07XgaKiIdXGRs60KSkuqmkM4BwgGuHHoGexJaN9i5+
	Vk7rxbwAjTKKELlvW5AGZaWmSM3DHGRqOwW6Wlvjym1/cRJyxwvioOXyajDlyMHim9na
	uqk/y8rmLy8smchfy2Cm6k9zimrQjvvXt5iyDuEQ7msnNyV1/ow9z6k3ZJSB/d5B/beF
	852Q==
X-Gm-Message-State: AFeK/H1E4PfZTBViA2hAJ5Gwz3pX4GLWZX28dJ6w2htVfs12f0iM7YLQY8aGMIkJbR6TJmVDmDMMMb7P3lEhTe/r
X-Received: by 10.129.87.132 with SMTP id l126mr14850726ywb.167.1490002985378; 
	Mon, 20 Mar 2017 02:43:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Mon, 20 Mar 2017 02:42:35 -0700 (PDT)
In-Reply-To: <ef157c32-b0e7-c487-e9de-57449c22b474@denx.de>
References: <cover.1487727826.git.liezhi.yang@windriver.com>
	<2702bdc3f6961ba31689d97d67e900f9865d40ee.1487727826.git.liezhi.yang@windriver.com>
	<ef157c32-b0e7-c487-e9de-57449c22b474@denx.de>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 20 Mar 2017 11:42:35 +0200
Message-ID: <CAHiDW_Hh-R6zDNaZ5GymtGXWo1yzJpEOyr7Sts1PPZJF-pUmNQ@mail.gmail.com>
To: Stefano Babic <sbabic@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] file: 5.29 -> 5.30
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
X-List-Received-Date: Mon, 20 Mar 2017 09:43:06 -0000
Content-Type: multipart/alternative; boundary=001a1146269aa87d80054b265a5a

--001a1146269aa87d80054b265a5a
Content-Type: text/plain; charset=UTF-8

On 20 March 2017 at 11:14, Stefano Babic <sbabic@denx.de> wrote:
>
> On 22/02/2017 02:44, Robert Yang wrote:
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >  meta/recipes-devtools/file/{file_5.29.bb => file_5.30.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/file/{file_5.29.bb => file_5.30.bb} (96%)
> >
> > diff --git a/meta/recipes-devtools/file/file_5.29.bb
b/meta/recipes-devtools/file/file_5.30.bb
> > similarity index 96%
> > rename from meta/recipes-devtools/file/file_5.29.bb
> > rename to meta/recipes-devtools/file/file_5.30.bb
> > index 29af8748150..0998fcfa899 100644
> > --- a/meta/recipes-devtools/file/file_5.29.bb
> > +++ b/meta/recipes-devtools/file/file_5.30.bb
> > @@ -19,7 +19,7 @@ SRC_URI = "git://github.com/file/file.git \
> >          file://0001-Add-P-prompt-into-Usage-info.patch \
> >          "
> >
> > -SRCREV = "015b0cdce1a0abb68ab99510e7fc8d2f77e8ec77"
> > +SRCREV = "79814950aafb81ecd6a910c2a8a3b8ec12f3e4a6"
> >  S = "${WORKDIR}/git"
> >
> >  inherit autotools
> >
>
> Strange enough, it seems that the tree loses the history and all SRCREV
> are wrong. I tried with -krogoth, -morty, -master, and no revision
> number is found. In fact, after cloning the tree I see that all revision
> number were changed, just a couple here:
>
> 5.25 is now : 789cfc7d727cee1c7cfb7d29c09162e2399285c5
>
> 5.30 (this patch) : 3050419355566d2a96c5be97fef0ffae097bbb96
>
> Ok, I fix this in my layer with a .bbappend, but...Of course, all builds
> are broken - have you seen the same effect ?


Paul Gortmakers fix "update SRCREV for 5.30 to fix fetch fail on missing
commit" is in master. Similar fixes should be sent to release branches as
well.

It may have been a mistake to start using an unofficial git repo as the
source ... but the original reasoning was that the ftp site was unreliable.
The upstream version control being CVS means that we've got three choices,
none of them good.

--001a1146269aa87d80054b265a5a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 20 March 2017 at 11:14, Stefano Babic &lt;<a href=3D"ma=
ilto:sbabic@denx.de">sbabic@denx.de</a>&gt; wrote:<br>&gt;<br>&gt; On 22/02=
/2017 02:44, Robert Yang wrote:<br>&gt; &gt; Signed-off-by: Robert Yang &lt=
;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>=
&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0meta/recipes-devtools/file/{<a hre=
f=3D"http://file_5.29.bb">file_5.29.bb</a> =3D&gt; <a href=3D"http://file_5=
.30.bb">file_5.30.bb</a>} | 2 +-<br>&gt; &gt; =C2=A01 file changed, 1 inser=
tion(+), 1 deletion(-)<br>&gt; &gt; =C2=A0rename meta/recipes-devtools/file=
/{<a href=3D"http://file_5.29.bb">file_5.29.bb</a> =3D&gt; <a href=3D"http:=
//file_5.30.bb">file_5.30.bb</a>} (96%)<br>&gt; &gt;<br>&gt; &gt; diff --gi=
t a/meta/recipes-devtools/file/<a href=3D"http://file_5.29.bb">file_5.29.bb=
</a> b/meta/recipes-devtools/file/<a href=3D"http://file_5.30.bb">file_5.30=
.bb</a><br>&gt; &gt; similarity index 96%<br>&gt; &gt; rename from meta/rec=
ipes-devtools/file/<a href=3D"http://file_5.29.bb">file_5.29.bb</a><br>&gt;=
 &gt; rename to meta/recipes-devtools/file/<a href=3D"http://file_5.30.bb">=
file_5.30.bb</a><br>&gt; &gt; index 29af8748150..0998fcfa899 100644<br>&gt;=
 &gt; --- a/meta/recipes-devtools/file/<a href=3D"http://file_5.29.bb">file=
_5.29.bb</a><br>&gt; &gt; +++ b/meta/recipes-devtools/file/<a href=3D"http:=
//file_5.30.bb">file_5.30.bb</a><br>&gt; &gt; @@ -19,7 +19,7 @@ SRC_URI =3D=
 &quot;git://<a href=3D"http://github.com/file/file.git">github.com/file/fi=
le.git</a> \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add=
-P-prompt-into-Usage-info.patch \<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;<br>&gt; &gt;<br>&gt; &gt; -SRCREV =3D &quot;015b0cdce1a0abb68a=
b99510e7fc8d2f77e8ec77&quot;<br>&gt; &gt; +SRCREV =3D &quot;79814950aafb81e=
cd6a910c2a8a3b8ec12f3e4a6&quot;<br>&gt; &gt; =C2=A0S =3D &quot;${WORKDIR}/g=
it&quot;<br>&gt; &gt;<br>&gt; &gt; =C2=A0inherit autotools<br>&gt; &gt;<br>=
&gt;<br>&gt; Strange enough, it seems that the tree loses the history and a=
ll SRCREV<br>&gt; are wrong. I tried with -krogoth, -morty, -master, and no=
 revision<br>&gt; number is found. In fact, after cloning the tree I see th=
at all revision<br>&gt; number were changed, just a couple here:<br>&gt;<br=
>&gt; 5.25 is now : 789cfc7d727cee1c7cfb7d29c09162e2399285c5<br>&gt;<br>&gt=
; 5.30 (this patch) : 3050419355566d2a96c5be97fef0ffae097bbb96<br>&gt;<br>&=
gt; Ok, I fix this in my layer with a .bbappend, but...Of course, all build=
s<br>&gt; are broken - have you seen the same effect ?<br><br><br>Paul Gort=
makers fix &quot;update SRCREV for 5.30 to fix fetch fail on missing commit=
&quot; is in master. Similar fixes should be sent to release branches as we=
ll.=C2=A0<div><br></div><div>It may have been a mistake to start using an u=
nofficial git repo as the source ... but the original reasoning was that th=
e ftp site was unreliable. The upstream version control being CVS means tha=
t we&#39;ve got three choices, none of them good.<br><br></div></div>

--001a1146269aa87d80054b265a5a--
