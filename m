Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 128D27F04A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 17:02:35 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1iDXA4-0007cE-Dt; Thu, 26 Sep 2019 19:02:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=x5/j3fTO2QrM37fG+YnTBXtoeIjAd0NC4tQR2nO3raA=;
	b=Hq5vLAIgOEoDxwIz2XlGYMhrEV
	+5flAoANapoKY035JbXJCquERv4/fotZNo65dpj6CNz0PM7rMsN0V19th7yM0GH6C0/mvsTWEgHPk
	h5m1xC02X8GHXvMTxGn7Tv+V3ckhsJMM+wJNIFWSJB4FpeHsBqakU4jUUA73rpUza6yKkK3GuPQCK
	/SmNBP7YepKvpnRNJfhUE9BTW8wJHy/4d4hP2jZ2lhy9GX15FmXf4oo6UgTsbpt/8wdBir72yipo4
	DSGKFlvOCw/u4j4P1iyrUvN5QdHwqK+myOH9A+QUHwnzXvyQrEWoJQKhp6OeAdwN/jB+kIPvKnKnA
	T8zHNLiw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=[192.168.1.13])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1iDXA0-0003t8-Ef; Thu, 26 Sep 2019 19:02:34 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190926090532.4131-1-zboszor@pr.hu>
	<2d13e0b4b4ca76b8953baef89d5bd7589218928f.camel@linuxfoundation.org>
	<2d191737-5fa3-5e18-4528-c989f86e3805@pr.hu>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <27e95708-e551-19d9-2274-94354207ad5c@pr.hu>
Date: Thu, 26 Sep 2019 19:02:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2d191737-5fa3-5e18-4528-c989f86e3805@pr.hu>
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 10a865c42659b27c0304ef85eb81de5b
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190926170234Z
Subject: Re: [PATCH] classes/image-live.bbclass: Don't hardcode cpio.gz
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
X-List-Received-Date: Thu, 26 Sep 2019 17:02:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2019. 09. 26. 18:50 keltezéssel, Böszörményi Zoltán via Openembedded-core írta:
> 2019. 09. 26. 17:45 keltezéssel, Richard Purdie írta:
>> On Thu, 2019-09-26 at 11:05 +0200, Böszörményi Zoltán via Openembedded-
>> core wrote:
>>> There's INITRAMFS_FSTYPES that can be set differently.
>>>
>>> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
>>> ---
>>>
>>> With the hardcoded initrd filename suffix but INITRAMFS_FSTYPES
>>> set to cpio.lzma, this error occurs:
>>>
>>> ERROR: sicom-pos-image-1.0-r0 do_bootimg:
>>> .../deploy/glibc/images/intel-core2-32/core-image-minimal-initramfs-
>>> intel-core2-32.cpio.lzma is invalid. initrd image creation failed.
>>> ERROR: sicom-pos-image-1.0-r0 do_bootimg: Function failed:
>>> build_hddimg (log file is located at .../tmp-sicom-
>>> glibc/work/intel_core2_32-sicom-linux/sicom-pos-image/1.0-
>>> r0/temp/log.do_bootimg.32210)
>>> ERROR: Logfile of failure stored in: .../tmp-sicom-
>>> glibc/work/intel_core2_32-sicom-linux/sicom-pos-image/1.0-
>>> r0/temp/log.do_bootimg.32210
>>> ERROR: Task (.../layers/meta-sicom/images/sicom-pos-
>>> image.bb:do_bootimg) failed with exit code '1'
>>>
>>>   meta/classes/image-live.bbclass | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-
>>> live.bbclass
>>> index af71be5093..54058b350d 100644
>>> --- a/meta/classes/image-live.bbclass
>>> +++ b/meta/classes/image-live.bbclass
>>> @@ -37,7 +37,7 @@ do_bootimg[depends] += "dosfstools-
>>> native:do_populate_sysroot \
>>>   LABELS_LIVE ?= "boot install"
>>>   ROOT_LIVE ?= "root=/dev/ram0"
>>>   INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
>>> -INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-
>>> ${MACHINE}.cpio.gz"
>>> +INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-
>>> ${MACHINE}.${INITRAMFS_FSTYPES}"
>>>   LIVE_ROOTFS_TYPE ?= "ext4"
>>>   ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"
>>
>> I'm a little worried that INITRAMFS_FSTYPES can contain multiple values
>> by the sounds of its name...
> 
>  From the looks of the current value, it's already contains multiple values
> delimited by that dot. "cpio" + "gz".
> 
> Also, according to meta/conf/documentation.conf, line 228:
> 
> INITRAMFS_FSTYPES[doc] = "Defines the format for the output image of an initial RAM disk 
> (initramfs), which is used during boot."

Also, image-live.bbclass uses this variable this way:

INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}"

The initrd/initramfs file name would definitely look strange if
this variable could contain multiple space delimited settings.

> 
> Defines the "format", singular. Maybe the variable is a slight misnomer.
> 
> Cheers,
> Zoltán Böszörményi


