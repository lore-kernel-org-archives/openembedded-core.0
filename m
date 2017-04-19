Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BD33171B48
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 10:21:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2017 03:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,220,1488873600"; d="scan'208";a="1121302749"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 19 Apr 2017 03:21:34 -0700
To: openembedded-core@lists.openembedded.org
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<CAHiDW_EQL63FQt7t8fETRZkx0sVjNs-as5Y+qexN48CtCUS5MQ@mail.gmail.com>
	<2335903.2zueHJxyF0@crde-port-20.cahors.local>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <41b8c861-c67c-7ed8-b13d-a54f8c5c232f@linux.intel.com>
Date: Wed, 19 Apr 2017 13:21:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <2335903.2zueHJxyF0@crde-port-20.cahors.local>
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Wed, 19 Apr 2017 10:21:38 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/19/2017 11:27 AM, David Vincent wrote:
> The package is then chosen during image creation based on some
> MACHINE_FEATURES, i.e. if the machine provides a crypto accelerator to use
> instead of relying on software implementations. I hope that these new details
> will help you understand what I was trying to achieve.

This kind of thing is better done via ROOTFS_POSTPROCESS_COMMAND, I 
think. Look for examples in rootfs-postcommands.bbclass.

Alex


