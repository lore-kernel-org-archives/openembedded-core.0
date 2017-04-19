Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7CF71AEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 11:57:55 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2017 04:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,221,1488873600"; d="scan'208";a="89691188"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 19 Apr 2017 04:57:56 -0700
To: David Vincent <freesilicon@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<2335903.2zueHJxyF0@crde-port-20.cahors.local>
	<41b8c861-c67c-7ed8-b13d-a54f8c5c232f@linux.intel.com>
	<6366113.GnGklEYiun@crde-port-20.cahors.local>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <64f205a9-74d2-1161-14f1-5ed03298f350@linux.intel.com>
Date: Wed, 19 Apr 2017 14:57:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <6366113.GnGklEYiun@crde-port-20.cahors.local>
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
X-List-Received-Date: Wed, 19 Apr 2017 11:57:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/19/2017 02:53 PM, David Vincent wrote:

>> This kind of thing is better done via ROOTFS_POSTPROCESS_COMMAND, I
>> think. Look for examples in rootfs-postcommands.bbclass.
>
> The problem of ROOTFS_POSTPROCESS_COMMAND is that it is a one shot function
> that is run at image creation. In my case, I must be able to upgrade the
> package over time via package management tools. Sorry for not bringing that up
> before.

What is it in the openssl config file that must be managed via package 
updates?

Alex


