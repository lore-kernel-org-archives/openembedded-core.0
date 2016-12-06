Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 92EC371A19
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 14:37:04 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id c47so347739583qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 06:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4vhNpbPU3gHwhZGgPTCdXXL7TMSWirBQxwnRh/GBKBg=;
	b=esPhus70h3is14pVc2N3dUHeXX/SF5cWEsnyhipKlIIcUyFdO9ueztC59tAISHmJrV
	fVXT5W44Akyv4+gu7IV7dmndgdz85F0FSMTiaBpKzzdRaD5ONJ+Ecbc6f5vrT8Xh6898
	ar9qertxga6DlMQBZi4YlEI3UGEUtneCNU/5O8K6ysM8+zSK4XyLwYoSYVCxjE8euwze
	j4G+1KHUDfyyV9euE9WbFupSA0g+5ZHS4x8xQ4g+rSkSZ+U/ktae8lbcO7TwqmwVhmlY
	J73FDX1PGRD2lLm0NrDWe9ihlKyCPoGdmZzd4tbyLcOYhn5Ty3z0Xh23CuHwbCEhrPZC
	AD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4vhNpbPU3gHwhZGgPTCdXXL7TMSWirBQxwnRh/GBKBg=;
	b=OO+zseX1WipDUmtIpoGB/yS8OnnUxyroMBrtSuxZKK+THdMbpa9ir66xpHqrr4mhg1
	UdPpWzbweMAgwEvatsBs32od848aW3Geae7j8jSh35LpcsbXTL6GIN5jwD4K+3URRwCg
	3+5oOWkh4eS0jyINEhhbtPAXMJxSELCkGOx7d3EPq70gmxV0TLDZawBvW8b7NJe5C4o4
	L1RDd6Wtr5fPspH22kMAeuwIBFRENWQBtJAVa185QTD6oOOW5pihPHsEvFX9Wxsi9a1R
	msL8pniynzVzMwlaYcoOGYw5ZVMDalAaO00jJbKQy/n+Do5Rd332SBYfwXK1ixyqmr2b
	7cgA==
X-Gm-Message-State: AKaTC02jSs+dJ4cPx5OTYQGpS8PtX0uKoSaQmGW8fcltrk94RJPLfvnxV4O95ABzOiO976voR3smRM8PWNTLkRT6
X-Received: by 10.200.57.54 with SMTP id s51mr53731630qtb.68.1481035025356;
	Tue, 06 Dec 2016 06:37:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 06:36:44 -0800 (PST)
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 14:36:44 +0000
Message-ID: <CAJTo0La31Co0vhNd6bKwubxMOO_qD=-Uh2yi_oLYCumennVXFg@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/33] Accumulated patches for deb packaging
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
X-List-Received-Date: Tue, 06 Dec 2016 14:37:05 -0000
Content-Type: multipart/alternative; boundary=001a113a01e89666440542fe5605

--001a113a01e89666440542fe5605
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org>
wrote:

> These are most of my patches which accumulated since our distro
> switched from opkg to dpkg and apt two years ago. They were tested
> thoroughly on dora and krogoth and just a little bit on master.
>

Is this on a branch somewhere?

Ross

--001a113a01e89666440542fe5605
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 11:49, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2gf" cla=
ss=3D"a3s aXjCH m158d3f91d007e6d9">These are most of my patches which accum=
ulated since our distro<br>
switched from opkg to dpkg and apt two years ago. They were tested<br>
thoroughly on dora and krogoth and just a little bit on master.<br></div></=
blockquote></div><br>Is this on a branch somewhere?</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a01e89666440542fe5605--
