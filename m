Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C3BE76C37E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2019 15:30:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47530c4Wqnz40;
	Sat,  2 Nov 2019 16:30:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572708625;
	bh=8IFAvdj0pHowBWyN3Duez+w6kNzlMjACLE6NHLawghY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4t35XCLAtPZ6m0mi57Yuhvs8KYHZ0Vfuqqsr/bryYAeNWZOhIRfKGx+DF89WIbSX
	EU+wP+UV8BhVbzkXr25cb5v/JfmgdxzJTytdP+RJcRtt0djrldyd4cC9YLnVGWcyXd
	M3187mQQZ2//GQAnf2gljWwtj8JmjeitjNFtYxYePORQR6Pm+59voG919OyI10Q0H9
	QHx8YKwjkmUR9NmqPU3R7TztRENtLlJsE1HA6OAho1p3AjdcoO5nBEVfTxNp0jHt3c
	IIfyuW8uynqyT141koBMtvBbbjnnVlLi2MJwYrxLc2LUlto2zKCwqx6y3m3b9EiIhu
	RD3la1/BX1Os8cdhpHedDgif7QTdTXlv5i3buPDW6hMR7GhXoUpZdoA92iDg4Dchmb
	6lESMDQ4z2Md06+DeHt9yOtunJdwgeMuO60lQuLWDQOawChhFppmCD6VCMvXO3va8i
	uUJFfatN8eCWrbZPsyaZzQWmLBr5riiz1oB0mAr4E3O4Ll6cGptt+cnOKQZJxpKSSQ
	f7aRMh1DQ11WGJK4g2WX+RA3QY9dggDQZsDrmO747NSg2EoF2arAl+FvLaZX3oUTr7
	J2qOBSj2D5mV0aZRJbdr9M1wgAL4f7FRsOw1ix2T7fTeUBvUGwXR5ljr0UzTF5VPYt
	lguHrkpYMiqz/DB82+JuYQOM=
Date: Sat, 2 Nov 2019 17:30:21 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191102153021.GA31590@localhost>
References: <20191101184638.31898-1-ruslan.bilovol@gmail.com>
	<20191101201225.GA1826@localhost>
	<CANNYZj_qZedAe6dm-7=Lj1kfv1z_NHEfrfXQPVDH3yxTQBbNzA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_qZedAe6dm-7=Lj1kfv1z_NHEfrfXQPVDH3yxTQBbNzA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] [PATCH] Provide users with project support status
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
X-List-Received-Date: Sat, 02 Nov 2019 15:30:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Nov 02, 2019 at 12:01:38PM +0100, Alexander Kanavin wrote:
> I too think that the information may never reach the target audience, as
> they could never update their builds to the point where it would start
> printing 'end of life'.
> 
> What could work instead is printing a link to the wiki during
> 'oe-init-build-env'.

What should the user do based on this link?

Currently the wiki does not even state EOL dates for supported releases,
and it is not made clear that "Community" is just an euphemism for EOL.

Many products are just using the example BSP provided with the reference 
hardware.

With Ubuntu most 3rd party development happens to their LTS releases,
and when the example BSP for the reference hardware is based on Ubuntu
it is usually based on an LTS release.

Many Yocto questions are coming from people who seem to be just starting
a new project based on an already no longer upstream supported Yocto
release.

The easiest way to get long-term security support in such a situation
is often to take the required parts from the BSP layer, and use them
to build the product on top of Ubuntu LTS (or Debian).

The core question should really be how to increase the time of upstream 
support that is usually left when a Yocto-based distibution reaches the 
user, not just how to tell users that they are screwed.

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


