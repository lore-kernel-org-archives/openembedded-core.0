Received: from mail-qc0-f173.google.com ([209.85.216.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1UUHk7-0002t1-29
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 16:29:21 +0200
Received: by mail-qc0-f173.google.com with SMTP id b12so3209536qca.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=HN8ABHL2cDMkSN0jY3e/JtMKq4ss5rrwTV7Lbh7Cg7s=;
	b=TR9i7+Qi065ZHgpRJmOkwG031a8Y+uPsV0//cPUQuSflLkXjUaYNpVjrLepUuICItK
	HxwjQ/OZAr45BvqJNhqrQ0Ykbhgv9JEP89bFDRH6jUfVywRieQ6q0kevoTg+M7eis7Vx
	tbCDyL+a4/rP7JdYl9Y9EaVgLGAViOx65ttwK78YLRC99L+39bOfRmT5Pyn6RydaIbwQ
	rfZRnplG+A3ag4Z6MUGHQdzJA6IWrgqV+qNCJV1ZX3mP/QGqO47oftiHffpNmbDHFKgA
	qGbRqw8ulYlQMfOaykRMuXh/HhZCcs6jH1eHKXc8IXMPKGqgn0A1+A0lTZjb0HkHsAI2
	IpZg==
MIME-Version: 1.0
X-Received: by 10.229.208.6 with SMTP id ga6mr8996234qcb.151.1366639899256;
	Mon, 22 Apr 2013 07:11:39 -0700 (PDT)
Received: by 10.49.4.170 with HTTP; Mon, 22 Apr 2013 07:11:39 -0700 (PDT)
In-Reply-To: <CADkTA4PVBZEMERZaxqzPyb3WAS-XKxLE6_PCZZSto07-LO4R-g@mail.gmail.com>
References: <CADV-EXGNZgnsD6wXM2AFLANZ43G4hpP2BL0=Kys5JnbAh88Gzg@mail.gmail.com>
	<CADkTA4PVBZEMERZaxqzPyb3WAS-XKxLE6_PCZZSto07-LO4R-g@mail.gmail.com>
Date: Mon, 22 Apr 2013 17:11:39 +0300
Message-ID: <CADV-EXFMz=FZq5Y25gf-eKi8JZTwXk78LNhZP+DHVFAeQN5y5Q@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Embed initramfs into kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Apr 2013 14:29:29 -0000
Content-Type: multipart/alternative; boundary=089e01175e8fbb2fda04daf3a542

--089e01175e8fbb2fda04daf3a542
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Thanks!

I was trying to build the kernel and I got the following error:
Aborted dependency loops search after 10 matches.

I copied core-image-minimal-initramfs and changed IMAGE_INSTALL:
IMAGE_INSTALL =3D "initramfs-live-boot busybox udev base-passwd".
Also I added
INITRAMFS_IMAGE =3D "custom-initramfs"
to my kernel recipe.

As far as I understand initramfs image depends on the kernel that depends
on initramfs image.


Best regards,
Yevhen


2013/4/22 Bruce Ashfield <bruce.ashfield@gmail.com>

> On Mon, Apr 22, 2013 at 9:14 AM, Yevhen Kyriukha <kirgene@gmail.com>
> wrote:
> > Hi!
> >
> > I have a custom kernel recipe and initramfs image recipe.
> > How can I embed initramfs into kernel?
> > Is there any example available?
>
> The support is in oe-core, so checking the yocto docs is a good starting
> point:
>
> http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html
>
> And in particular:
>
> "core-image-minimal-initramfs: A core-image-minimal image that has the
> Minimal RAM-based Initial Root Filesystem (initramfs) as part of the
> kernel, which allows the system to find the first =93init=94 program more
> efficiently."
>
> There is also meta-initramfs:
>
> https://github.com/openembedded/meta-oe/tree/master/meta-initramfs
>
> Cheers,
>
> Bruce
>
> >
> > Best regards,
> > Yevhen
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--089e01175e8fbb2fda04daf3a542
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks!<div><br></div><div><div>I was trying to build the =
kernel and I got the following error:</div><div>Aborted dependency loops se=
arch after 10 matches.</div></div><div><br></div><div><div>I copied=A0<span=
 style=3D"font-family:arial,sans-serif;font-size:13px">core-image-minimal-i=
nitramfs and changed</span>=A0IMAGE_INSTALL:</div>
<div>IMAGE_INSTALL =3D &quot;initramfs-live-boot busybox udev base-passwd&q=
uot;.</div></div><div style>Also I added=A0</div><div style>INITRAMFS_IMAGE=
 =3D &quot;custom-initramfs&quot;=A0</div><div style>to my kernel recipe.</=
div>
<div style><br></div><div style>As far as I understand initramfs image<span=
 style=3D"font-size:13px;font-family:arial,sans-serif">=A0depends on the ke=
rnel that depends on=A0</span>initramfs image<span style=3D"font-size:13px;=
font-family:arial,sans-serif">.</span><br>
</div><div style><br></div></div><div class=3D"gmail_extra"><br clear=3D"al=
l"><div>Best regards,<br>Yevhen</div>
<br><br><div class=3D"gmail_quote">2013/4/22 Bruce Ashfield <span dir=3D"lt=
r">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.=
ashfield@gmail.com</a>&gt;</span><br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Mon, Apr 22, 2013 at 9:14 AM, Yevhen Kyriukha &lt;<a h=
ref=3D"mailto:kirgene@gmail.com">kirgene@gmail.com</a>&gt; wrote:<br>
&gt; Hi!<br>
&gt;<br>
&gt; I have a custom kernel recipe and initramfs image recipe.<br>
&gt; How can I embed initramfs into kernel?<br>
&gt; Is there any example available?<br>
<br>
</div>The support is in oe-core, so checking the yocto docs is a good start=
ing point:<br>
<br>
<a href=3D"http://www.yoctoproject.org/docs/current/mega-manual/mega-manual=
.html" target=3D"_blank">http://www.yoctoproject.org/docs/current/mega-manu=
al/mega-manual.html</a><br>
<br>
And in particular:<br>
<br>
&quot;core-image-minimal-initramfs: A core-image-minimal image that has the=
<br>
Minimal RAM-based Initial Root Filesystem (initramfs) as part of the<br>
kernel, which allows the system to find the first =93init=94 program more<b=
r>
efficiently.&quot;<br>
<br>
There is also meta-initramfs:<br>
<br>
<a href=3D"https://github.com/openembedded/meta-oe/tree/master/meta-initram=
fs" target=3D"_blank">https://github.com/openembedded/meta-oe/tree/master/m=
eta-initramfs</a><br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Yevhen<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
&gt;<br>
<br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</blockquote></div><br></div>

--089e01175e8fbb2fda04daf3a542--
