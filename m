Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id C73FA731D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 00:13:29 +0000 (UTC)
Received: from [IPv6:fda8:8b75:6fa6:1000:ed68:3bf2:bca8:2a0a] (192.168.15.34)
	by smtp.enea.com (172.21.1.208) with Microsoft SMTP Server id
	14.3.224.2; Wed, 6 Jan 2016 01:13:26 +0100
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1451932157-3190-1-git-send-email-anibal.limon@linux.intel.com>
From: Tudor Florea <tudor.florea@enea.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <568C5C24.5060601@enea.com>
Date: Wed, 6 Jan 2016 02:13:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1451932157-3190-1-git-send-email-anibal.limon@linux.intel.com>
X-Originating-IP: [192.168.15.34]
Cc: paul.eggleton@linux.intel.com, poky@yoctoproject.org,
	benjamin.esquivel@intel.com, georgex.l.musat@intel.com
Subject: Re: [PATCH v3 0/3] ptest-runner 2.0
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
X-List-Received-Date: Wed, 06 Jan 2016 00:13:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Anibal,
Please see my comments inline.
Regards,
  Tudor.

On 04/01/2016 20:29, An=C3=ADbal Lim=C3=B3n wrote:
> The whole set is sent to two ML for reviewing purposes the first
> two patches are for oe-core and the last one for poky.
>=20
> The first two commits (oe-core) adds a new ptest-runner written in
> python the sh one is conserved to use in tiny systems.
>=20
> What's new in ptest runner:
>=20
> - Monitor/timeout stdout, stderr of the test suite to avoid block
> indefinetly.
This is definitely something useful.
> - Add option for change ptest root directory. - Add option for list
> available tests. - Add option for only run certain tests.
>=20
> The last commit (meta-yocto) sets ptest-runner to 1.0 in poky-tiny
> systems due to python dependency.
I think adding python dependency is a shift in a wrong direction for
for ptest-runner. The assumption that most embedded devices (tiny or
not) have python might not be correct.
The alternative of using the old version of ptest-runner only
complicate things.
I do think this kind of work is really useful but this should be done
into a testing framework that runs outside of the DUT.
>=20
> The changes are available in the git repository at:
>=20
> git://git.yoctoproject.org/poky-contrib alimon/ptest-runner=20
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dalimon/ptest-r=
unner
>
>  An=C3=ADbal Lim=C3=B3n (3): ptest-runner: Add version 2.0 re-implementat=
ion
> in python. ptest-runner: Add a recipe for install ptest-runner
> 2.0. conf/distro/poky-tiny.conf: Add default install of
> ptest-runner 1.0
>=20
> meta-yocto/conf/distro/poky-tiny.conf              |   4 +=20
> .../ptest-runner/files/ptest-runner_2.0.py         | 162
> +++++++++++++++++++++ .../ptest-runner/ptest-runner_2.0.bb
> |  27 ++++ 3 files changed, 193 insertions(+) create mode 100755
> meta/recipes-support/ptest-runner/files/ptest-runner_2.0.py create
> mode 100644 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
>=20

