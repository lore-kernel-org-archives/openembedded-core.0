Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C39C571AD9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 12:56:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2017 05:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,221,1488873600"; d="scan'208";a="1158242842"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2017 05:56:24 -0700
To: David Vincent <freesilicon@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<2335903.2zueHJxyF0@crde-port-20.cahors.local>
	<41b8c861-c67c-7ed8-b13d-a54f8c5c232f@linux.intel.com>
	<6366113.GnGklEYiun@crde-port-20.cahors.local>
	<64f205a9-74d2-1161-14f1-5ed03298f350@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bc76e312-73dd-65bc-37f1-e529f8d311ad@linux.intel.com>
Date: Wed, 19 Apr 2017 15:56:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <64f205a9-74d2-1161-14f1-5ed03298f350@linux.intel.com>
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
X-List-Received-Date: Wed, 19 Apr 2017 12:56:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/19/2017 02:57 PM, Alexander Kanavin wrote:
> On 04/19/2017 02:53 PM, David Vincent wrote:
>
>>> This kind of thing is better done via ROOTFS_POSTPROCESS_COMMAND, I
>>> think. Look for examples in rootfs-postcommands.bbclass.
>>
>> The problem of ROOTFS_POSTPROCESS_COMMAND is that it is a one shot
>> function
>> that is run at image creation. In my case, I must be able to upgrade the
>> package over time via package management tools. Sorry for not bringing
>> that up
>> before.
>
> What is it in the openssl config file that must be managed via package
> updates?

I mean, if you need to perform a customization to openssl.cnf, why not 
patch it in the source tree via openssl.bbappend?


Alex


