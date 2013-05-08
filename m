Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1Ua6JN-0005Vn-U2
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 17:30:12 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 0CC51952B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2013 16:11:34 +0100 (BST)
Message-ID: <518A6B25.5000108@r-finger.com>
Date: Wed, 08 May 2013 16:11:33 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Wed, 08 May 2013 15:30:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


I think it would makes sense to move clutter related packages from
oe-core into a dedicated layer:

* AFAIK nothing in oe-core requires cogl/clutter/mx,

* The packages in oe-core are effectively unmaintained, several upstream
releases behind, and pretty much unusable,

* The somewhat random nature of clutter and cogl releases makes it hard
to sensibly manage these packages within the oe-core release cycle, but
a dedicated layer could follow the upstream developments.


I have started work on new clutter and related packages for use by
meta-guacamayo at https://github.com/Guacamayo/meta-clutter, but I'd be
more than happy for the layer to live somewhere else and become the
canonical location for clutter-related bits and pieces.

Tomas

-- 
http://sleepfive.com


