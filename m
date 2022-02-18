Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E14C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 00:20:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.4777.1645143620857770276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 16:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WRT6rzMx;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: armccurdy@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id p9so11692941wra.12;
        Thu, 17 Feb 2022 16:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q+8AnnXYGFIjFtC6Ztyr4HAqs2LdUlT4q9lWGIbz3eQ=;
        b=WRT6rzMx7PuEfdoIHY9J7QaON072LM9heTsfDzyOPfji2CPvPGEQldMvLRHBW2+trk
         aeZScNnSclpt/wE9ay8ffUyyxNKsOCZYzcR3hWfmjJcZif/GpTuRT65n46zzY5QvM4HU
         2oxhh5zNuWg3PpIto9Uqt4AQV2VwpS+jS7UTZh4JCI5O4zqpmBwrjneDf6Q4AP1y5M1J
         CkoRrVULHnM27d32Pn1Zo2Z515J4t52c1K0S8RnNyvFQahVK4nU/wYvBsWnhIqAGF+OJ
         LCQyOMs/R6mPiDNWJZlpaj4GRP85/7xWOGShSZGei/1vQ9htviHo7XYxxec2hlUt+kHw
         VHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q+8AnnXYGFIjFtC6Ztyr4HAqs2LdUlT4q9lWGIbz3eQ=;
        b=vnJfMLPIYI+KWEiD39zsSNUOo4n4hJjIoFLXCWTDUThNSRCuODc8JUzlIBX717QZWH
         AQPe1WRU+GUaO1++Alz7Q7aAT+Y8J5sEZkowNri6opz67dp2KdXwBaW2rF/o44AtpuBH
         9RRWICUXXpruhft+7/JY3B+bBKrRQvnQ+tudqj472aploOsHpt1Rbs+zaO7/AhsMp9va
         apIZeqy9aNB3Du8LV9eRsWNLWSJTlquU0I00CUuCjPgpeLcQuXjVyUAOOo4JrlJC+PHu
         KCRRCACKr5/EfHIJf1SU9dtd8wDXvgQzRMB8a06NYq6a7nYGLiEZpC7Lo9hQdyNLxQHL
         oqPg==
X-Gm-Message-State: AOAM531nggHgSBuMzy7E53/1JrOU+XV4so8DInpUb18ISZJ59MCyFbnM
	eBz2B5sHJBGIjNRBk1PRrmZhsPmwBooW9LUJ3O4=
X-Google-Smtp-Source: 
 ABdhPJxrzJzaELZUivldqjAjsaoJEGTWH+T49mXmcTuxGJPSRNjs+P/OWpzX4E+oirtktjDE0hcWyGSIleGpi94V/7E=
X-Received: by 2002:adf:fb4e:0:b0:1e3:3e66:d5f6 with SMTP id
 c14-20020adffb4e000000b001e33e66d5f6mr4245085wrs.615.1645143619008; Thu, 17
 Feb 2022 16:20:19 -0800 (PST)
MIME-Version: 1.0
References: <7d187920-92f0-a0fe-22b9-a77a1c98fd7d@windriver.com>
In-Reply-To: <7d187920-92f0-a0fe-22b9-a77a1c98fd7d@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 17 Feb 2022 16:20:01 -0800
Message-ID: 
 <CAJ86T=VF+6J3UBJ-=rYt=rODkdP=H73cWFXyE0YfJCaYJfb1oQ@mail.gmail.com>
Subject: Re: [oe] INCOMPATIBLE_LICENSES and WHITELIST_<license> usage
To: Saul Wold <Saul.Wold@windriver.com>
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 00:20:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161875

On Thu, Feb 17, 2022 at 3:01 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>
> Folks,
>
> I am working on a proposal to re-write how INCOMPATIBLE_LICENSES is used
> and processed to possibly include a COMPATIBLE_LICENSES variable as
> well, see PeterK's email [0]
>
> I am trying to determine the usage of WHITELIST_<license> which would be
> used to override a license that might be listed in INCOMPATIBLE_LICENSES
> variable.
>
> Randy and I have done a quick and dirty survey of a 100 or so layers
> (thanks Randy) and could not find any real usage other than what's
> currently in OE-Core for WHITELIST_GPL-3.0.
>
> If you are using WHITELIST_<license>, please let me reply with your usage.

Common case seems to be allowing gdb in debug builds of distros which
are otherwise free of GPLv3 etc, e.g.

  https://github.com/MentorEmbedded/meta-mentor/blob/master/meta-mel/conf/distro/include/gdbserver-gplv3.inc
  https://github.com/lgirdk/meta-mng/blob/ofw-2112.6/conf/distro/mng.conf

