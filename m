Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1CF6D2F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:03:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAIC3AUd029176; Mon, 18 Nov 2013 12:03:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MHEi2ZQdByLT; Mon, 18 Nov 2013 12:03:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAIC333W029159
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Nov 2013 12:03:04 GMT
Message-ID: <1384776180.6460.218.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 18 Nov 2013 12:03:00 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: opkg in svn?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2013 12:03:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Paul,

Looking at opkg, I did have one other question. Currently in most builds
we build opkg (either as the package manager or at least for
update-alternatives). opkg is in svn but its one of the few remaining
components we use from svn. It means we have to build subversion-native
which has a fairly long dependency chain. It would be nice if we didn't
need to so is there any chance we can move opkg to git?

An alternative would be to have good tarball releases we could use
instead?

FWIW, in OE-Core we currently have:

recipes-devtools/installer/adt-installer_1.0.bb~:SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
recipes-devtools/installer/adt-installer_1.0.bb:SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
recipes-devtools/opkg/opkg_svn.bb:SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
recipes-devtools/ubootchart/ubootchart_svn.bb:SRC_URI = "svn://ubootchart.googlecode.com/svn/;protocol=http;module=trunk \
recipes-multimedia/tremor/tremor_20120314.bb:SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;protocol=http \
recipes-sato/puzzles/puzzles_r9765.bb:SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"

so opkg is three of the remaining six svn references and is by far the
most significant factor in builds.

Cheers,

Richard






