Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9B91F77E97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 22:23:50 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id g32so11876202ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 15:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fipaEzM7DZSNc5InzuIWkbZXI4M2TT3oKUyjuR90zys=;
	b=g3MWkbY+mtpDY7lyIfZeW8qfZGaYMKJG3eDwXq9NpOhS2jCb2zTWxfK8ephgiKEjwR
	2XUF+Njf0sZHmm64G3dxMvIBldXxtfDZiSJ+EBGJH5bW7gzu4jhh0TvaARd1WUMTs7Wx
	HN3mza8xEjgmnX842NWBV/8/F34cAjnxh/J8CW92VKTOEZCrpdiOzw4/PTxRXiZIpuzm
	LHMmF80Kq7WBm19LfcnFVUvVfVmpvcsGQ4WQoXMx3F8cG0+6ZoQeIjBsnS602XZngw00
	65n4A52kDVdFQ8dnDO5D42f4ETT4F/3wJcK3tJZSb8ym5WAPI7mI7kPF3PD0P5nBVlJn
	9swQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fipaEzM7DZSNc5InzuIWkbZXI4M2TT3oKUyjuR90zys=;
	b=lIE02xjtrDd8d+HYSJXyto0fSH3bYokd0Oj2JA2MiiK5IiMpahda9iQwT+ckrt7dXN
	j9WsOzlxgXLD4l8053ldd5AmkQvL5Wp48X96pCavyYafafJmrnABnfyj53/s1uCsA0no
	25IfEkdal/jU1Li2iM+XoAI6yYdHV01OaEbh9qNxdZ4gE7zAdEDMj4mu4Kwxty3p+o0Q
	OS88zWBgGjFgI8brj2V+M1RdPmqT46dNJCIBXOA6XtocNq4DorjtAKJCVz2FWXT7vKR4
	TBjAflkcpElVpK9AoV0IXGCztRHmYVSqL2nM4ELhO/TT/b29gCjHKhfWY4i5epzhZPjN
	157Q==
X-Gm-Message-State: AMCzsaWXPrcZ/R1HY06rDF991uxXIoET69226QbP0eUI79koEZBnwBic
	fxe+yZrezyf8W3/fk6s6xEYmZNG19bRt5lrsCT8CHg==
X-Google-Smtp-Source: AOwi7QAWsNl3L5aBEymh5k7tM/N77Meu8Z6jo+WR7mMh9dJVcDX+r8h62eOJxGtL/bGzED8ZG2i6M1alnV7zLUKZ3AI=
X-Received: by 10.107.164.28 with SMTP id n28mr33295794ioe.175.1507155832067; 
	Wed, 04 Oct 2017 15:23:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Wed, 4 Oct 2017 15:23:31 -0700 (PDT)
In-Reply-To: <CAKmqyKN2b3nHMOTD-QS1-MchR6prLJAtr8_tn7-umWKm=6HB_Q@mail.gmail.com>
References: <20170925225655.24585-1-alistair.francis@xilinx.com>
	<CAKmqyKN2b3nHMOTD-QS1-MchR6prLJAtr8_tn7-umWKm=6HB_Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Oct 2017 23:23:31 +0100
Message-ID: <CAJTo0LZLHN3CbuK3AZPT9sPotT3qcosa5vJVKzSYau3HcqZJnw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Remove recommend shared-mime-info for MinGW
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
X-List-Received-Date: Wed, 04 Oct 2017 22:23:51 -0000
Content-Type: multipart/alternative; boundary="001a114223acfdf7e1055ac00f89"

--001a114223acfdf7e1055ac00f89
Content-Type: text/plain; charset="UTF-8"

Already queued for master and probably rocko.

Ross

On 4 October 2017 at 22:50, Alistair Francis <alistair23@gmail.com> wrote:

> On Mon, Sep 25, 2017 at 3:56 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
> > Commit glib-2.0: recommend shared-mime-info
> > (51e4f9ca5368af5cefa26f4ca50b282e858982f8) broke compilation when cross
> > compiling for Windows. This patch removes the recommendation for
> > shared-mime-info when using MinGW cross compile.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Ping!
>
> Thanks,
> Alistair
>
> > ---
> >  meta/recipes-core/glib-2.0/glib.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc
> b/meta/recipes-core/glib-2.0/glib.inc
> > index ce15ccefc3..8434b7dae3 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -74,6 +74,8 @@ FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py
> \
> >  FILES_${PN}-utils = "${bindir}/*"
> >
> >  RRECOMMENDS_${PN} += "shared-mime-info"
> > +# When cross compiling for Windows we don't want to include this
> > +RRECOMMENDS_${PN}_remove_mingw32 = "shared-mime-info"
> >
> >  ARM_INSTRUCTION_SET_armv4 = "arm"
> >  ARM_INSTRUCTION_SET_armv5 = "arm"
> > --
> > 2.11.0
> >
>

--001a114223acfdf7e1055ac00f89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Already queued for master and probably rocko.<div><br></di=
v><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On 4 October 2017 at 22:50, Alistair Francis <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair23@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On Mon, Sep 25, 2017 at 3:56 PM, Alistair Francis<br>
&lt;<a href=3D"mailto:alistair.francis@xilinx.com">alistair.francis@xilinx.=
com</a>&gt; wrote:<br>
&gt; Commit glib-2.0: recommend shared-mime-info<br>
&gt; (<wbr>51e4f9ca5368af5cefa26f4ca50b28<wbr>2e858982f8) broke compilation=
 when cross<br>
&gt; compiling for Windows. This patch removes the recommendation for<br>
&gt; shared-mime-info when using MinGW cross compile.<br>
&gt;<br>
&gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis=
@xilinx.com">alistair.francis@xilinx.com</a>&gt;<br>
&gt; Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burt=
on@intel.com</a>&gt;<br>
&gt; Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundatio=
n.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
<br>
</span>Ping!<br>
<br>
Thanks,<br>
Alistair<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/glib-2.0/<wbr>glib.inc | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glib-2.0/<wbr>glib.inc b/meta/recipes-c=
ore/glib-2.0/<wbr>glib.inc<br>
&gt; index ce15ccefc3..8434b7dae3 100644<br>
&gt; --- a/meta/recipes-core/glib-2.0/<wbr>glib.inc<br>
&gt; +++ b/meta/recipes-core/glib-2.0/<wbr>glib.inc<br>
&gt; @@ -74,6 +74,8 @@ FILES_${PN}-codegen =3D &quot;${datadir}/glib-2.0/co=
degen/*<wbr>.py \<br>
&gt;=C2=A0 FILES_${PN}-utils =3D &quot;${bindir}/*&quot;<br>
&gt;<br>
&gt;=C2=A0 RRECOMMENDS_${PN} +=3D &quot;shared-mime-info&quot;<br>
&gt; +# When cross compiling for Windows we don&#39;t want to include this<=
br>
&gt; +RRECOMMENDS_${PN}_remove_<wbr>mingw32 =3D &quot;shared-mime-info&quot=
;<br>
&gt;<br>
&gt;=C2=A0 ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
&gt;=C2=A0 ARM_INSTRUCTION_SET_armv5 =3D &quot;arm&quot;<br>
&gt; --<br>
&gt; 2.11.0<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a114223acfdf7e1055ac00f89--
