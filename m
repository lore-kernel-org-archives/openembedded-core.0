Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 867B56C567
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 17:40:02 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 79so10023948wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 09:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ih9KCF98CO9pmmNeQruM9aQhsISCNq0CN7onJXDL03k=;
	b=r2yOFPPlvmiIvAQBvNPnmZ7+1QC+okXooLK217MKooB9JHKH0Emjy9GCbaW2oh9Fkk
	00Po4ebhLbIxu4TIHhXsONiStnxEFURu91hBJSD+FcXRpITUfBr+Mdg9RzEtLm+E3zb3
	36o6ejaFtz70dwv9B1UimmXJ1p0GRGcT6tAnvSLkAjMBkgZrw/VaiNHIdHmBoZMN93Rl
	9taYQzWeeqhICcDkNF27Hc1XNEMw6RXDpdhLedGAStRlQJCJJuXYXksOuDb6MbFqI+1B
	cjlzuVjTnbU3uJCriXcpRXBv0Y8pAkvhTGLCfy4ZAz/OUHwMbhYFyERcpJxd6l99R9m6
	IqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ih9KCF98CO9pmmNeQruM9aQhsISCNq0CN7onJXDL03k=;
	b=pIzZO8ZwMk6La1mYiOtNkCSC2jtydr47Gh9WT744GSn4t/ndCpHeXPahgwQzMBKkLD
	4Do/q7NxSVsTKZeSNkdTzxduC8RUviH5TOQQxAKHAPxx3qjCpPGkiSzZDtNq3A5urvHq
	18xufegZ4TJMdeP6vOa4tcdC2F1ptewd18NmOn6Ybm3zltvFeu2FbIhCW0+kjA3MNvWu
	2cnOHx0eaCy5UEBSF7khOOHmOZ7kkZ+Q9g0xZKo7z3PjQbEAidauyQWsAzn/dqrmOAze
	5pO7z68kl7uoUrsu62/s3Fc4wrxzUPaS78jAjb1NzHLjaIG9ijZ4/BbFirmp8cTf6mCo
	RF7g==
X-Gm-Message-State: AA+aEWZ72zX9rw3yhFTN+xCHRym6YKWVaTBZn5qmOVAfBEU0YOQW+qk6
	Aphm83MiQ9wZ9IzLdEF8lHS9VxYg/clltn9vwbiJTEAT
X-Google-Smtp-Source: AFSGD/XenX0oBGx/V2OlX6HpJehzMbGDh19MjuitdSoxV81PdT8OGQPyBuX8fdrkH3QUam7GvX6ZB+Oe1+0mkq6pEUM=
X-Received: by 2002:a1c:af4a:: with SMTP id
	y71-v6mr9992904wme.94.1542908403146; 
	Thu, 22 Nov 2018 09:40:03 -0800 (PST)
MIME-Version: 1.0
References: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
	<CAJTo0LaNR-YLyCX=wHTS42XimeJrfhCWwCmm-hKCwNRkJ1KFmQ@mail.gmail.com>
	<CAP9ODKow3s0rXMmkVYM5b5jsgG-70GnXZkHMK1WxaFSUTA-c2A@mail.gmail.com>
	<CAJTo0LYfAYZruf=9WYFqD2ae2==LdTGwayFeXPxtQ7ROPm-T2w@mail.gmail.com>
	<CAP9ODKqxjDsS34yZ1G0h1wRvZ2QGfOD2rr=+2DG1KGuwcePmTQ@mail.gmail.com>
	<CAJTo0LZX253PH2xBQOANZ5rJ35wvDGKO7We2s-XBJjZy594GPA@mail.gmail.com>
	<1510838076.3952.166.camel@linuxfoundation.org>
	<CAP9ODKr1vkw06=21Y=_+kU5jVk5HUa9h7PYp9ysxKht8WkKeCA@mail.gmail.com>
In-Reply-To: <CAP9ODKr1vkw06=21Y=_+kU5jVk5HUa9h7PYp9ysxKht8WkKeCA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Nov 2018 18:39:53 +0100
Message-ID: <CA+chaQeD-7iKVrt9Ko=2Qx5ee0PEu_8CJCPtsvK3OhoK2mv6yg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Drop rng-tools
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
X-List-Received-Date: Thu, 22 Nov 2018 17:40:02 -0000
Content-Type: multipart/alternative; boundary="0000000000004a6736057b445b35"

--0000000000004a6736057b445b35
Content-Type: text/plain; charset="UTF-8"

Hi all,

I was just hit by this issue as well, we're using VirtualBox instead of
QEmu, so of course we were missing "-device virtio-rng-pci" and I haven't
found some equivalent of this for VirtualBox.

Adding rng-tools back to our images allows to use ssh again (without
rng-tools sshd never started because ssh-keygen got stuck trying to read
/dev/random).

I don't know how many people are using VirtualBox or docker to run qemu
images built with OE, but it's probably worth mentioning in 2.6 release
notes.

