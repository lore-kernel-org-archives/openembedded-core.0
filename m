Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2653E61F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:36:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2013 02:36:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,734,1363158000"; d="scan'208";a="342751227"
Received: from unknown (HELO helios.localnet) ([10.255.12.195])
	by fmsmga002.fm.intel.com with ESMTP; 24 May 2013 02:36:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 May 2013 10:36:22 +0100
Message-ID: <2891613.OHSbzUYamb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAJTo0La4fnedhZLWVTGruWSbP_MhOLa5WFW1_6-0KJrCMp_4_Q@mail.gmail.com>
References: <cover.1369386157.git.ionutx.radu@intel.com>
	<f0b5620742216d1c7edaf721b5be599fb8c1a044.1369386157.git.ionutx.radu@intel.com>
	<CAJTo0La4fnedhZLWVTGruWSbP_MhOLa5WFW1_6-0KJrCMp_4_Q@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] libsoup-2.4: Update from 2.42.1 to 2.43.1
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
X-List-Received-Date: Fri, 24 May 2013 09:36:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 24 May 2013 10:30:00 Burton, Ross wrote:
> NACK.  libsoup is GNOMEy, so odd minor versions indicate development
> releases.  Stick with 2.42.x until 2.44.x appears.

Could we just add some logic to distrodata.bbclass so that we don't get 
reports of needing to upgrade to these unstable releases?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

