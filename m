Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CEED160234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 13:55:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l9so18077745wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 05:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qCt68970Wt0H7RJo9P55If4YHvJv42csEW4QpoFkY10=;
	b=VMkBerLDrDnYsEKtOnqFB8CHPz/gWiRkvBvrr/mKlSimjZDJluqeLF/haaq4M3oLVx
	qkwxQPifY0L0Y07w1X+IotX+z6pxbIaS/f/rYEwLlcOCDYfCeu4G1tBp3X3pJD35qzoi
	K4zowwK18bN3G+WkOmVv0y4nAPRNM4ENLHtv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qCt68970Wt0H7RJo9P55If4YHvJv42csEW4QpoFkY10=;
	b=PB8eGeg+dUdRp61G2rR9yFhkJcOw8+HrWkPyVYXZxpLymB09wvaZAcfpEzQr2vPBLe
	KODPXu+hDrz70qMGPEZVkc6+yOVlQ49U7Gjq+xHtJQqHbcTnqwkBIaSJFv+5ZjtICUez
	pifvz7cC5LSCnhEClpwosjEULeW5thmahBiF34HbJvYBOooGepbU6uRBzpH7Vh+BqrjF
	C1Th/WSV/VppbOSNVOnCA2TYGdaKkmlsEZSWe7fPtEPEJk5DtYJzVOofhc/Hgi2w8J2y
	Wwr7LN812WB484J+DqzJj0/i0qDPl2QVVtI/MK1qjPEMd/lpdzzZMInhm84JjHYQzCkK
	SlUw==
X-Gm-Message-State: AJcUukd066p4bC1SAVTKBl79xVl4zR44jT0eRoUodWPZju1uHXRelWd+
	y1UDoXPRKP4xNwhup+/0xWL+2e4ED2U=
X-Google-Smtp-Source: ALg8bN73dbVeCR4Io71BGNEOyX1oSQwBfTztSbIKVcmGKKEA4sP9HTYaDCjZeH+ymph6RxMj//tXCg==
X-Received: by 2002:adf:b201:: with SMTP id u1mr21582576wra.165.1548683705066; 
	Mon, 28 Jan 2019 05:55:05 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x10sm137106264wrn.29.2019.01.28.05.55.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Jan 2019 05:55:04 -0800 (PST)
Message-ID: <9649a5c523c4f0809c9f73a9c5326eead5ae12d5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonas Bonn <jonas@norrbonn.se>, openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:55:03 +0000
In-Reply-To: <20190127093821.4803-1-jonas@norrbonn.se>
References: <20190127093821.4803-1-jonas@norrbonn.se>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 0/5] systemd patches
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
X-List-Received-Date: Mon, 28 Jan 2019 13:55:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Unfortunately this series failed in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/226

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/167

so it looks like it may need some tweaks before we can merge it.

Cheers,

Richard


On Sun, 2019-01-27 at 10:38 +0100, Jonas Bonn wrote:
> Changed in v3:
> - parameterize preset-file installation location (as suggested in
> patch
>   review)
> 
> Changed in v2:
> - address patchtest warnings:
>   - include sign-offs on patches
>   - include License-Update tag on patch that makes licensing change
> - dropped patch implementing brute-force removal of unit files
> installed
>   by systemd into /etc
> - reworked the systemd-conf patch to restore the installation of the
>   base systemd configuration files
> 
> 
> **********
> 
> These patches make some modifications to systemd with the long-term
> goal
> of being able to run OE in systemd's "stateless" configuration.
> "Stateless" boils down to building an image with empty /etc and /var
> directories so that volatile (tmpfs) filesystems can be mounted
> there;
> this requires that the system subsequently be able to populate these
> directories dynamically, which systemd mostly takes care of if things
> are done right.
> 
> In these patches:
> i)    Don't include machine-id in writable images so that systemd can
> run
> its first-boot machinery
> ii)  Allow systemd to dynamically enable services and populate
> /etc/systemd/system via the presets mechanism
> 
> There's a long way to go to get to a working "stateless"
> configuration.
> Getting to a "volatile" system (just empty /var) should be easier and
> I'll post patches moving things in that direction shortly.
> 
> /Jonas
> 
> Jonas Bonn (5):
>   systemd: do not create machine-id
>   systemd-conf: simplify creation of machine-specific configuration
>   systemd: create preset files instead of installing in image
>   systemd-systemctl-native: simplify and support preset-all
>   rootfs-postcommands: call preset-all for read-only-rootfs
> 
>  meta/classes/rootfs-postcommands.bbclass      |  8 +++
>  meta/classes/systemd.bbclass                  | 33 ++++++------
>  meta/recipes-core/systemd/systemd-conf.bb     | 53 ++++++++---------
> --
>  .../systemd/systemd-systemctl/systemctl       | 36 +++----------
>  meta/recipes-core/systemd/systemd_239.bb      | 17 +++---
>  5 files changed, 62 insertions(+), 85 deletions(-)
> 
> -- 
> 2.19.1
> 


