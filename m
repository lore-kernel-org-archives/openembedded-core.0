Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id E8C6774C9E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 14:44:04 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id bi12-v6so8929694plb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 07:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YKzro/f66Evk4wgch7biOqCSb+PEnIigUsrdV/B23/E=;
	b=uahzRwO2bNqyQW2ha/0U7NzSZzdxzKP03uKMOuZcQSv7HlXH08urzt0eHKMr5VzVyT
	9vxjpRwEoWZ3LlRvY1yK5Augd+XLHZLDFCDUp6HhAzMgJcn4G7uh0VAOX41Eq5gM/cBB
	VaDfKTr2K0aHz/EhfIJ2hNA4yrHRxSX1YnzT6PG8x1xziCp9bclnHrxNW8Ye9Se7suEP
	iCCuW//qcZPOPDICalRidbKM3JryAF4ZP84Lcq+QcOVRHeg+JziOkOtCeARmupwL70KU
	0OaVj4Rs3r/azvmUblsfzTC8f8CrT6qWruOna1+bgq/gKwlsMkEf07vkj1n8OsNEIHJg
	9fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YKzro/f66Evk4wgch7biOqCSb+PEnIigUsrdV/B23/E=;
	b=K2iBgsbXptBAilDzrpQAxbado4AQlvSfftUa/4MdRPPsn/agTc0pjIm+b/h6RbbIP/
	wIDNadf2w252kghGVuKm3277qUW400j6xOzPFGExw9P1dsfq6dfD/K9LdupjiJjjGK/b
	BtB4TLFEYKLcec0niYTGMnjttdCkYKt4KK8ga7nWSlmMmvClatz0XdiMkBc1664IoFfw
	ybePePL+uRtnG8oh362c9t2ZB4RtnHplwobUMc8Cd+j+CLLUGz7/Gp+zszanDHuqqIS+
	MT7ZLkdqBd/Zlj59+MtCf7hb9d8t+ZXf7T+2gauuBH+RCiPq6Dl4R7x6/ZFYFkiF6R6h
	uurg==
X-Gm-Message-State: ALKqPwf91FPVGDbmLiVPuO52R8uhpAsSc2JOIjqshO6CYuY3MtJ2+Puz
	t1eH5ExvQXWNhKsXkJQ2Pt88blTllUOGVE/Efvo=
X-Google-Smtp-Source: AB8JxZpvSYW/0SYwb7o2YEMPxYP415Qf7WpNtbTHF/qzbQBZK60KmZWJmRLhQZjru8PPDpb68PUNjk8JDVwCvRf7Peo=
X-Received: by 2002:a17:902:14d:: with SMTP id
	71-v6mr20644331plb.275.1526913845389; 
	Mon, 21 May 2018 07:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20180521085306.112262-1-jibin.xu@windriver.com>
	<CAMKF1spA_JPf1Zro9Cfk42D4oGATawRzB4vLs=9_cT2cdErYhA@mail.gmail.com>
	<CAJTo0LZijCHeT51Lhvz=8qj6b=HZZObGg6TxsKHe08uRvGDiMQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZijCHeT51Lhvz=8qj6b=HZZObGg6TxsKHe08uRvGDiMQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 May 2018 07:43:54 -0700
Message-ID: <CAMKF1sry0bbcnjOykk1DXH3EFE=FrVV6HsBGvpb+dQ-58yJJNw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: upgrade 1.19.4 -> 1.19.5
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
X-List-Received-Date: Mon, 21 May 2018 14:44:05 -0000
Content-Type: multipart/alternative; boundary="0000000000005b6e2b056cb855ca"

--0000000000005b6e2b056cb855ca
Content-Type: text/plain; charset="UTF-8"

Cool, thanks!

On Mon, May 21, 2018 at 7:36 AM Burton, Ross <ross.burton@intel.com> wrote:

