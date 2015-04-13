Return-Path: <kergoth@gmail.com>
Received: from mail-vn0-f54.google.com (mail-vn0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id B67D373D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 16:07:36 +0000 (UTC)
Received: by vnbg190 with SMTP id g190so21162573vnb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=u5MBS4va54fbZaMlqlqTn4mJGVg3+LLdXE7S5lAzJxo=;
	b=s8tIFB3TrsBQKA7OIhyxUoEsn5dUBqmiiOrEE6AJGQIcYHDkUssWZhxKnPHblQLSy1
	Tbgk6qaECVbRfg2LRkTFJfXDGTzkW9Hbdmrsk9ns8a7vXqvUphNsvDMtsXVSJRLOwpkG
	l4Dr8BvMjQOJa1lHHjcl2DuLbVU3P2uM7mJSk4yADKfp3uB9CxlgenK98XKeWh+vdNWO
	ExczTHSB78Qy4CxTs6Of8Rl2sule3GCiiUHsomCVwSGMigpHtju/nlJ7rjP1cvcCOnUT
	zvjlOrUG9wPy78uzjSYjEP2d7DNyurg6zeesv4pf8VwGq8yepCaDZw++BfgE7JeiN5Yb
	YWfw==
X-Received: by 10.140.49.11 with SMTP id p11mr18636974qga.60.1428941257305;
	Mon, 13 Apr 2015 09:07:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Mon, 13 Apr 2015 09:07:17 -0700 (PDT)
In-Reply-To: <e03e02a4abdec92544b1f32e759ce378c80bf2c5.1428939671.git.patrick.ohly@intel.com>
References: <cover.1428939671.git.patrick.ohly@intel.com>
	<e03e02a4abdec92544b1f32e759ce378c80bf2c5.1428939671.git.patrick.ohly@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 13 Apr 2015 09:07:17 -0700
X-Google-Sender-Auth: Mn_IYqVVLSCBxYwYlYCSBSJQ9r8
Message-ID: <CABcZAN=54ffzEd5u7926uqXde8ecamQuQv2h34S+DRdF4KPNdw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] rootfsdebugfiles.bbclass: quick-and-dirty installation of additional files
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
X-List-Received-Date: Mon, 13 Apr 2015 16:07:38 -0000
Content-Type: multipart/alternative; boundary=001a1135250e0bf46d05139d50d4

--001a1135250e0bf46d05139d50d4
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 13, 2015 at 8:44 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> The main motivation for this class was the observation that
> a) a core-image can hang under qemu when the kernel does not
>    have enough entropy to generate the ssh host key
> b) ssh complains about changing ssh host key files when
>    rebooting the same machine with different images
>
> For debugging it is okay to reuse an ssh host key generated on the device
> before. There may be also similar use cases, so the class is generic
> enough to
> also copy more than one file or directory, with dropbear_rsa_host_key
> given as
> example.
>
> The documentation and naming of the class makes it clear that it
> should not be used for production images.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>

Freescale's merge-files recipe may be worth looking at as an alternative to
this.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135250e0bf46d05139d50d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Apr 13, 2015 at 8:44 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a href=
=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":30c" c=
lass=3D"a3s" style=3D"overflow:hidden">The main motivation for this <span c=
lass=3D"il">class</span> was the observation that<br>
a) a core-image can hang under qemu when the kernel does not<br>
=C2=A0 =C2=A0have enough entropy to generate the ssh host key<br>
b) ssh complains about changing ssh host key files when<br>
=C2=A0 =C2=A0rebooting the same machine with different images<br>
<br>
For debugging it is okay to reuse an ssh host key generated on the device<b=
r>
before. There may be also similar use cases, so the <span class=3D"il">clas=
s</span> is generic enough to<br>
also copy more than one file or directory, with dropbear_rsa_host_key given=
 as<br>
example.<br>
<br>
The documentation and naming of the <span class=3D"il">class</span> makes i=
t clear that it<br>
should not be used for production images.<br>
<br>
Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com">p=
atrick.ohly@intel.com</a>&gt;</div></blockquote></div><br>Freescale&#39;s m=
erge-files recipe may be worth looking at as an alternative to this.<br>-- =
<br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth=
 dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tsl=
ib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1135250e0bf46d05139d50d4--
