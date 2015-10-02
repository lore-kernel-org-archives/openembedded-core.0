Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 99609770B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 15:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 4468D315B3AD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 17:47:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id y2W-NrVl3m7X
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 17:47:16 +0200 (CEST)
Received: from [172.22.22.61] (55d44bca.access.ecotel.net [85.212.75.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 22165315B3AC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 17:47:16 +0200 (CEST)
From: Andreas Oberritter <obi@opendreambox.org>
References: <1443789718-6846-1-git-send-email-jussi.kukkonen@intel.com>
	<560E7D13.3010604@linux.intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <560EA703.3040408@opendreambox.org>
Date: Fri, 2 Oct 2015 17:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <560E7D13.3010604@linux.intel.com>
Subject: Re: [PATCH] libepoxy: RDEPEND on libgl
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
X-List-Received-Date: Fri, 02 Oct 2015 15:47:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 02.10.2015 14:48, Alexander Kanavin wrote:
> On 10/02/2015 03:41 PM, Jussi Kukkonen wrote:
>> Automatic dependency tracking does not notice this (understandable
>> with the dlopen trickery epoxy does).
> 
> Maybe it's better to explain this in a comment in the recipe itself?

I think this is pretty much standard in OpenGL environments.

Regards,
Andreas

>> --- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
>> +++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
>> @@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
>>   inherit autotools pkgconfig
>>
>>   DEPENDS = "util-macros virtual/egl"
>> +RDEPENDS_${PN} = "libgl"
> 
> 
> 
> 
> Alex


