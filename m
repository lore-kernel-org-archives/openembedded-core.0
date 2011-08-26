Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwzT4-00029w-Lq
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 18:41:18 +0200
Received: by wyf19 with SMTP id 19so2740733wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 09:36:30 -0700 (PDT)
Received: by 10.216.154.145 with SMTP id h17mr2152194wek.39.1314376589913;
	Fri, 26 Aug 2011 09:36:29 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id j11sm1145569wed.42.2011.08.26.09.36.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 09:36:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1314370503.git.noor_ahsan@mentor.com>
Date: Fri, 26 Aug 2011 18:36:26 +0200
Message-Id: <62FAC521-7EBA-4B4A-B258-AAB088B7AD01@dominion.thruhere.net>
References: <cover.1314370503.git.noor_ahsan@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [meta-oe][PATCH 0/4] pull request #1 for bechmark recipes
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
X-List-Received-Date: Fri, 26 Aug 2011 16:41:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 26 aug. 2011, om 18:31 heeft Noor, Ahsan het volgende geschreven:

> From: Noor Ahsan <noor_ahsan@mentor.com>
> 
> *** BLURB HERE ***

where?

Some general remarks:

1) LICENSE = GPL needs a version
2) PR = r0 needs to get deleted
3) RDEPENDS not allowed, only RDEPENDS_pkgname
4) RDEPENDS and friends are grouped with FILES_, not at the top


