Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.2837.1592855184038526262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 12:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GbM7qjva;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id r15so743342wmh.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EY1BQOmepe3qZuorlv1RdXNsc7JEB5MFJ6V1ANWXwpg=;
        b=GbM7qjvaMHooD70WXlyK7fEN2Hl4/ucn0IeH1Tx4pNoxHYzLpMqcNskWkmmj/GEJKb
         me9xJv6VNpoxyKmueluvf3JfPtXcPaK0URYBjdxNwv+3EnxnKwoY/9Hr5azH7M4LyDNB
         ZrS8qP+4z22G4296zivUTXF6S7PVi9/GpUia0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EY1BQOmepe3qZuorlv1RdXNsc7JEB5MFJ6V1ANWXwpg=;
        b=pmIz9dolaQeA+o7ab5JoBzpXcZ9py17hooa2uXU8GknHdpVbQUOSb5F/skm/2f/1wd
         gwLElEVkhwPyTCtqh/cirC+GCeCl0gYq5I+dsFqPIXZrvcOuqrgVE3c+g2Nn7RCgW83L
         DhMTfu7H9til+nSmn6BoBJiNQxl5ETOQUGZiABzBzKlMHN7Oq9ktNc5AiFB8rqLmQM32
         /7HdOtWMiGIvhiQ4zCRHpoin5F/fjjzQIVa2riLWfTbJdECP1+PuyrlkWPoU+Npkd5sk
         GI8RuSa2yyh2lZ2L8dIdlXegxKu9RdGYnqEPlX3UGrrsFtY6UiSRpFkkc7n57kHCGpYg
         YmuA==
X-Gm-Message-State: AOAM531aIIqjpkz3J5gKRJGZOdJhClnzKuYKRNNFMjEw2132g6kk3V5u
	ZwFS+fcHS+kID09n5wM08PI09g==
X-Google-Smtp-Source: ABdhPJycmXVSk20z+dsvB2qdwRCLi4QsPfljdcHr1c9MF+MvW0WKXt4ocMio3PhSs+sO1/6D5+IVzg==
X-Received: by 2002:a1c:a5d6:: with SMTP id o205mr10697210wme.125.1592855182475;
        Mon, 22 Jun 2020 12:46:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k16sm19291927wrp.66.2020.06.22.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 12:46:21 -0700 (PDT)
Message-ID: <99faa5b760906bbec58cd306d5410107a1f06f2e.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Jun 2020 20:46:20 +0100
In-Reply-To: <CAO5Uq5R-oXNuqoVPpoC288smwDH459tjik6aB=B1+aOsT+dayA@mail.gmail.com>
References: <20200622105717.108062-1-alex.kiernan@gmail.com>
	 <2fd43b04ea22019411e3e01669e879a838781e8f.camel@linuxfoundation.org>
	 <CAO5Uq5R-oXNuqoVPpoC288smwDH459tjik6aB=B1+aOsT+dayA@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-22 at 19:53 +0100, Alex Kiernan wrote:
> On Mon, Jun 22, 2020 at 6:34 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2020-06-22 at 11:57 +0100, Alex Kiernan wrote:
> > > Generate output for each contaminated path so it's visible in the main
> > > log file, then enable rootfs_check_host_user_contaminated by default.
> > > 
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > > 
> > > Changes in v2:
> > > - expose each contaminated path in the main log
> > > 
> > >  meta/classes/rootfs-postcommands.bbclass | 9 ++++-----
> > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > Thanks, this is definitely more helpful. Some warnings in the test
> > build:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/2046
> > 
> > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd
> > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/sm.bak
> > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/state
> > step1b: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/lib/nfs/statd/sm
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/2073
> > 
> > step3b: WARNING: core-image-sato-1.0-r0 do_rootfs: Path in the rootfs is owned by the same user or group as the user running bitbake: /var/cache/fontconfig/CACHEDIR.TAG
> > 
> > which does raise more questions.
> > 
> 
> I'm having no luck reproducing either of these locally :|

They don't reproduce on the autobuilder either. We're probably going to
need to open a bug in bugzilla and enter these there listing the target
that caused it and the host it was on.

Hopefully we'll see a pattern emerge.

Or maybe the pseudo fix I posted will make it all go away. I can live
in hope right?!

Either way, I think this patch is going to be a longer journey until we
figure out what is happening.

Cheers,

Richard

