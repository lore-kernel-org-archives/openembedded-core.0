Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCWMd-0007Gl-L2
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 15:23:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Mar 2012 06:14:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146239001"
Received: from unknown (HELO helios.localnet) ([10.252.123.228])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2012 06:14:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 27 Mar 2012 14:14:03 +0100
Message-ID: <2932339.q9qjygBMla@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F71BBCC.4030307@opendreambox.org>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
	<4a226262b48b8f0c56019183604b70c0f565d5f2.1332848153.git.paul.eggleton@linux.intel.com>
	<4F71BBCC.4030307@opendreambox.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] scripts/bitbake: try harder to check if pseudo exists
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
X-List-Received-Date: Tue, 27 Mar 2012 13:23:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 27 March 2012 15:08:28 Andreas Oberritter wrote:
> On 27.03.2012 13:50, Paul Eggleton wrote:
> > +        PSEUDOBINDIR=`bitbake -e | grep STAGING_BINDIR_NATIVE=\" | cut -d
> > '=' -f2 | cut -d '"' -f2`
> I think using sed might improve readability:
> 
> bitbake -e | grep ^STAGING_BINDIR_NATIVE= | sed -e
> 's,^STAGING_BINDIR_NATIVE="\(.*\)"$,\1,'
> 
> This may be a subjective impression, though.

I just copied this from further down in the script. Personally I find the 
original more readable although the sed version spawns less processes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


