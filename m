Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 29EEC71633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 16:00:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 24 Feb 2015 07:52:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,639,1418112000"; d="scan'208";a="670861965"
Received: from aryan3-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.21.162])
	by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2015 08:00:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Beth Flanagan <elizabeth.flanagan@intel.com>
Date: Tue, 24 Feb 2015 16:00:11 +0000
Message-ID: <2739283.cBzxHPFgeW@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.7-100.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
References: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] license_class: Added support for LICENSE_PRIORITY in manifest creation
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
X-List-Received-Date: Tue, 24 Feb 2015 16:00:27 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Beth,

I know you're looking at rewriting some of license.bbclass in python - =
FYI=20
here's an as-yet unmerged patchset from An=EDbal that may contain some =
of that=20
already:

On Wednesday 29 October 2014 12:34:12 An=EDbal Lim=F3n wrote:
> Now you can specify LICENSE_PRIOTIY that enables the distro to set th=
e
> license preferences for manifest creation.
>=20
> The major change is when you have OR'ed LICENSE only one is choose ac=
cording
> LICENSE_PRIORITY preferences if LICENSE_PRIORITY isn't specified the =
left
> one is choosen.
>=20
> The test was done building qemux86/core-image-sato with and without t=
hese
> set of patches and then run diff recursive under common-licenses crea=
ted
> directory.
>=20
> You can find a tarball with common-license directories, resulted diff=
 and
> local.conf at:
>=20
> https://bugzilla.yoctoproject.org/attachment.cgi?id=3D2223
>=20
> An=EDbal Lim=F3n (4):
>   license_class: Reimplemented manifest creation in python
>   license_class: Added support for INCOMPATIBLE_LICENSE into
>     license_create_manifest
>   license_class: Added LICENSE_PRIORITY support
>   license_class: Fix remove + trim in license_create_manifest.
>=20
>  meta/classes/license.bbclass | 250
> ++++++++++++++++++++++++++++--------------- meta/conf/documentation.c=
onf |=20
>  1 +
>  2 files changed, 164 insertions(+), 87 deletions(-)



--=20

Paul Eggleton
Intel Open Source Technology Centre

