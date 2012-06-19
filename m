Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sh2Vu-0005BA-B5
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 19:46:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Jun 2012 10:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155565834"
Received: from unknown (HELO helios.localnet) ([10.252.120.169])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 10:36:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 19 Jun 2012 18:36:02 +0100
Message-ID: <1911542.yM0phlYVn0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1206191102130.565@oneiric>
References: <alpine.DEB.2.02.1206191102130.565@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: getting rid of SRC_URI_append uses with "+="
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
X-List-Received-Date: Tue, 19 Jun 2012 17:46:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 19 June 2012 11:04:06 Robert P. J. Day wrote:
>   a while back, i pointed out odd instances of:
> 
> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append +=
> "file://use-includedir.patch \
> meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemumips += "
> file://32bitBE-support.patch"
> meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemuppc += "
> file://32bitBE-support.patch"
> meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky += "
> file://owl-menu.patch;apply=yes "
> 
> that is, the apparent redundancy of using "+=" with SRC_URI_append.
> anyone want to clean those up, just for the sake of clarity?

Sounds good to me, would you mind sending a patch to do this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


