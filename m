Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A61E571A1A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 14:38:23 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 02 Oct 2017 07:38:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,469,1500966000"; d="scan'208";a="158394556"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 02 Oct 2017 07:38:23 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20171002141814.29709-1-otavio@ossystems.com.br>
	<28ebae92-b3c1-7664-87f7-4c326711e647@linux.intel.com>
	<CAP9ODKpr_ypij4Z919kVkQkJgWcr_VaS7AzP=0Wi7oumP3k8oA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0a24cf32-b806-c63d-095e-75b14111065c@linux.intel.com>
Date: Mon, 2 Oct 2017 17:34:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpr_ypij4Z919kVkQkJgWcr_VaS7AzP=0Wi7oumP3k8oA@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 14:38:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/02/2017 05:34 PM, Otavio Salvador wrote:

> It does not work as you are explaining. Without this patch I /need/ to use:
> 
> dnf install --nogpgcheck nano
> 
> to install nano. dnf has it enabled.
> 
> root@qemux86-64:~# grep gpg /etc/dnf/dnf.conf
> gpgcheck=1


Yes; your patch is solving this problem incorrectly, introducing a new, 
different problem. The new problem is:

- enable package signing, disable package feed signing, check that the 
resulting dnf.conf file has package verification enabled (it won't).

Alex

