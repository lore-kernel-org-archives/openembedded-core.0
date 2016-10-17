Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 53DED71998
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:26:14 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id z190so240530351qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zyNXRoAdnWVV7ApQROwSzwrl2SEBhSIMguuhUFAZ4Qo=;
	b=BqTOw3c/GtO/r2S/a+yDuXBwug3jQxdqw6xUmjL5X0cy7K9FQHmJzE3WJo/8Tnomg8
	zi5JfocwGrl6iw3r5e2T8PbZqfI2YKR4yT5bAgoRUqUetfE53sPK/pOcISfhM0Mzgvyo
	d2URv0zhXQ49AYLMkdDQ8KbL12cWbkGAiZ6AISKbpwhdlbYqUN2q5tVZZ1ACAqjScthI
	1DzSkbDVsrFOz2m0BrQiqPEDNfJb6G0FXgrSZ1G5WdDMKrfYUwvWCaM2m+aa/kJdCww9
	F3j/ZdBTmS55mNDAcJ3onYnd14JdGeW99I5FhDrsdaaQ8zI4/7jFRl3SeQJhI3ZMv85v
	bu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zyNXRoAdnWVV7ApQROwSzwrl2SEBhSIMguuhUFAZ4Qo=;
	b=Ubf4QtERVBvI6CZtna5iPdhXhjDNOQ/2A+haiygVz0S24KEUPZIFOYBO8GKYCeyOVF
	KprHqBDtxB4mtnAQYcqcIYqnntOKMVtB+gYI1DnnbPSVka180fNBG9jKPFjoKyAxD+EG
	r24rYuGJuUBkaI1zZxMTJXMTJ1Iw+CtesP7KYiaiEktMRiPrXZjVGP11/STMOVEu3cLJ
	U77EagBMW+tO+IXxhCd6O+pUbDPEVfCUPp+sN0/oVWerRfYL401wYYg1WyTA9JZCFdQZ
	A6P531IelR/i7P4e3rLIFrv29KjgvZv519oZNDrppN1PLeVNoVpxRZR/fmP3JRT2PvNZ
	7gXw==
X-Gm-Message-State: AA6/9Rn+go/AS+9o9kaWx/ji/Ji6KKCDbbUrm0avRcyjebDn/VQVSU97mvB817TcdGM5ovVfuWxxRGBtXSBozw==
X-Received: by 10.55.164.195 with SMTP id n186mr28239574qke.197.1476717976459; 
	Mon, 17 Oct 2016 08:26:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Mon, 17 Oct 2016 08:26:15 -0700 (PDT)
In-Reply-To: <ece016ec-8f57-fe4f-c730-54fa99f02b1b@siemens.com>
References: <44095a65-4aab-648f-5538-08b02f58bee7@siemens.com>
	<CADkTA4PHxV6uoUXiGRm7PfPP_sqs8G_9Uxg6wqsB++xKSOp=uw@mail.gmail.com>
	<ece016ec-8f57-fe4f-c730-54fa99f02b1b@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Oct 2016 11:26:15 -0400
Message-ID: <CADkTA4O3i89EPg_AUkpeW3kTKmPofWmuQ1LN=iB3cuKbPbeXEw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: The future of qemuarm
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
X-List-Received-Date: Mon, 17 Oct 2016 15:26:15 -0000
Content-Type: multipart/alternative; boundary=001a114fbd606ba0d0053f11324d

--001a114fbd606ba0d0053f11324d
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 17, 2016 at 11:20 AM, Pascal Bach <pascal.bach@siemens.com>
wrote:

