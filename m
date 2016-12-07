Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2D46871A92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 17:05:23 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 07 Dec 2016 09:05:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39872277"
Received: from unknown (HELO [10.219.5.165]) ([10.219.5.165])
	by orsmga005.jf.intel.com with ESMTP; 07 Dec 2016 09:05:24 -0800
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1481129438-28306-1-git-send-email-ross.burton@intel.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <f224566f-576b-acad-e23b-ee401d9dc2ac@linux.intel.com>
Date: Wed, 7 Dec 2016 11:05:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.0
MIME-Version: 1.0
In-Reply-To: <1481129438-28306-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH 1/3] cve-check: allow recipes to override the product name
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
X-List-Received-Date: Wed, 07 Dec 2016 17:05:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 07/12/16 10:50, Ross Burton wrote:
> Add a new variable CVE_PRODUCT for the product name to look up in the NVD
> database.  Default this to BPN, but allow recipes such as tiff (which is libtiff
> in NVD) to override it.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
I like the idea to be able to override the name that cve-check-tool
checks. The only drawback would be the burden of adding these to needed
recipes. This is still better to have to guess the correct name, or to
check PROVIDES or RPROVIDES, there are just too much corner cases. So
this solution has my approval.

