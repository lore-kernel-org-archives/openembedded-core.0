Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 67F296E766
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 13:36:58 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id as1so4317965iec.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Mar 2014 05:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=gqyGBunbDJnrFTvOmPQVuBxqKMEEd2xxg+YnuCpaxF0=;
	b=MWGxEiRzW99mj60GMD62M/GaH+nalAHLw/BYSF5/Mv/iuTzwaJ6kxKo+StqzzJUY7C
	s/Mmr1tLX40DP7yS3aKqD3t9F2d4crfYE4zWoPDw4Vo02T/Mh6HoLJmV/1ykN8UfvxBN
	X94jO/AvTWca6sxGySQnrAdZU4SJV8F3VTOLHoVkeSl+ZaUoiRjNnjlgmutCZDUcWHOm
	iYyyt3Q81gtAwpKezCGZo11bs3e58c0jZS7T/7NxW4nxtk/6SiTR5/F1flQocCwR0zGF
	l4ge1WoHdaSmJHK7i7ywfOL7qRlR3LZn7eZHNIjqp+CyADEysB8TEWupZX9S/5w4AG+f
	Rn7Q==
MIME-Version: 1.0
X-Received: by 10.50.61.147 with SMTP id p19mr2738523igr.49.1394199419806;
	Fri, 07 Mar 2014 05:36:59 -0800 (PST)
Sender: sebmennetrier@gmail.com
Received: by 10.42.198.139 with HTTP; Fri, 7 Mar 2014 05:36:59 -0800 (PST)
In-Reply-To: <1394199246.12327.37.camel@ted>
References: <1393509239-26637-1-git-send-email-s.mennetrier@innotis.org>
	<CABgO3_O069SpHEeF0ALPuimB6Yag8W72tjAuLLsqaQT-7XgNWA@mail.gmail.com>
	<1394195975.12327.33.camel@ted>
	<CABgO3_M1-S7vQC=ypS58T9w6pJTjomAT1uM+Fik4ETA3GSOHzQ@mail.gmail.com>
	<1394199246.12327.37.camel@ted>
Date: Fri, 7 Mar 2014 14:36:59 +0100
X-Google-Sender-Auth: 2thzzqWZcE4NqZsxH5wM-8EhYSk
Message-ID: <CABgO3_Pe8-0rZ3hFELYfNWnNnWXtYz99w0BbgTi4+C6Zk1JtQg@mail.gmail.com>
From: =?ISO-8859-1?Q?S=E9bastien_Mennetrier?= <s.mennetrier@innotis.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Create gstreamer-1.0 package groups
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
X-List-Received-Date: Fri, 07 Mar 2014 13:36:59 -0000
Content-Type: multipart/alternative; boundary=047d7bdca43829ea0804f40459ae

--047d7bdca43829ea0804f40459ae
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ok, I will test my patch with this change on master branch.

Thanks for your help and your tips.


Regards,
S=E9bastien


2014-03-07 14:34 GMT+01:00 Richard Purdie <
richard.purdie@linuxfoundation.org>:

> On Fri, 2014-03-07 at 14:24 +0100, S=E9bastien Mennetrier wrote:
> > Hi,
> >
> >
> > This patch was written in dora branch. I will try to adapt it for
> > master branch and I will send a new patch ASAP.
> >
> > Sorry for my mistake.
> >
> I think it needs:
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bbb=
/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-meta-base.bb
> index 3b797f0..a73b04c 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
> @@ -1,7 +1,7 @@
> DESCRIPTION =3D "Gstreamer1.0 package groups"
> LICENSE =3D "MIT"
> DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base
> gstreamer1.0-plugins-good gstreamer1.0-plugins-bad"
> -LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937c2bc47fbc49d690 \
> file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de2042=
0"
> PACKAGES =3D "\
>
> in future can you please say which branch it was tested on if its not
> master.
>
> Cheers,
>
> Richard
>
>
>
>

--047d7bdca43829ea0804f40459ae
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ok, I will test my patch with this change on master b=
ranch.<br><br></div>Thanks for your help and your tips.</div><div class=3D"=
gmail_extra"><br clear=3D"all"><div><div dir=3D"ltr"><div><br>Regards,<br><=
/div>
S=E9bastien<br></div></div>
<br><br><div class=3D"gmail_quote">2014-03-07 14:34 GMT+01:00 Richard Purdi=
e <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span>:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div class=3D"">On Fri, 2014-03-07 at 14:24 +0100, S=E9bastien Mennetrier w=
rote:<br>
&gt; Hi,<br>
&gt;<br>
&gt;<br>
&gt; This patch was written in dora branch. I will try to adapt it for<br>
&gt; master branch and I will send a new patch ASAP.<br>
&gt;<br>
&gt; Sorry for my mistake.<br>
&gt;<br>
</div>I think it needs:<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0-meta-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a> b/meta/rec=
ipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-meta-base.bb" targ=
et=3D"_blank">gstreamer1.0-meta-base.bb</a><br>

index 3b797f0..a73b04c 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-meta=
-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0-meta=
-base.bb" target=3D"_blank">gstreamer1.0-meta-base.bb</a><br>
@@ -1,7 +1,7 @@<br>
DESCRIPTION =3D &quot;Gstreamer1.0 package groups&quot;<br>
LICENSE =3D &quot;MIT&quot;<br>
<div class=3D"">DEPENDS =3D &quot;gstreamer1.0 gstreamer1.0-plugins-base gs=
treamer1.0-plugins-good gstreamer1.0-plugins-bad&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;md5=3D3f40d799439710=
9285ec7b81fdeb3b58 \<br>
</div>+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;md5=3D4d92cd37=
3abda3937c2bc47fbc49d690 \<br>
<div class=3D"">file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0=
384361b4de20420&quot;<br>
</div>PACKAGES =3D &quot;\<br>
<br>
in future can you please say which branch it was tested on if its not maste=
r.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br></div>

--047d7bdca43829ea0804f40459ae--
