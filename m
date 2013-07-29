Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5C060958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 11:10:14 +0000 (UTC)
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id DDCABD2277; Mon, 29 Jul 2013 13:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 4314ED217E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 13:09:48 +0200 (CEST)
Message-ID: <51F64D75.60601@juszkiewicz.com.pl>
Date: Mon, 29 Jul 2013 13:09:41 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAJTo0LazaFL14=WbXSM4CnF0y=25VLt7m4cP9nU4B7Qs2kXEnQ@mail.gmail.com>
	<CAOMwXhPMi6cG858ZX9r+c310hdvGMRbNKLYEadyr0e9GVUuTqw@mail.gmail.com>
In-Reply-To: <CAOMwXhPMi6cG858ZX9r+c310hdvGMRbNKLYEadyr0e9GVUuTqw@mail.gmail.com>
X-Enigmail-Version: 1.4.6
OpenPGP: id=117A251E
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 11:10:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 29.07.2013 12:44, Laszlo Papp pisze:
> OK, I give up the contribution. I really cannot collaborate with
> people who think it is acceptable to break *many* users' life for the
> whole project without being able to use anything in favor of a very
> limited (!) people with only two (!) applications.

Stop being closed minded. OpenEmbedded provides many options for doing
alterations and you got some suggestions in this thread how to make you
happy without breaking setup for other people.

If your toolchain is more then 4 years old then maybe stick with older
versions of OE as well?

Or just update linux-libc-headers part of toolchain and be happy with
it? But it would require you to rebuild everything to check does it
builds...

Or do one simple change in your own layer to disable this config option?
This would take you just 5 minutes and provide compatibility with
probably even 2.4 kernels.



