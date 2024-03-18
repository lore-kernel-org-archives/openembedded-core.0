Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAC9C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 10:59:34 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.40310.1710759563502605964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 03:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=Md7yBhLc;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42IAxJvp232623
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 11:59:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710759560;
	bh=+VRaG0QFjCRF0P5+GroIyaTPbzqdFcKvGwoX3D2fYOA=; l=554;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=Md7yBhLc94llAqANSnVLP85Wpt5XBH7tBYSCqFJ2292wiRTlTRZQYrdqQ52EjfqiP
	 F7m9bmUcdqfql5kgwBzu4mMzOwP+RuE+OcnALO5tWKWDFWVTR4Rln8HpCzzIVMRde+
	 FAO2/OaseW/b6MBpRvQVkUwGYi6pSLk86mpUFbzmlpgQ37GhoG4/49yZnrnRofYuhZ
	 xkOohA2FTipPhp864SSfaE9nGqmEhxV8/cknhrRjZt6xgWAf8bfz7PqeEeq2e7qnqG
	 ss0538R1xlos2sO5Q6NqtW0tC0fPNVPYrbIlQP84tE2DVb4JySyi0QpyE8AjtmW+h+
	 vBntSzTr5zQbg==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42IAxH8c292350
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 18 Mar 2024 11:59:18 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id ILV6JTOWU9; Mon, 18 Mar 2024 11:59:17 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42IAxHug228639
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from ensc@sigma-chemnitz.de; Mon, 18 Mar 2024 11:59:17 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rmAi4-0000000GFja-3owS
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2024 11:59:16 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Subject: Re: '.bashrc': Unknown file type; file ignored
In-Reply-To: <lyjzm374a5.fsf@ensc-pc.intern.sigma-chemnitz.de> (Enrico
	Scholz's message of "Fri, 15 Mar 2024 19:12:34 +0100")
References: <lysf0r7ahx.fsf@ensc-pc.intern.sigma-chemnitz.de>
	<lyjzm374a5.fsf@ensc-pc.intern.sigma-chemnitz.de>
Date: Mon, 18 Mar 2024 11:59:16 +0100
Message-ID: <ly4jd37qm3.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65f81e85b121c496daa90be6
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 10:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197302

Enrico Scholz <enrico.scholz@sigma-chemnitz.de> writes:

> 4.14.2/shadow-4.14.2/lib/copydir.c
>
> | 443		if (fstatat(dst->dirfd, dst->name, &sb, AT_SYMLINK_NOFOLLOW) != -1) {
> | 			return 0;
> | 		}

Bug in shadow-utils; when fstatat() fails, content of 'sb' will still be
used.

  https://github.com/shadow-maint/shadow/blob/f4293f9fbc2b855878f549d9124bdd638fb08c60/lib/copydir.c#L439-L447

pseudo might trigger it because it calls the __fxstatat64() with an
uninitialized 64 bit buffer and copies its content to the 32 bit buffer.


Enrico

