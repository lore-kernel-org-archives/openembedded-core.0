Received: from dgate10.ts.fujitsu.com ([80.70.172.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RnVUU-0002dQ-NQ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 14:23:50 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=VkU8tqmJrTdiMaWf9Y4gu6KuT1a/MBJeI22ApGg/M4mMvnGDkmeriw85
	pdpjFbiNb412Ggk+ipoeDvLyQDAv4ruhEjBAPpK5w3Ur01Qk1QjAyCAxS
	d0kzURuV8+K2xJI68+FJnRoLikZkfrAPZ9Xc66QqU94hSIEQDnDtDj1Jj
	07QQqo6eylCre8Mk2p6w6eigMXoqRVO66E2TlarV9JjFrpuRDyjBssFyc
	nT4R1Fs/jPHlZOsWFAMqO+60LvdXr;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1326892575; x=1358428575;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=K7r8FNkfajg6RMDbpMFN9DKV0VVQLMUXbHF/DwGBZJE=;
	b=kgyrUozrI0Mn9n51RQsbKgT/SYNW5OsfKEWTDxreTwzfKaAZSgMYmUGZ
	aOuqfZGoTptcbFhwUlyAbpCMHDwSHKUAAHTHW8kgVd6Q24PBweWNQf8xN
	bRqCbOF2DrXZFzVFqfm+3q81t12iHpLaAx1/46FQ8V4UbwuSBWIEFiEgA
	IIBHqNJw/rFEHGkrGOCs2jqysavP/HYBEBaOANpmG7rneeIPEZj9KtZGj
	soKY/QjSP4IxqGfdcqv/kHeQWZ0Xh;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.71,529,1320620400"; d="scan'208";a="99012970"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate10u.abg.fsc.net with ESMTP; 18 Jan 2012 14:16:13 +0100
X-IronPort-AV: E=Sophos;i="4.71,529,1320620400"; d="scan'208";a="127314210"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 18 Jan 2012 14:16:12 +0100
Message-ID: <4F16C61C.4020304@ts.fujitsu.com>
Date: Wed, 18 Jan 2012 14:16:12 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: Openembedded Core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.0.1
Subject: How do I get rid of systemd
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
X-List-Received-Date: Wed, 18 Jan 2012 13:23:50 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Ok,

built my first basic customized console image (based on angstrom's
console-image.bb) and managed to get SystemV init pulled in by deleting
the systemd entry for the init manager.

But systemd is still pulled in via connman, dhcp, rsyslog and ntp. How
can I get totally rid of systemd so that I don't need a kernel with CGROUPS?

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


