Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rdmp6-000492-0R
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 18:52:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Dec 2011 09:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88642209"
Received: from unknown (HELO helios.localnet) ([10.252.122.57])
	by azsmga001.ch.intel.com with ESMTP; 22 Dec 2011 09:45:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: mohamed basith <mdbasith87@gmail.com>
Date: Thu, 22 Dec 2011 17:45:41 +0000
Message-ID: <7748813.XYBXSBkenD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <CAE=MDVN_3QBq_tr=-xfSrJr-5u4-azhrWytzpugzr+nzcxkJ_g@mail.gmail.com>
References: <CAE=MDVN_3QBq_tr=-xfSrJr-5u4-azhrWytzpugzr+nzcxkJ_g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Architecture mismatch QA issue
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
X-List-Received-Date: Thu, 22 Dec 2011 17:52:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 December 2011 04:49:00 mohamed basith wrote:
> | ERROR: QA Issue: Architecture did not match (40 to 3) on
> 
> /work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.4-r39.5/packages-split
> /qt4-embedded-tools/usr/bin/rcc
> | ERROR: QA Issue: Architecture did not match (40 to 3) on
> 
> /work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.4-r39.5/packages-split
> /qt4-embedded-tools/usr/bin/moc
> | ERROR: QA Issue: Architecture did not match (40 to 3) on

If you or someone else who experienced this problem could test the patch at 
the HEAD of the following branch to verify that this fixes it that would be 
great:

http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/qt4-arch-
fix

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


