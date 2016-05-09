Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 75998606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 22:35:15 +0000 (UTC)
Received: by mail-ig0-f194.google.com with SMTP id c3so12557023igl.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 15:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a7D45Xv7sB+Q0VluNLK5GB/rcfhoC2gvNTekZ5tXTQc=;
	b=voDyDW1Inl2Z2k/pmDJHTbByNldLGzdnBkm4jXWrlekLilo5Af7abGk8Gay0dSzRQh
	0qkXDHtM6+Y0uEgmjzdetLNovFnVWSBCLz0GDk64Q3XGb1ZSSs/slu/aoLXDUwVBUz1Y
	bG//HaRnu3GmB1776/nCA0ILABUeY/FJDPTKkBtU4NprOjeXP4NUP3qeoJ9A7qGGvuY+
	czDIk6g/jZ5kbi+kpUu9qaHFkn3/U9kSlYmlHnOYyrrBRew1oZNdAybNfIjI93Ym9Vtm
	XdE+lBq9HQkSFpLzpHRdr2LWSySDfFARBrmtdBf/lAmpt/tLLHe2y6VGjOomExfWFdMK
	4/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a7D45Xv7sB+Q0VluNLK5GB/rcfhoC2gvNTekZ5tXTQc=;
	b=P8M9PHk5aspCkrlOc8M21wVZpp4gFkq7QDIugMMJYPBoXPsjZ5wG30gGN3NkzWX8GB
	nxpfQVBKcqLsURTtzN37lxUt1jcMY0+Q1F5FSpdrRUqS0jFpdr155F6Y+iCNw//W1YlK
	k/bkydLmH2qdmwKRxWloiCCD2ic0/HbW1DM2MMAwhN9kXu7a9h1z0b85lORPhFPMj51G
	TdZYdyAFNJTEABv0qd5JVSpXZ18pHSivfkoOa859ZIrlreSja5itLnWCcjJFFJARNd+0
	9YTlYm9s/UuTITkEuWtbc03Psf20YgZA79pHf96JspfgVQ6pR4/WeJb4lGlUdkcvLjQv
	oVgQ==
X-Gm-Message-State: AOPr4FWNLsjFOT7OacewUMs7oXCD9omub6jp1zAWmElrj5yHmqNChGzGbezW5VTdyOMbwQv+3ZRFN/vSQTrtow==
X-Received: by 10.50.140.8 with SMTP id rc8mr9343079igb.20.1462833316586; Mon,
	09 May 2016 15:35:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Mon, 9 May 2016 15:34:57 -0700 (PDT)
In-Reply-To: <1462832190.21831.156.camel@linuxfoundation.org>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<CAJTo0LadzExDXkkX9a6r1TTO2aQhTQ+kY82mV_-BLqs6jYnFFA@mail.gmail.com>
	<CABcZANmJe_UvZ6zeuMTwiyx9X+xY9ATD9XVW7ESrskMtjPL4YQ@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61181DEFA@ORSMSX112.amr.corp.intel.com>
	<CABcZAN=jh=+8PMVw2YMw41Aax1hmssjOVe24SG9XhjB4HgQuwQ@mail.gmail.com>
	<1462832190.21831.156.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 9 May 2016 15:34:57 -0700
Message-ID: <CABcZAN=yO4rnaGLMvp6pFcAThE+u4AQ5GugPK2Yw-9ZOWufQSQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Mon, 09 May 2016 22:35:17 -0000
Content-Type: multipart/alternative; boundary=e89a8f642ea0336f660532706cf2

--e89a8f642ea0336f660532706cf2
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 3:16 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2016-05-09 at 09:39 -0700, Christopher Larson wrote:
> >
> >
> > On Mon, May 9, 2016 at 9:35 AM, Bystricky, Juro <
> > juro.bystricky@intel.com> wrote:
> > > Two additional GNU_HASH related errors were observed (breaking some
> > > builds) that seem to be related to the patch:
> > >
> > > ERROR: bash-3.2.48-r11 do_package_qa: QA Issue: No GNU_HASH in the
> > > elf binary: '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly
> > > -non-gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48
> > > -r11/packages-split/bash-ptest/usr/lib/bash/ptest/tests/recho'
> > > No GNU_HASH in the elf binary: '/home/pokybuild/yocto
> > > -autobuilder/yocto-worker/nightly-non
> > > -gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packages
> > > -split/bash-ptest/usr/lib/bash/ptest/tests/zecho'
> > > No GNU_HASH in the elf binary: '/home/pokybuild/yocto
> > > -autobuilder/yocto-worker/nightly-non
> > > -gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packages
> > > -split/bash-ptest/usr/lib/bash/ptest/tests/printenv' [ldflags]
> > > ERROR: bash-3.2.48-r11 do_package_qa: QA run found fatal errors.
> > > Please consider fixing them.
> > >
> > >
> > > ERROR: service-0.1-r0 do_package_qa: QA Issue: No GNU_HASH in the
> > > elf binary: '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly
> > > -qa-skeleton/build/build/tmp/work/core2-64-poky-linux/service/0.1
> > > -r0/packages-split/service/usr/sbin/skeleton-test' [ldflags]
> > >
> > Huh, I must not have had ptest enabled in my test builds. Thanks,
> > will take a look.
>
> The above is an older gplv2 recipe failure which is probably why you
> didn't see it.
>
> I'm afraid there were more. pseudo:
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/buil
> ds/747/steps/BuildImages_1/logs/stdio
>
> qt-x11-free:
>
> https://autobuilder.yoctoproject.or
> g/main/builders/nightly-arm-lsb/builds/734/steps/BuildImages/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/buil
> ds/744/steps/BuildImages/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
> uilds/779/steps/BuildImages/logs/stdio
>
> service in qa-skeleton:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-skeleton/
> builds/753/steps/BuildImages/logs/stdio
>
> ruby and mkefiimage:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/build
> s/104/steps/BuildImages/logs/stdio
>
> (selftest also showed mkefimage failure)


