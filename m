Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E72BCD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 19:08:59 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.20434.1712171336662449440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 12:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=OqCs2fjq;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xql7zKKPukjuaS7PDg6mN6Z/oT4YZ53U7PPZ17EEfDk=; b=OqCs2fjqyxazW/VbFzUEN6HYA6
	cSVV1XT7FAh5fDTMxN7BvGstbfJA/p4E8gy/6ONY8Daf1T1TUlmK8bYffzRONrGhXetJDOt5AyQaG
	o3cu3hV93uxqQGiEFf4gZqFehNf7aHqbsJAqXTRRkIzdJW7Hy1ZrryC/+EdxPQDSTmxbD0yfo6HWv
	gxoMDJB12Da7CYYROeUa5rc+bnFNWAkKUXPRZAKCqqMqGfSrQvk9+8XDohjYCAPyOja23RUSeI6Hj
	lo4FGMddpo5MOEoLpc9/xN8IlRrbOqw/X/vSnBp0SecWUiu1TkvwUQPkSDFfWlnXUUAMwqe/XbfyK
	5M8tg1ig==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rs5yf-000OvJ-F9; Wed, 03 Apr 2024 21:08:53 +0200
Received: from [85.184.138.13] (helo=[192.168.8.223])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rs5yf-008Axd-0R;
	Wed, 03 Apr 2024 21:08:53 +0200
Message-ID: <af5f84b11560409a0cb7e1657341d91d50beb84d.camel@geanix.com>
Subject: Re: [PATCH 3/5] ninja: build modified version with GNU Make
 jobserver support
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
  Randy MacLeod <randy.macleod@windriver.com>
Date: Wed, 03 Apr 2024 21:08:52 +0200
In-Reply-To: <CANNYZj8x4kEP4GAuaei6Ct3bqcZoBnLk21xArzSgTGRmO71sXQ@mail.gmail.com>
References: <20240403070204.367470-1-martin@geanix.com>
	 <20240403070204.367470-4-martin@geanix.com>
	 <CANNYZj8x4kEP4GAuaei6Ct3bqcZoBnLk21xArzSgTGRmO71sXQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27234/Wed Apr  3 10:25:27 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 19:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197940

On Wed, 2024-04-03 at 17:58 +0200, Alexander Kanavin wrote:
> We can't carry this mass of patches. It has to land upstream first.

Understandable.

> Are you able/willing to drive the upstream pull request to
> completion?

No, I don't think so. I'm not familiar with the ninja codebase, and the
pull requests has been lingering for too long.

Another option might be to propose adding the fifo feature to the
kitware fork of ninja:
https://github.com/Kitware/ninja

They have forked ninja to get the jobserver feature in, but haven't
taken the fifo part so far.

The kitware fork is also used by buildroot:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/package/ninja/ninj=
a.mk

// Martin

