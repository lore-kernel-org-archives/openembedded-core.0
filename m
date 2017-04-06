Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0207477CFC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 20:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491511112; x=1523047112;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=xKT5iIKvqo/onC7MDZyahNPfisEbH0NuiJsyFoTUShw=;
	b=EaVwhU78o6FUYsKeaNF9f6t7y5vWcILgtoMpSMWIVpNVHk5egP1mLAGS
	jmT8YrFhZhqbtna5YYNdxGNyoiuxRA==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 13:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,161,1488873600"; d="scan'208";a="85547292"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.179])
	by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2017 13:38:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>, anibal.limon@linux.intel.com
Date: Fri, 07 Apr 2017 08:38:27 +1200
Message-ID: <5236508.TZczFS0D24@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <ddd6caf52e347f925286bfe9e37b894996037679.1491399200.git-series.patrick.ohly@intel.com>
References: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
	<ddd6caf52e347f925286bfe9e37b894996037679.1491399200.git-series.patrick.ohly@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] yocto-compat-layer: limit report of signature changes
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
X-List-Received-Date: Thu, 06 Apr 2017 20:38:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 6 April 2017 1:36:05 AM NZST you wrote:
>    AssertionError: False is not true : Layer meta-xxxx changed 120
> signatures, initial differences (first hash without, second with layer):

BTW, rather than self.assertTrue(False, ... ) you can just use self.fail(...) 
and then you avoid this ugly "False is not True" bit.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

