Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 26FC36B478
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id F1BD93144AC2;
	Tue, 30 Jul 2013 20:48:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id R7lKS+eQ4Htx; Tue, 30 Jul 2013 20:47:58 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.232.186])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 96E5E3144AC0;
	Tue, 30 Jul 2013 20:47:58 +0200 (CEST)
Message-ID: <51F80A5D.5060000@opendreambox.org>
Date: Tue, 30 Jul 2013 20:47:57 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1362529925-13211-1-git-send-email-obi@opendreambox.org>
	<1372758642-6302-1-git-send-email-obi@opendreambox.org>
	<1375197856.8017.7.camel@phil-desktop.brightsign>
	<825C7047-80C1-4FCF-B7F3-6F0895C41C36@gmail.com>
	<1375198498.8017.9.camel@phil-desktop.brightsign>
In-Reply-To: <1375198498.8017.9.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH v3] chrpath.bbclass: strip common parent directories from rpath
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
X-List-Received-Date: Tue, 30 Jul 2013 18:48:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2013 17:34, Phil Blundell wrote:
> On Tue, 2013-07-30 at 08:27 -0700, Khem Raj wrote:
>> On Jul 30, 2013, at 8:24 AM, Phil Blundell <pb@pbcl.net> wrote:
>>
>>> On Tue, 2013-07-02 at 11:50 +0200, Andreas Oberritter wrote:
>>>> Allows to use shorter TMPDIRs in corner cases, e.g. with native
>>>> perl modules, having a deep directory structure.
>>>>
>>>> The problem is that the original absolute rpath may be shorter
>>>> than the newly generated relative rpath.
>>>
>>> Can we not just fix chrpath to cope with the case where the new path is
>>> longer than the old one?  It seems a bit sad to require
>>> ever-more-convoluted workarounds for what is essentially a tool problem.
>>>

I guess this can be done equally well in a later patch. I don't really
like this workaround either, but it improves the current situation
surprisingly well.

>>
>> another option is to dump chrpath in favour of something which does it elegantly - patchelf
> 
> Right, or that.  I've never used patchelf myself but if it works better
> than chrpath (which isn't an especially high bar to set) then that
> sounds like a decent enough option.

I won't have the time to work on either improving chrpath or integrating
patchelf. If Khem has a working solution, then let's integrate it.

AFAIR, the reasoning against patchelf was the bad availability across
distributions and it being a prerequisite for native builds. Today,
there's still no patchelf package in current releases of Debian or Ubuntu.

Regards,
Andreas


