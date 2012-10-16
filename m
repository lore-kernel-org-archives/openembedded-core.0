Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TOGlg-0004Qi-TV
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 01:41:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Oct 2012 16:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,595,1344236400"; d="scan'208";a="205315566"
Received: from unknown (HELO helios.localnet) ([10.252.122.73])
	by azsmga001.ch.intel.com with ESMTP; 16 Oct 2012 16:28:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 00:28:11 +0100
Message-ID: <71077863.US7FUzvX2E@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121016223739.GB3405@jama.jama.net>
References: <1350424046-18863-1-git-send-email-ferlandm@sonatest.com>
	<1350424046-18863-2-git-send-email-ferlandm@sonatest.com>
	<20121016223739.GB3405@jama.jama.net>
MIME-Version: 1.0
Subject: Re: [PATCH] lmsensors: Initial commit.
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
X-List-Received-Date: Tue, 16 Oct 2012 23:41:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 17 October 2012 00:37:39 Martin Jansa wrote:
> On Tue, Oct 16, 2012 at 05:47:26PM -0400, Marc Ferland wrote:
> > Adds the lm_sensors applications. These consists of:
> Is it really needed in oe-core? why not meta-oe?

I'm thinking meta-oe is the place for this. As a bonus, rrdtool is already 
there.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


