Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4221177C05
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490866101; x=1522402101;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=lFTMWcwioGpxwDbzoZZB7dj7A1OPj+ScHvK28QTcruQ=;
	b=r+EiL9hioat7g0oFbbMpSGk8pWTupR3IDmZgf6L+zOhlC2Rwf5nuPVeB
	QVKHfihQwrHRb5rUkL27WeE1i9HXrA==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 02:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,246,1486454400"; d="scan'208";a="241970248"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2017 02:28:19 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1490717618.git.chris_larson@mentor.com>
	<f619859747304e1ed4ba32488ea416419ede955d.1490717618.git.chris_larson@mentor.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0eb4c04d-22f0-827a-d41c-ac704fd99eea@linux.intel.com>
Date: Thu, 30 Mar 2017 12:27:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f619859747304e1ed4ba32488ea416419ede955d.1490717618.git.chris_larson@mentor.com>
Subject: Re: [PATCH 1/3] update_gio_module_cache: fix host user contamination
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
X-List-Received-Date: Thu, 30 Mar 2017 09:28:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2017 07:14 PM, Christopher Larson wrote:
> update_gio_module_cache intercept creates file:
> $D${libdir}/gio/modules/giomodule.cache
>
> Change ownership of this file to root:root to avoid user contamination
> by host.

I don't understand how one is related to another, can you explain 
please? What is happening, and why chown is fixing the problem?


Alex


