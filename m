Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U2mN0-0006hx-UF
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:31:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Feb 2013 09:15:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="252920603"
Received: from unknown (HELO helios.localnet) ([10.252.120.64])
	by azsmga001.ch.intel.com with ESMTP; 05 Feb 2013 09:15:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 05 Feb 2013 17:15:38 +0000
Message-ID: <2054431.1HJ6UVJJBH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.4 (Linux/3.5.0-23-generic; KDE/4.9.4; i686; ; )
In-Reply-To: <1c9151ca6d6addce9cc0e97a81c517e6422a6ea3.1360084153.git.paul.eggleton@linux.intel.com>
References: <cover.1360084153.git.paul.eggleton@linux.intel.com>
	<1c9151ca6d6addce9cc0e97a81c517e6422a6ea3.1360084153.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] qmmp: update to 0.6.6 and fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 17:31:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 05 February 2013 17:09:58 Paul Eggleton wrote:
> * Update to 0.6.6
> * Fix compilation failure due to call to QApplication::commitData()
> * Disable /usr/local host paths to avoid compilation warnings
> * Force use of the cmake configure instead of qmake as the latter is not
>   dynamic with Qmmp and doesn't let you disable certain dependencies
>   (e.g. enca)
> * Add libsndfile1 and libsamplerate0 to DEPENDS since their use will be
>   non-deterministic otherwise
> * Explicitly disable library-requiring options that we don't have
>   available in OE-Core so that they don't get used if they happen to be
>   in the sysroot
> * Update LIC_FILES_CHKSUM since there were cosmetic changes to the
>   license file (mostly reformatting and change of references to LGPL
>   from "Library" to "Lesser".)
> 
> Fixes [YOCTO #3882].

Actually it's bug #3822. I've fixed the commit message on the branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


