Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 379DA77197
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 18:35:12 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id 128so82290434wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 10:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MLCTXjYhup8ksZYWWtfynOmNAAs5kC+nr2BLEZ1CnoY=;
	b=W4PIi2/hsMpr8AvZJdhJCgCO4EMctDDyKVYXAwLzyUkiWg3n23oIq5/76ZjEAonHqK
	/kpXpJRD2xcRpJnDj2suFFwUJ4yiIh5+PtsQW3Bhl9OaxhBHZS0qXBSTmog+SXGWToie
	ukWF3q/rZa+7CXzHGxa70irZnZgo7cTtC8Vb41+HrAFkSUKSfLXYINBhEApLwSk1cH2T
	+pgCYoUyDmL5592zFr/4r1UBCDdSFpiTXrUiaLsUsxIQAFYJbTnBrzmtyD+mCGy9/I7y
	P2Ckbrxb8NxN0HUEahw4cE0e++ATOR1aJ/tIIUs7g4eZYD3IALL9RfB+WOAhTUD4re65
	9dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=MLCTXjYhup8ksZYWWtfynOmNAAs5kC+nr2BLEZ1CnoY=;
	b=kr+F+Sytwgg3R+1g6UD4sw9fNy2f3N2W7xQLx8ZdNdDGaeFaUI43qlEHkarLGlHx1a
	1v02F7FxNkq2Cifq5DPU3W374nFRtJseoiKwmZ64QFmWbE6UajC1kAQs3bU9TSRMDJuY
	/JQ88yGGih1HiQwzLwae4Gsq+ESqNc23mhwkz9hb5hpXikJRJq8Y6h8+qF6a5qH/5aGF
	7G24YVmLGwisgOglaMIcKlGSnYJIEWnf36qsmOD2nHpA4yqbv4cFljvxuW9ogHSJBjTu
	IjEXxoZYLavNe0vDHECh+4xYeYHovqnnecWw9oi7EmqnIMjK7Fnkcabgah4HMlhqN8Lt
	doHw==
X-Gm-Message-State: AG10YOS/Z7q7GdaCee78CC1iJ0pePu1SCwBXDoHf5juIs/rplUBwWj6OrPtnjV2wIRkNgdSbJz2QVCXxBZ1w8A==
MIME-Version: 1.0
X-Received: by 10.195.12.45 with SMTP id en13mr14520925wjd.99.1454697313003;
	Fri, 05 Feb 2016 10:35:13 -0800 (PST)
Received: by 10.194.67.168 with HTTP; Fri, 5 Feb 2016 10:35:12 -0800 (PST)
In-Reply-To: <20160205173256.GA7728@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202210411.GA20640@mcrowe.com>
	<1454452885.27087.127.camel@linuxfoundation.org>
	<20160205173256.GA7728@mcrowe.com>
Date: Fri, 5 Feb 2016 19:35:12 +0100
Message-ID: <CA+chaQc6CsziwoCVqkQPC2CW=c_UzE3Z_PT59SqP0=TbfNvR7g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 05 Feb 2016 18:35:13 -0000
Content-Type: multipart/alternative; boundary=047d7bd9170a98f01b052b0a1c30

--047d7bd9170a98f01b052b0a1c30
Content-Type: text/plain; charset=UTF-8

Please send whatever you currently have, so I can test it in my world build
with more layers.

I've already included bitbake.conf change and e.g. pigz-native you listed
here is already failing so I doubt the build with test any reasonable
number of recipes if I let it run like this.

On Fri, Feb 5, 2016 at 6:32 PM, Mike Crowe <mac@mcrowe.com> wrote:

