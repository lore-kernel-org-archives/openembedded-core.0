Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0D92C73174
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 20:05:09 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id ww4so78032153igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=8fwkYUFTNuigHoKfVnIUCv7909NgyFyFYlHDpEg4s30=;
	b=bgktSCUf4zoD9PViNeclXQILcoxtGmgBbIgwMjN8SeEXvN4Yj84EdabsJ7UfgH6kCm
	Io40HoWnzDTfkeRsXCRmPC6ayNqgBFy9lMFjhlJ8zTLfRet5N0zytkhuOaMjRzhIe9GT
	xyFwxiAqZLbPP7JIu8LAAzWeudUaGkjdOYb+ae8swkfxKhOLoyVDloIERl1aCgY23wrh
	SJhRw2OWFdrHf2gHQgiGrRQaxZGTyZayFmAmZ5DPGkTC3sbdHW/RpvpwEOYnrbqdzQtA
	OmR2Pxrpdxptw8lxEM3+U6ezP9H4k7T55pfy6mK/OgdEJEnkWUg0Cj1lfWj/5yPZKs5d
	ThLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=8fwkYUFTNuigHoKfVnIUCv7909NgyFyFYlHDpEg4s30=;
	b=MOMoyjAFDjtjuErQ+cNnKsTV3OSWjb6vGh3imt2ZT+/ixYclubaq86F3PfWiwLqh3w
	eapTmF3W1gk5PM09XOJCP+yEee89uvMLJk8y694eHMDDcwARcAzPuiwM+A70rCNxRe0/
	HQzk+pK/W9FSv8KEMYJkBjm0C0QO8NlfMTES1nu2GGD94twGbDKpyuTvogFXQ4n3dD91
	VnGHGKSmWizMxtdBn+lwdez6Q+0DvMNdYpB37Kz8SJA7tqKoBpLLhzUJngAZmwNh6tEW
	igbAPJsnc98sJrNTsHFH404hYC6USqUhXQHdXQ8SWgWmB3ZfHwD/AntbgrtGSNHuYdbs
	Y29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=8fwkYUFTNuigHoKfVnIUCv7909NgyFyFYlHDpEg4s30=;
	b=YbNiXMQJDWZsz7e60M4IvuZTRKEAQYIUMyM8oH4m9gJ8ml8Tf9nu9vMWHQYTSNXSg1
	LvG9l3qEuwEWDNcKRuRASFBw3BFurJlUR/gylpNo9stbdEnsEPGJi9VeZFrKveQcq3Pm
	ECcfMkpYf2WPsRHqCsW3Ty2ewbY9AzPow/9z+s0L+V2q+8MLOdab0j42wfUp9iXj7aD1
	rY5AwVQbwrC2t3Az9XG5RDnxLKhssGmSswD0fOmZCa8xI2wtfoyUJaWGmsMv+QQvpNBE
	yTMGXeZDqH+q+ZTRrl10FVk794ffX13vAGllM+5XDJDPmKyeDnAORU2UJ+Xbz4l2RFsa
	1y0g==
X-Gm-Message-State: ALyK8tJdnNsF5DsQwsCV2+auLk748bQ5BvI8FzfAkxa4yVM1CVToL4hCD2ZA+J5/lWn8N/nSErp8Q/T2eJqR1w==
X-Received: by 10.50.160.8 with SMTP id xg8mr5695760igb.87.1464206710197; Wed,
	25 May 2016 13:05:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Wed, 25 May 2016 13:04:50 -0700 (PDT)
In-Reply-To: <20160525113549.GA25463@linux.intel.com>
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
	<20160523103623.GA18324@linux.intel.com>
	<154dd88c4a6.d1f78c40166145.7475080368514196708@geekcentral.pub>
	<20160524195145.GA21158@linux.intel.com>
	<CABcZANnTRsoFWBdshg1mvV1AWvxjs_XqYb0horJwFSpqrswT6Q@mail.gmail.com>
	<20160524201600.GB21158@linux.intel.com>
	<CABcZANnRrT_mJ1WnahrKfNe2vS9z8BYvR3p1vacXt6siKSAJ0Q@mail.gmail.com>
	<20160525113549.GA25463@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 25 May 2016 13:04:50 -0700
X-Google-Sender-Auth: -rhI-ajkV9D_cU3SqFdrJ_vijzw
Message-ID: <CABcZANnanW42b8kk6mdTzdFpcmXm_rkTQf0uVuanY8OBTTF5+A@mail.gmail.com>
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
X-List-Received-Date: Wed, 25 May 2016 20:05:11 -0000
Content-Type: multipart/alternative; boundary=001a11c28f00d6d4a10533b03096

