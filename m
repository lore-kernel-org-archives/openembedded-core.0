Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35E2C54E60
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 14:11:36 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.13536.1710425484088727568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 07:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=jN65l3yA;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42EEBLn5135585
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 15:11:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710425481;
	bh=Q+fPBbyOtJ5xYScXZ5tJ0Au8BHhThD+HNQKZ8cHS1mY=; l=996;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jN65l3yAbfa1VB5Zz8XRxXQYNrea5RPBFuRKXi/kml4MpGW0s6Adjs/Xu5+T1VK4c
	 RLHywhzfQd56ULS60hJ7MtXb5bG7wIXgOsFJvBA8bpqpzt5FexihhGsPy0hlJ0SjmS
	 lYhGSkNSRGiEtpthNlxB5idEy6j7FrUUZrXGNRJqg1hx7AVgsOkwNdPLU58Mx8s5IY
	 pWCwGmcyoIIgHGj/HCaFwhBGuvCzkhCdkO9oxYZTrMhlKofuqRbpAXr2Te5WsbL5iI
	 LCpA9ZLhelvO5Ysvh2FLrRNGUhktGYw+BEi3ENnVt1Gff3/4y+0LB/7UvWUU6SYJew
	 VcLkQbXGhG8/w==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42EEBJpg359066
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Thu, 14 Mar 2024 15:11:19 +0100
Received: from mail-msa-2.intern.sigma-chemnitz.de ([192.168.12.72])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id 8793JDKKKQ; Thu, 14 Mar 2024 15:11:19 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42EEBJG8192538
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 14 Mar 2024 15:11:19 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rklni-00000001CLK-3x6z;
	Thu, 14 Mar 2024 15:11:18 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/7] Replace sshd_config patching by snippets
In-Reply-To: <6bc904eee800c940fb0390bb917846bba58baf39.camel@linuxfoundation.org>
	(Richard Purdie's message of "Thu, 14 Mar 2024 11:00:29 +0000")
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
	<6bc904eee800c940fb0390bb917846bba58baf39.camel@linuxfoundation.org>
Date: Thu, 14 Mar 2024 15:11:18 +0100
Message-ID: <lysf0s9a49.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65f30587b121c496daa90056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 14:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197109

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

> Thanks for sending this. I suspect something like this might be
> desirable however unfortunately the timing is a little tricky as we're
> just past the feature freeze point for 5.0.

ok; my fault.  I delayed it too much.

Would it be possible to communicate such schedules more visibly?
E.g. put a link on https://wiki.yoctoproject.org/wiki/Releases ?


> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/8649/steps/14/logs/warnings

ok


> so I squashed a fix in for that. The second run had this:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6390/steps/12/logs/stdio

It is difficulty for me to analyze this from the outside.  The patchset
requires that the 'openssh-sshd' IMAGE_FEATURE is set; installing the
package manually does not suffice anymore.

I can not detect such an IMAGE_FEATURE configuration in step 10; but I
might miss other setup.



Enrico

