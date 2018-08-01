Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 61E6978AD6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 19:47:05 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id d189-v6so36809267oib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2018 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XZd3lvbYQFqMur2QR6YiWi71kE2FofooJcL8zuyfV/E=;
	b=K8xqgMaM4Hn8VuvK1GElH48V9Srtgts6cgpUTqEnj6y7U1srML591x/qtZSxxR4Exr
	EYRIB+jiAHELJAg5kTgsKWpoLBIRhKuq7hA8ghBpi5vxN6LhC3hPoRieJb2inMuPYoIE
	eHP+HyOwKzkdZ18EktmIZsFa7iqVL2ARyXYHwZUPWjESvgQI1ALvQYacL5YX6HseyFDb
	34Ok7mj35JfE+8bGJTXdkFLz9N6RS5k24vG5aANVPy3AfYwhQLQOrdoe9dzoEkU9IHKK
	vEheSMv7juUXGagaZahWoH3UfqT273ZHBAUNoFqCtjuRa75Opcyd1bV5XDSqcjuLuI6z
	w5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XZd3lvbYQFqMur2QR6YiWi71kE2FofooJcL8zuyfV/E=;
	b=hxHfnAIuPTHZBkAtI6SlABnU/bSu7amzAuLXES3vb+Y8EXgr8D1jIWf1ATYtYJzMbW
	IVseNXjcd5By2Z5sQZO5sW+z8AaQ+jQftHYggsIFnc7DyjQV6wDdTXR4CXEM7QcAfTkb
	4FQheboY+/goxlH+b0/ElkTOvE28hV0JG5nJpc8lTmD83aA7RREPGIqACgSnYPzN75EI
	j/RzXM7FANKfzsnb6hQQFTNFenKVGfQGecIuiSOx4crpqgdaLuR4br0YjN5n8240s5ry
	Bd44wCIcfnnSCsHf1rMZHd7vr1Z4yWZsRPHxoxL8Aq0DFI3rypZWW1QJJD9lisRDLYl9
	EEug==
X-Gm-Message-State: AOUpUlEt6fjzwS+zTvdFx9fJJ9NUBT+oH/CiisuwvgsWDGvvYmH9qvNW
	A4EO9vKDRVclfBgGHqnqA6uFCYLSr7XN+n9EEcNeQA==
X-Google-Smtp-Source: AAOMgpdMOrHL/YGVnySB1KtWzfetaCw4lZVGOs5sVc26fi7MsmV3ThsV0MHSmpCu1OwaS3BfUbDOLM+1QdiTO+2R3jU=
X-Received: by 2002:aca:560d:: with SMTP id
	k13-v6mr4698266oib.190.1533152826369; 
	Wed, 01 Aug 2018 12:47:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 12:47:05 -0700 (PDT)
In-Reply-To: <884A0584-E44B-4810-8F02-194B625F24D7@cisco.com>
References: <884A0584-E44B-4810-8F02-194B625F24D7@cisco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Aug 2018 21:47:05 +0200
Message-ID: <CANNYZj-u80B3WxCbWpr4MbrWZU5jxWMM1xCTY7PJPBznB4-uLw@mail.gmail.com>
To: "Ryan Pabis (pabisr)" <pabisr@cisco.com>
Cc: "openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Wed, 01 Aug 2018 19:47:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2018-08-01 20:20 GMT+02:00 Ryan Pabis (pabisr) via Openembedded-core
<openembedded-core@lists.openembedded.org>:
> I have a library that uses libcrypto.so.1.0.0 from openssl 1.0.2n, which =
is
> the libcrypto.so version if you download the source code to ubuntu 16.04
> from openssl and compile.  However, Yocto Rocko uses the same openssl 1.0=
.2n
> version but it uses libcrypto.so.1.0.2 and sets the FILERDEPENDS_ to the
> same.  This causes a file_rdeps issue for me because it says
> libcrypto.so.1.0.0()(64bit) is not provided.
>
>
>
> I=E2=80=99ve tried adding, DEPENDS +=3D =E2=80=9Copenssl=E2=80=9D and RPD=
EPENDS_confd +=3D =E2=80=9Copenssl=E2=80=9D,
> with no luck.  The only way I can get it to compile is if I manually hack=
 my
> library and change from libcrypto.so.1.0.0 to libcrypto.so.1.0.2 (even
> though it was really compiled with libcrypto.so.1.0.0 and that=E2=80=99s =
the
> libcrypto version of openssl 1.0.2n).
>
>
>
> Can someone please advise?

In which environment was the library built? You generally cannot take
something that was compiled outside of Yocto. Write a recipe that
builds the library from source code, or ask the provider of that
library to do that.

Alex

