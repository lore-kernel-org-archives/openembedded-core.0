Received: from dgate10.ts.fujitsu.com ([80.70.172.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1Rn82p-0002N9-Cx
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 13:21:43 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=U4wsBd0ntLlhYJKZJRhk4IDuZfnU+1kagPZXtkNMFci7XG1WPz6DvjRQ
	4zdEG3MXocTpSRgbu5ORTtw/7WVJJVZRhbs/p4hzpgVwC7zLCP0BKR+3r
	E+CPIcbAz3KO3g9WU8td+A8/eXTDEpl/h9uFnH7uF32gohG65iOMO3wKh
	omf3aNbFB4KPlPu7rHWB6qd6PmzRQG9sHvGjl5lyeN+aRhQwK32/HnhIw
	UR/xf1/BrywH1mp0Peh5mRK4RuPNN;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1326802448; x=1358338448;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=KWA5twL48lZkWkyA6l9o9XioW++G4Sk3nYFqL5YGcCg=;
	b=SElSmRn+kI1KMbTTFLgSFKUywHdYLx3vlkoQb9Y02arwQGJ2BST3FUJk
	4eatLCBk6aw9FIaYIhN00SfmTHGwlFxf0ZNQxVyt7OlXIGn7mJtPWrCqA
	ubDzg42CZUgny2X7naQE3FjiqkDLok5sG9xtvA09l53+50OLgz5dDEXIE
	x9csCVWzOt8/fb6DN3kUYm0lYL7kmLzQX7pUh4Dc266nh701KuQRYpNs/
	mdDhocAPxr9FSjVxThItdub9dmCPB;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,522,1320620400"; d="scan'208";a="98880739"
Received: from abgdgate30u.abg.fsc.net ([172.25.138.66])
	by dgate10u.abg.fsc.net with ESMTP; 17 Jan 2012 13:14:08 +0100
X-IronPort-AV: E=Sophos;i="4.71,522,1320620400"; d="scan'208";a="126902830"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate30u.abg.fsc.net with ESMTP; 17 Jan 2012 13:14:06 +0100
Message-ID: <4F15660D.7000802@ts.fujitsu.com>
Date: Tue, 17 Jan 2012 13:14:05 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: Openembedded Core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.0.1
Subject: Image build problem with own distro fork
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
X-List-Received-Date: Tue, 17 Jan 2012 12:21:44 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Hi,

actually I tried to fork the angstrom distro into an own distro that
comes again with System V init and less packages. All looks fine if I
want to build my own Gnome-Image, but at the end I get these lines:

Processing sysvinit...
Processing task-gnome...
Processing connman-plugin-wifi...
Processing sysvinit-pidof...
Processing connman-plugin-ethernet...
Processing task-gnome-xserver-base...
Processing shadow...
Processing task-xserver...
error: Failed dependencies:

/srv/vcwork/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/python
is needed by gnome-panel-2.32.1-r5.armv7a

Strange thing is that python is at that place and working and I don't
see a reason why gnome-panel would need python. Can someone explain this?

Regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html


