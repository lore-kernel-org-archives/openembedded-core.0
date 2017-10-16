Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id D7C9777D81
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 20:57:15 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id f187so2897613itb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1lpLRG8k2POrFDn+yoXpG6g/bhK47yR8kGENBqkFSpU=;
	b=sgugQQs9fx3/c8NDo00HZoiMiaLzOTTEQCUQ7jWg2UQ9ZS78PgfIFdvmi8lzdGdxaN
	PE92q7Kjqjzf9nTzWnhJjqloJlPzdFpJALgl0vBRBgoLRupY2yXId5B4OxaBZl94MpAd
	Rj9fDb8wgoC/wUdM2HgbCKUBDBFbmx040VCbC7YtKHIIzN2y2IhRT8458mtCWXzZPtQk
	dC/qZD0s7qSgXoQnvFkJ38m92jctOaT8B+n+2TdrS+VE8jQgM7AQalXjoQTNfx3VfEgN
	DL1hJfMKgIkDDeuTGXNquxQzfVG//raeLmGQrQl8dcxQJZ73cJ+OPLXeWBdxgyzjb9a+
	JQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1lpLRG8k2POrFDn+yoXpG6g/bhK47yR8kGENBqkFSpU=;
	b=LA8tBADZyUgwQBzZk4c5DQYV4PCf1XVPtZxT6TPmVeymeAT9XPEIgewgPI5Va8YQZ/
	vr9zzzmnqRyDAPW8XTaySmE2mcXTBmLU5aRe8LYt1zc7yaVdZns4adxCVq80RVhYcKin
	BP8y9+0gTqAKuEotThwYo13xQ8LYtxCYpJb/GbDcy7e1WqvGLkHzLdXEsF5NZmA/NyN/
	UyNGb3m+B/OP8c6d8HYiz0OMyvxFAXIrIwMHcDnmygepOcpjEX48jzuc90neNkvQxYt1
	Tc0mphC2KPqMQe61H4A8Qyb1XyyJu3YY260UGtHqRS+CYl4hXmqXclL6JiasDXDcp34n
	1OFA==
X-Gm-Message-State: AMCzsaVK3Y6iJk6EYVL4+lEYQvvGdP+QOhk+xXL0B7lRKcfdzFXBPkcj
	QcQw5LwlKFcEnK0MYzQITH7ExcghSFlCJDzMj0ZlVg==
X-Google-Smtp-Source: ABhQp+Tv1E7TmTAeqW/IJ4fzMmuvlx2HZvsMZM3/SCNWnW5vcx+10NWeUIIDVxb6ffZIa/m+8mkDd96SPtavNmDNQjU=
X-Received: by 10.36.116.5 with SMTP id o5mr2812070itc.132.1508187437079; Mon,
	16 Oct 2017 13:57:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 16 Oct 2017 13:56:56 -0700 (PDT)
In-Reply-To: <20171016205422.GY9221@denix.org>
References: <1507836933-142066-1-git-send-email-denis@denix.org>
	<CAJTo0LZOauk809g+8dCqk2t0sp24v6HJA6fGSQtYH0On1mC6Kg@mail.gmail.com>
	<20171013162825.GN9221@denix.org> <20171016174814.GV9221@denix.org>
	<CAJTo0LZMbLTY8v-yob9SBazYDpM_4QVDYKAuV6VreUmymcJVZw@mail.gmail.com>
	<20171016205422.GY9221@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Oct 2017 21:56:56 +0100
Message-ID: <CAJTo0LYmZqnU-Mo1hcheUcfkr+ZRvU4ps8g3oUtgUOReyyUwdA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] wayland-protocols: upgrade to 1.11
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
X-List-Received-Date: Mon, 16 Oct 2017 20:57:16 -0000
Content-Type: multipart/alternative; boundary="001a114a9e5e71371c055bb04048"

--001a114a9e5e71371c055bb04048
Content-Type: text/plain; charset="UTF-8"

On 16 October 2017 at 21:54, Denys Dmytriyenko <denis@denix.org> wrote:

