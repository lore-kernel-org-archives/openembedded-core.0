Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 765387317D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 17:31:18 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n63so84279805qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 May 2016 10:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lG+65vqpHJvq/Z6XsvjqaI1IxpPkLeA3ZehgnmdzxMc=;
	b=EnbK225NKutJo9iJlbsJokFtfmk6wPfXrL8qqJidILzgbrKYFNQzCUu10MCHd9G5sL
	YzufXMcfOf0vg7+WxlOS+44WR4mx5Vd+NFzfS6PTLLj3IprhWvSXeW/YGwP8UJnmRW5g
	hYh2e2egsALbOB7x7yxGFohy5Wr3kIvFkb/ERVOLbLOb1VA91jhrW5hI2y2O6ymGrOEA
	yzMqnjFGj5MAm2XMCGF35sQjtWyMeqSODhZbYAfxTguVBLrpqleOKoQjQacZ6evFNWQZ
	Mmi9mTOBP0z6d0KE8phptnYzYZUHJQ/Qx4Sz21SI9J3MDIqkC7NqRyQGoKilvaHy1E1V
	yr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lG+65vqpHJvq/Z6XsvjqaI1IxpPkLeA3ZehgnmdzxMc=;
	b=Fz6xVMAbp6JqjIBFmMTT5kHqnEdAqSh7Phk+lXgPEnHI2A66vUEK95XaX+43rqDvwe
	OMiNng3Q2i6WTwAnKIAABBDbyFvwfgpD7UhP3TtVwpFoVi972UX2Q12cL+TKgcynpUvy
	YXv+Esia8HKBJ4TwGKuLyWGHk1+I+gAQepprb5WV4qbs4g3rEAosD1PdQ0i14g5BwYlI
	eqIEyQzeW9Z32e8TYuvpDZ71eTbZ7NXd3eOnSNeri1gqIMG9gWCjbOItAwWlGM3ogxs/
	CfM12Z5wWp7dqUL6m4dEywWE1W/s5zQWV7istkXD829KHj/MgrTIoxV59pFIhHI5hUNe
	M/ew==
X-Gm-Message-State: AOPr4FUZMcrw8aH3x9mFfKRLwonzIF8efNOl82OLX95gs0AC6686pn2wI0bjzJAwzeX9tDp6H6weC9+RTaNNeg==
X-Received: by 10.55.74.9 with SMTP id x9mr31837169qka.81.1462728679325; Sun,
	08 May 2016 10:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <1462712432-6214-1-git-send-email-marex@denx.de>
	<81F5E78B-F4F8-44E9-8E21-2F5225D18C00@gmail.com>
	<572F751E.2030604@denx.de>
In-Reply-To: <572F751E.2030604@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 08 May 2016 17:31:10 +0000
Message-ID: <CAMKF1sp1aRCsY_oB3xXTsYmmXdzqmDoMX60E59fWdAib0tsDrw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake: Oldest kernel for nios2 is 3.19
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
X-List-Received-Date: Sun, 08 May 2016 17:31:19 -0000
Content-Type: multipart/alternative; boundary=001a11488a785588020532580f70

--001a11488a785588020532580f70
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I was just trying to avoid patch conflict :)

On Sun, May 8, 2016 at 10:19 AM Marek Vasut <marex@denx.de> wrote:

