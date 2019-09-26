Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B24117ED22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 17:09:06 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1iDXGN-0003DO-85; Thu, 26 Sep 2019 19:09:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/95zlzkrfjt8Bhmw/JYdz498DWJV5OmG6wHt7L+9HPc=;
	b=P5J9Je467funotzMJAegJsuoxo
	3zXE65R9iToaT9qtyD1SoSYOithrOwhI2i/gUZTMKF3rPlh7TzFMm5dgmsB31MIC/xAWFvzE7E2h/
	dBhIGlNwUY+x8/7Lr9agUfWMrkg8fsN7G/9hwd8vxIyeroUzL+1jv7uQUk1ZRIu4t1KdSJie8xCnW
	f12UdS4wehM57Ux+gQbsy3ZueLypxLCpKBNFi4+JaNDqN6cCnCx9ylJy5S6W0x9KAuNobIx3HXr0W
	JRGI1W8ZoFjNJp5D/IkhrKOk6GqE36RcHWkBZaZ8rzNMFjsu+kDy/vcB6TQyxcsd18JAP9pd8nOnz
	IkqQkdkw==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=[192.168.1.13])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1iDXGJ-0006AK-6u; Thu, 26 Sep 2019 19:09:05 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190926090532.4131-1-zboszor@pr.hu>
	<2d13e0b4b4ca76b8953baef89d5bd7589218928f.camel@linuxfoundation.org>
	<2d191737-5fa3-5e18-4528-c989f86e3805@pr.hu>
	<27e95708-e551-19d9-2274-94354207ad5c@pr.hu>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <d4bc7322-a5d8-417d-739d-31589034e1dc@pr.hu>
Date: Thu, 26 Sep 2019 19:09:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <27e95708-e551-19d9-2274-94354207ad5c@pr.hu>
X-Spam-Score: -1.8 (-)
X-Scan-Signature: 76ab43eec501ec4ddadf215339afa85a
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190926170905Z
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
X-List-Received-Date: Thu, 26 Sep 2019 17:09:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2019. 09. 26. 19:02 keltezéssel, Böszörményi Zoltán via Openembedded-core írta:
> 2019. 09. 26. 18:50 keltezéssel, Böszörményi Zoltán via Openembedded-core írta:
>> 2019. 09. 26. 17:45 keltezéssel, Richard Purdie írta:
>>> On Thu, 2019-09-26 at 11:05 +0200, Böszörményi Zoltán via Openembedded-
>>> core wrote:
>>>> There's INITRAMFS_FSTYPES that can be set differently.
>>>>
>>>> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
>>>> ---
>>>>
>>>> With the hardcoded initrd filename suffix but INITRAMFS_FSTYPES
>>>> set to cpio.lzma, this error occurs:
>>>>
>>>> ERROR: sicom-pos-image-1.0-r0 do_bootimg:
>>>> .../deploy/glibc/images/intel-core2-32/core-image-minimal-initramfs-
>>>> intel-core2-32.cpio.lzma is invalid. initrd image creation failed.
>>>> ERROR: sicom-pos-image-1.0-r0 do_bootimg: Function failed:
>>>> build_hddimg (log file is located at .../tmp-sicom-
>>>> glibc/work/intel_core2_32-sicom-linux/sicom-pos-image/1.0-
>>>> r0/temp/log.do_bootimg.32210)
>>>> ERROR: Logfile of failure stored in: .../tmp-sicom-
>>>> glibc/work/intel_core2_32-sicom-linux/sicom-pos-image/1.0-
>>>> r0/temp/log.do_bootimg.32210
>>>> ERROR: Task (.../layers/meta-sicom/images/sicom-pos-
>>>> image.bb:do_bootimg) failed with exit code '1'
>>>>
>>>>   meta/classes/image-live.bbclass | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-
>>>> live.bbclass
>>>> index af71be5093..54058b350d 100644
>>>> --- a/meta/classes/image-live.bbclass
>>>> +++ b/meta/classes/image-live.bbclass
>>>> @@ -37,7 +37,7 @@ do_bootimg[depends] += "dosfstools-
>>>> native:do_populate_sysroot \
>>>>   LABELS_LIVE ?= "boot install"
>>>>   ROOT_LIVE ?= "root=/dev/ram0"
>>>>   INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
>>>> -INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-
>>>> ${MACHINE}.cpio.gz"
>>>> +INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-
>>>> ${MACHINE}.${INITRAMFS_FSTYPES}"
>>>>   LIVE_ROOTFS_TYPE ?= "ext4"
>>>>   ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"
>>>
>>> I'm a little worried that INITRAMFS_FSTYPES can contain multiple values
>>> by the sounds of its name...
>>
>>  From the looks of the current value, it's already contains multiple values
>> delimited by that dot. "cpio" + "gz".
>>
>> Also, according to meta/conf/documentation.conf, line 228:
>>
>> INITRAMFS_FSTYPES[doc] = "Defines the format for the output image of an initial RAM disk 
>> (initramfs), which is used during boot."
> 
> Also, image-live.bbclass uses this variable this way:
> 
> INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}"
> 
> The initrd/initramfs file name would definitely look strange if
> this variable could contain multiple space delimited settings.

Also, openembedded-core/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
has that _build_initramfs_path function from line 143. The usage of
the same variable in this python function also points back to the
documentation line, i.e. it's a filename suffix and not multiple
settings delimited by space.

> 
>>
>> Defines the "format", singular. Maybe the variable is a slight misnomer.
>>
>> Cheers,
>> Zoltán Böszörményi
> 


