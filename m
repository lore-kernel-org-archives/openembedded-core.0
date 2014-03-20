Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 936AD6E87A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 01:22:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2K1MCeG001565
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Mar 2014 18:22:12 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 19 Mar 2014 18:22:11 -0700
Message-ID: <532A42C2.3070101@windriver.com>
Date: Thu, 20 Mar 2014 09:22:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<091efa61bc526e408183aa5c6dda0b8eb76f16f8.1394555880.git.liezhi.yang@windriver.com>
	<5698279.dg0JllWHcX@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <5698279.dg0JllWHcX@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] archiver.bbclass: refactor it
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
X-List-Received-Date: Thu, 20 Mar 2014 01:22:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/19/2014 08:12 PM, Paul Eggleton wrote:
> On Wednesday 12 March 2014 01:08:20 Robert Yang wrote:
>> +AR_TOPDIR = "${WORKDIR}/deploy-sources"
>
> Could we please be consistent here and use ARCHIVER_TOPDIR, and also set it
> with ?= so the user can override it if desired?
>

Thanks, it is already on master-next now, how about we let them
get merged atm, and I will send another patch to fix it.

// Robert

> Thanks,
> Paul
>

