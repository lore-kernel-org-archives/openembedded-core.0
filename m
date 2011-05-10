Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QJs9w-0000LN-Ln for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 20:59:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AIv7JH009572
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 19:57:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09335-04 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 19:57:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AIuu15009566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 19:57:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=46eCWm2KQVHgr-z_Kdo7iChPuyQ@mail.gmail.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<491cfc546a2843493cf466c1e1af11ec8ac2dcee.1305004776.git.sgw@linux.intel.com>
	<1305017649.30391.255.camel@rex>
	<BANLkTi=46eCWm2KQVHgr-z_Kdo7iChPuyQ@mail.gmail.com>
Date: Tue, 10 May 2011 19:56:51 +0100
Message-ID: <1305053812.30391.280.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 03/30] conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
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
X-List-Received-Date: Tue, 10 May 2011 18:59:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 10:56 -0700, Chris Larson wrote:
> On Tue, May 10, 2011 at 1:54 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Er, how about we actually fix metadata_scm.bbclass instead of making the
> > world more complicated and fragile? :)
> >
> > I suspect metadata_scm could use the COREBASE variable and be much nicer
> > code...
> 
> I'd really like to see it gather information about the current state
> of all layers which are scm working copies and summarize this in the
> build summary, rather than grabbing one specific bit of information,
> personally.

I'd also agree with this and have said as much somewhere (layer tooling
discussions?) but I'll take the COREBASE change short term.

Cheers,

Richard



