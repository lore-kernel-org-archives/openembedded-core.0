Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4117716C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 12:42:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2016 05:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,489,1464678000"; d="scan'208";a="1010432785"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2016 05:42:40 -0700
To: openembedded-core@lists.openembedded.org
References: <1468710255-5030-1-git-send-email-akuster808@gmail.com>
	<1468710255-5030-3-git-send-email-akuster808@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f399842d-e37d-35ff-e8bc-bfac3f37f47c@linux.intel.com>
Date: Mon, 8 Aug 2016 15:41:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1468710255-5030-3-git-send-email-akuster808@gmail.com>
Subject: Re: [master][PATCH] 3/5] bzip2: Security fix CVE-2016-3189
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
X-List-Received-Date: Mon, 08 Aug 2016 12:42:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2016 02:04 AM, Armin Kuster wrote:
> +Upstream-Status: Backport
> +https://bugzilla.suse.com/attachment.cgi?id=681334
> +
> +CVE: CVE-2016-3189

Backport means the patch is taken from upstream development repository, 
and it's also good to provide a link to where it is in the upstream.

This looks like a distro vendor fix, so the upstream-status should be 
either pending or inappropriate (depending on the upstream development 
situation).


Alex

