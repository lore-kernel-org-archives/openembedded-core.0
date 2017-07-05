Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id ABDBD779F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 15:15:43 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id p21so192355663qke.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=paebj6ATLzhy2iSC0HQ6iOGYyuphGmSgsN8fLXNJwyQ=;
	b=o+sXB2/gNp/w8iyJPxFQxdcvqOW04/1GArrmMVyTGkX5eLIYaHY2vr8ngonNE/AAPX
	nvUbFYMFtxMZ+C8XkXWJ4va4x1jxG8idVMueoKG5NHwkhQQZy9wUukmJNtH+SjLj+MvP
	HViSkqb6N+U4carWd3DciOq+4tzol5DlVoauZTnZR+PHVKF55qWfso5UJ4tPYHQwsoQR
	SZySTsL9GdzPnf75IrVXatgpAVwWhEw6g1ARcrgvDrz5UwQCPuLLyajHCXq1SCOZmxa5
	Qfsj/ZPYVcpDSlw0cVYIu+z/xAsNmCk546k6axjgMDkCqD8yNZGWI7OBYHQW+E8K0Ny+
	NWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=paebj6ATLzhy2iSC0HQ6iOGYyuphGmSgsN8fLXNJwyQ=;
	b=fl9hU1QcPsU3/u0qJpzYnh6xjL4rBqn/tcXOiWTyTfB9mxxFYmteYsZY/1bZdsVBgP
	QUuMc9LY3qFNgDF/wcTkhU3Uw0q+RPR/j5CrVvub1s0KX2xZqe3hD51Y246C7CvoFPYM
	XTvYBGxEFnQRK8y+KKER4J0ulfouX2oHLxkuRfaqBssenuMda/w0OPBVbGxp+5YobC3I
	zA/sChxoiRJExGgoNV1S4G/zYvZCoyIMpehgVq4PycunKw/tN4R5NGuTqe/isruMlgzQ
	s4P7gYrrhDnUit7tryihF6Xhcw7riC2+qAJmCl1RUdvFMQyhkX7jQfZvFcwzKkv18lHh
	1alw==
X-Gm-Message-State: AIVw110n436GwZBw6nCGgcfsOIIBoO7m2ShzCjm+UXXV8mEcXFUy3Bl4
	d2/QYjPgPn5VWflxCZon4nrVUoY2Pxta
X-Received: by 10.55.120.134 with SMTP id t128mr23855485qkc.171.1499267744688; 
	Wed, 05 Jul 2017 08:15:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Wed, 5 Jul 2017 08:15:24 -0700 (PDT)
In-Reply-To: <CAMKF1sospBU00Y4RhShOavZm=eYxrzFXDOhA8JHeiRAvqxnkKQ@mail.gmail.com>
References: <cover.1499241206.git.kai.kang@windriver.com>
	<CAMKF1sospBU00Y4RhShOavZm=eYxrzFXDOhA8JHeiRAvqxnkKQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Jul 2017 16:15:24 +0100
Message-ID: <CAJTo0LZryGcQvFq373ix5VHBrjP5NDzL8-onaX2_s0GnO_m6SQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Introduce a distro feature openssl-no-weak-ciphers
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
X-List-Received-Date: Wed, 05 Jul 2017 15:15:53 -0000
Content-Type: multipart/alternative; boundary="94eb2c05e5d258a0cf05539379a5"

--94eb2c05e5d258a0cf05539379a5
Content-Type: text/plain; charset="UTF-8"

On 5 July 2017 at 15:38, Khem Raj <raj.khem@gmail.com> wrote:

> It's probably more appropriate to pin it at recipe level may be via
> package config OpenSSL is not universal and some may even avoid it
> completely
>
>>
Agreed, whilst I'm not against adding options for enabling insecure ciphers
(verses just disabling them), I don't think they deserve a DISTRO_FEATURE
of their own.

Ross

--94eb2c05e5d258a0cf05539379a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 July 2017 at 15:38, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">It&#39;s probably mo=
re appropriate to pin it at recipe level may be via package config OpenSSL =
is not universal and some may even avoid it completely</div><span class=3D"=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"></blockquote></span></blockquote></div><br=
>Agreed, whilst I&#39;m not against adding options for enabling insecure ci=
phers (verses just disabling them), I don&#39;t think they deserve a DISTRO=
_FEATURE of their own.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--94eb2c05e5d258a0cf05539379a5--
