Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3257.1794723749755417988
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 22:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d5vRg7XV;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b18717a193so1345254a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 22:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723749; x=1795328549; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ovwZ/loADSm81tAWyQQaB7xMAQ9Dv1VD2vRpysrpQcw=;
        b=d5vRg7XV/CSbx2TQp+LvaLIEDwqzB4tAloyStS0VgokM+rSzIK1x3a3jQ74utimFBB
         bq2z1lsRb2Tw4KcYJelewFEOqLHdMg6Cei7FDNcpEJukHjgVZSoapp8V0BuXiZ1rwQfy
         eOKzbmDNW1AqWgUaQiyGhoKIZ1QQH+jg02y6MSIV09l6klq+56fvCE7VAahImrR0PUFd
         hbClxBT2yJ7YEPVp5f3oAXXr0f/Nrs2mn0XicXWSFEwj2HWZGOxrQocAgvc4CZxbNcJ/
         bENt6yzdzzwnaeP47bH3Th5qbLetAAr/l0yKNYvJDYnHGYcEDhGgNFIiSmStq0ZYN5ga
         7UEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723749; x=1795328549;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovwZ/loADSm81tAWyQQaB7xMAQ9Dv1VD2vRpysrpQcw=;
        b=OrTUoRcJCNJaa0437+SAC516SOnodJxOdPrJc1Mew9JDvb5bjjG4+NxbpKony0TYym
         fjQZzszA69H6WZiWjeutRkOpLT9ok7AxOWkxXpqvDI7qjJ+Li+xOs/EvhvXg55BZh/dR
         ocQyulAeQ2X8MRJ5Fmq4CqWk73oc5KHz99VbvRSyWf+ydTNcypdU+dbqyOEymwODxZPC
         8UV88ZXMkpJMVoBWOjI4/B7D3b3ly7n+rPzDWJeq1Ov393wX+FJe0oZPtwkiVIYf2q5U
         UtD2SsGssvXEf6+qF3/snGCzy9pxpYBS3DGqMWzPqjj6WdOS88I6SiVDppLUrzWxtnX0
         Qaiw==
X-Gm-Message-State: APuU4Z8izPtaQ+rk/IqFXTyG+oQAjiCxyHdQzVAtzH1BfeDjT7XKtVZH
	z+ftOIxoxm5uUp9qK0H67yrq4KXAd/Q3HHk7nUDHq9WzV5wnqM/J+ySj
X-Gm-Gg: AYBFou31Jr/muS/8/zlJlGdny5Un7E1Q+OFv5oAz9YtTOwSHHO9PYpaaTqhAhkyt8Ss
	MnnM4aacXNGqeV67qg8u1xhDPzprUA9yBUwWz44N3COw0rUHHsMjJXZnZIi96NRlvC/KQ9gVtA0
	lYn5rk0q5/cTudN5+C/jAuWF/X5TLnqgdz6wcIi5nh/RtAgr/8ulsBXX1hDyEM+yqlxqXJjQ4Lc
	ofDdGwzBGFh8fC9adwmDXWR93aL1RQA7b3JQMwhTbjWXoN/g9vABYZRbQx27hdJiYk+yExpecOe
	p0bjTU/yaWTklBw3A7eaWpjUxk1pq/bEPCix1YiI3daeap60lhM6p3hIgUyKMbDytfDfqRJfW8X
	dmrOPyJ+HwzxVs5WnZq6b1RE59m5sNCS811lKqbHb5JDMsoLqZI4aJXf8iCkQpgUadqBH7+AL4F
	+w7C5o8nWTq781sGR5Qv14cM2jkuhc/pVraeVA7KLKEr1qdptItfsADQGkeIyYe14F02tJVh5ch
	MqTpPbmJX1F3cSGxHSjYTT3M0YwtBJcKkI7+MhA8uDa17INVTI1AXMqKhWglEvlb5WwVq6onwAK
	h7pav1d+g6m02GOAkDcGNhDuOn5X4yvp94idw5qFgaeU9K/fIcOKW+i13VftJAQ=
X-Received: by 2002:a17:90b:4d0d:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b1b0a0e7d4mr7497704a91.18.1794723749020;
        Sat, 14 Nov 2026 22:22:29 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm16421800a91.0.2026.11.14.22.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:22:28 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Julien Stephan <jstephan@baylibre.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: Re: [PATCH] kernel.bbclass: keep the sources when do_symlink_kernsrc reruns
Date: Sun, 15 Nov 2026 06:22:27 +0000
Message-ID: <20261115062227.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHUKmYb=jHKjAhikuC31BXYrM12oSrhb0=4Fa4TmFx_qBFs8Rw@mail.gmail.com>
References: <CAHUKmYb=jHKjAhikuC31BXYrM12oSrhb0=4Fa4TmFx_qBFs8Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 06:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250231
Content-Type: text/plain; charset="utf-8"

On Sat, 14 Nov 2026 at 21:31 +0100, Etienne Cordonnier wrote:
> are you aware of
> https://lists.openembedded.org/g/openembedded-core/topic/103308574?msg=192851#msg192851
> ? It has some useful context about what I had tried a while ago.

Hi Étienne,

Yes, I read your v2 to v5 and Richard's review of v5 before writing
this. The copy was what he objected to, so this one makes none. When
S already resolves to STAGING_KERNEL_DIR it leaves both alone.

Thanks for the pointer.

Baban
