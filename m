Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1SwVFw-0003uI-IN; Wed, 01 Aug 2012 11:30:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2012 02:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="180174483"
Received: from unknown (HELO helios.localnet) ([10.252.121.41])
	by orsmga002.jf.intel.com with ESMTP; 01 Aug 2012 02:18:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Aug 2012 10:18:35 +0100
Message-ID: <2185895.mVUSlrr6Gr@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic-pae; KDE/4.8.4; i686; ; )
MIME-Version: 1.0
Subject: meta-oe and meta-systemd
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
X-List-Received-Date: Wed, 01 Aug 2012 09:31:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks,

As many of you already know, a couple of weeks ago systemd support was moved 
out of the meta-oe layer and into a new meta-systemd layer:

http://cgit.openembedded.org/meta-openembedded/tree/meta-systemd

This means two things:

1) meta-oe no longer imposes systemd-related changes on those who haven't 
selected it. There are still some unrelated appends, overlayed recipes and 
classes that we need to look at tidying up (and this is happening already), 
but people should now be able to feel more comfortable with using meta-oe as a 
layer if they were previously hesitant about doing so.

2) Having the systemd pieces isolated in a single layer makes them easier to 
examine in isolation and moves us closer to eventually merging systemd support 
into OE-Core.

As well as adding systemd itself, meta-systemd uses bbappends to add systemd 
support to various recipes from different layers, and has a directory structure 
internally that allows appends for layers that are not in use to be BBMASKed 
out. See the meta-systemd README for details.

Further work to move systemd closer to merging into OE-Core is ongoing. Thanks 
very much to all who have contributed so far!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


