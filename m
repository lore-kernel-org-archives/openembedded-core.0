Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B9D697422C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 09:35:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 07 Sep 2015 02:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,484,1437462000"; d="scan'208";a="784309814"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2015 02:35:49 -0700
Message-ID: <55ED5ADF.2090907@linux.intel.com>
Date: Mon, 07 Sep 2015 12:37:35 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>	<f5f4a16fdb097b19fb45e9f667f59f99e9f04ef5.1441293149.git.alexander.kanavin@linux.intel.com>	<B9C7EAB1-4025-474E-8FBB-7DF1BE6C5706@gmail.com>	<55E98B3B.4050704@linux.intel.com>
	<CAMKF1soR0r5ZVYYPnxGg0f+61oC2Cx6Mq0Y2390NXZzZn1-c4w@mail.gmail.com>
In-Reply-To: <CAMKF1soR0r5ZVYYPnxGg0f+61oC2Cx6Mq0Y2390NXZzZn1-c4w@mail.gmail.com>
Subject: Re: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Mon, 07 Sep 2015 09:35:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2015 05:16 PM, Khem Raj wrote:

>     I will send these patches only when oe-core is updated. Recipe
>     moving is always controversial, and I don't want to cause confusion
>     when the change is accepted by one side and rejected by the other.
>
>
> On the contrary you can make a note in patch to destination layer citing
> the patch for source layer being a prerequisite to be accepted.
> Maintainers then can schedule it accordingly.

Martin, would you prefer this approach? My problem is that the gap 
between initial oe-core patch submission and their acceptance is often 
measured in weeks and sometimes months, so the corresponding meta-oe 
patches would be hanging in limbo, and may be easily forgotten.

Alex


