Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SKTpX-0000iO-4W
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 14:17:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 1BDD9315B371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 14:08:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4HB8vYfEG-6a
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 14:08:14 +0200 (CEST)
Received: from [10.200.6.10] (unknown [82.149.226.166])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id C3056315B380
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 14:08:13 +0200 (CEST)
Message-ID: <4F8EAEAC.4080605@opendreambox.org>
Date: Wed, 18 Apr 2012 14:08:12 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F847380.6000401@windriver.com>
	<4F8489DE.1050905@opendreambox.org>
	<4F8C24CB.3080607@opendreambox.org> <1334587325.616.4.camel@ted>
	<4F8C379A.3070903@opendreambox.org> <4F8C3B19.40400@windriver.com>
	<4F8EA5CC.6010101@opendreambox.org> <1334749226.24091.67.camel@ted>
	<4F8EA972.1090304@opendreambox.org>
	<20120418115428.GJ3635@jama.jama.net>
	<1334750426.24091.73.camel@ted>
In-Reply-To: <1334750426.24091.73.camel@ted>
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
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
X-List-Received-Date: Wed, 18 Apr 2012 12:17:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 18.04.2012 14:00, Richard Purdie wrote:
> On Wed, 2012-04-18 at 13:54 +0200, Martin Jansa wrote:
>> On Wed, Apr 18, 2012 at 01:45:54PM +0200, Andreas Oberritter wrote:
>>> On 18.04.2012 13:40, Richard Purdie wrote:
>>>> On Wed, 2012-04-18 at 13:30 +0200, Andreas Oberritter wrote:
>>>>> now, after having repacked all binary tarballs that had mipsel or
>>>>> mipsel-nf in their name and contents, and after having changed all
>>>>> occurrences of mipsel and mipsel-nf in my local recipes (where
>>>>> appropriate), and after having rebuilt everything from scratch again, it
>>>>> came to my attention that "mipsel" in PACKAGE_EXTRA_ARCHS breaks opkg,
>>>>> because no mipsel packages are being generated. That's what I told
>>>>> before, right?
>>>>
>>>> How is this breaking opkg? We often have architectures listed in there
>>>> for which there are no packages generated (all, noarch and any spring to
>>>> mind)?
>>>
>>> Downloading http://10.0.0.1/mipsel/Packages.gz.
>>> wget: server returned error: HTTP/1.1 404 Not Found
>>> Collected errors:
>>>  * opkg_download: Failed to download http://10.0.0.1/mipsel/Packages.gz, wget returned 1.
>>
>> I had a lot of those (e.g. because armv7a-vfp-neon was including 20
>> arm*feed.conf variants in /etc/opkg most of them empty - without
>> Packages.gz).
>>
>> So I've added "filter" to distro-feed-configs
>> http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=236aa553bb0f82f741c6edb793e96f421f24f4fa
>> to add only feeds I'm generating (and I also don't want armv5* packages
>> installed on armv7a-vfp-neon target unless user explicitly adds armv5*
>> feed).
> 
> This is the better solution. I think we need to get a better default
> feed-config generation mechanism into the core. Distros may still need
> to tweak it but it would be good to share some of the best practises...

Did you look at the patch? Which default setting of
SUPPORTED_EXTRA_ARCHS do you suggest? Do you think it's feasible to add
every single downloadable arch to this variable? If a user of my distro
decides to build it for some arm or x86 cpu, should he need to know
which archs to add at this place?

I don't think that's user-friendly and I don't know what's so bad about
removing something that probably hasn't helped anybody.

Regards,
Andreas


