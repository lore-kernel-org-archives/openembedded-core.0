Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 04BED71C65
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 19:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 376ED31C2344;
	Thu,  8 Dec 2016 20:22:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ZsN9FJC_yQQA; Thu,  8 Dec 2016 20:22:10 +0100 (CET)
Received: from [172.22.22.61] (55d41b28.access.ecotel.net [85.212.27.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D5FF731C2527;
	Thu,  8 Dec 2016 20:22:09 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-3-git-send-email-obi@opendreambox.org>
	<CAJTo0LbsxuA6wMm8gY1LJJhxq15k10x9HoD0qBBHi4tSoQa8SA@mail.gmail.com>
	<62473423-1805-cbb9-240f-c070f729fe16@opendreambox.org>
	<CAJTo0LbxmC2BBj0V2BXWo1UqJmgALSdSK=GmCh4dZeMyxFp3gg@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <fd84e0c1-d8ae-371b-0ef8-05f73b31a64e@opendreambox.org>
Date: Thu, 8 Dec 2016 20:22:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbxmC2BBj0V2BXWo1UqJmgALSdSK=GmCh4dZeMyxFp3gg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/33] dpkg: update-alternatives-dpkg should conflict with other providers
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
X-List-Received-Date: Thu, 08 Dec 2016 19:22:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 08.12.2016 17:16, Burton, Ross wrote:
> With PACKAGE_CLASSES="package_rpm package_deb" this happens:
> 
> ERROR: dpkg-native-1.18.7-r0 do_populate_sysroot: The recipe dpkg-native
> is trying to install files into a shared area when those files already
> exist. Those files and their manifest location are:
>  
>  /data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/bin/update-alternatives
>  Matched in b'manifest-x86_64-opkg-utils-native.populate_sysroot'
> 
> Whilst I agree that building multiple package types at the same time is
> a bit weird, it's always worked in the past.

Yes, I used this feature myself some time ago and don't want to be the
one breaking it. ;-)

Does this happen with the branch I pushed yesterday? Since commit
472899be2a97bf6c5741f6b414433e13cfea1c7b it shouldn't happen unless you
either explicitly enable update-alternatives in dpkg's PACKAGECONFIG, or
set PREFERRED_PROVIDER_virtual/update-alternatives-native to dpkg-native.

Regards,
Andreas


