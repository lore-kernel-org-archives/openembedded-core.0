Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6325A619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 07:42:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6F7gHLT016579
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Jul 2013 00:42:17 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 15 Jul 2013 00:42:17 -0700
Message-ID: <51E3A7D4.8040301@windriver.com>
Date: Mon, 15 Jul 2013 15:42:12 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1373599041.git.hongxu.jia@windriver.com>
	<8c39af966fa951e9395639e403195b34c37e6dbb.1373599041.git.hongxu.jia@windriver.com>
	<51E3A144.7080307@linux.intel.com>
In-Reply-To: <51E3A144.7080307@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] atom-pc:fix xuser write to usb storage failed
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
X-List-Received-Date: Mon, 15 Jul 2013 07:42:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2013 03:14 PM, Saul Wold wrote:
> On 07/12/2013 02:29 AM, Hongxu Jia wrote:
>> Add package pmount to atom-pc, the normal user could invoke pmount to 
>> mount
>> storage device and would have permissions to access it.
>>
> This should really have gone to the Poky ML (poky@yoctoproject.org)
>
Got it, I will sent this patch to poky@yoctoproject.org
> Sau!
>
>> [YOCTO #4004]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta-yocto-bsp/conf/machine/atom-pc.conf | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-yocto-bsp/conf/machine/atom-pc.conf 
>> b/meta-yocto-bsp/conf/machine/atom-pc.conf
>> index 6318d60..127b3ad 100644
>> --- a/meta-yocto-bsp/conf/machine/atom-pc.conf
>> +++ b/meta-yocto-bsp/conf/machine/atom-pc.conf
>> @@ -35,3 +35,4 @@ GLIBC_ADDONS = "nptl"
>>   EXTRA_OECONF_append_pn-matchbox-panel-2 = " --with-battery=acpi"
>>
>>   ROOTLESS_X = "1"
>> +IMAGE_INSTALL_append = " pmount"
>>


