Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C97C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:19:31 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.8371.1634213969081913267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dDfP+tAb;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id ls18so4615033pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kABrD3bvp6hds5l16SRNOUfHEJ7ZEXzrjU3mq2v9XOA=;
        b=dDfP+tAbqMXQBysiRztbGznj8EHsR4I3WdwBuvQEDNixLQ10vM2xPh5tNkmgrcdBnt
         k1olHpjVWTwS9dWvEg0C09M25IGrbCJ4IZcaj3eVGTAE/gTaWYBYcoq5geCt0+/X4UwK
         cIHNMUVexmYPtR2m/RoAyH3Ig98YnD7CqbKDOafVfOju4ple+mkPflbUMn/fQCqde76x
         0q+LyPO/HVqsoBJybTlm6yUcSduEqtUPx11To00IYiKXorUc69nlL+5dcy+Sp07q9v7M
         HAdjJWx0zFQYGrKtQ3NJig2RYN6kkzdGILD+o6DBxeDgELlfcGYnnarPc5Vb/dwOXDLv
         +Ztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kABrD3bvp6hds5l16SRNOUfHEJ7ZEXzrjU3mq2v9XOA=;
        b=KV1LwMEIuW+1mMnpD9DNIxg1iXE/LpBXJp1QPJn8Pxb774hmsHOa3ylkYDy34GHtYd
         0fdePaqgEShRy79WjshN39K5BDH67nI+Qpvz+cZPgxlUE/zDapFbd+mj46j0mUXrm0xL
         jD/1VgLZHQBkm+CQE8TdwXkWSnfA/l5gktbe9x+xK0fATOx5xlRYax5ubmhFG9UOCpNS
         eh5tGTyNVvbY2JGq29BjVn3hhqaaNHwihaFth851XTzz4tWw1zZiltwYEllmvqPwmlHj
         isxVaNaAjgYbdG1YjHrI79jMgGuN+nzYy9SrZ+d2vmzVopVLv2XY0jIZYIKjs8KKsk2N
         j9kw==
X-Gm-Message-State: AOAM530RgAt4v+ZUS93kQfTSst3/rQC9AZZiCeCuWzSxopae5meSNqiQ
	KhYjm6ufN5FzUQL8J7WzqbMdICBJxA0bTuCYSmQ=
X-Google-Smtp-Source: 
 ABdhPJywT43ujQTudjnVwIh5FdyFwk5g6OKRIxlX3BUeiZ+/P9sTQRsZ5aFX1RT9EuDgdoL3JG0cBIGspe2nPy+RsGE=
X-Received: by 2002:a17:90a:df0e:: with SMTP id
 gp14mr5812094pjb.35.1634213968618;
 Thu, 14 Oct 2021 05:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
 <20210908180125.103473-5-alex.kanavin@gmail.com>
In-Reply-To: <20210908180125.103473-5-alex.kanavin@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Oct 2021 14:19:17 +0200
Message-ID: 
 <CA+chaQf-d6NxyzxaOr6GkNx+x6eNswS_JPDghUXrUV7pUcMctQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/26] rpm: update 4.16.1.3 -> 4.17.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000016287d05ce4f17d4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:19:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156944

--00000000000016287d05ce4f17d4
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 8, 2021 at 8:01 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> The flagship features are migration from bdb to sqlite and zstd support,
> both are enabled and taken into use. The relationship and upstream
> preference
> between sqlite and ndb formats isn't quite clear.
>

FYI: interesting side-effect of bdb removal in
https://github.com/rpm-software-management/rpm/commit/4290300e24c5ab17c615b6108f38438e31eeb1d0
was that in some of our builds I've started to see:
ERROR: rpm-native-1_4.17.0-r0 do_configure: QA Issue: rpm-native: configure
was passed unrecognised options: --without-api-sanity-checker
--without-abi-compliance-checker [unknown-configure-option]

And the interesting part is that reporting unrecognised options stops
working (enable_option_checking=no gets set in generated configure) when
there is AC_CONFIG_SUBDIRS in configure.ac (even when not actively being
used as in
https://github.com/rpm-software-management/rpm/commit/4290300e24c5ab17c615b6108f38438e31eeb1d0#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810L509
when not using internal bdb), see
https://git.savannah.gnu.org/cgit/autoconf.git/tree/lib/autoconf/status.m4#n1099

The unrecognized options were used since rpm-5 was removed in 2017 with:
https://git.openembedded.org/openembedded-core/commit/?id=d0365f35303db3595688a6e5290677e02a72c54e
but they didn't make it to QA issue, because of configure behavior.

Regards,

--00000000000016287d05ce4f17d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Sep 8, 2021 at 8:01 PM Alexander =
Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">ale=
x.kanavin@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">The flagship features are mig=
ration from bdb to sqlite and zstd support,<br>
both are enabled and taken into use. The relationship and upstream preferen=
ce<br>
between sqlite and ndb formats isn&#39;t quite clear.<br></blockquote><div>=
<br></div><div>FYI: interesting side-effect of bdb removal in</div><div><a =
href=3D"https://github.com/rpm-software-management/rpm/commit/4290300e24c5a=
b17c615b6108f38438e31eeb1d0">https://github.com/rpm-software-management/rpm=
/commit/4290300e24c5ab17c615b6108f38438e31eeb1d0</a></div><div>was that in =
some of our builds I&#39;ve started to see:</div><div>ERROR: rpm-native-1_4=
.17.0-r0 do_configure: QA Issue: rpm-native: configure was passed unrecogni=
sed options: --without-api-sanity-checker --without-abi-compliance-checker =
[unknown-configure-option]</div><div><br></div><div>And the interesting par=
t is that reporting unrecognised options stops working (enable_option_check=
ing=3Dno gets set in generated configure) when there is=C2=A0AC_CONFIG_SUBD=
IRS in <a href=3D"http://configure.ac">configure.ac</a> (even when not acti=
vely being used as in <a href=3D"https://github.com/rpm-software-management=
/rpm/commit/4290300e24c5ab17c615b6108f38438e31eeb1d0#diff-49473dca262eeab3b=
4a43002adb08b4db31020d190caaad1594b47f1d5daa810L509">https://github.com/rpm=
-software-management/rpm/commit/4290300e24c5ab17c615b6108f38438e31eeb1d0#di=
ff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810L509</a>=
 when not using internal bdb), see=C2=A0<a href=3D"https://git.savannah.gnu=
.org/cgit/autoconf.git/tree/lib/autoconf/status.m4#n1099">https://git.savan=
nah.gnu.org/cgit/autoconf.git/tree/lib/autoconf/status.m4#n1099</a></div><d=
iv><br></div><div>The unrecognized options were used since rpm-5 was remove=
d in 2017 with:</div><div><a href=3D"https://git.openembedded.org/openembed=
ded-core/commit/?id=3Dd0365f35303db3595688a6e5290677e02a72c54e" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3Dd0365f35=
303db3595688a6e5290677e02a72c54e</a></div><div>but they didn&#39;t make it =
to QA issue, because of configure behavior.</div><div><br></div><div>Regard=
s,</div></div></div>

--00000000000016287d05ce4f17d4--