--001a11c28f00d6d4a10533b03096
Content-Type: text/plain; charset=UTF-8

On Wed, May 25, 2016 at 4:35 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> On Tue, May 24, 2016 at 01:30:19PM -0700, Christopher Larson wrote:
> > On Tue, May 24, 2016 at 1:16 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
> > wrote:
> >
> > > On Tue, May 24, 2016 at 12:56:39PM -0700, Christopher Larson wrote:
> > > > On Tue, May 24, 2016 at 12:51 PM, Ed Bartosh <ed.bartosh
> @linux.intel.com
> > > >
> > > > wrote:
> > > >
> > > > > On Mon, May 23, 2016 at 08:13:28AM -0400, Ian Geiser wrote:
> > > > > >  > On Thu, May 19, 2016 at 05:52:45AM -0400, Ian Geiser wrote:
> > > > > >  > > Greetings, I am trying to learn "wic" and have been
> confused as
> > > how
> > > > > to create a "live" style image.  I am following "
> > > > >
> > >
> http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html#creating-partitioned-images
> > > "
> > > > > but am getting confused on the target to use to create the a file
> > > system
> > > > > that has a single squashfs file containing my root file system.
> > > > > >  > >
> > > > > >  > > My desired partition layout is as follows:
> > > > > >  > >       40MiB                 40MiB               300MiB
> > > > > >  > >
> > > > >
> +--------------------+-----------------+-----------------------------+
> > > > > >  > > |      BOOT (esp)    |    DATA (fat)   |          ROOT
> (live)
> > > > >   |
> > > > > >  > >
> > > > >
> +--------------------+-----------------+-----------------------------+
> > > > > >  > >
> > > > > >  > > BOOT - efi boot partition with kernel and initramfs
> > > > > >  > > DATA - generic fat filesystem to hold configuration files
> > > > > >  > > ROOT - an ext4 filesystem that contains a single os.img,
> which
> > > is a
> > > > > squashfs file.
> > > > > >  > >
> > > > > >  > > I have ROOT and DATA figured out but I am at a loss as how
> to
> > > > > generate the os.img file and copy it into ROOT.  If I generate the
> > > os.img
> > > > > file with bitbake and then use the "-r" option to manually supply a
> > > > > directory structure it works, but I would rather have it done from
> a
> > > wks
> > > > > file for automation reasons.
> > > > > >  > >
> > > > > >  > > Any hints?
> > > > > >  > I'd suggest to use wic image type and generate your image by
> > > bitbake.
> > > > > >  > You can find example wic-image-minimal.bb and
> > > wic-image-minimal.wks
> > > > > in ../meta-selftest/recipes-test/images/
> > > > > >  >
> > > > > > This is where I started.  I was able to make it work but not
> with my
> > > > > configuration above.  It looks like I can use a type of "fsimage"
> for
> > > my
> > > > > "ROOT" partition, but I have not been able to figure out the syntax
> > > there
> > > > > yet.  For "BOOT" I am at a complete loss.  In theory "bootimg-efi"
> but
> > > > > there doesn't seem to be a way to provide an initramfs.
> > > > >
> > > > > How about creating recipe to prepare content or your boot
> partition and
> > > > > then using --source rootfs --rootfs-dir=<your recipe> ?
> > > > > This is much more generic way of creating partitioned images from
> my
> > > > > point of view. Image recipes should take care of content and wic
> takes
> > > > > care of
> > > > > putting that content into partitions according to the partitioning
> > > > > scheme described in .wks
> > > > >
> > > > > Does it make sense for you?
> > > > >
> > > > > >
> > > > > >  > You can probably do the same by using wic plugins, but I'd not
> > > suggest
> > > > > >  > to go this way. Using wic image type is simpler, more
> consistent,
> > > > > easier to do and provides higher level of automation.
> > > > > >
> > > > > > Is using the wic image type and a plugin mutually exclusive?
> > > > > No, not at all. However, I personally found the way I described
> above
> > > > > more consistent, flexible and easy to implement and maintain.
> > > > >
> > > >
> > > > The thing is, it's likely the machine/bsp setting the WKS_FILE, yet
> in
> > > > OE/yocto we prefer machine/distro/image to be orthogonal. If you're
> > > > injecting machine specific logic into an image, that image isn't
> going to
> > > > be generally useful for all machines, and so violates our philosophy.
> > >
> > > I'm not sure I understand why it has to be machine-dependent setting in
> > > the .wks Can you give some example?
> >
> >
> > I don't understand the question. The .wks is machine specific by
> > definition. It includes knowledge of the expectations of the boot process
> > on the hardware the image is used on, what the boot device name is, etc.
>
> Sorry for not being clear. Now I understand what you mean. I didn't know
> about this philosopy when I implemented handling wic image types in
> image core classes. Are you suggesting to remove it and keep using wic
> as only as a separate tool?


