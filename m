Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.3265.1615450530242408429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 00:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WW/Oexki;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id m186so3142834qke.12
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 00:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Le8u46YGGQnIPz4XTNlNE20XfucB/1anWTdaolzKxcc=;
        b=WW/OexkiMkse3nQqXyooSeHsjHT1OjlAxqVxvNk5n2N0kXUJQmEAqIcJ3XO/kCtY45
         OzS0sjVUZvuazXl5mchAa0OHfbATkUx2tC+s+eWvwUgXr3/2aVmWcgn15upwjLhDJYut
         3KlNBxX1anXo8OZkAbuMcNvpP/mV8MaFIoa6e8r2mujWSzSyiIMuTM59h105YPeuKzAi
         JE4W/8xsXHOHHnVqIx4fqXHktnGwVK9qdUcy7EdvaSKulw8n/08pAnkNpqnt+zmbl0iK
         aheh720rUtbLq3iCGc6xNEXKKY+lxLZStZ11WnGvnYs1nFPGPrErSYKv7JfqIUZmFMMq
         o9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Le8u46YGGQnIPz4XTNlNE20XfucB/1anWTdaolzKxcc=;
        b=jprpkUJeU0CYFmqAyK9ke129G/qaQVQ4Ihchbg5MI7hnrDYTYBZH/F2gUqj7OV4IUD
         3bpXni5ueuGpFeOVNDRvupn7KynNV4P9Gr8NsJs3un4QUIaWBl6WahtewZTN3mgStuo5
         F1B9E+xk5l4e4FUPXupaATYaW4nzWyZJnORkSPvJ8uSoMykHCsuU6pEU6cxVhcjsARMz
         3F3EUgYbKXwApt0SpSt8N7E9pzcP+3L8NytfaJqeNym38qN9Z2Zql3pLfLFnBp99qfsa
         P35RyVO7Lnnsx4L0YdODW38cOGVXatw1Ym2EPSEypf3A8X3ah3Ya+Ik4OvGbhM02c8jf
         0KwQ==
X-Gm-Message-State: AOAM533AYumy/3KK1JZfOLzyURbX5g9jdxKVPEgVSiVurGpQKGOfj8bB
	NzzOzw3rDAbms/Xparrav3NNqVPP6fJeEVAXHjs=
X-Google-Smtp-Source: ABdhPJzgzdXFYtQSaLt2aar7f52kxDKG0H9OQvWWav9+e5nD/HIEWL58LlDr5gPpleZvxjkvY1XI1/2g/lMp+vmHkaE=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr6503247qki.25.1615450529146;
 Thu, 11 Mar 2021 00:15:29 -0800 (PST)
MIME-Version: 1.0
References: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1615376771-3093-1-git-send-email-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Mar 2021 00:15:02 -0800
Message-ID: <CAMKF1somxbuSmVp+EH0jJeBseGZo2Ndk_c=T+wO+cKyJkLzqSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] createrepo-c: upgrade 0.17.0 -> 0.17.1
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

seeing

ERROR: createrepo-c-0.17.1-r0 do_patch: Fuzz detected:

Applying patch 0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
patching file src/python/CMakeLists.txt
Hunk #1 succeeded at 14 with fuzz 1.


The context lines in the patches can be updated with devtool:

    devtool modify createrepo-c
    devtool finish --force-patch-refresh createrepo-c <layer_path>

Don't forget to review changes done by devtool!

ERROR: createrepo-c-0.17.1-r0 do_patch: QA Issue: Patch log indicates
that patches do not apply cleanly. [patch-fuzz]

On Wed, Mar 10, 2021 at 3:47 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../{createrepo-c_0.17.0.bb => createrepo-c_0.17.1.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.0.bb => createrepo-c_0.17.1.bb} (96%)
>
> diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
> similarity index 96%
> rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
> rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
> index e0433806b2..f621bff8a1 100644
> --- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.0.bb
> +++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.1.bb
> @@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
>             file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
>             "
>
> -SRCREV = "909a0636665ed96f97babc3b887f9badc88875c3"
> +SRCREV = "956a318b427e2489ccac754d199a09d32690ddc3"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> 
>
