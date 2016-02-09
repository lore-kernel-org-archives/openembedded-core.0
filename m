Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5802A73197
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 10:36:33 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Feb 2016 02:36:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,420,1449561600"; d="scan'208";a="44867611"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Feb 2016 02:36:34 -0800
To: openembedded-core@lists.openembedded.org
References: <1454981383-15843-1-git-send-email-akuster808@gmail.com>
	<1454981383-15843-3-git-send-email-akuster808@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56B9C07D.1070807@linux.intel.com>
Date: Tue, 9 Feb 2016 12:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1454981383-15843-3-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH 3/3] nettle: Security fix CVE-2015-8804
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
X-List-Received-Date: Tue, 09 Feb 2016 10:36:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2016 03:29 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   .../nettle/nettle-3.1.1/CVE-2015-8804.patch        | 281 +++++++++++++++++++++
>   meta/recipes-support/nettle/nettle_3.1.1.bb        |   1 +

Why not update to latest upstream (3.2) instead?

Alex


