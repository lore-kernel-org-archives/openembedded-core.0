Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B743DC433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 16:58:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.47423.1635785887433550749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 09:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WutP/BW6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id m22so29143566wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RC35jVeAm1c+bHu2nlI563hOM87p6bCZuYJTfAVXR7o=;
        b=WutP/BW6Dyg2Exj08XxOgmB9ljUW/Wfqi+wP3bxjlyS5Qdw3jtUznF7oMysvSkTjR/
         hMogdIwmGME1zxnZqxUn/nEPFNYQeNXNpLdRuV8mMMl8AIEE3SKYmJHXbF1KQubUxTGB
         YrgNKH41t20+4Q6+OGlCt7jlMMgep2VjNt1SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RC35jVeAm1c+bHu2nlI563hOM87p6bCZuYJTfAVXR7o=;
        b=TYjLfeu3JqaamuY68xa+VkblpFsklxbnqdyBUwzrytp+yWYZ2AGMvGtEmybGqI051Z
         dRluYlcwiC8c4a+sd2Q57E1pj1jutyPLJtrDw2enG7MgCrKbYLh5cxQa8W9F6c+8VMAe
         IXE0XCbnZSpksHsH/wu13IJcPUMXpGIlhkd3lw2aDVKpaQ/6zD7CtGXj+OnOaXTdXNMJ
         Vtz864lH6zz6Qk5HJq6X7QFhHAKVZfb2vX9C0t9O90OQqd9XghfrhuL71IYcjgY92wWO
         +2dssHO+9cb9XhoWOaQ/x1W9IV4vr+bQriVLK9Zt7iPku94ddTUhZ3d5IG4eqYy5xQcW
         7Riw==
X-Gm-Message-State: AOAM530M1rQxkv4ZyMVy6wM1wUAO6N7BQyqHcbjXgodr1GTjWkGirCJ3
	2XhMvJylUC8prJdBYs5u6moWmw==
X-Google-Smtp-Source: 
 ABdhPJyXjm3XWBdEOmeTEWja3G/qWmscuRFvSVQ+ZNoBore8TVLGsE0wi3C5z83iK5UWDnoFFNeP0A==
X-Received: by 2002:adf:d0c2:: with SMTP id z2mr17176110wrh.330.1635785885891;
        Mon, 01 Nov 2021 09:58:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cf43:5d7b:a487:83a5?
 ([2001:8b0:aba:5f3c:cf43:5d7b:a487:83a5])
        by smtp.gmail.com with ESMTPSA id
 e18sm12984674wrs.48.2021.11.01.09.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:58:05 -0700 (PDT)
Message-ID: 
 <e57da77c0fdbaf109262196e50b6d10f64997090.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] meta: Add explict branch to git SRC_URIs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 01 Nov 2021 16:58:04 +0000
In-Reply-To: 
 <CAAnfSTupP0wSXysHKN-CwhWuzwBasFR6cqKV=autMU2zicTGug@mail.gmail.com>
References: <20211029125820.3423015-1-richard.purdie@linuxfoundation.org>
	 <CAAnfSTupP0wSXysHKN-CwhWuzwBasFR6cqKV=autMU2zicTGug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 16:58:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157727

On Mon, 2021-11-01 at 16:35 +0000, Ross Burton wrote:
> On Fri, 29 Oct 2021 at 13:58, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -657,7 +657,7 @@ APACHE_MIRROR = "https://archive.apache.org/dist"
> > -GNOME_GIT = "git://gitlab.gnome.org/GNOME"
> > +GNOME_GIT = "git://gitlab.gnome.org/GNOME;branch=master"
> 
> Late, as usual.  I think this should be dropped, people may well
> (they're not, but they could) be using this as
> ${GNOME_GIT}/modulename, which this breaks.

Agreed.

Cheers,

Richard


