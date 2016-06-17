Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 970F8731E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 16:55:24 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id s63so9973103ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 09:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=N4Oth6q9EPQOQdbVpm40HrpZqnhlb44LNinN3aPyhgA=;
	b=f/yYbErP53AUKFcPrsf6EWxsFiT2Zs0JM7kg3su6aEv70XRutHvXByaALWr7ISEH6t
	m+RMR6IkeOE+Ub12KD/DhBO3fCj/OoGi5fh8W6nYhBHCrWLfZDOsNTuFdWRvZgJQvv+N
	z0Fu2SWDjwAG4oY96hc/Myy2kVj6tGasbQPrnS5dz6Wyw1baL646p2B2fqLjJI8Ou7Cf
	Co1mfv25pnz7h381uupZHLn6tNzmoDlYRYlago534fhKmIDWw4heNrcUzEa34k7KP18l
	HgJ9PSkMnjS4cgDSJ+YCSnhz9zpcKR9udV5M41KhJH8oIlFWFk/YW5qpveTCzPDqliii
	kMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=N4Oth6q9EPQOQdbVpm40HrpZqnhlb44LNinN3aPyhgA=;
	b=UHYO2lQyYBhkzi/V6ddWB7wR1wF3J5ELTIx6S4WVl6v8xvkMFTYfVfWYbhJRs9apLb
	RfjHfyVVXb1Z+b9vqyCIUw6RKoOXbb9cFPVmwBW1ZUMYRmdJvxzvpxL0/ZseAzu7Y4GU
	C5zw82uqh+s5/F2n+y0gbBirjyVRnIRqzxJvxOw5RdmAhcU4lGvAXGmwJAEpG41fjXaX
	TYBnDZztbmepXkUxzjVS1/mf1INkpzQP4+cBKGGq6FvInRj6TV4XoekBRJSHoy+lBic9
	9YfOwmHAIUWvfKLN8pBtiAD1E6nLBesqx3iW1Z3SIgrvm9mrYsWQlt2vtLNZ/MCpqcHY
	l1MQ==
X-Gm-Message-State: ALyK8tLr4yELc1/KkEMuVtKb9Qw4YG3FGDG3pzJ25g1A5hC4Pr2oBu7b3PuCvg5WpCkhzfBuFnN0PPvCFbKbeg==
X-Received: by 10.107.131.212 with SMTP id n81mr4864471ioi.126.1466182524731; 
	Fri, 17 Jun 2016 09:55:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Fri, 17 Jun 2016 09:55:05 -0700 (PDT)
In-Reply-To: <1466178443-553-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1466176636-18307-1-git-send-email-ed.bartosh@linux.intel.com>
	<1466178443-553-1-git-send-email-ed.bartosh@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 17 Jun 2016 09:55:05 -0700
X-Google-Sender-Auth: lRZqZvaXsoSV0l3WU8vg2139z7Q
Message-ID: <CABcZAN=DmR-JwJwuaoonsEqVr=P5ZNG4G_iQ2w+kuBUnxVWw7g@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pseudo: remove rpath from libpseudo.so
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
X-List-Received-Date: Fri, 17 Jun 2016 16:55:26 -0000
Content-Type: multipart/alternative; boundary=001a113ec32e90079305357c38a4

--001a113ec32e90079305357c38a4
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 17, 2016 at 8:47 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> Setting rpath causes clash of host and sdk libc and makes
> pseudo to crash with relocation error: libpthread.so.0:
>     symbol __libc_vfork, version GLIBC_PRIVATE not defined
>     in file libc.so.6 with link time reference
>
> Removing rpath fixes this as it makes pseudo to use only host
> pthread and libc.
>
> [YOCTO #9761]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>


Thanks for your work on this, sorry about the hassle (it was my pseudo
ldflags patch that broke it, unanticipated consequences).
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ec32e90079305357c38a4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jun 17, 2016 at 8:47 AM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">Setting rpath causes clash of host and sdk libc and makes<br>
pseudo to crash with relocation error: libpthread.so.0:<br>
=C2=A0 =C2=A0 symbol __libc_vfork, version GLIBC_PRIVATE not defined<br>
=C2=A0 =C2=A0 in file libc.so.6 with link time reference<br>
<br>
Removing rpath fixes this as it makes pseudo to use only host<br>
pthread and libc.<br>
<br>
[YOCTO #9761]<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;</span></blockquote></div><br>Thanks for=
 your work on this, sorry about the hassle (it was my pseudo ldflags patch =
that broke it, unanticipated consequences).</div><div class=3D"gmail_extra"=
>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">C=
hristopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenE=
mbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Ment=
or Graphics</div>
</div></div>

--001a113ec32e90079305357c38a4--