I'll take a look asap, unless someone else gets to it first. As mentioned,
ruby, mkelfimage and one other were already on the list as of last thursday.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--e89a8f642ea0336f660532706cf2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 9, 2016 at 3:16 PM, Richard Purdie <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><span class=3D"">On Mon, 2016-05-09 at 09:39 -0700, Christopher =
Larson wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Mon, May 9, 2016 at 9:35 AM, Bystricky, Juro &lt;<br>
&gt; <a href=3D"mailto:juro.bystricky@intel.com">juro.bystricky@intel.com</=
a>&gt; wrote:<br>
&gt; &gt; Two additional GNU_HASH related errors were observed (breaking so=
me<br>
&gt; &gt; builds) that seem to be related to the patch:<br>
&gt; &gt;<br>
&gt; &gt; ERROR: bash-3.2.48-r11 do_package_qa: QA Issue: No GNU_HASH in th=
e<br>
&gt; &gt; elf binary: &#39;/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly<br>
&gt; &gt; -non-gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48<br>
&gt; &gt; -r11/packages-split/bash-ptest/usr/lib/bash/ptest/tests/recho&#39=
;<br>
&gt; &gt; No GNU_HASH in the elf binary: &#39;/home/pokybuild/yocto<br>
&gt; &gt; -autobuilder/yocto-worker/nightly-non<br>
&gt; &gt; -gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packag=
es<br>
</span>&gt; &gt; -split/bash-ptest/usr/lib/bash/ptest/tests/zecho&#39;<br>
<span class=3D"">&gt; &gt; No GNU_HASH in the elf binary: &#39;/home/pokybu=
ild/yocto<br>
&gt; &gt; -autobuilder/yocto-worker/nightly-non<br>
&gt; &gt; -gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packag=
es<br>
</span><span class=3D"">&gt; &gt; -split/bash-ptest/usr/lib/bash/ptest/test=
s/printenv&#39; [ldflags]<br>
&gt; &gt; ERROR: bash-3.2.48-r11 do_package_qa: QA run found fatal errors.<=
br>
&gt; &gt; Please consider fixing them.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; ERROR: service-0.1-r0 do_package_qa: QA Issue: No GNU_HASH in the=
<br>
&gt; &gt; elf binary: &#39;/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly<br>
&gt; &gt; -qa-skeleton/build/build/tmp/work/core2-64-poky-linux/service/0.1=
<br>
&gt; &gt; -r0/packages-split/service/usr/sbin/skeleton-test&#39; [ldflags]<=
br>
&gt; &gt;<br>
&gt; Huh, I must not have had ptest enabled in my test builds. Thanks,<br>
&gt; will take a look.<br>
<br>
</span>The above is an older gplv2 recipe failure which is probably why you=
<br>
didn&#39;t see it.<br>
<br>
I&#39;m afraid there were more. pseudo:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/build-applian=
ce/buil
ds/747/steps/BuildImages_1/logs/stdio" rel=3D"noreferrer" target=3D"_blank"=
>https://autobuilder.yoctoproject.org/main/builders/build-appliance/buil<br=
>
ds/747/steps/BuildImages_1/logs/stdio</a><br>
<br>
qt-x11-free:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.or" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.or</a><br>
g/main/builders/nightly-arm-lsb/builds/734/steps/BuildImages/logs/stdio<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-l=
sb/buil
ds/744/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank">h=
ttps://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/buil<br>
ds/744/steps/BuildImages/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-x86-6=
4-lsb/b
uilds/779/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank=
">https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b<b=
r>
uilds/779/steps/BuildImages/logs/stdio</a><br>
<br>
service in qa-skeleton:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-qa-sk=
eleton/
builds/753/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blan=
k">https://autobuilder.yoctoproject.org/main/builders/nightly-qa-skeleton/<=
br>
builds/753/steps/BuildImages/logs/stdio</a><br>
<br>
ruby and mkefiimage:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-no-x1=
1/build
s/104/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank">ht=
tps://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/build<br>
s/104/steps/BuildImages/logs/stdio</a><br>
<br>
(selftest also showed mkefimage failure)</blockquote><div><br></div><div>I&=
#39;ll take a look asap, unless someone else gets to it first. As mentioned=
, ruby, mkelfimage and one other were already on the list as of last thursd=
ay.</div></div>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Chris=
topher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedde=
d, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Gra=
phics</div></div>
</div></div>

--e89a8f642ea0336f660532706cf2--
