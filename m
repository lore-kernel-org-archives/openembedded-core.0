Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1ROJB2-00085g-V3
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 02:11:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Nov 2011 17:05:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="73153438"
Received: from unknown (HELO [10.255.15.253]) ([10.255.15.253])
	by orsmga001.jf.intel.com with ESMTP; 09 Nov 2011 17:05:19 -0800
From: Tom Zanussi <tom.zanussi@intel.com>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6DFA3CBDD9E@shsmsx502.ccr.corp.intel.com>
References: <cover.1320780004.git.sgw@linux.intel.com>
	<9f8d5c15eb59611c86dee83180642f29dcc7a361.1320780004.git.sgw@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6DF1AE8C698@shsmsx502.ccr.corp.intel.com>
	<1320846145.16608.0.camel@elmorro>
	<1865303E0DED764181A9D882DEF65FB6DFA3CBDD9E@shsmsx502.ccr.corp.intel.com>
Date: Wed, 09 Nov 2011 19:06:31 -0600
Message-ID: <1320887191.16608.116.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 17/17] python: skip setup.py 'import	check' when cross-compiling
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
X-List-Received-Date: Thu, 10 Nov 2011 01:11:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-09 at 16:57 -0800, Cui, Dexuan wrote:
> Zanussi, Tom wrote on 2011-11-09:
> > On Wed, 2011-11-09 at 02:34 -0800, Cui, Dexuan wrote:
> >> How I wish I could notice the patch this morning so I could save 1 day!
> >> 
> > 
> > ??? Can you please explain what you mean?
> I meant I spent 1 day on debugging the same issue and got the cause but wasn't sure how the patch should be made, so I wanted to ask for suggestion in the ML and before that I tried to find out if anybody reported the same issue and I saw your patch that was sent 1.5 days ago... :-)
> 

Yeah, sure - I'm just kind of curious since I'd never seen it before
until I added the avx instruction support.

Just out of curiosity, what were your host and target arches?

Tom 

> >> Anyway, thanks TomZ for the patch!  :-)
> >> 
> > 
> > You're welcome, I guess!
> > 
> > Tom
> > 
> 
> Thanks,
> -- Dexuan
> 
> 




