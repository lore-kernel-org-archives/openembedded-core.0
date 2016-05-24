Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 501BE60797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 19:56:58 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id 190so3085711iow.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 12:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=eBuy/+74Np41diC9VE8usFHJwwmkPlFSnQJot8VsfUc=;
	b=uAZstZ+rXy7kyjMWEhU8CjSGYbHWU8uuWdbIpqbmAu7Mugh2QGnmUoGmnh6FPW4Nj1
	oSasSFG91CGEQrOgOzDjE2gbUBwnM3r56NStot+x9mwu8Wli9ACJ5WaORhH4BSofr6+h
	fAPvLfwuUCETl8ZWiqiP5Ft7Ns4AzPFlSOnB+RzEpDdiKden9Brkt9+6QSag3EzpO9e8
	5bw9gYWv4GfbmBIiap5BBG4Nj/GLx7O5KH7XMpDxPqs/5ISAto7TADvCUqDYu1rsSS/d
	yhTO5QreH3OMhSvhva+3COVTj1V0Wo3QQXxwXxsI1xrLZtxEn3IGZ5NSf3w58P3oAbF+
	MuLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=eBuy/+74Np41diC9VE8usFHJwwmkPlFSnQJot8VsfUc=;
	b=cBXhJe5QloEg5pMccnXMyf+ECAKDZhe8OzzlkfGcCkZ45PDzzCrMlX7nCl8uZASoDD
	BtIlVtFIxYvSWEq20SwPZVn0uH03A8SF0NEn5qMd5p2FmBnPS9zoofFB9jabsTkODBE+
	aC4gH3RH1Jr+i4vtAX1SyhTN1UOocbOz1rmPQtLq/pUAyU1YitVrBu05traDW/Xqr/Qq
	O637tk71Nmaxi0H37yZMf7np7siv8ZXByy0R+G42PBjqyWr5oBBb44rg/j6zTT2av4P9
	KYILrk89hTuCrzCC9MyLNdyZeD/O3/JRX0fmk52mNmVKCOZ1nib0QO95xY8s49NH6IFR
	1Q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=eBuy/+74Np41diC9VE8usFHJwwmkPlFSnQJot8VsfUc=;
	b=bVUYitJlELUJ0F9sxxYyVMjFtp8Tah2EcQffdTzhAooSKmszynAz4ZjqUNjf9onJz7
	M2lMz8ZMec8L8b0u+GkJcitUBitAZJTWHUZG2Rlq/yY6n7Ivpt+by3lPDoiHQAGlLefb
	iQycQJDnGqzxoMCk3m8vqUzIcPDuMuNsVuTHciMxJ/g3mtaxngTEgUa2Kl5Hj4B3eLla
	fQz4Qr8KgZ2ZXVaeRtkPyT/X9wpnZYpWJxB9IjSaqgIDFUQwB9z8yp5aJlgiHCPsCtyj
	mHejpBTL4pjIZ98osJOdwG1N/TmH6QVwRtpXHSpcXvY7J6YFE3TnF6JmGp2wfcKQhI/U
	yFmg==
X-Gm-Message-State: ALyK8tI6aEWNZs1Fwalw2Ryn6cQUiLry3VTwW+yxBJPxSpvqjTNlopVCgpDFBZNx5EVUKwVq+c8oVoxZCwE0mA==
X-Received: by 10.107.147.7 with SMTP id v7mr498866iod.3.1464119819209; Tue,
	24 May 2016 12:56:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Tue, 24 May 2016 12:56:39 -0700 (PDT)
In-Reply-To: <20160524195145.GA21158@linux.intel.com>
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
	<20160523103623.GA18324@linux.intel.com>
	<154dd88c4a6.d1f78c40166145.7475080368514196708@geekcentral.pub>
	<20160524195145.GA21158@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 24 May 2016 12:56:39 -0700
X-Google-Sender-Auth: JhMIzlqvfdSHR9LzBgS7X-FRNWQ
Message-ID: <CABcZANnTRsoFWBdshg1mvV1AWvxjs_XqYb0horJwFSpqrswT6Q@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Wic and "live" images
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
X-List-Received-Date: Tue, 24 May 2016 19:56:59 -0000
Content-Type: multipart/alternative; boundary=94eb2c055f68bbc3b005339bf5b2

