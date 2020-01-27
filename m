Return-Path: <aehs29@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 08AC77FE6C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:28:01 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id o11so12511332ljc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:28:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a+79jX2I2+vlG/zKkvbXkTViDyMtAhHzgijl3XkXkKg=;
	b=aNEf5iRGg0QKN79VyFCHyBWNh2UdWW2YSuw4Aen/xiyYkOaVVmV8iVPGX3Fu+odXFM
	KfzvaLgLksWfL1jsnwtiUSQ7jpU2uFgmJhbQ3Rn7ePOkddl1Ee0RosmS2QXC7Slu71C3
	+RIlNkxQvJCu4/uxb8S/0HN0aP5G2/p8GTUBD9avbv4zelh1vDEq14C2ebAFZumxl4Cn
	g9nHRDxrtUvEg8WHe+T1KR1tJhzV5TZdSZ774+/0M3vCX2vodmU47ftT6RfQeg/9F9vD
	7h5HR0NcW4Vpu8UMaEZT4tixPOuNXg2fkZ0msdZs5CJo4JSzt4Cf5eQZbGWGgubSTC2J
	/7xw==
X-Gm-Message-State: APjAAAXz54dhP7ixTd/R7Uvbc0OLQV3c0smu6kX98Q5mCYeaowYD6Pfd
	BKTArMyavKum2nnFONr6iLPtNseb
X-Google-Smtp-Source: APXvYqz3yv9pTihnBD9D/SQzr3C6rMcbF6A6o1/tRwstCEyjG7ct3SZw9HnADRmK4sDdL/oL/vGFFw==
X-Received: by 2002:a2e:7e11:: with SMTP id z17mr7519579ljc.279.1580160482290; 
	Mon, 27 Jan 2020 13:28:02 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
	[209.85.167.53])
	by smtp.gmail.com with ESMTPSA id a9sm8772646lfk.23.2020.01.27.13.28.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 13:28:02 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id y19so7398167lfl.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:28:02 -0800 (PST)
X-Received: by 2002:ac2:5216:: with SMTP id a22mr376870lfl.18.1580160481963;
	Mon, 27 Jan 2020 13:28:01 -0800 (PST)
MIME-Version: 1.0
References: <1580119213-10641-1-git-send-email-alejandro@enedino.org>
	<CAM9ZRVvWRcvV3MMZCwr3-Au2KKU2xJcMi=jkLDZtHKTB7822Nw@mail.gmail.com>
	<CAHMutrbgM7To4zg=3R_BaU4PjyuW7hWcgNW0O2ZjM6TOuBNE7Q@mail.gmail.com>
	<CAM9ZRVvA-Sz3E0yuG3VnXGNCS9KGgKNWVx6NF-2oA1hbE8S97g@mail.gmail.com>
In-Reply-To: <CAM9ZRVvA-Sz3E0yuG3VnXGNCS9KGgKNWVx6NF-2oA1hbE8S97g@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Mon, 27 Jan 2020 13:27:50 -0800
X-Gmail-Original-Message-ID: <CAHMutra0X=HKYt+bCKzk_m58xP41sFsU+bPpCGat6=S-Pgc45g@mail.gmail.com>
Message-ID: <CAHMutra0X=HKYt+bCKzk_m58xP41sFsU+bPpCGat6=S-Pgc45g@mail.gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] baremetal-helloworld: Create recipe for baremetal examples on QEMU
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
X-List-Received-Date: Mon, 27 Jan 2020 21:28:02 -0000
Content-Type: multipart/alternative; boundary="000000000000373446059d25c84c"

--000000000000373446059d25c84c
Content-Type: text/plain; charset="UTF-8"

Hey guys,

On Mon, Jan 27, 2020, 1:11 PM Paul Barker <pbarker@konsulko.com> wrote:

> On Mon, 27 Jan 2020 at 15:42, Alejandro Enedino Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > Hey Paul,
> >
> >
> >
> > On Mon, Jan 27, 2020, 2:09 AM Paul Barker <pbarker@konsulko.com> wrote:
> >>
> >> On Mon, 27 Jan 2020 at 10:00, Alejandro Enedino Hernandez Samaniego
> >> <alejandro@enedino.org> wrote:
> >> >
> >> > Create HelloWorld examples that run on several of the QEMU
> architectures
> >> > supported by the build system.
> >> >
> >> > This recipe can be used by anyone to understand how baremetal
> applications
> >> > can be built using OpenEmbedded and how the wiring to set them up
> could be.
> >> >
> >> > This should also facilitate creating/extending the OE testing
> infrastructure
> >> > to allow baremetal applications or RTOSs to be tested in the same way
> that
> >> > Linux currently is.
> >> >
> >> > This can easily be extended to work on other MACHINES in the future.
> >> >
> >> > To run this example:
> >> >
> >> > # Source the oe environment as usual
> >> > $ source oe-init-buildenv
> >> >
> >> > # Set TCLIBC to either newlib or baremetal
> >> > $ echo "TCLIBC = \"newlib\"" >> ./conf/local.conf
> >> >
> >> > # Use one of the supported architectures (qemuarm64, qemuarm or
> qemuarmv5)
> >> > $ echo "MACHINE = \"qemuarm64\"" >> ./conf/local.conf
> >> >
> >> > # Build
> >> > $ bitbake baremetal-helloworld
> >> >
> >> > # Launch QEMU
> >> > $ runqemu
> >> >
> >> > runqemu - INFO - Running bitbake -e ...
> >> > runqemu - INFO - Continuing with the following parameters:
> >> > KERNEL:
> [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
> >> > MACHINE: [qemuarm64]
> >> > FSTYPE: [bin]
> >> > ROOTFS:
> [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.bin]
> >> > CONFFILE:
> [tmp/deploy/images/qemuarm64/baremetal-helloworld-qemuarm64.qemuboot.conf]
> >> >
> >> > Hello OpenEmbedded!
> >> >
> >> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> >> > ---
> >> >  .../baremetal-examples/baremetal-helloworld_git.bb | 114
> +++++++++++++++++++++
> >> >  1 file changed, 114 insertions(+)
> >> >  create mode 100644 meta/recipes-extended/baremetal-examples/
> baremetal-helloworld_git.bb
> >> >
> >> > diff --git a/meta/recipes-extended/baremetal-examples/
> baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-examples/
> baremetal-helloworld_git.bb
> >> > new file mode 100644
> >> > index 0000000..aab48b1
> >> > --- /dev/null
> >> > +++ b/meta/recipes-extended/baremetal-examples/
> baremetal-helloworld_git.bb
> >> > @@ -0,0 +1,114 @@
> >> > +SUMMARY = "Baremetal examples to work with the several QEMU
> architectures supported on OpenEmbedded"
> >> > +HOMEPAGE = "https://github.com/aehs29/baremetal-helloqemu"
> >> > +LICENSE = "CC-BY-SA-4.0"
> >>
> >> I've raised https://github.com/aehs29/baremetal-helloqemu/issues/1 as
> >> CC licenses aren't recommended for software.
> >>
> >>
> >
> > I do agree, I originally had it as MIT, although I did base this on the
> original work of someone who made it work for the versatile architecture
> and they licensed that with CC-BY-SA and as I was reading I have to use the
> same license as them.
> >
> > I thought about it and for the Hello OpenEmbedded examples it would be
> ok since they should serve mostly as basis for the wiring that users can
> use to build, run and test their baremetal apps on OE, so the license
> wouldn't affect them, but I'm open to suggestions here.
>
> A bad license choice in a sample recipe is just going to encourage
> others to use it though. I'd recommend reviewing
> https://wiki.creativecommons.org/wiki/ShareAlike_compatibility:_GPLv3
> to see if you can use GPLv3 instead if you've got CC-BY-SA inputs. You
> could also contact the original author and ask about licensing the
> code more cleanly.
>

Agreed, I took a look at that already and it looks like the compatibility
starts with CC-BY-SA 4 which didn't exist when the original code was
written, but that's why I chose v4 because it was compatible with the older
ones and people that use this can use GPLv3 if they want to since this is
CC-BY-SA v4, again this wasn't my first choice either.

I tried contacting the author already but it's been a while and he hasn't
replied yet.

Alejandro

>
> Thanks,
> Paul
>

--000000000000373446059d25c84c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hey guys,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jan 27, 2020, 1:11 PM Paul Barker &lt=
;<a href=3D"mailto:pbarker@konsulko.com">pbarker@konsulko.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Mon, 27 Jan 2020 at 15:42, Ale=
jandro Enedino Hernandez Samaniego<br>
&lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noref=
errer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hey Paul,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Jan 27, 2020, 2:09 AM Paul Barker &lt;<a href=3D"mailto:pbarke=
r@konsulko.com" target=3D"_blank" rel=3D"noreferrer">pbarker@konsulko.com</=
a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, 27 Jan 2020 at 10:00, Alejandro Enedino Hernandez Samanieg=
o<br>
&gt;&gt; &lt;<a href=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=
=3D"noreferrer">alejandro@enedino.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Create HelloWorld examples that run on several of the QEMU ar=
chitectures<br>
&gt;&gt; &gt; supported by the build system.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This recipe can be used by anyone to understand how baremetal=
 applications<br>
&gt;&gt; &gt; can be built using OpenEmbedded and how the wiring to set the=
m up could be.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This should also facilitate creating/extending the OE testing=
 infrastructure<br>
&gt;&gt; &gt; to allow baremetal applications or RTOSs to be tested in the =
same way that<br>
&gt;&gt; &gt; Linux currently is.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This can easily be extended to work on other MACHINES in the =
future.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; To run this example:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; # Source the oe environment as usual<br>
&gt;&gt; &gt; $ source oe-init-buildenv<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; # Set TCLIBC to either newlib or baremetal<br>
&gt;&gt; &gt; $ echo &quot;TCLIBC =3D \&quot;newlib\&quot;&quot; &gt;&gt; .=
/conf/local.conf<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; # Use one of the supported architectures (qemuarm64, qemuarm =
or qemuarmv5)<br>
&gt;&gt; &gt; $ echo &quot;MACHINE =3D \&quot;qemuarm64\&quot;&quot; &gt;&g=
t; ./conf/local.conf<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; # Build<br>
&gt;&gt; &gt; $ bitbake baremetal-helloworld<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; # Launch QEMU<br>
&gt;&gt; &gt; $ runqemu<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; runqemu - INFO - Running bitbake -e ...<br>
&gt;&gt; &gt; runqemu - INFO - Continuing with the following parameters:<br=
>
&gt;&gt; &gt; KERNEL: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qem=
uarm64.bin]<br>
&gt;&gt; &gt; MACHINE: [qemuarm64]<br>
&gt;&gt; &gt; FSTYPE: [bin]<br>
&gt;&gt; &gt; ROOTFS: [tmp/deploy/images/qemuarm64/baremetal-helloworld-qem=
uarm64.bin]<br>
&gt;&gt; &gt; CONFFILE: [tmp/deploy/images/qemuarm64/baremetal-helloworld-q=
emuarm64.qemuboot.conf]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hello OpenEmbedded!<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a h=
ref=3D"mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">a=
lejandro@enedino.org</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../baremetal-examples/<a href=3D"http://baremetal-hell=
oworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">baremetal-he=
lloworld_git.bb</a> | 114 +++++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 114 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-extended/baremetal-exam=
ples/<a href=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noref=
errer" target=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-extended/baremetal-examples/<a href=
=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">baremetal-helloworld_git.bb</a> b/meta/recipes-extended/bareme=
tal-examples/<a href=3D"http://baremetal-helloworld_git.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">baremetal-helloworld_git.bb</a><br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000..aab48b1<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta/recipes-extended/baremetal-examples/<a href=3D"htt=
p://baremetal-helloworld_git.bb" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">baremetal-helloworld_git.bb</a><br>
&gt;&gt; &gt; @@ -0,0 +1,114 @@<br>
&gt;&gt; &gt; +SUMMARY =3D &quot;Baremetal examples to work with the severa=
l QEMU architectures supported on OpenEmbedded&quot;<br>
&gt;&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/aehs29/bare=
metal-helloqemu" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
thub.com/aehs29/baremetal-helloqemu</a>&quot;<br>
&gt;&gt; &gt; +LICENSE =3D &quot;CC-BY-SA-4.0&quot;<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve raised <a href=3D"https://github.com/aehs29/baremetal-hel=
loqemu/issues/1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
thub.com/aehs29/baremetal-helloqemu/issues/1</a> as<br>
&gt;&gt; CC licenses aren&#39;t recommended for software.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; I do agree, I originally had it as MIT, although I did base this on th=
e original work of someone who made it work for the versatile architecture =
and they licensed that with CC-BY-SA and as I was reading I have to use the=
 same license as them.<br>
