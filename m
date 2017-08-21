Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id BC1FD7824A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 13:01:55 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id u139so81999296qka.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SDBOPDwjmJVUmqBlwG5WVy99hq63yADmETsyCS/xwFk=;
	b=nzcikgznFR6PaMXSYRt96XXw6U7bG2uVLniBDa+qPBoHCqdgt4LMY7mVbcCeI5w99E
	gonMQTv4Ik6hGXC7prO+H1STz8Ypg2R+gKJ13/4Uox+UpVpoQb1G9DHmCnHKA7F79SYh
	wbDXjULl3nlgYSvvmQLtmxInvjJVWmmurHnMpm10Ud/ZWVlvH9/1BNvCitmetYouVE2w
	b/xy5SESqNZ8/cQf8iF+SJ6Owq1PvBmcdd9hocpWsK7MPFAa38Qelr3HsnKoalcSGUwi
	bDzC7YtC2qhLz4WgTUWFNbVvvF5VgIn2Hi0zi2Ze7xJV7ynV2IY0e34jT6XxluvAs1A0
	HWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SDBOPDwjmJVUmqBlwG5WVy99hq63yADmETsyCS/xwFk=;
	b=d+NemXDnRForpCAa53lin2HOVL8Rio4Q69UY1tJ/IDKz7McYuOBjmG1PUoqJSeavBz
	dVl/zufho9T0jx+/BjCpGl0WSbpz0+hx8zHEvrqr62AGRJJtU7qK10ALdqcPh2VF40Uw
	iTqNqguY4jDSS+QfsHvnREK+cYsdZ6GY0F85PRkpmeHhcNUcLTCzyiWGGwfBg3Ek/v6o
	5GER4IxXpARGQPlalp843dV5iPB+JE447OeIXetmBPxtLdaN87HfxYPMRA7HjUPI2ziJ
	XCrcTO9w51PFiOYkmRfk3EMYnX9Ao1qsPJDAWv1g3WYIpPInneblIzIHsRvRzgqc9LyS
	tqXQ==
X-Gm-Message-State: AHYfb5iKfUV/CtKcYRz+TkszmMOfr78SxJxDHxjGVw+t0bSxsRycR4Lg
	nNbANfTYeX9dg/clcG74wg+GnPhEYA==
X-Received: by 10.55.16.228 with SMTP id 97mr21761203qkq.19.1503320516398;
	Mon, 21 Aug 2017 06:01:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.194.139 with HTTP; Mon, 21 Aug 2017 06:01:55 -0700 (PDT)
In-Reply-To: <CADkTA4MLW_ALkySF9TS4=1N63YYRuTx8AN+-3s_gHhEhFES25w@mail.gmail.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<1503315733.32591.61.camel@linuxfoundation.org>
	<CADkTA4MLW_ALkySF9TS4=1N63YYRuTx8AN+-3s_gHhEhFES25w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 Aug 2017 09:01:55 -0400
Message-ID: <CADkTA4OnzNsBicXHC4ktbVrjQNXcEbiUQrxgFPhoLS4VKycMLg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 21 Aug 2017 13:01:55 -0000
Content-Type: multipart/alternative; boundary="001a113adba05d1ffa05574315aa"

--001a113adba05d1ffa05574315aa
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 21, 2017 at 8:11 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Aug 21, 2017 at 7:42 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Sun, 2017-08-20 at 22:58 -0400, Bruce Ashfield wrote:
>> > Hi all,
>> >
>> > Here's the collected set of kernel changes that are ready for the M3
>> > builds.
>> >
>> > We have some kernel meta data changes:
>> >
>> >   kernel-yocto: configuration updates: x86 features
>> >   linux-yocto/4.1: fix fsl-ls10xx sdhci
>> >   linux-yocto: add usb-net configs by default
>> >
>> > Some bug fixes:
>> >
>> >   kernel-yocto: ensure that only valid BSPs are built
>> >   linux-yocto/4.10: CVE & misc fixes
>> >
>> > And the important changes are the addition of the 4.12 kernel + libc
>> > headers
>> > and the removal of the 4.1 kernel.
>> >
>> > I also have some -stable updates queued for the active kernel
>> > versions, but
>> > they will come out once this series has made it into the tree, since
>> > I'm
>> > trying to isolate any 4.12 issues from other -stable updates.
>> >
>> > I built and booted all the qemu targets for 4.12, and have built for
>> > core-image-sato, core-image-kernel-dev, glibc and muslc for all of
>> > the
>> > architectures. My testing didn't pick up any regressions, but I was
>> > battling
>> > some other build errors (non kernel related) during my testing, so I
>> > can
>> > never be 100% sure.
>> >
>> > I've sent patches to poky to remove/bump any references to the 4.1
>> > kernel
>> > .. if I've missed any, I'm sure people will shout.
>>
>> I added an extra patch for the ones you missed in meta-yocto-bsp ;-)
>>
>> Also, https://autobuilder.yocto.io/builders/build-appliance/builds/425/
>> steps/BuildImages_1/logs/stdio
>> <https://autobuilder.yocto.io/builders/build-appliance/builds/425/steps/BuildImages_1/logs/stdio>
>>
>> Error:
>>  Problem: conflicting requests
>>   - nothing provides /bin/awk needed by kernel-devsrc-1.0-r0.0.qemux86_64
>>
>
> Hmm. I've built that exact combination on two different builders in the
> past week
> and have never seen this.
>
> How do I find out about the environment on that machine ? Because I'm not
> going
> to be able to reproduce it here.
>

