Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QwNgn-0000Sp-Cy
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 02:20:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2011 17:16:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,278,1312182000"; d="scan'208";a="44136435"
Received: from unknown (HELO helios.localnet) ([10.255.18.136])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2011 17:16:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <kergoth@gmail.com>,
	"Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 01:16:07 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
	<201108221401.15860.paul.eggleton@linux.intel.com>
	<CABcZANnHKrkmjODWStf3CyBEMBZRpkcVTZZ5dmVo-bkUn9Ybdw@mail.gmail.com>
In-Reply-To: <CABcZANnHKrkmjODWStf3CyBEMBZRpkcVTZZ5dmVo-bkUn9Ybdw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201108250116.08019.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
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
X-List-Received-Date: Thu, 25 Aug 2011 00:20:57 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 25 August 2011 00:16:40 Chris Larson wrote:
> I strongly disagree with this. The fact is, we almost never go back
> and "clean these up later", so crap accrues.

We're talking about the difference between:

if a = "":

and 

if a:

This is not crap, it's a triviality (for the case where the functional 
difference is not important anyway). If you care then by all means submit a 
patch to change it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


