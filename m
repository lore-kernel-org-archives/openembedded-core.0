Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E14DE60034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 09:48:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Mar 2015 02:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,421,1422950400"; d="scan'208";a="681786333"
Received: from mferguso-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.10.180])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2015 02:48:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <qi.chen@windriver.com>
Date: Wed, 18 Mar 2015 09:48:02 +0000
Message-ID: <5575166.bgVZKFq0RH@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <003afa4a3acb0670e6e3b9d3e12e9b276f03876c.1426670089.git.Qi.Chen@windriver.com>
References: <cover.1426670089.git.Qi.Chen@windriver.com>
	<003afa4a3acb0670e6e3b9d3e12e9b276f03876c.1426670089.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] rootfs.py: two changes regarding log checking
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
X-List-Received-Date: Wed, 18 Mar 2015 09:48:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 18 March 2015 17:16:10 Chen Qi wrote:
> 1. Extend the regular expression to also catch '^WRARNING:' in
> _log_check_warn. Warnings from bb.note or bbnote begin with 'WARNING:'. So
> if we decide to catch warnings at rootfs time, we should not ignore those
> produced by the build system itself.

FYI, I still have an unfinished patchset to ensure bbwarn calls from shell 
functions get piped through to BitBake's event system, with the result that 
such warnings actually get logged and displayed by the BitBake UI. (That 
doesn't mean this patch shouldn't go in in the mean time, though.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

