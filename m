Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 455 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Jul 2014 12:51:39 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2E06070181
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 12:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id AB039314CFA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 14:44:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 0NuS5s_oReXq
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 14:43:59 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.119.111])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id CEEC5314CFA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 14:43:59 +0200 (CEST)
Message-ID: <53BFDC0F.3050208@opendreambox.org>
Date: Fri, 11 Jul 2014 14:43:59 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1404138201-22662-1-git-send-email-Matthieu.Crapet@ingenico.com>	<20140630164039.GC2437@jama>	<C147EF5C-664D-45FD-BA7C-020B54702266@dominion.thruhere.net>
	<8672BB614B4CCA40A6B3BDD6FD82050BA8B25636@COSNADEXC13.usr.ingenico.loc>
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BA8B25636@COSNADEXC13.usr.ingenico.loc>
Subject: Re: [PATCH v2] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
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
X-List-Received-Date: Fri, 11 Jul 2014 12:51:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi Matthieu,

I used a different approach, but could't test with master yet.

http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/daisy&id=1e3c64a768a5aeaf8d904609a14dd29e298821df

While at it, you may also take a look at this commit:

http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/daisy&id=1e39f95927b65c7943c8d6c36203b8b55c9b3cdf

Feel free to modify and submit as you like.

Regards,
Andreas

On 11.07.2014 13:47, Matthieu CRAPET wrote:
> Hi Koen,
> 
> Something like this (in a small python function) would be acceptable?
> 
> d.setVar('LICENSE', 'CLOSED')
> 
> Regards,
> Matthieu
> 
> 
> -----Message d'origine-----
> De : Koen Kooi [mailto:koen@dominion.thruhere.net] 
> Envoyé : vendredi 11 juillet 2014 08:37
> À : Martin Jansa
> Cc : Matthieu CRAPET; openembedded-core@lists.openembedded.org
> Objet : Re: [OE-core] [PATCH v2] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
> 
> [...] 
> 
>>> +# Check codecs that require --enable-nonfree USE_NONFREE = 
>>> +"${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes', '', d)}"
>>>
>>> EXTRA_OECONF = " \
>>>     --enable-shared \
>>>     --enable-pthreads \
>>>     --enable-gpl \
>>> +    ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', 
>>> + '', d)} \
>>
>> cannot you just pass --enable-nonfree in faac and openssl PACKAGECONFIG?
>> In worse case when both are enabled the option will be added twice.
> 
> If you have nonfree enabled, you need to change the license as well, it won't be GPL anymore.
> 
> regards,
> 
> Koen
> 


