Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1110971CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:49:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 15 May 2017 04:49:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="1147909179"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2017 04:49:46 -0700
To: openembedded-core@lists.openembedded.org,
	"Ohly, Patrick" <patrick.ohly@intel.com>
References: <9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4.1494837087.git-series.patrick.ohly@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <237a1d6e-7c01-2488-c6a2-e5d0c95aff53@linux.intel.com>
Date: Mon, 15 May 2017 14:47:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4.1494837087.git-series.patrick.ohly@intel.com>
Subject: Re: [PATCH] manpages.bbclass: avoid QA warning when "manpages" feature not supported
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
X-List-Received-Date: Mon, 15 May 2017 11:49:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2017 11:32 AM, Patrick Ohly wrote:
> Activating API documentation with:
>   INHERIT += "manpages"
>   DISTRO_FEATURES_append = " api-documentation"

You do not need to add the first line at all, why are you doing it?

manpages is inherited on a per-recipe basis when the recipe itself 
supports the manpages PACKAGECONFIG. This patch is unnecessary.

Alex


