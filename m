Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5AB615A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 11:50:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9VBolgC016520
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Oct 2013 04:50:48 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 31 Oct 2013 04:50:47 -0700
Message-ID: <52724411.9050909@windriver.com>
Date: Thu, 31 Oct 2013 19:50:41 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1383214870.git.hongxu.jia@windriver.com>
	<0ab98fd1823d92b6661b60432b3ec30fd9c9a03d.1383214870.git.hongxu.jia@windriver.com>
	<20131031104111.GI32015@jama>
In-Reply-To: <20131031104111.GI32015@jama>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qemu: use PACKAGECONFIG to address nss dependencies
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
X-List-Received-Date: Thu, 31 Oct 2013 11:50:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2013 06:41 PM, Martin Jansa wrote:
> On Thu, Oct 31, 2013 at 06:23:01PM +0800, Hongxu Jia wrote:
>> Use PACKAGECONFIG to explicitly address nss dependencies rather than
>> tested by configure.
>>
>> It avoided potential errors while multiple builds shared a common
>> state_cache.
> There are more floating dependencies in qemu.inc, see
> http://patchwork.openembedded.org/patch/56935/
>
> and even this list isn't complete, there is also:
> WARN: packages/armv5te-oe-linux-gnueabi/qemu/qemu/latest lost dependency on  cairo gdk-pixbuf gnutls gtk+ libvte
>
> Can you please improve it to fix them all?
>

OK, I will try to fix them as possible as I can.

Drop this patch, wait for V2.

//Hongxu

>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index 1b861d7..87a7275 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -83,6 +83,7 @@ do_install_append() {
>>   PACKAGECONFIG ??= ""
>>   PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
>>   PACKAGECONFIG[aio] = "--enable-linux-aio,--disable-linux-aio,libaio,"
>> +PACKAGECONFIG[nss] = "--enable-smartcard-nss,--disable-smartcard-nss,nss,"
>>   
>>   # Qemu target will not build in world build for ARM or Mips
>>   BROKEN_qemuarm = "1"
>> -- 
>> 1.8.1.2
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


