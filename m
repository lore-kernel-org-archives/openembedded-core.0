Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1TFhAX-0000PG-2B
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Sep 2012 10:04:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8N7p8hF015387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Sep 2012 00:51:08 -0700 (PDT)
Received: from [128.224.18.154] (128.224.18.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Sun, 23 Sep 2012 00:51:07 -0700
Message-ID: <505EBF6D.2020602@windriver.com>
Date: Sun, 23 Sep 2012 10:51:09 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <505C6C8A.9000800@windriver.com> <1348235937.10108.78.camel@ted>
	<505CC452.9040906@windriver.com>
	<CAMKF1srm1JLHray=JEJtRoBjwKvg8KFGno95fjRz+SFN+Fu-Pg@mail.gmail.com>
	<505D606C.5080406@windriver.com>
	<CAMKF1sqMtA1LhK98khoDAXAK83_gmTokfez8RpFC7gwRHdv=KA@mail.gmail.com>
In-Reply-To: <CAMKF1sqMtA1LhK98khoDAXAK83_gmTokfez8RpFC7gwRHdv=KA@mail.gmail.com>
Cc: Patches, discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils fails to set ld.gold as default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Sep 2012 08:04:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

You're right, the symbolic link pointing to this "regular" ld confused 
me. Looking at it's version, it clearly says gold.

Thank you.

On 09/23/2012 06:41 AM, Khem Raj wrote:
> On Fri, Sep 21, 2012 at 11:53 PM, Florin Sarbu
> <florin.sarbu@windriver.com> wrote:
>> What exactly do you wanna see in the output? I can post the variables you
>> are looking for.
> why cant you pastebin the whole file ? anyhow you are probably looking
> at a red herring
> build will create three linker binaries
>
> 1. Default linker - <cross>-ld
> 2. Gold linker - <cross>-ld.gold
> 3. GNU ld - <cross>-ld.bfd
>
> 1 above will be copy of either ld.gold or ld.bfd depending upon what
> you have chosen
> as default.
>
> run <cross>-ls -v
>
> to see the version of linker. If it is gold then it will say so
>
>
>
>> Florin
>>
>>
>> On 09/22/2012 12:53 AM, Khem Raj wrote:
>>> On Fri, Sep 21, 2012 at 12:47 PM, Florin Sarbu
>>> <florin.sarbu@windriver.com> wrote:
>>>> It is enabled. As I said earlier, ld.gold gets created, it's just that ld
>>>> is
>>>> not pointing to it even though the flag says --enable-gold=default. It
>>>> still
>>>> point to the regular cross ld. Another config option that creates ld.gold
>>>> is
>>>> --enable-ld=yes, so at this point default looks exactly like yes.
>>>> Just to be extra sure, I did try to add the extra space as you suggested
>>>> but
>>>> the behaviour is the same.
>>> post the output of
>>> bitbake -e binutils-cross
>>



