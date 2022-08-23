Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231A6C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 15:04:12 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web09.32970.1661267045639781117
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 08:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=ykWpQOkx;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 27NF416o741839
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 17:04:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1661267041;
	bh=TL1uqNd0oz+O53qdnzj403YzWU6bC4NXOyk2pQfl9l0=; l=589;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=ykWpQOkxVztcd1/dmKdWIByspZEXyMUwR0VY4TL0HPifYC21eVLTh++z60X1UQbcq
	 s5Q8aaBlGpCtlE7owHv5No3/h7VsPdpQFtctLA3IJ8Ov88hKA8ibK+740UvP0CEJFj
	 lgHo92wAuGhGIDFn+/bn8OS4eIiAtMiCwEmhbXOJkCnXkeJxxc8cpNQoMqzmQgpzfW
	 8bhEGg9bpDL0a+EiM2n7MFKqYXjQ7lw5U+mG0uHJXP6YDycj8Wn4ZVOQ+CLJnLihhv
	 NkqSqkSaGgEC7A3r/XTlSQ1onu2FhQnrOFLWtvWHdQqW12nc6JOW+97ghTt9ne8B8p
	 mLQEAkp8Ld34A==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 27NF3x5k2732171
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Tue, 23 Aug 2022 17:04:00 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 77C9CD0EF7A; Tue, 23 Aug 2022 17:03:59 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 27NF3xaW710423
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 23 Aug 2022 17:03:59 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1oQVRf-0077eZ-35;
	Tue, 23 Aug 2022 17:03:59 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: DKIM compatible maillist setup (was: [OE-core] [PATCH 1/2]
 npm.bbclass: fix typo in 'fund' config option)
References: <20220822111337.1201003-1-enrico.scholz@sigma-chemnitz.de>
	<20220823162848.3468656c@booty>
Date: Tue, 23 Aug 2022 17:03:59 +0200
In-Reply-To: <20220823162848.3468656c@booty> (Luca Ceresoli's message of "Tue,
	23 Aug 2022 16:28:48 +0200")
Message-ID: <lyk06zj928.fsf_-_@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 15:04:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169714

Luca Ceresoli <luca.ceresoli@bootlin.com> writes:

> As you can see above, your sender address is getting mangled. This is
> not your fault, it is done by DMARC for anti-phishing, but it makes
> applying your patches annoying.
>
> Can you please try to work around that by setting the sendemail.from
> parameter in your git config?

Thanks for pointing me to this git option.

Would it be possible to configure the maillist so that it does not
mangle the message (no "unsubscribe" footer or "[OE-core]" subject
prefix)?  Or is this not supported with groups.io?



Enrico