--94eb2c055f68bbc3b005339bf5b2
Content-Type: text/plain; charset=UTF-8

On Tue, May 24, 2016 at 12:51 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> On Mon, May 23, 2016 at 08:13:28AM -0400, Ian Geiser wrote:
> >  > On Thu, May 19, 2016 at 05:52:45AM -0400, Ian Geiser wrote:
> >  > > Greetings, I am trying to learn "wic" and have been confused as how
> to create a "live" style image.  I am following "
> http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html#creating-partitioned-images"
> but am getting confused on the target to use to create the a file system
> that has a single squashfs file containing my root file system.
> >  > >
> >  > > My desired partition layout is as follows:
> >  > >       40MiB                 40MiB               300MiB
> >  > >
> +--------------------+-----------------+-----------------------------+
> >  > > |      BOOT (esp)    |    DATA (fat)   |          ROOT (live)
>   |
> >  > >
> +--------------------+-----------------+-----------------------------+
> >  > >
> >  > > BOOT - efi boot partition with kernel and initramfs
> >  > > DATA - generic fat filesystem to hold configuration files
> >  > > ROOT - an ext4 filesystem that contains a single os.img, which is a
> squashfs file.
> >  > >
> >  > > I have ROOT and DATA figured out but I am at a loss as how to
> generate the os.img file and copy it into ROOT.  If I generate the os.img
> file with bitbake and then use the "-r" option to manually supply a
> directory structure it works, but I would rather have it done from a wks
> file for automation reasons.
> >  > >
> >  > > Any hints?
> >  > I'd suggest to use wic image type and generate your image by bitbake.
> >  > You can find example wic-image-minimal.bb and wic-image-minimal.wks
> in ../meta-selftest/recipes-test/images/
> >  >
> > This is where I started.  I was able to make it work but not with my
> configuration above.  It looks like I can use a type of "fsimage" for my
> "ROOT" partition, but I have not been able to figure out the syntax there
> yet.  For "BOOT" I am at a complete loss.  In theory "bootimg-efi" but
> there doesn't seem to be a way to provide an initramfs.
>
> How about creating recipe to prepare content or your boot partition and
> then using --source rootfs --rootfs-dir=<your recipe> ?
> This is much more generic way of creating partitioned images from my
> point of view. Image recipes should take care of content and wic takes
> care of
> putting that content into partitions according to the partitioning
> scheme described in .wks
>
> Does it make sense for you?
>
> >
> >  > You can probably do the same by using wic plugins, but I'd not suggest
> >  > to go this way. Using wic image type is simpler, more consistent,
> easier to do and provides higher level of automation.
> >
> > Is using the wic image type and a plugin mutually exclusive?
> No, not at all. However, I personally found the way I described above
> more consistent, flexible and easy to implement and maintain.
>

