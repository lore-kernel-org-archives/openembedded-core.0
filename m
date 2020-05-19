Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.7529.1589872932895781136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 00:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kS6mLlIx;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: ovpanait@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id t8so13369wmi.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 00:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=296jUx4dyMnyAQqZeEQPTsRR7o4R7b4nBd682D+Kvlw=;
        b=kS6mLlIxkwHZoCP7d9738eqVPvXAMUrFD09gQydA4wZHGgnWjTT8udlpcZU6NDgjs/
         wnE3OXy9G9+09m4miL0/Ba1UVWdtDWgFraKo6WwDPFK9ngVDnnkl9cW+1eGdtOnAQ5LZ
         Qj1tPdqF/FDwp9mmm3BO+f0usZ7QmJdEctg5KlTwBkeJFnWSKCnx0hpobYjQO/E0Po3e
         Oaxcs7DU/rtylGjIEf6STtRH6az7SNq44d8qYMRTnbxtEiT8TXE+kquHrRAwj6txIqfV
         CM3GMt02/s+gT8DbYHiR8Ym7xMrrqm4hzW2OG696CWhSYr7+gLoTUKCMmKwqKLunXiFk
         4kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=296jUx4dyMnyAQqZeEQPTsRR7o4R7b4nBd682D+Kvlw=;
        b=n3mjOWPUH+Z3iqgyQ2PCNz4W5xMV2I1FJdURWOH+DzbQNiE3D7nA5VkxsdkA3SPktV
         UcrPFu4fP2EjqjoLL8DH72LweVknUeUzgjqXq6665JtONMRPHV8tbuf4ELw52vrt3n8M
         lQkhK7AyyXB8CqcNtUUGxo3e35XXLKa/p1AqbZ+mEUsNXQk3Z900MdQdVwIGzT7xgXC6
         qud6FhqECiu1698PY7nmuwavYsb6HAqsbgZuFgoLIlXa8Urwe/UlLUmnRD+9Fc5YBzHP
         HYECEf8ujqbkLXynlVvtz61ojpcn1t8I8cgvrGSWPC5HNTZS2p4FDNmWcckar2+c1RfV
         YqZQ==
X-Gm-Message-State: AOAM532nArK+WRfRB73jEgls8KrFJuLKjghaxDogT9jGAlw7Gih5WSam
	4Y3GQrri3gcwwMaOIwqGlgo=
X-Google-Smtp-Source: ABdhPJwyhHHYTrXY2kqNB7rk276uA8DjHXSfC+kqmZzu5/MCGllavdTcqeHdVS95vQPt4wdaEZUC8A==
X-Received: by 2002:a1c:c38b:: with SMTP id t133mr3617481wmf.31.1589872931261;
        Tue, 19 May 2020 00:22:11 -0700 (PDT)
Return-Path: <ovpanait@gmail.com>
Received: from ?IPv6:2a02:2f0e:c315:600:1991:ce0b:7825:be45? ([2a02:2f0e:c315:600:1991:ce0b:7825:be45])
        by smtp.gmail.com with ESMTPSA id c80sm2792693wme.15.2020.05.19.00.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 00:22:10 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] populate_sdk_base: do not overwrite ld.so.conf in nativesdk
To: Denys Dmytriyenko <denis@denix.org>,
 openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
References: <1589862981-21386-1-git-send-email-denis@denix.org>
From: "Ovidiu Panait" <ovpanait@gmail.com>
Message-ID: <5ee3acce-6fd8-4c07-6c53-8dd990dc2340@gmail.com>
Date: Tue, 19 May 2020 10:22:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589862981-21386-1-git-send-email-denis@denix.org>
Content-Type: multipart/alternative;
 boundary="------------555AFD1B15E4E42139A4FCE0"
Content-Language: en-US

--------------555AFD1B15E4E42139A4FCE0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19.05.2020 07:36, Denys Dmytriyenko wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> Commit 7ec84a463ad4c45aee9cd2cbc75b43e5aab5cd18 has moved creation of ld.so.conf
> from buildtools-tarball.bb to create_sdk_files() in populate_sdk_base.bbclass.
> But since create_sdk_files() is an SDK_POSTPROCESS_COMMAND, creating ld.so.conf
> can potentially overwrite existing file already provided by a nativesdk package.
> Use append instead to avoid overwriting existing file.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   meta/classes/populate_sdk_base.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index 990505e..83c3448 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -189,7 +189,7 @@ fakeroot create_sdk_files() {
>          mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
>          echo '${SDKPATHNATIVE}${libdir_nativesdk}
>   ${SDKPATHNATIVE}${base_libdir_nativesdk}
> -include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
> +include /etc/ld.so.conf' >> ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
>   }

