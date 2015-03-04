Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 73F897378D;
	Wed,  4 Mar 2015 12:58:12 +0000 (UTC)
Received: by wggz12 with SMTP id z12so46574774wgg.2;
	Wed, 04 Mar 2015 04:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VoGwNVeWrjFaW/WoaYQFR86BHDrkzxNgWSKWEeCNUeQ=;
	b=TFOYBSLvPVowqEXbOgNBkD71ejbVklTj1mQ7DNLoDPFTBoJuUmXu/DXVChdWkIhMM+
	d2/0Xx50x2QKPD9Fmd6lFLUlwNV0mhFlUX39+5RCn2JX85lfRX77G5LnX+fy9jShYrQL
	jLjG1YvbHOXbI9V96xbHfyG/dbkH8tf2m3TpHW9gW8A+6Z0ssT6FqYrdJuT4hFTSNoET
	7U5qtUOdWhCPTR5RUzJ5BbGCZTqnCMaMtP8A11dcSBoQwTFXey+2pAbhRdWX9M0IezDf
	P5blLADBMixcGEJAVemNtepsLqiqevxwtF9sdufCQ67rByu3BXyEc9wr97/F7usEZIlW
	1RSw==
X-Received: by 10.194.120.230 with SMTP id lf6mr7860222wjb.78.1425473892963;
	Wed, 04 Mar 2015 04:58:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v5sm3811630wiw.24.2015.03.04.04.58.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 04:58:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Mar 2015 13:58:15 +0100
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20150304125815.GI2337@jama>
References: <20150302220550.8A2F450367@opal.openembedded.org>
	<20150304022312.GF2337@jama> <54F67EBD.4060609@windriver.com>
MIME-Version: 1.0
In-Reply-To: <54F67EBD.4060609@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: improve patch application performance
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
X-List-Received-Date: Wed, 04 Mar 2015 12:58:14 -0000
X-Groupsio-MsgNum: 62945
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="54ZiyWcDhi/7bWb8"
Content-Disposition: inline

--54ZiyWcDhi/7bWb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2015 at 10:40:45PM -0500, Bruce Ashfield wrote:
> On 2015-03-03 9:23 PM, Martin Jansa wrote:
> > On Mon, Mar 02, 2015 at 10:05:50PM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 148c78e0f5de2689de3ad9beaa9f6de618d87758
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D148c78e0f5de2689de3ad9beaa9f6de618d87758
> >>
> >> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> Date:   Mon Mar  2 16:36:41 2015 -0500
> >>
> >> kern-tools: improve patch application performance
> >>
> >> Update the SRCREV for the following incremental improvement in patch
> >> processing time:
> >>
> >>      kgit-meta: skip patches on non-leaf nodes
> >>
> >>      In a similar way as commit 0768d697 [kgit-meta: dont run kgit-s2q
> >>      for
> >>      non-leaf nodes], we can save even more processing time by not even
> >>      analysing and linking patches if we aren't on the leaf node of the
> >>      tree.
> >>
> >>      This early exit can save nearly 95% of the time required to "patc=
h"
> >>      a tree when no changes are actually applied.
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Not sure if it's related to this, but today's world build is failing
> > with:
> >
>=20
> No luck here. I was able to do a clean build of qemux86 against the 3.19
> kernel.
>=20
> I'll keep trying, but am looking for a reproducer at this point.
>=20
> Bruce
>=20
> > ERROR: Function failed: do_kernel_configme (log file is located at /hom=
e/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.1=
9+gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.29401)
> > ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tm=
p-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9ec=
ed9b-r0/temp/log.do_kernel_configme.29401
> > Log data follows:
> > | DEBUG: Executing shell function do_kernel_configme
> > | NOTE: kernel configme
> > | [INFO] Configuring target/machine combo: "standard/qemux86"
> > | [INFO] collecting configs in .meta/meta-series
> > | mv: cannot move `/home/jenkins/oe/world/shr-core/tmp-glibc/work/qemux=
86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/linux-qemu=
x86-standard-build/.tmp.config.PKIfLNkSVj' to `.meta/cfg/standard/common-pc=
/qemux86-standard-config-3.19': No such file or directory
> > | creation of pre-processed config data failed
> > | config of "standard/qemux86" failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_kernel_configme (log file is located at /h=
ome/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3=
=2E19+gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.29401)
> > NOTE: recipe linux-yocto-3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0: task=
 do_kernel_configme: Failed
> > ERROR: Task 30091 (/home/jenkins/oe/world/shr-core/openembedded-core/me=
ta/recipes-kernel/linux/linux-yocto_3.19.bb, do_kernel_configme) failed wit=
h exit code '1'
> >

And another one from restarted qemux86 build:

ERROR: Function failed: do_kernel_configme (log file is located at /home/je=
nkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+gi=
tAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.22612)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/qemux86-oe-linux/linux-yocto/3.19+gitAUTOINC+f7a81274b4_43b9eced9b=
-r0/temp/log.do_kernel_configme.22612
Log data follows:
| DEBUG: Executing shell function do_kernel_configme
| NOTE: kernel configme
| [INFO] Configuring target/machine combo: "standard/qemux86"
| [INFO] collecting configs in .meta/meta-series
| ERROR: could not sanitize configuration fragments
|    errors are logged in /home/jenkins/oe/world/shr-core/tmp-glibc/work-sh=
ared/qemux86/kernel-source/.meta/cfg/standard/common-pc/config.log
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_kernel_configme (log file is located at /home/=
jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19+=
gitAUTOINC+f7a81274b4_43b9eced9b-r0/temp/log.do_kernel_configme.22612)
NOTE: recipe linux-yocto-3.19+gitAUTOINC+f7a81274b4_43b9eced9b-r0: task do_=
kernel_configme: Failed

I understand that these error logs aren't very helpful, but the tmpfs is al=
ready gone.

All I can say was that I wasn't seeing these issues until yesterday.

> >>
> >> ---
> >>
> >>   meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b=
/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> index 80d26f9..131c5e9 100644
> >> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> >> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;beginline=
=3D5;endline=3D9;md5=3Dd8d1d729a70c
> >>
> >>   DEPENDS =3D "git-native"
> >>
> >> -SRCREV =3D "cab17f884998b43692244a863dea6f505c7f67af"
> >> +SRCREV =3D "0c51a3d02fa54726141f32824b11d0676960e0a5"
> >>   PR =3D "r12"
> >>   PV =3D "0.2+git${SRCPV}"
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--54ZiyWcDhi/7bWb8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT3AWcACgkQN1Ujt2V2gBzz5gCeN8JT0MBJMNW2lP0L2H0VNmkP
xyEAniRFDxLbd72pDvv3jQ5CQE+mClnL
=pqDx
-----END PGP SIGNATURE-----

--54ZiyWcDhi/7bWb8--
