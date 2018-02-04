Return-Path: <jan.siegmund0@hm.edu>
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [129.187.255.137])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0757847D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Feb 2018 11:05:13 +0000 (UTC)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 3zZ7DB0KpFzyVL;
	Sun,  4 Feb 2018 12:05:14 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.89
X-Spam-Level: 
X-Spam-Status: No, score=-2.89 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_HAS_CLANG=0.001,
	LRZ_MSGID_HL8_4HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001,
	LRZ_MSGID_MS_EX=0.001, LRZ_UA_MOZ=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new,
	port 20024)
	with LMTP id RiFWkCWH2JAM; Sun,  4 Feb 2018 12:05:13 +0100 (CET)
Received: from [IPv6:2001:4c50:149:b900:c51f:62d8:6a67:304e] (unknown
	[IPv6:2001:4c50:149:b900:c51f:62d8:6a67:304e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 3zZ7D93kKVzyVQ;
	Sun,  4 Feb 2018 12:05:13 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20180203103314.2646-1-jsiegmun@hm.edu>
	<1517738390.3090.76.camel@linuxfoundation.org>
From: Jan Siegmund <jan.siegmund0@hm.edu>
Message-ID: <585a21d7-e9cf-a318-1be8-1b624ca3d919@hm.edu>
Date: Sun, 4 Feb 2018 12:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1517738390.3090.76.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] apt-native: Add libapt-pkg headers
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
X-List-Received-Date: Sun, 04 Feb 2018 11:05:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Am 04.02.2018 um 10:59 schrieb Richard Purdie:
> On Sat, 2018-02-03 at 11:33 +0100, Jan Siegmund wrote:
>> From: Jan Siegmund <jsiegmund@arri.de>
>>
>> Native tools were not able to use the headers of apt-pkg. This patch
>> adds the feature.
>> The headers were added from apt-pkg and apt-inst to the native
>> recipe.
>> The shipped headers match the ones in the Ubuntu package libapt-pkg-
>> dev.
>>
>> Signed-off-by: Jan Siegmund <jsiegmund@arri.de>
>> ---
>>  meta/recipes-devtools/apt/apt-native.inc | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-
>> devtools/apt/apt-native.inc
>> index 68f1b3ce2c..d82ffcc59f 100644
>> --- a/meta/recipes-devtools/apt/apt-native.inc
>> +++ b/meta/recipes-devtools/apt/apt-native.inc
>> @@ -35,6 +35,8 @@ python do_install_config () {
>>          outfile.close()
>>  }
>>  
>> +FILES_${PN} += "${includedir}"
>> +
>>  do_install_base () {
>>  	install -d ${D}${bindir}
>>  	install -m 0755 bin/apt-cdrom ${D}${bindir}/
> 
> I suspect a native recipe doesn't need to set FILES?

I'll drop it and send version 3.

> 
> Cheers,
> 
> Richard
> 

Thanks for the review,

Jan

