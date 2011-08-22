Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QvZab-0006Ig-Ba
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 20:51:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Aug 2011 11:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,263,1312182000"; d="scan'208";a="41183463"
Received: from unknown (HELO helios.localnet) ([10.255.18.79])
	by azsmga001.ch.intel.com with ESMTP; 22 Aug 2011 11:46:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Kang Kai <Kai.Kang@windriver.com>
Date: Mon, 22 Aug 2011 19:46:25 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <4E522492.9050706@windriver.com>
In-Reply-To: <4E522492.9050706@windriver.com>
MIME-Version: 1.0
Message-Id: <201108221946.26036.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: question about meta/class/qmake-base.bbclass
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
X-List-Received-Date: Mon, 22 Aug 2011 18:51:13 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 22 August 2011 10:42:42 Kang Kai wrote:
> When I read the file  meta/class/qmake-base.bbclass, I find that that
> are 2 lines:
>      unset QMAKESPEC || true
>      ${OE_QMAKE_QMAKE} -makefile -spec ${QMAKESPEC} -o Makefile
> $QMAKE_VARSUBST_PRE $AFTER $PROFILES $QMAKE_VARSUBST_POST || die "Error
> calling ${OE_QMAKE_QMAKE} on $PROFILES"
> 
> I am confused that why unset QMAKESPEC first and then use it a argument
> for qmake?

It's not obvious, but think that the difference here is between $QMAKESPEC and 
${QMAKESPEC} - the first one is a reference to an environment variable, the 
second is a reference to an OE/BitBake variable. So "unset QMAKESPEC" is just 
clearing out the environment variable; ${QMAKESPEC} would still have a value.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


