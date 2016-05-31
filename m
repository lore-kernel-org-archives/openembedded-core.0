Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9487713D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 16:13:56 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id z123so56041013itg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 09:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=9Uaa9Zd883COckTwWtaugSHnv31KTbO6hEp7eexwGgE=;
	b=qSKwvRlRixZfhLC/w5nivrKSDYwyHPCkA6u7PqWYUbSBQSWJ3RTXkmx7KAXK2asAhd
	fs6YwBAWvCifBkTl1kxp7AMlKa2pfpsOsPgPbBW6E7xZ4ufhu42uCXcJ3vqCp6SyTO4l
	7TZrnUhJVKXIiopC84iFEvxgtg8TvH1pv9XY4sxTLrjMZjjcuGYfbnSi9nY9K9TQoXic
	Zett4kIzIHk9pMSl8G7N1x6GgNqaO957hy2XyziDTUO67HiJym84KTCyFS8DhHrA2/xx
	1N61dGHoW4GswXGHAWV6jfpUnRC0dI5Qbbp6MMTG7cP7sAQmIc/z81vqD8CJmN6eWPE1
	D0qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=9Uaa9Zd883COckTwWtaugSHnv31KTbO6hEp7eexwGgE=;
	b=HzAD2j1KKSIjYVArLctnKvaC5U3fqzfCyD4RCdHyWEv7HpwBLd6jcwEIpSZC+K4CLw
	lLNuae6c1Tvt28qqS/IGM16nPvqpBiCWYoCVrWfCl+XC/3mEhzNuCUC7t4J322rBldaO
	mqT46k+3ezTMesMcyHEeMqiGTucdgPBRYtBjJim/b98U5eEEmmIvziFm0XoLYW7n3j2N
	w34ot+edmOuwnG7Tp9Q+pm/YAbYAyqxtfOaS2c4OluooeG7OhB0v7gbP6mGQwnozYgs7
	CYFFmYfW70k289H5hAtdPcc6gRlygwBGdw3cM47XCizVLqV/HO4MojY2Mpu3sIdZIFL9
	9HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=9Uaa9Zd883COckTwWtaugSHnv31KTbO6hEp7eexwGgE=;
	b=B6BOSliq663hIOVc6QZwxuW8isG1wYEsIKgRFxdd/47mDosiCrG53zZWHeH3Ln1XCg
	agpdE6aGO4ZlTw9YaG8FjAxuEUZrNNglF5n3mI05m74G29Q+1nhghOssP5EG8h7IiSW1
	PelwbqbY6OhVsbx+/6fIW2aVq8kWX9t0mo4/gDGG70A6uBx/BCphRLnhYvRWInlyFTC9
	1mE5w4OLCNHKWo3omGtNpExDXNP43R4sDGx+fDGHzDbqE16MrgJg1tnqgYe9J0w8aqBZ
	OOJ2K/mdVRy6777Y9nyMuc1BtHVWC/4T29yjWRZ4yALtG+0E9j4LDO78ZiJWYRgbqRyG
	+blA==
X-Gm-Message-State: ALyK8tJCDe6v7fe76kkibBLudHDvq8W1PXPonJ+++5o1aurb9ZQcyEzhItMO/HGGjShK1apM24oT08jHK4CPZg==
X-Received: by 10.36.3.7 with SMTP id e7mr13695874ite.15.1464711237055; Tue,
	31 May 2016 09:13:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Tue, 31 May 2016 09:13:37 -0700 (PDT)
In-Reply-To: <15507716209.cd119ae329262.993815898734303688@geekcentral.pub>
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
	<20160523103623.GA18324@linux.intel.com>
	<154dd88c4a6.d1f78c40166145.7475080368514196708@geekcentral.pub>
	<20160524195145.GA21158@linux.intel.com>
	<CABcZANnTRsoFWBdshg1mvV1AWvxjs_XqYb0horJwFSpqrswT6Q@mail.gmail.com>
	<20160524201600.GB21158@linux.intel.com>
	<CABcZANnRrT_mJ1WnahrKfNe2vS9z8BYvR3p1vacXt6siKSAJ0Q@mail.gmail.com>
	<20160525113549.GA25463@linux.intel.com>
	<CABcZANnanW42b8kk6mdTzdFpcmXm_rkTQf0uVuanY8OBTTF5+A@mail.gmail.com>
	<15507716209.cd119ae329262.993815898734303688@geekcentral.pub>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 31 May 2016 09:13:37 -0700
