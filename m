Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 67C337F383
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 10:35:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45z8vw0cJCz3n;
	Wed, 31 Jul 2019 12:35:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564569340;
	bh=WGBJyDIllbwi2gBz0hQXoCS9j+Tu0d85IpNyToHinMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXukGnE1vLlc048CiiwUtGgyAzJZjqilDkAlwFSi+cK3sdrYS/RjE4ns/Fbk0M+os
	nU3i1JHaAnKxQ2OT8p7hGMvJ4HcNcarTkOcA20mHBQtFmUDvtvayDaFq6pHtpKGchk
	wvG08u6Nb89bIX1JjwShK6AiHaSIfm8972dMPd9qwG7nTEW15XTF+ah6oZcgYpX01f
	ycDj2JPJywzZO2iIqJB0hHI5sTT2145gv2GhOfDiryIHIiY/Im+yPmr9pL+t91EOqB
	CEQI+ii6eUPWNxwjsr2/0mUvUSOcd2cRR9f28meC+LXJnI+ztWqhZoZ/HTg+7IA6Rk
	rB2+x2kRT+dggUh2qCMf8S5/GZ4YUD6vdI5l/uImJ3NuegNjJY5HNPsf+/YBX0Hnwn
	q3NFBt61kTSu0EUa6QqWyaJbcZRjJctIOTVnV9FmEuilPj9WPpOPwCe/8TZyTv2E1w
	GgrAJVDnl10VHsZWpsLDaEZfObeQna2Ebd7Bgpio189zhDHmkv5Y/OT8xiSkbxXwCm
	WkYN2fBUvyMYmYqXn2Ej4dCZtpAdJKQuHB4LvV/gBz1q0xv/Pw+RgN7y5o9QO3KfSA
	SNeY9/0P1QAz9mDqXftf2EazwxJy41J8tqM1jUp4dtv5nvuJbDdDP5hP7Z0scWFabk
	PwHg5w+GYT29l1IsIVRgNAr4=
Date: Wed, 31 Jul 2019 13:35:38 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190731103538.GB1647@localhost>
References: <20190731093347.16834-1-bunk@stusta.de>
	<CANNYZj9Yi6MQPo_8yzy-iSorHRfc3Syj5_wLj7jSLuuJNykefQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9Yi6MQPo_8yzy-iSorHRfc3Syj5_wLj7jSLuuJNykefQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: Upgrade to 2.1.1
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
X-List-Received-Date: Wed, 31 Jul 2019 10:35:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jul 31, 2019 at 12:17:35PM +0200, Alexander Kanavin wrote:
> Please do not use ftp:// as it is deprecated for oe-core recipes. We are
> trying to eliminate it entirely.
> (if no http is available, then git is actually preferred!)

OK, v2 sent.

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