Hi Denys,


With this change, in my testing (Ubuntu 18.04 server), nativesdk-gcc 
would still try to link with host libraries first rather than nativesdk 
ones, basically reverting the original intent of commit 
7ec84a463ad4c45aee9cd2cbc75b43e5aab5cd18:

local.conf:

KERNEL_DEV_HOST_PKGS = "\
     nativesdk-openssl-dev \
     nativesdk-libelf \
     nativesdk-elfutils-dev \
     nativesdk-ncurses-terminfo-base \
     nativesdk-chrpath \
     nativesdk-tar \
     nativesdk-git \
     nativesdk-pigz \
     nativesdk-make \
     nativesdk-wget \
     nativesdk-ca-certificates \
     nativesdk-texinfo \
     nativesdk-libnss-nis \
     nativesdk-rpcsvc-proto \
     nativesdk-patch \
     nativesdk-automake \
     nativesdk-autoconf \
     nativesdk-binutils \
     nativesdk-binutils-symlinks \
     nativesdk-cpp \
     nativesdk-cpp-symlinks \
     nativesdk-gcc \
     nativesdk-gcc-symlinks \
     nativesdk-g++ \
     nativesdk-g++-symlinks \
     nativesdk-gettext \
     nativesdk-libatomic \
     nativesdk-libgcc \
     nativesdk-libstdc++ \
     nativesdk-libstdc++-dev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
     nativesdk-libxcrypt-dev \
"
KERNEL_DEV_HOST_PKGS_pn-uninative-tarball = ""
KERNEL_DEV_HOST_PKGS_pn-buildtools-tarball = ""
TOOLCHAIN_HOST_TASK_append = " ${KERNEL_DEV_HOST_PKGS}"

bitbake -c populate_sdk core-image-minimal

<extract and source sdk>

