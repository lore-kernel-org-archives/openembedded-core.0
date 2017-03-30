Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4098E77C14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:29:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 30 Mar 2017 02:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,246,1486454400"; d="scan'208";a="241970541"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2017 02:29:58 -0700
To: openembedded-core@lists.openembedded.org
References: <20170329231606.22118-1-pkj@axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cf44bdfa-67df-f382-f497-7362b9b584f3@linux.intel.com>
Date: Thu, 30 Mar 2017 12:29:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170329231606.22118-1-pkj@axis.com>
Subject: Re: [PATCH] update_gio_module_cache: Do not chown a non-existing file
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
X-List-Received-Date: Thu, 30 Mar 2017 09:29:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/30/2017 02:16 AM, Peter Kjellerstedt wrote:
> Only change the ownership of ${libdir}/gio/modules/giomodule.cache if
> it exists.

Why do we need to change the owndership in the first place?

Alex


