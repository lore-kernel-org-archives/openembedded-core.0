Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1ULaya-0002EG-SC; Fri, 29 Mar 2013 16:12:21 +0100
Received: by mail-da0-f51.google.com with SMTP id g27so245808dan.10
	for <multiple recipients>; Fri, 29 Mar 2013 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=iA/S+OmEHWkF/ORKIPa9s+EhogyMvWMP0iCouNwcJXk=;
	b=v1WQm7nAtGD1u6/mjGvlDd9sGUbqOOgWf84wnGNt5LYxSOyu5suhhVzXN2aWAG1Eoa
	NOVXRcbJGObeKe/MlQl1R+oFfOBXRVTUqHJz0vEoevaayPKgavcNpDzXirdmLDajfVot
	PyCuCsjKSfGmtHKGzT2PWm2wHYAGbDVxtG6+lZ9GKDyghiZCskZARsRLzqxfmy13BdTC
	WRrF6mOxnRU0QyrYmx2CQCpAEfEkmqaN1Hci3G0zuB+xfw71WHZ4vGHF7FRuHOYVLFfS
	p/16V6Qh5G8TfYb1GntnT6JIx0vbZP/ZVIUOFX2hLYJjIsAf0wvWQ/B+kPBPL4baSX+U
	iAgQ==
X-Received: by 10.66.13.74 with SMTP id f10mr4724789pac.146.1364568915859;
	Fri, 29 Mar 2013 07:55:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qh4sm3734090pac.8.2013.03.29.07.55.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 07:55:14 -0700 (PDT)
Date: Fri, 29 Mar 2013 15:55:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130329145514.GH11120@jama>
References: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6B577862-4C24-49DB-80F2-3A1408AF8337@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 4.8 recipes
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
X-List-Received-Date: Fri, 29 Mar 2013 15:12:21 -0000
X-Groupsio-MsgNum: 37232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TKYYegg/GYAC5JIZ"
Content-Disposition: inline

--TKYYegg/GYAC5JIZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2013 at 10:51:50PM -0700, Khem Raj wrote:
> All,
>=20
> I have added gcc 4.8 recipes and the branch is here=20
>=20
> git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.8
>=20
> cgit
>=20
> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-4=
=2E8
>=20
> Please test it out on your respective environments if you can.

First failed task in world rebuild:

| ar.c: In function 'do_oper_extract':
| ar.c:831:1: error: unrecognizable insn:
|  }
|  ^
| (insn 1893 1892 38 59 (parallel [
|             (set (reg:SI 3 r3)
|                 (mem/c:SI (reg:SI 3 r3) [21 S4 A32]))
|             (set (reg:SI 12 ip)
|                 (mem/c:SI (plus:SI (reg:SI 3 r3)
|                         (const_int 4 [0x4])) [21 S4 A32]))
|             (set (reg/f:SI 13 sp)
|                 (mem/c:SI (plus:SI (reg:SI 3 r3)
|                         (const_int 8 [0x8])) [23 %sfp+-272 S4 A32]))
|         ]) ar.c:639 -1
|      (expr_list:REG_ARGS_SIZE (const_int 0 [0])
|         (nil)))
| ar.c:831:1: internal compiler error: in extract_insn, at recog.c:2150
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te  -marm -mthumb-interwork   --s=
ysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qe=
muarm -std=3Dgnu99 -Wall -Wshadow -Werror -Wunused -Wextra -fgnu89-inline -=
Wformat=3D2   -O2 -pipe -g -feliminate-unused-debug-types -Wl,-rpath-link,.=
=2E/libelf:../libdw -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o elfcm=
p elfcmp.o ../libebl/libebl.a ../libelf/libelf.so  -ldl
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[2]: *** [ar.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| rm i386_ld.o
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/elfutils/0.148-r11/elfutils-0.148/s=
rc'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/elfutils/0.148-r11/elfutils-0.148'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/elfutils/0.148-r11/temp=
/log.do_compile.15119 for further information)
NOTE: recipe elfutils-0.148-r11: task do_compile: Failed
ERROR: Task 535 (/home/jenkins/oe/shr-core-branches/shr-core/openembedded-c=
ore/meta/recipes-devtools/elfutils/elfutils_0.148.bb, do_compile) failed wi=
th exit code '1'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TKYYegg/GYAC5JIZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFVq1IACgkQN1Ujt2V2gBxaZgCfXRLEZYkm225gm5QXyBzhOV9H
5m8AoKRnkuUUSvcRTIjV5JZPWZocR/k3
=KSAx
-----END PGP SIGNATURE-----

--TKYYegg/GYAC5JIZ--