X-Google-Sender-Auth: bwFsf4r2dtvhEYjiXTI8r3UHTYY
Message-ID: <CABcZANmGsEQG5_=BtY3o1OJYqT5AxFagJ3Qfgeo3zjQjm7nBWA@mail.gmail.com>
To: Ian Geiser <geiseri@geekcentral.pub>
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
X-List-Received-Date: Tue, 31 May 2016 16:14:02 -0000
Content-Type: multipart/alternative; boundary=001a11419becfbbd2a053425a8e9

--001a11419becfbbd2a053425a8e9
Content-Type: text/plain; charset=UTF-8

On Tue, May 31, 2016 at 8:31 AM, Ian Geiser <geiseri@geekcentral.pub> wrote:

>  ---- On Wed, 25 May 2016 16:04:50 -0400 Christopher Larson <
> clarson@kergoth.com> wrote ----
>  >
>  > On Wed, May 25, 2016 at 4:35 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
> wrote:
>  >
>  > It's debatable. As long as we keep the logic separated, such that
> anything bsp specific is in the machine or bsp layer, so the images are
> independent of any bsp, then we're fine. If we need to keep certain aspects
> of rootfs / image preparation outside of wic, then we'd need the machines
> which need such setup to use a hook to ensure it's applied to all images,
> i.e. an IMAGE_POSTPROCESS_COMMAND, and we'd need to document that.
>
> If I follow in wic the logic is in the plugins.  So its up to the bsp to
> implement those.  Currently though we have tight coupling with efi and mbr
> in the oe-core libraries.  I guess this leads me into a false sense that
> wic is machine/bsp specific.
>

I'd agree with that, yes, it's the specific plugins that are bound to bsp,
and a number of the defaults are clearly for specific use cases by specific
bsps, which of course is why the wks is machine specific and in the bsp's
realm of responsibility.


>  > That might be doable, but we definitely need to give careful thought to
> what pieces of information about the image creation process come from
> where. Certain aspects are clearly distro, i.e. extra image space, and
> possibly other partitioning like splitting up the rootfs into multiple
> partitions, but others are clearly bsp, i.e. setup of a boot partition if
> the bootloader expects it, and image recipes need to work regardless of
> what distro or machine are selected.
>
> This is what I get at by saying needing a "robust" library of common
> plugins that can be reused by the bsp authors.  I think this would allow
> the wks files to be more consistent and more reusable.
>

I'd agree with that to a certain extent. Many of the current plugins encode
a lot of hardcoded logic and configuration and aren't very flexible. More
small plugins that we can mix and match with more options to configure them
would be nicer, but I'm assuming we just haven't had a lot of people
contributing to wic in that way yet. There aren't currently many ways for
the distro or image to affect what wic does, right now.

Ed wants the image recipe to be responsible for breaking up the rootfs or
otherwise prepping the partition input for use by wic, but if we do that,
we're injecting machine-specific logic into the image recipe. I think it
should either be done by a wic plugin or plugins (either in the wic core,
or as you suggest, new plugins in the bsp), not the image recipe, or the
image/rootfs classes and python package need more hooks for the
machine/distro configuration to opt-in to that sort of preparation without
hardcoding it into the image recipe itself. I don't feel too strongly
either way, I just want to make sure we follow the project philosophy and
don't tightly intertwine the distro, machine, and image recipe.

Lastly, in the current vernacular am I confusing the terms "image" and
> "rootfs"?  In my mind "image" is the physical bits that will get burned
> into ROM/SSD/etc.   "rootfs" is the filesystem component that is injected
> somehow into the image.  Is this correct?
>

It depends on context, actually, which gives the term some ambiguity. The
image *recipe* is of course a yocto construct, and its output might be just
hte rootfs or might be a disk image, depending on the configuration of
IMAGE_FSTYPES. It's this recipe notion of an image that needs the
orthogonality -- no machine or distro specifics in the image recipe.

On the other hand, wic's output is an image, that being a disk image which
gets flashed to media using the rootfs and other files as input.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11419becfbbd2a053425a8e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 31, 2016 at 8:31 AM, Ian Geiser <span dir=3D"ltr">&lt;<a href=
=3D"mailto:geiseri@geekcentral.pub" target=3D"_blank">geiseri@geekcentral.p=
ub</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2wa"=
 class=3D"a3s aXjCH m15507717d4cddcc0">=C2=A0---- On Wed, 25 May 2016 16:04=
