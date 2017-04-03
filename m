Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD7671D79
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 09:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491210734; x=1522746734;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=NPE2hggqfY0hOUECnDMoBMlIVQVjrXiUisn/yPqR2eg=;
	b=S+khQyMZbhvqaLSPbuqqXn9aYu3n4D2m3qnBcXIdkQBEf4UmaTIM5LDR
	dNapt3RSC3nVXctG5/zQp22PLW1yyQ==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2017 02:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,269,1486454400"; d="scan'208";a="83589955"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2017 02:12:12 -0700
To: openembedded-core@lists.openembedded.org
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
	<1491187907-5752-8-git-send-email-yin.thong.choong@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <29289a1d-6d5d-7dad-a8eb-56c4349813e1@linux.intel.com>
Date: Mon, 3 Apr 2017 12:11:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491187907-5752-8-git-send-email-yin.thong.choong@intel.com>
Subject: Re: [PATCH 7/8] chkconfig: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Mon, 03 Apr 2017 09:12:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2017 05:51 AM, yin.thong.choong@intel.com wrote:

> -SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2 \
> +SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BPN}-${PV}.tar.bz2 \

Where does Fedora take this package from nowadays? Self-hosting these 
things is not a good idea.

Alex


