Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1R6aTh-0004FH-06
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 06:01:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8M3uDPV025330
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Sep 2011 20:56:13 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.22.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 21 Sep 2011 20:56:12 -0700
Message-ID: <4E7AB1D7.1040308@windriver.com>
Date: Wed, 21 Sep 2011 23:56:07 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.7; en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1316632767.git.bruce.ashfield@windriver.com>
	<1316663623.13622.5.camel@ted>
In-Reply-To: <1316663623.13622.5.camel@ted>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/3] linux-yocto: kernel config updates
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
X-List-Received-Date: Thu, 22 Sep 2011 04:01:37 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11-09-21 11:53 PM, Richard Purdie wrote:
> On Wed, 2011-09-21 at 15:25 -0400, Bruce Ashfield wrote:
>> Richard/Saul,
>>
>> Here's another small series of kernel config updates from the linux-yocto
>> tree. During some build/boot and regression testing I noticed that some
>> configuration warnings weren't being dumped to a visible location. When
>> I moved all the warnings (patch 3/3) to the kernel audit phase, there were
>> some obvious clenaups to the configs to get us a clean audit.
>>
>> I've built and booted all the qemu machine. The net result here is
>> that we don't have any runtime config changes and we have met the clean
>> kernel configuration goal.
>>
>> The following changes since commit bcfff457f63f43f53bcaf04f116e09bb2bba9bd6:
>>
>>    Fix mercurial fetcher in fetch2 (2011-09-21 14:07:31 +0100)
>>
>> are available in the git repository at:
>>    git://git.pokylinux.org/poky-contrib zedd/kernel
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>>
>> Bruce Ashfield (3):
>>    linux-yocto: simplify kernel configuration check expression
>>    linux-yocto: add blktrace feature
>>    linux-yocto: kernel configuration cleanups
>
> Merged to master. I'm a little worried we're still finding issues like
> this at this late stage :/.

Just housekeeping. They've been there for a while, and with the bigger
rocks to move I hadn't realized that the mapping to the kern-tools was
hiding output. We could have waited, but since the impact was nil on the
end result, I figured it was worth putting a good face forward for 1.1!

Cheers,

Bruce

>
> Cheers,
>
> Richard
>



