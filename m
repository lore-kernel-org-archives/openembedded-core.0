Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44F80731A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 03:29:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6C3TBrp007050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 11 Jul 2016 20:29:12 -0700
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 11 Jul 2016 20:29:10 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Catalin Enache
	<catalin.enache@windriver.com>
References: <1462536830-30243-1-git-send-email-catalin.enache@windriver.com>
	<CAJTo0La2hOxuxNsEdoEVE2tKDsL_3nRd6zonG-iLn7_=HRtqyQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57846393.1090200@windriver.com>
Date: Tue, 12 Jul 2016 11:27:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La2hOxuxNsEdoEVE2tKDsL_3nRd6zonG-iLn7_=HRtqyQ@mail.gmail.com>
X-Originating-IP: [128.224.163.140]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub-efi: run autogen.sh before configure
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
X-List-Received-Date: Tue, 12 Jul 2016 03:29:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年07月11日 18:22, Burton, Ross wrote:
>
> On 6 May 2016 at 13:13, Catalin Enache <catalin.enache@windriver.com
> <mailto:catalin.enache@windriver.com>> wrote:
>
>       DEPENDS_class-target = "grub-efi-native"
>       RDEPENDS_${PN}_class-target = "diffutils freetype"
>     +DEPENDS += "autogen-native"
>
>
> Because += happens after overrides this results in autogen-native only a
> dependency in native builds, so you can't be sure it will be present for
> target builds.

Thanks Ross! Will update the line as:
DEPENDS_append = " autogen-native"
>
> Should the configure_prepend and autogen-native be added to grub2.inc so
> that every recipe has that dependency?

Hi Catalin,
Could you help to confirm if the three recipes (grub-efi_2.00.bb, 
grub_2.00.bb, grub_git.bb) all need configure_prepend and 
autogen-native? if yes, I will resent the patch to add configure_prepend 
and autogen-native to grub2.inc, if not, then we still let it stay in 
grub-efi recipe.

Thanks,
Grace
>
> Ross
>
>