> On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
> > > > > [snip] Set EXTRA_OEMAKE = "" in bitbake.conf
>
> On Tuesday 02 February 2016 at 16:01:14 +0000, Richard Purdie wrote:
> > > > Which architectures did you test? Often, x86 is a bad choice here and
> > > > we'd need something cross (arm/mips/ppc) to ensure it really is doing
> > > > the right things. We also need to assess a bit more than just sato.
> > > > We can run this up on the autobuilder and see what happens.
>
> On Tue, 2016-02-02 at 21:04 +0000, Mike Crowe wrote:
> > > I've compile-tested qemux86 and qemuarm for core-image-sato. qemumips
> > > is building now.
>
> Since then I've collected enough patches to make "bitbake world" build
> successfully for qemux86, qemuarm, qemuppc and qemumips. qemux86-64 is
> building now. The recipes that needed fixing to explicitly set
> EXTRA_OEMAKE = "-e MAKEFLAGS=" were:
>
>   meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
>   meta/recipes-bsp/libacpi/libacpi_0.2.bb
>   meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
>   meta/recipes-connectivity/openssl/openssl.inc
>   meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
>   meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
>   meta/recipes-devtools/perl/perl-native_5.22.1.bb
>   meta/recipes-devtools/perl/perl_5.22.1.bb
>   meta/recipes-extended/ed/ed_1.9.bb
>   meta/recipes-extended/iputils/iputils_s20151218.bb
>   meta/recipes-extended/pigz/pigz.inc
>   meta/recipes-extended/stat/stat_3.3.bb
>   meta/recipes-extended/sysklogd/sysklogd.inc
>   meta/recipes-extended/unzip/unzip_6.0.bb
>   meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
>   meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
>
> I will submit patches for these shortly.
>
> > > We've been running with the previous version of the patch with our code
> > > for a while but now I look more closely that solution didn't have
> > > anywhere near as wide an impact so I'll switch us over to using these
> > > patches. That will runtime-test a few real mips and arm targets (and
> > > even x86 and x86-64 to a limited extent) but only with our customised
> > > set of packages.
>
> On Tuesday 02 February 2016 at 22:41:25 +0000, Richard Purdie wrote:
> > Thanks. Please do mention what tests have passed/failed just so I can
> > build some idea of the risk of the patch and decide if/as/when the
> > right time to merge it is.
>
> I've not yet done any more runtime tests. I hope to get the change into our
> tree tonight so everything gets rebuilt with it over the weekend and I can
> test next week.
>
> > > > A post to the architecture list is probably needed so everyone knows
> > > > this is happening (or at least being considered).
>
> I hope to send such a post later today.
>
> Mike.
>

--047d7bd9170a98f01b052b0a1c30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please send whatever you currently have, so I can test it =
in my world build with more layers.<div><br></div><div>I&#39;ve already inc=
luded bitbake.conf change and e.g. pigz-native you listed here is already f=
ailing so I doubt the build with test any reasonable number of recipes if I=
 let it run like this.</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Fri, Feb 5, 2016 at 6:32 PM, Mike Crowe <span dir=3D"lt=
