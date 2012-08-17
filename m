Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2UY5-0001Nl-4P for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:57:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HLjjfM013515
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 22:45:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13290-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 22:45:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HLjbkG013509
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 22:45:38 +0100
Message-ID: <1345239937.27428.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 22:45:37 +0100
In-Reply-To: <CALbNGRTG3z_p0=wjqhvqy-xcm5F6qdgqa4xPzfVvDqzbPODFCw@mail.gmail.com>
References: <20120817170922.097651032F@opal>
	<CALbNGRRGxF518Vo933R8tLFU8yTbw8XBfFZQox93kr0m2ACJ_A@mail.gmail.com>
	<CALbNGRTG3z_p0=wjqhvqy-xcm5F6qdgqa4xPzfVvDqzbPODFCw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q7HLjjfM013515
Subject: Re: [oe-commits] Mark Hatle : prelink: Update to latest upstream prelink
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
X-List-Received-Date: Fri, 17 Aug 2012 21:57:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-17 at 23:21 +0200, Andreas M=C3=BCller wrote:
> On Fri, Aug 17, 2012 at 7:09 PM,  <git@git.openembedded.org> wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 7759c9a2c5dfdc1cae5540a5985632c78abbac89
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D7759c9a2c5dfdc1cae5540a5985632c78abbac89
> >
> > Author: Mark Hatle <mark.hatle@windriver.com>
> > Date:   Mon Aug 13 14:49:57 2012 -0500
> >
> > prelink: Update to latest upstream prelink
> >
> > The latest fixes an obscure problem with prelinking on PowerPC, as we=
ll
> > as general updated.
> >
> > Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >
> > ---
> >
> >  meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/reci=
pes-devtools/prelink/prelink_git.bb
> > index c94bdf5..610302e 100644
> > --- a/meta/recipes-devtools/prelink/prelink_git.bb
> > +++ b/meta/recipes-devtools/prelink/prelink_git.bb
> > @@ -8,9 +8,9 @@ and executables, so that far fewer relocations need t=
o be resolved at \
> >  runtime and thus programs come up faster."
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc93c0550bd3173f4504b2cbd8=
991e50b"
> > -SRCREV =3D "7b47f2f8a15ed13b7905bc120bb2586f3e164f7d"
> > +SRCREV =3D "a2d8e30942bd4bc0a5c852b9d9d12f8684c4bb8d"
> >  PV =3D "1.0+git${SRCPV}"
> > -PR =3D "r9"
> > +PR =3D "r10"
> >
> >  #
> >  # The cron script attempts to re-prelink the system daily -- on
> >
> I think reloading is caused by this change. Since latest update I get
>=20
> WARNING: Failed to fetch URL
> git://git.yoctoproject.org/prelink-cross.git;protocol=3Dgit, attempting
> MIRRORS if available
> ERROR: Fetcher failure: Fetch command export HOME=3D"/home/Superandy";
> export SSH_AUTH_SOCK=3D"/tmp/keyring-IAYDEC/ssh"; export
> GIT_CONFIG=3D"/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/=
etc/gitconfig";
> export PATH=3D"/home/Superandy/data/oe-core/sources/openembedded-core/s=
cripts/native-intercept:/home/Superandy/data/oe-core/sources/openembedded=
-core/scripts:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/us=
r/bin/armv7a-vfp-neon-linux:/home/Superandy/tmp/oe-core-eglibc/sysroots/x=
86_64-linux/usr/bin:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-li=
nux/usr/sbin:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr=
/bin:/home/Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux/sbin:/home/=
Superandy/tmp/oe-core-eglibc/sysroots/x86_64-linux//bin:/home/Superandy/o=
e-core/sources/openembedded-core/scripts:/home/Superandy/oe-core/sources/=
bitbake/bin:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr/local/bin:/usr/b=
in:/bin:/usr/local/sbin:/usr/sbin:/sbin:./:/home/Superandy/bin:/sbin:/usr=
/sbin";
> git remote add --mirror=3Dfetch origin
> git://git.yoctoproject.org/prelink-cross.git failed with exit code
> 129, output:
> STDOUT:
> STDERR: error: option `mirror' takes no value
> usage: git remote add [<options>] <name> <url>
>=20
>     -f, --fetch           fetch the remote branches
>     --tags                import all tags and associated objects when f=
etching
>                           or do not fetch any tag at all (--no-tags)
>     -t, --track <branch>  branch(es) to track
>     -m, --master <branch>
>                           master branch
>     --mirror              no separate remotes
>=20
>=20
> ERROR: Function failed: Fetcher failure for URL:
> 'git://git.yoctoproject.org/prelink-cross.git;protocol=3Dgit'. Unable t=
o
> fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/Superandy/tmp/oe-core-eglibc/work/x86_64-linux/prelink-native-1.0=
+git1+a2d8e30942bd4bc0a5c852b9d9d12f8684c4bb8d-r10/temp/log.do_fetch.2594=
0
> ERROR: Task 103
> (virtual:native:/home/Superandy/data/oe-core/sources/openembedded-core/=
meta/recipes-devtools/prelink/prelink_git.bb,
> do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 307 tasks of which 262 didn't need to
> be rerun and 1 failed.
>=20
> Any thoughts?

You have an incompatible version of git and git-native is in
ASSUME_PROVIDED. We should have detected this and built git-native in
this case. What version of git do you have?

Cheers,

Richard



