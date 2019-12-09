Return-Path: <ross.burton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB807FCAB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 13:16:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2019 05:16:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="237747090"
Received: from pozo-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.212])
	by fmsmga004.fm.intel.com with ESMTP; 09 Dec 2019 05:16:52 -0800
To: openembedded-core@lists.openembedded.org
References: <20191207072208.2773273-1-raj.khem@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <1376b3f4-9ed1-5b97-4afd-afde1e4c4a13@intel.com>
Date: Mon, 9 Dec 2019 13:16:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191207072208.2773273-1-raj.khem@gmail.com>
Subject: Re: [PATCH] kbd: avoid vlock conflict with busybox
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
X-List-Received-Date: Mon, 09 Dec 2019 13:16:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 07/12/2019 07:22, Khem Raj wrote:
> busybox as well as vlock utility from meta-oe provides vlock utility
> which can conflict when with kbd if pam is a enabled distro_feature
> 
> Fixes image build errors
> 
> update-alternatives: Error: not linking <rootfs>/usr/bin/vlock to /bin/busybox.suid since <rootfs>/usr/bin/vlock exists and is not a link

WARNING: kbd-2.2.0-r0 do_package: kbd: alternative target 
(/usr/bin/vlock or /usr/bin/vlock.kbd) does not exist, skipping...

vlock doesn't exist is PAM isn't enabled.

Ross

