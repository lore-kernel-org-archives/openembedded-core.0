Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA996ACD6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:16:40 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id w7so3779399lbi.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 03:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=m5NEMl4RoHZzkIGNYMC7lTlpI40q91NDy01bx1Ss+lY=;
	b=Q+IHCl2hxdutt2s0R+KMen0uvVxM1IzIj97vG1r/+/epXLqoDSsh+dhugQNiuOhXmN
	0iUO6vneoR7kWGihecb1Uv7C4ejMxZgnXxJH/bTzFc1PXQhUGw/7fkTKevTsFEYEp894
	zY2kXLWMZv3tVfkOsS3PfOv3P18K1uDVJOGyH0dfoQ1OH6un83Rv3QzeSs/JYs4raVf4
	LoT9N90+xXGQYqrtVWf6gH52bEq+nW0OSHxwU6v8OgI8nmvVhRn2QauDbC2L0Gu/dTU+
	0t/40Kv1jy00t81ekSzVGl93vyZBhjS57kmkL9jBHdB4Q8Wid7RidmjVERvlRv/Gc3OE
	zUmw==
MIME-Version: 1.0
X-Received: by 10.152.26.37 with SMTP id i5mr25147046lag.17.1405937801350;
	Mon, 21 Jul 2014 03:16:41 -0700 (PDT)
Received: by 10.112.26.210 with HTTP; Mon, 21 Jul 2014 03:16:41 -0700 (PDT)
In-Reply-To: <1405908237-7560-1-git-send-email-Chong.Lu@windriver.com>
References: <1405908237-7560-1-git-send-email-Chong.Lu@windriver.com>
Date: Mon, 21 Jul 2014 12:16:41 +0200
Message-ID: <CAPbeDC=0Sq_wM-pAZtxgXQdM6m_89RH-r0bV5HwVdEXhiA-fNA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] perf: split package
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
X-List-Received-Date: Mon, 21 Jul 2014 10:16:46 -0000
Content-Type: multipart/alternative; boundary=089e0160a47639d3f804feb16728

--089e0160a47639d3f804feb16728
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 21, 2014 at 4:03 AM, Chong Lu <Chong.Lu@windriver.com> wrote:

> Currently, perf can't split to perf-archive, perf-tests, perf-python and
> perf-perl. All files are included in perf package.
> Change the files paths to make split successfully and add perf package
> RDEPEND on the other four to keep it consistent.
>

Could it be that this is depending on which kernel version is building ?
I'm using Freescales 3.10.17 kernel, and my perf packages do have perl
scripts in perf-perl, python scripts in perl-python, etc.

/Jacob

--089e0160a47639d3f804feb16728
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Jul 21, 2014 at 4:03 AM, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;=
</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Currently, perf can&#39;t split to perf-arch=
ive, perf-tests, perf-python and<br>
perf-perl. All files are included in perf package.<br>
Change the files paths to make split successfully and add perf package<br>
RDEPEND on the other four to keep it consistent.<br></blockquote></div><br>=
</div><div class=3D"gmail_extra">Could it be that this is depending on whic=
h kernel version is building ?<br></div><div class=3D"gmail_extra">I&#39;m =
using Freescales 3.10.17 kernel, and my perf packages do have perl scripts =
in perf-perl, python scripts in perl-python, etc.<br>
<br></div><div class=3D"gmail_extra">/Jacob<br></div></div>

--089e0160a47639d3f804feb16728--
