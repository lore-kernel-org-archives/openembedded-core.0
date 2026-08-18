Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9219FC5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 08:04:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4149.1787040272065008113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 01:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HL7Pna6W;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DB9AC4E412AB
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 08:04:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A876C60355
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 08:04:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E83E811C7496C;
	Tue, 18 Aug 2026 10:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787040269; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XPyUIVtyRSGR3JOP9eKMkFiTuHX54NhoMUKTFrWq3zk=;
	b=HL7Pna6W66uZxLZltsYmknYMQIuddrAESLv5hwjebfNZKhdSxTeGSQodQCLRiC3HYWoVZP
	UpiHjkbwUwwQ6lgjrtMSf34jtFd1jODw/DX0q8wxrL30JS4v7ADqRS+CZ0n2W0P+FhfNzs
	dho+aJ2Tp+sFz5ti8aumUcuujHVYxrDdD+VWOEfmw9B3HK5r7ND1iLYQkbrpBs4CGNMaku
	0wx7YsgDTHHgJ0c6udu6Sw7UuLLGmXR7Yjy+I97r2prJb3LBBmx91Re39nI8K+L1PQ5jAX
	n7s/ZpxcBDtEw45cpQsybJBwwdYIBzc6g5hqMe6zKhkleLcWT+ILoO/tXv+Q6Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 10:04:26 +0200
Message-Id: <DKRWWL8NYSSQ.2TTCOYTRP2AO7@bootlin.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-pygments: update 2.20.0 -> 2.21.0
References: <20260817-update-pygments-v1-1-da836eab9640@bootlin.com>
 <DKRTRX9N7CAV.1AZXJ5P8QS36Z@bootlin.com>
In-Reply-To: <DKRTRX9N7CAV.1AZXJ5P8QS36Z@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 08:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243667

Hi,

On Tue Aug 18, 2026 at 7:37 AM CEST, Mathieu Dubois-Briand wrote:
> On Mon Aug 17, 2026 at 12:13 PM CEST, Antonin Godard via lists.openembedd=
ed.org wrote:
>> One notable change from this update is the addition of a Bitbake lexer,
>> which will allow us to do proper Bitbake syntax coloring in our
>> documentation.
>>
>> Full list of changes:
>> https://github.com/pygments/pygments/releases/tag/2.21.0
>>
>> Tested using this version for the documentation with our
>> buildtools-docs-tarball recipe.
>>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>
> Hi Antonin,
>
> Thanks for your patch.
>
> It looks like this upgrade might be breaking some ptests, for a lot of
> python recipes:
>
> Failed ptests:
> {'python3-click': 'START: ptest-runner\n'
> ...
> Failed ptests:
> {'python3-xmltodict': 'START: ptest-runner\n'
> ...
> Failed ptests:
> {'python3-webcolors': 'START: ptest-runner\n'
> ...
> Failed ptests:
> {'python3-wcwidth': 'START: ptest-runner\n'
> ...
> Failed ptests:
> {'python3-uritools': 'START: ptest-runner\n'
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2181
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4294
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4311
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/986
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/967
>
> Can you have a look at the issues?

I don't really understand it yet, the issue is always the same it seems:

  '"/usr/lib/python3.14/site-packages/pygments/util.py", '
  'line 13, in <module>\n'
  '    import html\n'
  "ModuleNotFoundError: No module named 'html'\n"

Yet the html module is provided by python3, and does show up in
python3-pygments' sysroot when I build it:

tmp/work/cortexa57-oe-linux/python3-pygments/2.21.0/recipe-sysroot/usr/lib/=
python3.14/html/

Antonin