> On 05/08/2016 07:06 PM, Khem Raj wrote:
> >
> >> On May 8, 2016, at 6:00 AM, Marek Vasut <marex@denx.de> wrote:
> >>
> >> The oldest kernel version for nios2 is 3.19.0, set it so, otherwise
> >> qemu-nios2 -r ${OLDEST_KERNEL} fails with "FATAL: kernel too old"
> >> message from glibc.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> ---
> >> meta/conf/bitbake.conf | 1 +
> >> 1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index 1c4175f..2f5db22 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -405,6 +405,7 @@ SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"
> >>
> >> OLDEST_KERNEL =3D "2.6.32"
> >> OLDEST_KERNEL_aarch64 =3D "3.14"
> >> +OLDEST_KERNEL_nios2 =3D =E2=80=9C3.19"
> >
> > if you don=E2=80=99t need it on krogoth, then I would suggest to hold t=
his patch
> for master since
> > I have a series which upgrades glibc to 2.24 and 2.24 needs 3.x minimum
> >
> > see
> >
> >
> https://github.com/kraj/openembedded-core/commit/1be5ebb2e1e2d39936d13ce1=
58db29954bc6dabe
>
> I don't mind either way. I need 3.19, not 3.2 though, so your patch does
> not help me if I understand it correctly.
>
> >> STAGING_KERNEL_DIR =3D "${TMPDIR}/work-shared/${MACHINE}/kernel-source=
"
> >> STAGING_KERNEL_BUILDDIR =3D
> "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
> >>
> >> --
> >> 2.7.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>
>
> --
> Best regards,
> Marek Vasut
>

--001a11488a785588020532580f70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was just trying to avoid patch conflict :)</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">On Sun, May 8, 2016 at 10:19 AM Mar=
ek Vasut &lt;<a href=3D"mailto:marex@denx.de">marex@denx.de</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On 05/08/2016 07:06 PM, Khem Raj wr=
ote:<br>
&gt;<br>
&gt;&gt; On May 8, 2016, at 6:00 AM, Marek Vasut &lt;<a href=3D"mailto:mare=
x@denx.de" target=3D"_blank">marex@denx.de</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; The oldest kernel version for nios2 is 3.19.0, set it so, otherwis=
e<br>
&gt;&gt; qemu-nios2 -r ${OLDEST_KERNEL} fails with &quot;FATAL: kernel too =
old&quot;<br>
&gt;&gt; message from glibc.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" ta=
rget=3D"_blank">marex@denx.de</a>&gt;<br>
&gt;&gt; Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; meta/conf/bitbake.conf | 1 +<br>
&gt;&gt; 1 file changed, 1 insertion(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt;&gt; index 1c4175f..2f5db22 100644<br>
&gt;&gt; --- a/meta/conf/bitbake.conf<br>
&gt;&gt; +++ b/meta/conf/bitbake.conf<br>
&gt;&gt; @@ -405,6 +405,7 @@ SDKPATHNATIVE =3D &quot;${SDKPATH}/sysroots/${=
SDK_SYS}&quot;<br>
&gt;&gt;<br>
&gt;&gt; OLDEST_KERNEL =3D &quot;2.6.32&quot;<br>
&gt;&gt; OLDEST_KERNEL_aarch64 =3D &quot;3.14&quot;<br>
&gt;&gt; +OLDEST_KERNEL_nios2 =3D =E2=80=9C3.19&quot;<br>
&gt;<br>
&gt; if you don=E2=80=99t need it on krogoth, then I would suggest to hold =
this patch for master since<br>
&gt; I have a series which upgrades glibc to 2.24 and 2.24 needs 3.x minimu=
m<br>
&gt;<br>
&gt; see<br>
&gt;<br>
&gt; <a href=3D"https://github.com/kraj/openembedded-core/commit/1be5ebb2e1=
e2d39936d13ce158db29954bc6dabe" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/kraj/openembedded-core/commit/1be5ebb2e1e2d39936d13ce158db2995=
4bc6dabe</a><br>
<br>
I don&#39;t mind either way. I need 3.19, not 3.2 though, so your patch doe=
s<br>
not help me if I understand it correctly.<br>
<br>
&gt;&gt; STAGING_KERNEL_DIR =3D &quot;${TMPDIR}/work-shared/${MACHINE}/kern=
el-source&quot;<br>
&gt;&gt; STAGING_KERNEL_BUILDDIR =3D &quot;${TMPDIR}/work-shared/${MACHINE}=
/kernel-build-artifacts&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.7.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
&gt;<br>
<br>
<br>
--<br>
Best regards,<br>
Marek Vasut<br>
</blockquote></div>

--001a11488a785588020532580f70--
