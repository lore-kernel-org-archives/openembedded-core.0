Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLj7j-0001KD-NK
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 23:17:31 +0100
Received: by faas16 with SMTP id s16so1010252faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 15:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HMlnik85D8n0NQdcHGGxgNKD92Ey3fuSkdzrSI2Btho=;
	b=q7gpvDe3H1yqf1YCcqhJDy2b6jDiTCFjuGWCZKnFOqBt5A+fI5DyCCsD8vg7ESHKaK
	4HEzFkCcUQvlMfHttBF+cc6UdiTTK2NyyQxO6AhBeKe+L1Q8Je0Tm62mxFfufjKoT5uY
	5aA9SO7B037oWNUdUuLfNNPmPxOAYwAfjjkr0=
Received: by 10.223.88.150 with SMTP id a22mr7681360fam.1.1320271883939;
	Wed, 02 Nov 2011 15:11:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm8088187fad.7.2011.11.02.15.11.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 15:11:22 -0700 (PDT)
Date: Wed, 2 Nov 2011 23:11:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111102221116.GH9949@jama.jama.net>
References: <cover.1320268188.git.mark.hatle@windriver.com>
	<20111102212240.GG9949@jama.jama.net>
	<4EB1B89E.8080505@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4EB1B89E.8080505@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/1] Uprev to pseudo 1.2
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
X-List-Received-Date: Wed, 02 Nov 2011 22:17:31 -0000
X-Groupsio-MsgNum: 11835
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
Content-Disposition: inline

--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2011 at 04:39:42PM -0500, Mark Hatle wrote:
> On 11/2/11 4:22 PM, Martin Jansa wrote:
> > On Wed, Nov 02, 2011 at 04:11:57PM -0500, Mark Hatle wrote:
> >> Uprev to pseudo 1.2.
> >>
> >> This was heavily tested by building oe-core with numerous image=20
> >> configurations.  Each configuration generated the same image before an=
d=20
> >> after the change from the current to new version of pseudo.
> >>
> >> The primary purpose of this change is to enable the PSEUDO_UNLOAD=20
> >> functionality that may be used for performance enhancements in future=
=20
> >> versions of oe-core.
> >>
> >> The following changes since commit 37579d7d74d127c90c1e078d05c5bf4ba0b=
3f755:
> >>
> >>   meta: glib-2.0: don't apply qsort_r test removable patch for native =
version (2011-11-02 09:08:21 +0000)
> >>
> >> are available in the git repository at:
> >>   git://git.pokylinux.org/poky-contrib mhatle/pseudo
> >>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/pseudo
> >=20
> > Is there branch with pseudo-1.2 for oe-core?
>=20
> ^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> git://git.pokylinux.org/poky-contrib mhatle/pseudo
>=20
> Grab that -- or simply grab the top commit and add it to your oe-core che=
ckout.

Yes, but git cherry-pick would be faster and adding poky-contrib as
another git remote is not very efficient as it doesn't share any git
objects with oe-core repo so it checkouts "whole poky" again :/.

So I'll use 2nd easiest option "pw-am.sh 14227".

> > I would like to try it because we have strange errors when libstc++
> > isn't found when building with pseudo, but same binaries are working
> > fine without pseudo (seems related to /etc/ld.so.cache being ignored
> > sometimes from pseudo env).
> >=20
> > And while I was trying to debug it I've noticed that files.db and
> > pseudo.log is quite big.
> > -rw-r--r-- 1 bitbake bitbake 240M Aug 15 13:49 files.db
> > -rw-r--r-- 1 bitbake bitbake  91K Aug 15 13:50 logs.db
> > -rw-r--r-- 1 bitbake bitbake 305M Aug 15 13:49 pseudo.log
>=20
> The files.db is based on the number of files accessed during the time pse=
udo is
> running.

Ah ok, this was in sysroot which was created "Aug  9" so it gets pretty
big fast, lets hope that sqlite3 can handle it efficiently, or is there
some way to "cleanup" stale entries in files table?

ie I'm using eglibc-2.14, but files table is full of eglibc-2.13 entries
and _none_ from eglibc-2.14, is it supposed to be like this or is it
sign of some pseudo problems?

sqlite> select count(*) from files where path like '%eglibc-2.13%';
20221
sqlite> select count(*) from files where path like '%eglibc-2.14%';
0
sqlite> select count(*) from files;
1085380

> logs.db and pseudo.log are based on the debug settings of pseudo.  If you=
 don't
> have debugging enabled (you would have to do this manually) and the logs =
are
> that big, something is going seriously wrong with the path/inode translat=
ion...
>  It's fairly normal to have a set of logs that are in the 10-20k range for
> complex packages.. (These are documenting cases where pseudo has to guess=
 about
> inode to path mapping..)

This was generated without debug enabled.. but maybe because of rm_work,
see below...

> > with pseudo.log full of errors like this
> > pseudo: path mismatch [12 links]: ino 39721500 db
> > '/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/vim-7.2.446-r10.3/image/=
usr/share/vim/vim72/tutor'
> > req
> > '/OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/task-shr-feed-1.0-r96'.
>=20
> Are you building on a NFS filesystem?  NFS (and a few other filesystems) =
have a
> habit of remapping inodes out from under the filesystem.  pseudo uses the=
 inodes
> as a validation that the file hasn't changed.  If these inodes are changi=
ng,
> pseudo will do it's best to keep things in sync, but there is a chance it=
 won't
> always succeed.

No I'm building on local ext3 filesystem, but I'm also using rm_work, so=20
/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/vim-7.2.446-r10.3/image/usr/s=
hare/vim/vim72/tutor
is probably long gone and inode 39721500 wasn't marked as unused in
pseudo world or do I read it wrong?

> (This is done because someone could access a file in pseudo control that =
was
> created outside..  so pseudo could only capture the inode..  then if in a=
 future
> action the file is accessed the inode/path can be checked.  If the inode =
matches
> it assumes it's the same file and now a path name exists..  if someone ma=
kes
> changes outside of pseudo control a similar check happens.. this time it'=
ll see
> the path is the same but inode has changed.. so it guesses the file was m=
odified
> and I believe resets everything based on the new inode.   Each of these w=
ill
> generate a warning in the logs.)

Thanks for clarifying that.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6xwAQACgkQN1Ujt2V2gBzhXACdG8/SPcVqQdkyF8kzF7EEg559
g60An1WW0Pt/9oUs8PUJM5if/T3CLx4n
=Fd3r
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--