r">&lt;<a href=3D"mailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:<br>
</span>&gt; &gt; &gt; &gt; [snip] Set EXTRA_OEMAKE =3D &quot;&quot; in bitb=
ake.conf<br>
<span class=3D""><br>
On Tuesday 02 February 2016 at 16:01:14 +0000, Richard Purdie wrote:<br>
</span><span class=3D"">&gt; &gt; &gt; Which architectures did you test? Of=
ten, x86 is a bad choice here and<br>
&gt; &gt; &gt; we&#39;d need something cross (arm/mips/ppc) to ensure it re=
ally is doing<br>
&gt; &gt; &gt; the right things. We also need to assess a bit more than jus=
t sato.<br>
&gt; &gt; &gt; We can run this up on the autobuilder and see what happens.<=
br>
<br>
</span><span class=3D"">On Tue, 2016-02-02 at 21:04 +0000, Mike Crowe wrote=
:<br>
</span><span class=3D"">&gt; &gt; I&#39;ve compile-tested qemux86 and qemua=
rm for core-image-sato. qemumips<br>
&gt; &gt; is building now.<br>
<br>
</span>Since then I&#39;ve collected enough patches to make &quot;bitbake w=
orld&quot; build<br>
successfully for qemux86, qemuarm, qemuppc and qemumips. qemux86-64 is<br>
building now. The recipes that needed fixing to explicitly set<br>
EXTRA_OEMAKE =3D &quot;-e MAKEFLAGS=3D&quot; were:<br>
<br>
=C2=A0 meta/recipes-bsp/apmd/<a href=3D"http://apmd_3.2.2-15.bb" rel=3D"nor=
eferrer" target=3D"_blank">apmd_3.2.2-15.bb</a><br>
=C2=A0 meta/recipes-bsp/libacpi/<a href=3D"http://libacpi_0.2.bb" rel=3D"no=
referrer" target=3D"_blank">libacpi_0.2.bb</a><br>
=C2=A0 meta/recipes-bsp/pciutils/<a href=3D"http://pciutils_3.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">pciutils_3.4.1.bb</a><br>
=C2=A0 meta/recipes-connectivity/openssl/openssl.inc<br>
=C2=A0 meta/recipes-devtools/dmidecode/<a href=3D"http://dmidecode_3.0.bb" =
rel=3D"noreferrer" target=3D"_blank">dmidecode_3.0.bb</a><br>
=C2=A0 meta/recipes-devtools/fdisk/<a href=3D"http://gptfdisk_1.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">gptfdisk_1.0.1.bb</a><br>
=C2=A0 meta/recipes-devtools/perl/<a href=3D"http://perl-native_5.22.1.bb" =
rel=3D"noreferrer" target=3D"_blank">perl-native_5.22.1.bb</a><br>
=C2=A0 meta/recipes-devtools/perl/<a href=3D"http://perl_5.22.1.bb" rel=3D"=
noreferrer" target=3D"_blank">perl_5.22.1.bb</a><br>
=C2=A0 meta/recipes-extended/ed/<a href=3D"http://ed_1.9.bb" rel=3D"norefer=
rer" target=3D"_blank">ed_1.9.bb</a><br>
=C2=A0 meta/recipes-extended/iputils/<a href=3D"http://iputils_s20151218.bb=
" rel=3D"noreferrer" target=3D"_blank">iputils_s20151218.bb</a><br>
=C2=A0 meta/recipes-extended/pigz/pigz.inc<br>
=C2=A0 meta/recipes-extended/stat/<a href=3D"http://stat_3.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">stat_3.3.bb</a><br>
=C2=A0 meta/recipes-extended/sysklogd/sysklogd.inc<br>
=C2=A0 meta/recipes-extended/unzip/<a href=3D"http://unzip_6.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">unzip_6.0.bb</a><br>
=C2=A0 meta/recipes-gnome/gtk-theme-torturer/<a href=3D"http://gtk-theme-to=
rturer_git.bb" rel=3D"noreferrer" target=3D"_blank">gtk-theme-torturer_git.=
bb</a><br>
=C2=A0 meta/recipes-support/ptest-runner/<a href=3D"http://ptest-runner_2.0=
.bb" rel=3D"noreferrer" target=3D"_blank">ptest-runner_2.0.bb</a><br>
<br>
I will submit patches for these shortly.<br>
<span class=3D""><br>
&gt; &gt; We&#39;ve been running with the previous version of the patch wit=
h our code<br>
&gt; &gt; for a while but now I look more closely that solution didn&#39;t =
have<br>
&gt; &gt; anywhere near as wide an impact so I&#39;ll switch us over to usi=
ng these<br>
&gt; &gt; patches. That will runtime-test a few real mips and arm targets (=
and<br>
&gt; &gt; even x86 and x86-64 to a limited extent) but only with our custom=
ised<br>
&gt; &gt; set of packages.<br>
<br>
</span><span class=3D"">On Tuesday 02 February 2016 at 22:41:25 +0000, Rich=
ard Purdie wrote:<br>
&gt; Thanks. Please do mention what tests have passed/failed just so I can<=
br>
&gt; build some idea of the risk of the patch and decide if/as/when the<br>
&gt; right time to merge it is.<br>
<br>
</span>I&#39;ve not yet done any more runtime tests. I hope to get the chan=
ge into our<br>
tree tonight so everything gets rebuilt with it over the weekend and I can<=
br>
test next week.<br>
<span class=3D""><br>
&gt; &gt; &gt; A post to the architecture list is probably needed so everyo=
ne knows<br>
&gt; &gt; &gt; this is happening (or at least being considered).<br>
<br>
</span>I hope to send such a post later today.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mike.<br>
</font></span></blockquote></div><br></div>

--047d7bd9170a98f01b052b0a1c30--
