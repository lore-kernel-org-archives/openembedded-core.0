Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1RgRH6-00080W-Tx
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 02:28:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBU1LVf8024417
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Dec 2011 17:21:31 -0800 (PST)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 29 Dec 2011 17:21:31 -0800
Message-ID: <4EFD1219.2040207@windriver.com>
Date: Fri, 30 Dec 2011 09:21:29 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1325141432.git.liezhi.yang@windriver.com>
	<b77e4e9e630e0ae691e6f524c356745e0c42ffb2.1325141432.git.liezhi.yang@windriver.com>
	<4EFCA469.8020607@linux.intel.com>
In-Reply-To: <4EFCA469.8020607@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] Incremental image generation(Add config sample)
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
X-List-Received-Date: Fri, 30 Dec 2011 01:28:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/30/2011 01:33 AM, Saul Wold wrote:
> On 12/28/2011 11:00 PM, Robert Yang wrote:
>> Add the config sample for incremental image generation to
>> meta-yocto/conf/local.conf.sample
>>
>> [YOCTO #1651]
>>
>> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
>> ---
>> meta-yocto/conf/local.conf.sample | 7 +++++++
>> 1 files changed, 7 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta-yocto/conf/local.conf.sample
>> b/meta-yocto/conf/local.conf.sample
>> index ca8636c..e33ffd9 100644
>> --- a/meta-yocto/conf/local.conf.sample
>> +++ b/meta-yocto/conf/local.conf.sample
>> @@ -222,3 +222,10 @@ PATCHRESOLVE = "noop"
>> # track the version of this file when it was generated. This can safely be
>> ignored if
>> # this doesn't mean anything to you.
>> CONF_VERSION = "1"
>> +
>> +# Incremental image generation(only for rpm based rootfs currently), the rootfs
>> +# would be totally removed and re-created in the second generation by default,
>> +# but with INC_IMAGE_GEN = "1", the rootfs would be kept, and will do
>> +# update(remove/add some pkgs) on it.
>> +# NOTE: This is not suggested when you want to create a productive rootfs
>> +#INC_IMAGE_GEN = "1"
>
> This should probably belong in the local.conf.sample.extended file.
>

Thanks, Saul, I will wait for other's comment and send a V2 by the end of
tomorrow.

// Robert

> Sau!
>


