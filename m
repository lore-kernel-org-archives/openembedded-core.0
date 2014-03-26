Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id F1AEE6F464
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:41:06 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id q8so1671746lbi.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=WJg/hmdVMdqe4NalE6E1echwi0S8p1yLMJeALF4BFg8=;
	b=vhbK0RdOwGRP8rw3OIwfCEWGFscorX+yPlbsERRJHaLKHVI9v/Y2UsWOqHXR09XN8d
	4ld7fEHB2x7YDGPpDbceoa0AYptmU27hGI4jxtJCj4LkewS49JfKLTVDvmZLP3q9yB9p
	X0PRnAj2EW/Y3mrelxTS+yYA9UdkSG0BSuW8NABE04zsZAnyfqB2BpqVB3UmyqcMPwES
	m2CC7e/i72B00twIDCm1Y5LZJwOUFy9DjJQBSwgT/JXAN+eypJVt/dX3Thip7uL/VQDb
	NDsMGUXbpL4vrgK+47UIoJV0XijAu+IB6KA3uSc5bRTErpCCC8CqOcFwODctsA6DKtw6
	Eu1Q==
X-Received: by 10.112.56.148 with SMTP id a20mr1914009lbq.44.1395848466321;
	Wed, 26 Mar 2014 08:41:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Wed, 26 Mar 2014 08:40:46 -0700 (PDT)
In-Reply-To: <20140326145102.GB3709@jama>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<20140326145102.GB3709@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 26 Mar 2014 08:40:46 -0700
X-Google-Sender-Auth: vSJ97EfrfxNHFXh1s-uEkh81BpY
Message-ID: <CABcZAN=qBmEp4nzWwKc0=3_sb_oPk1mUWqP-M3Y8tQ6xRZJB0w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] Change all bluez4 references to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 15:41:08 -0000
Content-Type: multipart/alternative; boundary=001a113393c8fed4d604f5844bba

--001a113393c8fed4d604f5844bba
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 26, 2014 at 7:51 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Mar 26, 2014 at 09:27:54AM -0500, Lauren Post wrote:
> > This group of patches support the change of hardcoded bluez4 to
> > virtual/bluez so that the upgrade to bluez5 is easier.
> >
> > This group of patches must be applied together.  Bluez4 is still
> > default provider but it will be easier to override and provide bluez5
> > support in future.
> >
> > Note there is one related patch for openobex in meta-oe.
>
> virtual/* still doesn't work correctly in runtime variables, use
> VIRTUAL-RUNTIME_bluez variable.
>
> Last time I've asked for bluez4->bluez5 upgrade path fix on target I was
> told that it's not supported and bluez5 isn't drop-in replacement for
> bluez4 (yet), did that change already?


Afaik libbluetooth is API compatible, but the dbus api isn't. I haven't
done much runtime testing, though. So I don't think virtual/bluez is an
appropriate name given they aren't 100% compatible bluetooth implmentations
across the board. In meta-mentor, we moved to a combination of two
virtual-runtimes (for flexibility, to facilitate replacement not just with
bluez5, but also potentially with a third party implementation, two
virtual-runtimes, one for hardware support, one for the userland bluetooth
stack, (and potentially others in the future)) with a virtual/libbluetooth
build virtual, and then you need to ensure obexd/hcidump are left out of
the build, since they were merged into bluez5.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113393c8fed4d604f5844bba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Mar 26, 2014 at 7:51 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Wed, Mar 26, 2014 at 09:2=
7:54AM -0500, Lauren Post wrote:<br>
&gt; This group of patches support the change of hardcoded bluez4 to<br>
&gt; virtual/bluez so that the upgrade to bluez5 is easier.<br>
&gt;<br>
&gt; This group of patches must be applied together. =C2=A0Bluez4 is still<=
br>
&gt; default provider but it will be easier to override and provide bluez5<=
br>
&gt; support in future.<br>
&gt;<br>
&gt; Note there is one related patch for openobex in meta-oe.<br>
<br>
</div>virtual/* still doesn&#39;t work correctly in runtime variables, use<=
br>
VIRTUAL-RUNTIME_bluez variable.<br>
<br>
Last time I&#39;ve asked for bluez4-&gt;bluez5 upgrade path fix on target I=
 was<br>
told that it&#39;s not supported and bluez5 isn&#39;t drop-in replacement f=
or<br>
bluez4 (yet), did that change already?</blockquote></div><br>Afaik libbluet=
ooth is API compatible, but the dbus api isn&#39;t. I haven&#39;t done much=
 runtime testing, though. So I don&#39;t think virtual/bluez is an appropri=
ate name given they aren&#39;t 100% compatible bluetooth implmentations acr=
oss the board. In meta-mentor, we moved to a combination of two virtual-run=
times (for flexibility, to facilitate replacement not just with bluez5, but=
 also potentially with a third party implementation, two virtual-runtimes, =
one for hardware support, one for the userland bluetooth stack, (and potent=
ially others in the future)) with a virtual/libbluetooth build virtual, and=
 then you need to ensure obexd/hcidump are left out of the build, since the=
y were merged into bluez5.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a113393c8fed4d604f5844bba--
