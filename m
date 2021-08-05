Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.10850.1628179219236748609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 09:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VzexwC3K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id h13so7245380wrp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=H6kZqSILIBj1oWaV8F8aMSGXOcSd387Qn7YpoEEHLNQ=;
        b=VzexwC3KtGmmR6GJsU9cqZwYLpotTotjq11jx/UZFYz7vgH1SwLKZSj/kjQoeIjkEx
         DXwUw7ttNGbwvPl2CeSZf3iciNn+9oaCJYydEf0/eyWhW+c8HBbDdq/DTx84jpICd+wr
         r51h6ZmcSk1w0yXzhS08F0pvxRk0s3hfl12+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=H6kZqSILIBj1oWaV8F8aMSGXOcSd387Qn7YpoEEHLNQ=;
        b=hyYGAJzLaIuI7XH43zsI0WgCd0XyAs5nT0VRji8z+rfD/j/NCdog9ItjaMAPWfESxp
         L05ZFk5BdKPOWssq1mK273jELyflFo6AtuY2aTZ1+raa+/6vt0Ww1lkSdNVgTVjUQrUX
         60HOMmgYLMjSHaBmQWavZHLC5Ab6r6igmb7k5lXnKOHjT6XgS4SVsJM9mqb1SDJgOwbm
         QQogfyvSBa/Cg6Qsq4QQF/wXJ80efCrWJWn0CRBDO5ws1OtEBPxm9/QkFFW69A4cixTf
         1VA1XUZos/chYNkrBzEP5+UYnxGGr9MaSLFmO+nE8tU7t5VpLmii+5Io7ZiDfLXJVxGc
         u9FQ==
X-Gm-Message-State: AOAM532KWaVzJcR4zdnN6w8UYalDbSVCrTsP10tLwohG5AnKpFstL2jK
	y+FWSRkNDoJ5LsGNycVfHdPA2A==
X-Google-Smtp-Source: ABdhPJwdAH7RBcQZjYEG3w+kJi2JnXs67jrduB0Zdl5pqm2m8ScCmuXd2XACRdP5IPFxcQqBR25pwg==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr6058243wru.402.1628179217459;
        Thu, 05 Aug 2021 09:00:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4? ([2001:8b0:aba:5f3c:ea47:91d3:ba71:9eb4])
        by smtp.gmail.com with ESMTPSA id t15sm6297359wrw.48.2021.08.05.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 09:00:16 -0700 (PDT)
Message-ID: <eb6b4dcc09205d15df5fff05c067584ac6f2168b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH 3/4] bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tony Battersby <tonyb@cybernetics.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Thu, 05 Aug 2021 17:00:15 +0100
In-Reply-To: <30028597-3dcb-cbe2-f7a7-54b0e7bd8e1f@cybernetics.com>
References: <30028597-3dcb-cbe2-f7a7-54b0e7bd8e1f@cybernetics.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-cQi4JbuUdC2S7wQE9jpg"

--=-cQi4JbuUdC2S7wQE9jpg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-07-27 at 09:36 -0400, Tony Battersby wrote:
> -f*-prefix-map flags are required when linking with LTO enabled to make
> the output binary reproducible.
> 
> See discussion here:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101473
> 
> [YOCTO #14481]
> 
> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> ---
> 
> /usr/sbin/lspci from pciutils is a good program to test that shows how
> adding -f*-prefix-map to LDFLAGS makes a program binary reproducible
> with LTO enabled.
> 
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 160abf40ee..c0d2e3f82f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -595,7 +595,7 @@ TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_
>  ASNEEDED ?= "-Wl,--as-needed"
>  
> 
>  export LDFLAGS = "${TARGET_LDFLAGS}"
> -TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
> +TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBUG_PREFIX_MAP}"
>  # mips does not support GNU hash style therefore we override
>  LINKER_HASH_STYLE_mipsarch_libc-musl = "sysv"
>  

This failed in testing in ruby:

https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/514

The error is a bit obtuse but in summary, the file:

/tmp/work/core2-64-poky-linux/ruby/3.0.2-r0/sysroot-destdir/usr/lib/pkgconfig/ruby-3.0.pc

contained build paths as it adds LDFLAGS to the file with a line like:

DLDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fmacro-prefix-map=/home/pokybuild/yocto-
worker/reproducible-centos/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/ruby/3.0.2-
r0=/usr/src/debug/ruby/3.0.2-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/reproducible-
centos/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/ruby/3.0.2-r0=/usr/src/debug/ruby/3.0.2-r0 -
fdebug-prefix-map=/home/pokybuild/yocto-worker/reproducible-centos/build/build-
st/reproducibleA/tmp/work/core2-64-poky-linux/ruby/3.0.2-r0/recipe-sysroot= -fdebug-prefix-
map=/home/pokybuild/yocto-worker/reproducible-centos/build/build-st/reproducibleA/tmp/work/core2-64-poky-
linux/ruby/3.0.2-r0/recipe-sysroot-native= -Wl,-z,relro,-z,now -Wl,--compress-debug-sections=zlib

