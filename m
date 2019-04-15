Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7617D916
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 08:42:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x3F8gSEO009181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Apr 2019 01:42:28 -0700 (PDT)
Received: from [128.224.163.192] (128.224.163.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 15 Apr 2019 01:42:27 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1555317167-20284-1-git-send-email-yi.zhao@windriver.com>
	<97ab05f9b4560c85e7386210318fe98b1d5121af.camel@linuxfoundation.org>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <c7744acd-1290-c641-860a-569a6b43e8cc@windriver.com>
Date: Mon, 15 Apr 2019 16:42:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <97ab05f9b4560c85e7386210318fe98b1d5121af.camel@linuxfoundation.org>
X-Originating-IP: [128.224.163.192]
Subject: Re: [PATCH] libyaml: update SRC_URI[md5sum] and SRC_URI[sha256sum]
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
X-List-Received-Date: Mon, 15 Apr 2019 08:42:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


在 2019/4/15 下午4:35, Richard Purdie 写道:
> On Mon, 2019-04-15 at 16:32 +0800, Yi Zhao wrote:
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta/recipes-support/libyaml/libyaml_0.2.2.bb | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-support/libyaml/libyaml_0.2.2.bb
>> b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
>> index d2b39f3..fbd1992 100644
>> --- a/meta/recipes-support/libyaml/libyaml_0.2.2.bb
>> +++ b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
>> @@ -8,8 +8,10 @@ LICENSE = "MIT"
>>   LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
>>   
>>   SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
>> -SRC_URI[md5sum] = "2ad4119a57f94739cc39a1b482c81264"
>> -SRC_URI[sha256sum] =
>> "46bca77dc8be954686cff21888d6ce10ca4016b360ae1f56962e6882a17aa1fe"
>> +SRC_URI[md5sum] = "54bf11ccb8bc488b5b3bec931f5b70dc"
>> +SRC_URI[sha256sum] =
>> "4a9100ab61047fd9bd395bcef3ce5403365cafd55c1e0d0299cde14958e47be9"
>> +
>> +S = "${WORKDIR}/yaml-${PV}"
> Why?
>
> Did upstream change the tarball?


I think so. But there is no any changelog or  checksum file in download 
page: https://pyyaml.org/download/libyaml/


//Yi


>
> Cheers,
>
> Richard
>
>

