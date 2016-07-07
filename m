Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id C5C896013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 09:54:05 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id j185so96063278ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Kltus7oi2mQmB2k0n5okvR6DDMdlOcrhx2jS8Yfp87k=;
	b=mp+fRpiSl52r5oM7fRmqfaXEnDiXwxvwC3mC66fQ9PqMVvcxrEKG9Cbzr2++JcJrj/
	eSfBcNDze7wCMphMnnRuAhIqYh9yUrR+AU4zu4wLA3j4+3SYCRXjnZubMNpqyLhR5QQ8
	zAVIBud0BufHfWQlAKQmD3pLt0S4iO9yePoFTlq28RZAtNaq7IQMo9DB185e3D5AmKAK
	gx7noaUiTYmjGqPZMbjdqKGDdjvdCdrSVFjOAkLtHEKRhp4J3kfNBvrbXCG8EfXyVp2f
	OWQDZDb4JsaBc6zUwyc2HqhJ1C5OUKJheRMDK4w9B81Xb8J0r2vyo+PNpRp72sVaQyCK
	H8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Kltus7oi2mQmB2k0n5okvR6DDMdlOcrhx2jS8Yfp87k=;
	b=EErsqjg0LmNP01k6YHvIwYEBMJBCsI+XialTCQ+e9G61wy4pB/UOlBLPZkU7TpnfuJ
	Xp7kZPAkNKnMwbp0UFML4ZyAACxQzqw9qrbX6tnbQm957Yvq4wC5/ZIIFQEZ4wy4cmVC
	IfYEXLhU318aN1A+ZCowaU68VIkHRbwBiI0nqIbRb979VSiF2DomE1Scc30Msn6/PNuG
	ZqpgGCSKYrWvWuW9qQEo1yRX933CDdqmOJ1tiqYsUrc2oZww73g+tYQNR+WTjuhIxKOi
	seu+NYjeEUVgeyBIInUPqGNDOqCeb75iD1xHojHTXzSSUHilObmer31J+JmpnFX6DkhJ
	GYHQ==
X-Gm-Message-State: ALyK8tIP0m/H/+KdTRG578U9tCJbadDwdmPRKR94jUd1mTX07e3V0iMD+QJXEejAn3ZbT11bhvuVKmI9D6HEvkcr
X-Received: by 10.36.20.212 with SMTP id 203mr23393347itg.83.1467885245131;
	Thu, 07 Jul 2016 02:54:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Thu, 7 Jul 2016 02:53:45 -0700 (PDT)
In-Reply-To: <CAJ86T=USf+vf3xe-J6yNw97Ro9oKbMjjv9dOF5-5JpA_Vt7Lzw@mail.gmail.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
	<102523f6b96c68522c940a9c004ce5fc3f977f7b.1467855356.git.liezhi.yang@windriver.com>
	<CAJ86T=USf+vf3xe-J6yNw97Ro9oKbMjjv9dOF5-5JpA_Vt7Lzw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jul 2016 10:53:45 +0100
Message-ID: <CAJTo0LaRh6d67+eKrcGA2fQSxeR06-xQd7tB7xs_4_kx4FRakw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] e2fsprogs: 1.43 -> 1.43.1
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
X-List-Received-Date: Thu, 07 Jul 2016 09:54:06 -0000
Content-Type: multipart/alternative; boundary=001a1143e1989b9a18053708aaa8

--001a1143e1989b9a18053708aaa8
Content-Type: text/plain; charset=UTF-8

On 7 July 2016 at 08:54, Andre McCurdy <armccurdy@gmail.com> wrote:

> Based on the e2fsprogs release notes, v1.43.1 adds a new configure
> option, --enable-hardening
>
>   http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.43.1
>
> It might be nice to either enable that by default, or provide a
> PACKAGECONFIG to control it (and in either case, verify that it
> doesn't conflict with security_flags.inc).
>

I'd lean toward enabling by default and then nullifying security_flags,
assuming that the latter is effectively the same as the former, considering
that the flags are supported upstream.

Ross

--001a1143e1989b9a18053708aaa8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 July 2016 at 08:54, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":4w4" class=3D"a3s a=
XjCH m155c45ac580442a6">Based on the e2fsprogs release notes, v1.43.1 adds =
a new configure<br>
option, --enable-hardening<br>
<br>
=C2=A0 <a href=3D"http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1=
.43.1" rel=3D"noreferrer" target=3D"_blank">http://e2fsprogs.sourceforge.ne=
t/e2fsprogs-release.html#1.43.1</a><br>
<br>
It might be nice to either enable that by default, or provide a<br>
PACKAGECONFIG to control it (and in either case, verify that it<br>
doesn&#39;t conflict with security_flags.inc).</div></blockquote></div><br>=
I&#39;d lean toward enabling by default and then nullifying security_flags,=
 assuming that the latter is effectively the same as the former, considerin=
g that the flags are supported upstream.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a1143e1989b9a18053708aaa8--
