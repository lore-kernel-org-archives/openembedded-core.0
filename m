Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5949E92FF3
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 07:20:46 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.7452.1696576842548680184
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 00:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RoGYKz/c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-405524e6769so10859405e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 00:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696576841; x=1697181641; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/HYuD1Dk9cYLx5PKrSBjjAoHhE/b7uklLgPEzZc8oc=;
        b=RoGYKz/c5AgclKAOOHlsPjOpr+Mn8dLaA4BHfLyUVUMj6tnLFOeSzxRahIeQ/tHB5W
         WowagXadCPAWF8FQf6VwbPFQFKEkOA69vt4s6kiJEaoZuWd2j5Qi3/DJaXVnFA5ECwI8
         31toH7FAIfNjDi8BPgWjiwEYB1Ia4nM+TV8Ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696576841; x=1697181641;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j/HYuD1Dk9cYLx5PKrSBjjAoHhE/b7uklLgPEzZc8oc=;
        b=QeC4VmwTJZRwcJ8lnCwRE3+w0eNUCitYBiX+nZyVgHpwSSSz4tihGQYOMa4MBNBHTG
         8LQnV1kXc3Q+ngg+hgB4K9g4KBzX+Zi4Qc2ASs/rONEnTz8b9Njf1ZOCezDMjiq//dui
         PgKPWqbEKoEvGcdaaeb1vJbo1C1bpvoeJlOdrCA1r6H9Dpa0SRT2i5SYXwzon4bSNzF6
         WdAu6RUCobbdiinMbHM9K6FcaDFN18pdsRAaB/iPAml6ZnC3VbRMN/s7Qk+1aHknT95y
         XIkrPuDJ07vvut+Z7RX5nHynvdWwGehqOxN8k1On/jWX8urmh/ZFce8ofEf1qMA3+x+s
         7h8A==
X-Gm-Message-State: AOJu0YxZwOTWY7AJj8jFkGZeqlv0hCHLsYi+Uc2eP4Ql7VR/sEHJLI/7
	KCFti9rEz9cG+upXqGWrQlysyA==
X-Google-Smtp-Source: AGHT+IFGf2hWfNNXPWOtdo+saY2hWCy+iS8GfeU1R9Pd0Zc4D8OgzmDqPW2SlrdAuw78i1BmM3npcQ==
X-Received: by 2002:a1c:7c0d:0:b0:405:3aad:7575 with SMTP id x13-20020a1c7c0d000000b004053aad7575mr4203199wmc.17.1696576840941;
        Fri, 06 Oct 2023 00:20:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2964:cec5:fab8:2212? ([2001:8b0:aba:5f3c:2964:cec5:fab8:2212])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2a40d287sm3122884wmm.1.2023.10.06.00.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 00:20:40 -0700 (PDT)
Message-ID: <e67fd6de2709e6ebc48e6384aeb720cf3c1b5d44.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/4] insane: Add unimplemented-ptest checks
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Oct 2023 08:20:38 +0100
In-Reply-To: <20231004125731.1785803-1-yoann.congal@smile.fr>
References: <20231004125731.1785803-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 07:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188747

On Wed, 2023-10-04 at 14:57 +0200, Yoann Congal wrote:
> To increase ptest coverage we can check if the sources of a recipe looks =
like
> it contains unittest and warn the user that a test may be implemented the=
re.
>=20
> This series provide the check infrastructure as a package QA check and so=
me checks for :
> python pytest, perl Test::, meson, cmake, autotools-based tests... as wel=
l as
> the naive check of "Is there a test/ directory in the sources?" which wor=
k
> surprisingly well.
>=20
> Currently, this check find:
> * 309 unimplemented ptest in oe-core/meta-poky/meta-yocto-bsp
> * 827 unimplemented ptest in meta-openembedded
>=20
> Full list : https://gist.githubusercontent.com/ycongal-smile/0969e92aec1c=
a37e61b6cdbcaf1f6885/raw/b1be8a5b576e144b6563f5481d31b32de9b22368/gistfile1=
.txt
>=20
> v1->v2:
> * Corrected: shortlog tag
> * Fixed infinite loop on source package containing symlink loops (e.g. md=
5deep)
> * Added test result
>=20
> J=C3=A9r=C3=A9my Rosen (4):
>   insane: Add unimplemented-ptest infrastructure
>   insane: Detect python and perl based tests
>   insane: Detect build-system test harnesses
>   insane: Add a naive heuristic to detect test subdirectories
>=20
>  meta/classes-global/insane.bbclass | 50 ++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Somehow this series causes:

oe-selftest -r
sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs

to fail and the other test failures in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5816/step=
s/14/logs/stdio

I've not looked into why, just narrowed it to this series.

Cheers,

Richard



