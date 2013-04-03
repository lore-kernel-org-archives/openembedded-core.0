Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UNHGa-0007ra-Cg
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 08:33:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r336GeIQ003316
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2013 23:16:40 -0700 (PDT)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 2 Apr 2013 23:16:40 -0700
Message-ID: <515BC953.2070504@windriver.com>
Date: Wed, 3 Apr 2013 14:16:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1364793033.git.Qi.Chen@windriver.com>
	<be55160b84e74f803f6dce4ba755225538a76651.1364793033.git.Qi.Chen@windriver.com>
	<515AAFDE.4020409@mlbassoc.com>
In-Reply-To: <515AAFDE.4020409@mlbassoc.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH 1/1] core-image-sato.bb: increase free space size
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
X-List-Received-Date: Wed, 03 Apr 2013 06:33:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/2013 06:15 PM, Gary Thomas wrote:
> On 2013-04-01 20:30, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Sato images, by default, have about 100M free space. This is not enough
>> and it blocks automatic testing.
>>
>> This patch fixes this problem by overriding the IMAGE_OVERHEAD_FACTOR
>> in the sato image recipe.
>>
>> [YOCTO #4109]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-sato/images/core-image-sato.bb |    3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-sato/images/core-image-sato.bb 
>> b/meta/recipes-sato/images/core-image-sato.bb
>> index e3246d2..8df1d08 100644
>> --- a/meta/recipes-sato/images/core-image-sato.bb
>> +++ b/meta/recipes-sato/images/core-image-sato.bb
>> @@ -9,3 +9,6 @@ LICENSE = "MIT"
>>   inherit core-image
>>
>>   IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
>> +
>> +# Override IMAGE_OVERHEAD_FACTOR to increase the free space size on 
>> sato images.
>> +IMAGE_OVERHEAD_FACTOR = "2.0"
>>
>
> You should make this overridable by the user:
>   IMAGE_OVERHEAD_FACTOR ?= "2.0"
>
Yes. You're right.
And we can use "??=" in bitbake.conf.
A new patch set has been sent out.

Thanks,
Chen Qi


