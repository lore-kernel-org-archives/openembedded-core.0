Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 65E6460167
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 23:33:19 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so1469955eaj.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 15:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sjbpBPGLaGprGpbaLhSfDh7Bu9/+FU/RshKrUVFfMWo=;
	b=wAilqjmE9yetXzKllk5NQN6VIERI9MyS6qSSAOw9gWI97X4iu7trZ2yCCKWuAKXR7j
	rEdy85ReVYTOdOiqdSS0vY9AZbv+qM7vJv7M6yWnaSNY+jqg6jYWkvfTC7lRV1C1M/Vv
	rXEifxMzSv2vmqnIJnIF/noR5hrxik0N3zFF9e8q3tglv7alaAKjXmSWJ9jrmfaS8EhS
	PQP+AbAp8396hoYqPQSk2f7yz70I9RNALoLkBlEnPBCelIvkdZ2+epEzocG0GR/x1Ej+
	y/g1W+8q8rOTGg0wmitrjRR6355syO42k269p9iPyXhnav9ZvGAkmuVMzv/2b72hHXbe
	zkGQ==
X-Received: by 10.14.202.137 with SMTP id d9mr5736257eeo.23.1389310399953;
	Thu, 09 Jan 2014 15:33:19 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm9794751eed.14.2014.01.09.15.33.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 15:33:19 -0800 (PST)
Date: Fri, 10 Jan 2014 00:33:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Message-ID: <20140109233331.GN3709@jama>
References: <20140109172605.GA15422@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20140109172605.GA15422@mcrowe.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate-diff-machines.sh encounters IndexError
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
X-List-Received-Date: Thu, 09 Jan 2014 23:33:19 -0000
X-Groupsio-MsgNum: 48794
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ScBGguMCFzdFq7Io"
Content-Disposition: inline

--ScBGguMCFzdFq7Io
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2014 at 05:26:05PM +0000, Mike Crowe wrote:
> I just got round to trying sstate-diff-machines.sh in order to find out w=
hy
> some of our recipes are thwarting the sstate cache but I couldn't make it
> work. :(
>=20
> With current oe-core 1028ac813fa9803ebfff6bcfa7f8b67012609b27 and bitbake
> e13acb4113ce75226664c3006a9776cc885e860d I get the following error:
>=20
> $ sstate-diff-machines.sh --tmpdir=3Dtmp-eglibc --machines=3Dqemux86 --ta=
rgets=3Dgcc-cross
>=20
> [...]
> NOTE: Reparsing files to collect dependency data
> ERROR: An uncaught exception occured in runqueue, please see the failure =
below:
> ERROR: Running idle function
> Traceback (most recent call last):
>   File "/vg0disk/mac/src/oe-core/bitbake/lib/bb/server/process.py", line =
133, in ProcessServer.idle_commands(delay=3D0.1, fds=3D[<read-only Connecti=
on, handle 4>, <read-write Connection, handle 7>]):
>                  try:
>     >                retval =3D function(self, data, False)
>                      if retval is False:
>   File "/vg0disk/mac/src/oe-core/bitbake/lib/bb/cooker.py", line 1151, in=
 buildTargetsIdle(server=3D<ProcessServer(ProcessServer-2, started)>, rq=3D=
<bb.runqueue.RunQueue instance at 0x2d118c0>, abort=3DFalse):
>                  try:
>     >                retval =3D rq.execute_runqueue()
>                  except runqueue.TaskFailure as exc:
>   File "/vg0disk/mac/src/oe-core/bitbake/lib/bb/runqueue.py", line 1082, =
in RunQueue.execute_runqueue():
>              try:
>     >            return self._execute_runqueue()
>              except bb.runqueue.TaskFailure:
>   File "/vg0disk/mac/src/oe-core/bitbake/lib/bb/runqueue.py", line 1034, =
in RunQueue._execute_runqueue():
>                      self.dump_signatures()
>     >                self.write_diffscenetasks(invalidtasks)
>                      self.state =3D runQueueComplete
>   File "/vg0disk/mac/src/oe-core/bitbake/lib/bb/runqueue.py", line 1227, =
in RunQueue.write_diffscenetasks(invalidtasks=3Dset([4, 389, 136, 269, 399,=
 472, 147, 20, 279, 409, 159, 32, 289, 419, 169, 42, 299, 429, 179, 52, 309=
, 439, 189, 62, 319, 449, 199, 72, 329, 460, 209, 339, 88, 219, 349, 482, 2=
29, 102, 359, 239, 369, 116, 379, 126, 255])):
>                  matches =3D {k : v for k, v in matches.iteritems() if h =
not in k}
>     >            latestmatch =3D sorted(matches.keys(), key=3Dlambda f: m=
atches[f])[-1]
>                  prevh =3D __find_md5__.search(latestmatch).group(0)
> IndexError: list index out of range
>=20
> NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be rerun=
 and all succeeded.
>=20
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
>=20
>=20
> Am I doing something silly or is this tool currently broken?

It's not fault of this script, bitbake -S is currently broken, see

http://lists.openembedded.org/pipermail/bitbake-devel/2013-December/004269.=
html
and
http://lists.openembedded.org/pipermail/bitbake-devel/2013-December/004271.=
html

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ScBGguMCFzdFq7Io
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLPMcsACgkQN1Ujt2V2gByZNwCdFHDgDIAy+PQ1/d8uh1ZT4/5k
H+MAoJ7raCpMRhhuGO9adbVVSaPir/fZ
=8V04
-----END PGP SIGNATURE-----

--ScBGguMCFzdFq7Io--
