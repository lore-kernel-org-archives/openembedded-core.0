Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id EAC11607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 04:54:11 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id k2-v6so8862888pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 21:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fuin1JDGHeIEkC7xu06nvHmnsCNUO1V/Z+ChjJQUPD8=;
	b=ZKiesK5g84iy7CwpvHowdxDT9ofEr+RsPwDXq34jPHPaHrIm3FleY61D8iNbOzD/vz
	VMldkoC4fCQQY/A4XFVEVwMwlb3XUHwajfAZu1iOK4ducoMDu4DfFGWP3HODV0u9lXW3
	2+ULmDYq6IFgC2tltCCPkBghu/rp/JV5oD6FATMzs+IOpdMJD3BvrLyxhtl+4KYVIF9d
	9gYUFHMhZmzGP7XK/nXRn0V51jwtX411vtID28ae7LEQHd4NoM7ekh52Um4KvCmlHr1l
	xJuyI7kea9twezrnGu1IjUKLkuU6al39CZktHJoordXe8EcgxaWLtplpkO9rw7DzyXSR
	HGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fuin1JDGHeIEkC7xu06nvHmnsCNUO1V/Z+ChjJQUPD8=;
	b=NuHNjJXJYdBSE82U75lHz+amL5+kV2YzQ3iUhNXJiNZp0HIPDbWVGno9yvDgIq0B1i
	ljgCOXt+C5Gn3nxf+3RnaKxJ0SiHNNYx/ewP3RRyVvaPHgtGW1OW6w19f14P4wJOYXxG
	JBD9hSwccQPrIS9EuE3No9WoYia86OOJOIzz0FfGGWbe2m1Ue+0xMXRc2i0ov7fC0Znk
	6fSJMxxanL3Z4WIsVmxmsgjgeEt/vzZpfa/JxVxaudaHLM1MHhY1b0szzzFsMJC0Al5j
	bn863AGJLlGXA1dSBRTENFRjGDMwmbWVcI9w1MxYhMc4gUL1AUnIu0G5Tp8gPuGOCrPq
	Km1A==
X-Gm-Message-State: ALKqPwev4/5fIRJP9eDwgabvJgSRz8NQcw9FEvyELsdxn6RqvQ5OM0zW
	VaY5Kzd4sGZTpsKg3z/lpkShb9VTi8GHV3ZKkrQ=
X-Google-Smtp-Source: AB8JxZrVtCDstm/hjo3S62t3zjJyDdiHLTatiNgJaCnkHNPvjB6lax9OcCGD+aCsikHyWR7644QGZ7j6B6xGPKxz/ig=
X-Received: by 2002:a63:7b51:: with SMTP id
	k17-v6mr1076175pgn.55.1527051252453; 
	Tue, 22 May 2018 21:54:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Tue, 22 May 2018 21:53:41
	-0700 (PDT)
In-Reply-To: <20180511065249.40069-3-raj.khem@gmail.com>
References: <20180511065249.40069-1-raj.khem@gmail.com>
	<20180511065249.40069-3-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 May 2018 00:53:41 -0400
Message-ID: <CAMKF1sopqYYu9aUhpMHP1HnLOrD_q0itiZdVy8JZWEOSHi2-=Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] uninative-tarball: Add libjis and euc-jp gconv files
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
X-List-Received-Date: Wed, 23 May 2018 04:54:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross/Richard

We need to regenerate uninative-tarball now this patch has landed in master=
.

On Fri, May 11, 2018 at 2:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
> packages like fontforge-native fail with mysterious errors like
>
> | ../../git/inc/gwwiconv.h:44:21: error: conflicting types for =E2=80=98g=
ww_iconv_close=E2=80=99
> |  #define iconv_close gww_iconv_close
> |                      ^~~~~~~~~~~~~~~
> | ../../git/inc/gwwiconv.h:37:13: note: previous declaration of =E2=80=98=
gww_iconv_close=E2=80=99 was here
> |  extern void gww_iconv_close( gww_iconv_t cd);
> |              ^~~~~~~~~~~~~~~
>
> The reason behind this is that a check for iconv fails during native
> configure run, the check fails because the autoconf test to check for ico=
nv
> pokes for these gconv's in test runs before declaring iconv support succe=
ssful.
>
> Therefore when uninative is active the package fails to build but when
> uninative is inactive all works fine. this patch fixes that
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/meta/uninative-tarball.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-c=
ore/meta/uninative-tarball.bb
> index 38c3a314e1..c38c2a445e 100644
> --- a/meta/recipes-core/meta/uninative-tarball.bb
> +++ b/meta/recipes-core/meta/uninative-tarball.bb
> @@ -12,6 +12,8 @@ TOOLCHAIN_HOST_TASK =3D "\
>      nativesdk-glibc-gconv-iso8859-1 \
>      nativesdk-glibc-gconv-utf-16 \
>      nativesdk-glibc-gconv-cp1252 \
> +    nativesdk-glibc-gconv-euc-jp \
> +    nativesdk-glibc-gconv-libjis \
>      nativesdk-patchelf \
>      nativesdk-libxcrypt \
>      "
> --
> 2.17.0
>

