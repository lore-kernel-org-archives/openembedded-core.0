Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 40D4E6102E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 15:34:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Sep 2013 08:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,963,1371106800"; d="scan'208";a="407746612"
Received: from unknown (HELO [10.255.15.44]) ([10.255.15.44])
	by orsmga002.jf.intel.com with ESMTP; 23 Sep 2013 08:34:28 -0700
Message-ID: <52405F83.8020205@linux.intel.com>
Date: Mon, 23 Sep 2013 08:34:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: leimaohui <leimaohui@cn.fujitsu.com>
References: <00d201ceb5cd$1440b070$3cc21150$@cn.fujitsu.com>
	<CAJTo0LY_doa073K_9m2Ry24nKT54MoWsBQ9p_45c2WGL+EiDJA@mail.gmail.com>
	<00d501ceb5e6$ad9064f0$08b12ed0$@cn.fujitsu.com>
In-Reply-To: <00d501ceb5e6$ad9064f0$08b12ed0$@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1]udev_182: creat a symbolic file /sbin/udevadm to fix haldaemon starts error.
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
X-List-Received-Date: Mon, 23 Sep 2013 15:34:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/20/2013 02:49 AM, leimaohui wrote:
> On 20 September 2013 4:38 PM, Burton, Ross [mailto:ross.burton@intel.com] wrote:
>> On 20 September 2013 07:46, leimaohui <leimaohui@cn.fujitsu.com> wrote:
>>> The haldaemon requires /sbin/udevadm to start.
>>> So creat a symbolic file  /sbin/udevadm that links to /usr/bin/udevadm.
>>
>> Why not fix haldaemon to use the right path?
>
> But  according to  udev's changlog,I think it is better to add a symlink to
> udevadm.
>
> http://upstream-tracker.org/changelogs/libudev/182/changelog.html
>
> " The default install location of the 'udevadm' tool moved from 'sbin'
> to /usr/bin. Some tools expect udevadm in 'sbin', a symlink to udevadm
> needs to be manually created if needed, or --bindir=/sbin be specified."
>
As suggested by Ross, please patch haldaemon to use the the oecore location.

Thanks
	Sau!

> Best Regards,
> Maohui Lei
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

