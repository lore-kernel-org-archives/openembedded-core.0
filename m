Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE34373FC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 01:45:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4D1jOEP003720
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 May 2015 18:45:24 -0700 (PDT)
Received: from [128.224.163.153] (128.224.163.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 12 May 2015 18:45:23 -0700
Message-ID: <5552ACB3.8060805@windriver.com>
Date: Wed, 13 May 2015 09:45:23 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1431411478.git.Qi.Chen@windriver.com>
	<3030d69a4aa172f6af394a142075414bba95e61d.1431411478.git.Qi.Chen@windriver.com>
	<6BA6B5A3-7785-4130-AE6E-42436EF2D8A3@gmail.com>
In-Reply-To: <6BA6B5A3-7785-4130-AE6E-42436EF2D8A3@gmail.com>
X-Originating-IP: [128.224.163.153]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 1/2] populate_sdk_ext: install the latest buildtools-tarball
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
X-List-Received-Date: Wed, 13 May 2015 01:45:28 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2015 12:19 AM, Khem Raj wrote:
>> On May 11, 2015, at 11:19 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>>
>> -	install ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKGARCH}-buildtools-nativesdk-standalone-${DISTRO_VERSION}.sh ${SDK_OUTPUT}/${SDKPATH}
>> +	# find latest buildtools-tarball and install it
>> +	buildtools_path=`ls -t1 ${SDK_DEPLOY}/${DISTRO}-${TCLIBC}-${SDK_ARCH}-buildtools-tarball-${TUNE_PKGARCH}-buildtools-nativesdk-standalone-*.sh | head -n1`
>> +	install $buildtools_path ${SDK_OUTPUT}/${SDKPATH}
>>
> why not create a symink instead of poking using wild chars

Because it's simpler.

//Chen Qi

