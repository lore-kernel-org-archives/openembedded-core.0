Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D9A0D605B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 10:08:34 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4CA8S4H013335; Mon, 12 May 2014 11:08:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6NZLhwzq_MCz; Mon, 12 May 2014 11:08:28 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4CA8PUK013330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 12 May 2014 11:08:26 +0100
Message-ID: <1399889298.31891.130.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Mon, 12 May 2014 11:08:18 +0100
In-Reply-To: <208DBEF5-0367-4F27-93BD-CBB4FC23FBF6@linaro.org>
References: <1399019818-4767-1-git-send-email-koen.kooi@linaro.org>
	<536BB2C0.60903@linux.intel.com>
	<7A042294-2122-4EA0-BE1F-68E0BB65512D@dominion.thruhere.net>
	<916F5AEB-85EC-4CE0-8771-79F7467D6A86@dominion.thruhere.net>
	<536C77D5.6040205@linux.intel.com>
	<6B7D9F99-5867-416B-9A97-426E3B495A52@dominion.thruhere.net>
	<51490BD6-0BCB-4422-9620-8D4FFAD3791F@dominion.thruhere.net>
	<1399630567.31891.84.camel@ted>
	<CAP0W-Rn5PU7NxYWCKZ59R_oqHDfkRt3xEayhzfhyP-1D6OVtjw@mail.gmail.com>
	<1399631039.31891.85.camel@ted>
	<CAP0W-R=dx1GNAfXkR-SDyB6JxYBYuiD7BSZ20KiB-UZQBmkrgw@mail.gmail.com>
	<208DBEF5-0367-4F27-93BD-CBB4FC23FBF6@linaro.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4] git: fix perl binding installation
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
X-List-Received-Date: Mon, 12 May 2014 10:08:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2014-05-12 at 10:15 +0200, Koen Kooi wrote:
> I removed all my patches, deleted everything including DL_DIR and sstate-=
cache and
>=20
> bitbake git-replacement-native
> bitbake linaro-image-minimal
>=20
> will fail with:
>=20
> [koen@thinkpad git]$ cat  /build/linaro/build/build/tmp-eglibc/work/x86_6=
4-linux/prelink-native/1.0+gitAUTOINC+6822ec76aa-r0/temp/log.do_unpack.1792=
5
> DEBUG: Executing python function do_unpack
> DEBUG: Executing python function base_do_unpack
> DEBUG: Running export PATH=3D"/build/linaro/build/openembedded-core/scrip=
ts/native-intercept:/build/linaro/build/openembedded-core/scripts:/build/li=
naro/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/x86_64-linux:/bui=
ld/linaro/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/build/linar=
o/build/build/tmp-eglibc/sysroots/x86_64-linux/usr/sbin:/build/linaro/build=
/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/build/linaro/build/build/t=
mp-eglibc/sysroots/x86_64-linux/sbin:/build/linaro/build/build/tmp-eglibc/s=
ysroots/x86_64-linux/bin:/build/linaro/build/openembedded-core/scripts:/bui=
ld/linaro/build/openembedded-core/bitbake/bin:/usr/lib64/qt-3.3/bin:/usr/li=
b64/ccache:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/koen/.lo=
cal/bin:/home/koen/bin:/home/koen/bin"; export HOME=3D"/home/koen"; git -c =
core.fsyncobjectfiles=3D0 clone -s -n /build/linaro/build/build/downloads/g=
it2/git.yoctoproject.org.prelink-cross.git/ /build/linaro/build/build/tmp-e=
glibc/work/x86_64-linux/prelink-native/1.0+gitAUTOINC+6822ec76aa-r0/git/
> DEBUG: Python function base_do_unpack finished
> DEBUG: Python function do_unpack finished
> ERROR: Function failed: Fetcher failure: Fetch command failed with exit c=
ode 128, output:
> Cloning into '/build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prel=
ink-native/1.0+gitAUTOINC+6822ec76aa-r0/git'...
> git-upload-pack: error while loading shared libraries: libcrypto.so.1.0.0=
: cannot open shared object file: No such file or directory
> fatal: Could not read from remote repository.
>=20
> Please make sure you have the correct access rights
> and the repository exists.
>=20
> So 'git-replacement-native' is broken without the git-perl patches anyway=
, I'm not going to look into that issue any longer.

Against my better judgement, I took a look at this and spotted a fix. If
you apply the patch I just sent out, it will most likely fix the
libcrypto issue you were seeing.

I shared it mainly as I'd hate to see anyone duplicate work and the
issue has implications for the buildtools tarball amongst other things.

Cheers,

Richard


