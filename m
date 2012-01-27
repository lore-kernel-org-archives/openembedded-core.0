Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RqjZX-0006aS-KY
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 12:02:23 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Jan 2012 02:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="103319123"
Received: from unknown (HELO helios.localnet) ([10.252.122.187])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2012 02:54:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Fri, 27 Jan 2012 10:54:31 +0000
Message-ID: <2153827.uieeAmS9LV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8 rc2 (Linux/3.0.0-15-generic-pae; KDE/4.7.97; i686; ; )
In-Reply-To: <CAGiJk9fVik9Cc425O5kntWzgtf0Z2WPYnVcAjdTkswHY5YX7_Q@mail.gmail.com>
References: <cover.1322061836.git.paul.eggleton@linux.intel.com>
	<CA+M6bXmAt2xBmCpiXBXxtEB-ykB_4qwtZqF9FrgXf3AD7ranpg@mail.gmail.com>
	<CAGiJk9fVik9Cc425O5kntWzgtf0Z2WPYnVcAjdTkswHY5YX7_Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Make pulseaudio a DISTRO_FEATURE
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
X-List-Received-Date: Fri, 27 Jan 2012 11:02:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 27 January 2012 11:43:50 Samuel Stirtzel wrote:
> just a quick question, couldn't we use a separate recipe for phonon,
> so if a recipe depends on it we don't have to change distro vars?

Well, this thread is now about something more fundamental (how to introduce 
new DISTRO_FEATURES), but we do still need to solve the problem that prompted 
the wider discussion. It's still possible that someone would want to build 
phonon without pulseaudio, even if it was split out into a separate recipe, so 
I'm not sure that addresses the problem.
 
> IMHO it would be easier to just depend on libphonon.bb instead of
> adding a distro var for the one single recipe I'm working on.
> Just my 0.02 cents.

Pulseaudio has become an optional dependency for a lot of things. I think it 
makes sense to make a decision on whether or not to include this on a distro 
level since if you have it enabled in one place you almost certainly want it 
enabled everywhere else (and disabled everywhere if it is disabled).

Now, at the start of this saga there was a question as to whether this should 
be a DISTRO_FEATURE or PACKAGECONFIG (or both, ugh). Ultimately the result is 
the same - distro policy controls whether this feature is on or off.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


