Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 21DE271478
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 15:08:12 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id kq14so6548395pab.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 08:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=yE9Dnig0igDRulbiPVcAwonpgS9LKb3BLi4KEdAo60U=;
	b=tu9Hgpl6yyB79kAjQwM9zD8t5WvwuVt4M+KGrhCCLC5ddEY9SlQGn7vlzUZwkr9ECT
	qNIVU4SQkuV/M5Gx2POYIorllGkI3EuYLB0dNiPLIKfBb/xYofTc0HEDQXHr98Zgun6h
	ep3s6NsLLKsuAtGu+d3RD3u7K3Ma596C2lpEJRwYlmR/U8Wmd5FPKSVAhSaYCbmhF9JK
	ekZPISLzQ7M6kleE/HxgecJ0YLUC0xpB3XhmP0V24FcnfgMSsArIVw1Z9Gl2gSkHROLF
	Uq6CA7qCJwEXyX0Z77lgzPnE4bpjCeCC0xBbE1Aw0XXaPWvGakSaD+9V/zne4X6GR1Pg
	c3pw==
X-Received: by 10.68.69.70 with SMTP id c6mr38690254pbu.111.1410793693116;
	Mon, 15 Sep 2014 08:08:13 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:39d4:f1fb:2ffd:f85c?
	([2601:c:9380:601:39d4:f1fb:2ffd:f85c])
	by mx.google.com with ESMTPSA id
	zf5sm11697260pbc.44.2014.09.15.08.08.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Sep 2014 08:08:12 -0700 (PDT)
Message-ID: <541700DA.90803@gmail.com>
Date: Mon, 15 Sep 2014 08:08:10 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1410576597-16290-1-git-send-email-akuster808@gmail.com>
	<5416E596.5070500@windriver.com>
In-Reply-To: <5416E596.5070500@windriver.com>
Subject: Re: [PATCH] linux-yocto: add to qemuppc64 to bb file
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
X-List-Received-Date: Mon, 15 Sep 2014 15:08:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/15/2014 06:11 AM, Bruce Ashfield wrote:
> On 14-09-12 10:49 PM, Armin Kuster wrote:
>> Not sure if this this is the correct process.
>
> I'll grab the patch and carry it here, and update the SRCREVs at the
> same time as the other BSPs.

Great, thanks.

>
> As for adding qemuppc64 fully to the supported set of emulated BSPs
> for 1.7, that's Richard's call (and I haven't checked to see if the
> other patches were merged).

Being this late in the 1.7 schedule, I would advise targeting such a 
claim until 1.8.  I was surprised by the number for warnings and errors 
a limited world build (meta-networking) burped up considering ppc64 is 
already supported by a few BSP's.

- Armin
>
> Bruce
>
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto_3.14.bb | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
>> b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
>> index e06b191..dfe1de0 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
>> @@ -6,6 +6,7 @@ require recipes-kernel/linux/linux-yocto.inc
>>   KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
>>   KBRANCH_qemumips ?= "standard/mti-malta32"
>>   KBRANCH_qemuppc  ?= "standard/qemuppc"
>> +KBRANCH_qemuppc64  ?= "standard/qemuppc"
>>   KBRANCH_qemux86  ?= "standard/common-pc/base"
>>   KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
>>   KBRANCH_qemumips64 ?= "standard/mti-malta64"
>> @@ -13,6 +14,7 @@ KBRANCH_qemumips64 ?= "standard/mti-malta64"
>>   SRCREV_machine_qemuarm ?= "c32a2e1190325f685a61196f38fc03ceff2645bf"
>>   SRCREV_machine_qemumips ?= "1ff50c529b49ceb55a670258f7cb8233c8006c6c"
>>   SRCREV_machine_qemuppc ?= "12e9828a5b78891374375233b4075f682b9fbd0e"
>> +SRCREV_machine_qemuppc64 ?= "12e9828a5b78891374375233b4075f682b9fbd0e"
>>   SRCREV_machine_qemux86 ?= "58d49fe770ad642e2bc0616159195ba837dc513b"
>>   SRCREV_machine_qemux86-64 ?= "b85edae6fd61ceadfc08099608e8ac90aa4c5c33"
>>   SRCREV_machine_qemumips64 ?= "dcd579737386fca4d7bcf224bc118b14eb3c1d55"
>> @@ -27,7 +29,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>>
>>   KMETA = "meta"
>>
>> -COMPATIBLE_MACHINE =
>> "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
>> +COMPATIBLE_MACHINE =
>> "qemuarm|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
>>
>>   # Functionality flags
>>   KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>>
>