A little bit more information. Saul fixed this earlier this year, and I'm
still carrying
a patch that ensures that /usr/bin/awk is in the ver_linux script instead
of /bin/awk.
That fix used to satisfy a similar requirement.

That being said, I did notice that Saul's change was accepted upstream and
the
patch I'm carrying is not correctly applied (but it should be an invalid
patch, not
a reference to /bin/awk).

I've fixed that patch, and am building the build-appliance image now.

I will have a new set of SRCREVs for linux-yocto-4.12, but I can't say if
they'll
fix the particular issue that the autobuilder is seeing.

Bruce


>
> Bruce
>
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113adba05d1ffa05574315aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 21, 2017 at 8:11 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div=
><div class=3D"m_2276324336682558043h5">On Mon, Aug 21, 2017 at 7:42 AM, Ri=
chard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundatio<wbr>n.org</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"m_227632=
4336682558043m_-9070533304822977223HOEnZb"><div class=3D"m_2276324336682558=
043m_-9070533304822977223h5">On Sun, 2017-08-20 at 22:58 -0400, Bruce Ashfi=
eld wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; Here&#39;s the collected set of kernel changes that are ready for the =
M3<br>
&gt; builds.<br>
&gt;<br>
&gt; We have some kernel meta data changes:<br>
&gt;<br>
&gt; =C2=A0 kernel-yocto: configuration updates: x86 features<br>
&gt; =C2=A0 linux-yocto/4.1: fix fsl-ls10xx sdhci<br>
&gt; =C2=A0 linux-yocto: add usb-net configs by default<br>
&gt;<br>
&gt; Some bug fixes:<br>
&gt;<br>
&gt; =C2=A0 kernel-yocto: ensure that only valid BSPs are built<br>
&gt; =C2=A0 linux-yocto/4.10: CVE &amp; misc fixes<br>
&gt;<br>
&gt; And the important changes are the addition of the 4.12 kernel + libc<b=
r>
&gt; headers<br>
&gt; and the removal of the 4.1 kernel.<br>
&gt;<br>
&gt; I also have some -stable updates queued for the active kernel<br>
&gt; versions, but<br>
&gt; they will come out once this series has made it into the tree, since<b=
r>
&gt; I&#39;m<br>
&gt; trying to isolate any 4.12 issues from other -stable updates.<br>
&gt;<br>
&gt; I built and booted all the qemu targets for 4.12, and have built for<b=
r>
&gt; core-image-sato, core-image-kernel-dev, glibc and muslc for all of<br>
&gt; the<br>
&gt; architectures. My testing didn&#39;t pick up any regressions, but I wa=
s<br>
&gt; battling<br>
&gt; some other build errors (non kernel related) during my testing, so I<b=
r>
&gt; can<br>
&gt; never be 100% sure.<br>
&gt;<br>
&gt; I&#39;ve sent patches to poky to remove/bump any references to the 4.1=
<br>
&gt; kernel<br>
&gt; .. if I&#39;ve missed any, I&#39;m sure people will shout.<br>
<br>
</div></div>I added an extra patch for the ones you missed in meta-yocto-bs=
p ;-)<br>
<br>
Also,=C2=A0<a href=3D"https://autobuilder.yocto.io/builders/build-appliance=
/builds/425/steps/BuildImages_1/logs/stdio" rel=3D"noreferrer" target=3D"_b=
lank">https://autobuilder.yoct<wbr>o.io/builders/build-appliance/<wbr>build=
s/425/<br>
steps/BuildImages_1/logs/stdio</a><br>
<br>
Error:=C2=A0<br>
=C2=A0Problem: conflicting requests<br>
=C2=A0 - nothing provides /bin/awk needed by kernel-devsrc-1.0-r0.0.qemux86=
<wbr>_64<br></blockquote><div><br></div></div></div><div>Hmm. I&#39;ve buil=
t that exact combination on two different builders in the past week</div><d=
iv>and have never seen this.</div><div><br></div><div>How do I find out abo=
ut the environment on that machine ? Because I&#39;m not going</div><div>to=
 be able to reproduce it here.</div></div></div></div></blockquote><div><br=
></div><div>A little bit more information. Saul fixed this earlier this yea=
r, and I&#39;m still carrying</div><div>a patch that ensures that /usr/bin/=
awk is in the ver_linux script instead of /bin/awk.</div><div>That fix used=
 to satisfy a similar requirement.</div><div><br></div><div>That being said=
, I did notice that Saul&#39;s change was accepted upstream and the</div><d=
iv>patch I&#39;m carrying is not correctly applied (but it should be an inv=
alid patch, not</div><div>a reference to /bin/awk).</div><div><br></div><di=
v>I&#39;ve fixed that patch, and am building the build-appliance image now.=
</div><div><br></div><div>I will have a new set of SRCREVs for linux-yocto-=
4.12, but I can&#39;t say if they&#39;ll</div><div>fix the particular issue=
 that the autobuilder is seeing.</div><div><br></div><div>Bruce</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_extra"><div class=3D"gmail_quote"><div><br></div><div>Bruce</div><span=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"m_2276324336682558043m_-9070533304822977223HOEnZb"><div class=
=3D"m_2276324336682558043m_-9070533304822977223h5"><br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></span></div><span class=3D"m_2276324336682558043H=
OEnZb"><font color=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"m_2276324336682558043m_-9070533304822977223gmail_signature" d=
ata-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the NULL poin=
ter, for chaos and madness await thee at its end&quot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_2276324336682558043gmail_signature" data-smartmail=3D"gmail_signature=
">&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;</div>
</div></div>

--001a113adba05d1ffa05574315aa--
