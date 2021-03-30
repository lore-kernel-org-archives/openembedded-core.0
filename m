Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.2084.1617125391079763050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 10:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id jy13so26063268ejc.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 10:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJZmjlIg+F98ZW/uFV+MT52ZuCaHFlWHBOVhV9hRz+w=;
        b=Hno5SRBTpl+bJXd8yFKjvZA5Y/YinK2sgTdNLi/QIm19jEgZ0HGjnTpcSnl+ujL7AM
         rpxVSebMBy2rq/1RfGvg3FbNW14fcWydoo/695F6tsZucXrB/YDJ29YcNdg6T/dbV6cN
         Tu5wGVeU2tM6gRaruC/s8gYCyC/X4gi1R8RLrL7+wCW54Es4+EH/ifezsQILGXIs7MzD
         GI6R0abnPLdChqXuUr3oa7vrG1+R5LLOMHbwEUJMA1uCNw2yGMCRIv6v3QquJOeSfsRb
         VGpKCZelT2e+Onj9UUuG3LOQqwNNJpvyA4gLACBJeDZNyNKlwrieGz3chsawgnQUJJ4B
         hb9Q==
X-Gm-Message-State: AOAM533vo21QFFX36efx/j5IVLnU34DnggQo6nHOHOSMBWjAy85Q7MCP
	SCEqJ2nJDBLkWwMQ3ZG5fteFec0d6s8yJ/swmHA=
X-Google-Smtp-Source: ABdhPJzHd5EaUiqD2TNILYjXRjv/M8OK8nSdWeYM1rjCtTopnGKT6AfcRdQEgLxXFwKgOko/l3+jqLTlR9jnA8Q5K/0=
X-Received: by 2002:a17:906:23e9:: with SMTP id j9mr33238845ejg.78.1617125389525;
 Tue, 30 Mar 2021 10:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <16712EDBC9E446B5.24964@lists.openembedded.org>
In-Reply-To: <16712EDBC9E446B5.24964@lists.openembedded.org>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Tue, 30 Mar 2021 10:29:38 -0700
Message-ID: <CABcZANmkzd4nfvdAG_=KxHSd9ff7qMozvLdJ=M5f5P056WMuAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: add missing vardepsexcludes
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000066683305bec458e4"

--00000000000066683305bec458e4
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 30, 2021 at 10:27 AM Christopher Larson via
lists.openembedded.org <kergoth=gmail.com@lists.openembedded.org> wrote:

> For POPULATE_SDK_POST_TARGET_COMMAND, POPULATE_SDK_POST_HOST_COMMAND, and
> SDK_POSTPROCESS_COMMAND, the appropriate entries were added to
> vardepvalueexclude, but we want them in vardepsexclude as well.
>
>
Richard,

This fixes the failures
in sstatetests.SStateTests.test_sstate_noop_samesigs seen with my other
patch (image,populate_sdk_base: move 'func' flag setting for sdk command
vars) applied. Thanks.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--00000000000066683305bec458e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 30, 2021 at 10:27 AM Chri=
stopher Larson via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;kergoth=3D<a href=3D"mailto:gmail.com@lists.openembedded.o=
rg">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">For POPULATE_SDK_POST_TARGET_COMMAND, P=
OPULATE_SDK_POST_HOST_COMMAND, and SDK_POSTPROCESS_COMMAND, the appropriate=
 entries were added to vardepvalueexclude, but we want them in vardepsexclu=
de as well.<br>
<br>
</blockquote></div><br clear=3D"all"><div>Richard,</div><div><br></div><div=
>This fixes the failures in=C2=A0sstatetests.SStateTests.test_sstate_noop_s=
amesigs=C2=A0seen with my other patch (image,populate_sdk_base: move &#39;f=
unc&#39; flag setting for sdk command vars) applied. Thanks.</div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"=
ltr"><div><div dir=3D"ltr"><div>Christopher Larson<br>kergoth at gmail dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engin=
eer, Mentor Graphics</div></div></div></div></div></div></div></div>

--00000000000066683305bec458e4--