> There's just one security fix which can be backported (in fact, that
> fix is already on the list for master so its easy to backport).
>
> Ross
>
> On 21 May 2018 at 14:48, Khem Raj <raj.khem@gmail.com> wrote:
> > this has security fixes i wonder if this should be backported to sumo
> >
> > On Mon, May 21, 2018 at 1:53 AM, Jibin Xu <jibin.xu@windriver.com>
> wrote:
> >> Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
> >> ---
> >>  meta/recipes-extended/wget/{wget_1.19.4.bb => wget_1.19.5.bb} | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta/recipes-extended/wget/{wget_1.19.4.bb => wget_1.19.5.bb}
> (60%)
> >>
> >> diff --git a/meta/recipes-extended/wget/wget_1.19.4.bb
> b/meta/recipes-extended/wget/wget_1.19.5.bb
> >> similarity index 60%
> >> rename from meta/recipes-extended/wget/wget_1.19.4.bb
> >> rename to meta/recipes-extended/wget/wget_1.19.5.bb
> >> index fb7cce5a20..e37d8c7847 100644
> >> --- a/meta/recipes-extended/wget/wget_1.19.4.bb
> >> +++ b/meta/recipes-extended/wget/wget_1.19.5.bb
> >> @@ -3,7 +3,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
> >>             file://0002-improve-reproducibility.patch \
> >>            "
> >>
> >> -SRC_URI[md5sum] = "a2a2c1dc4ac5003fc25a8e60b4a9464e"
> >> -SRC_URI[sha256sum] =
> "93fb96b0f48a20ff5be0d9d9d3c4a986b469cb853131f9d5fe4cc9cecbc8b5b5"
> >> +SRC_URI[md5sum] = "2db6f03d655041f82eb64b8c8a1fa7da"
> >> +SRC_URI[sha256sum] =
> "b39212abe1a73f2b28f4c6cb223c738559caac91d6e416a6d91d4b9d55c9faee"
> >>
> >>  require wget.inc
> >> --
> >> 2.13.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000005b6e2b056cb855ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Cool, thanks!</div><div><br><div class=3D"gmail_quote"><div>On Mon, Ma=
y 21, 2018 at 7:36 AM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.=
com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">There&#39;s just one security fix which can be backported (in fact, =
that<br>
fix is already on the list for master so its easy to backport).<br>
<br>
Ross<br>
<br>
On 21 May 2018 at 14:48, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; this has security fixes i wonder if this should be backported to sumo<=
br>
&gt;<br>
&gt; On Mon, May 21, 2018 at 1:53 AM, Jibin Xu &lt;<a href=3D"mailto:jibin.=
xu@windriver.com" target=3D"_blank">jibin.xu@windriver.com</a>&gt; wrote:<b=
r>
&gt;&gt; Signed-off-by: Jibin Xu &lt;<a href=3D"mailto:jibin.xu@windriver.c=
om" target=3D"_blank">jibin.xu@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-extended/wget/{<a href=3D"http://wget_1.19.4.bb=
" rel=3D"noreferrer" target=3D"_blank">wget_1.19.4.bb</a> =3D&gt; <a href=
=3D"http://wget_1.19.5.bb" rel=3D"noreferrer" target=3D"_blank">wget_1.19.5=
.bb</a>} | 4 ++--<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta/recipes-extended/wget/{<a href=3D"http://wget_1.=
19.4.bb" rel=3D"noreferrer" target=3D"_blank">wget_1.19.4.bb</a> =3D&gt; <a=
 href=3D"http://wget_1.19.5.bb" rel=3D"noreferrer" target=3D"_blank">wget_1=
.19.5.bb</a>} (60%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-extended/wget/<a href=3D"http://wget_1.1=
9.4.bb" rel=3D"noreferrer" target=3D"_blank">wget_1.19.4.bb</a> b/meta/reci=
pes-extended/wget/<a href=3D"http://wget_1.19.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">wget_1.19.5.bb</a><br>
&gt;&gt; similarity index 60%<br>
&gt;&gt; rename from meta/recipes-extended/wget/<a href=3D"http://wget_1.19=
.4.bb" rel=3D"noreferrer" target=3D"_blank">wget_1.19.4.bb</a><br>
&gt;&gt; rename to meta/recipes-extended/wget/<a href=3D"http://wget_1.19.5=
.bb" rel=3D"noreferrer" target=3D"_blank">wget_1.19.5.bb</a><br>
&gt;&gt; index fb7cce5a20..e37d8c7847 100644<br>
&gt;&gt; --- a/meta/recipes-extended/wget/<a href=3D"http://wget_1.19.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">wget_1.19.4.bb</a><br>
&gt;&gt; +++ b/meta/recipes-extended/wget/<a href=3D"http://wget_1.19.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">wget_1.19.5.bb</a><br>
&gt;&gt; @@ -3,7 +3,7 @@ SRC_URI =3D &quot;${GNU_MIRROR}/wget/wget-${PV}.ta=
r.gz \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-improve=
-reproducibility.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[md5sum] =3D &quot;a2a2c1dc4ac5003fc25a8e60b4a9464e&quot;<=
br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;93fb96b0f48a20ff5be0d9d9d3c4a986b469=
cb853131f9d5fe4cc9cecbc8b5b5&quot;<br>
&gt;&gt; +SRC_URI[md5sum] =3D &quot;2db6f03d655041f82eb64b8c8a1fa7da&quot;<=
br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;b39212abe1a73f2b28f4c6cb223c738559ca=
ac91d6e416a6d91d4b9d55c9faee&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 require wget.inc<br>
&gt;&gt; --<br>
&gt;&gt; 2.13.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000005b6e2b056cb855ca--
