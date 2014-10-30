Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id E72996AC49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 19:08:47 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id j5so4416222qga.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=MCJ9wE4dlgXyOWv7dFfU6gBDUNbRaB+dp4hLi78ID7E=;
	b=Tpee4TpRT0uZLXP0b8AwPgtjv3k4stdEnpjt0UMAnkTgyqbKLxH62xcXz0W/8a9Lr2
	pfZbh/R5wNVyHMszLayxKmFalBNTHrWK/SIf1LM1HEAmp7lTMynfnMMZRCIQfPgG+H66
	jFagwIE/TmOb1nWAqh2bGsW4q/Ou96lwbcMfLPP3A0CJd1k2cpdaIxASFlUvgzLwpG6f
	xd5y6o2Mmo2qL4Pxq5yaB2lk5RBzzu6G77kpv9tzl7X4uHjb6j+PCO4Z84A7D7sz7Y1d
	5dw9rb9vSm/rqtJMfAxEWU7ltIlzJjETRuuV6UNStK9eMFGtj/dn2oLqCjzCHQhS/Dm5
	otNA==
X-Received: by 10.224.97.72 with SMTP id k8mr29349052qan.25.1414696106847;
	Thu, 30 Oct 2014 12:08:26 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Thu, 30 Oct 2014 12:07:46 -0700 (PDT)
In-Reply-To: <545281C5.2020004@linux.intel.com>
References: <545281C5.2020004@linux.intel.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 30 Oct 2014 19:07:46 +0000
X-Google-Sender-Auth: mY3-rwf9TCC7QJyIgv2ptBvIes4
Message-ID: <CANyK_8cJA7F3CTZ8psAUaAz-qBG31cM2fJEsd6VLX-ALcxBoKg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Package Upgrading for 1.8
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
X-List-Received-Date: Thu, 30 Oct 2014 19:08:48 -0000
Content-Type: text/plain; charset=UTF-8

On 30 October 2014 18:21, Saul Wold <sgw@linux.intel.com> wrote:
>
> Folks,
>
> Just a reminder now that master is open again for patches, now is a great
> time to consider doing package Updates.  Based on some rough estimates from
> 1.7 we did around 300 updates from 34 contributors, that got us about 73%
> packages upgrades.
>
> We currently have about 180 packages due to be updated based on the Package
> Reporting from this last week, about 65 of those where not updated in 1.7 so
> should be given some priority (see attached file), there are also 10 that
> need maintainers, let me know if you are interested in any of them.

I don't see opkg, opkg-utils or libarchive in those emails or on
http://packages.yoctoproject.org/upgradepkgname. Any particular reason
they're missing?

I'll send an upgrade to opkg v0.2.3 tomorrow, then further upgrades
once they're available.

Once I've merged a patch by Jian Liu to opkg-utils there will likely
be an opkg-utils SRCREV update.

I have my eye on libarchive as well as I'm using it within the
development versions of opkg. I'm subscribed to their announcement
mailing list so I'll know when a new release is made.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

