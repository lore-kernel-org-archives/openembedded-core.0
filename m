Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id EB65270178
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 17:10:22 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id n195so6786473itg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wDuJES8+ApqXlBk5IpK1fDap063yzCJbirdBQ6yMBRc=;
	b=HOQElN49KdycqFHsnlVuvy/BUUrCSrjB5XF6flKlBblr78EvrUTdKBBITeT+/vQFTy
	17A/IV/SUfUrkGaTig0po9aW1/WGgtBYlTOhJP1OfqZwqHhTZ760sqPRXYe/stbZPUWI
	6ONOQ8ogfykG5A4VMwUhjCEwdp8mNRjxNu0GHxaCCr8gWPGT+Frnr+gScZpcArJK0rRd
	rNCXQxh0L4BsEHm6Rnn13CDKJ9EAY521/11tXG5KnEo9j3JKXxd8Q1/MYy5N3RfN0/LS
	S0K3UZQEaY4D1t+w9WiKhZB51PK+tdZXsJOGFqkdfKevTQTuoimXxvH24sdzCBs3Oln5
	dNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wDuJES8+ApqXlBk5IpK1fDap063yzCJbirdBQ6yMBRc=;
	b=BVgT93nr5KGqCkZPuyqehYl8zdQ7ti2BTtFZc+v56Fnk1q0HPeLcr826WTq/Wh158F
	QUXxNTfO83GC5LAgSEqo2L6nEWU6ZDI0SilolGlHwF9duCKF70GLxQKNqg/8XXxYQo+y
	B7D/RrtOSOiZuGmS/Dft5Qa411OeWp932Mva6GDkc6zzWImsX+hal7gjg+h/yb5H2Hks
	iDlOidsj0mFd869+PnCfcwUT2V2ha8FhXrxgFbobxnQx4RinsLSZjiw5l6wkpqQlhBdN
	s4TC9nMmzyganXb4+eBwW+fD29J9bgFBXLCio32634jR1+FVohvx1uomINNYstbpsElD
	Hxhg==
X-Gm-Message-State: AMCzsaXAbSImInta7Mz7BvMI1aSkFG1w/bRA7aNm9Zt9P4uCGJXQAS/3
	AGmTsZhHzsgeX6G1wkuLYKPJ81yYZYf+yhz1O40wCw==
X-Google-Smtp-Source: ABhQp+S4DClDXaT9T6SZEOVy1QB6B+Fe8uS3n7cv4yEwu+zcC/Rkj67LRknwOl5+mp9o3wLDg+1Z3SpM3Dj4sf9blRw=
X-Received: by 10.36.81.21 with SMTP id s21mr10220849ita.144.1508778623966;
	Mon, 23 Oct 2017 10:10:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Mon, 23 Oct 2017 10:10:03 -0700 (PDT)
In-Reply-To: <20171023165753.30830-1-raj.khem@gmail.com>
References: <20171023165753.30830-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Oct 2017 18:10:03 +0100
Message-ID: <CAJTo0La36xCWt-Y9QDmT8iv9tR_6uuhyWXXxvysUnT+3bsTOJQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] libcheck: Upgrade to 0.12.0
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
X-List-Received-Date: Mon, 23 Oct 2017 17:10:23 -0000
Content-Type: multipart/alternative; boundary="001a113a7146ed2a77055c39e552"

--001a113a7146ed2a77055c39e552
Content-Type: text/plain; charset="UTF-8"

On 23 October 2017 at 17:57, Khem Raj <raj.khem@gmail.com> wrote:

> +SRC_URI = "https://github.com/${BPN}/check/archive/${PV}.tar.gz"
>

As discussed previously on the lists, github /archive/ URLs produce
unstable tarballs.

Please use the maintainer-provided tarball at
https://github.com/libcheck/check/releases/download/0.12.0/check-0.12.0.tar.gz
instead.

Ross

--001a113a7146ed2a77055c39e552
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 October 2017 at 17:57, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex">+SRC_URI =3D &quot;<a href=3D"https://github.com/${B=
PN}/check/archive/${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/${BPN}/<wbr>check/archive/${PV}.tar.gz</a>&quot;<br></blockquo=
te><div><br></div><div>As discussed previously on the lists, github /archiv=
e/ URLs produce unstable tarballs.</div><div><br></div><div>Please use the =
maintainer-provided tarball at=C2=A0<a href=3D"https://github.com/libcheck/=
check/releases/download/0.12.0/check-0.12.0.tar.gz">https://github.com/libc=
heck/check/releases/download/0.12.0/check-0.12.0.tar.gz</a> instead.</div><=
div><br></div><div>Ross</div><div>=C2=A0</div></div></div></div>

--001a113a7146ed2a77055c39e552--
