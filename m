Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5599973223
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 15:07:05 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so41593056igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CfRwgJ3hVj0C0F8yE1gTZEK1K1vSYJboGTMR3xlqIU4=;
	b=PfiBZ849bSlijRWD/AL2X3JTGt52d0FBNCXDh4zr2Vk3b4SS6UQx1pJPa9xRXgpl8A
	eIpDJCMX4ItNoNu9CXYShmgZEb90I6+kkJ4oXPlJQTuDCzkLyBkC/6qsyeqkuAJwY5LD
	z0dWl8hhzAjKlvi95YpGGDKolPiEUgaxW+JoRDfV6RdcEjKHzAOkQXKtPV5657o/TY8m
	Uup18nv+qj4E7g2aN54/yA+0wD9MUj884hwLlGFmFDHz3nQ/t2eckkzQyOxULlHHNV0d
	t7ub6ZavXCDfT1RKCVAcdw/XRRT1WkOP1DqIwtAEivwizg7Ja/a55kJSt7lms6PT0ey0
	76lw==
MIME-Version: 1.0
X-Received: by 10.107.8.40 with SMTP id 40mr4167789ioi.38.1432825626899; Thu,
	28 May 2015 08:07:06 -0700 (PDT)
Received: by 10.50.112.34 with HTTP; Thu, 28 May 2015 08:07:06 -0700 (PDT)
In-Reply-To: <CAHiDW_F3w8FTR7Z_AWOMfCJfMy9sMpQofRB9uDuHErReAMJZyQ@mail.gmail.com>
References: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
	<73D9548F-A53A-4223-B028-D116F8EDF929@gmail.com>
	<CAHiDW_F3w8FTR7Z_AWOMfCJfMy9sMpQofRB9uDuHErReAMJZyQ@mail.gmail.com>
Date: Thu, 28 May 2015 08:07:06 -0700
Message-ID: <CAMKF1sqHevjfEVQUBA_SsRFz1Aku+n8Q9tNdCGei=Uvuwsh=9g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][RFT] cogl/clutter/libinput/wayland/weston updates
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
X-List-Received-Date: Thu, 28 May 2015 15:07:06 -0000
Content-Type: multipart/alternative; boundary=001a113fb638843eec051725b639

--001a113fb638843eec051725b639
Content-Type: text/plain; charset=UTF-8

On Thursday, May 28, 2015, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> On 28 April 2015 at 18:46, Khem Raj <raj.khem@gmail.com <javascript:;>>
> wrote:
> > I have had wayland/weston updates lying on my tree for some time now
> >
> >
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=eb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b
> >
> > tried git versions too
> >
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=992c13dcd4b79fe64f4f9b8122627f918257ccef
> >
> > There are problem with emulator with 1.7 and libinput I guess where the
> > mouse does not work
> > in qemux86 as well as qemux86-64, it works fine with 1.6, I have tested
> all
> > versions 0.8 and newer of lib input
> > for no success. That was the reason I did not propose those patches.
>
> I've been testing this and it looks like mouse does not work even on
> our current version of weston on QEMU, _if_ it's using libinput.
> Current Weston recipe happens to work because we default to "
> --disable-libinput-backend".


On my contrib branch I have a patch for runqemu script to not use tablet
USB device then it works. Also 1.8 release is coming out in couple of days
the patches on that branch are tracking that too. Please test it out

>
> I'll try to look into this more closely tomorrow.
>
>  - Jussi
>

--001a113fb638843eec051725b639
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, May 28, 2015, Jussi Kukkonen &lt;<a href=3D"mailto:jus=
si.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On 28 April 2015 at 18:46, Khem Raj &lt;<a href=3D"ja=
vascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#3=
9;)">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; I have had wayland/weston updates lying on my tree for some time now<b=
r>
&gt;<br>
&gt; <a href=3D"http://git.openembedded.org/openembedded-core-contrib/commi=
t/?h=3Dkraj/master&amp;id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b" targe=
t=3D"_blank">http://git.openembedded.org/openembedded-core-contrib/commit/?=
h=3Dkraj/master&amp;id=3Deb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b</a><br>
&gt;<br>
&gt; tried git versions too<br>
&gt; <a href=3D"http://git.openembedded.org/openembedded-core-contrib/commi=
t/?h=3Dkraj/master&amp;id=3D992c13dcd4b79fe64f4f9b8122627f918257ccef" targe=
t=3D"_blank">http://git.openembedded.org/openembedded-core-contrib/commit/?=
h=3Dkraj/master&amp;id=3D992c13dcd4b79fe64f4f9b8122627f918257ccef</a><br>
&gt;<br>
&gt; There are problem with emulator with 1.7 and libinput I guess where th=
e<br>
&gt; mouse does not work<br>
&gt; in qemux86 as well as qemux86-64, it works fine with 1.6, I have teste=
d all<br>
&gt; versions 0.8 and newer of lib input<br>
&gt; for no success. That was the reason I did not propose those patches.<b=
r>
<br>
I&#39;ve been testing this and it looks like mouse does not work even on<br=
>
our current version of weston on QEMU, _if_ it&#39;s using libinput.<br>
Current Weston recipe happens to work because we default to &quot;<br>
--disable-libinput-backend&quot;.</blockquote><div><br></div><div>On my con=
trib branch I have a patch for runqemu script to not use tablet USB device =
then it works. Also 1.8 release is coming out in couple of days the patches=
 on that branch are tracking that too. Please test it out=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
I&#39;ll try to look into this more closely tomorrow.<br>
<br>
=C2=A0- Jussi<br>
</blockquote>

--001a113fb638843eec051725b639--
