Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Maxin.John@enea.com>) id 1UPTvs-0007Lr-Kk
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 10:29:38 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Tue, 9 Apr 2013
	10:12:15 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 4C5452837E9;
	Tue,  9 Apr 2013 10:12:16 +0200 (CEST)
Date: Tue, 9 Apr 2013 10:12:16 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: <twoerner@gmail.com>
Message-ID: <20130409081216.GA26235@sestofb10.enea.se>
MIME-Version: 1.0
In-Reply-To: <CAHUNapRZKmLop8di8doXCw-gwiXvtJs6R07Y+Mh3Vxs3NFDOKQ@mail.gmail.com>
	<maxin.john@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add info about -ptest package group
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
X-List-Received-Date: Tue, 09 Apr 2013 08:29:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

ptest enabled packages will "inherit ptest". So, we can use grep to
find the list of ptest enabled packages.

eg:
# cd poky
# grep -ir  --include=*.{bb,inc} "inherit"  |grep "ptest"
meta/recipes-extended/bash/bash.inc:inherit autotools gettext update-alternatives ptest
meta/recipes-core/glib-2.0/glib.inc:inherit autotools gettext gtk-doc pkgconfig ptest
meta/recipes-core/dbus/dbus-ptest_1.6.8.bb:inherit autotools pkgconfig gettext ptest
 
Best Regards,
Maxin


