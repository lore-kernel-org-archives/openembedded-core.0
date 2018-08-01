Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 78B4A60190
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 21:06:41 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id w7-v6so13655375uan.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2018 14:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Vvvj4Z4yHdiSZeyRnfVtD6hYmi7sdNnPJ9Dq1svp/Io=;
	b=D97NIsukJCr0ngDjSBdtQMokTrb099sJKKh5CooovJM26npJgAKRNntbAUDtqvPWE9
	S3cvEKVMyyX/iYZ7mULv+DwYYdVO/Jp2y6lnz2WwM6Bsq85OJfuC/x0TujaZvXK9BcmU
	C1kRgSjf5+2xrekkR99GMfPKP57yslxALjt0oLEhFAKx1IrxmEcsqKHoylsrJZl2TdXG
	SXuejmjqzpDuCOA6ZVeYj2+5qxd7b3W/vcV2WGZ1+oUlVxTDNFbiiFfDZn8EYoLAgn5P
	zfnXy1tFEUp6MrgiUwWHNboEaDxzzTsU91+NNPXXSE48QgPrSqqR2b+jaCQXCOmvArFT
	a9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Vvvj4Z4yHdiSZeyRnfVtD6hYmi7sdNnPJ9Dq1svp/Io=;
	b=ot6sORveahrvtBNbgZaIdVevjmTNDJXKKg05LwYfsCO2qXeB/miASz0irAU4Rgh96y
	wHndwYw52s2JQ6F6jK2m5cHfWVB7zW4GbBIhtgGBFAfY77RrRM20TU0OzQ8DikJ5YWjA
	dhQh0AMaxdMZ0utVK7W5YJwYah/KUafPZuCKmO+gNHmv9Y2uS7inTeGof9OdVywuPmQ5
	kkyj4TuE9x3aRpedzcjbydnNaxNU3ADG7buN1n460NgejZFsgxMbDX7HW0B+5rRv0XBL
	qYqAFaUBuD19vYv2UjVlQDLO8vOkMli6v5PUBKUJCkm53CT0CCoCRVX+czxLmu4Dow/u
	akmQ==
X-Gm-Message-State: AOUpUlEpRRCnblzwAyxzAmuw8HS2DPPmYgOPc60nV4UV/lT9YzxW/Pna
	I1BkpLslCuNs3YwmV3AgBOLBQQoUzDAgaeGsNZE=
X-Google-Smtp-Source: AAOMgpfhG0D7uSQupycdnX+BZ9JtHIy348zi8SEmvc2yheRyOqWHO6rnJ45q4le/C/h99h6fmItVexeNcYit/GC4la8=
X-Received: by 2002:ab0:1544:: with SMTP id
	p4-v6mr19858563uae.81.1533157602280; 
	Wed, 01 Aug 2018 14:06:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 14:06:41 -0700 (PDT)
In-Reply-To: <14E22879-604B-4920-9244-FA4D6855F7DC@cisco.com>
References: <884A0584-E44B-4810-8F02-194B625F24D7@cisco.com>
	<CANNYZj-u80B3WxCbWpr4MbrWZU5jxWMM1xCTY7PJPBznB4-uLw@mail.gmail.com>
	<14E22879-604B-4920-9244-FA4D6855F7DC@cisco.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 1 Aug 2018 14:06:41 -0700
Message-ID: <CAJ86T=VBncf=aQePrVohbqzxkA6Ry0cqWNZOCptVvT7crPedpw@mail.gmail.com>
To: "Ryan Pabis (pabisr)" <pabisr@cisco.com>
Cc: "Ken Nicholas \(nicholk\)" <nicholk@cisco.com>,
	"Doug Livezey \(livezed\)" <livezed@cisco.com>,
	"Greg Olin \(grolin\)" <grolin@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why does Openssl 1.0.2n use libcrypto.so.1.0.2 and not libcrypto.so.1.0.0?
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
X-List-Received-Date: Wed, 01 Aug 2018 21:06:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 1, 2018 at 1:35 PM, Ryan Pabis (pabisr) via
Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
> Alex,
>
> The library was precompiled by tail-f but I've also recompiled on Ubuntu =
16.04 with openssl 1.0.2n.  In both cases the library crypto.so and libconf=
d.so refer to libcrypto.so.1.0.0.
>
> Having a pre-compiled library worked on krogoth and morty, but does not s=
eem to work on rocko.

You can often find the answer to questions like this by looking at the
git history and reading the comments from the commit which made a
particular change. In this case see:

  http://git.openembedded.org/openembedded-core/commit/?id=3D1b430eef713187=
6bc735c22d66358379b0516821

ie the explanation given was that other distros are not consistent in
the soname they use and oe-core has chosen to follow Debian - which
apparently uses 1.0.2.

If you have a library which needs 1.0.0 then you can try to hack
around the mismatch by adding symlinks from libXXX.so.1.0.0 ->
libXXX.so.1.0.2 in the rootfs (and ignoring the file-rdeps QA test).

But as Alex mentions, be very careful about just copying binaries
created outside OE into an OE rootfs. By over-riding the soname you
are basically disabling sanity checks that prevent mismatches in
library APIs, so you could see crashes etc at runtime. The fact that
your preompiled library worked on krogoth and morty may just have been
luck.

If you have the source to (re)build under Ubuntu then why can't you
also build from an OE recipe? That would be the real solution.


> =EF=BB=BFOn 8/1/18, 3:47 PM, "Alexander Kanavin" <alex.kanavin@gmail.com>=
 wrote:
>
>     2018-08-01 20:20 GMT+02:00 Ryan Pabis (pabisr) via Openembedded-core
>     <openembedded-core@lists.openembedded.org>:
>     > I have a library that uses libcrypto.so.1.0.0 from openssl 1.0.2n, =
which is
>     > the libcrypto.so version if you download the source code to ubuntu =
16.04
>     > from openssl and compile.  However, Yocto Rocko uses the same opens=
sl 1.0.2n
>     > version but it uses libcrypto.so.1.0.2 and sets the FILERDEPENDS_ t=
o the
>     > same.  This causes a file_rdeps issue for me because it says
>     > libcrypto.so.1.0.0()(64bit) is not provided.
>     >
>     >
>     >
>     > I=E2=80=99ve tried adding, DEPENDS +=3D =E2=80=9Copenssl=E2=80=9D a=
nd RPDEPENDS_confd +=3D =E2=80=9Copenssl=E2=80=9D,
>     > with no luck.  The only way I can get it to compile is if I manuall=
y hack my
>     > library and change from libcrypto.so.1.0.0 to libcrypto.so.1.0.2 (e=
ven
>     > though it was really compiled with libcrypto.so.1.0.0 and that=E2=
=80=99s the
>     > libcrypto version of openssl 1.0.2n).
>     >
>     >
>     >
>     > Can someone please advise?
>
>     In which environment was the library built? You generally cannot take
>     something that was compiled outside of Yocto. Write a recipe that
>     builds the library from source code, or ask the provider of that
>     library to do that.
>
>     Alex
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