$ cat ld.so.conf
include /etc/ld.so.conf.d/*.conf
/buildarea/raid0/ovidiu/Builds/Yocto/yocto-latest/poky/build/tmp/deploy/sdk/sdk/sysroots/x86_64-pokysdk-linux/usr/lib
/buildarea/raid0/ovidiu/Builds/Yocto/yocto-latest/poky/build/tmp/deploy/sdk/sdk/sysroots/x86_64-pokysdk-linux/lib
include /etc/ld.so.conf

$ cat test.c
int main()
{
     return 0;
}
$ gcc -o test test.c -lcrypto
/buildarea/raid0/ovidiu/Builds/Yocto/yocto-latest/poky/build/tmp/deploy/sdk/sdk/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/10.1.0/../../../../x86_64-pokysdk-linux/bin/ld: 
/lib/x86_64-linux-gnu/libpthread.so.0: undefined reference to 
`__libc_vfork@GLIBC_PRIVATE'
collect2: error: ld returned 1 exit status


Before this change:

$ gcc -o test test.c -lcrypto
$ echo $?
0

Also, it seems that the scenario in which the SDK provides its own 
/etc/ld.so.conf and other nativesdk packages append to it did not 
operate correctly even before commit 
7ec84a463ad4c45aee9cd2cbc75b43e5aab5cd18, because host paths would be 
appended instead of SDK paths.


Maybe we should try in create_sdk_files to prepend all existing paths 
from /etc/ld.so.conf with ${SDK_OUTPUT}/${SDKPATHNATIVE} to solve this 
overwrite problem?


Ovidiu

>   
>   python check_sdk_sysroots() {
>
> 

--------------555AFD1B15E4E42139A4FCE0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 19.05.2020 07:36, Denys Dmytriyenko wrote:<br>
    </p>
    <blockquote type="cite"
      cite="mid:1589862981-21386-1-git-send-email-denis@denix.org">
      <pre class="moz-quote-pre" wrap="">From: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>

Commit 7ec84a463ad4c45aee9cd2cbc75b43e5aab5cd18 has moved creation of ld.so.conf
from buildtools-tarball.bb to create_sdk_files() in populate_sdk_base.bbclass.
But since create_sdk_files() is an SDK_POSTPROCESS_COMMAND, creating ld.so.conf
can potentially overwrite existing file already provided by a nativesdk package.
Use append instead to avoid overwriting existing file.

Signed-off-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 990505e..83c3448 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -189,7 +189,7 @@ fakeroot create_sdk_files() {
        mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
        echo '${SDKPATHNATIVE}${libdir_nativesdk}
 ${SDKPATHNATIVE}${base_libdir_nativesdk}
-include /etc/ld.so.conf' &gt; ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
+include /etc/ld.so.conf' &gt;&gt; ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
 }
</pre>
    </blockquote>
    <p>Hi Denys,</p>
    <p><br>
    </p>
    <p>With this change, in my testing (Ubuntu 18.04 server),
      nativesdk-gcc would still try to link with host libraries first
      rather than nativesdk ones, basically reverting the original
      intent of commit 7ec84a463ad4c45aee9cd2cbc75b43e5aab5cd18:</p>
    <p>local.conf:</p>
    <p>KERNEL_DEV_HOST_PKGS = "\<br>
          nativesdk-openssl-dev \<br>
          nativesdk-libelf \<br>
          nativesdk-elfutils-dev \<br>
          nativesdk-ncurses-terminfo-base \<br>
          nativesdk-chrpath \<br>
          nativesdk-tar \<br>
          nativesdk-git \<br>
          nativesdk-pigz \<br>
          nativesdk-make \<br>
          nativesdk-wget \<br>
          nativesdk-ca-certificates \<br>
          nativesdk-texinfo \<br>
          nativesdk-libnss-nis \<br>
          nativesdk-rpcsvc-proto \<br>
          nativesdk-patch \<br>
          nativesdk-automake \<br>
          nativesdk-autoconf \<br>
          nativesdk-binutils \<br>
          nativesdk-binutils-symlinks \<br>
          nativesdk-cpp \<br>
          nativesdk-cpp-symlinks \<br>
          nativesdk-gcc \<br>
          nativesdk-gcc-symlinks \<br>
          nativesdk-g++ \<br>
          nativesdk-g++-symlinks \<br>
          nativesdk-gettext \<br>
          nativesdk-libatomic \<br>
          nativesdk-libgcc \<br>
          nativesdk-libstdc++ \<br>
          nativesdk-libstdc++-dev \<br>
          nativesdk-libtool \<br>
          nativesdk-pkgconfig \<br>
          nativesdk-glibc-utils \<br>
          nativesdk-libxcrypt-dev \<br>
      "<br>
      KERNEL_DEV_HOST_PKGS_pn-uninative-tarball = ""<br>
      KERNEL_DEV_HOST_PKGS_pn-buildtools-tarball = ""<br>
      TOOLCHAIN_HOST_TASK_append = " ${KERNEL_DEV_HOST_PKGS}"<br>
    </p>
    <p>bitbake -c populate_sdk core-image-minimal</p>
    <p>&lt;extract and source sdk&gt;</p>
    <p>$ cat ld.so.conf<br>
      include /etc/ld.so.conf.d/*.conf<br>
/buildarea/raid0/ovidiu/Builds/Yocto/yocto-latest/poky/build/tmp/deploy/sdk/sdk/sysroots/x86_64-pokysdk-linux/usr/lib<br>
/buildarea/raid0/ovidiu/Builds/Yocto/yocto-latest/poky/build/tmp/deploy/sdk/sdk/sysroots/x86_64-pokysdk-linux/lib<br>
      include /etc/ld.so.conf</p>
    <p>$ cat test.c<br>
      int main()<br>
      {<br>
          return 0;<br>
      }<br>
      $ gcc -o test test.c -lcrypto<br>
/buildarea/raid0/ovidiu/Builds/Yocto/yocto-latest/poky/build/tmp/deploy/sdk/sdk/sysroots/x86_64-pokysdk-linux/usr/lib/gcc/x86_64-pokysdk-linux/10.1.0/../../../../x86_64-pokysdk-linux/bin/ld:
      /lib/x86_64-linux-gnu/libpthread.so.0: undefined reference to
      `__libc_vfork@GLIBC_PRIVATE'<br>
      collect2: error: ld returned 1 exit status<br>
    </p>
    <p><br>
    </p>
    <p>Before this change:</p>
    <p>$ gcc -o test test.c -lcrypto<br>
      $ echo $?<br>
      0<br>
      <br>
    </p>
    <p>Also, it seems that the scenario in which the SDK provides its
      own /etc/ld.so.conf and other nativesdk packages append to it did
      not operate correctly even before commit
      7ec84a463ad4c45aee9cd2cbc75b43e5aab5cd18, because host paths would
      be appended instead of SDK paths.<br>
    </p>
    <p><br>
    </p>
    <p>Maybe we should try in create_sdk_files to prepend all existing
      paths from /etc/ld.so.conf with ${SDK_OUTPUT}/${SDKPATHNATIVE} to
      solve this overwrite problem?<br>
    </p>
    <p><br>
    </p>
    <p>Ovidiu<br>
    </p>
    <blockquote type="cite"
      cite="mid:1589862981-21386-1-git-send-email-denis@denix.org">
      <pre class="moz-quote-pre" wrap=""> 
 python check_sdk_sysroots() {
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------555AFD1B15E4E42139A4FCE0--
