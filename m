Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id B177378BFC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 17:44:40 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c15-v6so20837320qtp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2018 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XdSMkO1fbXBS1T6HcRJtBxmhyangRRQwlZSNTsJC9/E=;
	b=LV+n8RdbZb+e7w9Dffk9gBYPHK4e/VFPgtp7U9cXsaK7E9tQrdrj9ca8GBBPYEA1lq
	f7usOa+ZfmMh1dRv0vCvCCNR4DnNkWuD2IolNbMBSsxxobLkosMnKXRj1uB0ZNHpSc53
	t/ygWizobGNj9YsPL8wRY0e3HYuOWVjnJ/5/jJfE991IR1Y3gRwBqpSSwAIeCqNUvRGs
	EX2N6d+xATJHnlSZWgqHcDw3gwjfuENRGiz+PAbhkidiiX9YM9r2uCw+SoYCLSRE1deG
	IXw9ln5dgO3f1wLyOPpRc3HbAdJfPeIuKHXC+cMej716MPVo6dbpMPtPLrCz5Wwgoxzr
	YNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XdSMkO1fbXBS1T6HcRJtBxmhyangRRQwlZSNTsJC9/E=;
	b=dZuE24RltcBT4CbOFMpQg6usc3mRGeENCym9hhvYVRz3yOstCfGYl0XqzqMjYpOIjc
	nXYmkNzfrLGosZGswZPIeX+Bpid8QjASZsAEyTtQptTZkaSrFQ00psebJoL01M/nSYL6
	qQh77wvm0Ntbe4Lo3g9njRGvOKsXavKcEad0V+W2IGIcnVZ3VQOBRSUDBeWVT9WKcROX
	W8FkptJ/dCpMsW80+b5sV4oQk9UHycK64P7tt11vZnBv6Tj2C4U7ZVHv4eBNrbEfE4u+
	3GGTM6qb70moncs7k8TWhxYjIeAMr6xKpQaC12cDEgvAtDzvevDOICOo+NfPmjIl2I7m
	fwYQ==
X-Gm-Message-State: AOUpUlHFTmNlpI8X4QbZ2MxVO8c7txIveZjZokYnYkmLaiFuorq7q42f
	4dR92dUiVdxdtXZlLInCxh44F7m4IjfcEeHjgNU=
X-Google-Smtp-Source: AAOMgpeow1gNGxmnHjkCxk+QWIqyLi14xoN0UPeWubPn+kU8nVuXA/ZCvy0gYphys0U3wwl9e4CRF3gGkTzZ9sXmflM=
X-Received: by 2002:ac8:70c5:: with SMTP id
	g5-v6mr26371082qtp.376.1533145481324; 
	Wed, 01 Aug 2018 10:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <1532534751-5871-1-git-send-email-alejandr@xilinx.com>
	<72c0ba68-7fa5-2e3a-a554-e79bff93a00b@gmail.com>
	<2d0aedb8-fdb0-ad21-bdcc-e82f352570c3@xilinx.com>
	<db5cccef2f1ef458bb19d54fc03c7ce50de6ebeb.camel@linuxfoundation.org>
In-Reply-To: <db5cccef2f1ef458bb19d54fc03c7ce50de6ebeb.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 10:44:30 -0700
Message-ID: <CAMKF1srz1dV8X-MP4si_DLd7esNpvynhSP_h-JOyK=mYABb35g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] multiconfig: Enable multiconfig dependencies on oe-core
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
X-List-Received-Date: Wed, 01 Aug 2018 17:44:41 -0000
Content-Type: multipart/alternative; boundary="000000000000cdad520572633fa4"

