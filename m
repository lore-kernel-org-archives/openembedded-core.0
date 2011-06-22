Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZRT1-00006R-8I
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:43:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHeKd7029214
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:40:20 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 22 Jun 2011 10:40:19 -0700
Message-ID: <4E022902.9010908@windriver.com>
Date: Wed, 22 Jun 2011 12:40:18 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308763995.git.mark.hatle@windriver.com>	<8cd511d84bd86b911f464b14c84d9cb122f7f6b0.1308763995.git.mark.hatle@windriver.com>
	<1576E015-5BD6-4C83-A347-82FAE31906EF@dominion.thruhere.net>
In-Reply-To: <1576E015-5BD6-4C83-A347-82FAE31906EF@dominion.thruhere.net>
Subject: Re: [PATCH 18/40] modutils: Add in missing -dbg package
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
X-List-Received-Date: Wed, 22 Jun 2011 17:43:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/22/11 12:37 PM, Koen Kooi wrote:
> 
> Op 22 jun 2011, om 19:36 heeft Mark Hatle het volgende geschreven:
> 
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>> meta/recipes-kernel/modutils/modutils_2.4.27.bb |    4 ++--
>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/modutils/modutils_2.4.27.bb b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>> index 1ebc90c..9f2add3 100644
>> --- a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>> +++ b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
>> @@ -5,7 +5,7 @@ manageable for all users, administrators and distribution maintainers."
>> LICENSE = "GPLv2"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>> DEPENDS = "bison-native"
>> -PR = "r9"
>> +PR = "r10"
>>
>> SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/modutils/v2.4/modutils-${PV}.tar.bz2 \
>>            file://lex.l.diff;patch=1 \
>> @@ -86,7 +86,7 @@ pkg_prerm_modutils-modinfo() {
>> update-alternatives --remove modinfo /sbin/modinfo.24
>> }
>>
>> -PACKAGES = "modutils-depmod modutils-modinfo modutils-doc modutils"
>> +PACKAGES = "${PN}-dbg modutils-depmod modutils-modinfo modutils-doc modutils"
> 
> PACKAGES =+ "modutils-depmod modutils-modinfo" would be nice more more futureproof

I'm happy to make that change if requested -- but I did it with this way to
minimize change.  (also for some reason, I think that there was recently a pull
request to remove modutils anyway.. so it might not be needed.)

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



