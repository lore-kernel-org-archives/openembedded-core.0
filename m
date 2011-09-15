Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R4FsR-0006E4-8m
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 19:37:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Sep 2011 10:32:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="48827158"
Received: from unknown (HELO [10.255.14.252]) ([10.255.14.252])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2011 10:32:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 15 Sep 2011 10:32:18 -0700
In-Reply-To: <FF2EB738-77F7-4BC5-BB83-82ED8CBC0F96@dominion.thruhere.net>
References: <20110911172241.GA3674@chargestorm.se>
	<1315762415-18070-1-git-send-email-eric@eukrea.com>
	<201109121134.42474.paul.eggleton@linux.intel.com>
	<FF2EB738-77F7-4BC5-BB83-82ED8CBC0F96@dominion.thruhere.net>
Organization: Yocto Project / OTC / Intel
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316107938.1058.80.camel@swold-mobl.bigsur.com>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: sgw@linux.intel.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 15 Sep 2011 17:37:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2011-09-14 at 13:11 +0200, Koen Kooi wrote:
> Op 12 sep. 2011, om 12:34 heeft Paul Eggleton het volgende geschreven:
> 
> > On Sunday 11 September 2011 18:33:35 Eric Bénard wrote:
> >> - 4.7.4 was release on the 1st of september, the changelog is available
> >> here :
> >> http://qt.gitorious.org/+qt-developers/qt/releases/blobs/v4.7.4/dist/chang
> >> es-4.7.4 and mostly contains bug fix.
> >> 
> >> Signed-off-by: Eric Bénard <eric@eukrea.com>
> >> ---
> >> .../conf/distro/include/distro_tracking_fields.inc |   32
> >> ++++++++++---------- meta/recipes-qt/qt4/{qt-4.7.3.inc => qt-4.7.4.inc} | 
> >>  4 +-
> >> .../0001-Added-Openembedded-crossarch-option.patch |    0
> >> 
> 
> [..]
> 
> >> rename to meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
> > 
> > Thanks Eric, tested OK.
> > 
> > Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Saul, Richard,
> 
> Could you please give us an heads-up when this is going in, since it needs matching commits to meta-oe and meta-angstrom as well to keep the .bbappends working. If we don't succeed in merging the bbappend changes into oe-core we should consider breaking the 'git mv oldrecipe newrecipe' into an add and delete spaced a day apart.
> 
Koen,

We are going to hold off on this one until we complete the 1.1 RC
branching and open master up for development again.

Thanks
Sau!

> regards,
> 
> Koen




