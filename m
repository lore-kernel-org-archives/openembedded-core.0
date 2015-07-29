Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56105601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 01:52:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T1qdPL011902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jul 2015 18:52:39 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 18:52:22 -0700
Message-ID: <55B831E5.80805@windriver.com>
Date: Wed, 29 Jul 2015 09:52:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1438074266.git.liezhi.yang@windriver.com>
	<f629d3d6e47782347bea424511ef6bedeb64f9a8.1438074266.git.liezhi.yang@windriver.com>
	<CAJTo0LaXppcw31FEs_CwS0n+XTF7ScrmVgRVqvEd0nQcFokpOw@mail.gmail.com>
In-Reply-To: <CAJTo0LaXppcw31FEs_CwS0n+XTF7ScrmVgRVqvEd0nQcFokpOw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] mc: add PACKAGECONFIG for util-linux
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
X-List-Received-Date: Wed, 29 Jul 2015 01:52:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/28/2015 07:25 PM, Burton, Ross wrote:
>
> On 28 July 2015 at 10:05, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +PACKAGECONFIG[util-linux] =
>     "ac_cv_lib_mount_mnt_new_table_from_file=yes,ac_cv_lib_mount_mnt_new_table_from_file=no,util-linux,"
>
>
> For mc this might be something we want to enable by default.

Thanks, I will update it.

// Robert

>
> Ross

