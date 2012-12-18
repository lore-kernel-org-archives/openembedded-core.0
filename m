Received: from mout.gmx.net ([212.227.15.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1TkrSO-0003NT-0p
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 08:19:16 +0100
Received: from mailout-de.gmx.net ([10.1.76.70]) by mrigmx.server.lan
	(mrigmx001) with ESMTP (Nemesis) id 0MM1FC-1TjkEw1zXo-007oj5 for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:04:34 +0100
Received: (qmail invoked by alias); 18 Dec 2012 07:04:34 -0000
Received: from unknown (EHLO pink.cheepee.homedns.org) [78.96.83.205]
	by mail.gmx.net (mp070) with SMTP; 18 Dec 2012 08:04:34 +0100
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX19opik7ydRoGs7C1iJnSPuIt3yRCsInHMYgbK+N5s
	uNJXislE1xb1Rb
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 09:04:14 +0200
Message-Id: <1355814255-1946-1-git-send-email-cheepeero@gmx.net>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <20121215065958.GA3113@jama.jama.net>
References: <20121215065958.GA3113@jama.jama.net>
X-Y-GMX-Trusted: 0
Subject: packagegroup-base notes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 07:19:16 -0000

Please note that packagegroup-base also contains references to VIRTUAL-RUNTIME_apm and VIRTUAL-RUNTIME_alsa-state, which are not defined within the same recipe (I did a search to find a good place to add my own weak definition for keymaps).



