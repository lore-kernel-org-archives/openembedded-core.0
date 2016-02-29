Return-Path: <california.l.sullivan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD5E73D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 23:01:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 29 Feb 2016 15:01:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="57157470"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by fmsmga004.fm.intel.com with ESMTP; 29 Feb 2016 15:01:35 -0800
Received: from orsmsx103.amr.corp.intel.com ([169.254.5.227]) by
	ORSMSX108.amr.corp.intel.com ([169.254.2.27]) with mapi id
	14.03.0248.002; Mon, 29 Feb 2016 15:01:34 -0800
From: "Sullivan, California L" <california.l.sullivan@intel.com>
To: "Ashfield, Bruce (Wind River)" <bruce.ashfield@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [v2 PATCH 0/8] linux-yocto: consolidated pull request
Thread-Index: AQHRc0UirUxo/YEEk0uQb8ZwGot8MA==
Date: Mon, 29 Feb 2016 23:01:34 +0000
Message-ID: <48F3FC2919BF894DA92986D5D64EA12801A6424A@ORSMSX103.amr.corp.intel.com>
References: <cover.1456782981.git.bruce.ashfield@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.201.168]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [v2 PATCH 0/8] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 29 Feb 2016 23:01:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 02/29/2016 02:10 PM, Bruce Ashfield wrote:=0A=
> Hi all,=0A=
>=0A=
> v2: actually cc oe-core on the series.=0A=
>=0A=
> Here is the consolidated pull request for linux-yocto 4.1 and 4.4. Most o=
f the=0A=
> changes are updates to -stable for the kernels, and the others are update=
s for=0A=
> specific boards.=0A=
>=0A=
> I've been building and booting these for qemu*, but of course, more milea=
ge and=0A=
> combinations in the autobuilder is best.=0A=
>=0A=
> Some things to note:=0A=
>=0A=
>  - We have some refactored kernel configuration updates to the base/core =
policy=0A=
>    of the standard kernel, with a new "developer" kernel type being avail=
able,=0A=
>    leaving standard as a smaller variant. Existing board configs have bee=
n=0A=
>    flipped to use developer, so they'll see no change, leaving new board =
configs=0A=
>    to take advantage of the smaller, standard kernel type.=0A=
It looks like this change hasn't been integrated into the kernel cache yet.=
=0A=
=0A=
---=0A=
Cal Sullivan=0A=
=0A=
>=0A=
>  - The yocto reference BSPs haven't been updated yet, and we need to find=
=0A=
>    someone with the h/w to do the updates. These may just have to stay on=
=0A=
>    4.1 LTSI for this cycle.=0A=
>=0A=
>  - We are still seeing the 32 bit x86 X issue on the 4.4 kernel , with a =
splat on=0A=
>    boot up. I've tried to bisect this twice, leading to inconclusive resu=
lts, but=0A=
>    regardless, I need to march 4.4 onto the latest -stable, and we'll con=
tinue=0A=
>    looking into this issue in the M4 timeframe.=0A=
>=0A=
>  - There still seem to be some races in perf, and something is up with ss=
tate=0A=
>    and the kexec/kboot builds using meta-initramfs and linux-yocto-tiny-k=
execboot.=0A=
>    Now that these updates are out, I'll revisit them and hold any stable =
updates=0A=
>    (unless there are significant CVEs) in the M4 cycle.=0A=
>=0A=
> Cheers,=0A=
>=0A=
> Bruce=0A=
>=0A=
> The following changes since commit 4006a7f2762ccd5dcbc6cdff49482d4387a732=
61:=0A=
>=0A=
>   sanity: Fix int verses string reference (2016-02-28 22:54:09 +0000)=0A=
>=0A=
> are available in the git repository at:=0A=
>=0A=
>   git://git.pokylinux.org/poky-contrib zedd/kernel=0A=
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel=0A=
>=0A=
> Bruce Ashfield (8):=0A=
>   linux-yocto/4.1: Galileo updates=0A=
>   linux-yocto/4.1: clkdev updates=0A=
>   linux-yocto/4.1: update to 4.1.18=0A=
>   linux-yocto/4.4: yaffs2 build fixes=0A=
>   linux-yocto: braswell: Remove feature and move DRM_I915_PRELIMINARY_HW_=
SUPPORT option=0A=
>   linux-yocto/4.4: update to -stable 4.4.2=0A=
>   linux-yocto/4.1: iwlwifi: mvm: don't allow sched scans without matches =
to be started=0A=
>   linux-yocto/4.4: update to 4.4.3=0A=
>=0A=
>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---=0A=
>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---=0A=
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---=0A=
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---=0A=
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++-------=
---=0A=
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++-------=
---=0A=
>  6 files changed, 32 insertions(+), 32 deletions(-)=0A=
>=0A=
=0A=

