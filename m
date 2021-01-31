Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.17196.1612094205726541925
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 03:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DytLR7RB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f49.google.com with SMTP id a9so1431977ejr.2
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 03:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Q2SG98wsp8zIJ5yyz3JrahLp0ySOZ+9jg0vAUZfVYew=;
        b=DytLR7RBU5PREK8FzO2QYHA9XlBC5GcAc8Tr7QrgqWk8/nJktm0EY/+06t2f2v+141
         O7zbkr6U9k0EsPq2x5t3otVU6CrKMuvwpfxGtMJpDkIaFJDVn3BRsv3SEjonDv7rDmsD
         w5JBst5A0kQ4//YAs5QjeTcKUBcmOhPQi8xg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Q2SG98wsp8zIJ5yyz3JrahLp0ySOZ+9jg0vAUZfVYew=;
        b=KWvMMZ5LgTcJwbFiY9O7BifBOgXaH775QfoJGLsuFLDvh4QMFkza6U5ASDJS/0oGNH
         HCU8c0DdZsESl7QEie5DSwWsa4tcJn49HVR51W2J2MZ1NhD/ga2gZ2Xt4p7GPdeCJ2sa
         WmXlDe5zHY8UAQfgmcgmF8eqtAaSWHCh+h23Y5J5REhcr2VQKS6D+BjV7MzBa6U8L7Ky
         eDX/yXLihk9lm/sb7eBZXvN6mjuSgqDknuURM6W1rXmPRmnACBnLwXrX3X/ZKnLnSVdU
         Pa8PaGGJpz6PXHpQP7K/3A7eLjJc365n4eF3jnDxdRaxXc+oJ5Slgxo32wWKLh9kv+sC
         RfkA==
X-Gm-Message-State: AOAM532Z8UWMkZkz/MBqp8vSycMifkwrU5VBeA8/JNUrXqamIzO9+j9R
	ANdAWDjmLm089B63C0tcIb6mCg==
X-Google-Smtp-Source: ABdhPJyaiW4N+ALr+Vuw+HXbIFlrS5RSeHVJOIFJarLTHYAuyTG+kiOrkrdwtFsrrhYsYPt6FQLPLg==
X-Received: by 2002:a17:906:b351:: with SMTP id cd17mr2773919ejb.110.1612094204131;
        Sun, 31 Jan 2021 03:56:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:29f7:5a4e:c660:258e? ([2001:8b0:aba:5f3c:29f7:5a4e:c660:258e])
        by smtp.gmail.com with ESMTPSA id e8sm1853175edy.91.2021.01.31.03.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:56:43 -0800 (PST)
Message-ID: <1317ee75cd0f9e9dd794d7dea78e007f291eeddf.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add procps-lib to RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, Joshua Watt
 <JPEW.hacker@gmail.com>
Date: Sun, 31 Jan 2021 11:56:42 +0000
In-Reply-To: <165F4E547FA339C3.13584@lists.openembedded.org>
References: <20210120050318.10376-1-Qi.Chen@windriver.com>
	 <165F4E547FA339C3.13584@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-01-31 at 11:41 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2021-01-20 at 13:03 +0800, Chen Qi wrote:
> > Build error occurs as below:
> > 
> >   ERROR: igt-gpu-tools-1.25+gitAUTOINC+d16ad07e7f-r0 do_package_qa:
> >          QA Issue: /usr/lib/libigt.so.0 contained in package igt-gpu-tools
> > 	 requires libprocps.so.8(LIBPROCPS_0)(64bit), but no providers
> > 	 found in RDEPENDS_igt-gpu-tools? [file-rdeps]
> > 
> > Add procps-lib to RDEPENDS to solve this issue.
> > 
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > index 89480d79d2..b012dbf58e 100644
> > --- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > @@ -15,7 +15,7 @@ SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
> >  S = "${WORKDIR}/git"
> >  
> > 
> > 
> > 
> >  DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native"
> > -RDEPENDS_${PN} += "bash"
> > +RDEPENDS_${PN} += "bash procps-lib"
> >  RDEPENDS_${PN}-tests += "bash"
> > 
> 
> 
> You are correct about this and I see the same issue if I build it
> locally. What worries me is why we don't see this on the autobuilder in
> world builds?
> 
> Cc'ing Anuj as the maintainer.

Looking at the autobuilder logs, I think I can guess the problem, I
think its a hash equivalence issue.

Errors raised by do_package_qa aren't reflected in the output so it
would error once and then never again as the output wouldn't seen
changed next time :(

We'll have to fix this, its nasty.

Cc: Joshua

Cheers,

Richard




