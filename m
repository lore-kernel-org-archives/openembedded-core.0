Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZU5K-0005Kc-GX
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 22:31:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MKS3N5026244
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 13:28:03 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 22 Jun 2011 13:28:02 -0700
Message-ID: <4E025052.6070300@windriver.com>
Date: Wed, 22 Jun 2011 15:28:02 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308706423.git.raj.khem@gmail.com>	<1308758279.20015.79.camel@rex>
	<4E0235DA.8060200@windriver.com>
In-Reply-To: <4E0235DA.8060200@windriver.com>
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
X-List-Received-Date: Wed, 22 Jun 2011 20:31:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/22/11 1:35 PM, Mark Hatle wrote:
> Since applying this update, I'm not longer getting an rpc/rpc.h file, which
> breaks various things like busybox mount.
> 
> Is anyone else seeing this behavior?

Reverting:

2a68cf4d315cdd18766de0c75928ff17846a6cd7 and
190a946e9a4213944e3ee675c4b3e18701698e87

fixed the problem for me.  So there is definitely a problems in the upgrade.

--Mark

> --Mark
> 
> On 6/22/11 10:57 AM, Richard Purdie wrote:
>> On Tue, 2011-06-21 at 18:43 -0700, Khem Raj wrote:
>>> This patchset upgrades eglibc 2.13 -> 2.14                                             
>>> Needed a binutils fix for x86_64                                                       
>>> Package sotruss which is new in eglibc 2.14                
>>>
>>> The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:
>>>
>>>   binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)
>>>
>>> are available in the git repository at:
>>>   git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.14
>>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/eglibc-2.14
>>>
>>> Khem Raj (4):
>>>   eglibc: Upgrade recipes from 2.13 -> 2.14
>>>   eglibc-package.inc: Package newly added sotruss and supporting
>>>     libraries
>>>   binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64
>>>   tcmode-default.inc: Bump EGLIBCVERSION to 2.14
>>
>> Merged to master, thanks.
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



