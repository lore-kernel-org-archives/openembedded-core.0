Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RvlvT-0001RF-Lu
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:33:52 +0100
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=ZHsbrwKy2DddPeKY7X7klvp2NPEHWzT/8tKwEUDbxq6O9PErBnSYwqdK
	5W9a16hQ1mvSvWiL6wjW0EhUk5B5ck+smc1QMtIupu4tuQLMuKHeN4DQm
	PuJUR+lufr3+PSzuHk57V8MLpqCNSn7Z55pBvcdcHVKPo9cS++v6/Z++u
	Gppb4IN+E+BsyI0wVEGNdVYPKvSz63L3UGN83+iUdvbIfc+izU2AUc8Ig
	wnnYzs9w/dyZgBOtgxDHjVA9hSwWb;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1328862348; x=1360398348;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=cEv3cqtB3Cy4H0S+o8w9cQthPlRTUSAA9jACI8gLIhc=;
	b=PnjZUZrnr386Oj/vvCsg1rZTKM+CLJUmtOQYLfgyzBYhYncstJhnM0ZF
	01MozNSZ4054g5dHU/fjChT6KMx2hQ/LI6zdKJKV8mfWF2maBBXg4P2ag
	s/2gt9WFbFjd8iGwGCuAnAETcXVI4OgK7M8W16IPIcehw3s+AO2oXnJM1
	8hbjLQEsb0Et6fnH+X3R1C97/m5CoOReRy6dynns7pAfhdpEt8uurLg7t
	m5WqMAYXkqlcxDDT6Cg6DAstud2ff;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.73,395,1325458800"; d="scan'208";a="85993501"
Received: from abgdgate30u.abg.fsc.net ([172.25.138.66])
	by dgate20u.abg.fsc.net with ESMTP; 10 Feb 2012 09:25:48 +0100
X-IronPort-AV: E=Sophos;i="4.73,395,1325458800"; d="scan'208";a="128593605"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate30u.abg.fsc.net with ESMTP; 10 Feb 2012 09:25:47 +0100
Message-ID: <4F34D48B.3040007@ts.fujitsu.com>
Date: Fri, 10 Feb 2012 09:25:47 +0100
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Icedove/3.0.11
MIME-Version: 1.0
To: Openembedded Core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.0.1
Subject: Problems with recipe for openmotif-2.3.0
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
X-List-Received-Date: Fri, 10 Feb 2012 08:33:52 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Hi,

I'm trying to build a recipe for openmotif-2.3.0, but so far i get
errors from "do_conigure" like:

-----------------8<-snip--------------------------------
ac:6: warning: cannot check for file existence when cross compiling
../../lib/autoconf/general.m4:2772: AC_CHECK_FILE is expanded from...
configure.ac:6: the top level
configure:14954: error: possibly undefined macro: LT_HAVE_FREETYPE
-----------------8<-snip--------------------------------

I'm not very familiar with the autotools, but the first line makes me
think that the setup of openmotif is not suitable for cross-compiling.
How can I solve those issues?

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


