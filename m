Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7C4B060796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:30:40 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id fh2so17540720igd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=M9LTiIz0yo+gt+yuL6adq1PcDKCI6NIYl2Fd+q4shsg=;
	b=elPFnaOwng+76FuRz6SZOoOwum+iiY9i0KnL7pUq81ywmqUUhuaANNH5sKUBd/6WVh
	AwxxPcc2+w3yFG4ocslrRp7BDp5xsLXbs8rLsRbhETDTG1Q/8iSMq1/VjhjC4AW3w8DX
	8FCYje/NrEjhzIdZy9g3EA2hIUdlk4lVB7gRj7J5UL4Kx093aWFEJvOFXbNBBBSP9CC7
	gW/hp4gsLmSJipFEUDu6C1+2//b/UGyETxcwjy3pDYRAnKmjYu3ldWL9s8tdtWo2n5IJ
	+vsQOYrhkONfzTnW4P3eHJFEEfJssIBkmFkwM3OcWwh6SXO7zdju3hrXZ++8w3Bp6PEz
	0/Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=M9LTiIz0yo+gt+yuL6adq1PcDKCI6NIYl2Fd+q4shsg=;
	b=n00FFTGp6nPCIQInhpZjE9IBAcCpsOaJjA4/DFb3EYWw8bZeQVY0ILOTcMZXugH1XX
	Y32p4iskQOcmEngFXNiC0IgqrVeeNndIymeNon4zgP6U6jQYOYgh/P5HEKCtnWiaYDV+
	YD+BeiDcja6xAQxbiOjvNo0kYhN8l5Ow+G5jVhuoIKsBTtY+vFnEtjT/fWGvlSPN/Pah
	IwfS2E9V1xOYL06xGT6n0/alCwnVpfB4Tw4Tp1+asbO830USdbgmS7hCrHPnrUfXpNuG
	snA+t9E1Axa4mdnVajW3m+si3tI2T5FAGW3ld4PDsKnlmpxBH2RqSZ+jcDKWRBuR+JD4
	5wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=M9LTiIz0yo+gt+yuL6adq1PcDKCI6NIYl2Fd+q4shsg=;
	b=COymIbitlhbDCMsutN4dIDQHRhv4BzyYIRjFGexwAQD0rUAtmqlvaZT++aIqNyD0/F
	1H04sXXAe8+AcNPagJjpkYjO8yZYiEMSkqrv7fCQLa9Exf2nlgXyFtMMtK8vV+f0sVHc
	Jo0Ixd37ywswaBYwhkTOITjrpgZavt+j/oRytDLq9KtlznvJG09aD0/4Ubt8BF5qrpfv
	scUhW6zdaOrbCdHj/+eOc3EKHwGErD0RyeTO3qLDEValiPU0RePrLxDOcIDfYojNuBOj
	V1oJAw/EmcOwG5E1Fih+5V1WkkYtKyX53DBvRqFE1RqOVOIJVVKJ+cydFatfjfS2QazF
	1i0Q==
X-Gm-Message-State: ALyK8tJxZhO23mhRgFGX+JYzWhDNGr2iMzqFFsXhY4bmyGB/f6usUySVvPNSyIW7Y0ZQK9cWAELBxxi3ZxdiEA==
X-Received: by 10.50.123.161 with SMTP id mb1mr703786igb.20.1464121839086;
	Tue, 24 May 2016 13:30:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Tue, 24 May 2016 13:30:19 -0700 (PDT)
In-Reply-To: <20160524201600.GB21158@linux.intel.com>
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
	<20160523103623.GA18324@linux.intel.com>
	<154dd88c4a6.d1f78c40166145.7475080368514196708@geekcentral.pub>
	<20160524195145.GA21158@linux.intel.com>
	<CABcZANnTRsoFWBdshg1mvV1AWvxjs_XqYb0horJwFSpqrswT6Q@mail.gmail.com>
	<20160524201600.GB21158@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 24 May 2016 13:30:19 -0700
X-Google-Sender-Auth: osHczpJFGF84GqodJ-IbXv2lDV4
Message-ID: <CABcZANnRrT_mJ1WnahrKfNe2vS9z8BYvR3p1vacXt6siKSAJ0Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 24 May 2016 20:30:40 -0000
Content-Type: multipart/alternative; boundary=001a1135e7ea2097f205339c6e99

--001a1135e7ea2097f205339c6e99
Content-Type: text/plain; charset=UTF-8

