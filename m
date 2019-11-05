Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9A067F8AB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 09:19:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA59Jl1B017450
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 01:19:47 -0800 (PST)
Received: from [128.224.158.234] (128.224.158.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 5 Nov 2019 01:19:46 -0800
To: Ross Burton <ross.burton@intel.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>
References: <1572517219-382824-1-git-send-email-zhe.he@windriver.com>
	<CADkTA4OvFRd7wCFQRHZAv+BMki9nsX_g5_TuogsHUvSnmDGLxg@mail.gmail.com>
	<5e5f4937-0465-49c0-66aa-71b79628fdf2@windriver.com>
	<c2ae56dd-61e2-f58c-a362-1d75a02663dd@intel.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <f28625b9-6c8f-4196-8bc0-838f3fb02e7b@windriver.com>
Date: Tue, 5 Nov 2019 17:19:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c2ae56dd-61e2-f58c-a362-1d75a02663dd@intel.com>
X-Originating-IP: [128.224.158.234]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dummy: Add package kernel
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
X-List-Received-Date: Tue, 05 Nov 2019 09:19:47 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/4/19 9:32 PM, Ross Burton wrote:
> On 01/11/2019 02:01, He Zhe wrote:
>> It's the "efi" in MACHINE_FEATURES who asks for "kernel".
>> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/packagegroups/packagegroup-core-boot.bb#n31
>
> I'd just rip out 'kernel' from that as that doesn't look right to me.

Not sure if the following patch is still the case.
http://lists.openembedded.org/pipermail/openembedded-core/2018-February/266287.html

Thanks,
Zhe

>
> Ross
>


