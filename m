Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RFqke-0002gn-QE
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 19:13:24 +0200
Received: by eyd9 with SMTP id 9so3105010eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 10:07:31 -0700 (PDT)
Received: by 10.213.19.19 with SMTP id y19mr1183773eba.79.1318871251555;
	Mon, 17 Oct 2011 10:07:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a49sm31164310eea.2.2011.10.17.10.07.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 10:07:30 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 17 Oct 2011 19:07:25 +0200
Message-Id: <5BC7E975-3E96-4DFC-8E03-FE60EC5C47FC@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
Subject: intermittent (50% of the time) parse failures
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
X-List-Received-Date: Mon, 17 Oct 2011 17:13:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I'm working on xfce and half the time I get:

=
koen@dominion:/OE/tentacle/sources/meta-openembedded/meta-xfce/recipes-pan=
el-plugins/cpugraph$ bitbake xfce4-cpugraph-plugin
Loading cache: 100% =
|#########################################################################=
##########################################################################=
##########################################################################=
################| ETA:  00:00:00
Loaded 1794 entries from dependency cache.
Parsing recipes: 100% =
|#########################################################################=
##########################################################################=
##########################################################################=
##############| Time: 00:00:00
Parsing of 1397 .bb files complete (1396 cached, 1 parsed). 1794 =
targets, 58 skipped, 0 masked, 0 errors.
ERROR: Command execution failed: Traceback (most recent call last):
  File "/OE/tentacle/sources/bitbake/lib/bb/command.py", line 99, in =
runAsyncCommand
    self.cooker.updateCache()
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 1135, in =
updateCache
    if not self.parser.parse_next():
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 1466, in =
parse_next
    self.shutdown()
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 1455, in =
shutdown
    bb.codeparser.parser_cache_savemerge(self.cooker.configuration.data)
  File "/OE/tentacle/sources/bitbake/lib/bb/codeparser.py", line 121, in =
parser_cache_savemerge
    data, version =3D p.load()
ValueError: could not convert string to int

The next run is fine, the one after that broken, etc

I suspect it's this bit of code:

SRC_URI =3D =
"http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-=
${PV}.tar.bz2"

But I wonder why it works half the time, not always.

regards,

Koen=


