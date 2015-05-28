Return-Path: <ticotimo@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 77A457568B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 16:08:42 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so118534997igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sXWJH2PzXjPiASYQReuTqHYmtq7P1RudLAkixvyZgI0=;
	b=thavx1zgd3uuxCpswuvQSJ/mYkPnTx9ypgLJKN8z87FBmApXzdPVWWmuDP8E9aFfGH
	bedKlxP4ApS8OkTkYqmTaQFoc/42xZHJi6eLELQ1XUlkk+Rx8ZNpJF8x1M4Qh9zdPRR3
	YiBDvpQESwXgRgTQLY/bXorr2Vd81zj3Qe3mNcP/69oZsaFmBC++DJiANOCVeQdos6M5
	2a7jCfID7gmO/gIDJmIAQvXj16M6LbN4DuUCI4hg3ZVMSZBptPRqK9fYEjWwpCdw0358
	tfrD4lrfNjBBHEV6VcH1kBCRC2DFtAczV6K+mpwQ0CxZAufVvpKgISDbtR8yeaaNbCq9
	qlxw==
MIME-Version: 1.0
X-Received: by 10.50.13.10 with SMTP id d10mr45154002igc.20.1432829324230;
	Thu, 28 May 2015 09:08:44 -0700 (PDT)
Received: by 10.36.115.213 with HTTP; Thu, 28 May 2015 09:08:44 -0700 (PDT)
In-Reply-To: <CAMKF1sqHevjfEVQUBA_SsRFz1Aku+n8Q9tNdCGei=Uvuwsh=9g@mail.gmail.com>
References: <CANx9H-COq8yNzRKWhksM88QiuKFbCCfHKPUEtsqsqMjpGMnXVQ@mail.gmail.com>
	<73D9548F-A53A-4223-B028-D116F8EDF929@gmail.com>
	<CAHiDW_F3w8FTR7Z_AWOMfCJfMy9sMpQofRB9uDuHErReAMJZyQ@mail.gmail.com>
	<CAMKF1sqHevjfEVQUBA_SsRFz1Aku+n8Q9tNdCGei=Uvuwsh=9g@mail.gmail.com>
Date: Thu, 28 May 2015 09:08:44 -0700
Message-ID: <CANx9H-Dj1u-5g_3qnRbPZxM=_=oQ8_5fyNHLuNXEULaP9KFRPg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 28 May 2015 16:08:44 -0000
Content-Type: multipart/alternative; boundary=089e01184874e527270517269270

--089e01184874e527270517269270
Content-Type: text/plain; charset=UTF-8

Thank you both for continuing to work on this and keeping us informed.

--Tim

On Thu, May 28, 2015 at 8:07 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Thursday, May 28, 2015, Jussi Kukkonen <jussi.kukkonen@intel.com>
> wrote:
>
>> On 28 April 2015 at 18:46, Khem Raj <raj.khem@gmail.com> wrote:
>> > I have had wayland/weston updates lying on my tree for some time now
>> >
>> >
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=eb52e9e6756641cd5b1ebbff0e82dcf6f1aa5c9b
>> >
>> > tried git versions too
>> >
>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/master&id=992c13dcd4b79fe64f4f9b8122627f918257ccef
>> >
>> > There are problem with emulator with 1.7 and libinput I guess where the
>> > mouse does not work
>> > in qemux86 as well as qemux86-64, it works fine with 1.6, I have tested
>> all
>> > versions 0.8 and newer of lib input
>> > for no success. That was the reason I did not propose those patches.
>>
>> I've been testing this and it looks like mouse does not work even on
>> our current version of weston on QEMU, _if_ it's using libinput.
>> Current Weston recipe happens to work because we default to "
>> --disable-libinput-backend".
>
>
> On my contrib branch I have a patch for runqemu script to not use tablet
> USB device then it works. Also 1.8 release is coming out in couple of days
> the patches on that branch are tracking that too. Please test it out
>
>>
>> I'll try to look into this more closely tomorrow.
>>
>>  - Jussi
>>
>

--089e01184874e527270517269270
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you both for continuing to work on this and keeping =
us informed.<div><br></div><div>--Tim</div></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote">On Thu, May 28, 2015 at 8:07 AM, Khem Raj <=
span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div class=3D"HOEnZb"><div class=3D"h5"><br><br>On Thursday, May 28, 2015=
, Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"=
_blank">jussi.kukkonen@intel.com</a>&gt; wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On 28 April 2015 at 18:46, Khem Raj &lt;<a>raj.khem@gmail.com</a>&gt=
; wrote:<br>
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
--disable-libinput-backend&quot;.</blockquote><div><br></div></div></div><d=
iv>On my contrib branch I have a patch for runqemu script to not use tablet=
 USB device then it works. Also 1.8 release is coming out in couple of days=
 the patches on that branch are tracking that too. Please test it out=C2=A0=
</div><div class=3D"HOEnZb"><div class=3D"h5"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
I&#39;ll try to look into this more closely tomorrow.<br>
<br>
=C2=A0- Jussi<br>
</blockquote>
</div></div></blockquote></div><br></div>

--089e01184874e527270517269270--
