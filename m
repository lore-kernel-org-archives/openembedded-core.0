Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 895F87F34A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 09:35:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Sep 2019 02:35:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,462,1559545200"; d="scan'208";a="266236192"
Received: from oakcakay-mobl2.ger.corp.intel.com (HELO blackadder.local)
	([10.252.38.52])
	by orsmga001.jf.intel.com with ESMTP; 03 Sep 2019 02:35:47 -0700
To: openembedded-core@lists.openembedded.org
References: <1567157636-12184-1-git-send-email-yi.zhao@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <482097ab-41e7-60a9-92a8-082b6c34d8a6@intel.com>
Date: Tue, 3 Sep 2019 10:35:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567157636-12184-1-git-send-email-yi.zhao@windriver.com>
Subject: Re: [PATCH] nfs-utils: fix nfsidmap compile error with gcc9 when enable PACKAGECONFIG[nfsv4]
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
X-List-Received-Date: Tue, 03 Sep 2019 09:35:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 30/08/2019 10:33, Yi Zhao wrote:
> Fixes:
> nfsidmap.c:404:4: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
>    404 |    xlog_warn(usage, progname);
>        |    ^~~~~~~~~

These options are not enabled by default, presumably this is a Wind 
River tweak?

> +Upstream-Status: Pending

Upstream isn't dead so please try to push these upstream.

> -FILES_${PN} += "${systemd_unitdir}"
> +FILES_${PN} += "${systemd_unitdir} ${libdir}/libnfsidmap/"

This isn't related to the commit message.

Ross

