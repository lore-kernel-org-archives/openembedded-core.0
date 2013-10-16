Return-Path: <sujith.h@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9EB6C856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 10:23:12 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id ht10so237993vcb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 03:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=I9stO3ZUNIVIIkW+A2TVx1lpXo3XIcfejmsHi77+wJU=;
	b=UzbI89EsuX92/iNgQNubRLdUDpaGnLIVn8aWxCSXO90H6J0TdsMeD53ASsKDIE8gvI
	wv74p3jyEFEofVtURXSu18qpr2lgWyVuvjcjarlNUoOzf5HGxIIBaUlyhI4i439epRp+
	57krWI34+j6SSCXzzExXUtFFcr2Fo9Iws2FKdmtf2VKG0uBQd8LH9ZMhFozXjKYX98j9
	eTuGiSqwcmf9i92jHR2nltXVL5G+R219avgajZ4ZmOIlYBymnmqjV3IcEJxwqh9vve3D
	47IuOxhmCpEVv0sugu56LKVkA5TH1mRyf9aQOZnTzyI5L0knsZDmspuDovSgYGV7RoiL
	KMOQ==
X-Received: by 10.52.118.73 with SMTP id kk9mr1413416vdb.13.1381918993595;
	Wed, 16 Oct 2013 03:23:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.205.17 with HTTP; Wed, 16 Oct 2013 03:22:53 -0700 (PDT)
In-Reply-To: <1381902395-24934-1-git-send-email-sujith.h@gmail.com>
References: <1381902395-24934-1-git-send-email-sujith.h@gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Wed, 16 Oct 2013 15:52:53 +0530
Message-ID: <CADyYWL=8EiOTTmrR6v8QrQNRjb7=t1Gky7Ke5G_p3DdfrDYrRg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: Re: [PATCH] nspr: Add LDFLAGS to TARGET_CC_ARCH to fix warning
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
X-List-Received-Date: Wed, 16 Oct 2013 10:23:12 -0000
Content-Type: multipart/alternative; boundary=089e0122f0f2b8c4e204e8d916cd

--089e0122f0f2b8c4e204e8d916cd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I hope the patch and the waning messages it addresses are ok. Else let me
know, I will fix them.

Thanks,

Sujith H


On Wed, Oct 16, 2013 at 11:16 AM, Sujith H <sujith.h@gmail.com> wrote:

> WARNING: QA Issue: No GNU_HASH in the elf binary:
> 'armv7a-vfp-neon-mel-linux-gnueabi/nspr/4.10-r0/packages-split/nspr-dev/u=
sr/lib/nspr/tests/formattm'
> WARNING: QA Issue: No GNU_HASH in the elf binary:
> 'armv7a-vfp-neon-mel-linux-gnueabi/nspr/4.10-r0/packages-split/nspr-dev/u=
sr/lib/nspr/tests/threads'
> WARNING: QA Issue: No GNU_HASH in the elf binary:
> 'armv7a-vfp-neon-mel-linux-gnueabi/nspr/4.10-r0/packages-split/nspr-dev/u=
sr/lib/nspr/tests/semaerr'
> There are many QA Warnings thrown like the above for this recipe. This is
> observed for target imx6 sabrelite.
>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>  meta/recipes-support/nspr/nspr_4.10.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/nspr/nspr_4.10.bbb/meta/recipes-support=
/nspr/
> nspr_4.10.bb
> index fcecb95..4247fd0 100644
> --- a/meta/recipes-support/nspr/nspr_4.10.bb
> +++ b/meta/recipes-support/nspr/nspr_4.10.bb
> @@ -19,6 +19,7 @@ SRC_URI[sha256sum] =3D
> "0cfbe561676b92e5af3ddc7ac77452014e3da8885da66baec811e73541
>  S =3D "${WORKDIR}/nspr-${PV}/nspr"
>
>  RDEPENDS_${PN}-dev +=3D "perl"
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
>  TESTS =3D "runtests.pl \
>      runtests.sh \
> --
> 1.8.1.4
>
>


--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--089e0122f0f2b8c4e204e8d916cd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>I hope the patch and the w=
aning messages it addresses are ok. Else let me know, I will fix them.<br><=
br></div>Thanks,<br><br></div>Sujith H<br><div><div><div><div><div class=3D=
"gmail_extra">

<br><br><div class=3D"gmail_quote">On Wed, Oct 16, 2013 at 11:16 AM, Sujith=
 H <span dir=3D"ltr">&lt;<a href=3D"mailto:sujith.h@gmail.com" target=3D"_b=
lank">sujith.h@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">

WARNING: QA Issue: No GNU_HASH in the elf binary: &#39;armv7a-vfp-neon-mel-=
linux-gnueabi/nspr/4.10-r0/packages-split/nspr-dev/usr/lib/nspr/tests/forma=
ttm&#39;<br>
WARNING: QA Issue: No GNU_HASH in the elf binary: &#39;armv7a-vfp-neon-mel-=
linux-gnueabi/nspr/4.10-r0/packages-split/nspr-dev/usr/lib/nspr/tests/threa=
ds&#39;<br>
WARNING: QA Issue: No GNU_HASH in the elf binary: &#39;armv7a-vfp-neon-mel-=
linux-gnueabi/nspr/4.10-r0/packages-split/nspr-dev/usr/lib/nspr/tests/semae=
rr&#39;<br>
There are many QA Warnings thrown like the above for this recipe. This is o=
bserved for target imx6 sabrelite.<br>
<br>
Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com">=
Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/nspr/<a href=3D"http://nspr_4.10.bb" target=3D"_=
blank">nspr_4.10.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-support/nspr/<a href=3D"http://nspr_4.10.bb" targ=
et=3D"_blank">nspr_4.10.bb</a> b/meta/recipes-support/nspr/<a href=3D"http:=
//nspr_4.10.bb" target=3D"_blank">nspr_4.10.bb</a><br>
index fcecb95..4247fd0 100644<br>
--- a/meta/recipes-support/nspr/<a href=3D"http://nspr_4.10.bb" target=3D"_=
blank">nspr_4.10.bb</a><br>
+++ b/meta/recipes-support/nspr/<a href=3D"http://nspr_4.10.bb" target=3D"_=
blank">nspr_4.10.bb</a><br>
@@ -19,6 +19,7 @@ SRC_URI[sha256sum] =3D &quot;0cfbe561676b92e5af3ddc7ac774=
52014e3da8885da66baec811e73541<br>
=C2=A0S =3D &quot;${WORKDIR}/nspr-${PV}/nspr&quot;<br>
<br>
=C2=A0RDEPENDS_${PN}-dev +=3D &quot;perl&quot;<br>
+TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
<br>
=C2=A0TESTS =3D &quot;<a href=3D"http://runtests.pl" target=3D"_blank">runt=
ests.pl</a> \<br>
=C2=A0 =C2=A0 =C2=A0runtests.sh \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.1.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br>=E0=B4=B8=
=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=
=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<br>&lt;Project&g=
t;Contributor to KDE project<br><a href=3D"http://fci.wikia.com/wiki/Anti-D=
RM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Anti-DRM-Campaign<=
/a><br>

&lt;Blog&gt; <a href=3D"http://sujithh.info" target=3D"_blank">http://sujit=
hh.info</a><br>
</div></div></div></div></div></div>

--089e0122f0f2b8c4e204e8d916cd--
