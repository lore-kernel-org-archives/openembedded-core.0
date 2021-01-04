Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.13468.1609766273901840401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 05:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HfOJ+Jym;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id r7so32111484wrc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Jan 2021 05:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3sHNlF1aZ04Oc4E/+UAs6/bO+Idr7ffW60NIxRchvio=;
        b=HfOJ+JymqdDW9lqdcG70UQ8H8N9vcguffVrnPsWRAxovkS5lRTtDPuzrkUUFF9bucX
         JXfXMPtubvwyp0jbqMNwh9JlcJuLBnWt6QXYa/wUjEVTN7QWSOMa3410Kmaj1jHks/Ac
         n6k+9o58+my05JBEXiGoHScmd9LvB+LD+pCws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3sHNlF1aZ04Oc4E/+UAs6/bO+Idr7ffW60NIxRchvio=;
        b=lIJMzJNeEHb8PgoEGZ6+DAjRBRqRq2RMKFzqjzTdcruUHqikMIsbuXW6tDXBxQSLan
         6nH9gN0hlU5AzhFxQDabqh7UfbhpB/6jars3FK2Gq1CowDMuxngagLZWNo2D66lfGrYr
         XBEcJGHm/drjCyCnkliLvV1XXR5Kw1CcfA8se1nsAaOc6r157FAF/9XhiCsjIvN39STl
         Bpn3qufKt505DmBitXb7fwXBWX+qbO5TJz4AP81d+iL7CHwxEhSzdUTUtPUKD7ZyqUnO
         OQcY8jo7+argoq0y1oZ7uPNyuJT/zp4SYW6Xa2VJ1KOr9sFQAaLo8gGFHA+1eWbOiqQq
         1J1w==
X-Gm-Message-State: AOAM530pq6GeN5vO7FQBDcW8TNAspAyDO4fpgjVnkrtg7Lr7f2Kvq0KE
	pjpOU2jHzuMus1F3WTnJ2duvOQ==
X-Google-Smtp-Source: ABdhPJx0LEYsxeBjCD1E6PCl9YmCUcsPaBN2/EmM4HkUP9oG9E8HBnU3u1hZ0EDJzegPBIqknzWWGw==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr80629725wrv.397.1609766272372;
        Mon, 04 Jan 2021 05:17:52 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4767:d28d:f91a:aa32? ([2001:8b0:aba:5f3c:4767:d28d:f91a:aa32])
        by smtp.gmail.com with ESMTPSA id o7sm92265673wrw.62.2021.01.04.05.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 05:17:52 -0800 (PST)
Message-ID: <52fb7011ab2c6d0698a347865c28173ff7721f50.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to SYSROOT_DIRS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Diego Sueiro <Diego.Sueiro@arm.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: nd <nd@arm.com>
Date: Mon, 04 Jan 2021 13:17:51 +0000
In-Reply-To: <AM6PR08MB3461DD31D010E15507D15B0892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
	<9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
	 <56b88a5513085b38781e02327537289d2fdd8203.camel@linuxfoundation.org>
	 <AM6PR08MB346196292FFCAE3C6499D55D92D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <688508925922a91f009ed5fdb25814d3cbd1cfee.camel@linuxfoundation.org>
	 <AM6PR08MB3461DD31D010E15507D15B0892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-04 at 13:07 +0000, Diego Sueiro wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > I think you are reading more into that manual section than is
> > intended.
> > For files on the general filesystem, the sysroot is definitely the
> > way to share
> > between recipes. For files that are not within the filesystem, I
> > think deploy is
> > more appropriate. We could improve the docs to mention that.
> > 
> > As such I don't really want to add a mechanism where we confuse
> > those lines
> > if we can help it and I am reluctant to take the patch. do_deploy
> > was designed
> > for these cases.
> > 
> For some arm based machines we end up generating loads of
> intermediate binaries
> which will be further processed and combined as standalone images,
> for example.
> I think doesn't make sense to have them in the deploy dir since it
> will make it
> polluted and I do much prefer to have a tidy deploy dir with only
> artifacts for
> flashing/update the target, rather than a list of useless artifacts
> that can't be used
> directly.
> 
> And I do agree with you that using the SYSROOT_DIRS for this purpose
> might lead
> to  confusion. Is it plausible to come up with a new variable and
> do_populate related
> tasks to address use cases like the one I described?

Not wanting to pollute DEPLOY_DIR_IMAGE with unneeded files is a
sensible thing to want to do. I'm wondering if we could use the deploy
code but point it at some different output directory?

The code for "do_deploy" is much simpler than populate_sysroot and
prepare_recipe_sysroot so I'd look at deploy.bbclass, its actually
really simple. In theory you could change do_deploy[sstate-outputdirs]
and it would place files in a different location. We'd just need to
figure out a good name for that alternative location...

Cheers,

Richard




