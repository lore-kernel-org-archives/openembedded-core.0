Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CEC106B1A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 05:21:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r755LJLT024311
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Aug 2013 22:21:19 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 4 Aug 2013 22:21:19 -0700
Message-ID: <51FF364D.3030908@windriver.com>
Date: Mon, 5 Aug 2013 13:21:17 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1374643300.git.rongqing.li@windriver.com>
	<947336a1ef2b936328ba6fcf519d55a4eda7085d.1374643300.git.rongqing.li@windriver.com>
	<8651FFE5-8500-4151-A4DF-BE780516C6CC@gmail.com>
	<51EF70F6.6060800@windriver.com>
	<CAJTo0LZn5-59UwuM3byj-LgSr8-SxzSqGaLnrzMpEjmR_O2Ayw@mail.gmail.com>
In-Reply-To: <CAJTo0LZn5-59UwuM3byj-LgSr8-SxzSqGaLnrzMpEjmR_O2Ayw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: ignore qemu output, and check its return code
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
X-List-Received-Date: Mon, 05 Aug 2013 05:21:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/26/2013 07:53 PM, Burton, Ross wrote:
> On 24 July 2013 07:15, Rongqing Li <rongqing.li@windriver.com> wrote:
>> qemu is not segfaulting, except error message, it returns 0,
>> and udevadm hwdb finished its task.
>
> A bit of googling takes you to
> https://bugs.launchpad.net/ubuntu/+source/qemu-linaro/+bug/758424.
> Key quote:
>
> "We only implement the futex syscalls if CONFIG_USE_NPTL. This isn't
> defined for the i386 target (the necessary support in target-i386 for
> pushing atomic insns up to the linux-user top level loop isn't
> implemented). The upshot is that running multithreaded programs in
> linux-user i386-target isn't supported and this is just one of the
> symptoms."
>
> Not segfaulting != working when multithreaded programs don't have
> futexs.  We'll be seeing this more in the future now that GLib assumes
> you can thread.
>
> Ross
>


I see this bug was not fixed from 2011-11, what should I do?

I know my patch works well on my machine.

-Roy



-- 
Best Reagrds,
Roy | RongQing Li