On Tue, May 24, 2016 at 1:16 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> On Tue, May 24, 2016 at 12:56:39PM -0700, Christopher Larson wrote:
> > On Tue, May 24, 2016 at 12:51 PM, Ed Bartosh <ed.bartosh@linux.intel.com
> >
> > wrote:
> >
> > > On Mon, May 23, 2016 at 08:13:28AM -0400, Ian Geiser wrote:
> > > >  > On Thu, May 19, 2016 at 05:52:45AM -0400, Ian Geiser wrote:
> > > >  > > Greetings, I am trying to learn "wic" and have been confused as
> how
> > > to create a "live" style image.  I am following "
> > >
> http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html#creating-partitioned-images
> "
> > > but am getting confused on the target to use to create the a file
> system
> > > that has a single squashfs file containing my root file system.
> > > >  > >
> > > >  > > My desired partition layout is as follows:
> > > >  > >       40MiB                 40MiB               300MiB
> > > >  > >
> > > +--------------------+-----------------+-----------------------------+
> > > >  > > |      BOOT (esp)    |    DATA (fat)   |          ROOT (live)
> > >   |
> > > >  > >
> > > +--------------------+-----------------+-----------------------------+
> > > >  > >
> > > >  > > BOOT - efi boot partition with kernel and initramfs
> > > >  > > DATA - generic fat filesystem to hold configuration files
> > > >  > > ROOT - an ext4 filesystem that contains a single os.img, which
> is a
> > > squashfs file.
> > > >  > >
> > > >  > > I have ROOT and DATA figured out but I am at a loss as how to
> > > generate the os.img file and copy it into ROOT.  If I generate the
> os.img
> > > file with bitbake and then use the "-r" option to manually supply a
> > > directory structure it works, but I would rather have it done from a
> wks
> > > file for automation reasons.
> > > >  > >
> > > >  > > Any hints?
> > > >  > I'd suggest to use wic image type and generate your image by
> bitbake.
> > > >  > You can find example wic-image-minimal.bb and
> wic-image-minimal.wks
> > > in ../meta-selftest/recipes-test/images/
> > > >  >
> > > > This is where I started.  I was able to make it work but not with my
> > > configuration above.  It looks like I can use a type of "fsimage" for
> my
> > > "ROOT" partition, but I have not been able to figure out the syntax
> there
> > > yet.  For "BOOT" I am at a complete loss.  In theory "bootimg-efi" but
> > > there doesn't seem to be a way to provide an initramfs.
> > >
> > > How about creating recipe to prepare content or your boot partition and
> > > then using --source rootfs --rootfs-dir=<your recipe> ?
> > > This is much more generic way of creating partitioned images from my
> > > point of view. Image recipes should take care of content and wic takes
> > > care of
> > > putting that content into partitions according to the partitioning
> > > scheme described in .wks
> > >
> > > Does it make sense for you?
> > >
> > > >
> > > >  > You can probably do the same by using wic plugins, but I'd not
> suggest
> > > >  > to go this way. Using wic image type is simpler, more consistent,
> > > easier to do and provides higher level of automation.
> > > >
> > > > Is using the wic image type and a plugin mutually exclusive?
> > > No, not at all. However, I personally found the way I described above
> > > more consistent, flexible and easy to implement and maintain.
> > >
> >
> > The thing is, it's likely the machine/bsp setting the WKS_FILE, yet in
> > OE/yocto we prefer machine/distro/image to be orthogonal. If you're
> > injecting machine specific logic into an image, that image isn't going to
> > be generally useful for all machines, and so violates our philosophy.
>
> I'm not sure I understand why it has to be machine-dependent setting in
> the .wks Can you give some example?


I don't understand the question. The .wks is machine specific by
definition. It includes knowledge of the expectations of the boot process
on the hardware the image is used on, what the boot device name is, etc.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135e7ea2097f205339c6e99
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 24, 2016 at 1:16 PM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"HOEnZb adM"><div class=3D"">On Tue, May 24, 2016 at 12:56:39PM -0700,=
 Christopher Larson wrote:<br>
&gt; On Tue, May 24, 2016 at 12:51 PM, Ed Bartosh &lt;<a href=3D"mailto:ed.=
bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Mon, May 23, 2016 at 08:13:28AM -0400, Ian Geiser wrote:<br>
&gt; &gt; &gt;=C2=A0 &gt; On Thu, May 19, 2016 at 05:52:45AM -0400, Ian Gei=
ser wrote:<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt; Greetings, I am trying to learn &quot;wic&qu=
ot; and have been confused as how<br>
&gt; &gt; to create a &quot;live&quot; style image.=C2=A0 I am following &q=
uot;<br>
&gt; &gt; <a href=3D"http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-=
manual.html#creating-partitioned-images" rel=3D"noreferrer" target=3D"_blan=
k">http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html#creati=
ng-partitioned-images</a>&quot;<br>
&gt; &gt; but am getting confused on the target to use to create the a file=
 system<br>
