Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZSK2-0002tp-Gu
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 20:38:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MIZ7Ru008573
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 11:35:07 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 22 Jun 2011 11:35:06 -0700
Message-ID: <4E0235DA.8060200@windriver.com>
Date: Wed, 22 Jun 2011 13:35:06 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308706423.git.raj.khem@gmail.com>
	<1308758279.20015.79.camel@rex>
In-Reply-To: <1308758279.20015.79.camel@rex>
Subject: Re: [PATCH 0/4] eglibc 2.14 upgrade
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
X-List-Received-Date: Wed, 22 Jun 2011 18:38:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Since applying this update, I'm not longer getting an rpc/rpc.h file, which
breaks various things like busybox mount.

Is anyone else seeing this behavior?

--Mark

On 6/22/11 10:57 AM, Richard Purdie wrote:
> On Tue, 2011-06-21 at 18:43 -0700, Khem Raj wrote:
>> This patchset upgrades eglibc 2.13 -> 2.14                                             
>> Needed a binutils fix for x86_64                                                       
>> Package sotruss which is new in eglibc 2.14                
>>
>> The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:
>>
>>   binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)
>>
>> are available in the git repository at:
>>   git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.14
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.14
>>
>> Khem Raj (4):
>>   eglibc: Upgrade recipes from 2.13 -> 2.14
>>   eglibc-package.inc: Package newly added sotruss and supporting
>>     libraries
>>   binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64
>>   tcmode-default.inc: Bump EGLIBCVERSION to 2.14
> 
> Merged to master, thanks.
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



