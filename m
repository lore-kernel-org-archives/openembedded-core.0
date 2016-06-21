Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7C63F60797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 15:59:23 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id l81so3841944qke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=1vvKKJuSAvYu0yuup1bu/gxkfz9slXE7a6RLr+taKSg=;
	b=EGU+YsE0BnK/VK+Bzn5CLxVauX8SUwmvRlJ6fUh0r7kRMh3ka/jDMwIPlkeWiteFmR
	ekCp87h9jj5y7TlWsS5qoTDFGGU5SwweerTGR+reTx9KOay5skEHcJiOe5/w69HoGn3/
	AEElkC0Jw0inDZxrOoBs03oqVYP0RiYCsfhSRvNz4kIi5tyrYJBxJQY1GxarAPh0f6ij
	WsLP5USewlPJp/dZHwY018eR7wMbRNaDYoqNDJIK2A/HZMwdRxhQOM1KMuQGGIzAJXt8
	rCGmn/Zz6lBPDOm5OjU0dHAAmRIeXIY7+EIjv5i/MKNxTvo7NQ5PXBfN6UgBJA2EdQvQ
	Zl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=1vvKKJuSAvYu0yuup1bu/gxkfz9slXE7a6RLr+taKSg=;
	b=lvrnid1CFpUlGs7IIM2O/GndgqRkSXszFJ5Zjc5M02O1vR+EG/cGtYeFAwSeFD4kFR
	GEfoM2pcnyXZGQBPclnxdrqgDa/T9BjyPQEYO7WBeuyW/VnxsRcRIRudBCMCAnfLsqhZ
	GLmeizayPOEKuItO6bPsk6ywKZ04pINNgm0ibxiTojigeWfi7T1ifiq3fddMnAMHzdsw
	HASDkzVIEsBuNhov4apmVbnVHPUd+bS1IU4g8pSU1YA2fpxlilpiIKN43aVrcB1W7yhg
	a59C+HzQjVN2DwawypBWzKBMJ0DXzm05T91cxmS138q0UNarerKjgRRNS3jb+laBbQhM
	IwFA==
X-Gm-Message-State: ALyK8tKdOPpzcm5aguU+3yAsy7yM8kdk0/M4wMwC63mizgOR2rbOSR0fbsgAH6b6H2GjLuMFj5kxw3lo2VAkGQ==
MIME-Version: 1.0
X-Received: by 10.200.49.50 with SMTP id g47mr30489521qtb.76.1466524764669;
	Tue, 21 Jun 2016 08:59:24 -0700 (PDT)
Received: by 10.55.8.133 with HTTP; Tue, 21 Jun 2016 08:59:24 -0700 (PDT)
Received: by 10.55.8.133 with HTTP; Tue, 21 Jun 2016 08:59:24 -0700 (PDT)
In-Reply-To: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
References: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
Date: Tue, 21 Jun 2016 08:59:24 -0700
Message-ID: <CAMKF1spPd9sX7DmuLtzOuYuQT+jRgZhze6hCiNWwbW2-U_MytA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Add qemuppc64 target
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
X-List-Received-Date: Tue, 21 Jun 2016 15:59:25 -0000
Content-Type: multipart/alternative; boundary=001a1143a4dea70c0c0535cbe7ae

--001a1143a4dea70c0c0535cbe7ae
Content-Type: text/plain; charset=UTF-8

Can you also see if usermode qemu needs to be changed for ppc64 as well
On Jun 21, 2016 7:39 AM, "Armin Kuster" <akuster808@gmail.com> wrote:

> This is step 1 in support of Yocto bug 9778
>
> Boot tested on Ubuntu 14.04 (qemu 2.0)
>
> Armin Kuster (3):
>   machine: add qemuppc64 machine
>   linux-yocto: add qemuppc64
>   runqemu: Add qemuppc64
>
>  meta/conf/machine/qemuppc64.conf             | 13 +++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb | 22 ++++++++++++----------
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb | 22 ++++++++++++----------
>  scripts/runqemu                              |  9 ++++++---
>  scripts/runqemu-internal                     | 24 ++++++++++++++++++------
>  5 files changed, 61 insertions(+), 29 deletions(-)
>  create mode 100644 meta/conf/machine/qemuppc64.conf
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143a4dea70c0c0535cbe7ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Can you also see if usermode qemu needs to be changed for pp=
c64 as well</p>
<div class=3D"gmail_quote">On Jun 21, 2016 7:39 AM, &quot;Armin Kuster&quot=
; &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; =
wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This is step =
1 in support of Yocto bug 9778<br>
<br>
Boot tested on Ubuntu 14.04 (qemu 2.0)<br>
<br>
Armin Kuster (3):<br>
=C2=A0 machine: add qemuppc64 machine<br>
=C2=A0 linux-yocto: add qemuppc64<br>
=C2=A0 runqemu: Add qemuppc64<br>
<br>
=C2=A0meta/conf/machine/qemuppc64.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 13 +++++++++++++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.1.bb</a> | 22 ++++++++++++-=
---------<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a> | 22 ++++++++++++-=
---------<br>
=C2=A0scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++++++---<br=
>
=C2=A0scripts/runqemu-internal=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++++++++++++++++++------<br>
=C2=A05 files changed, 61 insertions(+), 29 deletions(-)<br>
=C2=A0create mode 100644 meta/conf/machine/qemuppc64.conf<br>
<br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a1143a4dea70c0c0535cbe7ae--
