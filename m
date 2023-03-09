Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE96C6FD19
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 16:05:32 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.17654.1678377922820316355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 08:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YpSOhVqq;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id t14so2363017ljd.5
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 08:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678377921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NJJRoMg3WbKSCJb37XI8buP4L9eOG2YrHn3+rKg1ggk=;
        b=YpSOhVqqZo9pBWz26inJwe4T5b4xdOGUt4OhxXPgOOaZxvbm8ghnoVHfm9axZ+agNi
         TaS/P2ajXX7rjzukpHYrSLGMIVg8lfOa2/kaUoIDR9VLII7MDiXsNt7vxgE65L+v7qsD
         eMzTQgTINxuTsYu39HSpYex99xb4I4MXCC1ynjf7+8jOBGsfQehbrgdRdUo0quUOaWqo
         QhCiQw45da3xea3YAhUU4/zBkddwgGjC/V0u5HUWW5UswYUrg862wYEGXJAJQym8GHg7
         PQarC9AFSFG6KUm/7cU/dVZHxvv1IZt+uWN/lNPa2vrl0mdeGjO+R2kgpQxdR7LNpa1C
         QVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678377921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJJRoMg3WbKSCJb37XI8buP4L9eOG2YrHn3+rKg1ggk=;
        b=OEwrqoxbyM7WQRCPZnM9V+9U5oygCR74upQLfxeuNBGimGbOFb5CdCeex05OACP2Mi
         cvSWx4sDAE5eJdSjfMaOOiKEnHCh2bPuzKBmw6ZYQBk7g0iOVcDdScsEU+RO+JmjHd13
         gtHk2iaxn5oZre4ZHbWHaBoolAQT5TAmivMTbRr5kaYrVoIxgPs2Fn2dY5iCqnLIiWhA
         9gGkUuP2O81BUMZ0nC87aIZKdR03QTBERBC+A0gO6QUEl6XeFRBGDfJysqUwazruANRb
         pWW0D1yCW+hw/FvkhlLwsuNO84tA2yPhSCJ/xeaHyKF3IJ5fFmS/H83QeuBXzVT19nQ3
         hE9A==
X-Gm-Message-State: AO0yUKUX70xIJSb66VfsN+ZjXvPb2YbPTQTUA/jUhEeML014PmezFCaY
	AaGrVppoJ9Z+6ZanP3vs5q3Ecy4d2526A1UQImw=
X-Google-Smtp-Source: AK7set/IzbHy7ReJq549zxCvHKTmfxpc1Epn0NLrDk2PZdSXxf4sr6SCmpwmjAMpsYQ+ZJJBVgQ1Niwbmas5na7tm6o=
X-Received: by 2002:a05:651c:38d:b0:295:af0c:33aa with SMTP id
 e13-20020a05651c038d00b00295af0c33aamr6941246ljp.7.1678377920952; Thu, 09 Mar
 2023 08:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20230309151958.3619193-1-alex@linutronix.de> <20230309151958.3619193-13-alex@linutronix.de>
 <6967bdef-9c3f-eb4b-2e14-a29ed4367c18@gmail.com> <174ACADD43A80942.24021@lists.openembedded.org>
In-Reply-To: <174ACADD43A80942.24021@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Mar 2023 17:05:09 +0100
Message-ID: <CANNYZj-KOs9_gpQ1orXWJ0UCV16a8xxrM8uXiDp8dLB=sV8zLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/26] ffmpeg: update 5.1.2 -> 6.0
To: alex.kanavin@gmail.com
Cc: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 16:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178259

On Thu, 9 Mar 2023 at 16:47, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > > Add a patch to gstreamer1.0-libav to address an API compatibility fail.
> >
> > Please make sure this doesn't break opencv in meta-oe.
>
> Right, this one can probably be dropped. I can run meta-oe build
> against my branch to see the fallout. (a-full does not include that)

meta-oe build is running. Let's see what falls out.
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2543

Alex

