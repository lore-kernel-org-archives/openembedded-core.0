Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QPplf-0002dd-Ca
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 07:39:27 +0200
Received: by fxm19 with SMTP id 19so1350106fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 22:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Nt5IVBE3MRuN8kApyoiS7K9HugV4mbXyAHvr709/BqI=;
	b=g3c2BS378X3OJ1tZdN3R1myfvEn171TLB8EgLBeM/S2vDhKxg7VMCBda3b/At9jhV5
	0kmmJWJaEPLLKPVVGZJm7vPfAzjV3M1iGL+kxA9MZ7nJWzxYTlLbs+sBqrSFZV6oWdP5
	Ej9TZ+8EtFJzXpE+4yrzSsy0xMV9IcMC5aUWc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=AnMHP+1Eb74/qcDycenSDf6EcwiRooUpRYDyJf3jQEBqKTq3nRnmgn7odPHaMVg+0c
	3P5NrBYcNVEjG3v8IGh9mL3s9Kk7iz4el4xjHdLBOllDab0Mh1CZURbaWyrz4f5uRxKt
	hiHkJ49mDp+rXTNQAdjBSVYO0CQasjLbfYOxI=
MIME-Version: 1.0
Received: by 10.223.87.69 with SMTP id v5mr1899465fal.57.1306474582989; Thu,
	26 May 2011 22:36:22 -0700 (PDT)
Received: by 10.223.93.206 with HTTP; Thu, 26 May 2011 22:36:22 -0700 (PDT)
In-Reply-To: <4DDE96F0.9030608@linux.intel.com>
References: <4DDBDE9D.5000709@linux.intel.com> <1306338695.27470.41.camel@rex>
	<BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>
	<1306360265.27470.71.camel@rex>
	<BANLkTimH3Dp_kec8RdHTzicHS5jn5iGG7w@mail.gmail.com>
	<4DDE96F0.9030608@linux.intel.com>
Date: Fri, 27 May 2011 07:36:22 +0200
Message-ID: <BANLkTimxWqqg5-tZYFCQUFdsC_rjo+7SXg@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Updating u-boot for oe-core or meta-yocto
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2011 05:39:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 26, 2011 at 20:07, Darren Hart <dvhart@linux.intel.com> wrote:
> My current thinking on this is that for meta-yocto we want to have a
> reasonably functional self-contained example BSP for ARM. Beagleboard
> was the board selected for that. meta-yocto should be able to build the
> core-image-* images and have them work on Beagleboard without needing to
> pull in the meta-ti layer.

Sounds like a good idea (and one that has been previously agreed upon,
as I understand it). It's always good with a self-contained example
BSP in meta-yocto.

> For additional Beagleboard support and perhaps more state-of-the-art
> features, people looking to develop for the Beagleboard should also
> include the meta-ti layer.
>
> Having said this, I'm leaning toward just using the oe-core virgin uboot
> recipe in meta-yocto as it is adequate to boot the Beagleboard. Then the
> meta-ti layer provides the backports that provide some polish and usability.
>
> Does anyone disagree with my thinking outlined here?

No, you have my vote for this.

Doing it this way will, in my opinion, reduce the u-boot .bbappend's
in the BSP layer as much as possible. In most cases the bbappends
needed should just be patches with some extra features and configs.

Regards,
Anders


