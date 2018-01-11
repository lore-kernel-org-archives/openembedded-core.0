Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 62EB678766
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:02:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 07:02:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,344,1511856000"; 
   d="scan'208";a="9983175"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 11 Jan 2018 07:02:40 -0800
To: openembedded-core@lists.openembedded.org
References: <20180111150029.7237-1-alexander.kanavin@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bff90e1d-1c48-1e64-3b88-1a321def8005@linux.intel.com>
Date: Thu, 11 Jan 2018 17:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180111150029.7237-1-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] webkitgtk: update to 2.18.5 (includes Spectre mitigations; see commit description)
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
X-List-Received-Date: Thu, 11 Jan 2018 15:02:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/11/2018 05:00 PM, Alexander Kanavin wrote:
> This is the only available stable version with mitigation fixes for Spectre.
> Webkit upstream developers do not port CVE fixes to earlier stable series,
> no exception was made in this case.

I will now establish whether it's feasible to update currently supported 
YP releases (rocko, pyro, morty) to this version.

Normally we don't do it (even though that leaves dozens of webkit CVEs 
unfixed), but this is special.

Alex

