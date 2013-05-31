Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 185AC62222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:24:40 +0000 (UTC)
Received: from [192.168.0.102] (87-206-152-156.dynamic.chello.pl
	[87.206.152.156])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 839DED22B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 17:24:39 +0200 (CEST)
Message-ID: <51A8C0B3.2030008@juszkiewicz.com.pl>
Date: Fri, 31 May 2013 17:24:35 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1370011262.8846.63.camel@phil-desktop.brightsign>
In-Reply-To: <1370011262.8846.63.camel@phil-desktop.brightsign>
X-Enigmail-Version: 1.4.6
Subject: Re: [RFC] get minimal rootfs to be even smaller
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
X-List-Received-Date: Fri, 31 May 2013 15:24:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 31.05.2013 16:41, Phil Blundell pisze:
> On Fri, 2013-05-31 at 16:11 +0200, Marcin Juszkiewicz wrote:
>> Next one can be ldconfig which is ~600KB.
> 
> There's already an option to turn that off: you can set 
> USE_LDCONFIG=0 in your distro configuration (which micro does, for 
> example). Converting that to be a modern DISTRO_FEATURE would be a 
> fine thing.

Thanks for hint - may look at it next week.

> On the udev thing I guess my initial reaction would be that if you 
> want the smallest rootfs you probably don't want to be using udev at 
> all.

I just wanted to have smallest possible image without doing any distro
config changes. Think "minimal image for testing KVM" where KVM host
rootfs can be built with same setup.

