Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADBA5731F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 14:21:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4RELEK6027932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 27 May 2016 07:21:14 -0700
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 27 May 2016 07:21:13 -0700
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>, Ross Burton
	<ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
References: <1462534000-18539-1-git-send-email-ross.burton@intel.com>
	<1464346463.28160.45.camel@andred.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a8f703f6-4b7b-d7f0-722f-df7caee70291@windriver.com>
Date: Fri, 27 May 2016 09:21:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1464346463.28160.45.camel@andred.net>
Subject: Re: [PATCH] bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
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
X-List-Received-Date: Fri, 27 May 2016 14:21:26 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 5/27/16 5:54 AM, André Draszik wrote:
> This doesn't work for me (at least on krogoth):
> 
>     ERROR: poky/meta/recipes-core/images/build-appliance-image_14.0.0.bb: No IMAGE_CMD defined for IMAGE_FSTYPES entry 'debugfs_vmdk' - possibly invalid type name or missing support class
>     ERROR: Failed to parse recipe: poky/meta/recipes-core/images/build-appliance-image_14.0.0.bb
> 
> I *instead* am using the attached patch successfully.
> 
> Is anybody else facing the same issue?

Ross's patch should have fixed this.  It ensures that IMAGE_FSTYPES_DEBUGFS is
always set to 'something'.

You should check if the patch has been applied to the "krogoth" branch.

--Mark

> 
> On Fr, 2016-05-06 at 12:26 +0100, Ross Burton wrote:
>> If debug filesystem generation is enabled but this isn't assigned then the
>> generation code throws exceptions.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/conf/bitbake.conf | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 1c4175f..8e02e91 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -713,6 +713,7 @@ require conf/sanity.conf
>>  DL_DIR ?= "${TOPDIR}/downloads"
>>  SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
>>  IMAGE_FSTYPES ?= "tar.gz"
>> +IMAGE_FSTYPES_DEBUGFS ?= "${IMAGE_FSTYPES}"
>>  
>>  INITRAMFS_FSTYPES ?= "cpio.gz"
>>  # The maximum size in Kbytes for the generated initramfs image size.
>> -- 
>> 2.8.0.rc3
>>
>>


