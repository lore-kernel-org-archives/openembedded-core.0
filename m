Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QSVrU-0001Fw-I8
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 17:00:33 +0200
Received: by wye20 with SMTP id 20so1697750wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jun 2011 07:57:18 -0700 (PDT)
Received: by 10.227.11.203 with SMTP id u11mr1999588wbu.77.1307113037986;
	Fri, 03 Jun 2011 07:57:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o38sm1097691wba.37.2011.06.03.07.57.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Jun 2011 07:57:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DE56B0D.4020209@intel.com>
Date: Fri, 3 Jun 2011 16:57:15 +0200
Message-Id: <9BFEBECE-6B1E-4072-82A4-C95EF86F457A@dominion.thruhere.net>
References: <4DE56B0D.4020209@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Fri, 03 Jun 2011 15:00:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jun 2011, om 00:26 heeft Scott Garman het volgende geschreven:

> Hey folks,
>=20
> I'd like to collect some feedback on error messages while building =
that you find confusing/annoying/unhelpful. I'm going to be working on =
trying to improve the situation and would like to hear from you about =
what could be more helpful.
>=20
> I'm starting to track some of these situations with the following =
bugs:
>=20
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D542
>=20
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1127
>=20
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1128
>=20
> I can't promise to fix everything you come up with, but I'd like to =
try to make a dent in some of these issues and improve the usability of =
our build system.

This one popped up recently, -b doesn't work anymore:

=
koen@dominion:/OE/tentacle/sources/meta-texasinstruments/recipes-kernel/li=
nux$ ls | grep omap4
linux-omap4/
linux-omap4_2.6.35.3.bb
linux-omap4-2.6.35.7/
linux-omap4_2.6.35.7.bb
=
koen@dominion:/OE/tentacle/sources/meta-texasinstruments/recipes-kernel/li=
nux$ MACHINE=3Domap4430-panda bitbake -b $PWD/linux-omap4_2.6.35.7.bb
ERROR: Command execution failed: Traceback (most recent call last):
  File "/OE/tentacle/sources/bitbake/lib/bb/command.py", line 102, in =
runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/OE/tentacle/sources/bitbake/lib/bb/command.py", line 190, in =
buildFile
    command.cooker.buildFile(bfile, task)
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 722, in =
buildFile
    fn =3D self.matchFile(fn)
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 700, in =
matchFile
    matches =3D self.matchFiles(buildfile)
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 683, in =
matchFiles
    filelist, masked =3D self.collect_bbfiles()
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 948, in =
collect_bbfiles
    files.sort( key=3Dlambda fileitem: =
self.calc_bbfile_priority(fileitem) )
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 948, in =
<lambda>
    files.sort( key=3Dlambda fileitem: =
self.calc_bbfile_priority(fileitem) )
  File "/OE/tentacle/sources/bitbake/lib/bb/cooker.py", line 411, in =
calc_bbfile_priority
    for _, _, regex, pri in self.status.bbfile_config_priorities:
AttributeError: 'NoneType' object has no attribute =
'bbfile_config_priorities'



'bitbake linux-omap4-2.6.35.7' does work, though=


