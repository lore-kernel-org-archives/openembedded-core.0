Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BEE978CAA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:59:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R8xacJ022458
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Jul 2018 01:59:36 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 27 Jul 2018 01:59:36 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1532682009.git.liezhi.yang@windriver.com>
	<fbdc16a21bd8b04c9eff1eda6701fa723b07b9ed.1532682009.git.liezhi.yang@windriver.com>
	<CAMKF1spUhjxjO6F_xVW+AZWPZ+co_f2XKgeSU03Ge3y9fk5_3g@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <b419f6df-d931-5461-c96d-4dd87f8b4c95@windriver.com>
Date: Fri, 27 Jul 2018 16:58:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spUhjxjO6F_xVW+AZWPZ+co_f2XKgeSU03Ge3y9fk5_3g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] python3-pbr: add it for python3-testtools
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
X-List-Received-Date: Fri, 27 Jul 2018 08:59:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/27/2018 04:57 PM, Khem Raj wrote:
> please remove it from meta-python once its in core

Yes, I will, and also remove others from meta-openstack.

// Robert

> On Fri, Jul 27, 2018 at 1:51 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> - The python3-testtools RDEPENDS on it.
>> - It is from meta-python, I extended it to nativesdk.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-devtools/python/python-pbr.inc       | 14 ++++++++++++++
>>   meta/recipes-devtools/python/python3-pbr_3.1.1.bb |  2 ++
>>   2 files changed, 16 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python-pbr.inc
>>   create mode 100644 meta/recipes-devtools/python/python3-pbr_3.1.1.bb
>>
>> diff --git a/meta/recipes-devtools/python/python-pbr.inc b/meta/recipes-devtools/python/python-pbr.inc
>> new file mode 100644
>> index 0000000..74f67fb
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python-pbr.inc
>> @@ -0,0 +1,14 @@
>> +DESCRIPTION = "Python Build Reasonableness: PBR is a library that injects some useful and sensible default behaviors into your setuptools run"
>> +HOMEPAGE = "https://pypi.python.org/pypi/pbr"
>> +SECTION = "devel/python"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>> +
>> +SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
>> +SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
>> +
>> +inherit pypi
>> +
>> +RDEPENDS_${PN} += "${PYTHON_PN}-pip"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> diff --git a/meta/recipes-devtools/python/python3-pbr_3.1.1.bb b/meta/recipes-devtools/python/python3-pbr_3.1.1.bb
>> new file mode 100644
>> index 0000000..97e7361
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-pbr_3.1.1.bb
>> @@ -0,0 +1,2 @@
>> +inherit setuptools3
>> +require python-pbr.inc
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

