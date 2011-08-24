Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwJtq-0000hC-0W
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 22:18:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Aug 2011 13:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41856232"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2011 13:13:21 -0700
Message-ID: <4E555B61.7030803@linux.intel.com>
Date: Wed, 24 Aug 2011 13:13:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CABcZANn8NZYnA3dPzakgfMguaVV9EQ7isusAGMOQUQzHx_UV3w@mail.gmail.com>
In-Reply-To: <CABcZANn8NZYnA3dPzakgfMguaVV9EQ7isusAGMOQUQzHx_UV3w@mail.gmail.com>
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [ANNOUNCE] Devshell Usage Change
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
X-List-Received-Date: Wed, 24 Aug 2011 20:18:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2011 12:49 PM, Chris Larson wrote:
> Saul reminded me that I never sent a proper email to let people know about the
> usability change to devshell, so only those who reviewed the commits
> know about it.
>
> In the new implementation, a single OE_TERMINAL variable controls the behavior.
>
So your saying that the TERMCMD no longer works? We have to set both 
TERMCMD and OE_TERMINAL?

That does not makes sense, If I set TERMCMD to use screen then it should 
use screen, with out me having to also set OE_TERMINAL?

Or test TERMCMD go away at this point?

In either case, maybe we need to update the local.conf also.

Sau!


> When using 'auto', or requesting an unsupported terminal, we attempt to spawn
> them in priority order until we get one that's available on this system (and
> in the case of the X terminals, has DISPLAY defined).  The 'none' value is
> used when we're doing things like automated builds, and want to ensure that no
> terminal is *ever* spawned, under any circumstances.
>
> Current available terminals (in addition to 'noop' and 'auto'):
>
>      gnome
>      konsole
>      xterm
>      rxvt
>      screen
>
> Examples:
>
>      OE_TERMINAL = "xterm"
>      OE_TERMINAL = "noop"


