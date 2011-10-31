Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RKnxK-0005Ff-3t
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 10:14:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 31 Oct 2011 02:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,429,1315206000"; d="scan'208";a="31677294"
Received: from unknown (HELO helios.localnet) ([10.252.121.56])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Oct 2011 02:08:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <saul.wold@intel.com>
Date: Mon, 31 Oct 2011 09:08:45 +0000
User-Agent: KMail/1.13.6 (Linux/2.6.38-11-generic-pae; KDE/4.6.5; i686; ; )
References: <cover.1319576293.git.scott.a.garman@intel.com>
	<62b3eae763911554ab01754726ed7adacad1a8a4.1319576293.git.scott.a.garman@intel.com>
	<4EA86F93.4080407@intel.com>
In-Reply-To: <4EA86F93.4080407@intel.com>
MIME-Version: 1.0
Message-Id: <201110310908.45138.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] distro_tracking_fields: updates for sudo, mtools, grep, and openssh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Oct 2011 09:14:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 26 October 2011 21:37:39 Saul Wold wrote:
> > -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo = "1 month"
> > -RECIPE_LATEST_RELEASE_DATE_pn-sudo = "2011/05/16"
> > +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo = "2 months"
> > +RECIPE_LATEST_RELEASE_DATE_pn-sudo = "2011/10/21"
> 
> These date formats should be MMM DD, YYYY also, for all the data listed
> below also.

I'd been meaning to ask this before - is there a good reason for not being 
consistent and using the same format for all date fields in this file?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


