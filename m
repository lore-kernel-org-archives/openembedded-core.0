Return-Path: <prvs=1436c8ef92=holzmayr@rsi-elektrotechnik.de>
X-Greylist: delayed 353 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Sep 2017 08:13:44 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.216])
	by mail.openembedded.org (Postfix) with ESMTP id 7B17970057
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1505895225;
	s=domk; d=rsi-elektrotechnik.de;
	h=Content-Transfer-Encoding:Content-Language:Content-Type:In-Reply-To:
	MIME-Version:Date:From:References:Cc:To:Subject;
	bh=aibFL75AmqZ48VWtuVckErADgPNs9xUITcogVcMI2ts=;
	b=p9RNoMOG6mt1LPvaGA9cmL0gH7wm9eDdc7FlAoEp4OUF4mSTs6lAf4pa++vFPz/UH+
	EQ3ou3T3IrCiiE1f0hu33pMHzMT/08YUXS8z1av2oScleMoph/N6Zy5MQDn8ffjZRUjg
	nkPqI1CTlgekReHss9ZArwkeVX1rEDr2QIdSY=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPWwJyH/ODuV4n+N24+CqMVTDvF1MhuFNtPdyidq2MsANrnBlbnwwcVzJtzMys7bgkA==
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de
	([2001:0:9d38:78cf:246b:26e9:af6c:cbea])
	by smtp.strato.de (RZmta 41.4 AUTH) with ESMTPSA id 401044t8K87iLv3
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate);
	Wed, 20 Sep 2017 10:07:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1505894854; x=1506499654;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=Subject:To:Cc:
	References:From:Message-ID:Date:User-Agent:MIME-Version:
	In-Reply-To:Content-Type:Content-Language:
	Content-Transfer-Encoding; bh=aibFL75AmqZ48VWtuVckErADgPNs9xUITc
	ogVcMI2ts=; b=aALiTp81nXvN2jzAGCsN4diqEPCwe6Vpz9N7ISCA1N1qLHCQ0D
	okIg60/Tvy9SgsOHMUK8UpoC3qcgQHb7qNFPcdm+MVxkpAXggSa2Blp1DqqMUba2
	Cj0CwU0E6L0A+S3aJLfVIC8USbqa7y7HvPvWDJo9ZA1pRQ60Yku1/TE3Q=
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v17.0.3) with ESMTPSA id
	md50000004941.msg; Wed, 20 Sep 2017 10:07:34 +0200
X-Spam-Processed: mail.rsi-elektrotechnik.de, Wed, 20 Sep 2017 10:07:34 +0200
	(not processed: message from trusted or authenticated source)
X-MDArrival-Date: Wed, 20 Sep 2017 10:07:34 +0200
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=1436c8ef92=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
To: Mike Looijmans <mike.looijmans@topic.nl>,
	Trevor Woerner <twoerner@gmail.com>
References: <37a76fa5-4f25-56dd-9616-4b4b23fbb093@balister.org>
	<CAB=otbS8_F_Yhisc+ybm8X1m3GXBzCK1q16YjrWATDArwVf+Hw@mail.gmail.com>
	<bdabbc35-fa12-55ae-5387-54da9204fd55@topic.nl>
	<CAHUNapRuc6RHNZXHGdN0TO2A0EwRgkT53bqqqM-DcwqKzUz55w@mail.gmail.com>
	<9e86f719-bcf9-132e-3a82-8c924385710d@topic.nl>
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
Message-ID: <a8be08ca-30a4-bbd5-5672-2dd721e6fcff@rsi-elektrotechnik.de>
Date: Wed, 20 Sep 2017 10:06:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <9e86f719-bcf9-132e-3a82-8c924385710d@topic.nl>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded Developer Meeting Oct 22, 2017 in Prague (before ELCE)
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
X-List-Received-Date: Wed, 20 Sep 2017 08:13:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

On 20.09.2017 09:50, Mike Looijmans wrote:
> Depends on what I'll be able tug along in my luggage on the airplane, 
> but whatever I can bring is probably suited for public display. A few 
> circuit boards will certainly fit, so if the stand could provide a HDMI 
> monitor (or TV) to connect them to that'd be awesome.

I can provide a rather small (7") TV with HDMI input if needed. Warning 
ahead: IIRC it has some 1368 resolution and overscan can't be switched 
off. Just let me know if I shall bring it.

Greetz
-- 
Josef Holzmayr
Software Developer Embedded Systems

Tel: +49 8444 9204-48
Fax: +49 8444 9204-50

R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
www.rsi-elektrotechnik.de
———————————————
Amtsgericht Ingolstadt – GmbH: HRB 191328 – KG: HRA 170393
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
Ust-IdNr: DE 128592548

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548


