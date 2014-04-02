Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 630366FADD;
	Wed,  2 Apr 2014 17:07:20 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so953643wiv.3
	for <multiple recipients>; Wed, 02 Apr 2014 10:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=69NSoheidrO0vpkfmKatyr2QCYkspcS+KyVE2b6DrKA=;
	b=CNSxSKw35TEUFyi1M2mssvBI8ZOiuc5JqzLiuBIu8iCnK9BtKZEbtXmEAfPN0bogSX
	DUGXX3SB2QQgvkz2NdUpHxL2lwJGp6bVO/zFHqU3Rl1vyAjRg9qXKePKQuPVSoDFFy6Y
	HJcERlXHtjuVj6YvDoiu95KnA3xD8yZkA/5ZC/SIxw8rqIwRNBfSj2NUC1ZpcQwVc1qj
	iWEBUpEnTdkexoPe6EVJnZX2/ePp2Sr42vMjgO+mVSzxaP2iXuEOqlqqngqsJVThu9Tz
	YZ6dE0smub7VAP2LuPKTzYAHz/58P5NtFu/U5HoQ898ErfLlLTMJ1EDkca//AYrWqWOX
	CQRA==
X-Received: by 10.180.8.40 with SMTP id o8mr19128078wia.25.1396458441428;
	Wed, 02 Apr 2014 10:07:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id o5sm5808455eeg.8.2014.04.02.10.07.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Apr 2014 10:07:17 -0700 (PDT)
Date: Wed, 2 Apr 2014 19:07:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20140402170718.GC2132@jama>
References: <20140330090302.B0FBA50478@opal> <20140330113031.GF2428@jama>
	<53382C05.70506@windriver.com> <20140331215105.GI2425@jama>
MIME-Version: 1.0
In-Reply-To: <20140331215105.GI2425@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : linux-yocto/3.10: fix drm build failure
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
X-List-Received-Date: Wed, 02 Apr 2014 17:07:22 -0000
X-Groupsio-MsgNum: 52102
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jy6Sn24JjFx/iggw"
Content-Disposition: inline

--jy6Sn24JjFx/iggw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2014 at 11:51:05PM +0200, Martin Jansa wrote:
> > I can confirm that that is the right revision. I wonder what the fetcher
> > is doing, or is something in the infrastructure caching and older
> > revision ?
>=20
> Sorry for noise, it was after all our mirror not getting updates
> anymore, fetching it manually works.

I've noticed one more thing:

When fetch fails, the checkout in downloads/git2/git.yoctoproject.org.linux=
-yocto-3.14.git
is removed and then git cloned again:

This is what I did:

# check that checkout is there:
OE qemux86@ ~/build/oe-core $ ll downloads/git2/*linux-yocto-3.14*
-rw-r--r-- 1 bitbake bitbake    0 Apr  1 14:38 downloads/git2/git.yoctoproj=
ect.org.linux-yocto-3.14.git.done

downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git:
total 156
drwxr-xr-x   6 bitbake bitbake  4096 Apr  1 14:38 ./
drwxr-xr-x 210 bitbake bitbake 36864 Apr  2 17:29 ../
-rw-r--r--   1 bitbake bitbake 42799 Apr  1 14:38 FETCH_HEAD
-rw-r--r--   1 bitbake bitbake    23 Mar 29 21:18 HEAD
-rw-r--r--   1 bitbake bitbake   163 Apr  1 14:38 config
-rw-r--r--   1 bitbake bitbake    73 Mar 29 20:57 description
drwxr-xr-x   2 bitbake bitbake  4096 Mar 29 20:57 hooks/
drwxr-xr-x   2 bitbake bitbake  4096 Mar 29 20:57 info/
drwxr-xr-x   4 bitbake bitbake  4096 Mar 29 20:57 objects/
-rw-r--r--   1 bitbake bitbake 40375 Mar 29 21:18 packed-refs
drwxr-xr-x   4 bitbake bitbake  4096 Mar 29 20:57 refs/

# create backup just in case:
OE qemux86@ ~/build/oe-core $ cp -ra downloads/git2/git.yoctoproject.org.li=
nux-yocto-3.14.git downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git=
-backup=20

# put wrong SRCREV
OE qemux86@ ~/build/oe-core $ vi openembedded-core/meta/recipes-kernel/linu=
x/linux-yocto_3.14.bb

# try to build it:
OE qemux86@ ~/build/oe-core $ bitbake linux-yocto
NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqlite3,=
 IP: 127.0.0.1, PORT: 40335, PID: 8726
Loading cache: 100% |######################################################=
###################################################################| ETA:  =
00:00:00...
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL git://git.yoctoproject.org/linux-yocto-3.14.gi=
t;bareclone=3D1;branch=3Dstandard/common-pc/base,meta;name=3Dmachine,meta, =
attempting MIRRORS if available
Currently 2 running tasks (238 of 551):
0: linux-yocto-3.14+gitAUTOINC+fc8c30398d_0143c6ebb4-r0 do_fetch (pid 10446)
1: binutils-cross-2.24-r0 do_compile (pid 15509)
ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-eglibc/work/qemu=
x86-oe-linux/linux-yocto/3.14+gitAUTOINC+fc8c30398d_0143c6ebb4-r0/temp/log.=
do_fetch.10446                                                             =
                                                                           =
                Currently 1 running tasks (238 of 551):
NOTE: Tasks Summary: Attempted 239 tasks of which 67 didn't need to be reru=
n and 1 failed.
NOTE: Writing buildhistory
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /OE/build/oe-core/openembedded-core/meta/recipes-kernel/linux/linux-yocto=
_3.14.bb, do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

It was removed and then created again (this isn't good proof, but I was che=
cking while the build was
running and the directory was gone):

drwxr-xr-x 4 bitbake bitbake 4096 Apr  2 18:56 downloads/git2/git.yoctoproj=
ect.org.linux-yocto-3.14.git
drwxr-xr-x 6 bitbake bitbake 4096 Apr  1 14:38 downloads/git2/git.yoctoproj=
ect.org.linux-yocto-3.14.git-backup

It's because fetcher is calling clean() before trying the MIRRORS, but I th=
ink in this special case it's
a bit sad, because for very big repos the first thing I want to do is "git =
branch -a --contains $SRCREV"
in downloads/git2/repo and it's already gone

It can also increase the load we create on git servers, but I don't know if=
 we can correctly recover from
old kinds of fetcher issues without actually doing the clean(). E.g. if it =
failed because of wrong permissions
on some directory...

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jy6Sn24JjFx/iggw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM8Q8YACgkQN1Ujt2V2gBx0iACeO8riVk8A9bVmjoqBuMwu0olV
PasAoLR97A/IOar6jg0BEFbrK5mx9dOX
=xhHc
-----END PGP SIGNATURE-----

--jy6Sn24JjFx/iggw--
