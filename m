Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QV2Zt-0006Ka-30
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 16:20:49 +0200
Received: by wye20 with SMTP id 20so2121003wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 07:17:28 -0700 (PDT)
Received: by 10.216.231.89 with SMTP id k67mr2063993weq.113.1307715448414;
	Fri, 10 Jun 2011 07:17:28 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f60sm1425261wef.37.2011.06.10.07.17.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2011 07:17:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307714956.25285.14.camel@phil-desktop>
Date: Fri, 10 Jun 2011 16:17:25 +0200
Message-Id: <846A0A7E-6D7C-4A13-BC4F-C10562777AC2@dominion.thruhere.net>
References: <1307714956.25285.14.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: bitbake -b busted
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
X-List-Received-Date: Fri, 10 Jun 2011 14:20:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 jun 2011, om 16:09 heeft Phil Blundell het volgende geschreven:

> Since updating this morning, it seems that oe-core master now requires
> bitbake 1.13.1 to be installed.  (I don't recall any discussion of =
that
> change or the reasons for it, but no doubt they are good ones.)
>=20
> I couldn't find a 1.13.1 tag (or in fact any tags after 1.12.0) in the
> bitbake repository so I pulled the head of master.  Judging from the
> contents of the log this is pretty close to 1.13.1 if not identical.
>=20
> Unfortunately, this update seems to have broken "bitbake -b <file>"
> altogether.  Any such command now seems to give me:
>=20
> ERROR: Command execution failed: Traceback (most recent call last):
>  File "/home/pb/oe/bitbake/lib/bb/command.py", line 102, in =
runAsyncCommand
>    commandmethod(self.cmds_async, self, options)
>  File "/home/pb/oe/bitbake/lib/bb/command.py", line 190, in buildFile
>    command.cooker.buildFile(bfile, task)
>  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 774, in buildFile
>    fn =3D self.matchFile(fn)
>  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 752, in matchFile
>    matches =3D self.matchFiles(buildfile)
>  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 735, in matchFiles
>    filelist, masked =3D self.collect_bbfiles()
>  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 994, in =
collect_bbfiles
>    files.sort( key=3Dlambda fileitem: =
self.calc_bbfile_priority(fileitem) )
>  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 994, in <lambda>
>    files.sort( key=3Dlambda fileitem: =
self.calc_bbfile_priority(fileitem) )
>  File "/home/pb/oe/bitbake/lib/bb/cooker.py", line 463, in =
calc_bbfile_priority
>    for _, _, regex, pri in self.status.bbfile_config_priorities:
> AttributeError: 'NoneType' object has no attribute =
'bbfile_config_priorities'

Known problem:

=
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/003721.ht=
ml=


