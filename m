Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UN7M0-00028A-CM
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 21:58:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r32Jfb7x023980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Apr 2013 12:41:37 -0700 (PDT)
Received: from msp-dhcp56.wrs.com (172.25.34.56) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Apr 2013 12:41:36 -0700
Message-ID: <515B346D.7020302@windriver.com>
Date: Tue, 2 Apr 2013 14:41:33 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1364872704-14812-1-git-send-email-raj.khem@gmail.com>
	<1364921183.6526.10.camel@ted>
	<0194B3E3-E469-45E4-AAB4-4ED15EF93DA6@gmail.com>
In-Reply-To: <0194B3E3-E469-45E4-AAB4-4ED15EF93DA6@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] eglibc: Let eglibc-extra-nss-dev exist as empty package
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
X-List-Received-Date: Tue, 02 Apr 2013 19:58:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/13 2:27 PM, Khem Raj wrote:
>
> On Apr 2, 2013, at 9:46 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>
>> On Mon, 2013-04-01 at 20:18 -0700, Khem Raj wrote:
>>> eglibc-extra-nss-dev is a dependency for libc6-dev but
>>> the package is empty and is not created as a result target
>>> install of libc6-dev fails. This will create an empty package
>>>
>>> [Yocto Bug #4168]
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>> meta/recipes-core/eglibc/eglibc-package.inc |    4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
>>> index 88a00a4..ca0cc4c 100644
>>> --- a/meta/recipes-core/eglibc/eglibc-package.inc
>>> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
>>> @@ -17,7 +17,9 @@ python __anonymous () {
>>> # Set this to zero if you don't want ldconfig in the output package
>>> USE_LDCONFIG ?= "1"
>>>
>>> -PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
>>> +PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc eglibc-extra-nss-dev"
>>> +
>>> +ALLOW_EMPTY_eglibc-extra-nss-dev  = "1"
>>
>> As discussed in the bug, I think this is an issue with smart erroring on
>> recommends which it shouldn't do. More investigation/discussion
>> therefore needed as this patch just fixes one issue and there will be
>> others.
>>
>
> I agree. If its smart issue lets fix smart instead.

Bug 3723 - smart: Performance enhancement for attemptonly and complementary installs

The purpose of this bug is to fix recommends processing to deal with failures 
gracefully.  It should simply detect the failure and then back off the one item, 
but continue the install progress.

--Mark

>> Cheers,
>>
>> Richard
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



