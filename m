Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SYyu7-0005yP-LY
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 14:18:31 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 May 2012 05:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105034860"
Received: from unknown (HELO helios.localnet) ([10.252.120.22])
	by AZSMGA002.ch.intel.com with ESMTP; 28 May 2012 05:07:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Radu Moisan <radu.moisan@intel.com>
Date: Mon, 28 May 2012 13:07:54 +0100
Message-ID: <3631583.djcpO0BeBb@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4FC35FBA.2060200@gherzan.ro>
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>
	<4FC35FAD.7090505@intel.com> <4FC35FBA.2060200@gherzan.ro>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Mon, 28 May 2012 12:18:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 28 May 2012 14:21:30 Andrei Gherzan wrote:
> On 05/28/2012 02:21 PM, Radu Moisan wrote:
> > I suppose, then, I should add another recipe and support both.
> > However, can someone point out how can I make one of them default.
> 
> DEFAULT_PREFERENCE

i.e. set DEFAULT_PREFERENCE = "-1" in the newer recipe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


