Return-Path: <vomegaz@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id DE77360248
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 04:18:45 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id y15so3668831ita.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 21:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nYe6xba4ZqzIzw382OAljclrAfLFUz2cY3V39rLGXSA=;
	b=efrli584v6D0sqYW4W60lq4/m9qkExq7h9ev+wzC8ezE/RtYWskZlWZ/qa0/kc5zS4
	CxfqZJO20SHDIo1Tg+gBN3TSy8cEb/v5WtidYi9kLb1ErJNOIcO2CJYPtguS5lTvt2cw
	zedHOoQLhSPv+rCo+VBGLNmXxyhm2iV5bh90kjPU4B46p4pHoS5zqCYRmTRpNLs9SO/m
	A0SI0uafcVc6rMniYLTeDx7EF8G4Z2r/x/w0d9tsZz3S87ItjFCyB9ba9s+0tku3beUe
	Ilybm8cN90fajrJEqGxM7vt82A3doA8Dwnlu9xyBJqB4BnlM3G1TF5EJLRCh4trVvufX
	Dn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=nYe6xba4ZqzIzw382OAljclrAfLFUz2cY3V39rLGXSA=;
	b=ruMtt75EowcRg0bwBB/0q0+9dgxBP6vJTaxtcXp3lUXrDrib8vklUX+inOeWFcFUVA
	U6EbqVDOpD7LvFBRbKFdxn1IkND0Q2eEKggVwH/2mNwsEs2dzlOcJ9Tooni2zAKvamjq
	n8OUTJSr47LaFFHwjvOs/PRPLiRTYA8sqOqj0kvbDVzNNDQjA2gY2WKo3RQR33pnqEJ7
	ekNC6eQyFAjzA2M2D0JXi8xbERouV12GeotgT6lxRy7oHhv3sJEXamEE9OJD3/ElVRIf
	mwjZG3FJpUQih18V4tJBF0qSJ8r6LNIlwR9QSLneowYRaL71ajSa2sovRPK7AgS8+W6Z
	twNw==
X-Gm-Message-State: AMCzsaXOPY+13MDu4OieZ/M9DrSwGRz0Q2aOwdCIGrHSEyb1dO7mKIBk
	8uV/joiQvd4nWt4iuSg6Q1IyvWYljBatMoWeV8G62CYG
X-Google-Smtp-Source: ABhQp+RaVn7CMa1MfYPrKJkgjsXUEOj7I6VMjAdAGxVuCc3jNrmkGI6G/PskQU+N/Sf15RNcGgNjtYELo2DS1nxy6JI=
X-Received: by 10.36.3.141 with SMTP id e135mr736310ite.1.1508991526771; Wed,
	25 Oct 2017 21:18:46 -0700 (PDT)
MIME-Version: 1.0
Reply-To: thomas.perrot@tupi.fr
Sender: vomegaz@gmail.com
Received: by 10.107.167.211 with HTTP; Wed, 25 Oct 2017 21:18:06 -0700 (PDT)
In-Reply-To: <1508929587.13607.68.camel@andred.net>
References: <20171025073248.24161-1-thomas.perrot@tupi.fr>
	<1508926407.13607.53.camel@andred.net>
	<1508929587.13607.68.camel@andred.net>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Thu, 26 Oct 2017 06:18:06 +0200
X-Google-Sender-Auth: -pzAKU3j-VdmNDOSEQ8lOePGttU
Message-ID: <CAGXeWgkSjjXXUSGdZAq1UZH5in15CvPe4dhNPQBgUy+PCcp=Gw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta][PATCH 1/2] Fix some issues in the fitImage generation
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
X-List-Received-Date: Thu, 26 Oct 2017 04:18:46 -0000
Content-Type: multipart/alternative; boundary="001a1144d692ec2568055c6b7713"

--001a1144d692ec2568055c6b7713
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I agree, so I cleaned up, split into several commits, then superseded this
one.

Best regards,
Thomas P.

On Wed, Oct 25, 2017 at 1:06 PM, Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Wed, 2017-10-25 at 11:13 +0100, Andr=C3=A9 Draszik wrote:
> > On Wed, 2017-10-25 at 09:32 +0200, Thomas Perrot wrote:
> > > - Bad image type replacement for aarch64
> > > - Fix DTB path in fitimage.its
> >
> > It doesn't look like the DTB bit is still relevant in this commit.
> >
> > > - Ignore fitImage type in do_bundle_initramfs task because the
> packaging
> > > is made by do_assemble_fitimage_initramfs
> > > - the images for arm64 are not compressed the linux_comp variable mus=
t
> > > therefore be none
> >
> > I think it would also make sense to split this into multiple commits, a=
s
> > your aarch64 fixes and fitimage fixes aren't directly related.
>
> To be more clear, your fix to kernel.bbclass is independent of everything
> else and doesn't apply to aarch64 only, so it should be a separate commit=
.
>
>
> Cheers,
> Andre'
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144d692ec2568055c6b7713
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br><span id=3D"gmail-result_box" class=
=3D"gmail-" tabindex=3D"-1" lang=3D"en"><span class=3D"gmail-">I agree, so =
I cleaned up, split into several commits, then superseded this one.<br><br>=
</span></span></div><span id=3D"gmail-result_box" class=3D"gmail-" tabindex=
=3D"-1" lang=3D"en"><span class=3D"gmail-">Best regards,<br></span></span><=
/div><span id=3D"gmail-result_box" class=3D"gmail-" tabindex=3D"-1" lang=3D=
"en"><span class=3D"gmail-">Thomas P.<br><br></span></span>On Wed, Oct 25, =
2017 at 1:06 PM, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=3D"mailto=
:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</span> wrote:<br>=
<div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><span class=3D"">On Wed, 2017-10-25 at 11:13 +0100, Andr=C3=A9 Dr=
aszik wrote:<br>
&gt; On Wed, 2017-10-25 at 09:32 +0200, Thomas Perrot wrote:<br>
&gt; &gt; - Bad image type replacement for aarch64<br>
&gt; &gt; - Fix DTB path in fitimage.its<br>
&gt;<br>
&gt; It doesn&#39;t look like the DTB bit is still relevant in this commit.=
<br>
&gt;<br>
&gt; &gt; - Ignore fitImage type in do_bundle_initramfs task because the pa=
ckaging<br>
&gt; &gt; is made by do_assemble_fitimage_initramfs<br>
&gt; &gt; - the images for arm64 are not compressed the linux_comp variable=
 must<br>
&gt; &gt; therefore be none<br>
&gt;<br>
&gt; I think it would also make sense to split this into multiple commits, =
as<br>
&gt; your aarch64 fixes and fitimage fixes aren&#39;t directly related.<br>
<br>
</span>To be more clear, your fix to kernel.bbclass is independent of every=
thing<br>
else and doesn&#39;t apply to aarch64 only, so it should be a separate comm=
it.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
Cheers,<br>
Andre&#39;<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--001a1144d692ec2568055c6b7713--
