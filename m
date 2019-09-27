Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 08D357F284
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 04:31:51 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1iDhv6-0003Sz-AV; Fri, 27 Sep 2019 06:31:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/RGJPYvGTv37UtVSa31dlNe8aoIK0K2cNp/ATU5gank=;
	b=AF3S+zmGi8vpi2cGHi5Czuzrpb
	SfCu/SF1faw5NZsoixy/4+Md9o0wcRs9RUjgNKoagbMwghv8B7wUNXv84GtpelmqFmsrrCEu/3GKw
	ueOesMoYaNVftigXzWZeFoHgOpO1r/n50fAYEHvREPQJOWVtapiLHQeUTlx4LYTWJbFVhExMd5tR1
	h9Uw08D1TzP1rZ05JVpM6x1wJ7zqCWSqpnPsTkZKsbfqQcaIifxGnG79VEbCp3KAUHq5kh34bgqCG
	qNwtHEdB382LApIZ/98MoTVg+xp2gYb2z7hCPSPrC6ZV0Pl4hzcWm0J9E9dCVYBLxcRhbpGl9EG51
	/OyNIevQ==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=[192.168.1.13])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1iDhv2-0005MB-BK; Fri, 27 Sep 2019 06:31:50 +0200
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <20190926090532.4131-1-zboszor@pr.hu>
	<2d13e0b4b4ca76b8953baef89d5bd7589218928f.camel@linuxfoundation.org>
	<2d191737-5fa3-5e18-4528-c989f86e3805@pr.hu>
	<27e95708-e551-19d9-2274-94354207ad5c@pr.hu>
	<d4bc7322-a5d8-417d-739d-31589034e1dc@pr.hu>
	<243d7b47bc339bb2d6fa8459dfde09f14910ecd2.camel@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <a7dcc902-33e4-e2b1-4a55-c5cfa4af2f59@pr.hu>
Date: Fri, 27 Sep 2019 06:31:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <243d7b47bc339bb2d6fa8459dfde09f14910ecd2.camel@linuxfoundation.org>
X-Spam-Score: -1.8 (-)
X-Scan-Signature: f51b28b80251e2f33265d70a8f4dc624
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190927043150Z
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
X-List-Received-Date: Fri, 27 Sep 2019 04:31:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2019. 09. 26. 23:02 keltezéssel, richard.purdie@linuxfoundation.org írta:
> On Thu, 2019-09-26 at 19:09 +0200, Böszörményi Zoltán wrote:
>> 2019. 09. 26. 19:02 keltezéssel, Böszörményi Zoltán via Openembedded-
>> core írta:
>>> 2019. 09. 26. 18:50 keltezéssel, Böszörményi Zoltán via
>>> Openembedded-core írta:
>>>> 2019. 09. 26. 17:45 keltezéssel, Richard Purdie írta:
>>>>>
>>>>> I'm a little worried that INITRAMFS_FSTYPES can contain
>>>>> multiple values
>>>>> by the sounds of its name...
>>>>
>>>>   From the looks of the current value, it's already contains
>>>> multiple values
>>>> delimited by that dot. "cpio" + "gz".
>>>>
>>>> Also, according to meta/conf/documentation.conf, line 228:
>>>>
>>>> INITRAMFS_FSTYPES[doc] = "Defines the format for the output image
>>>> of an initial RAM disk
>>>> (initramfs), which is used during boot."
>>>
>>> Also, image-live.bbclass uses this variable this way:
>>>
>>> INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-
>>> ${MACHINE}.${INITRAMFS_FSTYPES}"
>>>
>>> The initrd/initramfs file name would definitely look strange if
>>> this variable could contain multiple space delimited settings.
>>
>> Also, openembedded-core/scripts/lib/wic/plugins/source/isoimage-
>> isohybrid.py
>> has that _build_initramfs_path function from line 143. The usage of
>> the same variable in this python function also points back to the
>> documentation line, i.e. it's a filename suffix and not multiple
>> settings delimited by space.
> 
> This does look ok given the above. Thanks for confirming.

Thanks for merging it into master-next.

I have also sent a patch for warrior separately with [warrior][PATCH]
yesterday, as I experienced the error there first.
Can you please apply it to warrior-next so I won't have to carry
the patch locally for long?

Thanks in advance,
Zoltán Böszörményi

> 
> Cheers,
> 
> Richard
> 
> 
> 