:50 -0400 Christopher Larson &lt;<a href=3D"mailto:clarson@kergoth.com">cla=
rson@kergoth.com</a>&gt; wrote ----<br>
<span class=3D"">=C2=A0&gt;<br>
=C2=A0&gt; On Wed, May 25, 2016 at 4:35 AM, Ed Bartosh &lt;<a href=3D"mailt=
o:ed.bartosh@linux.intel.com">ed.bartosh@linux.intel.com</a>&gt; wrote:<br>
=C2=A0&gt;<br>
</span><span class=3D"">=C2=A0&gt; It&#39;s debatable. As long as we keep t=
he logic separated, such that anything bsp specific is in the machine or bs=
p layer, so the images are independent of any bsp, then we&#39;re fine. If =
we need to keep certain aspects of rootfs / image preparation outside of wi=
c, then we&#39;d need the machines which need such setup to use a hook to e=
nsure it&#39;s applied to all images, i.e. an IMAGE_POSTPROCESS_COMMAND, an=
d we&#39;d need to document that.<br>
<br>
</span>If I follow in wic the logic is in the plugins.=C2=A0 So its up to t=
he bsp to implement those.=C2=A0 Currently though we have tight coupling wi=
th efi and mbr in the oe-core libraries.=C2=A0 I guess this leads me into a=
 false sense that wic is machine/bsp specific.<br></div></blockquote><div><=
br></div><div>I&#39;d agree with that, yes, it&#39;s the specific plugins t=
hat are bound to bsp, and a number of the defaults are clearly for specific=
 use cases by specific bsps, which of course is why the wks is machine spec=
ific and in the bsp&#39;s realm of responsibility.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div id=3D":2wa" class=3D"a3s aXjCH m15507717d=
4cddcc0"><span class=3D"">
=C2=A0&gt; That might be doable, but we definitely need to give careful tho=
ught to what pieces of information about the image creation process come fr=
om where. Certain aspects are clearly distro, i.e. extra image space, and p=
ossibly other partitioning like splitting up the rootfs into multiple parti=
tions, but others are clearly bsp, i.e. setup of a boot partition if the bo=
otloader expects it, and image recipes need to work regardless of what dist=
ro or machine are selected.<br>
<br>
</span>This is what I get at by saying needing a &quot;robust&quot; library=
 of common plugins that can be reused by the bsp authors.=C2=A0 I think thi=
s would allow the wks files to be more consistent and more reusable.<br></d=
iv></blockquote><div><br></div><div>I&#39;d agree with that to a certain ex=
tent. Many of the current plugins encode a lot of hardcoded logic and confi=
guration and aren&#39;t very flexible. More small plugins that we can mix a=
nd match with more options to configure them would be nicer, but I&#39;m as=
suming we just haven&#39;t had a lot of people contributing to wic in that =
way yet. There aren&#39;t currently many ways for the distro or image to af=
fect what wic does, right now.</div><div><br></div><div>Ed wants the image =
recipe to be responsible for breaking up the rootfs or otherwise prepping t=
he partition input for use by wic, but if we do that, we&#39;re injecting m=
achine-specific logic into the image recipe. I think it should either be do=
ne by a wic plugin or plugins (either in the wic core, or as you suggest, n=
ew plugins in the bsp), not the image recipe, or the image/rootfs classes a=
nd python package need more hooks for the machine/distro configuration to o=
pt-in to that sort of preparation without hardcoding it into the image reci=
pe itself. I don&#39;t feel too strongly either way, I just want to make su=
re we follow the project philosophy and don&#39;t tightly intertwine the di=
stro, machine, and image recipe.</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div id=3D":2wa" class=3D"a3s aXjCH m15507717d4cddcc0">
Lastly, in the current vernacular am I confusing the terms &quot;image&quot=
; and &quot;rootfs&quot;?=C2=A0 In my mind &quot;image&quot; is the physica=
l bits that will get burned into ROM/SSD/etc.=C2=A0 =C2=A0&quot;rootfs&quot=
; is the filesystem component that is injected somehow into the image.=C2=
=A0 Is this correct?</div></blockquote></div><br>It depends on context, act=
ually, which gives the term some ambiguity. The image *recipe* is of course=
 a yocto construct, and its output might be just hte rootfs or might be a d=
isk image, depending on the configuration of IMAGE_FSTYPES. It&#39;s this r=
ecipe notion of an image that needs the orthogonality -- no machine or dist=
ro specifics in the image recipe.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">On the other hand, wic&#39;s output is an image=
, that being a disk image which gets flashed to media using the rootfs and =
other files as input.<br>-- <br><div class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>=
Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics</div>
</div></div>

--001a11419becfbbd2a053425a8e9--