It's debatable. As long as we keep the logic separated, such that anything
bsp specific is in the machine or bsp layer, so the images are independent
of any bsp, then we're fine. If we need to keep certain aspects of rootfs /
image preparation outside of wic, then we'd need the machines which need
such setup to use a hook to ensure it's applied to all images, i.e. an
IMAGE_POSTPROCESS_COMMAND, and we'd need to document that.

That might be doable, but we definitely need to give careful thought to
what pieces of information about the image creation process come from
where. Certain aspects are clearly distro, i.e. extra image space, and
possibly other partitioning like splitting up the rootfs into multiple
partitions, but others are clearly bsp, i.e. setup of a boot partition if
the bootloader expects it, and image recipes need to work regardless of
what distro or machine are selected.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c28f00d6d4a10533b03096
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, May 25, 2016 at 4:35 AM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cla=
ss=3D"HOEnZb adM"><div class=3D"h5">On Tue, May 24, 2016 at 01:30:19PM -070=
0, Christopher Larson wrote:<br>
&gt; On Tue, May 24, 2016 at 1:16 PM, Ed <span class=3D"il">Bartosh</span> =
&lt;<a href=3D"mailto:ed.bartosh@linux.intel.com">ed.<span class=3D"il">bar=
tosh</span>@linux.intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Tue, May 24, 2016 at 12:56:39PM -0700, Christopher Larson wrot=
e:<br>
&gt; &gt; &gt; On Tue, May 24, 2016 at 12:51 PM, Ed <span class=3D"il">Bart=
osh</span> &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com">ed.<span class=
=3D"il">bartosh</span>@linux.intel.com</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Mon, May 23, 2016 at 08:13:28AM -0400, Ian Geiser wr=
ote:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; On Thu, May 19, 2016 at 05:52:45AM -040=
0, Ian Geiser wrote:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt; Greetings, I am trying to learn &q=
uot;wic&quot; and have been confused as<br>
&gt; &gt; how<br>
&gt; &gt; &gt; &gt; to create a &quot;live&quot; style image.=C2=A0 I am fo=
llowing &quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-=
manual.html#creating-partitioned-images" rel=3D"noreferrer" target=3D"_blan=
k">http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html#creati=
ng-partitioned-images</a><br>
&gt; &gt; &quot;<br>
&gt; &gt; &gt; &gt; but am getting confused on the target to use to create =
the a file<br>
&gt; &gt; system<br>
&gt; &gt; &gt; &gt; that has a single squashfs file containing my root file=
 system.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt; My desired partition layout is as =
follows:<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A040MiB=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A040MiB=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0300MiB<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; &gt; &gt; +--------------------+-----------------+---------------=
--------------+<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt; |=C2=A0 =C2=A0 =C2=A0 BOOT (esp)=
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 DATA (fat)=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ROOT (live)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0|<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; &gt; &gt; +--------------------+-----------------+---------------=
--------------+<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt; BOOT - efi boot partition with ker=
nel and initramfs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt; DATA - generic fat filesystem to h=
old configuration files<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt; ROOT - an ext4 filesystem that con=
tains a single os.img, which<br>
&gt; &gt; is a<br>
&gt; &gt; &gt; &gt; squashfs file.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt; I have ROOT and DATA figured out b=
ut I am at a loss as how to<br>
&gt; &gt; &gt; &gt; generate the os.img file and copy it into ROOT.=C2=A0 I=
f I generate the<br>
&gt; &gt; os.img<br>
&gt; &gt; &gt; &gt; file with bitbake and then use the &quot;-r&quot; optio=
n to manually supply a<br>
&gt; &gt; &gt; &gt; directory structure it works, but I would rather have i=
t done from a<br>
&gt; &gt; wks<br>
&gt; &gt; &gt; &gt; file for automation reasons.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; &gt; Any hints?<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; I&#39;d suggest to use wic image type a=
nd generate your image by<br>
&gt; &gt; bitbake.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; You can find example <a href=3D"http://=
wic-image-minimal.bb" rel=3D"noreferrer" target=3D"_blank">wic-image-minima=
l.bb</a> and<br>
&gt; &gt; wic-image-minimal.wks<br>
&gt; &gt; &gt; &gt; in ../meta-selftest/recipes-test/images/<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt;<br>
&gt; &gt; &gt; &gt; &gt; This is where I started.=C2=A0 I was able to make =
it work but not with my<br>
&gt; &gt; &gt; &gt; configuration above.=C2=A0 It looks like I can use a ty=
pe of &quot;fsimage&quot; for<br>
&gt; &gt; my<br>
&gt; &gt; &gt; &gt; &quot;ROOT&quot; partition, but I have not been able to=
 figure out the syntax<br>
