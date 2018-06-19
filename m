Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9FB7602A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 19:47:06 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id d74-v6so540669vke.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 12:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GQxbq2AVqd1V3hv19QLS/8BdVvPugo/epTM6aueUiAU=;
	b=pMjTXInuNs43AldXOpfO5jj6HaGI/rDG9nz9zQBWQ4DiPnxp5YFl9Ip2lPFy2iAoXk
	C/bdHM+dfLO/ESRPmix8mgyGaX57UCFgj9ovPcR8MnlAbDSHirhBHz1seuIdGaizuRHC
	vS50dJ1i8gYwNt2zAti7nYyv/Tmuha8RUyzzE2gO2crHzrD3K33LsFgvnkL0tVWtrDBh
	2rv8iv6/WPDqzrFTF22w00AyY35XFE5JJG/FS+4R97D8dm9C+3zSqdiXi4CQ64eBlNtw
	imgsFd5pxGjKNjq1+i+nL2gvfQd2w9AK1o+5TxRL3YnoyprYN19OlIgLzaBuV2b0ebS+
	D1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GQxbq2AVqd1V3hv19QLS/8BdVvPugo/epTM6aueUiAU=;
	b=q6t4dFuKX8A0m7K3YmFm0oPif06teWzcAceSjAxIHLhz3aNIwCb85CbHtHtZIPGy+R
	MQThEa85XxCx8JdfC+sEde5bLtaGkLxU/TuwY5Qzc/TjON0pQcJB8rf2NxfH93bKR6rC
	JFek14KXmOmOv1o7RoHV4cZqHtMJ7Dzb9USYPkHs0XwW7ndqOTV9w4sCQjXRC01+FrtU
	oeSakJc8C3fmfc0QbAsNrv9EHR0OdWSbgph2eVOcM1MEZZO7GuHs4VpKMd8UGzwdKmul
	j10ZSxSEw4LwijWm63Tf5jNhjgm909t3AgMRIl16EBkrzWnkuvnprB4qejUrk9gh+LD9
	Kmlw==
X-Gm-Message-State: APt69E0G/r6HstYQ19viDm21e1Th0TJWBRHw+HlxXLn86xL16iARZX+J
	J49axk4hneJ6BoBSxCVswOIY2DSG+y/HsEulkwI=
X-Google-Smtp-Source: ADUXVKIzu0Edq7Pf1SDLE9XBu5lo++sVSOm7oNxZVeDY6I5BmC+Qjs1gxSs3fr6Wh/EtbViPBNksWtR8qoCcjt6Ilrg=
X-Received: by 2002:a1f:2c0d:: with SMTP id
	s13-v6mr10331939vks.106.1529437626904; 
	Tue, 19 Jun 2018 12:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180525155636.116866-1-alistair.francis@wdc.com>
	<CAKmqyKPDm7i+9xbuFy0BinoT5fGDj6+rUEK5XDyow0NcE-biqA@mail.gmail.com>
In-Reply-To: <CAKmqyKPDm7i+9xbuFy0BinoT5fGDj6+rUEK5XDyow0NcE-biqA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jun 2018 12:46:55 -0700
Message-ID: <CAMKF1sqR8n1QpZXfbFUnVQiVsAWUdUMvZ6jkty1tPfP_axUf6g@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Tue, 19 Jun 2018 19:47:06 -0000
Content-Type: multipart/alternative; boundary="0000000000007537fa056f03f24f"

--0000000000007537fa056f03f24f
Content-Type: text/plain; charset="UTF-8"

This is good to apply

On Tue, Jun 19, 2018 at 11:09 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Fri, May 25, 2018 at 8:56 AM, Alistair Francis
> <alistair.francis@wdc.com> wrote:
> > If the user has set numa in their MACHINE_FEATURES we should enable
> > NUMA support in the kernel config.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> Ping!
>
> Alistair
>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> > index 3bb872a32a..a8ac237656 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -28,6 +28,8 @@ KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
> >
> >  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
> >
> > +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES',
> 'numa', 'features/numa/numa.scc', '', d)}"
> > +
> >  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
> >  # by the kernel. This is typically the branch that should be built,
> >  # and it can be specific to the machine or shared
> > --
> > 2.17.0
> >
>

--0000000000007537fa056f03f24f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">This is good to apply=C2=A0</div></div><div><br><div=
 class=3D"gmail_quote"><div>On Tue, Jun 19, 2018 at 11:09 AM Alistair Franc=
is &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, May 25, 2018 at 8:5=
6 AM, Alistair Francis<br>
&lt;<a href=3D"mailto:alistair.francis@wdc.com" target=3D"_blank">alistair.=
francis@wdc.com</a>&gt; wrote:<br>
&gt; If the user has set numa in their MACHINE_FEATURES we should enable<br=
>
&gt; NUMA support in the kernel config.<br>
&gt;<br>
&gt; Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis=
@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
&gt; Acked-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
<br>
Ping!<br>
<br>
Alistair<br>
<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-=
kernel/linux/linux-yocto.inc<br>
&gt; index 3bb872a32a..a8ac237656 100644<br>
&gt; --- a/meta/recipes-kernel/linux/linux-yocto.inc<br>
&gt; +++ b/meta/recipes-kernel/linux/linux-yocto.inc<br>
&gt; @@ -28,6 +28,8 @@ KERNEL_LD_append_nios2 =3D &quot; ${TOOLCHAIN_OPTION=
S}&quot;<br>
&gt;<br>
&gt;=C2=A0 KERNEL_FEATURES_append_qemuall=3D&quot; features/debug/printk.sc=
c&quot;<br>
&gt;<br>
&gt; +KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&#39;MACHINE_F=
EATURES&#39;, &#39;numa&#39;, &#39;features/numa/numa.scc&#39;, &#39;&#39;,=
 d)}&quot;<br>
&gt; +<br>
&gt;=C2=A0 # A KMACHINE is the mapping of a yocto $MACHINE to what is built=
<br>
&gt;=C2=A0 # by the kernel. This is typically the branch that should be bui=
lt,<br>
&gt;=C2=A0 # and it can be specific to the machine or shared<br>
&gt; --<br>
&gt; 2.17.0<br>
&gt;<br>
</blockquote></div></div>

--0000000000007537fa056f03f24f--
