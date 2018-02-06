Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id F0AB160068
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 11:21:37 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1ej1Jk-0004qk-24; Tue, 06 Feb 2018 12:21:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DXDVtBw2kWmV4SMWbyldhdnBwMvEYVH0dZOJeQGW6NU=;
	b=Qj690gV+gR2zi0NZvRUVqHih/g
	Qc2SuVL/vqE4ghVwlMJqPRrPQhbYeIerqOrof0AtrBUg3iCfwk75RLNihCPoD/66l3kYck2g6VFeb
	uT6ei+L2PVHxEDO4ivOW/Y5FYAz68jsqy4RtrLMlIPmUR8eyoAFXPKQwaMd0fR8e/8M6nxrs7p8tn
	WkhvnljScT1SbwiO1iv/D/MfioAvrG0Y5WTc1Yu5bwtavLZtLYiTjE61n8l23nxUpoB1eMwZeVgaV
	YOQU4XS9EcNgL9wAq2hKl7LgHmP2zVM1Az3F6XMO2ElO/DKmdbgfDOoCLaull2xcpOW3czO98l0rY
	X28qU/5w==;
Received: from host-87-242-32-111.prtelecom.hu ([87.242.32.111]
	helo=s002.sicom.com)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1ej1JZ-0007VU-Sa; Tue, 06 Feb 2018 12:21:34 +0100
To: Matthijs Vader <mvader@victronenergy.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1517782997-32315-1-git-send-email-mvader@victronenergy.com>
	<575bced0-3a91-cea6-ba14-fc2346907620@pr.hu>
	<HE1PR07MB143682C1F14E2831B5C0D133C5FE0@HE1PR07MB1436.eurprd07.prod.outlook.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <a06b333b-7f52-6576-0f4f-4629acc79863@pr.hu>
Date: Tue, 6 Feb 2018 12:21:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <HE1PR07MB143682C1F14E2831B5C0D133C5FE0@HE1PR07MB1436.eurprd07.prod.outlook.com>
X-Spam-Score: -0.5 (/)
X-Scan-Signature: 8f5da0c40d649b22aaae3fc58f517802
X-Spam-Tracer: backend.mail.pr.hu -0.5 20180206112134Z
Subject: Re: [PATCH] classes/npm: replace cache clear with cache clean --force
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
X-List-Received-Date: Tue, 06 Feb 2018 11:21:38 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2018-02-05 16:55 keltezéssel, Matthijs Vader írta:
> Hi,
> 
> 2018-02-05 15:07, zboszor wrote:
>> I have already sent this patch (although a little extended) last week:
>> http://lists.openembedded.org/pipermail/openembedded-core/2018-
>> February/147071.html
> 
> Thanks! The second patch you sent in with that actually solved some other problems I was having as well. Still one left to fix:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12534
> 
> See also the comment I added to that bugreport just now.

Cool! Can we have a joint effort in the merged patches?

Also, can you please look into this fix I made against bitbake?
At least one node module (cli-color) has cyclic dependencies,
making the npm fetcher looping infinitely.
http://lists.openembedded.org/pipermail/bitbake-devel/2018-February/009199.html

> 
> Best regards, Matthijs
> 
> 
>> 2018-02-04 23:23 keltezéssel, mpvader írta:
>>> npm now requires --force to clean the cache, see [1]. Also, use clean
>>> instead of clear since the latter is an alias.
>>>
>>> [1]
>>>
>> https://github.com/npm/npm/commit/34f24c8381235790945208d25ac193bc
>> 97a2
>>> 1b79
>>>
>>> Signed-off-by: mpvader <mvader@victronenergy.com>
>>> ---
>>>    meta/classes/npm.bbclass | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass index
>>> a69bedb..43aed36 100644
>>> --- a/meta/classes/npm.bbclass
>>> +++ b/meta/classes/npm.bbclass
>>> @@ -31,7 +31,7 @@ npm_do_compile() {
>>>    	fi
>>>    	npm set cache ${WORKDIR}/npm_cache
>>>    	# clear cache before every build
>>> -	npm cache clear
>>> +	npm cache clean --force
>>>    	# Install pkg into ${S} without going to the registry
>>>    	if [  "${NPM_INSTALL_DEV}" = "1" ]; then
>>>    		npm --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --
>> no-registry
>>> install
>>>
> 
> 


