Return-Path: <psaavedra@igalia.com>
X-Greylist: delayed 1833 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Feb 2018 16:57:52 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 997F6600BC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=6fgRfp4uW2B0S/4JXhXSvPlVLUae/dvZIx8L297Y5ao=; 
	b=Rsw7eRPW2f7gs23T9tI8C05S4/e0Yg8f2xMk1617USWeLBry888B8IhqJHLlp3estLWcR0qu7X1WmspZTxbpoQrD5VJg9DxiUpHAI/pkW+L5xzCaGgYhlE8051/YpVPdVv5lwhXFklfSDJeuuLzIFb92BZrnXPLEvINwC0o6nm8qSz8OIcJOpgpKor8lTWQ68TRHGrHKHhQxncWW0SCB34/7/joa94/KLnevti5RsYAUnKbK0K6wZdPOaiEMOLkAcxkKid/abQobUlNzE2mZ5ddjvmLXXiLjad+iNYTNm1YoiLjBk4D56qpPGNPBlzbT/DM6tW/FE4r1qbtr3JkUnw==;
Received: from 6.27.165.83.dynamic.reverse-mundo-r.com ([83.165.27.6]
	helo=[192.168.9.78]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1eijbz-0004HV-Ep for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 17:27:19 +0100
To: openembedded-core@lists.openembedded.org
References: <8da72ea4-8a6f-848b-539c-63bfc7197cfb@gmail.com>
From: Pablo Saavedra <psaavedra@igalia.com>
Message-ID: <0c839d38-650b-5385-b761-acaad9267873@igalia.com>
Date: Mon, 5 Feb 2018 17:27:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <8da72ea4-8a6f-848b-539c-63bfc7197cfb@gmail.com>
Subject: Re: [PATCH] puppet: add recipe for puppet 4.10.9
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
X-List-Received-Date: Mon, 05 Feb 2018 16:57:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


>
> On 11/27/17 2:35 AM, Pablo Saavedra wrote:
>> Added Yocto recipe for Puppet 4.10.9
>>
>> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
>> ---
>>   recipes-support/puppet/puppet_4.10.9.bb | 41 +++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 recipes-support/puppet/puppet_4.10.9.bb
>>
>> diff --git a/recipes-support/puppet/puppet_4.10.9.bb b/recipes-support/puppet/puppet_4.10.9.bb
>> new file mode 100644
>> index 0000000..a335546
>> --- /dev/null
>> +++ b/recipes-support/puppet/puppet_4.10.9.bb
>> @@ -0,0 +1,41 @@
>> +SUMMARY = "Open source Puppet is a configuration management system"
>> +HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7c9045ec00cc0d6b6e0e09ee811da4a0"
>> +
>> +SRC_URI = " \
>> +    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
>> +    file://add_puppet_gemspec.patch \
>> +    file://puppet.conf \
>> +"
>> +SRC_URI[md5sum] = "8af3c2fec5dc4683d80aab4efc1614c6"
>> +SRC_URI[sha256sum] = "e667bd825e54bbc38c30534c25adc441ed638fc484fe0abe278f0335770cd161"
>> +
>> +inherit ruby
> which layer is ruby.bbclass coming from ?

meta-cloud-services/classes/ruby.bbclass into the meta-cloud-services layer

Sorry, I guess this this patch should be sent against
openembedded-devel@lists.openembedded.org