&gt; &gt; that has a single squashfs file containing my root file system.<b=
r>
&gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt; My desired partition layout is as follows:<b=
r>
&gt; &gt; &gt;=C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A040MiB=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A040MiB=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0300MiB<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; +--------------------+-----------------+-------------------------=
----+<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt; |=C2=A0 =C2=A0 =C2=A0 BOOT (esp)=C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 DATA (fat)=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ROOT (live)<br>
&gt; &gt;=C2=A0 =C2=A0|<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; +--------------------+-----------------+-------------------------=
----+<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt; BOOT - efi boot partition with kernel and in=
itramfs<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt; DATA - generic fat filesystem to hold config=
uration files<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt; ROOT - an ext4 filesystem that contains a si=
ngle os.img, which is a<br>
&gt; &gt; squashfs file.<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt; I have ROOT and DATA figured out but I am at=
 a loss as how to<br>
&gt; &gt; generate the os.img file and copy it into ROOT.=C2=A0 If I genera=
te the os.img<br>
&gt; &gt; file with bitbake and then use the &quot;-r&quot; option to manua=
lly supply a<br>
&gt; &gt; directory structure it works, but I would rather have it done fro=
m a wks<br>
&gt; &gt; file for automation reasons.<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 &gt; &gt; Any hints?<br>
&gt; &gt; &gt;=C2=A0 &gt; I&#39;d suggest to use wic image type and generat=
e your image by bitbake.<br>
&gt; &gt; &gt;=C2=A0 &gt; You can find example <a href=3D"http://wic-image-=
minimal.bb" rel=3D"noreferrer" target=3D"_blank">wic-image-minimal.bb</a> a=
nd wic-image-minimal.wks<br>
&gt; &gt; in ../meta-selftest/recipes-test/images/<br>
&gt; &gt; &gt;=C2=A0 &gt;<br>
&gt; &gt; &gt; This is where I started.=C2=A0 I was able to make it work bu=
t not with my<br>
&gt; &gt; configuration above.=C2=A0 It looks like I can use a type of &quo=
t;fsimage&quot; for my<br>
&gt; &gt; &quot;ROOT&quot; partition, but I have not been able to figure ou=
t the syntax there<br>
&gt; &gt; yet.=C2=A0 For &quot;BOOT&quot; I am at a complete loss.=C2=A0 In=
 theory &quot;bootimg-efi&quot; but<br>
&gt; &gt; there doesn&#39;t seem to be a way to provide an initramfs.<br>
&gt; &gt;<br>
&gt; &gt; How about creating recipe to prepare content or your boot partiti=
on and<br>
&gt; &gt; then using --source rootfs --rootfs-dir=3D&lt;your recipe&gt; ?<b=
r>
&gt; &gt; This is much more generic way of creating partitioned images from=
 my<br>
&gt; &gt; point of view. Image recipes should take care of content and wic =
takes<br>
&gt; &gt; care of<br>
&gt; &gt; putting that content into partitions according to the partitionin=
g<br>
&gt; &gt; scheme described in .wks<br>
&gt; &gt;<br>
&gt; &gt; Does it make sense for you?<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 &gt; You can probably do the same by using wic plugins=
, but I&#39;d not suggest<br>
&gt; &gt; &gt;=C2=A0 &gt; to go this way. Using wic image type is simpler, =
more consistent,<br>
&gt; &gt; easier to do and provides higher level of automation.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is using the wic image type and a plugin mutually exclusive?=
<br>
&gt; &gt; No, not at all. However, I personally found the way I described a=
bove<br>
&gt; &gt; more consistent, flexible and easy to implement and maintain.<br>
&gt; &gt;<br>
&gt;<br>
&gt; The thing is, it&#39;s likely the machine/bsp setting the WKS_FILE, ye=
t in<br>
&gt; OE/yocto we prefer machine/distro/image to be orthogonal. If you&#39;r=
e<br>
&gt; injecting machine specific logic into an image, that image isn&#39;t g=
oing to<br>
&gt; be generally useful for all machines, and so violates our philosophy.<=
br>
<br>
</div></div>I&#39;m not sure I understand why it has to be machine-dependen=
t setting in<br>
the .wks Can you give some example?</blockquote></div><br>I don&#39;t under=
stand the question. The .wks is machine specific by definition. It includes=
 knowledge of the expectations of the boot process on the hardware the imag=
e is used on, what the boot device name is, etc.<br>-- <br><div class=3D"gm=
ail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder =
- BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwar=
e Engineer, Mentor Graphics</div>
</div></div>

--001a1135e7ea2097f205339c6e99--
