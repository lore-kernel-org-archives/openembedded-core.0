Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 178E37C131
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 16:15:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 09:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; d="scan'208";a="200959550"
Received: from creinhar-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.39.119])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2019 09:15:45 -0700
To: openembedded-core@lists.openembedded.org
References: <20190924140118.6651-1-Trevor.Gamblin@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <0807ede6-ed1e-2068-6004-22fd947a51ef@intel.com>
Date: Tue, 24 Sep 2019 17:15:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190924140118.6651-1-Trevor.Gamblin@windriver.com>
Subject: Re: [PATCH] nativesdk-dnf: ensure installed systemd files are shipped
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
X-List-Received-Date: Tue, 24 Sep 2019 16:15:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 24/09/2019 15:01, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
> 
> "bitbake nativesdk-dnf" throws a QA warning if the contents of
> ${base_libdir}/systemd/system/ are not shipped, so add them.

Looks like a bug in systemd.bbclass, not this recipe.  For example if I 
enable nativesdk for acpid:

ERROR: nativesdk-acpid-2.0.32-r0 do_package: QA Issue: nativesdk-acpid: 
Files/directories were installed but not shipped in any package:
   /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux/lib
   /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux/lib/systemd
   /opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux/lib/systemd/system
 
/opt/poky/2.7+snapshot/sysroots/x86_64-pokysdk-linux/lib/systemd/system/acpid.service

Ross

