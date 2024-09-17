Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52C6C36010
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 11:12:58 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.18508.1726571574708932258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 04:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D7DEKVp7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-378f90ad32dso1195913f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 04:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726571573; x=1727176373; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vX0LA/nrPHokcr5MitaQfwV1gtqrzwJ2vM/q6QD9vTs=;
        b=D7DEKVp7sRlOi0ZhPAypGD01PaOW9zfskDnPAn6ObDSOdfGTJsN9pxMb599ilyzHJk
         ZuD+2J9NawiuPB+bqD/0GtyzbfQ5nYNrwU/5RdlmvH+9letH9JVzTlpsI6QfNqHRQvwD
         QaqJbZeL8mA1BRFMCm/DILt1OucUKCPI8R/5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726571573; x=1727176373;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vX0LA/nrPHokcr5MitaQfwV1gtqrzwJ2vM/q6QD9vTs=;
        b=UPuZNWYGVZd7crVAAsBWGYpqL8vgOweGvmgOHu57uvYdd3FuChDOCC14Y41QgC8QDK
         jcN/mOTCJKjacqL7zjsBkcqXU/+j5rkfWFJvN9vnQeNM/cM04A36hpJS0x4vOt9RD7vs
         jNH4hUPCi6r7tlhiJCBDzrfIb0ByWqhaDDqLsbQ8TtzaVpkzIotJvmvERUP7eA9UKqsp
         oteLhjjSq4N2isqY1A+9Lo3FoW4fwiKpJvW9cwQGXQX96yIX2Cmcb6SnDT81ooMQWzUX
         3bvpUcGpne1RjWetdOevGD9EaR47BrK7B/whmbg42mqnoScP24jK9jQeGw6+LoWVEWzk
         0FgA==
X-Forwarded-Encrypted: i=1; AJvYcCX9YBJp8uZRDNLw/+33SjCRqK1gnPJRj7RJf3IReqO+whjW6N1Kh6Fxm596jro9mZnzzcMND8YqaTdm9WbGf/OeMA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy499e1NGFPFRVSQXmceai60scCPIh0djC7e4+x9tZ/m/tT6Diu
	X0/oYbuFU6PpXPPoB5oFpWt7CGaaOFLBXTYxSeyCfWwxiD6zyQnkN7uqkdvmuWE=
X-Google-Smtp-Source: AGHT+IEGcl9fBsNUAtKke1ZAMSKiX22zMjjjbxeEQll9+G/SnTfrU5I5Knwgpwloarr5U8TNtQzHjw==
X-Received: by 2002:adf:b30e:0:b0:374:c3e4:d6c5 with SMTP id ffacd0b85a97d-378c2d59673mr8865825f8f.57.1726571572958;
        Tue, 17 Sep 2024 04:12:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c97:abb4:726a:74dd? ([2001:8b0:aba:5f3c:7c97:abb4:726a:74dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e862esm9363425f8f.45.2024.09.17.04.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:12:52 -0700 (PDT)
Message-ID: <04e4a589de370a4c69c8cedd976866fc61779e6f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/2] classes: Print bitbake branch and
 revision
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Date: Tue, 17 Sep 2024 12:12:51 +0100
In-Reply-To: <ad2b2df4041f0c721d1a82de0fe759d896c6bfb6.1726065189.git.liezhi.yang@windriver.com>
References: <cover.1726065189.git.liezhi.yang@windriver.com>
	 <ad2b2df4041f0c721d1a82de0fe759d896c6bfb6.1726065189.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 11:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204621

On Wed, 2024-09-11 at 07:35 -0700, Robert Yang via lists.openembedded.org w=
rote:
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> There is no bitbake revision when it is in a separate repo, then we have =
no way
> to know which version of bitbake is used from the log, this patch always =
prints
> it.
>=20
> * console-latest.log
> bitbake=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D "master:165368bad152a14b32b5216b938aa4b915d72a70"
> meta
> meta-poky
> meta-yocto-bsp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "master:165368bad1=
52a14b32b5216b938aa4b915d72a70"

I think this is confusing as it implies that revision is in the bitbake
repository which it isn't, that is a poky revision. The current output
tries to make that clear, this patch starts to confuse that.

We're really close to release and I'm not going to rush into changing
this so close to a release build. I don't mind printing a bitbake
revision but it should probably only be when it is a separate repo. The
change is too late for 5.1 IMO.

Cheers,

Richard