&gt; &gt; there<br>
&gt; &gt; &gt; &gt; yet.=C2=A0 For &quot;BOOT&quot; I am at a complete loss=
.=C2=A0 In theory &quot;bootimg-efi&quot; but<br>
&gt; &gt; &gt; &gt; there doesn&#39;t seem to be a way to provide an initra=
mfs.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; How about creating recipe to prepare content or your bo=
ot partition and<br>
&gt; &gt; &gt; &gt; then using --source rootfs --rootfs-dir=3D&lt;your reci=
pe&gt; ?<br>
&gt; &gt; &gt; &gt; This is much more generic way of creating partitioned i=
mages from my<br>
&gt; &gt; &gt; &gt; point of view. Image recipes should take care of conten=
t and wic takes<br>
&gt; &gt; &gt; &gt; care of<br>
&gt; &gt; &gt; &gt; putting that content into partitions according to the p=
artitioning<br>
&gt; &gt; &gt; &gt; scheme described in .wks<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Does it make sense for you?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; You can probably do the same by using w=
ic plugins, but I&#39;d not<br>
&gt; &gt; suggest<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 &gt; to go this way. Using wic image type is=
 simpler, more consistent,<br>
&gt; &gt; &gt; &gt; easier to do and provides higher level of automation.<b=
r>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Is using the wic image type and a plugin mutually =
exclusive?<br>
&gt; &gt; &gt; &gt; No, not at all. However, I personally found the way I d=
escribed above<br>
&gt; &gt; &gt; &gt; more consistent, flexible and easy to implement and mai=
ntain.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The thing is, it&#39;s likely the machine/bsp setting the WK=
S_FILE, yet in<br>
&gt; &gt; &gt; OE/yocto we prefer machine/distro/image to be orthogonal. If=
 you&#39;re<br>
&gt; &gt; &gt; injecting machine specific logic into an image, that image i=
sn&#39;t going to<br>
&gt; &gt; &gt; be generally useful for all machines, and so violates our ph=
ilosophy.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not sure I understand why it has to be machine-dependent =
setting in<br>
&gt; &gt; the .wks Can you give some example?<br>
&gt;<br>
&gt;<br>
&gt; I don&#39;t understand the question. The .wks is machine specific by<b=
r>
&gt; definition. It includes knowledge of the expectations of the boot proc=
ess<br>
&gt; on the hardware the image is used on, what the boot device name is, et=
c.<br>
<br>
</div></div>Sorry for not being clear. Now I understand what you mean. I di=
dn&#39;t know<br>
about this philosopy when I implemented handling wic image types in<br>
image core classes. Are you suggesting to remove it and keep using wic<br>
as only as a separate tool?</blockquote></div><br>It&#39;s debatable. As lo=
ng as we keep the logic separated, such that anything bsp specific is in th=
e machine or bsp layer, so the images are independent of any bsp, then we&#=
39;re fine. If we need to keep certain aspects of rootfs / image preparatio=
n outside of wic, then we&#39;d need the machines which need such setup to =
use a hook to ensure it&#39;s applied to all images, i.e. an IMAGE_POSTPROC=
ESS_COMMAND, and we&#39;d need to document that.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">That might be doable, but we def=
initely need to give careful thought to what pieces of information about th=
e image creation process come from where. Certain aspects are clearly distr=
o, i.e. extra image space, and possibly other partitioning like splitting u=
p the rootfs into multiple partitions, but others are clearly bsp, i.e. set=
up of a boot partition if the bootloader expects it, and image recipes need=
 to work regardless of what distro or machine are selected.<br>-- <br><div =
class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Sen=
ior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c28f00d6d4a10533b03096--
