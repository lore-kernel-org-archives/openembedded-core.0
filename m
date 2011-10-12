Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RDv86-0008Vr-I9
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 11:29:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Oct 2011 02:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,332,1315206000"; d="scan'208";a="25502783"
Received: from unknown (HELO helios.localnet) ([10.252.120.213])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Oct 2011 02:23:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 10:23:52 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-11-generic-pae; KDE/4.6.5; i686; ; )
References: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<040b38fbd0ab7c7a1275b2e688dba177a907c716.1318405370.git.Martin.Jansa@gmail.com>
In-Reply-To: <040b38fbd0ab7c7a1275b2e688dba177a907c716.1318405370.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Message-Id: <201110121023.52795.paul.eggleton@linux.intel.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe-core 2/4] qt4-x11-free: bring back pkg-config fixups
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
X-List-Received-Date: Wed, 12 Oct 2011 09:29:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 12 October 2011 08:45:03 Martin Jansa wrote:
> From: Simon Busch <morphis@gravedo.de>
> 
> With b40b9c024be5e1ec81a31961158b3e6b529acfe0 some pkg-config fixups where
> removed from qt4.inc which breaks the pkg-config files for qt4-embedded.
> Without that the pkg-config files for qt4-x11-free are broken. So this
> patch puts the fixes into the qt4-x11-free.inc file to be used by
> qt4-x11-free and not qt4-embedded.

So why do we need these only in the X11 version? Surely they should be 
applicable to both embedded and X11, or not at all...?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


