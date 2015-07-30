Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 16B977646C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:13:39 +0000 (UTC)
Received: by iggf3 with SMTP id f3so35514523igg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 08:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ilVTMF7VtH0yyXH3V0Cug8bq3aSI5qKAVG8vchhYHs4=;
	b=QJ1k2hLJRbXvyt5InmpGXQg5EhF3BJx6NMETGuHAbXxB0CLXeCW8d8xcyxK4VJqNbh
	Vgk1d2hvva4PPJexodwrQn33rjnRKKKzU8+cT9+wUS1nMSjl5g+7e81W2l1zYWmEW5gK
	FGXpWRve1jC/Xk8SARC3+kxre73oK2hFAxTICwPxZqS+kuEU/6EXo4b3glukkciQ8N1t
	k+9svVdzJmqcCQyaLPADZ41rRd+bDF0K4ijtYk19NCl7QwzHgV1vE53BWl0A86p9pudX
	buLUhSkTGRW5rTzvOhGxyuhO3uU/brlLtYX6J6TOtQ5hHA8qTeajq38AIBOluGQjlJIa
	tC0A==
X-Received: by 10.50.225.35 with SMTP id rh3mr5881562igc.29.1438269219486;
	Thu, 30 Jul 2015 08:13:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Thu, 30 Jul 2015 08:13:20 -0700 (PDT)
In-Reply-To: <CAJTo0LatBaSsow-h=3UTjurFyY9=PLvzi8efSohni8uXtMf=Nw@mail.gmail.com>
References: <1438103507-63604-1-git-send-email-abdur_rehman@mentor.com>
	<CAJTo0LZiEWScYqCJBfzrMQ=02vkb9jd5a-6+VvSZBqePZgr7yg@mail.gmail.com>
	<8663FA6B07BCC94795FAD21C9CC5ACF73783C098@EU-MBX-01.mgc.mentorg.com>
	<CAJTo0LZ8qasC_Out4=1KHyskj5KovxDL6+BPGoKTS8=FquBYcA@mail.gmail.com>
	<CABcZAN=W1_aW1YXAkR25TO0DM=iHoCzPrrBCNGhpw+pq3aJauA@mail.gmail.com>
	<CAJTo0La49fhabdZHEJonC=Q16-PJuHzGCP1bBLcxC9ZLimAZqA@mail.gmail.com>
	<CABcZANnM9ATkuV_ZT9+hhwh4Y1cepEfmVamWkvMDjzowMvQRhw@mail.gmail.com>
	<CAJTo0LatBaSsow-h=3UTjurFyY9=PLvzi8efSohni8uXtMf=Nw@mail.gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 30 Jul 2015 08:13:20 -0700
X-Google-Sender-Auth: oG4rmqp3kzAbdaIuFe7gCeDzZIg
Message-ID: <CABcZAN=FEL8O2nW4o8cJmFaJTfm_eE6tFRDODr8+ZPN6kvh=tw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Thu, 30 Jul 2015 15:13:42 -0000
Content-Type: multipart/alternative; boundary=001a1132f214eb41a7051c192534

--001a1132f214eb41a7051c192534
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 5:53 AM, Burton, Ross <ross.burton@intel.com> wrote=
:

> On 29 July 2015 at 21:09, Christopher Larson <chris_larson@mentor.com>
> wrote:
>
>> The dependency on initscripts via VIRTUAL-RUNTIME_initscripts is a
>>> DEPENDS, so it's build time.  The runtime dependency is on
>>> initscripts-functions.
>>>
>>> As far as I'm aware the sysv-generator used the rcX.d symlinks generate=
d
>>> by update-rcd to decide what to start when, so you can't just disable t=
he
>>> class and expect it to still work.
>>>
>>
>> VIRTUAL-RUNTIME_initscripts is installed at runtime (as you can tell by
>> its name) in packagegroup-core-boot and packagegroup-core-full-cmdline
>> both. If I don=E2=80=99t want it in my images, wiping the variable is th=
e only
>> method that makes any sense.
>
>
> So there's the problem, and breaking watchdog isn't solving it.


I don=E2=80=99t think taking a package that won=E2=80=99t even install, bre=
aking image
creation entirely, and letting it install, though not autostart, is
=E2=80=9Cbreaking watchdog=E2=80=9D any worse than it already was.

That said, a better approach would probably be for update-rc.d.bbclass to
explicitly DEPENDS on initscripts, not VIRTUAL-RUNTIME_initscripts. The
latter isn=E2=80=99t guaranteed to provide initscripts-functions, it could =
be any
recipe that provides baseline startup scripts. Adding initscripts directly
would ensure that the initscripts-functions runtime dependency is satisfied
in all cases.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1132f214eb41a7051c192534
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jul 30, 2015 at 5:53 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><di=
v class=3D"gmail_quote">On 29 July 2015 at 21:09, Christopher Larson <span =
dir=3D"ltr">&lt;<a href=3D"mailto:chris_larson@mentor.com" target=3D"_blank=
">chris_larson@mentor.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><span><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 class=3D"gmail_quote"><div>The dependency on initscripts via VIRTUAL-RUNTI=
ME_initscripts is a DEPENDS, so it&#39;s build time.=C2=A0 The runtime depe=
ndency is on initscripts-functions.</div><div><br></div><div>As far as I&#3=
9;m aware the sysv-generator used the rcX.d symlinks generated by update-rc=
d to decide what to start when, so you can&#39;t just disable the class and=
 expect it to still work.</div><span><font color=3D"#888888"><div></div></f=
ont></span></div></blockquote></div><br></span>VIRTUAL-RUNTIME_initscripts =
is installed at runtime (as you can tell by its name) in packagegroup-core-=
boot and=C2=A0packagegroup-core-full-cmdline both. If I don=E2=80=99t want =
it in my images, wiping the variable is the only method that makes any sens=
e.</blockquote></div><br></span>So there&#39;s the problem, and breaking <s=
pan class=3D"il">watchdog</span> isn&#39;t solving it.</blockquote></div><b=
r>I don=E2=80=99t think taking a package that won=E2=80=99t even install, b=
reaking image creation entirely, and letting it install, though not autosta=
rt, is =E2=80=9Cbreaking watchdog=E2=80=9D any worse than it already was.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">That sa=
id, a better approach would probably be for update-rc.d.bbclass to explicit=
ly DEPENDS on initscripts, not VIRTUAL-RUNTIME_initscripts. The latter isn=
=E2=80=99t guaranteed to provide initscripts-functions, it could be any rec=
ipe that provides baseline startup scripts. Adding initscripts directly wou=
ld ensure that the initscripts-functions runtime dependency is satisfied in=
 all cases.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Chris=
topher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedde=
d, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Gra=
phics</div></div>
</div></div>

--001a1132f214eb41a7051c192534--
