Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 56C6F7F9A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 23:48:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2019 15:48:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; d="scan'208";a="209301253"
Received: from aaronsan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.186])
	by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2019 15:48:12 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
	<20191205154357.121346-15-alex.kanavin@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <5ba2ff8d-0d22-67f4-38bb-e000ea505ead@intel.com>
Date: Thu, 5 Dec 2019 23:48:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205154357.121346-15-alex.kanavin@gmail.com>
Subject: Re: [PATCH 15/24] sysklogd: update to 2.0.3
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
X-List-Received-Date: Thu, 05 Dec 2019 23:48:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/12/2019 15:43, Alexander Kanavin wrote:
> Drop all patches as they are no longer necessary with autotools,
> fix problems that are addressed upstream, or (in case of no-vectorization.patch)
> don't apply to the old version either, which means no one is using that hw target
> anymore.
> 
> Remove custom systemd configs (provided by upstream), and custom
> syslog config (also provided by upstream but not installed by default).

Sorry, but:

ERROR: sysklogd-2.0.3-r0 do_package: SYSTEMD_SERVICE_sysklogd value 
syslogd.service does not exist

Ross


