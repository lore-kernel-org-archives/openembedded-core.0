Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5971671F9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 02:04:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAA241lh018930
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Nov 2014 18:04:01 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Sun, 9 Nov 2014 18:04:01 -0800
Message-ID: <54601D0F.5020707@windriver.com>
Date: Sun, 9 Nov 2014 20:03:59 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
	<CAJTo0LbUiPaj5aE0Eb0W9zGthfqx5ct4+6-obv0pJEwPMseuiw@mail.gmail.com>
	<CAJTo0LY+Mx8KnjsuCQ==ROG5V286_ZDViJ1xPVe0FxAY58mm9A@mail.gmail.com>
	<545E4DBD.6060806@windriver.com>
	<CAJTo0LaDa5D1XXtZpaPrzagesdkQAaT84rg=x4NWLLngWxQS6w@mail.gmail.com>
In-Reply-To: <CAJTo0LaDa5D1XXtZpaPrzagesdkQAaT84rg=x4NWLLngWxQS6w@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Nov 2014 02:04:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/14, 4:53 PM, Burton, Ross wrote:
>
> On 8 November 2014 17:07, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
>
>     This is why relying on userspace qemu to do postinstall actions isn't good.
>     If the host kernel doesn't have a new enough kernel it'll break.  If the
>     qemu does emulate the exact SOC, it'll break.. etc.. etc.. etc..
>
>
> Do you know how new is new enough for aarch64?  My build machine is running
> 3.2.0 at the moment (Debian stable).

 From what I found doing a google search 3.7.0 is minimum version for QEMU 
userspace on aarch64.

--Mark

>     So I would expect failures like this on anything that is using QEMU
>     userspace emulation (any arch).
>
>
> Apart from userspace ppc aborting we've done pretty well so far...
>
> Ross


