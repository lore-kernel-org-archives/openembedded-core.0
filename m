Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLjgN-0002Nt-Eg
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 23:53:19 +0100
Received: by faas16 with SMTP id s16so1038002faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 15:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=08kYTBfhHaZY1NbYGrC1K7QbW+Oqw23nOP98sro0FoA=;
	b=As8QkhKl89cflc4ZM+lu/BaalOeZTHiGo8HD8XIBspaVfQKtwvDpVUdGamuYqx2lfc
	x0GKwRQ0XaIslsk66XxzoDCDLCA10Wl/D0rwRIGEIZfYV7yaf8xnrCWnKT2pQh5g1eZm
	doFBd7P+CKztngw3/2kxR1R7V0YWrj0TTz2PQ=
Received: by 10.223.92.135 with SMTP id r7mr11924499fam.35.1320274031578;
	Wed, 02 Nov 2011 15:47:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm8229272faf.14.2011.11.02.15.47.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 15:47:10 -0700 (PDT)
Date: Wed, 2 Nov 2011 23:47:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111102224704.GI9949@jama.jama.net>
References: <cover.1320268188.git.mark.hatle@windriver.com>
	<20111102212240.GG9949@jama.jama.net>
	<4EB1B89E.8080505@windriver.com>
	<20111102221116.GH9949@jama.jama.net>
	<4EB1C4DF.8070007@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4EB1C4DF.8070007@windriver.com>
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
X-List-Received-Date: Wed, 02 Nov 2011 22:53:19 -0000
X-Groupsio-MsgNum: 11837
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OfrWf2Fun5Ae4m0Y"
Content-Disposition: inline

--OfrWf2Fun5Ae4m0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2011 at 05:31:59PM -0500, Mark Hatle wrote:
> On 11/2/11 5:11 PM, Martin Jansa wrote:
> > On Wed, Nov 02, 2011 at 04:39:42PM -0500, Mark Hatle wrote:
> >> On 11/2/11 4:22 PM, Martin Jansa wrote:
> >>> On Wed, Nov 02, 2011 at 04:11:57PM -0500, Mark Hatle wrote:
> >>>> Uprev to pseudo 1.2.
> >>>>
> >>>> This was heavily tested by building oe-core with numerous image=20
> >>>> configurations.  Each configuration generated the same image before =
and=20
> >>>> after the change from the current to new version of pseudo.
> >>>>
> >>>> The primary purpose of this change is to enable the PSEUDO_UNLOAD=20
> >>>> functionality that may be used for performance enhancements in futur=
e=20
> >>>> versions of oe-core.
> >>>>
> >>>> The following changes since commit 37579d7d74d127c90c1e078d05c5bf4ba=
0b3f755:
> >>>>
> >>>>   meta: glib-2.0: don't apply qsort_r test removable patch for nativ=
e version (2011-11-02 09:08:21 +0000)
> >>>>
> >>>> are available in the git repository at:
> >>>>   git://git.pokylinux.org/poky-contrib mhatle/pseudo
> >>>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/pse=
udo
> >>>
> >>> Is there branch with pseudo-1.2 for oe-core?
> >>
> >> ^^^^^^^^^^^^^^^^^^^^^^^^
> >>
> >> git://git.pokylinux.org/poky-contrib mhatle/pseudo
> >>
> >> Grab that -- or simply grab the top commit and add it to your oe-core =
checkout.
> >=20
> > Yes, but git cherry-pick would be faster and adding poky-contrib as
> > another git remote is not very efficient as it doesn't share any git
> > objects with oe-core repo so it checkouts "whole poky" again :/.
> >=20
> > So I'll use 2nd easiest option "pw-am.sh 14227".
> >=20
> >>> I would like to try it because we have strange errors when libstc++
> >>> isn't found when building with pseudo, but same binaries are working
> >>> fine without pseudo (seems related to /etc/ld.so.cache being ignored
> >>> sometimes from pseudo env).
> >>>
> >>> And while I was trying to debug it I've noticed that files.db and
> >>> pseudo.log is quite big.
> >>> -rw-r--r-- 1 bitbake bitbake 240M Aug 15 13:49 files.db
> >>> -rw-r--r-- 1 bitbake bitbake  91K Aug 15 13:50 logs.db
> >>> -rw-r--r-- 1 bitbake bitbake 305M Aug 15 13:49 pseudo.log
> >>
> >> The files.db is based on the number of files accessed during the time =
pseudo is
> >> running.
> >=20
> > Ah ok, this was in sysroot which was created "Aug  9" so it gets pretty
> > big fast, lets hope that sqlite3 can handle it efficiently, or is there
> > some way to "cleanup" stale entries in files table?
>=20
> When you clean the build it will restart the pseudo DB.
>=20
> > ie I'm using eglibc-2.14, but files table is full of eglibc-2.13 entries
> > and _none_ from eglibc-2.14, is it supposed to be like this or is it
> > sign of some pseudo problems?
> >=20
> > sqlite> select count(*) from files where path like '%eglibc-2.13%';
> > 20221
> > sqlite> select count(*) from files where path like '%eglibc-2.14%';
> > 0
> > sqlite> select count(*) from files;
> > 1085380
>=20
> The pseudo DB is specific to the tmp work directory.  If the work directo=
ry
> hasn't changed (i.e. you aren't updating versions and pr) then the pseudo=
 DB
