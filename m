Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31F3960656
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:32:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6O5W0Bf025995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Jul 2013 22:32:00 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 22:32:00 -0700
Message-ID: <51EF66CD.5030503@windriver.com>
Date: Wed, 24 Jul 2013 13:31:57 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1374470729.git.hongxu.jia@windriver.com>
	<ddc5bcdf8e55f13d76e2b0b256a4599912074496.1374470729.git.hongxu.jia@windriver.com>
	<CAJTo0LaLCLNXT5hEjTW6HNq+S++VvC+JjRoLtszYfMJ+HNJkQQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaLCLNXT5hEjTW6HNq+S++VvC+JjRoLtszYfMJ+HNJkQQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] nss:fix postinst failed at rootfs time
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
X-List-Received-Date: Wed, 24 Jul 2013 05:32:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2013 10:48 PM, Burton, Ross wrote:
> On 22 July 2013 06:45, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Create checksum file at rootfs time to support read-only rootfs.
> Have you verified that the checksum files don't change depending on
> the host architecture (big/little endian, 32/64 bit)?
Yes, I have verified.

*host
BUILD_SYS         = "x86_64-linux"

*target
TARGET_SYS        = "mips-poky-linux"
MACHINE           = "qemumips"
or
TARGET_SYS        = "i586-poky-linux"
MACHINE           = "qemux86"

Everything is ok.

Thanks,
Hongxu

> Ross