The thing is, it's likely the machine/bsp setting the WKS_FILE, yet in
OE/yocto we prefer machine/distro/image to be orthogonal. If you're
injecting machine specific logic into an image, that image isn't going to
be generally useful for all machines, and so violates our philosophy.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c055f68bbc3b005339bf5b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 24, 2016 at 12:51 PM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Mon, May 23, 2016 at 08:13:28AM -0400, Ian Geiser wrote:<br>
</span><span class=3D"">&gt;=C2=A0 &gt; On Thu, May 19, 2016 at 05:52:45AM =
-0400, Ian Geiser wrote:<br>
&gt;=C2=A0 &gt; &gt; Greetings, I am trying to learn &quot;wic&quot; and ha=
ve been confused as how to create a &quot;live&quot; style image.=C2=A0 I a=
m following &quot;<a href=3D"http://www.yoctoproject.org/docs/1.5.2/dev-man=
ual/dev-manual.html#creating-partitioned-images" rel=3D"noreferrer" target=
=3D"_blank">http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.ht=
ml#creating-partitioned-images</a>&quot; but am getting confused on the tar=
get to use to create the a file system that has a single squashfs file cont=
aining my root file system.<br>
&gt;=C2=A0 &gt; &gt;<br>
&gt;=C2=A0 &gt; &gt; My desired partition layout is as follows:<br>
&gt;=C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A040MiB=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A040MiB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0300MiB<br>
&gt;=C2=A0 &gt; &gt; +--------------------+-----------------+--------------=
---------------+<br>
&gt;=C2=A0 &gt; &gt; |=C2=A0 =C2=A0 =C2=A0 BOOT (esp)=C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 DATA (fat)=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ROOT (liv=
e)=C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt;=C2=A0 &gt; &gt; +--------------------+-----------------+--------------=
---------------+<br>
&gt;=C2=A0 &gt; &gt;<br>
&gt;=C2=A0 &gt; &gt; BOOT - efi boot partition with kernel and initramfs<br=
>
&gt;=C2=A0 &gt; &gt; DATA - generic fat filesystem to hold configuration fi=
les<br>
&gt;=C2=A0 &gt; &gt; ROOT - an ext4 filesystem that contains a single os.im=
g, which is a squashfs file.<br>
&gt;=C2=A0 &gt; &gt;<br>
&gt;=C2=A0 &gt; &gt; I have ROOT and DATA figured out but I am at a loss as=
 how to generate the os.img file and copy it into ROOT.=C2=A0 If I generate=
 the os.img file with bitbake and then use the &quot;-r&quot; option to man=
ually supply a directory structure it works, but I would rather have it don=
e from a wks file for automation reasons.<br>
&gt;=C2=A0 &gt; &gt;<br>
&gt;=C2=A0 &gt; &gt; Any hints?<br>
&gt;=C2=A0 &gt; I&#39;d suggest to use wic image type and generate your ima=
ge by bitbake.<br>
&gt;=C2=A0 &gt; You can find example <a href=3D"http://wic-image-minimal.bb=
" rel=3D"noreferrer" target=3D"_blank">wic-image-minimal.bb</a> and wic-ima=
ge-minimal.wks in ../meta-selftest/recipes-test/images/<br>
&gt;=C2=A0 &gt;<br>
&gt; This is where I started.=C2=A0 I was able to make it work but not with=
 my configuration above.=C2=A0 It looks like I can use a type of &quot;fsim=
age&quot; for my &quot;ROOT&quot; partition, but I have not been able to fi=
gure out the syntax there yet.=C2=A0 For &quot;BOOT&quot; I am at a complet=
e loss.=C2=A0 In theory &quot;bootimg-efi&quot; but there doesn&#39;t seem =
to be a way to provide an initramfs.<br>
<br>
</span>How about creating recipe to prepare content or your boot partition =
and then using --source rootfs --rootfs-dir=3D&lt;your recipe&gt; ?<br>
This is much more generic way of creating partitioned images from my<br>
point of view. Image recipes should take care of content and wic takes care=
 of<br>
putting that content into partitions according to the partitioning<br>
scheme described in .wks<br>
<br>
Does it make sense for you?<br>
<span class=3D""><br>
&gt;<br>
&gt;=C2=A0 &gt; You can probably do the same by using wic plugins, but I&#3=
9;d not suggest<br>
&gt;=C2=A0 &gt; to go this way. Using wic image type is simpler, more consi=
stent, easier to do and provides higher level of automation.<br>
&gt;<br>
&gt; Is using the wic image type and a plugin mutually exclusive?<br>
</span>No, not at all. However, I personally found the way I described abov=
e<br>
more consistent, flexible and easy to implement and maintain.<br></blockquo=
te></div><br>The thing is, it&#39;s likely the machine/bsp setting the WKS_=
FILE, yet in OE/yocto we prefer machine/distro/image to be orthogonal. If y=
ou&#39;re injecting machine specific logic into an image, that image isn&#3=
9;t going to be generally useful for all machines, and so violates our phil=
osophy.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clar=
son at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Ma=
intainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c055f68bbc3b005339bf5b2--
