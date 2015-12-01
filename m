Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE9560761
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 19:36:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 01 Dec 2015 11:36:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,370,1444719600"; d="scan'208";a="610822920"
Received: from hlim3-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.190])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2015 11:36:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Dec 2015 08:36:52 +1300
Message-ID: <1508005.USn0Oqapz6@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <3117759.OV2fKNkn7Z@peggleto-mobl.ger.corp.intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
	<3117759.OV2fKNkn7Z@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: alexander.kanevskiy@intel.com
Subject: Re: [PATCH 0/4] extend buildhistory
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
X-List-Received-Date: Tue, 01 Dec 2015 19:36:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 27 Nov 2015 13:34:27 Paul Eggleton wrote:
> One aspect that will probably change in the future is how it picks up the
> kernel configuration - for
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5574 (which I hope to get
> to for 2.1, but no promises) we will need to write the kernel configuration
> to the sysroot so that we have somewhere we can look for it; if that's the
> case there'll be no need to copy it specially in
> buildhistory-extra.bbclass.

Hmm, I really should have checked kernel.bbclass before saying anything - it 
is already copying the kernel config to ${STAGING_KERNEL_BUILDDIR}/.config, so 
provided you look there at the right time (i.e. after do_shared_workdir of the 
kernel has executed) it should be possible to optimise how that's dealt with 
right now.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

