Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AB4487F697
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 22:09:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46z4K86rQpz4D;
	Thu, 24 Oct 2019 00:09:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571868542;
	bh=Lb5UJkHhi7FMDRsvHeXbsmH4EFWWVgPuTn15S9SYt9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WswOEPLDx9Vl0M5qTcrGfXDJ35QV7F/ZXqhFryC4bU41G6IOshh6bcRXjgdLIHlJe
	xUQQrdhorA+hOYFXSvdSgrG/Y0SU/Vs3FKZ+YjrpY0Ac1BRoyDXWCPiT9xKjUL2RJd
	KrCgAS/HSu14BzDJ/Tuy4R1nj4hXutjjaxt2ZAale84bnpfBh/PD6xOKgZQWdFF+gM
	te2PU/WH/BPsF30msryddEEYvrhOJPvKW1eFvk3XCN4grMAV5/aYk862bJqt9F+QH1
	/+rJdJhyTu8Eb0+u7frloxYunBgqsUNwUlEmsDF6DR+OVR1XbSHOUP8alep/HBRcxT
	ErrJpVp40HHguZMSK+WR7KstcVZz0/vekuKCi5X5bQN3RrBVjvTNCXE4RyDi3W23I7
	5zGzBepDQkYr+pRYvVCXDDdaeRGmLPiFQFqxC9IYc+T775Sz7YhvEInorMhSyImdwO
	4+PshRs1wKF6MqK1CfIx2KvNx54cLSoi0AJ53M7ftf8fTN3Nf9BAbPjClIkkG593j3
	GswmLEDEfjt7Ow0PGec3EYZPsvGu9wlRErCpDHhyT42M/sHodCxdXTZg5ZmeubQUqv
	Ua6lOYh8BllhMMxvrmfUMLvBw2BUd7RhOFZTXWUldiF4AXOIK3BZaP0R2dtrSt++4U
	2XyTKw73bV6Lz9qXJ/yvYNOE=
Date: Thu, 24 Oct 2019 01:08:58 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191023220858.GB31488@localhost>
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
	<20191023192329.GA31488@localhost>
	<f6b699e51c006c103b143b2f5eeddc8a34bf26fb.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <f6b699e51c006c103b143b2f5eeddc8a34bf26fb.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Wed, 23 Oct 2019 22:09:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 23, 2019 at 10:20:29PM +0100, Richard Purdie wrote:
> 
> Well, yes. The proposed policy is now that we should address these
> kinds of issues if they get reported. Whilst I understand why and that
> Khem doesn't get as much help as he needs with meta-oe, pushing the oe-
> core maintainers to fix things likely won't scale. I would like to see
> meta-oe quality/reliability improve though so I do understand the
> desire.
>...

What is the proposed process for oe-core changes that are likely to 
break reverse dependencies in meta-oe?

Python 3.8 would be a good example for that - for astor your upgrade to 
the latest upstream version already contains Python 3.8 fixes, but other 
recipes in meta-oe might require fixing by someone.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


