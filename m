Return-Path: <logan.buchy@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4E9EC60589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 21:25:12 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id e32so81913505qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 13:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZJDxdTf6tCQzsbpB4Bi+VKjRZR+vmdtF79lFZPl8vPI=;
	b=EmGHTqceORMJO2+8tmOUGq1gaeAAeybh8cBH+Ai6xpihppQ39rSKWJbkt/qNh9DIQQ
	c/MxVb9FA0WEYRHACVlOCtI/O351QNj2C2ObksbPEWf8UpfO5JfdG7EpB4g/ogmAsE2J
	WtVClh3TJthLJr1SmEB5/5eaeZN38VZfig2M/eStcIkm9J4HESZWn1ARZb3IHMwxfhFi
	D3egKCxWo98GcYZg5mk1dxeiozkHeo5RDSGq5t7PCMJSd2+tL5Vj+WebotI5hTNKeXWa
	gAxxuvB43De+3/QRfmcPbzyo7E5Dg4v+1utEyZAriYQdaNPSN2tfFj8CzrCkHevYj06+
	zppg==
MIME-Version: 1.0
X-Received: by 10.140.102.14 with SMTP id v14mr16459082qge.48.1451424313492;
	Tue, 29 Dec 2015 13:25:13 -0800 (PST)
Received: by 10.55.150.133 with HTTP; Tue, 29 Dec 2015 13:25:13 -0800 (PST)
In-Reply-To: <CABcZANmh8C2WDd_=zvZBPuFPvDX8w_tT5u0=Da_RTbSOs8__7A@mail.gmail.com>
References: <CAH=96PH06f+uQqNVed2Tz_z1rNB3-nLO8xgxecq9SmOU4rK=vw@mail.gmail.com>
	<CABcZANmh8C2WDd_=zvZBPuFPvDX8w_tT5u0=Da_RTbSOs8__7A@mail.gmail.com>
Date: Tue, 29 Dec 2015 13:25:13 -0800
Message-ID: <CAH=96PG3b389roR6dwM8ZAa_zkwEyDznKBcgg1mkhVgyTvBCJw@mail.gmail.com>
From: Logan Buchy <logan.buchy@gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Multiple recipes sharing the same source
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
X-List-Received-Date: Tue, 29 Dec 2015 21:25:13 -0000
Content-Type: multipart/alternative; boundary=001a11c16d429fd8580528100e46

--001a11c16d429fd8580528100e46
Content-Type: text/plain; charset=UTF-8

Thanks Christopher!

Yes, this is exactly what I needed.  Much appreciation.

On Tue, Dec 29, 2015 at 12:40 PM, Christopher Larson <clarson@kergoth.com>
wrote:

>
> On Tue, Dec 29, 2015 at 1:30 PM, Logan Buchy <logan.buchy@gmail.com>
> wrote:
>
>> I've got a third-party SDK given to me by our SoC provider.  The SDK
>> contains
>> * Vanilla Linux kernel with a set of patches that adds drivers for SoC
>> peripherals
>> * Proprietary bootloader
>> * Proprietary binary libraries
>> * Proprietary firmware for on-chip peripherals
>> * A build system which compiles everything
>>
>> This SDK comes a a big tarball.  Splitting the tarball into separate
>> tarballs is not desirable since this would need to be done every time the
>> provider issues an update (which comes as another big tarball).
>>
>> What I have now is a recipe that compiles and installs the entire SDK,
>> which works alright but I am looking to split up the SDK into separate
>> packages with associated do_configure/do_compile/do_install tasks.  For
>> example, I would like to split this into packages that provide:
>> * virtual/kernel
>> * proprietary-binary-blob
>> * soc-kernel-drivers
>> * proprietary-firmware-blob
>>
>> What I am wondering about is how would I go about writing multiple
>> recipes that share the same tarball without having bitbake untar it for
>> each recipe.  Is this even possible?  Are there any examples of packages
>> that do this?
>>
>> My best guess about how to go about this would be to create a class which
>> defines a do_fetch/do_unpack routine and then for each package, inherit the
>> class and define custom do_configure/do_compile/do_install routines.
>>
>
> See the gcc-source recipe and gcc-shared-source.inc.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>

--001a11c16d429fd8580528100e46
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Christopher!<div><br></div><div>Yes, this is exactl=
y what I needed.=C2=A0 Much appreciation.</div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Tue, Dec 29, 2015 at 12:40 PM, Chris=
topher Larson <span dir=3D"ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" =
target=3D"_blank">clarson@kergoth.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr"><span class=3D""><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Tue, Dec 29, 2015 at 1:30 PM, Logan =
Buchy <span dir=3D"ltr">&lt;<a href=3D"mailto:logan.buchy@gmail.com" target=
=3D"_blank">logan.buchy@gmail.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div>I&#39;ve got a third-party SDK given to me by our SoC p=
rovider.=C2=A0 The SDK contains</div><div>* Vanilla Linux kernel with a set=
 of patches that adds drivers for SoC peripherals</div><div>* Proprietary b=
ootloader</div><div>* Proprietary binary libraries</div><div>* Proprietary =
firmware for on-chip peripherals</div><div>* A build system which compiles =
everything</div><div><br></div><div>This SDK comes a a big tarball.=C2=A0 S=
plitting the tarball into separate tarballs is not desirable since this wou=
ld need to be done every time the provider issues an update (which comes as=
 another big tarball).</div><div><br></div><div>What I have now is a recipe=
 that compiles and installs the entire SDK, which works alright but I am lo=
oking to split up the SDK into separate packages with associated do_configu=
re/do_compile/do_install tasks.=C2=A0 For example, I would like to split th=
is into packages that provide:</div><div>* virtual/kernel</div><div>* propr=
ietary-binary-blob</div><div>* soc-kernel-drivers</div><div>* proprietary-f=
irmware-blob</div><div><br></div><div>What I am wondering about is how woul=
d I go about writing multiple recipes that share the same tarball without h=
aving bitbake untar it for each recipe.=C2=A0 Is this even possible?=C2=A0 =
Are there any examples of packages that do this?</div><div><br></div><div>M=
y best guess about how to go about this would be to create a class which de=
fines a do_fetch/do_unpack routine and then for each package, inherit the c=
lass and define custom do_configure/do_compile/do_install routines.</div></=
blockquote></div><br></div></span><div class=3D"gmail_extra">See the gcc-so=
urce recipe and gcc-shared-source.inc.<span class=3D"HOEnZb"><font color=3D=
"#888888"><br>-- <br><div>Christopher Larson<br>clarson at kergoth dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Sen=
ior Software Engineer, Mentor Graphics</div>
</font></span></div></div>
</blockquote></div><br></div>

--001a11c16d429fd8580528100e46--
