Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPGSL-0002Gf-89
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 20:06:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Apr 2013 10:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="314866042"
Received: from unknown (HELO helios.localnet) ([10.255.13.125])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2013 10:48:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 08 Apr 2013 18:48:50 +0100
Message-ID: <3664366.6RB48HkoAG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-26-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAHUNapRCw6pqVL1MfSkPqDZQL-adp-AHQba8+nGTPoi44BTguQ@mail.gmail.com>
References: <cover.1365179842.git.pkj@axis.com>
	<a20f68229f1499d9020bd9cd8dc593e5f6635967.1365179842.git.pkj@axis.com>
	<CAHUNapRCw6pqVL1MfSkPqDZQL-adp-AHQba8+nGTPoi44BTguQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] oe-buildenv-internal: Only add to $PATH if needed
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
X-List-Received-Date: Mon, 08 Apr 2013 18:06:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 08 April 2013 13:31:50 Trevor Woerner wrote:
> On Fri, Apr 5, 2013 at 12:59 PM, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> > +[ "${PATH#$NEWPATHS}" != "$PATH" ] || PATH="$NEWPATHS$PATH"
> 
> This is certainly a welcome addition in functionality, but it relies
> on the pattern remaining at the start of the PATH (i.e. the user
> hasn't played with PATH in any way). Could we not use the
> ${parameter/pattern/string} parameter expansion instead (e.g.
> "${PATH/$NEWPATHS/}") so it doesn't matter whether the user has
> further modified the PATH?

Unfortunately I think this is specific to bash, so it may not be portable. 
Maybe the equivalent can be achieved with sed however.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


