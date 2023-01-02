Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C019C3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 16:29:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.39323.1672676936721470608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 08:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PQ1qVq3O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso21046035wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 08:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjw0bYMtKLuMgNoMvyiTTNrleow7GEbVoi741p3MLi0=;
        b=PQ1qVq3OR4szulVfg0ViTk+C9Bgrdy35VQp0n1GfL2tfYuoT+3mrWoiGlmWXLl9YCl
         QEmKKUafk+7styxdXHeo34+/gpLp3K3+gWYK8TJswzNDNQLJJR9WWCJg047YJw66Uiqp
         8oqu4gqQOi2PAH1zjQ7HHGLTG6D8acIfs/cng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xjw0bYMtKLuMgNoMvyiTTNrleow7GEbVoi741p3MLi0=;
        b=J1fS1eeI3Ckxl9HdxC/sUWvJ5ofiUQzmy8ejCGLiM5ehyQqXD70npyLV6hc6tDEseb
         oIuV3CatHki7zYt9UvZhLd13YuKwv+hcVPDOGllxbKDOzb7scwFcRjHWs44proSB6ilO
         NLMZJFrQp7UdQqfkRGuX3WQVd7n/bP2fdpChw3Ao/VBSQu+qinF83Kr7qdmh0bXcHKoZ
         0fCpxR9MjyeliRI5LYCvtE2x1wjFC1SaFghfIx/NhysMGXsWfvagA9BEgtkcx0GcKWlV
         9Jf2ub2bne6+lKJMbrB8PFJIBAtmdXnXRoAHVKHnCgij4CQtsgsDysPOYF9bqJNGuuLy
         DIQQ==
X-Gm-Message-State: AFqh2kqHlvvbk37He1qYCFMCnW+xxkFliYgEi8J9TMEC6hqRHaooEsfZ
	N3zV/iuoP8WNmIgup7OofqD4eLJ2Ni6OTWwS
X-Google-Smtp-Source: AMrXdXsCr8GlKuGWb2vbo68lnlYfGDVy0H/EfBDkvGIplpibEhGAytYZ0TEIk2X7NwfNBv5aOdR1Ig==
X-Received: by 2002:a05:600c:a51:b0:3cf:6f4d:c259 with SMTP id c17-20020a05600c0a5100b003cf6f4dc259mr28453191wmq.39.1672676935203;
        Mon, 02 Jan 2023 08:28:55 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:409d:216c:1a2:8d83? ([2001:8b0:aba:5f3c:409d:216c:1a2:8d83])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c35c900b003d96bdddd3dsm41826544wmq.15.2023.01.02.08.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 08:28:54 -0800 (PST)
Message-ID: <528a76b9a3cfebab7d1fc3edc88db756197faa22.camel@linuxfoundation.org>
Subject: Re: [OE-core] C.UTF-8 in glibc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jan 2023 16:28:54 +0000
In-Reply-To: <CAO5Uq5Toa3pa5Tnb1fuxLNe_PDYSAJUM4eJ5JObdeBOCQWzHVg@mail.gmail.com>
References: 
	<CAO5Uq5Toa3pa5Tnb1fuxLNe_PDYSAJUM4eJ5JObdeBOCQWzHVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 16:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175321

On Sun, 2023-01-01 at 18:32 +0000, Alex Kiernan wrote:
> glibc got an official C.UTF-8 in 2.35, but we don't appear to install
> it by default... if I add "c" to IMAGE_LINGUAS then it gets installed,
> but it feels like this ought to be default? Or even stronger and have
> it separate from IMAGE_LINGUAS so even if that's set to "" you still
> get it?
>=20
> I tripped over it because I was trying to get the ostree ptest suite
> to pass and it ended up with a time formatting failing a test because
> it wasn't running in C.UTF-8.

Making it even stronger might be tricky given how our variables work
but we definitely should have that in the default locales list.

Cheers,

Richard

