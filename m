Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8sMJ-00034q-2P
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 13:31:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2011 04:25:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,455,1312182000"; d="scan'208";a="71558664"
Received: from unknown (HELO helios.localnet) ([10.252.120.175])
	by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2011 04:25:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 12:25:41 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1317201529.git.paul.eggleton@linux.intel.com>
	<1317208204.26109.240.camel@ted>
In-Reply-To: <1317208204.26109.240.camel@ted>
MIME-Version: 1.0
Message-Id: <201109281225.41524.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] Fix TMPDIR usage in scripts
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
X-List-Received-Date: Wed, 28 Sep 2011 11:31:27 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 28 September 2011 12:09:57 Richard Purdie wrote:
> At the very least we need to fix the references in
> scripts/qemuimage-testlib so the automated image testing doesn't break.

OK, v2 on its way. The scripts that call qemuimage-testlib will still need to 
be updated to set OE_TMPDIR though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