Cheers,

Richard


--=-cQi4JbuUdC2S7wQE9jpg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Tue, 2021-07-27 at 09:36 -0400, Tony Batte=
rsby wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bord=
er-left:2px #729fcf solid;padding-left:1ex"><pre>-f*-prefix-map flags are r=
equired when linking with LTO enabled to make</pre><pre>the output binary r=
eproducible.</pre><pre><br></pre><pre>See discussion here:</pre><pre><a hre=
f=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473">https://gcc.gnu=
.org/bugzilla/show_bug.cgi?id=3D101473</a></pre><pre><br></pre><pre>[YOCTO =
#14481]</pre><pre><br></pre><pre>Signed-off-by: Tony Battersby &lt;<a href=
=3D"mailto:tonyb@cybernetics.com">tonyb@cybernetics.com</a>&gt;</pre><pre>-=
--</pre><pre><br></pre><pre>/usr/sbin/lspci from pciutils is a good program=
 to test that shows how</pre><pre>adding -f*-prefix-map to LDFLAGS makes a =
program binary reproducible</pre><pre>with LTO enabled.</pre><pre><br></pre=
><pre>&nbsp;meta/conf/bitbake.conf | 2 +-</pre><pre>&nbsp;1 file changed, 1=
 insertion(+), 1 deletion(-)</pre><pre><br></pre><pre>diff --git a/meta/con=
f/bitbake.conf b/meta/conf/bitbake.conf</pre><pre>index 160abf40ee..c0d2e3f=
82f 100644</pre><pre>--- a/meta/conf/bitbake.conf</pre><pre>+++ b/meta/conf=
/bitbake.conf</pre><pre>@@ -595,7 +595,7 @@ TARGET_LINK_HASH_STYLE ?=3D "${=
@['-Wl,--hash-style=3Dgnu',''][d.getVar('LINKER_HASH_</pre><pre>&nbsp;ASNEE=
DED ?=3D "-Wl,--as-needed"</pre><pre>&nbsp;
<br></pre><pre>&nbsp;export LDFLAGS =3D "${TARGET_LDFLAGS}"</pre><pre>-TARG=
ET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"</pre><pre>+T=
ARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED} ${DEBUG_PR=
EFIX_MAP}"</pre><pre>&nbsp;# mips does not support GNU hash style therefore=
 we override</pre><pre>&nbsp;LINKER_HASH_STYLE_mipsarch_libc-musl =3D "sysv=
"</pre><pre>&nbsp;</pre></blockquote><div><br></div><div>This failed in tes=
ting in ruby:</div><div><br></div><div><a href=3D"https://autobuilder.yocto=
project.org/typhoon/#/builders/115/builds/514">https://autobuilder.yoctopro=
ject.org/typhoon/#/builders/115/builds/514</a></div><div><br></div><div>The=
 error is a bit obtuse but in summary, the file:</div><div><br></div><div>/=
tmp/work/core2-64-poky-linux/ruby/3.0.2-r0/sysroot-destdir/usr/lib/pkgconfi=
g/ruby-3.0.pc</div><div><br></div><div>contained build paths as it adds LDF=
LAGS to the file with a line like:</div><div><br></div><div>DLDFLAGS=3D-Wl,=
-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/home/pokyb=
uild/yocto-worker/reproducible-centos/build/build-st/reproducibleA/tmp/work=
/core2-64-poky-linux/ruby/3.0.2-r0=3D/usr/src/debug/ruby/3.0.2-r0          =
            -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/reproducible-=
centos/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/ruby/3.0.2=
-r0=3D/usr/src/debug/ruby/3.0.2-r0                      -fdebug-prefix-map=
=3D/home/pokybuild/yocto-worker/reproducible-centos/build/build-st/reproduc=
ibleA/tmp/work/core2-64-poky-linux/ruby/3.0.2-r0/recipe-sysroot=3D         =
             -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/reproducible=
-centos/build/build-st/reproducibleA/tmp/work/core2-64-poky-linux/ruby/3.0.=
2-r0/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now -Wl,--compress-debug-sec=
tions=3Dzlib</div><div><br></div><div>Cheers,</div><div><br></div><div>Rich=
ard</div><div><br></div><div><span></span></div></body></html>

--=-cQi4JbuUdC2S7wQE9jpg--
