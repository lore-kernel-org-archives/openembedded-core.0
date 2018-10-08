Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4C01E79976
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 15:39:39 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j9-v6so20290995otl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 08:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QRt3kNg1PYIW5tJ3cQ9QdDjtqRuTi8vxLQrAw5ETZCs=;
	b=P87IN3ZiSs3kvtOZnRgDULRRsc8b9hbPsmUmcSMRNioiRy9WKeMRtxJfaIEosYRtIJ
	uoqNWPBr+O+YAf/S6VWotdQARqIwvyLZONzv7BHxmMdAdjvhusOYnymLcCZQrFZB1+Xv
	jPr1YU1dM4qpnbhO38AchNHKKq/KxlpgCT10bUAN3gb3BtO/xl0CDYS3BPmXLOxhnVbe
	cdzs7aL1y9FM02SADaWTW2h++lU00DKO3QHWeyZuBOWtkOqJfLtmXvayCemuFZf/bUBX
	m6rxOD2I3hrH5wb9QHxE+CAwu+sVPtALBbzAW+pI+F0zXhfPvPBKw/FSO/+izGspTddr
	AT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QRt3kNg1PYIW5tJ3cQ9QdDjtqRuTi8vxLQrAw5ETZCs=;
	b=GuvV2KuZa+6eALwYh9DoAzOBOn1FfEBLehViEbbVtstAcWKTxqeaDhjzefsJ8AbJxQ
	b/SIs2cezfJ/sT9AGJ2KrxdInuavzQYE10951dhxmUVBY9QjP0MeHFW4g5vM2diFhZT8
	2Yu1hbe9ZE7Jf0cF0RukogF15JD0Q2VCz7FEYJidtm3mRvYjcqEkc+99OMd1SGt3BZHq
	bnnB5+F5UqwaAPxRgAANkk1QHwS0LEDW6ZftZuFEKg66sWdvDWFS9N7ugtRyj/3F+wGt
	EE4D6DjLnI7XtwXQYxZOF3bXcrSxCZQOVIDX877K+ZJpAbXDqUjGIfWVfJ5lVoRbc2+2
	V00A==
X-Gm-Message-State: ABuFfojhe/3hSJ841U7EWiJyRU4+mqsIrW8Q2sDJaiKb25Yk+2WfcB//
	Ped+3/O/5+75i2DN9PM/Xl2uLN+UgLIfmXiPUBaSug==
X-Google-Smtp-Source: ACcGV62MuTRjtdxhfeAkz3E0X0kxu6aYGlCEhiREl4OFg5wJp7FEyre6DaleRrwinXMkCiBlf5xonSDhKauvpf06r2o=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr6530404otg.8.1539013180252;
	Mon, 08 Oct 2018 08:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20181004104147.14644-1-andrej.valek@siemens.com>
	<CA+chaQfiSfhTgs2aJhgy3wNF5nMjiy2AsnGjYMepgk5vaaHjEA@mail.gmail.com>
	<976efb5d-cd95-31ae-bad0-b3f5073eab55@siemens.com>
	<20181004112755.GA1356@jama>
In-Reply-To: <20181004112755.GA1356@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Oct 2018 16:39:28 +0100
Message-ID: <CAJTo0LYo-+Cn47mP8rHvqEb51jcD+Np_hnPubs9YW4Z0YmOUzg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: fix conflict with runlevel applet
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
X-List-Received-Date: Mon, 08 Oct 2018 15:39:39 -0000
Content-Type: multipart/alternative; boundary="000000000000ea07820577b96d27"

--000000000000ea07820577b96d27
Content-Type: text/plain; charset="UTF-8"

On Thu, 4 Oct 2018 at 12:28, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Thu, Oct 04, 2018 at 12:59:37PM +0200, Andrej Valek wrote:
> > This init feature was introduced via
> >
> http://lists.openembedded.org/pipermail/openembedded-core/2016-January/116109.html
> > which is from 2016. Busybox has this runlevel applet available from 2005.
> >
> > I think, Raj was trying to make this system really tiny. So, I am not
> > sure, what would be the impact, if we dropped this runlevel script.
>
> OK, fair enough. I don't use busybox init anyway.
>
> I was just curious, because there is also runlevel from upstart which we
> were
> using (and I have u-a for runlevel in busybox.bbappend because of that).
> So I was surprised that there is actually 3rd implementation as OE
> specific shell script.


Khem, do you have an opinion?  I suspect that shell script including
comment is longer than the compiled size of the runlevel applet in
busybox...  We could simplify by just having the applet and removing that
runlevel stub.

Ross

--000000000000ea07820577b96d27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, 4 Oct 2018 at 12:28, Martin Jansa &lt;<a href=3D"m=
ailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Oct 04, 2018 =
at 12:59:37PM +0200, Andrej Valek wrote:<br>
&gt; This init feature was introduced via<br>
&gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2=
016-January/116109.html" rel=3D"noreferrer" target=3D"_blank">http://lists.=
openembedded.org/pipermail/openembedded-core/2016-January/116109.html</a><b=
r>
&gt; which is from 2016. Busybox has this runlevel applet available from 20=
05.<br>
&gt; <br>
&gt; I think, Raj was trying to make this system really tiny. So, I am not<=
br>
&gt; sure, what would be the impact, if we dropped this runlevel script.<br=
>
<br>
OK, fair enough. I don&#39;t use busybox init anyway.<br>
<br>
I was just curious, because there is also runlevel from upstart which we we=
re<br>
using (and I have u-a for runlevel in busybox.bbappend because of that).<br=
>
So I was surprised that there is actually 3rd implementation as OE<br>
specific shell script.</blockquote><div><br></div><div>Khem, do you have an=
 opinion?=C2=A0 I suspect that shell script including comment is longer tha=
n the compiled size of the runlevel applet in busybox...=C2=A0 We could sim=
plify by just having the applet and removing that runlevel stub.</div><div>=
<br></div><div>Ross</div></div></div>

--000000000000ea07820577b96d27--
