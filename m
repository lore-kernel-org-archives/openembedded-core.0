Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37C9860721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 00:49:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6Q0nlZR029762
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Jul 2016 17:49:47 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 17:49:47 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1469431638.git.liezhi.yang@windriver.com>
	<9b789aaef553ad10b81868af8a32e48ed5d702ac.1469431638.git.liezhi.yang@windriver.com>
	<CAJTo0LaAduh5ep=xgK8NO1MHc0R1Cr-Hwqe8Ut1FrkCviv+Rpg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5796B3A9.4000809@windriver.com>
Date: Tue, 26 Jul 2016 08:49:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaAduh5ep=xgK8NO1MHc0R1Cr-Hwqe8Ut1FrkCviv+Rpg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] libinput: fix udevdir
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
X-List-Received-Date: Tue, 26 Jul 2016 00:49:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/26/2016 12:55 AM, Burton, Ross wrote:
>
> On 25 July 2016 at 08:28, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +FILES_${PN} += "${base_libdir}/udev/ ${nonarch_base_libdir}/udev/"
>
>
> Isn't this covered by the bitbake.conf change?

Hi Ross,

No, it is the subdir udev/rules.d in bitbake.conf:

${base_prefix}/lib/udev/rules.d ${prefix}/lib/udev/rules.d
${base_libdir}/udev/rules.d ${libdir}/udev/rules.d

I'd like to update bitbake.conf to lib/udev (no rules.d) if no objections,
then we can drop this patch.

// Robert

>
> Ross
>

