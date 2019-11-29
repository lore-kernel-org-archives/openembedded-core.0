Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 73E467FCE8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 22:55:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2019 14:55:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,259,1571727600"; d="scan'208";a="221720253"
Received: from xsanroma-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.34.24])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2019 14:55:24 -0800
From: Ross Burton <ross.burton@intel.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-15-alex.kanavin@gmail.com>
	<54364ceb-4a85-8912-134b-8880eecccabb@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <ce46910c-b481-f7a8-9f41-b8a4a745644f@intel.com>
Date: Fri, 29 Nov 2019 22:55:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <54364ceb-4a85-8912-134b-8880eecccabb@intel.com>
Subject: Re: [PATCH 15/15] python3: update to 3.8.0
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
X-List-Received-Date: Fri, 29 Nov 2019 22:55:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 29/11/2019 22:54, Ross Burton wrote:
> Not sure what is going on but with this when btrfs-tools is rebuild:
> 
> packages/corei7-64-poky-linux/btrfs-tools/btrfs-tools: FILELIST: 
> directory renamed 
> /usr/lib/python3.7/site-packages/btrfsutil-1.1.1-py3.7.egg-info -> 
> /usr/lib/python3.8/site-packages/btrfsutil-1.1.1-py3.8.egg-info, removed 
> "/usr/lib/python3.7/site-packages/btrfsutil.cpython-37m-x86_64-linux-gnu.so", 
> added 
> "/usr/lib/python3.8/site-packages/btrfsutil.cpython-38-x86_64-linux-gnu.so"
> 
> Basically, all the 3.7 references are now 3.8.  That's fine.
> 
> packages/corei7-64-poky-linux/btrfs-tools/btrfs-tools: RDEPENDS: removed 
> "libpython3 (['>= 3.7.5'])"
> 
> Python 3.7 is removed but no Python 3.8 added. Weird!

Same happened to gpgme:

packages/corei7-64-poky-linux/gpgme/python3-gpg: RDEPENDS: removed 
"libpython3 (['>= 3.7.5'])"

Ross

