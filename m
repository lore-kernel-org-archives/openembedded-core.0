Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B6E7765C91
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 17:07:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA8H7AhE013527
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Nov 2014 09:07:11 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Sat, 8 Nov 2014 09:07:10 -0800
Message-ID: <545E4DBD.6060806@windriver.com>
Date: Sat, 8 Nov 2014 11:07:09 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Kai Kang <kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
	<CAJTo0LbUiPaj5aE0Eb0W9zGthfqx5ct4+6-obv0pJEwPMseuiw@mail.gmail.com>
	<CAJTo0LY+Mx8KnjsuCQ==ROG5V286_ZDViJ1xPVe0FxAY58mm9A@mail.gmail.com>
In-Reply-To: <CAJTo0LY+Mx8KnjsuCQ==ROG5V286_ZDViJ1xPVe0FxAY58mm9A@mail.gmail.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/25] Add machine qemuarm64
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
X-List-Received-Date: Sat, 08 Nov 2014 17:07:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/14, 3:55 AM, Burton, Ross wrote:
> On 8 November 2014 08:53, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>     On 6 November 2014 15:34, Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>> wrote:
>
>         It has been tested for core-image-minimal core-image-sato
>         core-image-sato-sdk
>         meta-toolchain and world.
>
>
>     When I boot core-image-sato, X can't start.  Does the virtual machine that
>     qemu runs not have video support at the moment?
>
>
> I also see that the gdk-pixbuf postinstall script that runs in a userspace qemu
> on the host is failing with the "FATAL: kernel too old".  Is this a known issue?

This is why relying on userspace qemu to do postinstall actions isn't good.  If 
the host kernel doesn't have a new enough kernel it'll break.  If the qemu does 
emulate the exact SOC, it'll break.. etc.. etc.. etc..

So I would expect failures like this on anything that is using QEMU userspace 
emulation (any arch).

--Mark



