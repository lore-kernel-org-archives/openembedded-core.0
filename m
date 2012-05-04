Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SQDl4-00069I-PY
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 10:20:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 May 2012 01:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138800831"
Received: from unknown (HELO helios.localnet) ([10.252.120.49])
	by azsmga001.ch.intel.com with ESMTP; 04 May 2012 01:11:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 04 May 2012 09:11:09 +0100
Message-ID: <1367450.rzi5djsU21@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-19-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAMKF1sr+uGUpy9hFcak_pY2QbX542XRRfiZAzwbOD_wGXuH6iw@mail.gmail.com>
References: <cover.1335991900.git.raj.khem@gmail.com>
	<CAMKF1so5LJRMx-fJPOasquEheq9Rk8PGPKFkbv4DSWZ=PJnLwQ@mail.gmail.com>
	<CAMKF1sr+uGUpy9hFcak_pY2QbX542XRRfiZAzwbOD_wGXuH6iw@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] Enable PARALLEL_MAKE for testing
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
X-List-Received-Date: Fri, 04 May 2012 08:20:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 03 May 2012 23:10:04 Khem Raj wrote:
> On Thu, May 3, 2012 at 10:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, May 2, 2012 at 9:53 PM, Yury Bushmelev <jay4mail@gmail.com> wrote:
> >> Please remove following recipes from this list:
> >> meta/recipes-core/eggdbus/eggdbus_0.6.bb
> >> .../net-tools/net-tools_1.60-23.bb
> >> 
> >> I've seen failures on them with -j64 iirc.
> > 
> > ok removed
> 
> I have updated kraj/misc-updates branch to reflect this change

Could you please also update the commit message? i.e. this is no longer "for 
testing"; details of how you tested it, etc.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


