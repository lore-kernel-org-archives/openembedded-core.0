Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16482.1794304794429270634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 01:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1UV9SszU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 334AE4E4153D
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 09:59:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01CCF60012;
	Tue, 10 Nov 2026 09:59:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6483C10329429;
	Tue, 10 Nov 2026 10:59:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794304791; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FJhQuX/lZHshrxvmYnKQ7L1LWCCmUehZlqzBdSopfB8=;
	b=1UV9SszUcPQ/0jlAuBu66ZMfXISrVhIGC50K2Id3AtICb7UM6q2PI+PShfMf3IiBavoC5S
	uRhFo30h2jIEubXvfw5cqTj0dFCRaS7qP2PBScXekpxLfUt1pLft87qSW44zMC4ENu5DZT
	KHMXhNAfsdlWBc0l9CiiebNTyAqyS9nywD5yhWX2mvfRxroRmxHZhHI7YnT8HgS0BhZgZ1
	lqbJq14Qp368RvcXkNi7KgHClJjR3UlMMXcXczzxFwEG36MvASm6SZLxbUKRx2LP0c+mtT
	EOXo5o5JGF3N0O+Bwu8NNgC6TqQXR7AjrXxykaPX/BWrQ/b1md4tb6K7+K6xBQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 10:59:49 +0100
Message-Id: <DMRFYOTRY2J0.3ANVE66NJ6QOS@bootlin.com>
Subject: Re: [OE-core] [PATCH 16/21] groff: Upgrade 1.24.2 -> 1.25.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
 <20261109134034.74458-17-jaipaul.cheernam@est.tech>
 <DMRCGZJ1946G.23GSWKZLKMZHI@bootlin.com>
 <18E6A272E2711E1F.718694@lists.openembedded.org>
In-Reply-To: <18E6A272E2711E1F.718694@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 09:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249915

On Tue Nov 10, 2026 at 9:41 AM CET, Mathieu Dubois-Briand via openembedded-=
core wrote:
> On Tue Nov 10, 2026 at 8:15 AM CET, Mathieu Dubois-Briand wrote:
>> On Mon Nov 9, 2026 at 2:40 PM CET, Jaipaul Cheernam wrote:
>>> - Drop builddep.patch as fix is part of release
>>> - Refresh exisitng patches
>>>
>>> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>>> ---
>>
>> Hi Jaipaul,
>>
>> Thanks for the upgrade. We can see this failure:
>>
>> ERROR: groff-1.25.0-r0 do_compile: oe_runmake failed
>> ...
>> utils/tfmtodit/tfmtodit.o libgroff.a -lm lib/libgnu.a
>> | /bin/bash: line 2: /srv/pokybuild/yocto-worker/genericx86-64/build/bui=
ld/tmp/work/core2-64-poky-linux/groff/1.25.0/sources/groff-1.25.0/soelim: c=
annot execute: required file not found
>> | make[2]: *** [Makefile:21098: man/groff.7.man] Error 127
>> | make[2]: *** Deleting file 'man/groff.7.man'
>> | make[2]: *** Waiting for unfinished jobs....
>> | make[2]: Leaving directory '/srv/pokybuild/yocto-worker/genericx86-64/=
build/build/tmp/work/core2-64-poky-linux/groff/1.25.0/sources/groff-1.25.0'
>> | make[1]: Leaving directory '/srv/pokybuild/yocto-worker/genericx86-64/=
build/build/tmp/work/core2-64-poky-linux/groff/1.25.0/sources/groff-1.25.0'
>> | make[1]: *** [Makefile:13422: all-recursive] Error 1
>> | make: *** [Makefile:7743: all] Error 2
>> | ERROR: oe_runmake failed
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/5006
>>
>> Can you have a look at the issue?
>>
>> Thanks,
>> Mathieu
>
> No, it's not this patch but something else. I will pick this one back a
> bit later.
>

Err... it IS this patch. Sorry, I messed up my second try.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