> will continue to grow to accommodate the new files.
>=20
> There are flags within the DB if an erase operation occurs, but entries a=
re only
> tagged as erased -- but not removed.  This is due to speed issues.  pseud=
o is
> significantly slower on remove and replace operations if the DB entries a=
re removed.
>=20
> >> logs.db and pseudo.log are based on the debug settings of pseudo.  If =
you don't
> >> have debugging enabled (you would have to do this manually) and the lo=
gs are
> >> that big, something is going seriously wrong with the path/inode trans=
lation...
> >>  It's fairly normal to have a set of logs that are in the 10-20k range=
 for
> >> complex packages.. (These are documenting cases where pseudo has to gu=
ess about
> >> inode to path mapping..)
> >=20
> > This was generated without debug enabled.. but maybe because of rm_work,
> > see below...
> >=20
> >>> with pseudo.log full of errors like this
> >>> pseudo: path mismatch [12 links]: ino 39721500 db
> >>> '/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/vim-7.2.446-r10.3/imag=
e/usr/share/vim/vim72/tutor'
> >>> req
> >>> '/OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/task-shr-feed-1.0-r9=
6'.
> >>
> >> Are you building on a NFS filesystem?  NFS (and a few other filesystem=
s) have a
> >> habit of remapping inodes out from under the filesystem.  pseudo uses =
the inodes
> >> as a validation that the file hasn't changed.  If these inodes are cha=
nging,
> >> pseudo will do it's best to keep things in sync, but there is a chance=
 it won't
> >> always succeed.
> >=20
> > No I'm building on local ext3 filesystem, but I'm also using rm_work, s=
o=20
> > /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/vim-7.2.446-r10.3/image/u=
sr/share/vim/vim72/tutor
> > is probably long gone and inode 39721500 wasn't marked as unused in
> > pseudo world or do I read it wrong?
>=20
> If you use rm_work, then the pseudo DB located within the work directory =
will
> also be removed.  So I'm not sure why you would be having such a large DB.

But I was talking about pseudo db here:
tmp/sysroots/x86_64-linux/var/pseudo/

now with pseudo-1.2 I still have quite a few warnings about inodes in
pseudo.log now in work directory, ie python build:
OE @ ~/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.7.2-r0.1 $=20
-rw-r--r--  1 bitbake bitbake 5.2M Nov  2 23:44 files.db
-rw-r--r--  1 bitbake bitbake 4.0K Nov  2 23:44 logs.db
-rw-r--r--  1 bitbake bitbake  46K Nov  2 23:44 pseudo.log

pseudo: dir err : 1240102 ['/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/p=
ython-2.7.2-r0.1/deploy-ipks/armv4t/IPKG_BUILD.25064'] (db 'no path') db mo=
de 0100644, header mode 040755 (unlinking db)
pseudo: creat for '/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.7=
=2E2-r0.1/deploy-ipks/armv4t/stvITxha' replaces existing 1240107 ['no path'=
].
wxr-xr-x  1 bitbake bitbake    0 Nov  2 23:44 pseudo.socket
pseudo: path mismatch [2 links]: ino 1240673 db '/OE/shr-core/tmp/work/armv=
4t-oe-linux-gnueabi/python-2.7.2-r0.1/sstate-build-package/package/usr/bin/=
python2.7' req '/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/python-2.7.2-=
r0.1/sstate-build-package/package/usr/bin/python'.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OfrWf2Fun5Ae4m0Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6xyGgACgkQN1Ujt2V2gBxpSwCfczLeliPYkPilNYyjTRBGt+wq
fxcAoK0d88/lIO7xsPIOSthbgwFvG2gD
=81A4
-----END PGP SIGNATURE-----

--OfrWf2Fun5Ae4m0Y--