> On Mon, Oct 16, 2017 at 09:31:49PM +0100, Burton, Ross wrote:
> > On 16 October 2017 at 18:48, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > > On Fri, Oct 13, 2017 at 12:28:25PM -0400, Denys Dmytriyenko wrote:
> > > > On Fri, Oct 13, 2017 at 12:33:35PM +0100, Burton, Ross wrote:
> > > > > On 12 October 2017 at 20:35, Denys Dmytriyenko <denis@denix.org>
> > > wrote:
> > > > >
> > > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > > >
> > > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > >
> > > > >
> > > > > One day I'll figure out why quilt appears to be non-deterministic
> about
> > > > > this but:
> > > > >
> > > > > ERROR: wayland-protocols-1.11-r0 do_patch: Command Error: 'quilt
> > > --quiltrc
> > > > > /data/poky-tmp/master/build/work/all-poky-linux/wayland-
> > > protocols/1.11-r0/recipe-sysroot-native/etc/quiltrc
> > > > > push' exited with 0  Output:
> > > > > Applying patch usesysrootprefixforpkgdatadirvariable.patch
> > > >
> > > > I don't see this patch in master. Works fine in distroless and poky
> from
> > > > master.
> > >
> > > Ping.
> >
> > The patch fails here, so I'm waiting for a v2.
>
> As I said above - there's no usesysrootprefixforpkgdatadirvariable.patch
> in
> wayland-protocols recipe in master, master-next or rocko branches:
>
> http://cgit.openembedded.org/openembedded-core/tree/meta/
> recipes-graphics/wayland/wayland-protocols_1.10.bb
>
> Are you sure you don't have something in your local tree?
>

Damnit, yes.  There's an earlier series to remove the nasty hacks. I
realised this when I saw your first reply to my patch but then forgot
again, sorry!

One of them needs to land first, and they won.  Wait for master to re-open,
or rebase on top of ross/mut.

Ross

--001a114a9e5e71371c055bb04048
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 16 October 2017 at 21:54, Denys Dmytriyenko <span dir=
=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@den=
ix.org</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Oct 16, =
2017 at 09:31:49PM +0100, Burton, Ross wrote:<br>
&gt; On 16 October 2017 at 18:48, Denys Dmytriyenko &lt;<a href=3D"mailto:d=
enis@denix.org">denis@denix.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Fri, Oct 13, 2017 at 12:28:25PM -0400, Denys Dmytriyenko wrote=
:<br>
&gt; &gt; &gt; On Fri, Oct 13, 2017 at 12:33:35PM +0100, Burton, Ross wrote=
:<br>
&gt; &gt; &gt; &gt; On 12 October 2017 at 20:35, Denys Dmytriyenko &lt;<a h=
ref=3D"mailto:denis@denix.org">denis@denix.org</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:deny=
s@ti.com">denys@ti.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"ma=
ilto:denys@ti.com">denys@ti.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; One day I&#39;ll figure out why quilt appears to be non=
-deterministic about<br>
&gt; &gt; &gt; &gt; this but:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; ERROR: wayland-protocols-1.11-r0 do_patch: Command Erro=
r: &#39;quilt<br>
&gt; &gt; --quiltrc<br>
&gt; &gt; &gt; &gt; /data/poky-tmp/master/build/<wbr>work/all-poky-linux/wa=
yland-<br>
&gt; &gt; protocols/1.11-r0/recipe-<wbr>sysroot-native/etc/quiltrc<br>
&gt; &gt; &gt; &gt; push&#39; exited with 0=C2=A0 Output:<br>
&gt; &gt; &gt; &gt; Applying patch usesysrootprefixforpkgdatadirv<wbr>ariab=
le.patch<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I don&#39;t see this patch in master. Works fine in distrole=
ss and poky from<br>
&gt; &gt; &gt; master.<br>
&gt; &gt;<br>
&gt; &gt; Ping.<br>
&gt;<br>
&gt; The patch fails here, so I&#39;m waiting for a v2.<br>
<br>
</span>As I said above - there&#39;s no usesysrootprefixforpkgdatadirv<wbr>=
ariable.patch in<br>
wayland-protocols recipe in master, master-next or rocko branches:<br>
<br>
<a href=3D"http://cgit.openembedded.org/openembedded-core/tree/meta/recipes=
-graphics/wayland/wayland-protocols_1.10.bb" rel=3D"noreferrer" target=3D"_=
blank">http://cgit.openembedded.org/<wbr>openembedded-core/tree/meta/<wbr>r=
ecipes-graphics/wayland/<wbr>wayland-protocols_1.10.bb</a><br>
<br>
Are you sure you don&#39;t have something in your local tree?<br></blockquo=
te><div><br></div><div>Damnit, yes.=C2=A0 There&#39;s an earlier series to =
remove the nasty hacks. I realised this when I saw your first reply to my p=
atch but then forgot again, sorry!</div><div><br></div><div>One of them nee=
ds to land first, and they won.=C2=A0 Wait for master to re-open, or rebase=
 on top of ross/mut.</div><div><br></div><div>Ross=C2=A0</div></div></div><=
/div>

--001a114a9e5e71371c055bb04048--
