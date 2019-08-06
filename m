Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6277F3B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 19:54:08 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id y130so17619617vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 12:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/EY58yLtfphRdMpXOA260fpx6IM9VRpfEhirqldXkxA=;
	b=HJPGBTEk5lMv8b48jA3PUuOLthvTA4VCE3Fild/XkBJfFsqpewmXKPvtXadLomJ9Jo
	ADlyebGvEcLqOhZoF9fNqH4BHlN4OcjQvjuzhbmVFNNfKbc2yEMDoG5XANX0LZqoG+F0
	5fsONWWlgkap6tL1EkirgvGvGfrUgjfP2K6R4+Az7QyEK4A0MpnPk0HCYxRQ2Jamx8xk
	SWnsYX/c1EML46p4PmWxlGLYMfcVhmJ8LgAM6vC3L+NCoGB6VCh1TXA1hGg6tNKDFYt2
	bXKNmOwsA9YaOuGhVUVVmDPpsoVKrMHRei/Vzx0oQ5fzfVGfWZ8G96e9cckn55aTLvKH
	mG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/EY58yLtfphRdMpXOA260fpx6IM9VRpfEhirqldXkxA=;
	b=Hc68ajhF8z+uybLFLaFbu8MW8QFp708iJTqHax3nPQrNwuoutTLu2ZS0sjeYtc8gMt
	obmvpA6IgkmzvA3X+B957GujI/261YryhYdEpUreXvSnpKgtjCX+XvlwS/mFTAQnPqOz
	+NTtABKr7eZWrZq6dM8apdc/ABZj8hunWK8bKMpAPT3m0RHadffzluiHEdSHxNFrgmtw
	GiNWWkm6oq+Kn59RayPcQLlzCyTurm7QSe4lOuhEyEeQlrVJhslwnGyiFYJZNrmhEzxo
	CV61IyBXppLQc833Xpe+D7xTLfi2bS3m6JYDza0H4KgQgIUshy3lgXvUNx9CyEZQ+VyQ
	MkFw==
X-Gm-Message-State: APjAAAVhFYbf28Jp1PPAdaG2GNVyagZ997jKwDO/jiWSBhkaN6HDlZi/
	vzw5sT7MKS693zslThPHPSVMxCeMBjXkZdoXI7g=
X-Google-Smtp-Source: APXvYqxwG/gM8bQMaNKWutEOHw3bpj+VVkEJ5Qar1mEA+HN5etAnzsqJmSVGm6CBK+caRFO0ruCxm8w2PUcTmpz3KXQ=
X-Received: by 2002:a1f:bd56:: with SMTP id n83mr806520vkf.59.1565121249062;
	Tue, 06 Aug 2019 12:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190806173101.28671-1-jason.wessel@windriver.com>
	<CANNYZj96=yCYWO_UG9MkUx2HvwG00v0n3dTK5aMdhqb3BHhFjw@mail.gmail.com>
	<32e8e38d-b215-b56e-d523-71811803db99@windriver.com>
	<902909f9-0c57-5e0f-9c68-b73722a32869@windriver.com>
	<CANNYZj_h6f6vR83Zbw=H0NGaVLt3bGpd85Ra3ukYaJvwN0Vy-g@mail.gmail.com>
	<f411e447-22eb-e23b-9b1e-f8f1925d3e13@windriver.com>
In-Reply-To: <f411e447-22eb-e23b-9b1e-f8f1925d3e13@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 21:53:57 +0200
Message-ID: <CANNYZj_V9_YmVaPjyhK1S-phjnA7QGhiQbpNibq7yC+FoJkZ5A@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3: Always build sqlite3-native with zlib
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
X-List-Received-Date: Tue, 06 Aug 2019 19:54:08 -0000
Content-Type: multipart/alternative; boundary="00000000000014b27b058f7830ba"

--00000000000014b27b058f7830ba
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 21:38, Jason Wessel <jason.wessel@windriver.com>
wrote:

>
> Sqlite3 doesn't have a an explicit disable.  It has the typical autoconf
> check for a header/library.  From configure.ac:
>
>
> AC_CHECK_HEADERS(zlib.h,[
>   AC_SEARCH_LIBS(deflate,z,[BUILD_CFLAGS="$BUILD_CFLAGS
> -DSQLITE_HAVE_ZLIB"])
> ])
>
> This means it would need to be patched if you want to make it a pkgconfig
> option, or play games with the configure cache values...  I chose zlib as a
> default dependency because it was the easiest to implement.  If we really
> want to make it not build with zlib or build it conditionally, it is
> certainly possible.  Is that what is needed to get this patch accepted?
>

I'd say if you adjust the patch to work for both native and target variants
and always build with zlib, that should be fine.

Alex

--00000000000014b27b058f7830ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 6 Aug 2019 at 21:38, Jason Wessel=
 &lt;<a href=3D"mailto:jason.wessel@windriver.com">jason.wessel@windriver.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF"><br><p>Sqlite3 doesn&#39;t have a an explicit di=
sable.=C2=A0 It has the typical
      autoconf check for a header/library.=C2=A0 From <a href=3D"http://con=
figure.ac" target=3D"_blank">configure.ac</a>:</p>
    <p><br>
    </p>
    <p>AC_CHECK_HEADERS(zlib.h,[<br>
      =C2=A0 AC_SEARCH_LIBS(deflate,z,[BUILD_CFLAGS=3D&quot;$BUILD_CFLAGS
      -DSQLITE_HAVE_ZLIB&quot;])<br>
      ])<br>
      <br>
    </p>
    <p>This means it would need to be patched if you want to make it a
      pkgconfig option, or play games with the configure cache
      values...=C2=A0 I chose zlib as a default dependency because it was t=
he
      easiest to implement.=C2=A0 If we really want to make it not build wi=
th
      zlib or build it conditionally, it is certainly possible.=C2=A0 Is th=
at
      what is needed to get this patch accepted? <br>
    </p></div></blockquote><div><br></div><div>I&#39;d say if you adjust th=
e patch to work for both native and target variants and always build with z=
lib, that should be fine.</div><div><br></div><div>Alex<br></div></div></di=
v>

--00000000000014b27b058f7830ba--
