Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qoc5b-0003BI-45
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 16:06:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2011 07:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,310,1309762800"; d="scan'208";a="35007892"
Received: from unknown (HELO helios.localnet) ([10.255.18.43])
	by orsmga001.jf.intel.com with ESMTP; 03 Aug 2011 07:01:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 3 Aug 2011 15:01:58 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
In-Reply-To: <4E395235.9010709@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201108031501.58796.paul.eggleton@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Wed, 03 Aug 2011 14:06:27 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 03 August 2011 14:50:45 Darren Hart wrote:
> if [ "$BDIR" == "/" ]; then
>         echo "ERROR: / is not supported as a build directory."
>         exit 1
> fi
> BDIR=${BDIR%/}

Works fine here - the only thing I'd suggest is use "=" instead of "==" as I 
think "==" is a bashism (at least dash doesn't like it - not that we support 
dash but we at least want the user to get past the setup script so they can 
get a proper error from sanity.bbclass).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


