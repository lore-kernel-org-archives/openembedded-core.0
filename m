Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web11.2792.1602615285019554412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 11:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AKtoH+xo;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: andrey.z@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id r1so609368vsi.12
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zw29Jgcmeuo8CqX2jyQshNpcpO5wAXZGPVOxSLUT9Ls=;
        b=AKtoH+xoCq51Tcbmb1JyehJiEpV/aPugnv8eT8hRYeQLXjgqXG2qgk1P/8HaYLR8aA
         goa6yAhzwAdvh/9diMNUBt9TFirJM7zcGZRsb9ylBANNu9LCiaDg+ykadimFFIUIqW4I
         xg0aIOvW3X8OAf1QS/OifnpFWsW/XoJyNBMaQp7KoafAj6R3HYMPuCmoXRQSym0jY6I3
         XLZKg5vAbzBvpyZzJjGVLEU6Rzhc13LI2NXKYk0w0UWrHJIqv4xdcX47wZzonbQUiPDF
         gTtSpJ9/w7snYokbxUQlRCSbuHvmkiLHJ5mVPqUGLHrBfeSSMaFU1aMpygm18vZxnwcd
         NtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zw29Jgcmeuo8CqX2jyQshNpcpO5wAXZGPVOxSLUT9Ls=;
        b=sI8evb1cW3xuzMLQSKi0eT5WfBCsNoUpBclhOx2AWz/F7RBfOqNnAngMpqdUnM1mGm
         JQrfgpkzmAqvERPEWhJvTfJU7TcXMGqSxDOa19igkeJW3BF2+0CP3v7CLBRLXDxm9pfY
         7fPOieOCwa0lA5uVqSyfWBF+5RW2ng2QJg8Qvec0PTabb3TmZXYPEscAxE5TE2BEYoMw
         wtWxeQ3DK42fblqaXpVe93WLJIkKRyAqsINIOBfgZTCl0hTioid7g8Zy3at+d1eZfusB
         s2RyfA9Sw7/kbeCvpfNi8ALZ1X7yJKTIEqxoSXc8HG/BY+f5ooHEEYaERez7trPXtgNe
         p/AA==
X-Gm-Message-State: AOAM530DoM7MWab1GA9HpS1Gu65x0xYSRQGp+9itrXPHUmJWS23CKreS
	EsFjQxxEXOYmU+M/DQyAvz/FJs6frpwPGj6ON+Y=
X-Google-Smtp-Source: ABdhPJw0KdGi8kz8L6N8Pb085iWvuzx9qjSM+ZU/9TM02xEZWwRwj+SpyOjJGcznQpEoyQA7vqRlmT6FPFTuWPh6m5U=
X-Received: by 2002:a67:f657:: with SMTP id u23mr1113475vso.50.1602615283515;
 Tue, 13 Oct 2020 11:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201013173502.2245733-1-quaresma.jose@gmail.com> <20201013173502.2245733-4-quaresma.jose@gmail.com>
In-Reply-To: <20201013173502.2245733-4-quaresma.jose@gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 13 Oct 2020 20:54:29 +0200
Message-ID: <CAHtQpK7jDLgFq3GNgCW9A7PE-z-cdCn_4pceFKMFON_-CQWAJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] glslang: add receipe
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 7:35 PM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> Glslang is the official reference compiler front end for the
> OpenGL ES and OpenGL shading languages. It implements a strict interpretation
> of the specifications for these languages. It is open and free for anyone to use,
> either from a command line or programmatically.
>
> This receipe is needed to build the new shaderc
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../glslang/glslang_8.13.3559.bb              | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta/recipes-graphics/glslang/glslang_8.13.3559.bb
>
> diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3559.bb b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
> new file mode 100644
> index 0000000000..2008ba59d8
> --- /dev/null
> +++ b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "OpenGL / OpenGL ES Reference Compiler"
> +DESCRIPTION = "Glslang is the official reference compiler front end for the \
> +OpenGL ES and OpenGL shading languages. It implements a strict interpretation \
> +of the specifications for these languages. It is open and free for anyone to use, \
> +either from a command line or programmatically."
> +SECTION = "graphics"
> +HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
> +
> +SRC_URI = "https://github.com/KhronosGroup/glslang/archive/${PV}.tar.gz"
> +SRC_URI[md5sum] = "cb32322377cee2bc1cee5b60ebe46133"
> +SRC_URI[sha256sum] = "c58fdcf7e00943ba10f9ae565b2725ec9d5be7dab7c8e82cac72fcaa83c652ca"

Any reason why archive is preferred here over GIT? I can see that the
source repository has tags defined, so it would be better to use GIT
instead of archive here.

> +
> +inherit cmake python3native
> +
> +EXTRA_OECMAKE = ""
This is not needed, as there are no extra cmake arguments supplied anyway.

> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.28.0
>
>
> 
>


-- 
Regards,
Andrey.