&gt;<br>
&gt; I thought about it and for the Hello OpenEmbedded examples it would be=
 ok since they should serve mostly as basis for the wiring that users can u=
se to build, run and test their baremetal apps on OE, so the license wouldn=
&#39;t affect them, but I&#39;m open to suggestions here.<br>
<br>
A bad license choice in a sample recipe is just going to encourage<br>
others to use it though. I&#39;d recommend reviewing<br>
<a href=3D"https://wiki.creativecommons.org/wiki/ShareAlike_compatibility:_=
GPLv3" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.creativ=
ecommons.org/wiki/ShareAlike_compatibility:_GPLv3</a><br>
to see if you can use GPLv3 instead if you&#39;ve got CC-BY-SA inputs. You<=
br>
could also contact the original author and ask about licensing the<br>
code more cleanly.<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Agreed, I took a look at that already and it looks like t=
he compatibility starts with CC-BY-SA 4 which didn&#39;t exist when the ori=
ginal code was written, but that&#39;s why I chose v4 because it was compat=
ible with the older ones and people that use this can use GPLv3 if they wan=
t to since this is CC-BY-SA v4, again this wasn&#39;t my first choice eithe=
r.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I tried contacting th=
e author already but it&#39;s been a while and he hasn&#39;t replied yet.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Alejandro</div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
Paul<br>
</blockquote></div></div></div>

--000000000000373446059d25c84c--
