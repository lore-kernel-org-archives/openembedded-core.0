Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 24BAB6BC8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 02:28:26 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id id10so6722598vcb.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 19:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=/90NoNV1BeENGV6vHqdKpGpqPrCCnrT/jk44P2ID79M=;
	b=lV0E0kxY/EJB8R4hkNSerHXjKu603q330VyM5m3uQ4/gFrWb2W9TmfwRs9GG8CiUT8
	kKySXtRAdsAiknwm6DR2aT5ekbO3bu05TMW4aycK3s0obglnm8BPzNEGoCSSkU1t8ECO
	/fkJZNfWYFX56qpKlagCRGZSxCakAsGPSHQ9XCOLtaeup4+/qZZCOaCCkM7+LxYfP2LQ
	lUO56g7/xCPaGypq5G3dvbdqAWnN9mT9lOCgo6mwU8zypOavHfrWLPX9xBCOejkdHPBa
	9fgXJQ+dicZ0x0dg5qJ87y4GUhVZoy6DagS6UMPgsAWar/eVDtUzYDtn+lRsZUfY9oFX
	QgkQ==
X-Received: by 10.58.238.35 with SMTP id vh3mr52681617vec.16.1395714507233;
	Mon, 24 Mar 2014 19:28:27 -0700 (PDT)
Received: from [192.168.1.3] ([187.106.6.19])
	by mx.google.com with ESMTPSA id v20sm29649765vdj.0.2014.03.24.19.28.25
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Mar 2014 19:28:26 -0700 (PDT)
Message-ID: <5330E9C8.10808@gmail.com>
Date: Mon, 24 Mar 2014 23:28:24 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>	
	<1395417268.25867.74.camel@empanada> <532E461E.3090206@gmail.com>
	<1395692034.25867.103.camel@empanada>
In-Reply-To: <1395692034.25867.103.camel@empanada>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Tue, 25 Mar 2014 02:28:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tom,

Almost done. I need to test and check some use cases.


Em 24-03-2014 17:13, Tom Zanussi escreveu:
> I suppose using --label would be ok, though I don't really like to 
> overload things like this in general, and it forces the partitions to 
> have labels. 

Nice, but I convinced myself to use another string as connection. Like 
you have proposed.

>>>
>>> That seems kind of unreadable to me.  Why not just add another
>>> ROOTFS_DIR line for anything beyond the default rootfs e.g.
>>>
>>>      ROOTFS_DIR:                    /home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal/1.0-r0/rootfs
>>>      ROOTFS_DIR["secondary"]:       /home/trz/yocto/master-cur/build/tmp/work/crownbay-poky-linux/core-image-minimal-dev/1.0-r0/rootfs
>>>      BOOTIMG_DIR:                   /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/share
>>>      KERNEL_DIR:                    /home/trz/yocto/master-cur/build/tmp/sysroots/crownbay/usr/src/kernel
>>>      NATIVE_SYSROOT:                /home/trz/yocto/master-cur/build/tmp/sysroots/x86_64-linux

Ok.

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


