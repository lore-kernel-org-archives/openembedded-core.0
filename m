Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1C96067C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 11:16:49 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id d67so8139003vkh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 04:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=yIC8MDT0tzgI6NwBxYULEXp43MgB0HBulSf6xdtUtDE=;
	b=1u2h+pHx9hjsUxqhjab+xuDGLfR37WTJuyyojyXdToCIRbKtHG38LqHExilcHUuOLJ
	zMOrNZD2mEcHPb3ICEPoBYMwCGF8tJZNYxuk8kouY6tVbB0AuN+XwrutU5f3D8ZYaTFm
	cupRBCBRCwg5ir2s6UbB5MkVvGOORpPkz4CnU5DJVz0YqlczzCova4Fh75kg/VGaUyVC
	Do6SUtnSwsDZdcI6nZSEOryt/rVLX0prrrPV0Vj4zZZZG0wWU25BLdo2t0kVHQe5E4Bm
	OIRLO+XQU3oZSVb8cRtfKJRdZ1jIr1CEz8clnPO7yIKdj14AMYf0HyBrw8+FE3aqycfV
	1V3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=yIC8MDT0tzgI6NwBxYULEXp43MgB0HBulSf6xdtUtDE=;
	b=cKESMO11pka/Keh5NTYFClfX+1pmM4xMBp6KNf2QJ32JZnuu71ro6LeTuAwfFMh3Jv
	PMUwDZ3bqZCnzCKsGtY23NyqKiMdAsKLLg61PhCG/fKKRaMzk56OKzdknq3QAiXoF8L5
	XYyZE9kShePAoe6AyT0DiqLmItgi8P2Ji/Dj8V9IoG1uIfu8bntcy7pl0blqKFn7vinz
	7yxVq2csMHcCyf7wBnSkAruVM845kqXk89iFfs5xYbFnM5YWZpZ1FZujkRiR+OrCdbV6
	OzdKTyiwsrQBRKA/7SKpq7uAn4rYh0vunu+820qXw4xjsZSU6MR4SUd3i+kEbjeN7m9U
	kvvQ==
X-Gm-Message-State: ALyK8tLxq6DE0Vh0M6eCv3kj9fDJDkdQeITAnganW3O8PabSYC4BWG91eXi9PD+wr9awxA==
X-Received: by 10.31.51.9 with SMTP id z9mr2407977vkz.54.1467976609494;
	Fri, 08 Jul 2016 04:16:49 -0700 (PDT)
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com.
	[209.85.213.44]) by smtp.gmail.com with ESMTPSA id
	w65sm1998205vkw.11.2016.07.08.04.16.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jul 2016 04:16:48 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f44.google.com with SMTP id b192so53301914vke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 04:16:48 -0700 (PDT)
X-Received: by 10.31.161.81 with SMTP id k78mr2374074vke.122.1467976607993;
	Fri, 08 Jul 2016 04:16:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Fri, 8 Jul 2016 04:16:47 -0700 (PDT)
In-Reply-To: <1467933891-16460-1-git-send-email-tom.hochstein@nxp.com>
References: <1467933891-16460-1-git-send-email-tom.hochstein@nxp.com>
Date: Fri, 8 Jul 2016 08:16:47 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqoHfYVPibHPJAb8hBQrkx2_Q3x8XCpB=jTUkwwdf-iBg@mail.gmail.com>
Message-ID: <CAP9ODKqoHfYVPibHPJAb8hBQrkx2_Q3x8XCpB=jTUkwwdf-iBg@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-packagegroup-sdk-host: Add wayland-scanner to the SDK native toolchain
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
X-List-Received-Date: Fri, 08 Jul 2016 11:16:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 7, 2016 at 8:24 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> The build tool wayland-scanner was missing from the native toolchain
> of the Yocto Project SDK build.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

