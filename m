Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C003171E39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 12:56:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2017 04:56:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="933278739"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 13 Feb 2017 04:56:28 -0800
To: openembedded-core@lists.openembedded.org
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
	<1486734151-28331-10-git-send-email-amarnath.valluri@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bc30bb7d-3489-7f90-b75c-e1cd7b8d4247@linux.intel.com>
Date: Mon, 13 Feb 2017 14:57:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486734151-28331-10-git-send-email-amarnath.valluri@intel.com>
Subject: Re: [PATCH 09/23] package_deb.bbclass: Ignore file paths in RPROVIDES
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
X-List-Received-Date: Mon, 13 Feb 2017 12:56:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2017 03:42 PM, Amarnath Valluri wrote:
> Unlike rpm, debian packaging does not allow file paths in 'Provides:' field.
> When 'usrmerge' distro feature enabled bash/busybox packages adds '/bin/sh' to
> it's RPROVIDES to satisfy build dependencies, this entry should be filtered out.

Thanks for this patch, it's also necessary in the when using dnf :) I 
cherry-picked it to my branch.

Alex


