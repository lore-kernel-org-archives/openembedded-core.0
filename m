Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCBD0-0000xj-Ao for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 16:15:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97EGPUS010117 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 15:16:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bJ0FasxF9ogr
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 15:16:25 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97EGJl4010101
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 15:16:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 15:09:40 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317996588.2405.18.camel@ted>
Mime-Version: 1.0
Subject: Convoluted dependencies
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
X-List-Received-Date: Fri, 07 Oct 2011 14:15:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've been trying to figure out why our builds take as long as they do.
It appears our dependency chains are getting more and more convoluted
and this certainly isn't helping things. Specific pain points look like:

bison-native -> gettext-native
flex-native -> gettext-native
(which limits binutils-cross)

gettext-native -> libxml2-native -> python-native
(hence gettext takes a *long* time to be built)
What uses the python xml bindings?

pseudo-native -> sqlite3-native
(dragging out the time our effectively single threaded init takes)

I'm mentioning this in case anyone has good ideas for fixing some of
these...

Cheers,

Richard




