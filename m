Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE6F86BF50
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:19:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7TGJ4D8020431
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2013 09:19:04 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 29 Aug 2013 09:19:04 -0700
Message-ID: <521F746C.4020608@windriver.com>
Date: Thu, 29 Aug 2013 12:18:52 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
	<6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
	<521BA7CB.7070206@windriver.com>
	<2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
	<521D0622.6090802@windriver.com>
	<2AC87191-8D2B-4972-A249-2043B68A0A7B@gmail.com>
	<521E7D2E.6060404@windriver.com>
	<E66BA9BD-07D4-4A90-BFB9-0908608FBD07@gmail.com>
	<A3529AF4-7650-4866-A83B-5D948D733723@gmail.com>
	<6A28979E-6351-4F22-B118-8987B099613B@gmail.com>
	<7C83EB0C-C1E8-4481-AD5A-D38135A15D9F@gmail.com>
In-Reply-To: <7C83EB0C-C1E8-4481-AD5A-D38135A15D9F@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 16:19:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-29 12:17 PM, Khem Raj wrote:
>
> On Aug 29, 2013, at 1:50 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
>>>> also take a look at meta-linaro, they test armv7+ qemu regularly.
>>
>> I built core-image-minimal using meta-linaro, using genericarmv7 machine but it just generates an Image file for the kernel and a tar.gz rootfs. It doesn't look like its useful out of the box for a QEMU image. Additionally you have to do something extra for the image to be usable for a beagle QEMU machine, related to x-load and u-boot, to get it to work.
>
> x-load, u-boot are not needed when booting a qemu machine. You just need a kernel and rfs. So make sure that you use a kernel thats configured correctly to boot on say vexpress emulation on qemu and that should be it. Real thing is to figure out the kernel and any patches if needed.

vexpress itself works out of the box with the changes in the kernel,
I boot it frequently via NFS out of linux-yocto. It's the platform's
lack of bus/disk support that is the real issue.

Bruce

>
>>
>> Are you aware of the extract steps? Most of the docs I've seen use pre built sd card images.
>>
>> Best regards,
>>
>> Elvis
>


