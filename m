Return-Path: <koen.kooi@linaro.org>
X-Greylist: delayed 448 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 08:22:45 UTC
Received: from mail-we0-f179.google.com (unknown [74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2536860167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 08:22:45 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id q59so6598480wes.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 01:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:content-transfer-encoding:message-id:references:to;
	bh=Cla+499ZnU9zDgbT8glnDCgPVSGQIxq3y39iqWbwtIQ=;
	b=nLYwZraSGMhVFwBEtUkCuwJDzgQxjjEkx18FAbzD0zsQ3pnn8U/48GWEbx90GaigBJ
	+dagvqwaSzDVTMEbYLK2W6Q2AzYkcrJxgpjfSDMvf43itD6EAuYaiZdcGjRZM03FZb7c
	kDCXGU7030vCYuAt7fDz6+0s4D0Kf6hB2pAmomyvjPNIvs3G9mDt1KPAuCwMIIqm0DDs
	clPtefZUN7B6MaRTw4uRB3hZ+/Iz5CsXgHZ8pMtLidBmtJI7xXmeyC4RtU1zPYREdbPT
	PV7K/NPaBZuWaefSpk0K88Owr1ra2u6gHxNm8WUC8jfckw8SceXlMtdTHB2mbmBOl815
	o3vw==
X-Gm-Message-State: ALoCoQkOBYmWP7HqepqMiKDgMxBpz9u4GepJZNC+VbLm7kb5JEtuenKK/50H8ubZPw69IT5GB6ks
X-Received: by 10.180.74.132 with SMTP id t4mr14306927wiv.30.1399882518381;
	Mon, 12 May 2014 01:15:18 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id gi8sm14722435wib.8.2014.05.12.01.15.16
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 May 2014 01:15:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen.kooi@linaro.org>
In-Reply-To: <CAP0W-R=dx1GNAfXkR-SDyB6JxYBYuiD7BSZ20KiB-UZQBmkrgw@mail.gmail.com>
Date: Mon, 12 May 2014 10:15:16 +0200
Message-Id: <208DBEF5-0367-4F27-93BD-CBB4FC23FBF6@linaro.org>
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
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1874)
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
X-List-Received-Date: Mon, 12 May 2014 08:22:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 9 mei 2014, om 12:53 heeft Koen Kooi <koen.kooi@linaro.org> het =
volgende geschreven:

> On 9 May 2014 12:23, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2014-05-09 at 12:19 +0200, Koen Kooi wrote:
> > On 9 May 2014 12:16, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >         On Fri, 2014-05-09 at 11:16 +0200, Koen Kooi wrote:
> >         > Op 9 mei 2014, om 10:50 heeft Koen Kooi
> >         <koen@dominion.thruhere.net> het volgende geschreven:
> >         > real    4m49.390s
> >         > user    8m30.627s
> >         > sys     1m37.368s
> >         >
> >         > Libcrypto does seem to be in sysroot:
> >         >
> >         > [koen@thinkpad build]$ find build/ -name
> >         "libcrypto.so.1.0.0"
> >         >
> >         =
build/tmp-eglibc/sysroots/x86_64-linux/lib/libcrypto.so.1.0.0
> >         >
> >         > I don't think this is due to my perl changes, though.
> >
> >
> >         With the native binaries, we encode relative paths to libdir
> >         into RPATH.
> >         I'm guessing but I think your "mv xxx" in do_install messes =
up
> >         the
> >         RPATHs in the binaries/libraries.
> >
> >         The fix is probably to make that only happen in target =
builds
> >         (${CLASS_OVERRIDE} =3D=3D "class-target" or something like =
that).
> >
> >         but like I said, I'm guessing.
> >
> >
> >
> >
> > It looks like the problem is that I don't have libcrypto in on my
> > host, only in sysroot, I can make it fail this way without the mv as
> > well :(
> >
>=20
> Floating dependency in the git recipe?
>=20
> git.inc:DEPENDS =3D "openssl curl zlib expat"
>=20
> And libcrypto is present in sysroot.

I removed all my patches, deleted everything including DL_DIR and =
sstate-cache and

bitbake git-replacement-native
bitbake linaro-image-minimal

will fail with:

[koen@thinkpad git]$ cat  =
/build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0+=
gitAUTOINC+6822ec76aa-r0/temp/log.do_unpack.17925
DEBUG: Executing python function do_unpack
DEBUG: Executing python function base_do_unpack
DEBUG: Running export =
PATH=3D"/build/linaro/build/openembedded-core/scripts/native-intercept:/bu=
ild/linaro/build/openembedded-core/scripts:/build/linaro/build/build/tmp-e=
glibc/sysroots/x86_64-linux/usr/bin/x86_64-linux:/build/linaro/build/build=
/tmp-eglibc/sysroots/x86_64-linux/usr/bin:/build/linaro/build/build/tmp-eg=
libc/sysroots/x86_64-linux/usr/sbin:/build/linaro/build/build/tmp-eglibc/s=
ysroots/x86_64-linux/usr/bin:/build/linaro/build/build/tmp-eglibc/sysroots=
/x86_64-linux/sbin:/build/linaro/build/build/tmp-eglibc/sysroots/x86_64-li=
nux/bin:/build/linaro/build/openembedded-core/scripts:/build/linaro/build/=
openembedded-core/bitbake/bin:/usr/lib64/qt-3.3/bin:/usr/lib64/ccache:/usr=
/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/koen/.local/bin:/home/=
koen/bin:/home/koen/bin"; export HOME=3D"/home/koen"; git -c =
core.fsyncobjectfiles=3D0 clone -s -n =
/build/linaro/build/build/downloads/git2/git.yoctoproject.org.prelink-cros=
s.git/ =
/build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0+=
gitAUTOINC+6822ec76aa-r0/git/
DEBUG: Python function base_do_unpack finished
DEBUG: Python function do_unpack finished
ERROR: Function failed: Fetcher failure: Fetch command failed with exit =
code 128, output:
Cloning into =
'/build/linaro/build/build/tmp-eglibc/work/x86_64-linux/prelink-native/1.0=
+gitAUTOINC+6822ec76aa-r0/git'...
git-upload-pack: error while loading shared libraries: =
libcrypto.so.1.0.0: cannot open shared object file: No such file or =
directory
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

So 'git-replacement-native' is broken without the git-perl patches =
anyway, I'm not going to look into that issue any longer.

--
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