>
> >
> > Whatever we replace it with has to be part of linux-yocto and the meta
> data that is
> > carried there, so it can be used for the sanity/smoke test machine for
> arch arm.
> >
> > As such, it has to be feature compatible (network capabilities, disk
> boot, etc) with
> > the existing arm versatile 926ejs platform
> >
> > There have been newer variants for ages, but since there's been no
> compelling
> > reason to upgrade, I continue to carry the existing platform support
> along to the
> > new kernels. (In fact, I've had a qemuarma9 around for nearly 3 years
> now, but
> > it lacked some disk controller support).
> My main motivation is to get valgrind running. This requires at least
> armv7 to be useful.
> Most physical boards are not powerful enough (memory and cpu) to do real
> work with valgrind.
> QEMU would be helpful for that.
> >
> > From the kernel point of view, updating the platform doesn't have any
> big benefits,
> > but for userspace it could shake out issues with toolchains and
> instructions, so
> > there is a gain to be had there.
> In order to find more bugs there would be multiple qemuarms (qemuarm =
> armv5, qemuarmv7 = armv7, ...).
> Is this what you are suggesting?
>


for oe-core, no. Just one qemuarm is all that we can realistically handle.
I was just
saying that from the kernel build/driver point of view, it doesn't really
matter which
one we use, as long as there is one. Hence why it is still the versatile.

If we update, I'll deprecate the arm versatile 926ejs and switch to a newer
qemuarm
variant by default. As long as it meets the minimum standards for the
oe-core/autobuilder/
kernel tests, a switch is possible.

Bruce


> >
> > If someone is motivated, I'm happy to help work on an update to the core
> qemuarm
> > platform .. it just has to meet the criteria above.
> >
>
> Pascal
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114fbd606ba0d0053f11324d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 17, 2016 at 11:20 AM, Pascal Bach <span dir=3D"ltr">&lt;<a =
href=3D"mailto:pascal.bach@siemens.com" target=3D"_blank">pascal.bach@sieme=
ns.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D""><br>
&gt;<br>
&gt; Whatever we replace it with has to be part of linux-yocto and the meta=
 data that is<br>
&gt; carried there, so it can be used for the sanity/smoke test machine for=
 arch arm.<br>
&gt;<br>
&gt; As such, it has to be feature compatible (network capabilities, disk b=
oot, etc) with<br>
&gt; the existing arm versatile 926ejs platform<br>
&gt;<br>
&gt; There have been newer variants for ages, but since there&#39;s been no=
 compelling<br>
&gt; reason to upgrade, I continue to carry the existing platform support a=
long to the<br>
&gt; new kernels. (In fact, I&#39;ve had a qemuarma9 around for nearly 3 ye=
ars now, but<br>
&gt; it lacked some disk controller support).<br>
</span>My main motivation is to get valgrind running. This requires at leas=
t armv7 to be useful.<br>
Most physical boards are not powerful enough (memory and cpu) to do real wo=
rk with valgrind.<br>
QEMU would be helpful for that.<br>
<span class=3D"">&gt;<br>
&gt; From the kernel point of view, updating the platform doesn&#39;t have =
any big benefits,<br>
&gt; but for userspace it could shake out issues with toolchains and instru=
ctions, so<br>
&gt; there is a gain to be had there.<br>
</span>In order to find more bugs there would be multiple qemuarms (qemuarm=
 =3D armv5, qemuarmv7 =3D armv7, ...).<br>
Is this what you are suggesting?<br></blockquote><div><br><br></div><div>fo=
r oe-core, no. Just one qemuarm is all that we can realistically handle. I =
was just<br></div><div>saying that from the kernel build/driver point of vi=
ew, it doesn&#39;t really matter which<br></div><div>one we use, as long as=
 there is one. Hence why it is still the versatile.<br><br></div><div>If we=
 update, I&#39;ll deprecate the arm versatile 926ejs and switch to a newer =
qemuarm<br></div><div>variant by default. As long as it meets the minimum s=
tandards for the oe-core/autobuilder/<br></div><div>kernel tests, a switch =
is possible.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">&gt;<br>
&gt; If someone is motivated, I&#39;m happy to help work on an update to th=
e core qemuarm<br>
&gt; platform .. it just has to meet the criteria above.<br>
&gt;<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">Pascal<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a114fbd606ba0d0053f11324d--
