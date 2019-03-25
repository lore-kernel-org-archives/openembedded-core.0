Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5935160234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 18:03:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44ShvK3bnfz5m;
	Mon, 25 Mar 2019 19:03:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553536989;
	bh=uufRHl6xXLP7QYmiwAq31fvx25K+xD36oSGvmCGvBHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmPpsT96BNLupwq5d2KEIAj++VAl+4AXHAv7EMzv8p6vHnybGUXZcO0CfuANm4ymr
	tUkY1Uz2/FkCTTh20+GVlz6xpMdE4WwL8pCFMqapQ0W7jZPDiEIogF8NvJUvo4jV78
	t078Os2QhUcdKQZMJQROXCQf4XPn51fgOqIKmBLoRMeqR/VqzDSQqS0wAc4BDtJSQH
	lWtcpHwFTcxc5nLluGewVj6tsBj/kjP3TubE5b6Bp6zL70KbGwy0M96X3T9obxKcfe
	PF8CG9MkKFKqAHk9z6ba66tEt0yqAyh+3t2f8oCTjPjR7DvElkPx8g//tQizpyYl3T
	I29aA+JGdfbeMDGvPjl8HyepBNyL0LC1o6oQN/U0lTux0UtKM00xvqfFKXURVqsu7v
	53QchZEtgBeumpj/+QqVuq8N3OTOqPIzWzfSIbJX0nKdpa9O6hLCLEkcNsRCMenmYN
	OprwIHNvz6lSgKBsvQmuzUGQ6eibAjuQcjqHkiYUduwP4zwSaygzcLq1u/nrTWlpv4
	loiXUSGp8YpbOE14Tp58vYhmANdKLmjHQPOzKzKa7ov9vpUOocYk7LNQzuKnBnBzon
	v6iepzPu4/kk1ZY1XvI39ELpznhgCOPjXc0HA/S0xWuKqAE3qJFAgSwwyrQFnqP9iz
	qG7Ulf2Y8vwyFXv5j4NFLLwI=
Date: Mon, 25 Mar 2019 20:03:07 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190325180307.GB5805@localhost>
References: <CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
	<CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
	<CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
	<20190325161004.GB484@localhost>
	<CALbNGRSgkQrjKrhEywJb3DhvKv3gkobZvv7YG_DxE039SAqJaw@mail.gmail.com>
	<CALbNGRThou+6CNKotr-hduJoKNPgg+F2i8PQdgjBGcGRZeOKdw@mail.gmail.com>
	<CALbNGRSSXNWW4-Xn=aa2zVe4u=cT5AE50AKy+URSZXcTJfHRsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSSXNWW4-Xn=aa2zVe4u=cT5AE50AKy+URSZXcTJfHRsw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Mon, 25 Mar 2019 18:03:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 25, 2019 at 06:36:19PM +0100, Andreas Müller wrote:
>...
> Something to add - haven't yet looked into networkmanger:
> 
> Do we have the chance to change the sequence of paths headers are searched for
> 
> 1. musl
> 2. linux
> 
> That might fix some issues

It would not.

The headers are in different namespaces, order is defined solely
by the order of #include statements in source and header files.

> Andreas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


