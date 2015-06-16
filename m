Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDFE73F9E;
	Tue, 16 Jun 2015 13:40:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2015 06:40:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="711954527"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2015 06:40:29 -0700
Message-ID: <55802755.4050106@linux.intel.com>
Date: Tue, 16 Jun 2015 16:40:37 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
References: <557E9EFE.1030703@linux.intel.com>	<CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>	<CAJTo0LbRVqw3h_3igs59=DTnaz6nf4w=A5ZpXepmh6xiKtVdPA@mail.gmail.com>	<557EE4C2.501@linux.intel.com>	<CALbNGRS-xR52wapA2viFa0oZJ6kotFdjhXpb6kyOtpRyn--5=A@mail.gmail.com>	<55801903.4040905@linux.intel.com>	<CALbNGRTJeh4eCD45cGUOx-DRZPHSeKTqndq1Jk+7V-ANQtAPNA@mail.gmail.com>
	<5580269F.2090509@linux.intel.com>
In-Reply-To: <5580269F.2090509@linux.intel.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Webkit-gtk will be updated to latest upstream; midori browser to be replaced with Epiphany
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jun 2015 13:40:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2015 04:37 PM, Alexander Kanavin wrote:
> Latest epiphany will be provided as a replacement for midori. It
> works fine here in the core-image-sato under qemu. I can't promise it
> will work on ARM, but any ARM-specific issues are almost certainly
> in webkit's (or other web engine's) javascript JIT code and have
> nothing to do with the browser.

Oh, and with webkit it's trivial to disable JIT at compile time; in fact
I have to do it for ARMv5 and ARMv6 because it has bitrotten for those
architectures due to lack of upstream testing.

Alex


