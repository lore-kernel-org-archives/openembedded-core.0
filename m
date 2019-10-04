Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5333E7ED41
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 15:47:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2019 08:47:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="276092317"
Received: from karthik-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.38.183])
	by orsmga001.jf.intel.com with ESMTP; 04 Oct 2019 08:47:39 -0700
To: openembedded-core@lists.openembedded.org
References: <20191002182824.38571-1-Trevor.Gamblin@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <e8e82f8c-b0a1-f662-0c4f-a93840e638c0@intel.com>
Date: Fri, 4 Oct 2019 16:47:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002182824.38571-1-Trevor.Gamblin@windriver.com>
Subject: Re: [PATCH] watchdog: fix service PIDFile in do_install_append
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
X-List-Received-Date: Fri, 04 Oct 2019 15:47:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 02/10/2019 19:28, Trevor Gamblin wrote:
> +    # watchdog is of type "forking", so fix PIDFile to avoid warnings from
> +    # systemd
> +    sed -i 's@/var/run@/run@g' ${D}${systemd_system_unitdir}/watchdog.service

I dislike seds in the recipe because it's impossible to tell if they 
stop working or are not needed anymore.   A patch (sent upstream) would 
be preferable.

Ross

