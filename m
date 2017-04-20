Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 38A097311B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 12:37:39 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Apr 2017 05:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,225,1488873600"; d="scan'208";a="90158046"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 20 Apr 2017 05:37:39 -0700
To: David Vincent <freesilicon@gmail.com>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<6366113.GnGklEYiun@crde-port-20.cahors.local>
	<64f205a9-74d2-1161-14f1-5ed03298f350@linux.intel.com>
	<5023360.N8L8OyXh3V@crde-port-20.cahors.local>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d67f6cb5-482e-9e3f-bde5-4284e8eeb31b@linux.intel.com>
Date: Thu, 20 Apr 2017 15:37:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <5023360.N8L8OyXh3V@crde-port-20.cahors.local>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 20 Apr 2017 12:37:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/19/2017 04:03 PM, David Vincent wrote:
> The problem is that I must be able to manage the configuration of a machine
> without physical intervention and only via package upgrades. A new
> configuration can be applied simply by incrementing the PR of a configuration
> package.
>
> But maybe this is a use case only needed by me and I should manage it in my
> own specific layer ?
>
> Now that I think of it, I have the same kind of problem for all machine
> specific configurations. For now, I just replace the PACKAGE_ARCH in my BSP
> layer with a machine specific one to indicate that a package contains a
> configuration valid only for a specific machine. Maybe, in a future release, it
> should be desirable to create -conf packages based on the CONFFILES variable ?
> I don't know if it's a good idea, but maybe I could bring that up on the
> architecture mailing list ?

By all means please do so. Yocto lacks a solution for configuration 
management, and this was discussed some time ago, although I cannot 
anymore find where it happened. Mark, do you remember?


Alex


