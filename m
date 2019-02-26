Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id DC3B17CC96
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 12:26:36 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id v20so10892887otk.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 04:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=89Y5bVQf6pznPXdmKzKALvAfFKsYuBRUiMzxhh1Wm5c=;
	b=L0YqzlfIA5f9asoUyGxyHykVdp+eCeESNaTup/eUQf+bFPV5kuWezExP4K/MwU30MV
	xzOC2DjAoyBkfTNl3W5DfGOxLheRLtRE/lgYb2lnTqIU/PD6tVvvZwmSnZ0TlOPhIzPa
	C7u4JgcCH7HNL5bziaL98CClqoLnJHWag+dqvjY3XdlndRCgYMQU3unjUcZBlCUruez9
	aEofGBTHX2Mn5JfZB99H2tsZRpWTokMnQ1UiIrQhcX+pazaLlqYC9+FI8qzOSL3qHDkB
	l7umy+KpU7SYFqo4K3hmGUmS6P7PYNBLmZ3ttjTb/LUwnvTTwNmHBPZrBUOPENkRZCne
	SGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=89Y5bVQf6pznPXdmKzKALvAfFKsYuBRUiMzxhh1Wm5c=;
	b=q7ckoclp/uDfxCL9Of/E8CkyBTJACMwmf0hof/6dTdRPKMsI8E6BLYnup/WWkNYVFF
	mWI8QMAikE8qaQZ3kAMXAFhT4KwiZFtk82yWETGzTA6QvyFTgi11sYsLfQF+ejgEyPVL
	YdA+pog4M8eirzjdDxBEvU5EMxCOpTCtrl+w9Zfus7aEzy37PsnwBdXGk5Xla7Sha3ll
	dHRknFujpM/D6k0mn1kmBydhD70Bxo+3K37qrg5rGJM4EZoQDVZNR6RfifGrT3R1g4Ko
	945LopYuGwZyk4fei1U3PU5ziWW9LQITUpdAbppzZ6rMLBIObFTFWVJ74r75qNPmCXSb
	lAGA==
X-Gm-Message-State: AHQUAuYEEg9jBQFoa5jdYaUVofM8NHtLpR89VtloQOPxPppnDFpT0uCd
	d+xy4TWXjWZlKSSmtXwRSUt22zs/gipHSA==
X-Google-Smtp-Source: AHgI3IYv7nhi8+4tPKgarTAmeJjBZHdCQgkkZGJiBe9dr+9pzFiWTnsabDYZIP1946b9wmtvBAWj3w==
X-Received: by 2002:a9d:73d6:: with SMTP id m22mr14564183otk.322.1551183997318;
	Tue, 26 Feb 2019 04:26:37 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com.
	[209.85.210.46])
	by smtp.gmail.com with ESMTPSA id r13sm5190307otq.8.2019.02.26.04.26.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Feb 2019 04:26:36 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f46.google.com with SMTP id 98so10941710oty.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 04:26:36 -0800 (PST)
X-Received: by 2002:a9d:70d4:: with SMTP id w20mr15323238otj.253.1551183995769;
	Tue, 26 Feb 2019 04:26:35 -0800 (PST)
MIME-Version: 1.0
References: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
	<CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
	<CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
	<CAJTo0Lah677v4+3Q+acN8WEOF-r9bopn0OVw+icfCX5Jy7pxvQ@mail.gmail.com>
	<CAJTo0LZsdUCjKe9nR4ypj3x_ddR7XPBEvduUHDiE9esWa=X-jg@mail.gmail.com>
In-Reply-To: <CAJTo0LZsdUCjKe9nR4ypj3x_ddR7XPBEvduUHDiE9esWa=X-jg@mail.gmail.com>
Date: Tue, 26 Feb 2019 09:26:24 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqXDQkV8xHmTTmvs6GWUWNJrWB5XSnb37B=6-JjCci37Q@mail.gmail.com>
Message-ID: <CAP9ODKqXDQkV8xHmTTmvs6GWUWNJrWB5XSnb37B=6-JjCci37Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v4] mesa: Convert recipe to use meson build system
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Feb 2019 12:26:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 8:58 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Patch has been accepted, so we need to cherry-pick the patch I mentioned.

We will wait for 19.0.1 to be out to go to meson, so it will be
applied there for sure.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

