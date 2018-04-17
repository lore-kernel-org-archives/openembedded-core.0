Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 90C057450B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 20:57:51 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id t27-v6so2692627oij.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 13:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wiJhSPkwqAnbWTsyOFWO7ys7k9DtZhn3C95ZDCxWNUU=;
	b=cZWD3WbaDOfDI77LYNNK/wep32Jzw+RhXMjz0SKEsAQ9oSJ2tongMZS+x48mjCarW/
	e9Kc7Z1vIOCalNFgoF9rEnEbLk5GfhJemYG/bNBoYvAPANVgbBrxM4s91iSFYBA4icqb
	Gqo70dT7ayaeklF6dP9jDFTqxsWu7QtwSzFS1ThMvtvcHepnWTZobcm2XwFtVaP7I0F1
	Sph8vv98/LIMJB7dM6vBtSkW3/qtCx1JfbrvdPoEhge1nhTgUtL+0QStgtr7iVFYTVea
	iIloqkNZs/F+B5xvb1gobPpRICM5AuiQalgu+qBqCgHO6jmZTohLMzX23E8oOwuMO0xX
	yj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wiJhSPkwqAnbWTsyOFWO7ys7k9DtZhn3C95ZDCxWNUU=;
	b=UrxbnxwGL5jDrXa44B7s0l4eOJIvdmtiP2qFOkbJSLN2WQA1/JEe1QGU2oFymvzJLb
	VFmPIxqvXexbn0Nkq/rLZ/slz+0Bzh0syU9nJzNW0q6uljC9jA452dyiLEDTfozdHgRP
	h+waNJKzzsu3qBMpXGTidpIrMMyGWzJRzxD7U+vU+O5Fx/nz4hDPiTOByB5j7T7Kcn//
	j/rEoKqCJGlRLhI4Tkj3o3lgLlVjyOMOzpKLFO/8YqK1u0qCPW84a0wxgIFbBCgTltUx
	MMAiwqkbE7+2PLTTUVdBRvNEpBcQ2KQQgSmBxOqQjd7S+Ql+20NdO0ydnIa7286HftBF
	j5hg==
X-Gm-Message-State: ALQs6tDygYK4/P/c/2+iVU0OTNK+QsNEeBLSQ0Zad0bcQhzoxx/Yf5ZM
	EEQAF9r6q3nI8opQMEehKcQSZq4q9uvrU+itJlqs4A==
X-Google-Smtp-Source: AIpwx49G0YlG5E0qA2eNdsxNxh7C6d3N+FT8vBTKyLLXEvnSJySvuEskE/ccFe798wBOnBF3TjpqUvNVqmA6ZEtlbiM=
X-Received: by 2002:aca:accf:: with SMTP id
	v198-v6mr177477oie.320.1523998672201; 
	Tue, 17 Apr 2018 13:57:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Tue, 17 Apr 2018 13:57:31 -0700 (PDT)
In-Reply-To: <CAJTo0LYwLeeR0y0x=PdYKCSdvi1hku5q_ixf77Te+bKqC_Lk_Q@mail.gmail.com>
References: <1523983449-32655-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJTo0LYwLeeR0y0x=PdYKCSdvi1hku5q_ixf77Te+bKqC_Lk_Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Apr 2018 21:57:31 +0100
Message-ID: <CAJTo0LYpsTA9ppPKZkke2uAotyx7KKwm9CJSZyaVrfEkA5XW8Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uninative: Add allow-shlib-undefined to BUILD_LDFLAGS and drop other workarounds
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
X-List-Received-Date: Tue, 17 Apr 2018 20:57:51 -0000
Content-Type: text/plain; charset="UTF-8"

The dbus-glib-native one hits a few times but the only other place it
has broken so far is in cmake-native:

bin/cmake: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.25' not
found (required by
TOPDIR/tmp/work/x86_64-linux/cmake-native/3.10.3-r0/recipe-sysroot-native/usr/lib/libexpat.so.1)

Is expat using rpaths or something and picking the wrong libc?

Ross

On 17 April 2018 at 21:52, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 April 2018 at 17:44, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> We have a problem when for example, a glibc 2.27 based system builds some
>> library like libpopt-native and puts it into sstate then it is reused
>> on a pre glibc-2.27 system to build something which depends on popt like
>> rpm-native. This results in an error like:
>>
>> recipe-sysroot-native/usr/lib/libpopt.so: undefined reference to `glob@GLIBC_2.27'
>
> dbus-glib-native is failing on a few builders like this:
>
> | /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/work/x86_64-linux/dbus-glib-native/0.108-r0/build/dbus/.libs/lt-dbus-binding-tool:
> /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.25' not found
> (required by /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/work/x86_64-linux/dbus-glib-native/0.108-r0/recipe-sysroot-native/usr/lib/libexpat.so.1)
>
> Using the host libc doesn't seem right surely?
>
> Ross

