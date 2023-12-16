Return-Path: <mattwood2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE75DC41535
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 17:11:03 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.19230.1702746657935865760
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 09:10:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TWGtIpNP;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: mattwood2000@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3ba2e03e21cso1325076b6e.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 09:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702746657; x=1703351457; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u2oMNs4iPAU73TO2DSy2acSsDaDQJo9Jn1KVhJ9lNVQ=;
        b=TWGtIpNPEvrg0uIsJm5HzCkDGRTGPfGkEmCtha9l8Tc7b3vOoDklJOX9EIDbY24mnv
         IUwV1B2gPVxYbgKJqy6FNuxzTqMSRcvxVqd7Exc5uZFWPzUB9Lde11bnLsmf6HhvCzUm
         vYYn7TWBAFsFTkaxMFKqHhVQRnF8iOkiM0JmY+zV501MtAOK6wX7B+hzEiMWLUl73adb
         5ZJdT6+NuAw/6r2HCJf2CaSqQRqxECTovchlt3Ie4ZC1rxNo47H6Hn48paJ97FI1B6pT
         83/z7JC3KAQzoA2DXAW1p+g88RZlyrXXtlVxjhkagsBD3gL+9AeM1L6ffu6uYAKWnAcs
         pNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702746657; x=1703351457;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2oMNs4iPAU73TO2DSy2acSsDaDQJo9Jn1KVhJ9lNVQ=;
        b=LQTO6wbdayFFRKdTH5Ao3dEw7MPsB8n8bbvyPrdDKTjBrCoj5nppIRO2HMFM42CWep
         9pEjw3WYpOs8opo/Q0V6wa6UFFP/LWtElaA2goG6p6omJPMNjfIrq4xerChk92U1Dw6m
         KZG5nuQAzytCV3WzIYcAkuG5cHclH/81ZEs3ZZEsOWF8a0r92qAYkek7kLU38pREbXh9
         g1qOSqJE7OXGzI8xDEsXW5Cu53xkJlpNuGsA77auNA0yXG1k1fbfK8+cKAJNj0q6pYd5
         LWQUpAaVFb6DZNVM5cuQ1SGubXLTpIi/2Ofd7Wemh9591/XXkxgdW3zEnhC1uirmvWSy
         M7Cw==
X-Gm-Message-State: AOJu0YxCWcowjJjRloa880kcCvkBAIi9KrwvN+8U6rY4Jg/uGZtOElvk
	++79LVZh0D/x14ErgwxUKPwWcYxdlNM7fgaSRSiLrKei
X-Google-Smtp-Source: AGHT+IEOV8yzNaikCaZddnT5OBPEC0S4ufIUSU4WeQwvvqNYsD8se3MTNhLNP8qWH/rm/OlvcAWUU6iJzFLAfmH+9Ts=
X-Received: by 2002:a05:6808:164e:b0:3ba:c52:7242 with SMTP id
 az14-20020a056808164e00b003ba0c527242mr11753127oib.52.1702746657055; Sat, 16
 Dec 2023 09:10:57 -0800 (PST)
MIME-Version: 1.0
From: mattwood2000@gmail.com
Date: Sat, 16 Dec 2023 12:10:46 -0500
Message-ID: <CADjezmaJ2RDnRc0S34iMMrY+-Ey2zqZ59s_qLXGYBCJu5art5Q@mail.gmail.com>
Subject: mdns on musl
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a2e993060ca3991e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 17:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192566

--000000000000a2e993060ca3991e
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm working on an embedded system and it needs mDNS in order to interact
with .local hostnames.

The image is based on musl so it cannot use the libnss-mdns library.

From what I've read the mdns recipe is supposed to support mDNS on
non-glibc systems.

The recipe takes care of modifying /etc/nsswitch.conf and appends mdns to
the hosts line.

When the system boots it runs mdnsd and I can see it join the multicast
group in wireshark, but I cannot ping any .local addresses.

Is there some other configuration that needs to be done?

Has anyone successfully done this with a musl system?

Thanks, Matt.

--000000000000a2e993060ca3991e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I&#39;m working on a=
n embedded system and it needs mDNS in order to interact with .local hostna=
mes.</div><div><br></div><div>The image is based on musl so it cannot use t=
he libnss-mdns library.</div><div><br></div><div>From what I&#39;ve read th=
e mdns recipe is supposed to support mDNS on non-glibc systems.</div><div><=
br></div><div>The recipe takes care of modifying /etc/nsswitch.conf and app=
ends mdns to the hosts line.</div><div><br></div><div>When the system boots=
 it runs mdnsd and I can see it join the multicast group in wireshark, but =
I cannot ping any .local addresses.</div><div><br></div><div>Is there some =
other configuration that needs to be done?</div><div><br></div><div>Has any=
one successfully done this with a musl system?</div><div><br></div><div>Tha=
nks, Matt.<br></div><div><br></div><div><br></div></div>

--000000000000a2e993060ca3991e--

