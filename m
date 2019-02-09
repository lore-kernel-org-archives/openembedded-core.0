Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id E8BDC6D523
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 10:06:56 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id n8so10093546otl.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 02:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5evCg65s9aan8cgt7o+cL8GPWZpXoIT/W4YNimEhN48=;
	b=tzkskCITGrCja2ZNGO++MfTZbsXotF2GoxIbHWvQHuemB+FQOVtaFqguZj65r7Ijw3
	kajHXIiADz8gtDLEoc965zhKFk91zsA3Q+/mkU1tYYUoNMAO0OuIpkYPLbOjItZjVTkd
	4kBZ79i9I/lEwXUp3qWWEi3enkUAfqMfQc2TZ012VzyPC+q8E5HUzJMQg5JHgLRKY7xm
	DodDxOl0y6DM1KQJ4tC7GtaxkWeNWjL2FLmfeFLvGpM3U9SRNDjkr2g8EuHGMTcty4Ic
	if7bzQxhwYwK+0EdGQdk5LBH4SNDwZ7eiqnriHOqG4IzR1bhjSGgICP4++c6U6H283K2
	wJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5evCg65s9aan8cgt7o+cL8GPWZpXoIT/W4YNimEhN48=;
	b=BbJgQn1QpbLpR6amKpdjbw0s6+p2yAHiO5TMujorbdBGfxm1SvTUQnmhP6FTGn4rdu
	istAxLWfKPnbf2n2Dmul6W8OW+QkEdAMW+t6fNnpdJ5oWGJdjy/JbHXO6VSXp1IuOlHD
	SB1AW+ycDYWxFPz5p3OShKO7ODlOyiQfbHft3ahR6J5mkcJQDuYZzd/qYQZJFjXlUerw
	2QIjkoPbNwuC5Wt4l6DRAwmQS2DLWeBXLgjELx5Bxh27fMQI57j48xFzlgTm9l7bLYnb
	zaBQLZsUsFeNAkq2TmQfx8bQflK63quGagbHgognhtmXzfbo/eS1KQzoGERrgI9Vhv/N
	CUzg==
X-Gm-Message-State: AHQUAuY3WenjMQCoI0n/3eXt0zg6WF8E7wPqKovP+pF4cIE0asu5TSzB
	NB8+Fh2jhycxUDdQx4NfCWpmasO7Yp4BNsR/DCiu9LrEoIo=
X-Google-Smtp-Source: AHgI3IYLB85v5wDroW4N8nnemk+TLGMuU7/359+YAjIpOznnEbQQ4U7by8ZkQKZCfRstQcqmP0p7j0yhixhPIqpCnvc=
X-Received: by 2002:a9d:5f18:: with SMTP id f24mr2737700oti.96.1549706818146; 
	Sat, 09 Feb 2019 02:06:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<c6c6c5555d11044b88591d5e760d26352d84c65b.1549637121.git.alex.kanavin@gmail.com>
	<20190209094419.GC2258@jama>
In-Reply-To: <20190209094419.GC2258@jama>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 9 Feb 2019 11:06:47 +0100
Message-ID: <CANNYZj9NEMz8O3wJ-CjGx1SXLh9NTXu-fm-TgLa8n9HFU1x4QA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Sat, 09 Feb 2019 10:06:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 9 Feb 2019 at 10:44, Martin Jansa <martin.jansa@gmail.com> wrote:
> Does it need to depend on mesa directly instead of one of virtual/*
> providers?
>
> It fails to build for targets which use different mesa, e.g. mesa-gl:
>
> ERROR: Nothing PROVIDES 'mesa' (but /OE/build/luneos-master/webos-ports/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_git.bb DEPENDS on or otherwise requires it)
> mesa was skipped: PREFERRED_PROVIDER_virtual/libgl set to mesa-gl, not mesa
> ERROR: Required build target 'virglrenderer' has no buildable providers.
> Missing or unbuildable dependency chain was: ['virglrenderer', 'mesa']

Yes, mesa-gl isn't going to work. Virgl needs the following bits (set
in mesa recipe):
PACKAGECONFIG_class-native ?= "gbm dri-native egl"

dri-native is same as dri, but without drivers to save build time.

Alex

