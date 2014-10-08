Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 870FF65D58
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 18:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id DFB81314EAFC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 20:58:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id amhnkOMhk98z
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 20:57:58 +0200 (CEST)
Received: from [172.22.22.61] (55d457db.access.ecotel.net [85.212.87.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 7799B314E1C9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Oct 2014 20:57:58 +0200 (CEST)
Message-ID: <54358935.30909@opendreambox.org>
Date: Wed, 08 Oct 2014 20:57:57 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1412712030-12657-1-git-send-email-anibal.limon@linux.intel.com>	<54344EC9.2040303@opendreambox.org>	<54346DFB.8030802@linux.intel.com>	<5434799B.7020503@opendreambox.org>
	<54357BB2.6090405@linux.intel.com>
In-Reply-To: <54357BB2.6090405@linux.intel.com>
Subject: Re: [PATCH] busybox: fix upgrade problem with deb packages
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
X-List-Received-Date: Wed, 08 Oct 2014 18:58:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 08.10.2014 20:00, Aníbal Limón wrote:
> 
> On 07/10/14 18:39, Andreas Oberritter wrote:
>> On 08.10.2014 00:49, Aníbal Limón wrote:
>>> I reviewed the patches and looks good, only i have a comment
>>> in this file,
>>>
>>> http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/dora&id=a5f18409d1bf2877f898b902cafc317cbf7462e4
>>>
>>>
>>>
>>> I didn't know if the same apply for rpm and ipk.
>> I guess so. I'm pretty certain that opkg behaves just like dpkg in this
>> regard. I never used rpm, though.
>>
>> To reproduce the problem, boot an image containing busybox, but not
>> bash. Then install bash and deinstall it again. Deinstallation fails,
>> resulting in a dangling symlink (/bin/sh -> /bin/bash).
>>
>>> There are a lot of patches,  Do you have a plan to port them to master?
>>>
>>> I can help with that.
>> I'd like to, but I won't have time to do any testing with master during
>> the next weeks. I could rebase my patches onto master and provide a tree
>> for you to test. Or you could cherry-pick whatever patches you like and
>> submit them to the mailing list after testing. Most patches should apply
>> without changes, but those touching rootfs_deb.bbclass and
>> package_deb.bbclass will need some porting. What do you think?
> 
> I think we need to port these patches in small changes in order to do
> a good review,

I already rebased all patches today, and just pushed it to this untested
branch:

http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/master

> 
> I propose,
> 
> 1. dpkg update-alternatives offline
> 2. apt-get upgrade version
> 3. another minor changes like pkg-config
> 
> Makes sense?

OK. Here are some topic branches:

http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/dpkg-ua
http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/apt
http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/dpkg-misc

Regards,
Andreas

