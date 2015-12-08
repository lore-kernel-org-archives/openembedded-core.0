Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2BF260110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:14:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB88Ej6p016129
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Dec 2015 00:14:45 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Dec 2015 00:14:45 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1449539278-20070-1-git-send-email-akuster808@gmail.com>
	<1449539278-20070-4-git-send-email-akuster808@gmail.com>
	<20151208074923.GB8707@ad.chargestorm.se>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56669173.1080901@windriver.com>
Date: Tue, 8 Dec 2015 16:14:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151208074923.GB8707@ad.chargestorm.se>
Subject: Re: [jethro][fido][PATCH 4/4] openssl: three CVE fixes
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
X-List-Received-Date: Tue, 08 Dec 2015 08:14:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/08/2015 03:49 PM, Anders Darander wrote:
> Hi,
>
> * Armin Kuster <akuster808@gmail.com> [151208 02:49]:
>
>>   meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>
> I'm just a little curious about this serious, and a few others that I've
> seen recently. They all add a number of CVE-patches, with one commit per
> patch, and as the last commit, they all get added to SRC_URI in a single
> patch.
>
> What's the reason to do it like this? i
>
> I'd personally prefer to have each CVE-path also add the patch to
> SRC_URI, as that make cherry-picking more straightforward. And it also
> ensures that if we have a need to bisect some issue, that'll work. At
> the same time that will make the meta-data consistent, i.e. no dead
> patches.
>
> I'd personally even prefer that whole series squashed to one commit,
> compared to this adding a lot of un-applied patches.

Yes, I think that would be better.

// Robert.

>
> Any comments on this?
>
> Cheers,
> Anders
>
>> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
>> index fd56841..3864e88 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
>> @@ -37,6 +37,10 @@ SRC_URI += "file://configure-targets.patch \
>>               file://crypto_use_bigint_in_x86-64_perl.patch \
>>               file://openssl-1.0.2a-x32-asm.patch \
>>               file://ptest_makefile_deps.patch  \
>> +            file://CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch \
>> +            file://CVE-2015-3194-1-Add-PSS-parameter-check.patch \
>> +            file://0001-Add-test-for-CVE-2015-3194.patch \
>> +            file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
>>              "
>

