Return-Path: <paul.betafive@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2522F65E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 13:53:45 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id i13so1949124qae.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=cnKjKlxIoyjIlpuhqAmHC+a+TA7cKfh/w0bl65LkO+U=;
	b=aQkTdSDwjMWFZh246JIYAD6sznwJvoflVlaMFQt7qA+cU2pGh/r1uz+NbPFuTvSRDp
	awEXoLKi2qtQ+1AI27KPg1cdO8gSjQAONHvgMrN6z8dyiMGlmLbRkTsohvMhNNI7L3RW
	Eb+9bkXr/gOkFpL2AE5DDppGNZ/1zlbIBF7tQZqGKddgbkr2GpVp5nsOurB+0J2QWFKY
	X5l/sKQ0DeWjWrtOIX2GnZZmWYyiC5YMPh8oa3igL+N3umXaNoLGEAtvHWn2g/9QL5Tv
	Sl8o0jjorHZjm/d2EbkJBptSlroTSsh0HWgOHappyNso9eC9zUfQw/rBqlVKYAML2US8
	1vRA==
X-Received: by 10.224.120.3 with SMTP id b3mr46751955qar.9.1417010026183; Wed,
	26 Nov 2014 05:53:46 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Wed, 26 Nov 2014 05:53:06 -0800 (PST)
In-Reply-To: <5475D8E7.3030507@topic.nl>
References: <CANyK_8eZHwtww6AL7L5f34R5Nc7mhSQALaez1NCnHvmUpHWcXw@mail.gmail.com>
	<1417004047.12520.10.camel@linuxfoundation.org>
	<5475D8E7.3030507@topic.nl>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 26 Nov 2014 13:53:06 +0000
X-Google-Sender-Auth: GQvH9VWs3yDA3rg06AnPdCDHpnY
Message-ID: <CANyK_8eyc04EkyE8_Ux2feXRH717MsG6Ypjf1Htnfjry-sJ-kg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg, opkg-config-base and opkg-collateral
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
X-List-Received-Date: Wed, 26 Nov 2014 13:53:47 -0000
Content-Type: text/plain; charset=UTF-8

On 26 November 2014 at 13:43, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> On 11/26/2014 01:14 PM, Richard Purdie wrote:
>>
>> On Tue, 2014-11-25 at 20:27 +0000, Paul Barker wrote:
>>>
>>> Hi all,
>>>
>>> Does anyone know why the configuration files for opkg are split into
>>> opkg-config-base (containing just '/etc/opkg/arch.conf') and
>>> opkg-collateral (containing just '/etc/opkg/opkg.conf')? It looks like
>>> the split dates back to openembedded classic.
>>>
>>> If there isn't a good reason for this perhaps now would be a good time
>>> to merge all this back into the 'opkg' recipe and package. I'm happy
>>> to put the patch together, just checking if it sounds like a good idea
>>> before I do the work.
>
> It's only excessive in its default state. Once you have a proper
> distribution with an online feed, it makes perfect sense to have separate
> packages:
> - the opkg "core" files which are the same for everyone.
> - the machine-specific list of supported architectures (maybe extended with
> distro-specific extras)
> - the distro specific config files containing the location of the various
> feeds. These may also be machine specific, for example due to a package like
> Opera being only allowed to run on machines from a particular vendor.
>
> I for one would not want to see any of these three merged.
>

I saw this while writing my reply to Richard's email and I think I've
accounted for these comments in that reply. I've definitely had second
thoughts about merging all three together due to machine and distro
specific bits, but I think we can improve the split between different
packages and recipes.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

