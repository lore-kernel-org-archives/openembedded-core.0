Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEF87CB01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:37:03 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id n71so7502139ota.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 03:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EQJVBJM/o509wqH5ZhB+T4lKzZUHj2geoKM1MWHoJak=;
	b=adBTYD3wyw93AoPlguqYqMbpZWWzF8vCS1rtRWgXyyLH7S+tJ+Kt97BEFTwiYgLE1Y
	TB5W2n1E97IurvFB0RHOFnqjKi/CHVphb5gl8BqCjDZn/a90+FRl6cViTQ1/nGYjbOAh
	txoDyqz6hihRK2vWFrMWIvSsmtHJHKwIud/ybuHBre6+Aypw5tfxYHimM7Ukcb25BOmF
	T+2VmGSXhtD6zIB39U3TTTMoU9VDZZFvX6nLdzS6BPCKHEHCCMek6t0PZSYaegPqMNTR
	68gJyHuRNL8Qe6KenGlGnLeCZnodnm+v3EZ+xzqmNUQ2XYyxwk8UH8uuxjFT4WLVmXkV
	2raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EQJVBJM/o509wqH5ZhB+T4lKzZUHj2geoKM1MWHoJak=;
	b=Ad3h4NWM9BCflPJ69M3UnRqjIp+7UlQCbzMqB4jAcGTmcv6xoMjGMxOE1RQ28oeTeG
	bl6xYzME18F95lIffX8gtA5ncluKIzLd96Ijlb5JnNS0cDb3imvREpAj5oLtylfoIdsw
	UY2gMv0cVf7EUTE7DhoIEy8CVR8oi18BLQwdfuecJpGFbSWp0kDXwtM7jCYkthoQDh3u
	lcF60vV2NJrhwCkCiRXZMO95k3Yo9sf6Kxn6msuG8+W6IEmqbB0IGrNMzkxw58K5h3/5
	AxYyKvshSPR5i/geGEArS3zKFzflVR6Obi11GbxKAPuqoR+UIhGugltS13EbM84RZ98I
	7RPA==
X-Gm-Message-State: AHQUAuas2B9UTuAKJ9rWwy9NNknXxBXFsOmmaWjm0Tg3svnnuv5+KfK1
	15qUo7dgmX2LvhwHYiUsD9cNaSlFo2amDl8TDbjVTyeh
X-Google-Smtp-Source: AHgI3Ia7uqX1qkUiGX8IbuuE0jfthStFtgEyGTtiSShnpJxIYWG0zC2WwM4cgk5UC7fdKGInXxTW8rU5dQmzGAC0qWg=
X-Received: by 2002:a9d:7544:: with SMTP id b4mr11565323otl.326.1551094624054; 
	Mon, 25 Feb 2019 03:37:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<f007360dde2152c7ea3fc754960f45d3dbfd63e9.camel@linuxfoundation.org>
In-Reply-To: <f007360dde2152c7ea3fc754960f45d3dbfd63e9.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Feb 2019 12:36:52 +0100
Message-ID: <CANNYZj9Ln_ZtMErC+GcB7cPHt5CnKqVdarkaCpBCkSJhuBZ=4A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/12] Enable accelerated OpenGL in qemu
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
X-List-Received-Date: Mon, 25 Feb 2019 11:37:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Feb 2019 at 10:47, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> libEGL warning: GLX/DRI2 is not supported

As a guess: Debian 8 has a particularly old version of mesa on the host:
https://packages.debian.org/source/jessie/mesa

I would start by installing a more recent one from jessie-backports repo:
https://packages.debian.org/source/jessie-backports/mesa

I also have to mention that Debian 8 is no longer in full support, but
in the 'LTS phase', which is described as:
'Debian LTS will not be handled by the Debian security team, but by a
separate group of volunteers and companies interested in making it a
success. '
https://wiki.debian.org/LTS/

Should we decommission the Debian 8 builders?

Alex