--000000000000cdad520572633fa4
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 31, 2018 at 4:59 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2018-07-30 at 15:05 -0700, Alejandro Enedino Hernandez
> Samaniego wrote:
> > On 07/26/2018 08:36 PM, Khem Raj wrote:
> > >
> > > On 7/25/18 9:05 AM, Alejandro Enedino Hernandez Samaniego wrote:
> > > > This patch enables multiconfig dependencies (mcdepends) to be
> > > > used on
> > > > recipes using the following format:
> > > >
> > > > task[mcdepends] = "multiconfig:FROM-MC:TO-MC:PN:task-to-depend-
> > > > on"
> > > >
> > > > For the sake of simplicity consider the following example:
> > > >
> > > > Assuming we have set up multiconfig builds, one for qemux86 and
> > > > one for
> > > > qemuarm, named x86 and arm respectively.
> > > >
> > > > Adding the following line to an image recipe (core-image-sato):
> > > > do_image[mcdepends] = "multiconfig:x86:arm:core-image-
> > > > minimal:do_rootfs"
> > > >
> > >
> > > Do we really need to add multiconfig to keyword namespace ? can we
> > > deduce this from "arch1:arch2:..."
> >
> > Bitbake already uses this and I believed adopting it would make it
> > easier for the user to understand its usage.
> >
> > For example, since the multiconfig names are also provided during
> > setup, if you assume that someone set up the build and a different
> > user is going through the recipe, arch1:arch2 wouldn't mean a lot for
> > that user because they may not map 1:1 to MACHINE names.
>
> It is consistent with the rest of the system. I'm still torn on whether
> we should shorten "multiconfig:" to "mc:" but we need to be consistent.
>

Given a choice I would suggest for using multiconfig for lesser chance of
conflicts

>
> > > secondy, this need to be well documented, with examples for users
> >
> > I agree we could add more documentation to it, where do you think it
> > should go?
>
> I'm going to queue the patches for testing in -next, they look good to
> me just reading the patches.
>
> Could you start to work with Scott (cc'd) to get this new dependency
> type listed in the bitbake manual and anywhere else it needs to be
> documented?
>
> Its great to see this finally working!
>
> Cheers,
>
> Richard
>
>

--000000000000cdad520572633fa4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue,=
 Jul 31, 2018 at 4:59 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Mon, 2018-07-30 at 15:05 -0700, Al=
ejandro Enedino Hernandez<br>
Samaniego wrote:<br>
&gt; On 07/26/2018 08:36 PM, Khem Raj wrote:<br>
&gt; &gt; <br>
&gt; &gt; On 7/25/18 9:05 AM, Alejandro Enedino Hernandez Samaniego wrote:<=
br>
&gt; &gt; &gt; This patch enables multiconfig dependencies (mcdepends) to b=
e<br>
&gt; &gt; &gt; used on<br>
&gt; &gt; &gt; recipes using the following format:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; task[mcdepends] =3D &quot;multiconfig:FROM-MC:TO-MC:PN:task-=
to-depend-<br>
&gt; &gt; &gt; on&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; For the sake of simplicity consider the following example:<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Assuming we have set up multiconfig builds, one for qemux86 =
and<br>
&gt; &gt; &gt; one for<br>
&gt; &gt; &gt; qemuarm, named x86 and arm respectively.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Adding the following line to an image recipe (core-image-sat=
o):<br>
&gt; &gt; &gt; do_image[mcdepends] =3D &quot;multiconfig:x86:arm:core-image=
-<br>
&gt; &gt; &gt; minimal:do_rootfs&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Do we really need to add multiconfig to keyword namespace ? can w=
e<br>
&gt; &gt; deduce this from &quot;arch1:arch2:...&quot;<br>
&gt; <br>
&gt; Bitbake already uses this and I believed adopting it would make it <br=
>
&gt; easier for the user to understand its usage.<br>
&gt;<br>
&gt; For example, since the multiconfig names are also provided during<br>
&gt; setup, if you assume that someone set up the build and a different<br>
&gt; user is going through the recipe, arch1:arch2 wouldn&#39;t mean a lot =
for<br>
&gt; that user because they may not map 1:1 to MACHINE names.<br>
<br>
It is consistent with the rest of the system. I&#39;m still torn on whether=
<br>
we should shorten &quot;multiconfig:&quot; to &quot;mc:&quot; but we need t=
o be consistent.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Given a choice I=
 would suggest for using multiconfig for lesser chance of conflicts=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
&gt; &gt; secondy, this need to be well documented, with examples for users=
<br>
&gt; <br>
&gt; I agree we could add more documentation to it, where do you think it <=
br>
&gt; should go?<br>
<br>
I&#39;m going to queue the patches for testing in -next, they look good to<=
br>
me just reading the patches.<br>
<br>
Could you start to work with Scott (cc&#39;d) to get this new dependency<br=
>
type listed in the bitbake manual and anywhere else it needs to be<br>
documented?<br>
<br>
Its great to see this finally working!<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000cdad520572633fa4--