Cheers,

On Thu, Nov 16, 2017 at 2:26 PM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Hello Richard,
> Hello Ross,
>
> On Thu, Nov 16, 2017 at 11:14 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2017-11-16 at 13:11 +0000, Burton, Ross wrote:
> >> On 15 November 2017 at 19:59, Otavio Salvador <otavio.salvador@ossyst
> >> ems.com.br> wrote:
> >> > > Are you enabling the virtio-rng driver so qemu can bridge the
> >> > host entropy
> >> > > into the guest?
> >> >
> >> > I am not. Do you have an example of command line for it?
> >>  https://wiki.qemu.org/Features/VirtIORNG talks about qemu's support
> >> and what to turn on there (the default qemu machines enable that).
> >>
> >> http://elixir.free-electrons.com/linux/latest/source/drivers/char/hw_
> >> random/Kconfig documents HW_RANDOM_VIRTIO and says at the top that
> >> the devices feed into the kernel pool.
> >
> > Just to add, for qemuarm:
> >
> > machine/qemuarm.conf:QB_OPT_APPEND = "-show-cursor -usb -device
> usb-tablet -device virtio-rng-pci"
> >
> > the key piece being virtio-rng-pci on the commandline.
>
> I did try it here. Thanks for the pointers.
>
> We use a Docker container to run QEMU and in this environment, it does
> not work well. At least I did not get it working.
>
> I don't know if it is a problem or not for OE-Core. Possibly people
> will run things inside a container and keep rng-tools makes it working
> in those environments.
>
> I will keep investigating here if I can make it work in a container ...
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000004a6736057b445b35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all,<div><br></div><div>I was just hit=
 by this issue as well, we&#39;re using VirtualBox instead of QEmu, so of c=
ourse we were missing &quot;-device virtio-rng-pci&quot; and I haven&#39;t =
found some equivalent of this for VirtualBox.</div><div><br></div><div>Addi=
ng rng-tools back to our images allows to use ssh again (without rng-tools =
sshd never started because ssh-keygen got stuck trying to read /dev/random)=
.</div><div><br></div><div>I don&#39;t know how many people are using Virtu=
alBox or docker to run qemu images built with OE, but it&#39;s probably wor=
th mentioning in 2.6 release notes.</div><div><br></div><div>Cheers,</div><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Nov 16, =
2017 at 2:26 PM Otavio Salvador &lt;<a href=3D"mailto:otavio.salvador@ossys=
tems.com.br">otavio.salvador@ossystems.com.br</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hello Richard,<br>
Hello Ross,<br>
<br>
On Thu, Nov 16, 2017 at 11:14 AM, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; On Thu, 2017-11-16 at 13:11 +0000, Burton, Ross wrote:<br>
&gt;&gt; On 15 November 2017 at 19:59, Otavio Salvador &lt;otavio.salvador@=
ossyst<br>
&gt;&gt; <a href=3D"http://ems.com.br" rel=3D"noreferrer" target=3D"_blank"=
>ems.com.br</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt; Are you enabling the virtio-rng driver so qemu can bridg=
e the<br>
&gt;&gt; &gt; host entropy<br>
&gt;&gt; &gt; &gt; into the guest?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I am not. Do you have an example of command line for it?<br>
&gt;&gt;=C2=A0 <a href=3D"https://wiki.qemu.org/Features/VirtIORNG" rel=3D"=
noreferrer" target=3D"_blank">https://wiki.qemu.org/Features/VirtIORNG</a> =
talks about qemu&#39;s support<br>
&gt;&gt; and what to turn on there (the default qemu machines enable that).=
<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"http://elixir.free-electrons.com/linux/latest/source/dr=
ivers/char/hw_" rel=3D"noreferrer" target=3D"_blank">http://elixir.free-ele=
ctrons.com/linux/latest/source/drivers/char/hw_</a><br>
&gt;&gt; random/Kconfig documents HW_RANDOM_VIRTIO and says at the top that=
<br>
&gt;&gt; the devices feed into the kernel pool.<br>
&gt;<br>
&gt; Just to add, for qemuarm:<br>
&gt;<br>
&gt; machine/qemuarm.conf:QB_OPT_APPEND =3D &quot;-show-cursor -usb -device=
 usb-tablet -device virtio-rng-pci&quot;<br>
&gt;<br>
&gt; the key piece being virtio-rng-pci on the commandline.<br>
<br>
I did try it here. Thanks for the pointers.<br>
<br>
We use a Docker container to run QEMU and in this environment, it does<br>
not work well. At least I did not get it working.<br>
<br>
I don&#39;t know if it is a problem or not for OE-Core. Possibly people<br>
will run things inside a container and keep rng-tools makes it working<br>
in those environments.<br>
<br>
I will keep investigating here if I can make it work in a container ...<br>
<br>
-- <br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile:=
 +1 (347) 903-9750<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000004a6736057b445b35--
