Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF317F899
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 23:20:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2020 15:20:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,388,1571727600"; d="scan'208";a="231942821"
Received: from hongy-mobl1.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.70])
	by orsmga002.jf.intel.com with ESMTP; 02 Jan 2020 15:20:00 -0800
To: Alex Kiernan <alex.kiernan@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191219221748.27079-1-alex.kiernan@gmail.com>
	<20191219221748.27079-2-alex.kiernan@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <902865ec-101f-0e0b-e17c-03c2fa555921@intel.com>
Date: Thu, 2 Jan 2020 23:20:00 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191219221748.27079-2-alex.kiernan@gmail.com>
Subject: Re: [PATCH 2/2] rootfs-postcommands: Enable rootfs_check_host_user_contaminated
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
X-List-Received-Date: Thu, 02 Jan 2020 23:20:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 19/12/2019 22:17, Alex Kiernan wrote:
> Enable rootfs_check_host_user_contaminated by default

Useful check!

WARNING: Paths in the rootfs are owned by the same user or group as the 
user running bitbake. See the logfile for the specific paths.
 
/data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/.uuid
 
/data/poky-tmp/master/work/intel_corei7_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/fonts/ttf/.uuid

(patch incoming)

Ross

