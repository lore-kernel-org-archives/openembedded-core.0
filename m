Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8uIz-0005t1-Fp
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 15:36:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Sep 2011 06:30:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="57539463"
Received: from unknown (HELO helios.localnet) ([10.252.120.159])
	by orsmga002.jf.intel.com with ESMTP; 28 Sep 2011 06:30:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 14:30:40 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1317209028.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1317209028.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201109281430.40509.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] Fix TMPDIR usage in scripts v2
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
X-List-Received-Date: Wed, 28 Sep 2011 13:36:09 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 28 September 2011 12:39:39 Paul Eggleton wrote:
> Fix TMPDIR external environment variable usage within our scripts which
> is a problem on OpenSUSE within an X session (see Yocto bug #1530) by
> using OE_TMPDIR from the external environment instead.
> 
> Note that this will require changes to autobuilder scripts that use a
> TMPDIR environment variable when calling these scripts - they should now
> set OE_TMPDIR instead (if versions with and without this change need to
> be run on the same system, then setting both variables will cause no
> harm).
> 
> Since v1, also fix pass-through references to TMPDIR in the
> qemuimage-testlib script.

So I missed yet another reference in classes/. Please disregard this version.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


