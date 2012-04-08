Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SGzmC-0004w3-7n
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Apr 2012 23:36:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id EEE65315AF5E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2012 23:26:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Kgw2qaKlgDf4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2012 23:26:37 +0200 (CEST)
Received: from [192.168.2.108] (p5B119AD0.dip.t-dialin.net [91.17.154.208])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E664A315AF5D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Apr 2012 23:26:36 +0200 (CEST)
Message-ID: <4F82028C.7030004@opendreambox.org>
Date: Sun, 08 Apr 2012 23:26:36 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1333659001.git.andrei@gherzan.ro>
	<4F7E6100.8010809@linux.intel.com>
In-Reply-To: <4F7E6100.8010809@linux.intel.com>
Subject: Re: [PATCH 0/6] Add patches to compile some modules and to skip warnings about some other
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
X-List-Received-Date: Sun, 08 Apr 2012 21:36:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06.04.2012 05:20, Saul Wold wrote:
> On 04/05/2012 01:54 PM, Andrei Gherzan wrote:
>> The following changes since commit
>> 5607729d9901c394b7cd4db6e38fe7fb19116f39:
>>
>>    self-hosted-image: Increase space for build and allow builder user
>> sudo access (2012-04-04 17:17:55 +0100)
>>
>> are available in the git repository at:
>>    git://git.yoctoproject.org/poky-contrib ag/pythonbug2
>>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/pythonbug2
>>
>> Andrei Gherzan (6):
>>    gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in
>>      include/gdbm
> Merged into OE-Core
> 
>>    python: Add patch for 64bit platform

I think this patch is quite important, because building python on 32-bit
vs. 64-bit build systems currently yields different results.

>>    python: Add patch to search for db.h in inc_dirs and remove warning
>>    python: Add patch to avoid warning about bsddb module
>>    python: Add patch to avoid warning about _tkinter
>>    python: Add patch to avoid warning about sunaudiodev module
>>
> We are going hold these, I will be integrating them into a master-next
> for holding.
> 
> Thanks
> 
> Sau!


