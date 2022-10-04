Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BB3C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 11:38:47 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.9402.1664883523494852696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 04:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=umA7ofFs;
 spf=pass (domain: linaro.org, ip: 209.85.208.176,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id o17so1734570ljj.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 04:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=bZDWBu/JVpV8ial4FNgIEseiTLahEwA5A/X3Cg7TYHE=;
        b=umA7ofFsCIhCwHT3YtGVok+zSZA/8cyipniJwLMFr3rtlQRtdHTKuGSC53PWUrgePs
         K7mm35eXIt2a9sDqjrKA6xj8Fow9eZFPE/kttBMNxKqBOuEEqYSx98ik3trMXY4Pr53M
         jFWvAeY583bJO6GQ6uNShAfdsi1oUSqMaQHQdpMlh4OkMWs2NSZ8fgm1Gmou+0jo4Tp4
         MI2oikGueBLAhMYFsri3r6dhKcHgtSrFlTalMG1PzaHUkBeWchUc5ww9y/ZojmraYlCE
         fk9peYGpyfNrErT2TqrwAJ0w3Ii9wBs0O9Evia2aMZggOenLUducDyRXREADpELHIt+A
         FYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bZDWBu/JVpV8ial4FNgIEseiTLahEwA5A/X3Cg7TYHE=;
        b=pV9qo2ERrM92nytD49LqvthzNYWtaqPiP2mdX6ADBM1ubmdc2W88imZpZ8DrwTWVe1
         bDp4JabIlHNOg/pyiu+6tUfy7rMxo0LuYMUQ6LjEJDasi7eT9Dr2O9tnQZQamd4s4hn6
         p2jDMV0GCWRbo1SJleerDfZkrjmTAGrPCRyTEA05ZVYTpUZQNCXeXnx2S8NyB2UVtAec
         rahdJ/9dtZMxe0E/M85ihZieoswXXm69LqxEE8lA7ztaDqeunhKj7NYWfKifK54Hj+am
         mYi5+OhGRGalZw6LJk0+jJ5EXDRBD365bKULlYsKZa/Qxgg3KvU+aZuJtyuCWvA7VUa9
         JxPw==
X-Gm-Message-State: ACrzQf1mcUez6DBqpi9T2iySgsnm9SlZ5RKmqpBBLhnGrMy040NbUy/g
	o4aalGLR18iwndjljgPqFhnxUA==
X-Google-Smtp-Source: 
 AMsMyM474pq3IV7Q6Iry+V1G+6dxj7oYAnQoV6bPRdifJ3kmwW4bZJ/1xRiGnyJcK64M/AleK06PXw==
X-Received: by 2002:a2e:9942:0:b0:26d:daa0:6d77 with SMTP id
 r2-20020a2e9942000000b0026ddaa06d77mr3048274ljj.266.1664883521572;
        Tue, 04 Oct 2022 04:38:41 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id
 o12-20020a056512230c00b0049a5a59aa68sm1881942lfu.10.2022.10.04.04.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 04:38:41 -0700 (PDT)
Date: Tue, 4 Oct 2022 14:38:38 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 1/4] openssl-native.bbclass: add bbclass
Message-ID: <YzwbPsiFw9YDMAWe@nuoska>
References: <20221004101038.2736600-1-mikko.rapeli@linaro.org>
 <99339c298138b6f300146d81beec455815b11771.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <99339c298138b6f300146d81beec455815b11771.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 11:38:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171388

Hi,

On Tue, Oct 04, 2022 at 12:09:18PM +0100, Richard Purdie wrote:
> Hi Mikko,
> 
> Thanks for working on this, particularly with upstream.
> 
> On Tue, 2022-10-04 at 13:10 +0300, Mikko Rapeli wrote:
> > Using openssl-native shared libraries correctly is hard. A number
> > of environment variables need to be correctly set or
> > the errors may be really confusing. openssl can be made
> > to detect these paths automatically, but upstream has rejected
> > these ideas. openssl-native provides a wrapper script for 'openssl'
> > binary, but shared library users like python3-cryptgraphy-native
> > need to have the shared libraries working directly. Thus follow
> > example from python3native.bbclass and implement this via
> > openssl-native.bbclass.
> > 
> > If full certificate checking is needed, then users
> > also need to DEPEND on ca-certificates-native.
> > 
> > See also:
> > https://lists.openembedded.org/g/openembedded-core/topic/93651845#170562
> > https://github.com/openssl/openssl/issues/19242
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  documentation/ref-manual/classes.rst               | 11 +++++++++++
> >  meta/classes/openssl-native.bbclass                |  7 +++++++
> >  meta/recipes-connectivity/openssl/openssl_3.0.5.bb |  1 +
> >  3 files changed, 19 insertions(+)
> 
> Docs are in a different repo to OE-Core so this patch would need to be
> split.

Ok, will split them.

> I think it is worth referencing this too:
> 
> https://github.com/openssl/openssl/pull/19260

Ok, will add.

> I noticed there that the patches have thrown some compiler warnings:
> 
> crypto/conf/conf_mod.c:667:20: error: passing 'const char *(int)' to parameter of type 'const void *' converts between void pointer and function pointer [-Werror,-Wpedantic]
>         if (dladdr(OpenSSL_version, &info)) {
> crypto/conf/conf_mod.c: In function 'CONF_get1_default_config_file':
> crypto/conf/conf_mod.c:667:20: error: ISO C forbids passing argument 1 of 'dladdr' between function pointer and 'void *' [-Werror=pedantic]
>   667 |         if (dladdr(OpenSSL_version, &info)) {
>       |                    ^~~~~~~~~~~~~~~
> In file included from /usr/aarch64-linux-gnu/include/link.h:25,
>                  from crypto/conf/conf_mod.c:34:
> /usr/aarch64-linux-gnu/include/dlfcn.h:98:32: note: expected 'const void *' but argument is of type 'const char * (*)(int)'
>    98 | extern int dladdr (const void *__address, Dl_info *__info)
> 
> 
> It may be worth fixing those just in case they consider the patch.

Yes, but the general design of using dladdr(OpenSSL_version,...) did not
get any positive comments in the bug report so I think this is wasted
effort.

> I'm wondering whether we should just carry those patches? They don't
> look so invasive and it would save complicating things elsewhere in our
> codebase...

I don't think so. For every variable the patch is annoyingly different
and there are merge/rebase conflicts with newer upstream releases
already.

I think pyton3native.bbclass sets the example. Variables need to be set
for openssl to work correctly after relocation to paths not known at
compile time. Same applies to any code which needs to dlopen() something
or which has custom locations for modules, data or configuration files.

Cheers,

-Mikko

