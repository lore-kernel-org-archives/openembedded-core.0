Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 992F1790E4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 19:46:54 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id 89-v6so6362979qkp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D2ZpbqzIeA7MIOz19OEz0ha8fiqofiIsZE0g+KZocrQ=;
	b=Jum2loS46VuQ/oQm022vhpQWwDW9yEgtzzbjOXGajcZ27VA1J8aWLsPOF2aSc3nM86
	EXuoI8OYNCTZqpA3yzbQVWPftioZZc52WLPEhEDeHNAtBToEcdmCVXngnLf2kY0wedyd
	ub6SPKykWy6k0YXy5ECEFUeeunfx8K3cYG9hXUvkd8AaA3HMy9nKv/rQxuw+xwYP7jJP
	fXObbQ3Yf2nU/rWtx87k1QZnkCrarTntpMpg+mi7Q++nodIBIa0V69Awir35mqwmgjT+
	INycl8yGVT0bCbK8jZyc2aLhbonnlIfWFpyE+FMj/h6g6DfYIKLVcQIFcKm/Vd6j62m7
	m2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D2ZpbqzIeA7MIOz19OEz0ha8fiqofiIsZE0g+KZocrQ=;
	b=MwEqMdah46FFAa7KJ+Rea3ux3/D3QiVt5lNtWNlPrJ4J165rsTKvLn0Ikim6DufT1V
	+JtFxCwUIWP6CLsiU6UVygXfJS+X74LNI1+FItKuNF/yjFeUt4GuQ8GmH0lbFB1pzpy0
	Uh0izsxpbY/gxsPhD/tZcLAwENeZx9PXmYrnwTYKmfEm3IcT/kGFeiXfnigNhkIB0WRF
	6hNrDd2tMU5mTJLa5LlGU2rcrUzcrnhZ0aK66lo1LjAF1NWviLdELwWcPUr4EloZb9dJ
	eI29nasUz5dSdxzskuBa6qL0Q3uHfN0pAWfQ3bIRzm9Z2gpxV3EbMFsGg63OMQTFBiea
	0ccA==
X-Gm-Message-State: AOUpUlHV8FDs5kalqcqMuGBkpCPDbTVgQUwWEH3wMAIObtg5SenxMyUS
	MplOa504dq7B00QucgoY2mhbTsS2DBBmPUouxyY=
X-Google-Smtp-Source: AA+uWPwAV+cC8Q85DhpwrVOiHkohCLNdKglle/PArfZzE5K4zR/rv1aoJ98sW59lGbQwPi2r27MkoyBHri9o/3n4QCE=
X-Received: by 2002:a37:a24f:: with SMTP id
	l76-v6mr40893183qke.406.1534794414986; 
	Mon, 20 Aug 2018 12:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAPybu_0OGj5z+qHP0f=s30cEOAo6nryJm2x=+S2JLAV_4HWtjw@mail.gmail.com>
In-Reply-To: <CAPybu_0OGj5z+qHP0f=s30cEOAo6nryJm2x=+S2JLAV_4HWtjw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2018 12:47:01 -0700
Message-ID: <CAMKF1spV=tATB5wZ4XBja_Eh-x2wB+NXC_9v3bKCRNSOvuYiHQ@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: x86_64: ldd does not work (not a dynamic executable)
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
X-List-Received-Date: Mon, 20 Aug 2018 19:46:54 -0000
Content-Type: text/plain; charset="UTF-8"

This seems a bug, but we need to ensure it works with multilib
On Mon, Aug 20, 2018 at 3:06 AM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> Hi
>
> I think that I found a bug with ldd on sumo. Whenever I try to use it
> on the target with an dynamic binary, it returns:
>
> root@qt5122:~# ldd ./qtec_webcam
> not a dynamic executable
>
>
> The reason seems to be that it cannot find the dynamic linker:
>
> It is searching for:
> RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> /libx32/ld-linux-x32.so.2"
>
> whith ldd being at:
> /lib/ld-linux-x86-64.so.2
>
> This can be patched on glibc with:
>
> git diff ./sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
> diff --git a/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
> b/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
> index 44d76e8aa1..611efd56b0 100644
> --- a/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
> +++ b/sysdeps/unix/sysv/linux/x86_64/ldd-rewrite.sed
> @@ -1,3 +1,3 @@
>  /LD_TRACE_LOADED_OBJECTS=1/a\
>  add_env="$add_env LD_LIBRARY_VERSION=\\$verify_out"
> -s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-x32\)\(\.so\.[0-9.]*\)[
>    ]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6"_
> +s_^\(RTLDLIST=\)\(.*lib\)\(\|64\|x32\)\(/[^/]*\)\(-x86-64\|-x32\)\(\.so\.[0-9.]*\)[
>    ]*$_\1"\2\4\6 \264\4-x86-64\6 \2x32\4-x32\6 \2\3\4\5\6"_
>
> I can very easily make a patch for this and send it, but  it is too
> strange, that I have been the first person to stumble with this thing
> :), and I do not know if this is a bug OE-specific or shall I also
> ping upstream.
>
> Any ideas?
>
> Thanks!
>
>
> --
> Ricardo Ribalda
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

