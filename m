Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1CD65E4D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Apr 2014 09:49:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Apr 2014 02:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,871,1389772800"; d="scan'208";a="514080674"
Received: from dmilliga-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.64])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2014 02:49:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Crowe <mac@mcrowe.com>
Date: Wed, 16 Apr 2014 10:49:48 +0100
Message-ID: <33281528.ls5nyFEmlx@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <1397640696-21281-1-git-send-email-mac@mcrowe.com>
References: <1397640696-21281-1-git-send-email-mac@mcrowe.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] native.bbclass: Override TARGET_ flags too
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
X-List-Received-Date: Wed, 16 Apr 2014 09:49:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 16 April 2014 10:31:36 Mike Crowe wrote:
> TARGET_LDFLAGS is currently defined in bitbake.conf to contain
> ${TARGET_LINK_HASH_STYLE} which differs between MIPS and other
> targets. Since TARGET_LDFLAGS is an exported variable it affects the hash
> of every shell task even if it is not used.
> 
> We don't want native recipe tasks to have different hashes purely because
> they happen to have been built in order to satisfy dependencies for
> different MACHINEs since this causes lots of churn in the native sysroot
> when switching between MACHINEs.
> 
> Making native.bbclass override TARGET_LDFLAGS to use BUILD_LDFLAGS ensures
> consistent hashes and is a sensible thing to be doing anyway.

Just to be clear, for a native recipe how is TARGET_LDFLAGS entering the 
signatures? AIUI there ought to be indirection such that LDFLAGS is used and 
that is set from BUILD_LDFLAGS for a native recipe rather than TARGET_LDFLAGS.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

